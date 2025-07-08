-- Package manager for LSP servers, linters, and formatters

-- USE CASE: Development tool management
-- - Automatically installs and manages LSP servers
-- - Handles linter and formatter installation
-- - Manages debugger (DAP) installations
-- - Ensures consistent development environment
-- - Essential for maintaining up-to-date development tools

---@type LazySpec
return {
  -- LSP server management
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls", -- Lua language server
        -- Add more language servers as needed
      },
    },
  },
  -- Formatter and linter management
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "stylua", -- Lua formatter
        -- Add more formatters/linters as needed
      },
    },
  },
  -- Debug adapter management
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = {
        "python", -- Python debugger
        -- Add more debuggers as needed
      },
    },
  },
}
