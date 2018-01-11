"NeoBundle Scripts-----------------------------
if has('vim_starting')
  " Required:
  set runtimepath+=/Users/phil/.config/nvim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/phil/.config/nvim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'vim-syntastic/syntastic'
NeoBundle 'raichoo/purescript-vim'
NeoBundle 'frigoeu/psc-ide-vim'
" NeoBundle 'Shougo/neosnippet.vim'
" NeoBundle 'Shougo/neosnippet-snippets'
" NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
" NeoBundle 'flazz/vim-colorschemes'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

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

set hidden

set clipboard=unnamed

set tags=./tags;

set go-=L

" Trailing spaces
set list listchars=tab:»·,trail:·

set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

" Color scheme
" if has('gui_running')
"   set background=dark
"   colorscheme zenburn
"   " set guifont=DejaVuSansMono:h14
"   " set guifont=DejaVuSansMono:h14
"   set guifont=Source\ Code\ Pro:h13
" else
"   set t_Co=256
"   set background=dark
"   colorscheme zenburn
" endif

" Disable Ex mode
map Q <Nop>

" Basic key mappings
let maplocalleader='-'
let mapleader = "\<Space>"

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

" Scroll left and right
map L 20zl
map H 20zh

" Automatically jump to end of text you pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Quickly select text you just pasted
noremap gV `[v`]

" Stop that stupid window from popping up
map q: :q

" nnoremap <Leader>i :tabnext<CR>
" nnoremap <Leader>o :tabprev<CR>
" nnoremap <Leader>t :tabnew<CR>

" Quickfix
map <F10> ;ccl<CR>
map <F11> ;cprev<CR>
map <F12> ;cnext<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

" Highlight word under cursor
setl updatetime=500
if has('gui_running')
  " highlight CursorWord guibg=#eee8d5
  highlight CursorWord guibg=#404040
else
  highlight CursorWord guibg=#404040
endif
" autocmd CursorHold * silent! exe printf('match CursorWord /\<%s\>/', expand('<cword>'))
autocmd CursorHold * exe printf('match CursorWord /\V\<%s\>/', escape(expand('<cword>'), '/\'))
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <C-\> ;vsplit<CR>
map <C-_> ;split<CR>

" Autosave after updatetime in normal mode
" au CursorHold * :update

" Haskell
au filetype haskell inoremap ^OR <C-v>u2228
au filetype haskell inoremap ^AND <C-v>u2227
au filetype haskell inoremap ^UNION <C-v>u222a
au filetype haskell inoremap ^INTERSECT <C-v>u2229
au filetype haskell inoremap ^ELEM <C-v>u2208
au filetype haskell inoremap ^SUM <C-v>u2211
au filetype haskell inoremap ^PROD <C-v>u2210

au filetype haskell inoremap ^lambda λ
au filetype haskell inoremap ^omega ω
au filetype haskell inoremap ^rho ρ
au filetype haskell inoremap ^sigma σ
au filetype haskell inoremap ^merge ⤚
au filetype haskell inoremap ^arrout ↖
au filetype haskell inoremap ^arrin ↪
au filetype haskell inoremap ^arr →
au filetype haskell inoremap ^eq ≈
au filetype haskell inoremap ^neq ≠
au filetype haskell inoremap ^... …

au filetype haskell map <LocalLeader>t :GhcModType<CR>
au filetype haskell map <LocalLeader>c :GhcModTypeClear<CR>
au filetype haskell setlocal omnifunc=necoghc#omnifunc

au filetype haskell map <silent> <LocalLeader>s :Rgrep<CR><CR><C-u>.<CR><CR><CR>
au filetype haskell map <silent> <LocalLeader>i :Rgrep<CR><C-u>instance .*<C-r><C-w><CR><C-u>.<CR><CR>

au filetype haskell map <silent> <LocalLeader>l GhcModLint

" au BufWritePost *.hs GhcModCheckAndLintAsync
au BufWritePost *.hs :silent !hasktags --ignore-close-implementation --ctags . &

au filetype haskell setlocal softtabstop=2
au filetype haskell setlocal tabstop=2
au filetype haskell setlocal shiftwidth=2
au filetype haskell setlocal expandtab
" au filetype haskell setlocal colorcolumn=80

" pretty print Show instances
command! PprintShow %!ppsh
command! PprintShow2 %!hsformat

" match parens correctly
au filetype haskell setlocal cpoptions+=M

" Purescript
nm <buffer> <silent> <leader>t :<C-U>call PSCIDEtype(PSCIDEgetKeyword(), v:true)<CR>
nm <buffer> <silent> <leader>T :<C-U>call PSCIDEaddTypeAnnotation(matchstr(getline(line(".")), '^\s*\zs\k\+\ze'))<CR>
nm <buffer> <silent> <leader>s :<C-U>call PSCIDEapplySuggestion()<CR>
nm <buffer> <silent> <leader>a :<C-U>call PSCIDEaddTypeAnnotation()<CR>
nm <buffer> <silent> <leader>i :<C-U>call PSCIDEimportIdentifier(PSCIDEgetKeyword())<CR>
nm <buffer> <silent> <leader>r :<C-U>call PSCIDEload()<CR>
nm <buffer> <silent> <leader>p :<C-U>call PSCIDEpursuit(PSCIDEgetKeyword())<CR>
nm <buffer> <silent> <leader>C :<C-U>call PSCIDEcaseSplit("!")<CR>
nm <buffer> <silent> <leader>f :<C-U>call PSCIDEaddClause("")<CR>
nm <buffer> <silent> <leader>qa :<C-U>call PSCIDEaddImportQualifications()<CR>
nm <buffer> <silent> ]d :<C-U>call PSCIDEgoToDefinition("", PSCIDEgetKeyword())<CR>
