--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {

        -- Configure AstroNvim updates
        updater = {
                remote = "origin", -- remote to use
                channel = "stable", -- "stable" or "nightly"
                version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
                branch = "main", -- branch name (NIGHTLY ONLY)
                commit = nil, -- commit hash (NIGHTLY ONLY)
                pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
                skip_prompts = false, -- skip prompts about breaking changes
                show_changelog = true, -- show the changelog after performing an update
                auto_reload = false, -- automatically reload and sync packer after a successful update
                auto_quit = true, -- automatically quit the current session after a successful update
                -- remotes = { -- easily add new remotes to track
                --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
                --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
                --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
                -- },
        },

        -- Set colorscheme to use
        -- colorscheme = "default_theme",
        colorscheme = "catppuccin-mocha",

        -- Add highlight groups in any theme
        highlights = {
                -- init = { -- this table overrides highlights in all themes
                --   Normal = { bg = "#000000" },
                -- }
                -- duskfox = { -- a table of overrides/changes to the duskfox theme
                --   Normal = { bg = "#000000" },
                -- },
        },

        -- set vim options here (vim.<first_key>.<second_key> = value)
        options = {
                opt = {
                        -- set to true or false etc.
                        relativenumber = false, -- sets vim.opt.relativenumber
                        number = true, -- sets vim.opt.number
                        spell = false, -- sets vim.opt.spell
                        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
                        wrap = false, -- sets vim.opt.wrap
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
        },
        -- If you need more control, you can use the function()...end notation
        -- options = function(local_vim)
        --         local_vim.opt.relativenumber = false
        --         local_vim.opt.number = true
        --         local_vim.opt.spell = false
        --         local_vim.opt.signcolumn = "auto"
        --         local_vim.opt.wrap = false
        --         local_vim.opt.scrolloff = 1
        --         local_vim.g.mapleader = " "
        --
        --         return local_vim
        -- end,

        -- Set dashboard header
        header = {
                " █████  ███████ ████████ ██████   ██████",
                "██   ██ ██         ██    ██   ██ ██    ██",
                "███████ ███████    ██    ██████  ██    ██",
                "██   ██      ██    ██    ██   ██ ██    ██",
                "██   ██ ███████    ██    ██   ██  ██████",
                " ",
                "    ███    ██ ██    ██ ██ ███    ███",
                "    ████   ██ ██    ██ ██ ████  ████",
                "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
                "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
                "    ██   ████   ████   ██ ██      ██",
        },

        -- Default theme configuration
        default_theme = {
                -- Modify the color palette for the default theme
                colors = {
                        fg = "#abb2bf",
                        bg = "#1e222a",
                },
                highlights = function(hl) -- or a function that returns a new table of colors to set
                        local C = require "default_theme.colors"

                        hl.Normal = { fg = C.fg, bg = C.bg }

                        -- New approach instead of diagnostic_style
                        hl.DiagnosticError.italic = true
                        hl.DiagnosticHint.italic = true
                        hl.DiagnosticInfo.italic = true
                        hl.DiagnosticWarn.italic = true

                        return hl
                end,
                -- enable or disable highlighting for extra plugins
                plugins = {
                        aerial = true,
                        beacon = false,
                        bufferline = true,
                        cmp = true,
                        dashboard = true,
                        highlighturl = true,
                        hop = false,
                        indent_blankline = true,
                        lightspeed = false,
                        ["neo-tree"] = true,
                        notify = true,
                        ["nvim-tree"] = false,
                        ["nvim-web-devicons"] = true,
                        rainbow = true,
                        symbols_outline = false,
                        telescope = true,
                        treesitter = true,
                        vimwiki = false,
                        ["which-key"] = true,
                },
        },

        -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
        diagnostics = {
                virtual_text = false,
                underline = true,
        },

        -- Extend LSP configuration
        lsp = {
                skip_setup = { "rust_analyzer", "clangd" },
                -- enable servers that you already have installed without mason
                servers = {
                        "pyright"
                },
                formatting = {
                        -- control auto formatting on save
                        format_on_save = {
                                enabled = false, -- enable or disable format on save globally
                                allow_filetypes = { -- enable format on save for specified filetypes only
                                        -- "go",
                                },
                                ignore_filetypes = { -- disable format on save for specified filetypes
                                        -- "python",
                                },
                        },
                        disabled = { -- disable formatting capabilities for the listed language servers
                                -- "sumneko_lua",
                        },
                        timeout_ms = 1000, -- default format timeout
                        -- filter = function(client) -- fully override the default formatting function
                        --   return true
                        -- end
                },
                -- easily add or disable built in mappings added during LSP attaching
                mappings = {
                        n = {
                                -- ["<leader>lf"] = false -- disable formatting keymap
                        },
                },
                -- add to the global LSP on_attach function
                -- on_attach = function(client, bufnr)
                -- end,

                -- override the mason server-registration function
                -- server_registration = function(server, opts)
                --   require("lspconfig")[server].setup(opts)
                -- end,

                -- Add overrides for LSP server settings, the keys are the name of the server
                ["server-settings"] = {
                        clangd = {
                                capabilities = {
                                        offsetEncoding = "utf-8",
                                },
                        },
                },
                ["mason-lspconfig"] = {
                        ensure_installed = { "rust_analyzer", "clangd", "pyright" },
                },
        },

        -- Mapping data with "desc" stored directly by vim.keymap.set().
        --
        -- Please use this mappings table to set keyboard mapping since this is the
        -- lower level configuration and more robust one. (which-key will
        -- automatically pick-up stored data by this setting.)
        mappings = {
                -- first key is the mode
                n = {
                        -- second key is the lefthand side of the map
                        -- mappings seen under group name "Buffer"
                        ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
                        ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
                        ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
                        ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
                        -- DAP mappings:
                        ["<F5>"] = { function() require('dap').continue() end, desc = "Continue" },
                        ["<F10>"] = { function() require('dap').step_over() end, desc = "Step over" },
                        ["<F11>"] = { function() require('dap').step_into() end, desc = "Step into" },
                        ["<leader>db"] = { function() require('dap').toggle_breakpoint() end, desc = "Toggle breakpoint" },
                        ["<leader>dx"] = { function() require('dap').clear_breakpoints() end, desc = "Clear breakpoints" },
                        ["<leader>dc"] = { function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Set conditional breakpoint" },
                        ["<leader>dl"] = { function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Logpoint message: ')) end, desc = "Set logpoint" },
                        ["<leader>dr"] = { function() require('dap').repl.open() end, desc = "Open REPL" },
                        ["<leader>dR"] = { function() require('dap').run_last() end, desc = "Run last debugged program" },
                        ["<leader>dp"] = { function() require('dap.utils').pick_process() end, desc = "Attach to process" },
                        ["<leader>dX"] = { function() require('dap').terminate() end, desc = "Terminate program being debugged" },
                        ["<leader>du"] = { function() require('dap').up() end, desc = "Up one frame" },
                        ["<leader>dd"] = { function() require('dap').down() end, desc = "Down one frame" },
                        ["<leader>de"] = { function() require('dapui').eval() end, desc = "Evaluate expression" },
                        -- quick save
                        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
                },
                t = {
                        -- setting a mapping to false will disable it
                        -- ["<esc>"] = false,
                },
        },
        -- Configure plugins
        plugins = {
                heirline = function(config)
                        -- the first element of the default configuration table is the statusline
                        config[1] = {
                                -- set the fg/bg of the statusline
                                hl = { fg = "fg", bg = "bg" },
                                -- when adding the mode component, enable the mode text with padding to the left/right of it
                                astronvim.status.component.mode { mode_text = { padding = { left = 1, right = 1 } } },
                                -- add all the other components for the statusline
                                astronvim.status.component.file_info(
                                        astronvim.is_available "bufferline.nvim" and
                                        { filetype = {}, filename = false, file_modified = false } or nil
                                ),
                                astronvim.status.component.git_branch(),
                                astronvim.status.component.git_diff(),
                                astronvim.status.component.diagnostics(),
                                astronvim.status.component.fill(),
                                astronvim.status.component.macro_recording(),
                                astronvim.status.component.fill(),
                                astronvim.status.component.nav { scrollbar = false, },
                                astronvim.status.component.lsp(),
                                astronvim.status.component.treesitter(),
                        }
                        -- return the final configuration table
                        return config
                end,
                init = {
                        -- You can disable default plugins as follows:
                        -- ["goolord/alpha-nvim"] = { disable = true },

                        -- You can also add new plugins here as well:
                        -- Add plugins, the packer syntax without the "use"
                        -- { "andweeb/presence.nvim" },
                        -- {
                        --   "ray-x/lsp_signature.nvim",
                        --   event = "BufRead",
                        --   config = function()
                        --     require("lsp_signature").setup()
                        --   end,
                        -- },

                        -- We also support a key value style plugin definition similar to NvChad:
                        -- ["ray-x/lsp_signature.nvim"] = {
                        --   event = "BufRead",
                        --   config = function()
                        --     require("lsp_signature").setup()
                        --   end,
                        -- },
                },
                -- All other entries override the require("<key>").setup({...}) call for default plugins
                ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
                        -- config variable is the default configuration table for the setup function call
                        -- local null_ls = require "null-ls"

                        -- Check supported formatters and linters
                        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
                        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
                        config.sources = {
                                -- Set a formatter
                                -- null_ls.builtins.formatting.stylua,
                                -- null_ls.builtins.formatting.prettier,
                        }
                        return config -- return final config table
                end,
                treesitter = { -- overrides `require("treesitter").setup(...)`
                        ensure_installed = { "lua", "c", "cpp", "rust", "python" },
                },
                -- use mason-lspconfig to configure LSP installations
                ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
                        ensure_installed = { "sumneko_lua" },
                },
                -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
                ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
                        ensure_installed = { "pylint" },
                },
                ["mason-nvim-dap"] = {
                        ensure_installed = { "python", "codelldb" },
                },
        },

        -- LuaSnip Options
        luasnip = {
                -- Extend filetypes
                filetype_extend = {
                        -- javascript = { "javascriptreact" },
                },
                -- Configure luasnip loaders (vscode, lua, and/or snipmate)
                vscode = {
                        -- Add paths for including more VS Code style snippets in luasnip
                        paths = {},
                },
        },

        -- CMP Source Priorities
        -- modify here the priorities of default cmp sources
        -- higher value == higher priority
        -- The value can also be set to a boolean for disabling default sources:
        -- false == disabled
        -- true == 1000
        cmp = {
                source_priority = {
                        nvim_lsp = 1000,
                        luasnip = 750,
                        buffer = 500,
                        path = 250,
                },
        },

        -- Modify which-key registration (Use this with mappings table in the above.)
        ["which-key"] = {
                -- Add bindings which show up as group name
                register = {
                        -- first key is the mode, n == normal mode
                        n = {
                                -- second key is the prefix, <leader> prefixes
                                ["<leader>"] = {
                                        -- third key is the key to bring up next level and its displayed
                                        -- group name in which-key top level menu
                                        ["b"] = { name = "Buffer" },
                                        ["d"] = { name = "Debugger" },
                                },
                        },
                },
        },

        -- This function is run last and is a good place to configuring
        -- augroups/autocommands and custom filetypes also this just pure lua so
        -- anything that doesn't fit in the normal config locations above can go here
        polish = function()
                -- Set up custom filetypes
                -- vim.filetype.add {
                --   extension = {
                --     foo = "fooscript",
                --   },
                --   filename = {
                --     ["Foofile"] = "fooscript",
                --   },
                --   pattern = {
                --     ["~/%.config/foo/.*"] = "fooscript",
                --   },
                -- }
                local function alpha_on_bye(cmd)
                        local bufs = vim.fn.getbufinfo { buflisted = true }
                        vim.cmd(cmd)
                        if require("core.utils").is_available "alpha-nvim" and not bufs[2] then
                                require("alpha").start(true)
                        end
                end

                vim.keymap.del("n", "<leader>c")
                if require("core.utils").is_available "bufdelete.nvim" then
                        vim.keymap.set("n", "<leader>c", function()
                                alpha_on_bye "Bdelete!"
                        end, { desc = "Close buffer" })
                else
                        vim.keymap.set("n", "<leader>c", function()
                                alpha_on_bye "bdelete!"
                        end, { desc = "Close buffer" })
                end
        end,
}

return config
