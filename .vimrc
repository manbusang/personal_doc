set ignorecase
syntax on 
set cursorline "color the editing line 
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
set smartindent
set number
"set relativenumber
set hlsearch

nnoremap <C-a> ^
nnoremap <esc><esc> :noh<return>

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'liuchengxu/space-vim-dark'
Plug 'ajmwagar/vim-deus'
"Plug 'jaredgorski/SpaceCamp'
Plug 'sheerun/vim-polyglot'
Plug 'skywind3000/vim-auto-popmenu'
Plug 'skywind3000/vim-dict'
Plug 'preservim/nerdcommenter'
"Plug 'jlanzarotta/bufexplorer'
"Plug 'humiaozuzu/tabbar'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
"Plug 'neoclide/coc.nvim'
call plug#end()


colorscheme space-vim-dark
"colorscheme deus 
"colorscheme molokai 
"colorscheme aquarium 
"let g:molokai_original =1
"let g:rehash256 =1
hi Comment guifg=#5C6370 ctermfg=59
hi Comment cterm=italic

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
