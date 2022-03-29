return {
    -- 自己
    "wbthomason/packer.nvim",

    -- 对当前缓冲区, 打开一个lua的repl
    { "rafcamlet/nvim-luapad", cmd = { "Luapad", "LuaRun" } },

    -- nvim lua函数
    "svermeulen/vimpeccable",

    -- lua库函数
    "nvim-lua/plenary.nvim",

    -- Moonscript(lua的语法糖), 实现 +=, ..=, python的列表推导式
    { "svermeulen/nvim-moonmaker", cmd = { "Moon", "MoonCompile" } },

    -- lua写的lisp方言
    "jaawerth/fennel-nvim",

    -- fennel的repl
    "Olical/conjure",

    -- 优化启动速度. ~/.cache/nvim/luacache
    -- {"lewis6991/impatient.nvim", config = function() require('impatient') end},
}
