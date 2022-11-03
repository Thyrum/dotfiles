local conds = require("luasnip.extras.expand_conditions")

local beg = parse({trig = "beg", wordTrig=true}, "\\begin{$1}\n\t$2\n\\end{$1}")
local bal = parse({trig = "bal", wordTrig=true }, "\\begin{align}\n\t$1\n\\end{align}")
beg.condition = conds.line_begin
bal.condition = conds.line_begin

return {
},{
	beg, bal
}
