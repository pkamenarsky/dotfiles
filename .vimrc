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
set guioptions-=e
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

set clipboard=unnamed

set tags=./tags;

set go-=L

" Color scheme
if has('gui_running')
	set background=light
	colorscheme solarized
	" set guifont=DejaVuSansMono:h14
	set guifont=Monaco:h13
else
	set t_Co=256
	set background=light
	colorscheme solarized
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

" Save
imap <F2> <C-o>;update<CR>
nmap <F2> ;update<CR>

" Quickfix
map <F11> ;cprev<CR>
map <F12> ;cnext<CR>

" CtrlP
let g:ctrlp_map = '<c-t>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,node_modules,dist
nmap <F5> ;CtrlPClearCache<CR>
" nmap <C-f> ;CtrlPTag<CR>
nmap <C-f> ;CtrlPTag<CR>

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
map <C-_> ;split<CR>

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
autocmd filetype coffee setlocal nonumber
autocmd filetype coffee setlocal softtabstop=2
autocmd filetype coffee setlocal tabstop=2
autocmd filetype coffee setlocal shiftwidth=2
autocmd filetype coffee setlocal expandtab
autocmd filetype coffee setlocal colorcolumn=80

" json
command! PprintJson %!python -m json.tool

" Ruby
autocmd filetype ruby setlocal nonumber
autocmd filetype ruby setlocal softtabstop=2
autocmd filetype ruby setlocal tabstop=2
autocmd filetype ruby setlocal shiftwidth=2
autocmd filetype ruby setlocal expandtab
autocmd filetype ruby setlocal colorcolumn=80

" Handlebars
autocmd filetype hbs setlocal nonumber
autocmd filetype hbs setlocal softtabstop=2
autocmd filetype hbs setlocal tabstop=2
autocmd filetype hbs setlocal shiftwidth=2
autocmd filetype hbs setlocal expandtab
autocmd filetype hbs setlocal colorcolumn=80

" less
autocmd filetype less setlocal nonumber
autocmd filetype less setlocal softtabstop=2
autocmd filetype less setlocal tabstop=2
autocmd filetype less setlocal shiftwidth=2
autocmd filetype less setlocal expandtab
autocmd filetype less setlocal colorcolumn=80

" JS
autocmd filetype javascript setlocal nonumber
autocmd filetype javascript setlocal softtabstop=2
autocmd filetype javascript setlocal tabstop=2
autocmd filetype javascript setlocal shiftwidth=2
autocmd filetype javascript setlocal expandtab
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
" au BufEnter *.hs compiler ghc
au filetype haskell let g:haddock_browser = "open"
au filetype haskell let g:haddock_browser_callformat = "%s %s"
au filetype haskell let g:ghc = "/usr/bin/ghc"
au filetype haskell let g:necoghc_enable_detailed_browse = 1

au filetype haskell let Grep_Default_Options = '-w'
au filetype haskell let Grep_Skip_Dirs = 'build cabal-dev dist src-exe doc .git .hg'
au filetype haskell let Grep_Default_Filelist = '*.hs'

au filetype haskell map <LocalLeader>t :GhcModType<CR>
au filetype haskell map <LocalLeader>c :GhcModTypeClear<CR>
au filetype haskell setlocal omnifunc=necoghc#omnifunc

au filetype haskell map <silent> <LocalLeader>s :Rgrep<CR><CR><C-u>.<CR><CR>
au filetype haskell map <silent> <LocalLeader>i :Rgrep<CR><C-u>instance .*<C-r><C-w><CR><C-u>.<CR><CR>

au BufWritePost *.hs GhcModCheckAndLintAsync
au BufWritePost *.hs ;!hasktags --ignore-close-implementation --ctags .; sort tags -o tags &

au BufNewFile,BufRead *.hs map <buffer> <F1> :Hoogle
au BufNewFile,BufRead *.hs map <buffer> <C-F1> :HoogleClose<CR>
au BufNewFile,BufRead *.hs map <buffer> <S-F1> :HoogleLine<CR>

au filetype haskell setlocal softtabstop=4
au filetype haskell setlocal tabstop=4
au filetype haskell setlocal shiftwidth=4
au filetype haskell setlocal expandtab
au filetype haskell setlocal colorcolumn=80

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

