"installing git and vim-plug is required for the plugins to work
"$sudo apt install git
set number 
set tabstop=4
set shiftwidth=4
set mouse=a
colorscheme delek

"no extra file creations
set noswapfile
set noundofile
set nobackup




call plug#begin() 

Plug 'preservim/nerdtree' 

call plug#end() 




"If you want a vim builtin NERdtree alternative
  "inoremap <c-b> <Esc>:Lex<cr>:vertical resize 30<cr>
  "nnoremap <c-b> <Esc>:Lex<cr>:vertical resize 30<cr>


