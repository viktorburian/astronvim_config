-- set vim options here (vim.<first_key>.<second_key> = value)
return {
    opt = {
        -- set to true or false etc.
        relativenumber = false, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
        cmdheight = 1,
        tabstop = 4,
        shiftwidth = 4,
        scrolloff = 1,
        autoindent = true,
        smartindent = true,
        colorcolumn = "100",
        foldcolumn = "0",
        foldmethod = "indent",
        foldlevel = 99,
        list = true,
        listchars = {
            tab = ">-"
        },
    },
    g = {
        mapleader = " ", -- sets vim.g.mapleader
        autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
        cmp_enabled = true, -- enable completion at start
        autopairs_enabled = true, -- enable autopairs at start
        diagnostics_enabled = true, -- enable diagnostics at start
        status_diagnostics_enabled = true, -- enable diagnostics in statusline
        icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
        ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    },
}