-- 变量,函数,if,for语句跳转
local sts = require("syntax-tree-surfer")
vim.keymap.set("n", "gl", function() -- only jump to variable_declarations
    sts.targeted_jump({ "variable_declaration" })
end, opts)
vim.keymap.set("n", "gff", function() -- only jump to functions
    sts.targeted_jump({ "function", "arrrow_function", "function_definition" })
end, opts)
vim.keymap.set("n", "gif", function() -- only jump to if_statements
    sts.targeted_jump({ "if_statement" })
end, opts)
vim.keymap.set("n", "gfo", function() -- only jump to for_statements
    sts.targeted_jump({ "for_statement" })
end, opts)
vim.keymap.set("n", "gj", function() -- jump to all that you specify
  sts.targeted_jump({
    "function",
    "if_statement",
    "else_clause",
    "else_statement",
    "elseif_statement",
    "for_statement",
    "while_statement",
    "switch_statement",
  })
end, opts)

-- 上下函数跳转
vim.keymap.set("n", "gn", function()
    sts.filtered_jump("default", true) --> true means jump forward
end, opts)
vim.keymap.set("n", "gN", function()
    sts.filtered_jump("default", false) --> false means jump backwards
end, opts)
