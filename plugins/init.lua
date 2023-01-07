return {
    ["karb94/neoscroll.nvim"] = {
        config = function() require('neoscroll').setup() end,
    },
    ["simrat39/rust-tools.nvim"] = {
        after = "mason-lspconfig.nvim", -- make sure to load after mason-lspconfig
        config = function()
          require("rust-tools").setup {
            server = astronvim.lsp.server_settings "rust_analyzer", -- get the server settings and built in capabilities/on_attach
          }
        end,
    },
    ["p00f/clangd_extensions.nvim"] = {
        after = "mason-lspconfig.nvim", -- make sure to load after mason-lspconfig
        config = function()
          require("clangd_extensions").setup {
            server = astronvim.lsp.server_settings "clangd", -- get the server settings and built in capabilities/on_attach
          }
        end,
    },
    ["theHamsta/nvim-dap-virtual-text"] = {
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
    ["nvim-telescope/telescope-dap.nvim"] = {},
    ["rcarriga/nvim-dap-ui"] = {
        config = function()
            local dapui = require "dapui"
            dapui.setup {
                icons = { expanded = "", collapsed = "▸", current_frame = "▸" },
            }
        local dap = require "dap"
        dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
        dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
        end,
    },
}
