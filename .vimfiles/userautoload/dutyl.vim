let g:dutyl_stdImportPaths=['/D/dmd2/src/phobos', '/D/dmd2/src/druntime/import']
let g:dutyl_tagsFileName='tags'
call dutyl#register#tool('dcd-client', g:cache_home . '/dein/repos/github.com/dlang-community/DCD/dcd-client.exe')
call dutyl#register#tool('dcd-server', g:cache_home . '/dein/repos/github.com/dlang-community/DCD/dcd-server.exe')
