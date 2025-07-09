-- Advanced syntax highlighting and code understanding

-- USE CASE: Enhanced syntax highlighting and code analysis
-- - Provides accurate syntax highlighting for many languages
-- - Enables advanced text objects and navigation
-- - Powers code folding and selection
-- - Foundation for many other plugins
-- - Essential for modern code editing experience

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  --build = ":TSUpdate", -- ensures parsers are up to date
  event = { "BufReadPost", "BufNewFile" }, -- lazy load on file open
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "go",               -- Go support
      "python",           -- Python support
      "markdown",         -- Markdown highlighting
      "markdown_inline",  -- Important for `headlines.nvim` and markdown plugins
      "bash", "json", "yaml", -- useful extras
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { "markdown" },
    },
    indent = {
      enable = true,
    },
  },
}
