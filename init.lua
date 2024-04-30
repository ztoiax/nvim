require("set")
require("map")
require("plugins-lazy")
-- require("debug/init-dap")
require("function")
require("highlight")

-- 启动nvim时调用persistence插件，恢复session
require("persistence").load({ last = true })
