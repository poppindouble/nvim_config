call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'morhetz/gruvbox'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'tpope/vim-vinegar'

call plug#end()

colorscheme gruvbox
set background=dark
set number
set relativenumber
set foldmethod=syntax
set nohlsearch
set scrolloff=8
let g:rustfmt_autosave = 1
set clipboard+=unnamedplus
set spelllang=en_us
set spell

" Remap for FZF
nnoremap <C-p> :GFiles<Cr>
nnoremap <C-b> :Buffers<Cr>
nnoremap <C-f> :Files<Cr>
" Remap leader key to space
let mapleader = "\<Space>"
nnoremap <Leader>f :Rg<CR>
nnoremap <Leader>/ :noh<cr>
" Remap for jj as Esc
inoremap jj <Esc>
" Remap search n for center zz and unfold it zv
nnoremap n nzzzv
nnoremap N Nzzzv
" Coc go to definition, go to reference and open documents
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
