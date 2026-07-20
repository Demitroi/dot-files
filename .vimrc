set nocompatible

set nu
set rnu

syntax on

" Case search
set ignorecase
set smartcase

set cursorline

" Scroll off
set scrolloff=8
set sidescrolloff=8

" Split windows in a normal way
set splitright
set splitbelow

" Wrap and indent
set nowrap
set linebreak
set breakindent

" Visual search settings
set incsearch
set hlsearch

:colorscheme lunaperche

" Set Neovim-style cursor behavior in standard Vim
let &t_SI = "\e[6 q" " Insert mode: Vertical bar (I-beam)
let &t_SR = "\e[4 q" " Replace mode: Underline
let &t_EI = "\e[2 q" " Normal/Visual mode: Solid block

" Set the normal mode cursor in startup
autocmd VimEnter * silent! let &t_ti .= "\e[1 q" | silent! execute "normal! \<Esc>"

let mapleader = ' '
let maplocalleader = ' '

" Buffers list shortcuts
noremap ]b :bnext<cr>
noremap [b :bprev<cr>
noremap ]B :blast<cr>
noremap [B :bfirst<cr>

" Quickfix list shortcuts
noremap ]q :cnext<cr>
noremap [q :cprev<cr>
noremap ]Q :clast<cr>
noremap [Q :cfirst<cr>

" Location list shortcuts
noremap ]l :lnext<cr>
noremap [l :lprev<cr>
noremap ]L :llast<cr>
noremap [L :lfirst<cr>

" Grep
nnoremap <Leader>lg :lexpr system('grep -rin ' . shellescape('') . ' ') \| lopen
nnoremap <Leader>cg :cexpr system('grep -rin ' . shellescape('') . ' ') \| copen

" Find
nnoremap <Leader>lf :lexpr system('find -iname ' . shellescape('') . ' \| awk ''{ print $0 ":1:*" }''') \| lopen
nnoremap <Leader>cf :cexpr system('find -iname ' . shellescape('') . ' \| awk ''{ print $0 ":1:*" }''') \| copen

" Git status
nnoremap <Leader>ls :lexpr system('git status -s \| awk ''{ print $2 ":1:" $1 }''') \| lopen
nnoremap <Leader>cs :cexpr system('git status -s \| awk ''{ print $2 ":1:" $1 }''') \| copen

" Move the focus between windows
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>

" Move windows
nnoremap <C-S-h> <C-w>H
nnoremap <C-S-l> <C-w>L
nnoremap <C-S-j> <C-w>J
nnoremap <C-S-k> <C-w>K

" Insert [count] empty lines below without moving the cursor
nnoremap <silent> ]<Space> :<C-u>put =repeat(nr2char(10), v:count1)<Bar>execute "'[-1"<CR>

" Insert [count] empty lines above without moving the cursor
nnoremap <silent> [<Space> :<C-u>put! =repeat(nr2char(10), v:count1)<Bar>execute "']+1"<CR>

" Simply open netrw in the current file's directory
nnoremap <silent> - :edit %:h<CR>
