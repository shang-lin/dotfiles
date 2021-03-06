" turn off auto adding comments on next line
" so you can cut and paste reliably
" http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
set fo=tcq
set nocompatible
set modeline

syntax on

" Display line numbers.
set number

" Set color scheme for gvim.
" colorscheme darkblue
colorscheme desert

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

map <F2> :NERDTreeToggle<CR>

execute pathogen#infect()
" Enable indentation matching for =>'s
filetype plugin indent on

" Options for Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

au FileType php setl ofu=phpcomplete#CompletePHP
au FileType python set omnifunc=pythoncomplete#Complete
