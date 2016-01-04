call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'

call plug#end()

let g:airline_theme='badwolf'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
set guifont=Monaco\ for\ Powerline:h13
set laststatus=2 " always show status line
set noshowmode
syntax on
set number
set numberwidth=4
set noswapfile
set nobackup
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set ttyfast
set noerrorbells
set visualbell
set ttimeoutlen=50
set updatetime=1000
set list listchars=tab:»·,trail:·,nbsp:· " show extra whitespace
set textwidth=80
set colorcolumn=+1

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set background=dark
colorscheme base16-railscasts
highlight clear SignColumn
highlight VertSplit    ctermbg=236
highlight ColorColumn  ctermbg=237
highlight LineNr       ctermbg=236 ctermfg=240
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=236
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight StatusLine   ctermbg=240 ctermfg=12
highlight IncSearch    ctermbg=3   ctermfg=1
highlight Search       ctermbg=1   ctermfg=3
highlight Visual       ctermbg=3   ctermfg=0
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=3   ctermfg=1
highlight SpellBad     ctermbg=0   ctermfg=1
" Git gutter colors
highlight GitGutterAdd ctermbg=black
highlight GitGutterChange ctermbg=black
highlight GitGutterDelete ctermbg=black
highlight GitGutterChangeDelete ctermbg=black

let mapleader=","
nnoremap <C-p> :FZF<CR>
nnoremap <leader>R :so ~/.vimrc<CR>:AirlineRefresh<CR> " source vim config and refresh airline
