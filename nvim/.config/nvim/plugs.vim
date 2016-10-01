" Blek's nvimmy nvimrc's plugin stuff
" <blek.net@gmail.com>

" This file is not supposed to be used by itself. Rather, it should be sourced
" by the main vimrc file after calling plug#begin. It also does not call
" plug#end; that is also the caller's responsibility.

" GENERAL PLUGINS - appearance, interface elements and editor functionality {{{
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


" PROGRAMMING PLUGINS - relative to language syntax {{{
    " Comment toggling
    Plug 'tpope/vim-commentary' " {
        autocmd FileType cool setlocal commentstring=--\ %s
    " }

    " Fold updating
    Plug 'Konfekt/FastFold'

    " Smart auto-completion
    if has('python3') " Shougo/deoplete.nvim {
        Plug 'Shougo/deoplete.nvim'
        let g:deoplete#enable_at_startup = 1
        inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
        inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    endif " }

    " Snippet engine
    Plug 'Shougo/neosnippet.vim' " {
        " And, of course, the snippets themselves
        Plug 'Shougo/neosnippet-snippets'
        imap <C-k>     <Plug>(neosnippet_expand_or_jump)
        smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    " }


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
