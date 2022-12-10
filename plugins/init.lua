return {
    { "karb94/neoscroll.nvim",
      config = function ()
        require('neoscroll').setup()
      end},
    { "simrat39/rust-tools.nvim",
      after = { "mason-lspconfig.nvim" },
      -- Is configured via the server_registration_override installed below!
      config = function()
        require("rust-tools").setup {
          server = astronvim.lsp.server_settings "rust_analyzer",
          tools = {
            inlay_hints = {
              parameter_hints_prefix = "  ",
              other_hints_prefix = "  ",
            },
          },
        }
      end,
    },
    { "mfussenegger/nvim-dap",
      config = function()
        -- Debug configuration
        local dap = require('dap')
        dap.adapters.lldb = {
          type = 'executable',
          command = '/usr/local/opt/llvm/bin/lldb-vscode',
          name = 'lldb'
        }
        dap.configurations.cpp = {
          {
            name = 'Launch',
            type = 'lldb',
            request = 'launch',
            program = function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
            args = {},
          },
        }
        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp

        -- DAP mappings:
        local map = vim.api.nvim_set_keymap
        map("n", "<f5>", ":lua require('dap').continue()<cr>", { desc = "Continue" })
        map("n", "<f10>", ":lua require('dap').step_over()<cr>", { desc = "Step over" })
        map("n", "<f11>", ":lua require('dap').step_into()<cr>", { desc = "Step into" })
        map("n", "<f12>", ":lua require('dap').step_out()<cr>", { desc = "Step out" })
        map("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<cr>", { desc = "Toggle breakpoint" })
        map("n", "<leader>dx", ":lua require('dap').clear_breakpoints()<cr>", { desc = "Clear breakpoints" })
        map(
          "n",
          "<leader>dc",
          ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
          { desc = "Set conditional breakpoint" }
        )
        map(
          "n",
          "<leader>dl",
          ":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Logpoint message: '))<cr>",
          { desc = "Set logpoint" }
        )
        map("n", "<leader>dr", ":lua require('dap').repl.open()<cr>", { desc = "Open REPL" })
        map("n", "<leader>dR", ":lua require('dap').run_last()<cr>", { desc = "Run last debugged program" })
        map("n", "<leader>dp", ":lua require('dap.utils').pick_process()<cr>", { desc = "Attach to process" })
        map("n", "<leader>dX", ":lua require('dap').terminate()<cr>", { desc = "Terminate program being debugged" })
        map("n", "<leader>du", ":lua require('dap').up()<cr>", { desc = "Up one frame" })
        map("n", "<leader>dd", ":lua require('dap').down()<cr>", { desc = "Down one frame" })
        map("n", "<leader>de", ":lua require('dapui').eval()<cr>", { desc = "Evaluate expression" })
      end},
    { "rcarriga/nvim-dap-ui",
      requires = { "nvim-dap", "rust-tools.nvim" },
      config = function()
        local dapui = require "dapui"
        dapui.setup {icons = { expanded = "", collapsed = "▸", current_frame = "▸" },}

        local dap = require "dap"
        dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
        dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      end,
    },
    {
        "mfussenegger/nvim-dap-python",
        config = function ()
            local dap = require('dap')
            dap.adapters.python = {
              type = 'executable';
              command = '/Users/viktor/.venv/nvim-lsp/bin/python';
              args = { '-m', 'debugpy.adapter' };
            }
            dap.configurations.python = {
              {
                type = 'python';
                request = 'launch';
                name = "Launch file";
                program = "${file}";
                pythonPath = function()
                  return '/usr/local/bin/python3'
                end;
              },
            }
        end,
    },
    { "theHamsta/nvim-dap-virtual-text",
      config = function ()
        require('nvim-dap-virtual-text').setup{
          enabled = true,                        -- enable this plugin (the default)
          enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
          highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
          highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
          show_stop_reason = true,               -- show stop reason when stopped for exceptions
          commented = false,                     -- prefix virtual text with comment string
          only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
          all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
          filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
          -- experimental features:
          virt_text_pos = 'eol',                 -- position of virtual text, see `:h nvim_buf_set_extmark()`
          all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
          virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
          virt_text_win_col = 40                 -- position the virtual text at a fixed window column (starting from the first text column) ,
                                                 -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
        }
      end},
      { "nvim-telescope/telescope-dap.nvim" },
}
