" # 2016/02/11
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2

" ファイル形式の検出を無効にする
filetype off
syntax on

" 0で行頭、9で行末
" こういうのは記号じゃなくて数字がいい
nnoremap 0 ^
nnoremap 9 $


" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/
 
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
 
" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

 
call neobundle#end()
 

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck


" おれおれ設定

"行数表示
set number

"対応する括弧表示しない
set noshowmatch

"コマンドラインの高さ
set cmdheight=1

"バックスペースで何でも消したい
set backspace=indent,eol,start

"タブバー常に表示
set showtabline=2

"タブ文字可視化
set list
set listchars=tab:>\ 

"swapファイル作らない
set noswapfile

"backupしない
set nobackup

"他で編集されたら読み込み直す
set autoread


" vim-scripts プラグイン

" github にないプラグイン

" ファイル形式検出、プラグイン、インデントを ON
filetype plugin indent on 

" 貼付け時の自動コメントアウトを防止
autocmd FileType * set formatoptions-=ro

"" neocomplecache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

 " Use smartcase.
 let g:neocomplcache_enable_smart_case = 1
 " Use camel case completion.
 let g:neocomplcache_enable_camel_case_completion = 1
 " Select with <TAB>
 inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

 let g:neocomplcache_ctags_arguments_list = {
   \ 'perl' : '-R -h ".pm"'
   \ }
let g:neocomplcache_snippets_dir = "~/.vim/snippets"
 " Define dictionary.
 let g:neocomplcache_dictionary_filetype_lists = {
     \ 'default'    : '',
     \ 'perl'       : $HOME . '/.vim/dict/perl.dict'
     \ }

 " Define keyword.
 if !exists('g:neocomplcache_keyword_patterns')
	   let g:neocomplcache_keyword_patterns = {}
   endif
   let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

   " for snippets
   imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
   smap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"

   imap <C-k>     <Plug>(neosnippet_expand_or_jump)

   smap <C-k>     <Plug>(neosnippet_expand_or_jump)

   xmap <C-k>     <Plug>(neosnippet_expand_target)


   " SuperTab like snippets behavior.

   imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: pumvisible() ? "\<C-n>" : "\<TAB>"

   smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: "\<TAB>"


   " For snippet_complete marker.
   if has('conceal')
	  set conceallevel=2 concealcursor=i
  endif
