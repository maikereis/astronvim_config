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
  opts = {
    ensure_installed = {
      "lua", "vim", -- Basic languages
      -- Add more languages as needed: "python", "javascript", "go", etc.
    },
  },
}
