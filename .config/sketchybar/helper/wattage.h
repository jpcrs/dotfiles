// Build with: gcc psudata.cc -o psudata -framework IOKit
#include <stdio.h>
#include <string.h>
#include <IOKit/IOKitLib.h>

struct wattage {
  char command[256];
};

typedef struct {
  uint32_t key;
  char ignored[24];
  uint32_t size;
  char ignored2[10];
  char cmd;
  char ignored3[5];
  float val;
  char ignored4[28];
} smc_t;

static inline void wattage_init(struct wattage* wattage) {
  snprintf(wattage->command, 100, "");
}

float get_value(io_connect_t * ioc, uint32_t key) {
  smc_t req, resp;
  size_t sz = sizeof(resp);

  memset(&req, 0, sizeof(smc_t));
  memset(&resp, 0, sizeof(smc_t));
  req.cmd = 5;
  req.size = 4;
  req.key = key;
  IOConnectCallStructMethod(*ioc, 2, &req, sizeof(req), &resp, &sz);
  return resp.val;
}

static inline void wattage_update(struct wattage* wattage) {
  mach_port_t mp;
  CFMutableDictionaryRef d;
  io_iterator_t it;
  io_object_t svc;
  io_connect_t ioc;
  float system_total;

  IOMasterPort(MACH_PORT_NULL, &mp);
  d = IOServiceMatching("AppleSMC");
  IOServiceGetMatchingServices(mp, d, &it);
  svc = IOIteratorNext(it);
  IOObjectRelease(it);
  IOServiceOpen(svc, mach_task_self(), 0, &ioc);
  IOObjectRelease(svc);

  system_total = get_value(&ioc, ('P' << 24) + ('S' << 16) + ('T' << 8) + 'R');

  IOServiceClose(ioc);

  snprintf(wattage->command, 256, "--set wattage label=\"%.2fW\"", system_total);
}