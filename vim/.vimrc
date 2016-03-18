" Blek's vimmy vimrc
" <blek.net@gmail.com>

" # PLUGINS via vim-plug {{{
    call plug#begin('~/.vim/plugged')
        source ~/.config/vim/plugs.vim
    call plug#end()
" }}}


" # GENERAL SETTINGS {{{
    set history=1000

    let mapleader = ","
    let g:mapleader = ","

    " Use vim settings as opposed to vi settings
    set nocompatible

    " Parse modelines in files
    set modeline
" }}}


" # FILES, LOADING AND SAVING {{{
    set encoding=utf-8
    set fileformats=unix,dos,mac

    " Read outside changes to the current file automatically
    " TODO: Issue a warning before loading changes somehow
    set autoread 

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

    " Enhanced tab completion for the command bar (shows many alternatives rather
    " than just cycling between them
    set wildmenu
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

    " Set split direction for :split and :vsplit
    set splitbelow
    set splitright

    " Show as much from lines that won't fit in the screen as possible,
    " instead of showing @s when there's not enough space.
    set display+=lastline

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

    " Make backspace and movement commands wrap between lines
    set backspace=indent,eol,start
    set whichwrap+=<,>,h,l
" }}}
