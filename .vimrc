"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  " XDG base direcory compartible
  let g:dein#cache_directory = $HOME . '/.cache/dein'

  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " ~~~ ここからtomlファイルを利用するための設定 ~~~
  " 導入するプラグインを記載したtomlファイルのパスを記載する
   let s:toml_dir  = $HOME . '/.vim/rc' 
   let s:toml      = s:toml_dir . '/dein.toml'
   let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'
  
   " tomlファイルをキャッシュしておくための記述
   call dein#load_toml(s:toml,      {'lazy': 0})
   call dein#load_toml(s:lazy_toml, {'lazy': 1})
  " ~~~ tomlのための設定はここまで ~~~

  " Required:
  call dein#end()
  call dein#save_state()

" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
" }}}
 
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if  dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

"Required:
filetype plugin indent on
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.

"vimの設定などなど
"行番号の表示
set number

"Tabを半角スペースに変換
set expandtab

"行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4

"行頭でのTab文字の表示幅
set shiftwidth=4

"画面右端に行列番号
set ruler

"コードの色分け
colorscheme molokai

"autoindentを有効にする
set autoindent 
set nocompatible

"j,kを押下した時の速度を早くするプラグイン
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

"ターミナル設定
set splitbelow
set termwinsize=7x0

set belloff=all
