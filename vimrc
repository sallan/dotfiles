"############################################################################
"#    Vim config (Recommended) from Appendix C of "Perl Best Practices"     #
"#     Copyright (c) O'Reilly & Associates, 2005. All Rights Reserved.      #
"#  See: http://www.oreilly.com/pub/a/oreilly/ask_tim/2001/codepolicy.html  #
"############################################################################
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
 
filetype plugin indent on         "language dependent indenting
syntax on

set ignorecase
set smartcase

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
"map ,p <Esc>:w<CR><Esc>:!prove -vl %<CR>
"map ,t <Esc>:w<CR><Esc>:!perltidy %<CR><Esc>:e!<CR>
"
"From 'perl hacks'
map ,pt  <Esc>:%! perltidy<CR>
map ,ptv <Esc>:'<,'>! perltidy<CR>
map ,t <Esc>:!prove -vl %<CR>
map ,T <Esc>:!prove -vl % \| less<CR>

map ,c <Esc>:w<CR><Esc>:!perl -cw %<CR>
map ,r <Esc>:w<CR><Esc>:!perl %<CR>

"Perl template
autocmd BufNewFile *.pl :0read ~/.templates/perlapp

"add : to vim's list of keywords so we can autocomplete package names
set iskeyword+=:

"dup and comment line using #
map ,d yypkI# <Esc>j^

"Tlist source code browser
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
map ,b <Esc>:TlistToggle<CR>

"source $MYVIMRC reloads the saved $MYVIMRC
"These aren't working. Don't know why.
"map ,s <Esc>:w<CR><Esc>:source "$MYVIMRC"<CR>
 
"opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
"map ,v <Esc>:w<CR><Esc>:e "$MYVIMRC"<CR>
 
"<Leader> is \ by default, so those commands can be invoked by 
"doing \v and \s
 
"Comments
map ,# :s/^/# /<CR>
map ,- :s/^# *//<CR>

nnoremap <silent> [b :bprevious <CR> 
nnoremap <silent> ]b :bnext <CR>

"Try another way to escape
inoremap jj <esc>

set path+=**

let g:netrw_liststyle=3 "Use tree-mode as default view
let g:netrw_browse_split=4 "Open file in previous buffer
let g:netrw_preview=1 "Preview window in vertical split

