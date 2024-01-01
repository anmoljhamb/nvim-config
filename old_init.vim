set scrolloff=8
set number
set rnu
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ayu-theme/ayu-vim'
call plug#end()

set termguicolors
let ayucolor="dark"
colorscheme ayu

let mapleader = " "
nnoremap <leader>pv :Vex<CR>
inoremap <C-S> <Esc>:w<CR>
nnoremap <C-S> :w<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
inoremap jk <esc>
nnoremap <C-[> <C-O>
nnoremap <C-]> <C-I>
nnoremap <M-w> :q!<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-p> :Files<CR>
nnoremap :editvim :e ~/.config/nvim/init.vim<CR>
nnoremap <esc>/ :noh<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
nnoremap <C-z> u
nnoremap <leader>p "_dP
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG


vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


