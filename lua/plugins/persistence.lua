-- Automatic session save and restore

-- USE CASE: Project state persistence
-- - Automatically saves and restores editor sessions
-- - Maintains buffer state, window layout, and tabs
-- - Quick project switching with preserved context
-- - Reduces setup time when returning to projects
-- - Essential for maintaining workflow continuity

return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- Load before reading files
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      })
    end,
  }
}
