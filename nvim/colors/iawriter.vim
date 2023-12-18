"
" Last Change: 2013/03/11
" Modifier:	Abbie Kressner
" Maintainer:  Jacek Dominiak <doj (at) ptpbs (dot) com>
"
" Description: Vim color file
"
" Remove all existing highlighting.
set background=light

hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "iawriter"

hi Normal	      cterm=NONE ctermfg=black ctermbg=white gui=NONE guifg=black guibg=#f5f6f6
hi NonText	    ctermfg=bg ctermbg=bg guifg=bg guibg=bg
hi LineNr       cterm=italic ctermfg=black ctermbg=white gui=italic guifg=black guibg=#f5f6f6 
hi Folded       cterm=NONE ctermfg=grey ctermbg=grey gui=NONE guifg=grey86 guibg=#f5f6f6
hi FoldColumn   ctermfg=black ctermbg=white guifg=black guibg=#f5f6f6
hi SpecialKey   ctermfg=black ctermbg=white guifg=black guibg=#f5f6f6
hi Search       ctermbg=grey guibg=grey86
hi StatusLine   ctermbg=black ctermfg=bg cterm=NONE guifg=grey86 guibg=white
hi StatusLineNC ctermfg=bg ctermbg=grey cterm=NONE guifg=bg guibg=grey86 gui=NONE
hi Visual       ctermfg=fg ctermbg=grey guifg=fg guibg=grey86 gui=NONE
hi VisualNOS    ctermfg=bg ctermbg=grey guifg=bg guibg=grey86 gui=NONE

" Syntax highlighting scheme
hi Comment	    cterm=italic ctermfg=black ctermbg=white gui=italic guifg=#93a1a1 guibg=#f5f6f6
hi Constant	    ctermfg=black ctermbg=white guifg=black guibg=#f5f6f6
hi String	      ctermfg=black ctermbg=white guifg=black guibg=#f5f6f6
hi Character	  ctermfg=black ctermbg=white guifg=black guibg=#f5f6f6
hi Number	      ctermfg=black ctermbg=white guifg=black guibg=#f5f6f6
" Boolean defaults to Constant
hi Float		    ctermfg=black ctermbg=white guifg=black guibg=#f5f6f6
hi Title	      ctermfg=black ctermbg=white cterm=bold guifg=black guibg=#f5f6f6 gui=bold

hi Identifier	  ctermfg=black ctermbg=white guifg=black guibg=#f5f6f6
hi Function	    ctermfg=black ctermbg=white guifg=black guibg=#f5f6f6

hi Statement	  ctermfg=black ctermbg=white guifg=black guibg=#f5f6f6
hi Conditional	ctermfg=black ctermbg=white guifg=black guibg=#f5f6f6
hi Repeat	      ctermfg=black ctermbg=white guifg=black guibg=#f5f6f6
hi Label		    ctermfg=black ctermbg=white guifg=black guibg=#f5f6f6
hi Operator	    ctermfg=black ctermbg=white guifg=black guibg=#f5f6f6
" Keyword defaults to Statement
" Exception defaults to Statement

hi PreProc	    cterm=bold ctermfg=black ctermbg=white gui=bold guifg=black guibg=#f5f6f6
" Include defaults to PreProc
" Define defaults to PreProc
" Macro defaults to PreProc
" PreCondit defaults to PreProc

hi Type		      cterm=bold ctermfg=black ctermbg=white gui=bold guifg=black guibg=#f5f6f6
" StorageClass defaults to Type
" Structure defaults to Type
" Typedef defaults to Type

hi Special	    cterm=italic ctermfg=black ctermbg=white gui=italic guifg=black guibg=#f5f6f6
" SpecialChar defaults to Special
" Tag defaults to Special
" Delimiter defaults to Special
hi SpecialComment cterm=italic ctermfg=black ctermbg=white gui=italic guifg=black guibg=#f5f6f6
" Debug defaults to Special

hi Todo		      cterm=italic,bold ctermfg=black ctermbg=white gui=bold guifg=#dc322f guibg=bg
hi Cursor       guibg=#dc322f 
"#15abdd
hi Error		    cterm=bold,reverse ctermfg=black ctermbg=grey gui=bold,reverse guifg=black guibg=grey

""""""""""""""""""""""""""""
" These are untested!!!  I got them from https://github.com/laktek/distraction-free-writing-vim/blob/master/colors/iawriter.vim
hi DiffAdd      guibg=black ctermbg=3
hi DiffDelete   guifg=#ff8097 guibg=#ffe0f7 ctermfg=4 ctermbg=5
hi DiffChange   guibg=#cfefff ctermbg=9
hi DiffText     guibg=#bfdfff gui=NONE  ctermbg=6 cterm=NONE

" Showpairs plugin
"   for cursor on paren
hi ShowPairsHL  guibg=grey86 ctermbg=grey
"   for cursor between parens
hi ShowPairsHLp guibg=grey86 ctermbg=grey
"   unmatched paren
hi ShowPairsHLe guibg=#ff8097 ctermbg=red

" settings for Vim7
if version >= 700
  hi MatchParen               guibg=grey86 ctermbg=lightgreen
  " Spell
  hi SpellBad  	guifg=NONE gui=undercurl ctermfg=red cterm=underline
  hi SpellRare  guifg=NONE gui=undercurl ctermfg=magenta cterm=underline
  hi SpellCap 	guifg=NONE gui=undercurl guisp=black cterm=underline
  " Completion menu
  hi Pmenu      guibg=grey86 ctermbg=grey
  hi PmenuSel   guifg=grey86 guibg=black ctermbg=black cterm=NONE
  hi PmenuSbar  guibg=black ctermbg=lightcyan
  " Tab line
  hi TabLine    guifg=black    guibg=#f5f6f6 cterm=underline
  hi TabLineFill guifg=#f5f6f6  guibg=black   cterm=underline
  hi TabLineSel guifg=black    guibg=#f5f6f6 cterm=NONE
endif
