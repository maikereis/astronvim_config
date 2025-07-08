-- Intelligent bracket and quote pairing

-- USE CASE: Automatic code structure completion
-- - Automatically closes brackets, quotes, and parentheses
-- - Context-aware pairing based on file type
-- - Reduces syntax errors and improves typing flow
-- - Customizable rules for different scenarios
-- - Essential for maintaining proper code structure

---@type LazySpec
return {
  "windwp/nvim-autopairs",
  config = function(plugin, opts)
    require "astronvim.plugins.configs.nvim-autopairs" (plugin, opts)
    -- Custom autopairs rules
    local npairs = require "nvim-autopairs"
    local Rule = require "nvim-autopairs.rule"
    local cond = require "nvim-autopairs.conds"
    npairs.add_rules({
      -- LaTeX dollar sign pairing
      Rule("$", "$", { "tex", "latex" })
          :with_pair(cond.not_after_regex "%%")     -- Don't pair after comments
          :with_pair(cond.not_before_regex("xxx", 3)) -- Custom conditions
          :with_move(cond.none())                   -- Don't move cursor
          :with_del(cond.not_after_regex "xx")      -- Don't delete in certain contexts
          :with_cr(cond.none()),                    -- Don't add newline
      -- Disable for vim files
      Rule("a", "a", "-vim")
    })
  end,
}
