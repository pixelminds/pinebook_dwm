hi link markdownH1 markdownHxBold
hi link markdownH2 markdownHxBold
if &background == "light"
	hi markdownHxBold term=bold ctermfg=Darkmagenta gui=bold guifg=Magenta cterm=bold
else
 	hi markdownHxBold term=bold ctermfg=Darkmagenta gui=bold guifg=Magenta cterm=bold
endif
hi link markdownCode markdownHxTape
hi markdownHxTape ctermbg=DarkBlue guibg=DarkBlue
