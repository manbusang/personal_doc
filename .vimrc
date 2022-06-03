set ignorecase
syntax enable
syntax on 
set cursorline           " highlight the cursor line
set showcmd 
set ruler                " show the cursor position
set laststatus=2         " show the status bar
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
set smartindent
set number
"set relativenumber
set hlsearch

set wildmenu             " vim自身命名行模式智能补全
set completeopt-=preview " 补全时不显示窗口，只显示补全列表

nnoremap <C-a> ^
nnoremap <esc><esc> :noh<return>

call plug#begin('~/.vim/plugged')
let g:plug_url_format = 'git@github.com:%s.git'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'liuchengxu/space-vim-dark'
Plug 'rakr/vim-one'
Plug 'sheerun/vim-polyglot'
Plug 'skywind3000/vim-auto-popmenu'
Plug 'skywind3000/vim-dict'
Plug 'preservim/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'kien/rainbow_parentheses.vim'
Plug 'chxuan/change-colorscheme'
"Plug 'jayli/vim-easycomplete'
"Plug 'SirVer/ultisnips'
call plug#end()


"colorscheme space-vim-dark
colorscheme one 

"colorscheme material
"let g:material_terminal_italics = 1
"let g:material_theme_style = 'darker' "'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
set termguicolors
"set t_Co=256

"=============== leaderF =================
"shortcurt key for find files. it's ctrl+p
"let g:Lf_CommandMap = {'<C-P>': ['<C-R>']}
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_RootMarkers = ['.repo','.git', '.svn', '.hg', '.project', '.root']
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
let g:Lf_PreviewCode = 1
let g:Lf_PreviewInPopup = 1 
let g:Lf_PreviewResult = {
        \ 'File': 1,
        \ 'Buffer': 1,
        \ 'Mru': 1,
        \ 'Tag': 0,
        \ 'BufTag': 1,
        \ 'Function': 0,
        \ 'Line': 1,
        \ 'Colorscheme': 0,
        \ 'Rg': 1,
        \ 'Gtags': 1 
        \}

" search word under cursor, the pattern is treated as regex, and enter normal mode directly. it's ctrl+f
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
"preview function list
noremap <F2> :LeaderfFunction!<cr>
" <leader> = \
noremap <C-m> :Leaderf mru<cr>
noremap <C-b> :Leaderf buffer<cr>
noremap <C-g> :Leaderf gtags --update<cr>
noremap <C-]> :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>



"============== NERDTree =================
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-e> :NERDTree<CR>
nnoremap <C-e> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
:let g:NERDTreeWinSize=40

"=============auto popup menu
" 设定需要生效的文件类型，如果是 "*" 的话，代表所有类型
let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1, 'c':1}
" 设定从字典文件以及当前打开的文件里收集补全单词，详情看 ':help cpt'
set cpt=.,k,w,b
" 不要自动选中第一个选项。
set completeopt=menu,menuone,noselect
" 禁止在下方显示一些啰嗦的提示
set shortmess+=c

"====tabbar test ========
"==== buf explorer ========
"let g:bufExplorerDefaultHelp=0       " Do not show default help.
"let g:bufExplorerShowRelativePath=1  " Show relative paths.
"let g:bufExplorerSortBy='mru'        " Sort by most recently used.
"let g:bufExplorerSplitRight=1        " Split left.
"let g:bufExplorerUseCurrentWindow=1  " Open in new window.
"let g:bufExplorerDisableDefaultKeyMapping =0 " Do not disable default key mappings.
"==== leader commenter ========
:map <C-z> <plug>NERDCommenterToggle
let g:NERDCustomDelimiters = { 'c': { 'left': '//'} }

"===========colorpairs ===============
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"==== easymotion ========
nmap ss <Plug>(easymotion-s2)

"=== ycm =========
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion = ['<Up>']

"let g:ycm_goto_buffer_command = 'horizontal-split'
"let g:ycm_server_python_interpreter='/usr/bin/python3'
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"let g:airline#extensions#tabline#enabled = 0 
"let g:ycm_seed_identifiers_with_syntax = 1
"let g:ycm_complete_in_strings = 1
"let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_complete_in_comments = 1
"let g:ycm_min_num_of_chars_for_completion = 2
"let g:ycm_cache_omnifunc=0
"let g:ycm_confirm_extra_conf=0

"let g:ycm_add_preview_to_completeopt = 1
"let g:ycm_show_diagnostics_ui = 0
"let g:ycm_server_log_level = 'info'
"let g:ycm_min_num_identifier_candidate_chars = 2
"let g:ycm_collect_identifiers_from_comments_and_strings = 1
""let g:ycm_key_invoke_completion = '<c-l>'
"set completeopt=menu,menuone

"noremap <c-l> <NOP>

"let g:ycm_semantic_triggers =  {
  "\   'c' : ['->', '.', 're!\w{2}'],
  "\   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  "\             're!\[.*\]\s'],
  "\   'ocaml' : ['.', '#'],
  "\   'cpp,objcpp' : ['->', '.', '::'],
  "\   'perl' : ['->'],
  "\   'php' : ['->', '::'],
  "\   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  "\   'ruby' : ['.', '::'],
  "\   'lua' : ['.', ':'],
  "\   'erlang' : [':'],
  "\ }

"let g:ycm_filetype_whitelist = {
			"\ "c":1,
			"\ "cpp":1,
			"\ "objc":1,
			"\ "sh":1,
			"\ "zsh":1,
			"\ "zimbu":1,
			"\ }

"==================coc nvim =====================
"use tab to select option list
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-@> coc#refresh()
let b:coc_diagnostic_disable=1

"=================easy complete===================
"let g:easycomplete_tabnine_config = {
        "\ 'line_limit': 800,
        "\ 'max_num_result': 10,
        "\ }
"=================change color sheme=============
nnoremap <silent> <F9> :PreviousColorScheme<cr>
inoremap <silent> <F9> <esc> :PreviousColorScheme<cr>
nnoremap <silent> <F10> :NextColorScheme<cr>
inoremap <silent> <F10> <esc> :NextColorScheme<cr>
nnoremap <silent> <F11> :RandomColorScheme<cr>
inoremap <silent> <F11> <esc> :RandomColorScheme<cr>
nnoremap <silent> <F12> :ShowColorScheme<cr>
inoremap <silent> <F12> <esc> :ShowColorScheme<cr>
