-- Comprehensive Git interface for Neovim

-- USE CASE: Git workflow management
-- - Visual Git interface similar to Magit (Emacs)
-- - Stage, commit, and push changes interactively
-- - Browse commit history and diffs
-- - Integrates with telescope for enhanced searching
-- - Essential for efficient Git workflow within the editor

return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- Utility functions
      "sindrets/diffview.nvim",        -- Diff viewer
      "nvim-telescope/telescope.nvim", -- Fuzzy finder integration
    },
    config = function()
      require("neogit").setup({
        integrations = {
          telescope = true, -- Use telescope for selections
          diffview = true,  -- Enhanced diff viewing
        },
      })
    end,
  }
}
