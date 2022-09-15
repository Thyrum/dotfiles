return {
},{
	parse({trig = "beg", wordTrig=true }, "\\begin{$1}\n\t$2\n\\end{$1}"),
	parse({trig = "bal", wordTrig=true }, "\\begin{align}\n\t$1\n\\end{align}"),
}
