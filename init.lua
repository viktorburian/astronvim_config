--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
return {
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

        -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
        diagnostics = {
                virtual_text = false,
                underline = true,
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

        lsp = {
            -- enable servers that you already have installed without mason
            servers = {
                "pyright",
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
            setup_handlers = {
                    -- add custom handler
                    -- clangd = function(_, opts) require("clangd_extensions").setup { server = opts } end,
                    -- rust_analyzer = function(_, opts) require("rust_tools").setup { server = opts } end,
            },
            config = {
                clangd = {
                    capabilities = {
                        offsetEncoding = "utf-8",
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
        end,
}
