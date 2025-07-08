-- BUFFERLINE CONFIGURATION
-- ============================================================================
-- Modern buffer/tab management with visual indicators

-- USE CASE: Enhanced buffer navigation and management
-- - Provides tabbed interface for open files
-- - Shows LSP diagnostics status in buffer tabs
-- - Integrates with file explorer (neo-tree)
-- - Improves workflow when working with multiple files
-- - Essential for efficient file switching and project navigation

return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons", -- File type icons
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",        -- Show LSP diagnostics in tabs
          separator_style = "slant",       -- Visual separator style
          show_buffer_close_icons = false, -- Hide close buttons
          show_close_icon = false,         -- Hide main close button
          -- Integration with neo-tree file explorer
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              highlight = "Directory",
              text_align = "left",
            },
          },
        },
      })
    end,
  }
}
