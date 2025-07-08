-- FLASH NAVIGATION
-- ============================================================================
-- Lightning-fast cursor movement and text navigation

-- USE CASE: Efficient cursor movement and text navigation
-- - Jump to any visible text with minimal keystrokes
-- - Navigate through code structure using treesitter
-- - Enhance search functionality with visual feedback
-- - Dramatically improves navigation speed in large files
-- - Essential for quick code traversal and editing

return {
  "folke/flash.nvim",
  event = "VeryLazy", -- Load when needed
  ---@type Flash.Config
  opts = {},
  keys = {
    { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash jump" },
    { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash treesitter" },
    { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote flash" },
    { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter search" },
    { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle flash search" },
  },
}
