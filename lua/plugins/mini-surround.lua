-- Efficient text surrounding operations

-- USE CASE: Text manipulation and editing efficiency
-- - Quickly add/remove/change quotes, brackets, tags
-- - Streamlines common text editing operations
-- - Reduces keystrokes for repetitive editing tasks
-- - Essential for rapid code refactoring and text manipulation
-- - Works with any surrounding characters (quotes, brackets, HTML tags)

return {
  {
    "echasnovski/mini.surround",
    version = "*",
    config = function()
      require("mini.surround").setup()
      -- Examples: ys{motion}{char} to add, ds{char} to delete, cs{old}{new} to change
    end,
  },
}
