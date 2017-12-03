" LaTeX Quickrun
"if !exists("g:quickrun_config") 
"  let g:quickrun_config = {}
"endif
"let g:quickrun_config['tex'] = {
"\ 'command' : 'latexmk',
"\ 'outputter' : 'error',
"\ 'outputter/error/success' : 'null',
"\ 'outputter/error/error' : 'quickfix',
"\ 'srcfile' : expand("%"),
"\ 'cmdopt': '-pdfdvi',
"\ 'hook/sweep/files' : [
"\                      '%S:p:r.aux',
"\                      '%S:p:r.bbl',
"\                      '%S:p:r.blg',
"\                      '%S:p:r.dvi',
"\                      '%S:p:r.fdb_latexmk',
"\                      '%S:p:r.fls',
"\                      '%S:p:r.log',
"\                      '%S:p:r.out'
"\                      ],
"\}
"
"" 部分的に選択してコンパイル
"" http://auewe.hatenablog.com/entry/2013/12/25/033416 を参考に
"let g:quickrun_config.tmptex = {
"\   'exec': [
"\           'mv %s %a/tmptex.latex',
"\           'latexmk -pdfdvi -pv -output-directory=%a %a/tmptex.latex',
"\           ],
"\   'args' : expand("%:p:h:gs?\\\\?/?"),
"\   'outputter' : 'error',
"\   'outputter/error/error' : 'quickfix',
"\
"\   'hook/eval/enable' : 1,
"\   'hook/eval/cd' : "%s:r",
"\
"\   'hook/eval/template' : '\documentclass{jsarticle}'
"\                         .'\usepackage[dvipdfmx]{graphicx, hyperref}'
"\                         .'\usepackage{float}'
"\                         .'\usepackage{amsmath,amssymb,amsthm,ascmac,mathrsfs}'
"\                         .'\allowdisplaybreaks[1]'
"\                         .'\theoremstyle{definition}'
"\                         .'\newtheorem{theorem}{定理}'
"\                         .'\newtheorem*{theorem*}{定理}'
"\                         .'\newtheorem{definition}[theorem]{定義}'
"\                         .'\newtheorem*{definition*}{定義}'
"\                         .'\renewcommand\vector[1]{\mbox{\boldmath{\$#1\$}}}'
"\                         .'\begin{document}'
"\                         .'%s'
"\                         .'\end{document}',
"\
"\   'hook/sweep/files' : [
"\                        '%a/tmptex.latex',
"\                        '%a/tmptex.out',
"\                        '%a/tmptex.fdb_latexmk',
"\                        '%a/tmptex.log',
"\                        '%a/tmptex.aux',
"\                        '%a/tmptex.dvi'
"\                        ],
"\}
"
"vnoremap <silent><buffer> <F5> :QuickRun -mode v -type tmptex<CR>
"
"autocmd BufWritePost,FileWritePost *.tex QuickRun tex