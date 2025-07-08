-- Integrated terminal management

-- USE CASE: Terminal integration and management
-- - Multiple persistent terminals within Neovim
-- - Floating terminal windows for quick commands
-- - Easy toggling between editor and terminal
-- - Customizable terminal behavior and appearance
-- - Essential for development workflow integration

return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,                -- Terminal size
        open_mapping = [[<c-\>]], -- Toggle key
        hide_numbers = true,      -- Hide line numbers in terminal
        shade_filetypes = {},
        shade_terminals = true,   -- Shade terminal background
        shading_factor = 2,
        start_in_insert = true,   -- Start in insert mode
        insert_mappings = true,   -- Map in insert mode
        persist_size = true,      -- Remember terminal size
        direction = "float",      -- Floating terminal
        close_on_exit = true,     -- Close when process exits
        shell = vim.o.shell,      -- Use default shell
        float_opts = {
          border = "curved",      -- Border style
          winblend = 0,           -- Transparency
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })
    end,
  },
}
