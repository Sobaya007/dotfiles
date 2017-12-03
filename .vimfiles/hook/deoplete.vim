let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 10000

inoremap <expr><tab> pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"

let g:deoplete#sources#d#dcd_server_autostart = 1
let g:deoplete#sources#d#dcd_client_binary=g:cache_home . '/dein/repos/github.com/dlang-community/DCD/dcd-client'
let g:deoplete#sources#d#dcd_server_binary=g:cache_home . '/dein/repos/github.com/dlang-community/DCD/dcd-server'