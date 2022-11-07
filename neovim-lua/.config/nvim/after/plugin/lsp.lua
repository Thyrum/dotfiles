local Remap = require("thyrum.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Setup nvim-cmp
local cmp = require("cmp")
local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}
local lspkind = require("lspkind")
local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping(function(fallback)
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				cmp.complete()
			end
		end, { "i", "s" }),
		["<S-Space>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]
			if entry.source.name == "cmp_tabnine" then
				if entry.completion_item.data ~= nil and entry.completion_item.data.detal ~= nil then
					menu = entry.completion_item.data.detail .. " " .. menu
				end
				vim_item.kind = ""
			end
			vim_item.menu = menu
			return vim_item
		end,
	},
	sources = {
		{ name = "cmp_tabnine" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "buffer" },
	},
})

local tabnine = require("cmp_tabnine.config")
tabnine:setup({
	max_lines = 1000,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = "..",
})

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function()
			nnoremap("gd", function() vim.lsp.buf.definition() end)
			nnoremap("K", function() vim.lsp.buf.hover() end)
			nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
			nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
			nnoremap("[d", function() vim.diagnostic.goto_next() end)
			nnoremap("]d", function() vim.diagnostic.goto_prev() end)
			nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end)
			nnoremap("<leader>vrr", function() vim.lsp.buf.references() end)
			nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
			inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
		end,
	}, _config or {})
end

require("lspconfig").tsserver.setup(config())
require("lspconfig").clangd.setup(config())
require("lspconfig").pyright.setup(config())
require("lspconfig").texlab.setup(config())
require("lspconfig").eslint.setup(config())

require("symbols-outline").setup({})
