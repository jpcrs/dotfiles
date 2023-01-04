#include "cpu.h"
#include "sketchybar.h"
#include "wattage.h"

struct cpu g_cpu;
struct wattage g_wattage;

void handler(env env) {
  char* name = env_get_value_for_key(env, "NAME");
  char* sender = env_get_value_for_key(env, "SENDER");
  char* info = env_get_value_for_key(env, "INFO");
  char* selected = env_get_value_for_key(env, "SELECTED");

  if ((strcmp(sender, "routine") == 0)
            || (strcmp(sender, "forced") == 0)) {

    cpu_update(&g_cpu);
    wattage_update(&g_wattage);

    if (strlen(g_cpu.command) > 0) sketchybar(g_cpu.command);
    if (strlen(g_wattage.command) > 0) sketchybar(g_wattage.command);
  }
}

int main (int argc, char** argv) {
  cpu_init(&g_cpu);
  wattage_init(&g_wattage);

  if (argc < 2) {
    printf("Usage: provider \"<bootstrap name>\"\n");
    exit(1);
  }

  event_server_begin(handler, argv[1]);
  return 0;
}