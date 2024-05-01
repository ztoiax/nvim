-- vim-fcitx
local INPUT_TOGGLE = 1
function Fcitx2en()
	local input_status = vim.fn.systemlist("fcitx5-remote")
	if input_status[1] == "1" then -- 2表示当前为英文, 1表示当前为中文
		INPUT_TOGGLE = 1
		vim.fn.systemlist("fcitx5-remote -o") -- 中文转英文
	end
end

function Fcitx2zh()
	local input_status = vim.fn.systemlist("fcitx5-remote")
	-- if input_status[1] == "1" and INPUT_TOGGLE == 1 then
	if input_status[1] == "2" then
		vim.fn.systemlist("fcitx5-remote -c") -- 英文转中文
		INPUT_TOGGLE = 0
	end
end

-- 进入插入模式
-- vim.cmd("autocmd InsertEnter * :lua Fcitx2zh()")
-- vim.api.nvim_create_autocmd("InsertEnter", {command = "lua Fcitx2zh()"})

-- 退出插入模式
-- vim.cmd("autocmd InsertLeave * :lua Fcitx2en()")
vim.api.nvim_create_autocmd("InsertLeave", { command = "lua Fcitx2zh()" })


-- toggle ui
local M = {}
function M.toggle(option, silent, values)
	if values then
		if vim.opt_local[option]:get() == values[1] then
			vim.opt_local[option] = values[2]
		else
			vim.opt_local[option] = values[1]
		end
		return print("Set " .. option .. " to " .. vim.opt_local[option]:get(), { title = "Option" })
	end
	vim.opt_local[option] = not vim.opt_local[option]:get()
	if not silent then
		if vim.opt_local[option]:get() then
			print("Enabled " .. option)
		else
			print("Disabled " .. option)
		end
	end
end

local diagnostics_enabled = true
function M.toggle_diagnostics()
	diagnostics_enabled = not diagnostics_enabled
	if diagnostics_enabled then
		vim.diagnostic.enable()
		print("Enabled diagnostics")
	else
		vim.diagnostic.disable()
		print("Disabled diagnostics")
	end
end

local lsp_enabled = true
function M.toggle_lsp()
	lsp_enabled = not lsp_enabled
	if lsp_enabled then
		vim.api.nvim_command("LspStart")
		print("Enabled lsp")
	else
		vim.api.nvim_command("LspStop")
		print("Disabled lsp")
	end
end

function M.toggle_fold()
	if vim.opt.foldenable._value then
		vim.opt.foldenable = false
		print("Enabled fold")
	else
		vim.opt.foldenable = true
		print("Disnabled fold")
	end
end

return M
