" OS
let OS = substitute(system('uname'), "\n", "", "")

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
	set background=light
	colorscheme solarized
	let g:jellybeans_use_lowcolor_black = 0
	" set guifont=DejaVuSansMono:h14
	set guifont=Monaco:h13
else
	set t_Co=256
	set background=dark
	colorscheme jellybeans
	let g:jellybeans_use_lowcolor_black = 0
	" colorscheme slate
	" set background=dark
endif

" Disable Ex mode
map Q <Nop>

" Basic key mappings
let maplocalleader='-'

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap ; :
nnoremap :: ;
inoremap jj <ESC>
inoremap jk <ESC>

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" CtrlP
let g:ctrlp_map = '<c-t>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,node_modules,dist
nmap <F5> ;CtrlPClearCache<CR>

" Sessions
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

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
inoremap <Nul> <C-x><C-o>
inoremap <D-Space> <C-x><C-o>
inoremap <C-Space> <C-x><C-o>

" Highlight word under cursor
setl updatetime=500
if has('gui_running')
	highlight CursorWord guibg=#eee8d5
else
	highlight CursorWord guibg=#404040
endif
" autocmd CursorHold * silent! exe printf('match CursorWord /\<%s\>/', expand('<cword>'))
autocmd CursorHold * exe printf('match CursorWord /\V\<%s\>/', escape(expand('<cword>'), '/\'))

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

let vimclojure#WantNailgun=1

" ng binary differs between Linux and MacOS
if OS == "Linux"
let vimclojure#NailgunClient=expand("$HOME/bin/ng-linux")
else
let vimclojure#NailgunClient=expand("$HOME/bin/ng")
endif

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

" HTML
autocmd filetype html setlocal softtabstop=2
autocmd filetype html setlocal tabstop=2
autocmd filetype html setlocal shiftwidth=2
autocmd filetype html setlocal expandtab

" CoffeeScript
autocmd filetype coffee setloca softtabstop=2
autocmd filetype coffee setloca tabstop=2
autocmd filetype coffee setloca shiftwidth=2
autocmd filetype coffee setloca expandtab
autocmd filetype coffee setlocal colorcolumn=80

" JS
autocmd filetype javascript setloca softtabstop=2
autocmd filetype javascript setloca tabstop=2
autocmd filetype javascript setloca shiftwidth=2
autocmd filetype javascript setloca expandtab
autocmd filetype javascript setlocal colorcolumn=80

" Erlang
autocmd filetype erlang let g:erlangManPath="/usr/local/lib/erlang/man"
autocmd filetype erlang let g:erlangWranglerPath="/usr/local/share/wrangler/"

autocmd filetype erlang let g:erlangCompleteFile="$HOME/.vim/vimerl/autoload/erlang_complete.erl"
autocmd filetype erlang let g:erlangCheckFile="$HOME/.vim/vimerl/compiler/erlang_check.erl"

" mochiweb
autocmd filetype erlang noremap <C-F5> ;! cd .. && ./rebar compile<CR><CR>
autocmd filetype erlang noremap <M-F5> ;! cd .. && ./rebar compile<CR><CR>
autocmd filetype erlang nmap <F7> ;update<CR>;Shell make test<CR>

" Haskell
au BufEnter *.hs compiler ghc
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"
let g:ghc = "/usr/bin/ghc"

map <LocalLeader>r :GHCi 

au BufNewFile,BufRead *.hs map <buffer> <F1> :Hoogle
au BufNewFile,BufRead *.hs map <buffer> <C-F1> :HoogleClose<CR>
au BufNewFile,BufRead *.hs map <buffer> <S-F1> :HoogleLine<CR>

autocmd filetype haskell setlocal softtabstop=4
autocmd filetype haskell setlocal tabstop=4
autocmd filetype haskell setlocal shiftwidth=4
autocmd filetype haskell setlocal expandtab
autocmd filetype haskell setlocal colorcolumn=80

" Python
autocmd filetype python setlocal number
autocmd filetype python setlocal expandtab
autocmd filetype python setlocal tabstop=2
autocmd filetype python setlocal shiftwidth=2
autocmd filetype python setlocal colorcolumn=80
autocmd filetype python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Google translate
let g:goog_user_conf = { 'langpair': 'de|en', 'v_key': 'T' }

" markdown
map <leader>md ;Mm<Cr>

" :Shell command
let s:_ = ''

function! s:ExecuteInShell(command, bang)
	let _ = a:bang != '' ? s:_ : a:command == '' ? '' : join(map(split(a:command), 'expand(v:val)'))

	if (_ != '')
		let s:_ = _
		let bufnr = bufnr('%')
		let winnr = bufwinnr('^' . _ . '$')
		silent! execute  winnr < 0 ? 'belowright new ' . fnameescape(_) : winnr . 'wincmd w'
		setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile wrap number
		silent! :%d
		let message = 'Execute ' . _ . '...'
		call append(0, message)
		echo message
		silent! 2d | resize 1 | redraw
		silent! execute 'silent! %!'. _
		silent! execute 'resize ' . line('$')
		silent! execute 'syntax on'
		silent! execute 'autocmd BufUnload <buffer> execute bufwinnr(' . bufnr . ') . ''wincmd w'''
		silent! execute 'autocmd BufEnter <buffer> execute ''resize '' .  line(''$'')'
		silent! execute 'nnoremap <silent> <buffer> <CR> :call <SID>ExecuteInShell(''' . _ . ''', '''')<CR>'
		silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . _ . ''', '''')<CR>'
		silent! execute 'nnoremap <silent> <buffer> <LocalLeader>g :execute bufwinnr(' . bufnr . ') . ''wincmd w''<CR>'
		nnoremap <silent> <buffer> <C-W>_ :execute 'resize ' . line('$')<CR>
		silent! syntax on
	endif
endfunction

command! -complete=shellcmd -nargs=* -bang Shell call s:ExecuteInShell(<q-args>, '<bang>')
cabbrev shell Shell

