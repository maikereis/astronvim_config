-- Comprehensive Git interface for Neovim

-- USE CASE: Git workflow management
-- - Visual Git interface similar to Magit (Emacs)
-- - Stage, commit, and push changes interactively
-- - Browse commit history and diffs
-- - Integrates with telescope for enhanced searching
-- - Essential for efficient Git workflow within the editor

---@type LazySpec
return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("neogit").setup({
        integrations = { telescope = true, diffview = true },
      })
    end,
  }
}
