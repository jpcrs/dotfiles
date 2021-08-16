local pid = vim.fn.getpid()
local omnisharp_bin = "/home/jpcrs/bin/omnisharp"

return {
	settings = {
        cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
	},
}
