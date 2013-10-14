" turn off auto adding comments on next line
" so you can cut and paste reliably
" http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
set fo=tcq
set nocompatible
set modeline

syntax on

" Set color scheme for gvim.
colorscheme darkblue

" Set background depending on your terminal setup.
set background=dark
" set background=light

" set default comment color to cyan instead of darkblue
" which is not very legible on a black background
" highlight comment ctermfg=cyan

set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2

highlight LiteralTabs ctermbg=darkgreen guibg=darkgreen
match LiteralTabs /\s\	/
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/

" Show me a ruler
set ruler

" Set up puppet manifest and spec options
au BufRead,BufNewFile *.pp
  \ set filetype=puppet
au BufRead,BufNewFile *_spec.rb
  \ nmap <F8> :!rspec --color %<CR>

" Set .pc files to filetype C.
au BufRead,BufNewFile *.pc set filetype=cpp

map <C-n> :NERDTreeToggle<CR>

execute pathogen#infect()
" Enable indentation matching for =>'s
filetype plugin indent on
