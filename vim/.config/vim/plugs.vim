" Blek's vimmy vimrc's plugin stuff
" <blek.net@gmail.com>

" This file is not supposed to be used by itself. Rather, it should be sourced
" by the main vimrc file after calling plug#begin. It also does not call
" plug#end; that is also the caller's responsibility.

" GENERAL PLUGINS - appearance, interface elements and editor functionality {{{
    " Color scheme
    Plug 'xiaody/thornbird.vim'
    
    " Allows usage of gVim colorschemes in terminal Vim
    Plug 'godlygeek/csapprox'

    " Surround text or edit surroundings with brackets, parens, tags and more
    Plug 'tpope/vim-surround'

    " Automatically add matching surround characters
    Plug 'cohama/lexima.vim'

    " Alternate between relative and absolute line numbers intelligently
    Plug 'myusuf3/numbers.vim' " {
        " Toggle between absolute and relative numbering manually
        nnoremap <F3> :NumbersToggle<CR>
        nnoremap <F4> :NumbersOnOff<CR> 
    " } Possibly resource-intensive.

    " Airline - status bar revamp, tab/buffer bar
    Plug 'vim-airline/vim-airline' " {
        Plug 'vim-airline/vim-airline-themes'
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_theme='ubaryd'

        " I don't use Powerline fonts. If you do, comment the following lines
        " to use Powerline symbols.
        let g:airline_left_sep=' '
        let g:airline_right_sep=' '
    " }
" }}}


" PROGRAMMING PLUGINS - relative to language syntax {{{
    " Comment toggling
    Plug 'tpope/vim-commentary'
" }}}
