-- Comprehensive Go development environment

-- USE CASE: Go programming enhancement
-- - Advanced Go language support beyond basic LSP
-- - Go-specific commands and tools integration
-- - Test running and debugging capabilities
-- - Code generation and refactoring tools
-- - Essential for productive Go development

return {
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",                -- GUI components
      "neovim/nvim-lspconfig",           -- LSP configuration
      "nvim-treesitter/nvim-treesitter", -- Syntax highlighting
    },
    config = function() require("go").setup() end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },                                 -- Load for Go files
    build = ':lua require("go.install").update_all_sync()', -- Install Go tools
  },
}
