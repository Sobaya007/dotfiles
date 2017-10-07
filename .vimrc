if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim/
set runtimepath^=~/.vimfiles
call dein#begin(expand('~/.cache/dein'))
call dein#add('Shougo/neocomplcache')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/vimproc', {'build' : 'make'})
call dein#add('scrooloose/nerdtree')
call dein#add('airblade/vim-gitgutter')
call dein#add('tomasr/molokai')
call dein#add('itchyny/lightline.vim')
call dein#add('majutsushi/tagbar')
call dein#add('thinca/vim-quickrun')
call dein#add('osyo-manga/shabadou.vim')
call dein#add('osyo-manga/vim-watchdogs')
call dein#add('tpope/vim-fugitive')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('mattn/benchvimrc-vim')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('cohama/agit.vim')
call dein#add('idanarye/vim-merginal')
call dein#add('AndrewRadev/gapply.vim')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('rust-lang/rust.vim')
call dein#add('yegappan/grep')
call dein#add('othree/yajs.vim')
call dein#add('tomtom/tcomment_vim')
call dein#add('jceb/vim-hier')
call dein#end()

filetype plugin indent on
runtime! userautoload/*.vim

colorscheme molokai
set t_Co=256

if dein#check_install()
  call dein#install()
endif
