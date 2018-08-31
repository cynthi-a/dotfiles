let mapleader=','

set number relativenumber
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
" This makes vim act like all other editors, buffers can
" " exist in the background without being in a window.
" " http://items.sjbach.com/319/configuring-vim-right
" set hidden
"
" " turn on syntax highlighting
" syntax on
" " ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

set wrap       "Wrap lines
set linebreak    "Wrap lines at convenient points
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
" ========================================
" Vim plugin configuration
" ========================================
"
" This file contains the list of plugin installed using vundle plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :BundleInstall from within vim or directly invoking it from the
" command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
" Filetype off is required by vundle
filetype off

set rtp+=/Users/cynthialee/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle (required)
Plugin 'VundleVim/Vundle.vim'
Plugin 'jelera/vim-javascript-syntax'
" Make it look amazing
Plugin 'altercation/vim-colors-solarized'
" file navigator gutter
Plugin 'scrooloose/nerdtree.git'
" Command+T replacement (ctrl+P)
Plugin 'ctrlpvim/ctrlp.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$|node_modules',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }
let g:ctrlp_working_path_mode = 'r'

Plugin 'townk/vim-autoclose' 
Plugin 'tmhedberg/matchit'
Plugin 'mxw/vim-jsx'
Plugin 'alvan/vim-closetag'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_shortcut = '>'

Plugin 'vim-scripts/closetag.vim'
Plugin 'posva/vim-vue'

" END OF VUNDLE PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed.
"
" Color theme (drawing from altercation/vim-colors-solarized Bundle)
syntax enable

colorscheme solarized
set background=dark
set t_Co=256

" For MacVim
set guifont=Monaco:h16

set foldmethod=indent

" NERDTree Mappings
" Open Nerd Tree with <Leader>n
map <Leader>n <esc>:NERDTreeToggle<cr>
" Reveal current file in NERDTree with <Leader>r
map <Leader>r <esc>:NERDTreeFind<cr>

imap ;; <Esc>

nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

vnoremap <c-c> :w !pbcopy<CR><CR>
