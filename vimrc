"Core Settings
    set modelines=0           "File content shld not change vim settings
    set nocompatible          "Don't try to be vi compatible
    filetype off              "Turned on again below
    syntax on                 "Enable syntax highlighting
    filetype plugin indent on "For plugins to load correctly
    set encoding=utf-8        "Text encoding
    set hidden                "Allow hidden buffers
    set ttyfast               "faster scrolling behavior
    let mapleader = " "
    let maplocalleader = ","


"Plugins
    call plug#begin('~/.vim/plugged') "Invoke the vim-plug addon

    ""New commands and behaviors
    Plug 'tpope/vim-surround'  "adds cs,ys,ds cmds for 'surrounders'
    Plug 'tpope/vim-commentary' "adds gc cmd for commentify
    Plug 'tpope/vim-repeat' "make other plugins repeatable with . cmd
    Plug 'tpope/vim-speeddating' "add date manip cmds
    Plug 'vim-scripts/ReplaceWithRegister' "add gr cmd replace targ with buffer content 
    Plug 'christoomey/vim-titlecase' "add gt cmd for title case 
    Plug 'christoomey/vim-system-copy' "add cp,cv cut/paste cmds to sys clipbd
    Plug 'christoomey/vim-tmux-navigator' "mk tmux treat vim splits as panes
    Plug 'itchyny/lightline.vim' "better status line
    Plug 'aserebryakov/vim-todo-lists' "local todo files
    Plug 'farfanoide/vim-kivy' "syntax hiltng for kivy files
    Plug 'stevearc/vim-arduino' "commands and keys for editing Arduino .ino


    ""New noun blocks for vim editing cmds 
    Plug 'michaeljsmith/vim-indent-object' "indented lines
    Plug 'kana/vim-textobj-user' "utility for the plugins that follow 
    Plug 'kana/vim-textobj-entire' "entire file
    Plug 'kana/vim-textobj-line' "entire full line
    Plug 'jeetsukumaran/vim-pythonsense' "Python blocks
    Plug 'reedes/vim-textobj-sentence' "English sentence
    Plug 'lervag/vimtex' "a syntax and motions plugin for latex files

    ""UI
    Plug 'reedes/vim-pencil' "handling soft wrap, markup displays, etc.
    Plug 'reedes/vim-colors-pencil' "nice colors for markdown elements
    "Plug 'vim-airline/vim-airline' "a sexy status line for vim sessions
    "Plug 'azadkuh/vim-cmus' "control cmus music player from inside vim
    "Plug 'felixhummel/setcolors.vim' "a tool for previewing vim color schemes
    
    ""Plug 'ap/vim-templates' "create template system for init'ing new files

    "FileType highlighting
    Plug 'tpope/vim-markdown' " a good markdown handler
    Plug 'Jefficus/vim-jeffdown' "jeffdown files
    Plug 'neomutt/neomutt.vim' "neomutt
    Plug 'elzr/vim-json' "json
    " Plug 'chrisbra/csv.vim' "csv
    Plug 'dbmrq/vim-ditto' "highlight over-used words

    Plug 'pseewald/vim-anyfold' "alternative to fold method = indent
    " Plug 'agateau/yokadi', {'as': 'vim-yokadi', 'rtp': 'editors/vim'}
    Plug 'kblin/vim-fountain' "for editing fountain-format scripts

    call plug#end()


   "Overrides and extensions for included plugins
   let g:markdown_syntax_conceal = 0 "Do not hide markdown symbols
   let g:templates_empty_files = 1 "Add templates to existing empty files


   "Turn on the vim-pencil prose editing features
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

   "Enable anyfold for md files, jd files, and vimrc
   augroup anyfolds
       autocmd!
       autocmd filetype todo,python,markdown,mkd,md,jd,vim,kv AnyFoldActivate 
       autocmd filetype python,todo set foldlevel=99
       autocmd filetype markdown,mkd,md,jd,vim,kv set foldlevel=99 
   augroup END
   
   "set the proper commenting style for Kivy
   autocmd FileType kv,spec setlocal commentstring=#\ %s

   "Disable spell and ditto checks if the file is opened in yokadi
   augroup yokadi
       autocmd!
       autocmd BufRead,BufNewFile /tmp/yokadi-* set nospell
       autocmd BufRead,BufNewFile /tmp/yokadi-* :NoDitto
   augroup END

   "Keybindings for the cmus controls
   nnoremap <leader>b :CmusNext<cr>
   nnoremap <leader>c :CmusPause<cr>
   nnoremap <leader>i :CmusCurrent<cr>
   nnoremap <leader>v :CmusStop<cr>
   nnoremap <leader>x :CmusPlay<cr>
   nnoremap <leader>z :CmusPrevious<cr>

   " should probably only do these things for jeffdown files
   set breakindent "indent lines of a pgph to match first line
   nnoremap <leader>[ :call CommentParagraph();<cr>
   nnoremap <leader>] :call CommentRemainderParagraph();<cr>


"Personal abbreviations
    iabbrev jat jeff@smithicus.com
    iabbrev --- —
    iabbrev teh the


"Custom Bindings
    nnoremap <leader>ev :vsplit $MYVIMRC<cr>
    nnoremap <leader>sv :source $MYVIMRC<cr>

    "Cursor motion
    set scrolloff=1                "overlap 1 line when paging up/down
    set backspace=indent,eol,start "fix BS key in insert mode
    set matchpairs+=<:>            "use % to jump between pairs
    runtime! macros/matchit.vim

    "Fix up/down keys when lines are wrapped
    nnoremap j gj
    nnoremap k gk

    "Set H to previous buffer and L to next buffer
    "which matches next/prev behavior in qutebrowser
    nnoremap H :bp<cr>
    nnoremap L :bn<cr>
    
    "Remap help key.
    inoremap <F1> <ESC>:set invfullscreen<CR>a
    nnoremap <F1> :set invfullscreen<CR>
    vnoremap <F1> :set invfullscreen<CR>
    
    "Disable stupid macro recording feature
    map q <Nop>  
   
    "Reformat paragraph wrapping
    noremap <leader>q gqip

    "Toggle display of newlines and EOLs
    noremap <leader>l :set list!<CR>

    "set up F2 to toggle paste indentation mode
    nnoremap <F2> :set invpaste paste?<CR>
    set pastetoggle=<F2>

    "Create a custom key for inserting a datetime stamp
    nmap <F3> o<C-R>=strftime("%Y-%m-%d %H:%M")<CR><Esc>
    imap <F3> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>
    "Underline the current line with dashes
    nnoremap <F4> yyp<c-v>$r-
    inoremap <F4> <Esc>yyp<c-v>$r-A


"Colors
    colorscheme slate "so far, I actually like the default best
    "Override syntax colors for some things that bug me
    highlight Search cterm=NONE ctermfg=White ctermbg=NONE
    highlight jeffdownItalic cterm=NONE ctermfg=White ctermbg=NONE
    highlight jeffdownBold cterm=NONE ctermfg=White ctermbg=NONE

    ""Make spelling error style use underlines instead of bgcol
    hi clear SpellCap
    hi SpellCap cterm=underline ctermfg=Blue ctermbg=NONE
    hi clear SpellBad
    hi SpellBad cterm=underline ctermfg=Red ctermbg=NONE
    hi clear SpellLocal
    hi SpellLocal cterm=underline ctermfg=Cyan ctermbg=NONE
    hi clear SpellRare
    hi SpellRare cterm=underline ctermfg=Magenta ctermbg=NONE
    hi clear Function
    hi Function ctermfg=172 ctermbg=NONE  "orange
    hi clear Constant
    hi Constant ctermfg=164 ctermbg=NONE  "magenta
    
    " These currently don't work
    " autocmd Filetype markdown hi htmlBold ctermbg=NONE
    " autocmd Filetype markdown hi htmlItalic ctermbg=NONE


"Spacing
    set helpheight=40 "Make help window bigger
    set textwidth=65
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set expandtab
    set wrap
    set shiftround


"Spelling and grammar highlighting
    set spelllang=en
    set spellfile=$HOME/.vim/en.utf-8.add
     
    "Recompute spell file if wordlist has been updated externally
    for d in glob('~/.vim/*.add', 1, 1)
        if filereadable(d) && (!filereadable(d . '.spl') || getftime(d) > getftime(d . '.spl'))
            exec 'mkspell! ' . fnameescape(d)
        endif
    endfor

   "Enable spell checking for prose text files
   augroup prose_keys
       autocmd!
       au FileType markdown,jeffdown,text,tex set spell
       au FileType markdown,jeffdown,text,tex DittoOn
   augroup END

   "Enable some features for CSV files
   augroup csv_files
       autocmd!
       au FileType csv set number set nowrap
   augroup END

   nnoremap <buffer> <localleader>s :set spell!<cr>
   nnoremap <buffer> <localleader>d :ToggleDitto<cr>
   nnoremap <buffer> <localleader>f :AnyFoldActivate<cr>

"UI
    set nonumber      "Disable line numbers
    set ruler         "Show file stats
    set visualbell    "Blink cursor on error instead of beep (grr)
    set laststatus=2  "Status bar height
    set showmode      "Show edit mode in status area
    set showcmd       "Show last command in status area
    set showmatch     "Jump briefly to highlight matching brace


"Searching
    set noincsearch  "disable incremental searching (I hate it)
    set hlsearch     "highlight all occurances of search term
    set ignorecase   "search case-insensitive
    set smartcase    "disable case-insensitive if caps in search term
    
    "Clear search term highlights with <spc><spc>
    noremap <leader><space> :let @/=''<CR>


"Custom Functions/Cmds
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



"Experiments (try 'em here before moving them into perm location)
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
