local autosnippets={}

local tex={}
tex.in_mathzone=function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text=function() return not tex.in_mathzone() end

table.insert(autosnippets,parse(
	{trig="beg", wordTrig=true, condition=conds.line_begin},
	"\\begin{$1}\n\t$0\n\\end{$1}"
))
table.insert(autosnippets,parse(
	{trig="bal", wordTrig=true, condition=conds.line_begin+tex.in_text},
	"\\begin{align}\n\t$0\n\\end{align}"
))
table.insert(autosnippets,parse(
	{trig="__", wordTrig=false, condition=tex.in_mathzone},
	"_{$1}"
))
table.insert(autosnippets,parse(
	{trig="**", wordTrig=false, condition=tex.in_mathzone},
	"^{$1}"
))
table.insert(autosnippets,parse(
	{trig="...", wordTrig=false, condition=tex.in_mathzone},
	"\\dots"
))

return {
},autosnippets
