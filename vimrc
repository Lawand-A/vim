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

"highlight search
set hlsearch

"If you want a vim builtin NERdtree alternative
  "inoremap <c-b> <Esc>:Lex<cr>:vertical resize 30<cr>
  "nnoremap <c-b> <Esc>:Lex<cr>:vertical resize 30<cr>


" Map Ctrl+S to save the file without changing mode
nnoremap <C-S> :w<CR>
inoremap <C-S> <C-O>:silent w<CR>
vnoremap <C-S> <C-C>:w<CR>


" Map Ctrl+P to paste from the system clipboard without changing mode
nnoremap <C-P> :silent normal! "*p<CR>
inoremap <C-P> <C-O>:silent normal! "*p<CR>
vnoremap <C-P> :silent normal! "*p<CR>



call plug#begin() 

Plug 'preservim/nerdtree' 

"lsp plugins
"Language server connection plugin
Plug 'prabirshrestha/vim-lsp'
"Detect the language you working on to install it with the command: LspInstallServer
Plug 'mattn/vim-lsp-settings' 

"auto completion popup
Plug 'vim-scripts/AutoComplPop' 

call plug#end() 




function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gi <plug>(lsp-definition)
    nmap <buffer> gd <plug>(lsp-declaration)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gl <plug>(lsp-document-diagnostics)
    nmap <buffer> <f2> <plug>(lsp-rename)
    nmap <buffer> <f3> <plug>(lsp-hover)
endfunction
augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END





