return {
    ["catppuccin/nvim"] = {},
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
