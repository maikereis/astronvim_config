-- Powerful fuzzy finder for files, buffers, and more

-- USE CASE: Enhanced search and navigation
-- - Fuzzy find files, buffers, and project content
-- - Search through code, symbols, and help documentation
-- - Integrates with Git for commit and branch browsing
-- - Extensible with custom pickers and sorters
-- - Essential for efficient project navigation and search

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",                      -- Utility functions
      "nvim-telescope/telescope-fzf-native.nvim",   -- Native FZF sorter
      "nvim-telescope/telescope-file-browser.nvim", -- File browser
    },
    config = function()
      require("telescope").setup({
        defaults = {
          -- Ignore common directories and files
          file_ignore_patterns = {
            "node_modules", "__pycache__", "*.pyc",
            ".git/", "vendor/", "*.go.sum",
          },
        },
        extensions = {
          fzf = {
            fuzzy = true, -- Enable fuzzy matching
            override_generic_sorter = true,
            override_file_sorter = true,
          },
        },
      })
      -- Load extensions
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("file_browser")
    end,
  },
}
