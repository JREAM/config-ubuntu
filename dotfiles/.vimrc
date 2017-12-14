" break with the busted old vi junk
" must be first
set nocompatible
filetype off


" Use Bash shell, Avoid zsh/fish shell issues
set shell=/bin/bash

""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""

" vundle stuff
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" vundle repo
Bundle 'gmarik/Vundle.vim'

" productivity
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-pathogen'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'benjaminwhite/Benokai'
Plugin 'metakirby5/codi.vim'
Plugin 'bling/vim-airline'
Plugin 'ervandew/supertab'
Plugin 'leafgarland/typescript-vim'
Plugin 'isruslan/vim-es6'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'elzr/vim-json'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'
" Nice Time Tracker for Myself
" If not asked for API key, create:
" vim ~/.wakatime.cfg
" [settings]
" api_key = your_key_here
"Plugin 'wakatime/vim-wakatime'

" languages
Plugin 'hail2u/vim-css3-syntax'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'jnwhiteh/vim-golang'
Plugin 'StanAngeloff/php.vim'
Plugin 'hdima/python-syntax'
Plugin 'othree/html5.vim'
Plugin 'stephpy/vim-yaml'

" misc
Bundle "editorconfig/editorconfig-vim"
Bundle "vim-scripts/gitignore"

" error handling
Bundle "nvie/vim-flake8"
Bundle "scrooloose/syntastic"

" For vim-airline
let g:airline#extensions#tabline#enabled = 1

" For vim-markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" custom file ignores
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|bower_components$\|dist$\|node_modules$\|project_files$\|test$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }


""""""""""""""""""""""""""""""""""""""""
" General VIM
""""""""""""""""""""""""""""""""""""""""


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" show line numbers
set number

" show lines in lower right
set ruler

" don't wrap lines ever
set nowrap

" Set to auto read when a file is changed from the outside
set autoread

" global text columns
" set textwidth=80

" don't automatically break long lines unless they are new
"set formatoptions+=l

" detect file type, turn on that type's plugins and indent preferences
" Turned off -- This was annoying when copy/pasting causes indent problems
" filetype plugin on
" filetype plugin indent on

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" allow background buffers
set hidden

" global tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

" ignore these nonsense files
set wildignore=*.swp,*.bak,*.pyc,*.class

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" no backups, please!
set nobackup
set noswapfile

" keep a longer history
set history=1000

" enable folding
"set foldmethod=indent
"set foldlevel=99

" make file/command tab completion useful
set wildmode=list:longest

" clipboard fusion!
set clipboard^=unnamed clipboard^=unnamedplus

" Source the vimrc file after saving it.
" This way, you don't have to reload Vim to see the changes.
if has("autocmd")
 augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
 augroup END
endif

""""""""""""""""""""""""""""""""""""""""
" Hotkeys
""""""""""""""""""""""""""""""""""""""""

map <C-n> :NERDTreeToggle<CR>

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

""""""""""""""""""""""""""""""""""""""""
" Searching
""""""""""""""""""""""""""""""""""""""""

" show search matches as you type
set incsearch

" clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<cr>

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" highlight search results
set hlsearch

""""""""""""""""""""""""""""""""""""""""
" Aestehtics
""""""""""""""""""""""""""""""""""""""""

" keep cursor somewhat centered
set scrolloff=3

" highlight current line
set cursorline

" invert and bold status line
set highlight=sbr

" enable syntax highlighting
syntax on

"tell the term has 256 colors
set t_Co=256

colorscheme Benokai
set guifont=Inconsolata\ Medium\ 10

" highlight col 80
"set colorcolumn=80
"highlight ColorColumn guibg=#333

" extra whitespace sucks, make it RED
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
