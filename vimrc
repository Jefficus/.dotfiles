" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" todo: Load plugins here (pathogen or vundle)

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

let mapleader = " "

" Security
set modelines=0

" Show line numbers - my preference is off
set nonumber

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set textwidth=65
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set wrap
set shiftround
" set formatoptions=tcqrn1

" Colorscheme
colorscheme slate "so far, I actually like the default best
"Override syntax colors for some things that bug me
highlight Search guibg='NONE' guifg='White' cterm=NONE ctermfg=White ctermbg=NONE
highlight jeffdownItalic guibg='NONE' guifg='White' cterm=NONE ctermfg=White ctermbg=NONE
highlight jeffdownBold guibg='NONE' guifg='White' cterm=NONE ctermfg=White ctermbg=NONE

" Cursor motion
set scrolloff=1 "keep 1 lines of text visible above/below current line
set backspace=indent,eol,start "makes BS key work as expected in insert mode
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
"nnoremap / /\v "No idea what this \v does
"vnoremap / /\v
set noincsearch  "disable incremental searching (I hate it)
set hlsearch   
set ignorecase
set smartcase
set showmatch

" In normal mode, just hit <spc><spc> to clear the search highlights
map <leader><space> :let @/=''<CR>


" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" I *HATE* the vim recording function. Never use it and I'm constantly
" invoking it by accident when trying to quit something. So I'm disabling it.
map q <Nop>

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
"set listchars=tab:▸\ ,eol:¬

" Uncomment this to enable by default:
"set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL




"""""""""""""""""""""""""""""""""""""""""""""""
" EXPERIMENTAL
" This is where I try new things before accepting them
" If it stays down here for any length of time, consider
" moving it up somewhere higher.
"""""""""""""""""""""""""""""""""""""""""""""""

" invoke the vim-plug addon
call plug#begin('~/.vim/plugged')

" Load a plugin to handle highlighting for Markdown content
Plug 'tpope/vim-markdown' " a good markdown handler

" These might implement a more limited wiki link feature as 
" a vim Minor Mode. But I haven't got it working yet.
"Plug 'tomtom/tlib_vim'
"Plug 'tomtom/viki_vim'

" Highly useful noun and verb extensions for vim
Plug 'tpope/vim-surround'  "adds cs=chg surround, ys=add surround, ds=del
Plug 'tpope/vim-commentary' "cm for commentify - add cmnt symbols to target
Plug 'tpope/vim-repeat' "allow other plugins to become repeatable with . cmd
Plug 'tpope/vim-speeddating' "provide quick tricks for adding/manipulating dates
Plug 'vim-scripts/ReplaceWithRegister' "gr replace targ with buffer content 
Plug 'christoomey/vim-titlecase' "gt go title case, 
Plug 'christoomey/vim-system-copy' "cp targ to sys clipbd, cv pastes from 
Plug 'christoomey/vim-tmux-navigator' "mk tmux treat vim splits as panes
Plug 'michaeljsmith/vim-indent-object' "allow targeting block of indented lines
Plug 'kana/vim-textobj-user' "dependency for the plugins that follow? 
Plug 'kana/vim-textobj-entire' "allow targeting entire file
Plug 'kana/vim-textobj-line' "allow targeting entire full line
Plug 'jeetsukumaran/vim-pythonsense' "allow targeting of Python blocks
Plug 'reedes/vim-textobj-sentence' "allow targeting English sentence
Plug 'reedes/vim-pencil' "handling soft wrap, markup displays, etc.
Plug 'reedes/vim-colors-pencil' "handle nice colors for markdown elements
Plug 'vim-airline/vim-airline' "a sexy status line for vim sessions
Plug 'lervag/vimtex' "a syntax and motions plugin for latex files
Plug 'azadkuh/vim-cmus' "control cmus music player from inside vim
Plug 'felixhummel/setcolors.vim' "a tool for previewing vim color schemes
Plug 'Jefficus/vim-jeffdown' "a tool for syntax highlighting jeffdown files
Plug 'neomutt/neomutt.vim' "synatx highlighting within neomutt

Plug 'morhetz/gruvbox' "a low-contrast color scheme
Plug 'kamwitsta/nordisk' "a low-contrast color scheme
Plug 'kamwitsta/dutch_peasants' "a low-contrast color scheme
Plug 'junegunn/seoul256.vim' "a low-contrast color scheme
"Plug 'ap/vim-templates' "create template system for init'ing new files
Plug 'elzr/vim-json' "better syntax highlighting for json
Plug 'itchyny/lightline.vim' "better status line

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""
" Overrides and extensions for included plugins
"""""""""""""""""""""""""""""""""""""""""""""""
let g:markdown_syntax_conceal = 0 " tell vim-markdown not to suppress markups
let g:templates_empty_files = 1 " add templates to existing empty files


" Turn on the vim-pencil prose editing features
" But I don't yet have a good sense for whether
" pencil has anything I really want.

augroup pencil
   autocmd!
   autocmd filetype markdown,mkd call pencil#init()
   autocmd filetype text,txt,jeffdown,jd call pencil#init()
  augroup END
 " Pencil / Writing Controls {{{
   let g:pencil#wrapModeDefault = 'soft'
   let g:pencil#textwidth = 74
   let g:pencil#joinspaces = 0
   let g:pencil#cursorwrap = 1
   let g:pencil#conceallevel = 3
   let g:pencil#concealcursor = 'c'
   let g:pencil#softDetectSample = 20
   let g:pencil#softDetectThreshold = 130
 " }}}
 
" " NOTE: if lines are wrapping in mid-word, try :set linebreak
" "       which should have them wrapping at word boundaries instead
" "       I'm not yet sure whether this is a feature of vim or this plugin
" "       and I don't yet know how best to set it up to always work that way.
" "       But at least we have a working solution to start with. -JAS
 
" A function to compute a quick word count of 
" the current buffer
function! WordCount()
   let s:old_status = v:statusmsg
   let position = getpos(".")
   exe ":silent normal g\<c-g>"
   let stat = v:statusmsg
   let s:word_count = 0
   if stat != '--No lines in buffer--'
     let s:word_count = str2nr(split(v:statusmsg)[11])
     let v:statusmsg = s:old_status
   end
   call setpos('.', position)
   return s:word_count 
endfunction


" And then we put that wordcount into the status bar
"let g:airline_section_z='WC:%{WordCount()}'
" Or do it this way, if we ever get rid of the airline plugin
" set statusline=wc:%{WordCount()}

" keybindings for the cmus controls
nnoremap <leader>b :CmusNext<cr>
nnoremap <leader>c :CmusPause<cr>
nnoremap <leader>i :CmusCurrent<cr>
nnoremap <leader>v :CmusStop<cr>
nnoremap <leader>x :CmusPlay<cr>
nnoremap <leader>z :CmusPrevious<cr>



"underline markdown headlines
" NOTE: I'm using normal, not normal!, because I WANT
" vim to use the special meaning of "gtal". 
function! UnderlineHeading(level)
  if a:level == 1
    normal gtalyypVr=
  elseif a:level == 2
    normal gtalyypVr-
  else
    "NOTE: there's a trailing space on this next line
    normal gtalI### 
endif
endfunction
"Comment out a jeffdown paragraph
" NOTE: I'm using normal, not normal!, because I WANT
" vim to use the special meaning of "gtal". 
function! CommentParagraph()
    normal ^i[A]
endfunction
function! CommentRemainderParagraph()
    normal i[A]
endfunction

nnoremap <leader>u1 :call UnderlineHeading(1);<cr>
nnoremap <leader>u2 :call UnderlineHeading(2);<cr>
nnoremap <leader>u3 :call UnderlineHeading(3);<cr>

" should probably only do these things for jeffdown files
set breakindent "indent successive lines of a pgph to match first line
" Remap help key.
nnoremap <leader>[ :call CommentParagraph();<cr>
nnoremap <leader>] :call CommentRemainderParagraph();<cr>


" Hijack vimwiki for my own writing projects
" let g:vimwiki_list = [
"          \{'path': '~/RoadProjects/IKTIA/Working', 'synatax':'markdown', 'ext':'.md'},
"          \{'path': '~/vimwiki', 'synatax':'markdown', 'ext':'.md'}
"          \]

"automatic saving and loading of view details
" autocmd BufWinLeave *.jd mkview
" autocmd BufWinEnter *.jd silent loadview


"set up F2 to toggle paste indentation mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
" Create a custom key for inserting a datetime stamp
nmap <F3> o<C-R>=strftime("%Y-%m-%d %H:%M")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>
" Underline the current line with dashes
nnoremap <F4> yyp<c-v>$r-
inoremap <F4> <Esc>yyp<c-v>$r-A

"Define a keymap to report current syntax highlighting under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
