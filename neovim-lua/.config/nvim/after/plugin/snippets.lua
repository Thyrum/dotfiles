local path = vim.api.nvim_get_runtime_file("snippets", false)

require("luasnip.config").setup({enable_autosnippets = true})
require("luasnip.loaders.from_lua").load({paths = path })
