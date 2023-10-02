local M = {}

---@type PluginLspKeys
M._keys = nil

---@return (LazyKeys|{has?:string})[]
function M.get()
	local format = function()
		require("plugins.lsp.format").format({ force = true })
	end
	if not M._keys then
		---@class PluginLspKeys
		M._keys = {
			{ "<leader>rn", vim.lsp.buf.rename, desc = "[R]e[n]ame" },
			{ "<leader>ca", vim.lsp.buf.code_action, desc = "[C]ode [A]ction" },
			{ "gd", vim.lsp.buf.definition, desc = "[G]oto [D]efinition" },
			{ "gr", vim.lsp.buf.implementation, desc = "[G]oto [R]eferences" },
			{ "gI", vim.lsp.buf.implementation, desc = "[G]oto [I]mplementation" },
			{ "K", vim.lsp.buf.hover, desc = "Hover Documentation" },
			{ "<C-k>", vim.lsp.buf.signature_help, desc = "Signature Documentation" },
			{ "<C-h>", vim.lsp.buf.signature_help, desc = "Signature Help" },

			-- Diagnostic keymaps
			{ "<leader>e", vim.diagnostic.open_float, desc = "Open [E]rror" },
			{ "<leader>q", vim.diagnostic.setloclist, desc = "Open Diagnostics [Q]uickfix" },
			{ "]d", vim.diagnostic.goto_next, desc = "Next Diagnostic" },
			{ "[d", vim.diagnostic.goto_prev, desc = "Previous Diagnostic" },
		}
	end
	return M._keys
end

function M.on_attach(client, buffer)
	local Keys = require("lazy.core.handler.keys")
	local keymaps = {} ---@type table<string,LazyKeys|{has?:string}>

	for _, value in ipairs(M.get()) do
		local keys = Keys.parse(value)
		if keys[2] == vim.NIL or keys[2] == false then
			keymaps[keys.id] = nil
		else
			keymaps[keys.id] = keys
		end
	end

	for _, keys in pairs(keymaps) do
		if not keys.has or client.server_capabilities[keys.has .. "Provider"] then
			local opts = Keys.opts(keys)
			opts.has = nil
			opts.silent = opts.silent ~= false
			opts.buffer = buffer
			vim.keymap.set(keys.mode or "n", keys[1], keys[2], opts)
		end
	end
end

return M
