-- TO ADD A DEBUGER FOR A LANGUAGE YOU HAVE TO GO TO THIS WIKI — https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
-- CHOOSE A LANGUAGE AND GO ACCORDING TO A GUIDE
-- YOU MAY HAVE TO ADD DEPENDENCIES AND DON'T FORGET TO REQUIRE THEM IN CONFIG = FUNCTION()
return {
    {
        "nvim-neotest/nvim-nio",
    },
    {
        "theHamsta/nvim-dap-virtual-text",
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            require("dapui").setup()

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            dap.adapters.lldb = {
                type = "executable",
                command = "/opt/homebrew/opt/llvm/bin/lldb-dap",
                -- args = { "-i", "dap" },
                name = "lldb",
            }

            dap.configurations.cpp = {
                {
                    name = "Launch",
                    type = "lldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = {},

                    -- 💀
                    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
                    --
                    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
                    --
                    -- Otherwise you might get the following error:
                    --
                    --    Error on launch: Failed to attach to the target process
                    --
                    -- But you should be aware of the implications:
                    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
                    -- runInTerminal = false,
                },
            }

            dap.configurations.c = dap.configurations.cpp
            dap.configurations.rust = dap.configurations.cpp

            vim.keymap.set("n", "<leader>dt", require("dap").toggle_breakpoint, {})
            vim.keymap.set("n", "<leader>dc", require("dap").continue, {})
        end,
    },
}
