" vim: fdm=marker:foldlevel=0
"
" Blek's vimmy .vimrc 2.0
" <blek.net@gmail.com>

set termguicolors

" PLUGINS {{{
call plug#begin('~/.vim/plugged')

" GENERAL PLUGINS {{{
" Sensible defaults
if !has('nvim')
    Plug 'noahfrederick/vim-neovim-defaults'
    runtime! ~/.vim/plugin/neovim_defaults.vim
endif

" Color scheme
Plug 'morhetz/gruvbox'

" Surround text or edit surroundings with brackets, parens, tags and more
Plug 'tpope/vim-surround'

" Automatically add matching surround characters
Plug 'jiangmiao/auto-pairs'

" Motion on crack
Plug 'justinmk/vim-sneak' " {
    let g:sneak#streak = 1
" }

" Async fuzzy finder
Plug 'junegunn/fzf.vim'

" Alternate between relative and absolute line numbers intelligently
Plug 'myusuf3/numbers.vim' " {
    " Toggle between absolute and relative numbering manually
    nnoremap <F3> :NumbersToggle<CR>
" } Possibly resource-intensive.

" Airline - status bar revamp, tab/buffer bar
Plug 'vim-airline/vim-airline' " {
    Plug 'vim-airline/vim-airline-themes'
    let g:airline#extensions#tabline#enabled = 1

    " I don't use Powerline fonts. If you do, comment the following lines
    " to use Powerline symbols.
    let g:airline_left_sep=' '
    let g:airline_right_sep=' '
" }

" }}}

" SYNTAX PLUGINS {{{
" Comment toggling
Plug 'tpope/vim-commentary' " {
    autocmd FileType cool setlocal commentstring=--\ %s
" }

" Fold updating
Plug 'Konfekt/FastFold'

" LaTeX goodies
Plug 'lervag/vimtex' " {
    " Deoplete vimtex patterns
    if !exists('g:deoplete#omni#input_patterns')
        let g:deoplete#omni#input_patterns = {}
    endif
    let g:deoplete#omni#input_patterns.tex = '\\(?:'
        \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
        \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
        \ . '|hyperref\s*\[[^]]*'
        \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
        \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
        \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
        \ .')'
" }

" Cool language support
Plug 'vim-scripts/cool.vim'

" Fish script support
Plug 'dag/vim-fish'

" }}}

call plug#end()
" }}}

" GENERAL SETTINGS {{{
let mapleader = ","
let g:mapleader = ","

" Parse modelines in files
set modeline
if (executable('pbcopy') || executable('xclip') || executable('xsel')) && has('clipboard')
    set clipboard=unnamedplus
endif

" }}}

" FILES, LOADING AND SAVING {{{
set fileformats=unix,dos,mac
let g:tex_flavor="latex"
" }}}

" EDITOR APPEARANCE {{{
colorscheme gruvbox

" Enable syntax highlighting
syntax enable

" Enable line numbering (relevant plugin: myusuf3/numbers.vim)
set number

" Tell Vim this terminal has a dark background and 256 color support
set background=dark

" Case-insensitive wildmenu
set wildignorecase

" Show current position
set ruler

" Highlight current line
set cursorline

" Highlight matching brackets
set showmatch

" Show the current command buffer on the status bar
set showcmd

" Don't show current mode on the status bar - vim-airline does a better
" job of it
set noshowmode

" When running a macro, don't redraw on every command
set lazyredraw

" Always show status line
set laststatus=2

" Folds
set foldmethod=indent
set foldlevel=999

" Set split direction for :split and :vsplit
set splitbelow
set splitright

" Disable error sounds and visual bells
set noerrorbells
set novisualbell

" Allow buffers to stay hidden (not attached to any windows) without being
" saved, necessarily
set hidden

set mouse=a

" }}}

" TEXT AND WHITESPACE {{{
" 4-wide soft tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set shiftround

" Figure out indentation by itself

" Show trailing whitespace
set list
set listchars=trail:·,tab:»-


" Automatically trim trailing whitespace
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

" Make movement commands wrap between lines
set whichwrap+=<,>,h,l

" }}}

" BINDS {{{
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

nmap <silent> <leader>ev :edit $MYVIMRC<CR>
nmap <silent> <leader>sv :source $MYVIMRC<CR>

nnoremap <F6> :set hlsearch!<CR>
" }}}

" Good idea to load this one last -- it can take a relevant performance toll
filetype plugin indent on
