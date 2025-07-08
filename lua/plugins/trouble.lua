-- Centralized diagnostics and issue management

-- USE CASE: Code issue management and navigation
-- - Centralized view of all diagnostics (errors, warnings)
-- - Quick navigation to problematic code locations
-- - Filterable and searchable issue list
-- - Integrates with LSP and other diagnostic sources
-- - Essential for efficient debugging and code quality

return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup({
        position = "bottom",            -- Position of trouble window
        height = 10,                    -- Window height
        width = 50,                     -- Window width
        icons = true,                   -- Use icons
        mode = "workspace_diagnostics", -- Default mode
        fold_open = "",                 -- Fold open icon
        fold_closed = "",               -- Fold closed icon
        group = true,                   -- Group diagnostics
        padding = true,                 -- Add padding
        -- Key mappings for trouble window
        action_keys = {
          close = "q",
          cancel = "<esc>",
          refresh = "r",
          jump = { "<cr>", "<tab>" },
          open_split = { "<c-x>" },
          open_vsplit = { "<c-v>" },
          open_tab = { "<c-t>" },
          jump_close = { "o" },
          toggle_mode = "m",
          toggle_preview = "P",
          hover = "K",
          preview = "p",
          close_folds = { "zM", "zm" },
          open_folds = { "zR", "zr" },
          toggle_fold = { "zA", "za" },
          previous = "k",
          next = "j"
        },
      })
    end,
  },
}
