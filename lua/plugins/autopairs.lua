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
          :with_pair(cond.not_after_regex "%%") -- Don't pair after comments
          :with_pair(cond.not_before_regex("xxx", 3)) -- Custom conditions
          :with_move(cond.none())                   -- Don't move cursor
          :with_del(cond.not_after_regex "xx")      -- Don't delete in certain contexts
          :with_cr(cond.none()),                    -- Don't add newline
      
      -- Python-specific rules
      
      -- Triple quotes for docstrings
      Rule('"""', '"""', "python")
          :with_pair(cond.not_after_regex_check "[\"'`]") -- Don't pair inside other quotes
          :with_move(cond.none())
          :with_cr(function(opts)
            -- Add proper indentation for docstrings
            return npairs.cr_inside_quotes(opts)
          end),
      
      Rule("'''", "'''", "python")
          :with_pair(cond.not_after_regex_check "[\"'`]")
          :with_move(cond.none())
          :with_cr(function(opts)
            return npairs.cr_inside_quotes(opts)
          end),
      
      -- f-string pairing
      Rule('f"', '"', "python")
          :with_pair(cond.not_after_regex_check "[\"'`]")
          :with_move(cond.none()),
      
      Rule("f'", "'", "python")
          :with_pair(cond.not_after_regex_check "[\"'`]")
          :with_move(cond.none()),
      
      -- Dictionary/set comprehension with proper spacing
      Rule("{", "}", "python")
          :with_pair(cond.not_after_regex_check "[%w_]") -- Don't pair after word chars
          :with_move(cond.none())
          :with_cr(npairs.cr_inside_quotes),
      
      -- Lambda colon pairing (optional, can be controversial)
      Rule("lambda ", ": ", "python")
          :with_pair(cond.not_after_regex_check "[:]") -- Don't pair if colon already exists
          :with_move(cond.none())
          :use_key(":"),
      
      -- Type annotation arrow
      Rule(" -> ", "", "python")
          :with_pair(cond.not_after_regex_check "->") -- Don't pair if already exists
          :with_move(cond.none())
          :use_key(">"),
      
      -- Parentheses for function calls with intelligent spacing
      Rule("(", ")", "python")
          :with_pair(cond.not_after_regex_check "[%w_]%(") -- Don't pair after word( pattern
          :with_move(cond.none())
          :with_cr(npairs.cr_inside_quotes),
      
      -- List comprehension brackets
      Rule("[", "]", "python")
          :with_pair(cond.not_filetypes({"python"})) -- Actually, let's be more specific
          :with_move(cond.none())
          :with_cr(npairs.cr_inside_quotes),
      
      -- Go-specific rules
      
      -- Raw string literals
      Rule("`", "`", "go")
          :with_pair(cond.not_after_regex_check "[`]") -- Don't pair inside existing backticks
          :with_move(cond.none())
          :with_cr(function(opts)
            return npairs.cr_inside_quotes(opts)
          end),
      
      -- Struct initialization braces
      Rule("{", "}", "go")
          :with_pair(cond.not_after_regex_check "[%w_]") -- Don't pair after word chars
          :with_move(cond.none())
          :with_cr(function(opts)
            -- Add proper indentation for struct literals
            return npairs.cr_inside_quotes(opts)
          end),
      
      -- Slice/array initialization
      Rule("[", "]", "go")
          :with_pair(cond.not_after_regex_check "[%w_]") -- Don't pair after word chars
          :with_move(cond.none())
          :with_cr(npairs.cr_inside_quotes),
      
      -- Channel operators
      Rule(" <- ", "", "go")
          :with_pair(cond.not_after_regex_check "<-") -- Don't pair if already exists
          :with_move(cond.none())
          :use_key("<"),
      
      -- Interface type braces
      Rule("interface{", "}", "go")
          :with_pair(cond.not_after_regex_check "}") -- Don't pair if closing brace exists
          :with_move(cond.none())
          :with_cr(npairs.cr_inside_quotes),
      
      -- Map initialization
      Rule("map[", "]", "go")
          :with_pair(cond.not_after_regex_check "]") -- Don't pair if closing bracket exists
          :with_move(cond.none())
          :use_key("]"),
      
      -- Function type parentheses
      Rule("func(", ")", "go")
          :with_pair(cond.not_after_regex_check ")") -- Don't pair if closing paren exists
          :with_move(cond.none())
          :with_cr(npairs.cr_inside_quotes),
      
      -- Go template delimiters
      Rule("{{", "}}", "go")
          :with_pair(cond.not_after_regex_check "}}") -- Don't pair if closing delim exists
          :with_move(cond.none())
          :with_cr(npairs.cr_inside_quotes),
      
      -- Error handling pattern
      Rule("if err != nil {", "}", "go")
          :with_pair(cond.not_after_regex_check "}") -- Don't pair if closing brace exists
          :with_move(cond.none())
          :with_cr(npairs.cr_inside_quotes)
          :use_key("{"),
      
      -- Type assertion parentheses
      Rule(".(", ")", "go")
          :with_pair(cond.not_after_regex_check ")") -- Don't pair if closing paren exists
          :with_move(cond.none())
          :use_key("("),
    })
    
    -- Enhanced configuration for Go and Python
    npairs.setup({
      check_ts = true, -- Use treesitter for better context
      ts_config = {
        lua = {'string'},
        python = {'string', 'string_content'},
        javascript = {'template_string'},
        go = {'string', 'raw_string_literal', 'interpreted_string_literal'},
      },
      fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '"', "'", '`' }, -- Added backtick for Go
        pattern = [=[[%'%"%)%>%]%)%}%,]]=],
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey = 'Comment'
      },
    })
  end,
}