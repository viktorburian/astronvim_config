return {
    { "p00f/clangd_extensions.nvim",
        ft = { "c", "cpp" },
        opts = function() return { server = require("astronvim.utils.lsp").config "clangd" } end,
    },
    { "simrat39/rust-tools.nvim",
        ft = { "rust" },
        opts = function() return { server = require("astronvim.utils.lsp").config "rust_analyzer" } end,
    },
}
