"*****************************************************************************
" Basic Setup
"*****************************************************************************

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Open items from quickfix in existing tab if it contains target buffer
set switchbuf+=usetab,newtab

" Fix backspace indent
set backspace=indent,eol,start

filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

" Disable wrapping
set wrap!

" Map leader to ,
let mapleader=","

" Enable hidden buffers
set hidden

" Clipboard behaviour
set clipboard=unnamed

" Clipboard paste respect indentation
:nnoremap p p=`]

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Encoding
set bomb
set binary

" Directories for swp files
set nobackup
set noswapfile

set nu!

set splitbelow
set splitright
set runtimepath^=~/.vim runtimepath+=~/.vim/after

set statusline+=%{gutentags#statusline()}
" At the moment not available via Plug

" Vue.ja syntax highlight
" git clone https://github.com/posva/vim-vue.git ~/.vim/pack/plugins/start/vim-vue
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Fzf plugin for vim/nvim
" Install FZF via brew (on Mac)
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" Dark Theme
Plug 'dracula/vim', { 'as': 'dracula' }

" Better bullet points
Plug 'dkarter/bullets.vim'

" Code Navigation
Plug 'scrooloose/nerdtree'
" Generates ctags automatically
Plug 'ludovicchabant/vim-gutentags'
" Airline
Plug 'vim-airline/vim-airline'
" --- Additional Language Support
" Ruby
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tonekk/vim-ruby-capybara'
Plug 'keith/rspec.vim'
Plug 'thoughtbot/vim-rspec'

" Javascript
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascript.jsx']}

" HTML
Plug 'alvan/vim-closetag'
Plug 'cakebaker/scss-syntax.vim'
Plug 'mattn/emmet-vim'

" CSS
Plug 'ap/vim-css-color'

" JSON
Plug 'tpope/vim-jdaddy'

" --- Additional Language Support
" Ruby
Plug 'tpope/vim-rails'
Plug 'tonekk/vim-ruby-capybara'
Plug 'keith/rspec.vim'
Plug 'thoughtbot/vim-rspec'
"*****************************************************************************
" Plugin Config
"*****************************************************************************
" ruby
augroup vimrc-ruby
  autocmd!
  autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
  autocmd FileType ruby setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType ruby setlocal comments+=fb:#
augroup END

" eruby
augroup vimrc-eruby
  autocmd!
  autocmd FileType eruby setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" javascript
augroup vimrc-javascript
  autocmd!
  autocmd Filetype javascript setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
augroup END

let g:bullets_enabled_file_types = ['markdown', 'text', 'gitcommit']

let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript EmmetInstall
autocmd FileType html,css,javascript,markdown setlocal ts=2 sw=2 expandtab

let g:closetag_filenames = "*.html,*.js,*.jsx"
let g:closetag_close_shortcut = ''

let g:fzf_height = '30%'
let g:fzf_commits_log_options = '--color --graph --pretty=format:"%C(yellow)%h%Creset -%C(auto)%d%Creset %s %C(bold blue)(%cr) %Cred<%an>%Creset" --abbrev-commit'

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
\ 'bg':      ['bg', 'Normal'],
\ 'hl':      ['fg', 'Boolean'],
\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
\ 'hl+':     ['fg', 'Statement'],
\ 'info':    ['fg', 'PreProc'],
\ 'border':  ['fg', 'Ignore'],
\ 'prompt':  ['fg', 'Conditional'],
\ 'pointer': ['fg', 'Exception'],
\ 'marker':  ['fg', 'Keyword'],
\ 'spinner': ['fg', 'Label'],
\ 'header':  ['fg', 'Comment'] }

" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor\ 

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

let g:gutentags_ctags_tagfile = '.vim_tags'
let g:gutentags_ctags_exclude = [
\ 'node_modules',
\ 'dist',
\ 'vendor',
\ 'bower_components']

let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#fnamemod = ':t' " Show the filename only
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0

let g:airline_section_warning = ''
let g:airline_section_error = ''

" Initialize plugin system
call plug#end()

" Set default color scheme
colo dracula

map <C-n> :NERDTreeToggle<CR>
map <C-b> :bn<CR> 

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Search for visually selected word/pattern
vnoremap // y/\V<C-R>"<CR>

nnoremap <c-p> :FZF<cr>
inoremap vv <Esc>

" Panes and Tab navigation
nnoremap <S-Tab> gT 
nnoremap <Tab> <C-w>w

nnoremap <leader>bl :BLines<cr>  
nnoremap <leader>hi :History:<cr>
nnoremap <leader>co :Commits<cr>
" Remap split panes 
nnoremap <C-k> <C-w>s
nnoremap <C-l> <C-w>v
" ----------Misc
" Tabs
noremap <silent> <leader>t :tabnew<CR>

nnoremap \ :Ag<SPACE>

let &packpath = &runtimepath
source ~/.vimrc
