require"neotest".setup {
    adapters = {
        require("neotest-python")({
            runner = "pytest",
            dap = {justMyCode = false},
            args = {"--log-level", "INFO"}
        })
    }
}
