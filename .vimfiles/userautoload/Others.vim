noremap j gj
noremap k gk
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap dd "*dd
vnoremap d "*d
nnoremap yy "*yy
vnoremap y "*y
nnoremap p "*p
vnoremap p "*p
noremap t :vsplit<CR>:terminal<CR>
nnoremap == gg=G
nnoremap <C-q> :call RunTerminal()<CR>
if has("nvim")
tnoremap <silent> <ESC> <C-\><C-n>
endif
syntax on

set number
set backspace=start,eol,indent
set incsearch
set wildmenu wildmode=longest:full:full
set nohlsearch
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [POS=%04l,%04v]
set tabstop=4
set shiftwidth=4
set expandtab
set clipboard+=unnamedplus
set nofoldenable
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp
set backupdir=~/.vimfiles/backup
set undodir=~/.vimfiles/undo
set noswapfile
set undofile
set backup
set list
set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%
set conceallevel=0
set timeout timeoutlen=50
set clipboard=unnamed,unnamedplus
let g:vim_json_syntax_conceal=0
let g:ctrlp_custom_ignore = 'node_modules/'
au FileType tex setlocal nocursorline
au FileType tex :NoMatchParen
autocmd BufRead,BufNewFile *.vert set filetype=c
autocmd BufRead,BufNewFile *.frag set filetype=c
autocmd BufRead,BufNewFile *.js set tabstop=4 shiftwidth=4
"autocmd BufRead,BufNewFile,BufWrite *.tex execute '!latexmk %'

nnoremap <silent><C-z> :call RunTerminal()<CR>

let g:markdown_composer_browser='chrome.exe'

function RunTerminal()
 let commands = {
       \ "cpp" : "g++ % && ./a.out",
       \ "c" : "gcc % && ./a.out",
       \ "python" : "python3 %",
       \ "rust": "cargo run",
       \ "d": "dub.exe"
       \}
 :vsplit
 :execute ":terminal " . commands[&filetype]
endfunction

if &compatible
    set nocompatible
endif

function Po()
    execute '!nohup php -S localhost:8080 &'
endfunction

command! Poyo call Po()
