nnoremap di :VBGstepIn<CR>
nnoremap do :VBGstepOver<CR>
nnoremap db :VBGstepOut<CR>
nnoremap dc :VBGcontinue<CR>
nnoremap dt :VBGtoggleBreakpointThisLine<CR>
nnoremap de :VBGevalWordUnderCursor<CR>
nnoremap ds :VBGstartGDBForD

let g:vebugger_breakpoint_text='●'
let g:vebugger_currentline_text='⇒'
let g:vebugger_view_source_cmd='edit'
