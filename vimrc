"installing git and vim-plug is required for the plugins to work
"$sudo apt install git
set number 
set tabstop=4
set shiftwidth=4
set mouse=a
colorscheme habamax " Or delek Or muphy

"no extra file creations
set noswapfile
set noundofile
set nobackup

"highlight search
set hlsearch

""""""""""Key mappings""""""""""
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



" Map Shift+n to :bn in normal and insert mode 
nnoremap <S-n> :bn<CR>
inoremap <S-n> <Esc>:bn<CR>a

" Map Shift+p to :bp in normal and insert mode
nnoremap <S-p> :bp<CR>
inoremap <S-p> <Esc>:bp<CR>a


"""""""""""""""""""""""""""""""""


call plug#begin() 

Plug 'preservim/nerdtree' 

"lsp plugins
"Language server connection plugin
Plug 'prabirshrestha/vim-lsp'
"Detect the language you working on to install it with the command: LspInstallServer
Plug 'mattn/vim-lsp-settings' 

"auto completion popup
Plug 'vim-scripts/AutoComplPop' 

"Show all buffers as tabs
Plug 'ap/vim-buftabline'


call plug#end() 


" Disable highlights for diagnostics
let g:lsp_diagnostics_highlights_enabled = 0

" Disable virtual text for diagnostics
let g:lsp_diagnostics_virtual_text_enabled = 0

"Show Diagnostics in a popup for the current cursor line 
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_float_delay = 1500



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

""""""""""Buffer changes""""""""""
" Show tab buffers as tab only if there is more than one buffer open
let g:buftabline_show = 1
"Show buffer numbers
let g:buftabline_numbers = 1
"Show + if the buffer is 'modified'
let g:buftabline_indicators = 1
"""""""""""""""""""""""""""""""""""


