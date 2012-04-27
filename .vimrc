" Pathogen
call pathogen#infect()

" Basic settigs
filetype plugin indent on
syntax enable

set autoread
set incsearch
set smartcase
set ignorecase
set backspace=indent,eol,start
set guioptions-=T
set guioptions-=r
set linebreak
set tabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
set nowrap
set history=1000
set undolevels=1000
set title
set visualbell
set noerrorbells

set backupdir=~/.vim/backup
set directory=~/.vim/swap

set go-=L

" Color scheme
if has('gui_running')
	set background=dark
	colorscheme jellybeans
	let g:jellybeans_use_lowcolor_black = 0
	set guifont=Monaco:h12
else
	set t_Co=256
	set background=dark
	colorscheme jellybeans
	let g:jellybeans_use_lowcolor_black = 0
	" colorscheme slate
	" set background=dark
endif

" Basic key mappings
nnoremap j gj
nnoremap k gk

nnoremap ; :
nnoremap : ;
inoremap jj <ESC>
inoremap jk <ESC>

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Printing (:hardcopy)
let g:prd_fontList="courier:h6,courier:h8,courier:h10,courier:h12,courier:h14,monaco:h6,monaco:h8,monaco:h10"

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <C-\> ;vsplit<CR>
map <C-]> ;split<CR>
map <D-\> ;vsplit<CR>
map <D-/> ;split<CR>

" Autocomplete with Ctrl-Space
inoremap <Tab> <C-x><C-o>
inoremap <Nul> <C-x><C-o>
inoremap <D-Space> <C-x><C-o>
inoremap <C-Space> <C-x><C-o>

" Highlight word under cursor
setl updatetime=500
:highlight CursorWord guibg=#404040
autocmd CursorHold * silent! exe printf('match CursorWord /\<%s\>/', expand('<cword>'))

" Text modifiers
" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction

" Yankring
nnoremap <silent> <F3> :YRShow<CR>
inoremap <silent> <F3> <ESC>:YRShow<cr>

" Java
autocmd Filetype java setlocal omnifunc=javacomplete#Complete

" VimClojure
au BufNewFile,BufRead *.clj* set filetype=clojure
au BufNewFile,BufRead *.clj*  call PareditInitBuffer()

autocmd filetype clojure set number

let vimclojure#WantNailgun=1
let vimclojure#NailgunClient="/Users/phil/bin/ng"

let vimclojure#HighlightBuiltins=1
let vimclojure#ParenRainbow=0

" VimClojure key mappings
autocmd filetype clojure nmap § <Plug>ClojureStartLocalRepl
autocmd filetype clojure nmap ` <Plug>ClojureStartLocalRepl
autocmd filetype clojure nmap <F1> <Plug>ClojureDocLookupWord
autocmd filetype clojure nmap <silent> <ESC> <Plug>ClojureCloseResultBuffer
autocmd filetype clojure nmap <F4> ;update<CR><Plug>ClojureRequireFile
autocmd filetype clojure nmap <F6> ;update<CR><Plug>ClojureRequireFile<Plug>ClojureRunTests
autocmd filetype clojure nmap <D-r> ;update<CR><Plug>ClojureRequireFileAll

" Lispwords
autocmd filetype clojure setlocal lispwords+=deftest

" Aleph
autocmd filetype clojure nmap <F5> ;update<CR><Plug>ClojureRequireFile<Plug>ClojureStartLocalRepl<CR>(use 'tellme.core)<CR>(tellme.core/restart)<CR>,close<CR>

" diff 
" set foldmethod=expr
" set foldexpr=getline(v:lnum)!~'^diff\ '
" set foldexpr=(getline(v:lnum)=~'^diff\ ')?'<1':'1'

" Erlang
let g:erlangManPath="/usr/local/lib/erlang/man"
let g:erlangWranglerPath="/usr/local/share/wrangler/"
" let g:erlangCompletionGrep="zgrep"
" let g:erlangManSuffix="erl\.gz"

let g:erlangCompleteFile="$HOME/.vim/vimerl/autoload/erlang_complete.erl"
let g:erlangCheckFile="$HOME/.vim/vimerl/compiler/erlang_check.erl"

" mochiweb
noremap <C-F5> ;! cd .. && ./rebar compile<CR><CR>
noremap <M-F5> ;! cd .. && ./rebar compile<CR><CR>

" CodeReview
let g:CodeReviewer_reviewer="pk"
let g:CodeReviewer_reviewFile="review.rev"

" markdown
map <leader>md ;Mm<Cr>
