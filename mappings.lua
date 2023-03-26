-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
        -- first key is the mode
        n = {
                -- second key is the lefthand side of the map
                -- mappings seen under group name "Buffer"
                ["<leader>bn"] = { "<cmd>enew<cr>", desc = "New buffer" },
                -- DAP mappings:
                ["<leader>de"] = { function() require('dapui').eval() end, desc = "Evaluate expression" },
                ["<leader>dx"] = { function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Set conditional breakpoint" },
                ["<leader>dl"] = { function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Logpoint message: ')) end, desc = "Set logpoint" },
                ["<leader>dP"] = { function() require('dap.utils').pick_process() end, desc = "Attach to process" },
                ["<leader>dfu"] = { function() require('dap').up() end, desc = "Up one frame" },
                ["<leader>dfd"] = { function() require('dap').down() end, desc = "Down one frame" },
                ["<leader>dX"] = { function() require('dap').terminate() end, desc = "Terminate program being debugged" },
                -- quick save
                ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
                ["<leader>c"] = {
                        function()
                        local bufs = vim.fn.getbufinfo { buflisted = true }
                        require("astronvim.utils.buffer").close(0)
                        if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
                        end,
                        desc = "Close buffer",
                },
        },
        t = {
                -- setting a mapping to false will disable it
                -- ["<esc>"] = false,
        },
}
