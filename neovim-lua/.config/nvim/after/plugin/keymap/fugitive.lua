local Remap = require("thyrum.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<leader>gj", ":diffget //3<cr>")
nnoremap("<leader>gf", ":diffget //2<cr>")
nnoremap("<leader>gs", ":G<cr>")
