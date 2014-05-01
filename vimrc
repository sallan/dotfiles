"############################################################################
"#    Vim config (Recommended) from Appendix C of "Perl Best Practices"     #
"#     Copyright (c) O'Reilly & Associates, 2005. All Rights Reserved.      #
"#  See: http://www.oreilly.com/pub/a/oreilly/ask_tim/2001/codepolicy.html  #
"############################################################################
"Load pathogen which manages add-on modules
execute pathogen#infect()

set nocompatible                  "Use Vim settings, not vi
set nobackup                      "No pesky ~ files
set incsearch
set nohlsearch
set autoindent                    "Preserve current indent on new lines
set textwidth=78                  "Wrap at this column
set backspace=indent,eol,start    "Make backspaces delete sensibly
 
set tabstop=4                     "Indentation levels every four columns
set expandtab                     "Convert all tabs typed to spaces
set shiftwidth=4                  "Indent/outdent by four columns
set shiftround                    "Indent/outdent to nearest tabstop
 
set matchpairs+=<:>               "Allow % to bounce between angles too

set history=200                   "Increase lines of history saved
 
filetype plugin indent on         "language dependent indenting
syntax on

set ignorecase
set smartcase

"Set up search path for :find
set path+=**

"Mutt settings
au BufRead,BufNewFile .followup,.article,.letter,/tmp/pico*,nn.*,snd.*,/tmp/mutt* :set ft=mail

"Other filetypes
au BufRead,BufNewFile *.t :set ft=perl
au BufRead,BufNewFile *.inc :set ft=make

" Abbreviations
iab teh the
iab ## ######################################################################
iab #= #=====================================================================


"Inserting these abbreviations inserts the corresponding Perl statement...
iab phbp  #! /usr/bin/perl -w      
iab pdbg  use Data::Dumper 'Dumper';
iab putm  use Test::More qw( no_plan );
 
iab papp  :r ~/.code_templates/perl_application.pl
iab pmod  :r ~/.code_templates/perl_module.pm

"set background=dark
set background=light

"perl key mappings
map <Leader>t  :%! perltidy<CR>
" map <Leader>t <Esc>:!prove -vl %<CR>
" map <Leader>T <Esc>:!prove -vl % \| less<CR>
" You can run perl -cw, but :make is better
map <Leader>c :w<CR>:!perl -cw %<CR>
map <Leader>r :w<CR>:!perl %<CR>

"Set compiler for perl files
autocmd BufNewFile,BufRead *.p? compiler perl

"Perl template
" autocmd BufNewFile *.pl :0read ~/.templates/perlapp

"add : to vim's list of keywords so we can autocomplete package names
set iskeyword+=:

"dup and comment line using #
map <Leader>d yypkI# <Esc>j^

"Tlist source code browser
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
map <Leader>b :TlistToggle<CR>

" From practical Vim. Keys for traversing buffer list
nnoremap <silent> [b :bprevious <CR> 
nnoremap <silent> ]b :bnext <CR>
nnoremap <silent> [B :bfirst <CR> 
nnoremap <silent> ]B :blast <CR>

let g:netrw_liststyle=3 "Use tree-mode as default view
let g:netrw_browse_split=4 "Open file in previous buffer
let g:netrw_preview=1 "Preview window in vertical split

