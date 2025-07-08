-- Modern file explorer with Git integration

-- USE CASE: Project navigation and file management
-- - Browse project structure with tree view
-- - Show Git status for files and directories
-- - Quick file operations (create, delete, rename)
-- - Integrates with buffer management
-- - Essential for project exploration and file management

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",       -- Utility functions
      "nvim-tree/nvim-web-devicons", -- File icons
      "MunifTanjim/nui.nvim",        -- UI components
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          follow_current_file = {
            enabled = true,              -- Auto-highlight current file
          },
          use_libuv_file_watcher = true, -- Watch for file changes
        },
        -- Git status symbols
        git_status = {
          symbols = {
            added = "✚",
            deleted = "✖",
            modified = "✱",
            renamed = "➜",
            untracked = "★",
            ignored = "◌",
            unstaged = "✗",
            staged = "✓",
            conflict = "",
          },
        },
      })
    end,
  }
}
