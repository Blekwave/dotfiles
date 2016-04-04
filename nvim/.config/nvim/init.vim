" Blek's vimmy vimrc
" <blek.net@gmail.com>

" # PLUGINS via vim-plug {{{
    call plug#begin('~/.config/nvim/plugged')
        source ~/.config/nvim/plugs.vim
    call plug#end()
" }}}


" # GENERAL SETTINGS {{{
    let mapleader = ","
    let g:mapleader = ","

    " Parse modelines in files
    set modeline
" }}}


" # FILES, LOADING AND SAVING {{{
    set fileformats=unix,dos,mac

    " :W saves file as super user (no more permission errors!)
    command W w !sudo tee % > /dev/null
" }}}


" # EDITOR APPEARANCE {{{
    colorscheme thornbird

    " Enable syntax highlighting
    syntax enable

    " Enable line numbering (relevant plugin: myusuf3/numbers.vim)
    set number

    " Tell Vim this terminal has a dark background and 256 color support
    set background=dark
    set t_Co=256

    " Case-insensitive wildmenu
    set wildignorecase

    " Show current position
    set ruler

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
    set foldenable
    set foldmethod=syntax
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
" }}}


" # TEXT AND WHITESPACE {{{
    " 4-wide soft tabs
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab

    " Copy indent from previous line
    set autoindent

    " Try to be smart about indents (see :help smartindent for more details)
    set smartindent

    " Show trailing whitespace
    set list
    set listchars=trail:·,tab:»·

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
