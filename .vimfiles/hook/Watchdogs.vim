let g:watchdogs_check_CursorHold_enable = 1
let g:watchdogs_check_BufWritePost_enable = 1
if !exists("g:quickrun_config") 
  let g:quickrun_config = {}
endif
let g:quickrun_config["watchdogs_checker/_"] = {
      \ "hook/shabadoubi_touch_henshin/enable" : 1,
      \ "hook/shabadoubi_touch_henshin/wait" : 20,
      \ 'outputter' : 'error',
      \ 'outputter/error/error'   : 'quickfix',
      \ "outputter/buffer/split" : ":botright 8sp",
      \ 'outputter/buffer/close_on_empty' : 1,
      \ "runner" : "vimproc",
      \ "runner/vimproc/updatetime" : 10
      \}
let g:quickrun_config["javascript/watchdogs_checker"] = {
      \   "type" : "watchdogs_checker/eslint",
      \}
call watchdogs#setup(g:quickrun_config)

let s:hook = {
      \   "name" : "output",
      \   "kind" : "hook",
      \}

function! s:hook.on_output(session, context)
  let a:context.data = substitute(a:context.data, "\\", "/", "g")
  let a:context.data = substitute(a:context.data, "", "", "g")
endfunction

call quickrun#module#register(s:hook, 1)

augroup QfAutoCommands
  autocmd!
  " Auto-close quickfix window
  autocmd WinEnter * if (winnr('$') == 1) && (getbufvar(winbufnr(0), '&buftype')) == 'quickfix' | quit! | endif
augroup END

