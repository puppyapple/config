local dap = require "dap"
dap.adapters.python = {
    type = "executable",
    command = "/home/puppyapple/anaconda3/bin/python",
    args = {"-m", "debugpy.adapter"}
}
dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = "python3"
    }
}
