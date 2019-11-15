noremap <silent> j gj
noremap <silent> k gk
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
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
set inccommand=split
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
set clipboard=unnamed,unnamedplus
let g:vim_json_syntax_conceal=0
let g:ctrlp_custom_ignore = 'node_modules/'
au FileType tex setlocal nocursorline
au FileType tex :NoMatchParen
autocmd BufRead,BufNewFile *.js set tabstop=2 shiftwidth=2
"autocmd BufRead,BufNewFile,BufWrite *.tex execute '!latexmk %'
autocmd BufNewFile *.d 0r $HOME/.vimfiles/template/template.d
autocmd BufRead *.md call s:MarkdownAction()
autocmd BufRead, *.vue set tabstop=2 shiftwidth=2
autocmd FileType json syntax match Comment +\/\/.\+$+

augroup QfAutoCommands
    autocmd!

    autocmd WinEnter * if (winnr('$') == 1) && (getbufvar(winbufnr(0), '&buftype')) == 'quickfix' | quit | endif
augroup END

autocmd BufRead,BufNewFile *.vert, *.frag set ft=glsl

function! s:is_number(str)
    return (type(a:str) == type(0)) || (a:str =~ '^\d\+$')
endfunction


function! s:winnrlist(...)
    return a:0
                \       ? range(1, tabpagewinnr(a:1, "$"))
                \       : range(1, tabpagewinnr(tabpagenr(), "$"))
endfunction


function! s:winlist(...)
    let tabnr = a:0 == 0 ? tabpagenr() : a:1
    return map(s:winnrlist(tabnr), '{
                \       "winnr" : v:val,
                \       "name"  : gettabwinvar(tabnr, v:val, "name")
                \   }')
endfunction


function! s:winnr(...)
    return a:0 == 0    ? winnr()
                \        : a:1 ==# "$" ? winnr("$")
                \        : a:1 ==# "#" ? winnr("#")
                \        : !s:is_number(a:1) ? (filter(s:winlist(), 'v:val.name ==# a:1') + [{'winnr' : '-1'}])[0].winnr
                \        : a:1
endfunction

function! s:winname(...)
    return a:0 == 0    ? s:winname(winnr())
                \        : a:1 ==# "$" ? s:winname(winnr("$"))
                \        : a:1 ==# "#" ? s:winname(winnr("#"))
                \        : !s:is_number(a:1) ? (filter(s:winlist(), 'v:val.name ==# a:1') + [{'name' : ''}])[0].name
                \        : (filter(s:winlist(), 'v:val.winnr ==# a:1') + [{'name' : ''}])[0].name
endfunction


function! s:split(cmd, name)
    let winnr = s:winnr(a:name)
    if winnr == -1
        silent execute a:cmd
        let w:name = a:name
    else
        silent execute winnr . "wincmd w"
    endif
endfunction

command! -count=0 -nargs=1 VSplit call s:split("vsplit", <q-args>) | if <count> | silent execute <count> | endif

function s:MarkdownAction()
    try
        :call jobstart(['hugo', 'server'])
    catch
        :ComposerStart
        :ComposerOpen
    endtry
endfunction

function SetQuickRunCommand()
    let l:file = expand('%')
    if &filetype == 'c' || &filetype == 'cpp'
        let g:quickrun_cmd = 'gcc ' . l:file . '; ./a.out'
    elseif &filetype == 'd'
        try
            :silent !dub describe
        catch
        endtry
        if v:shell_error == '0'
            let g:quickrun_cmd = 'dub'
        else
            let g:quickrun_cmd = 'rdmd ' . l:file
        endif
    elseif &filetype == 'purescript'
        let g:quickrun_cmd = 'pulp run'
    elseif &filetype == 'tex'
        let g:quickrun_cmd = ''
    elseif &filetype == 'python'
        let g:quickrun_cmd = 'python ' . l:file
    elseif &filetype == 'scala'
        let g:quickrun_cmd = 'sbt run'
    elseif &filetype == 'sh'
        let g:quickrun_cmd = 'sh ' . l:file
    endif
endfunction

function QuickRun()
    if !exists("g:quickrun_cmd")
        call SetQuickRunCommand()
    endif
    if !exists("g:quickrun_cmd")
        echo 'Command Not Found.'
        return
    endif
    :VSplit QuickRun
    exec ":terminal " . g:quickrun_cmd
endfunction

nnoremap <S-r> :call QuickRun()<CR>

if &compatible
    set nocompatible
endif
