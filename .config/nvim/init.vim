" Show numbers and relative numbers
:set number
:set relativenumber

" Ignore case when searching in lowercase and do not ignore when searching
" witch capital cases.
:set ignorecase
:set smartcase

" Enable the use of :find in subdirectories
:set path+=**

" Use system clipboard
:set clipboard=unnamedplus

" Prefered colorscheme, wildcharm and desert are cool two
:colorscheme lunaperche
":colorscheme wildcharm
":colorscheme desert

" Show the cursorline
:set cursorline

" Set list mode to show tabs and spaces
:set list

" Minimal number of screen lines
:set scrolloff=8
:set sidescrolloff=8

" Tabsize and when insert spaces with the '>' and '<' commands
:set tabstop=4
:set softtabstop=4
:set shiftwidth=4
:set expandtab

" No wrap
:set nowrap
" Linebreak
:set linebreak

" Customize netrw
let g:netrw_banner=0
let g:netrw_liststyle=3

" Set <Space> as the leader key
let mapleader=" "
let maplocalleader=" "

" Custom keymaps
" List current
:nmap <Leader>lc :let @/=expand("%:t") <Bar> execute ':Lexplore' expand("%:h") <Bar> normal n<CR>
" List root
:nmap <Leader>lr <Cmd>:Lexplore<CR>
" Buffer list
:nmap <Leader>bl <Cmd>:buffers<CR>
" Buffer delete
:nmap <Leader>bd <Cmd>:bdelete<CR>
" Buffer previous
:nmap <Leader>bp <Cmd>:bprevious<CR>
:nmap [b <Cmd>:bprevious<CR>
" Buffer next
:nmap <Leader>bn <Cmd>:bnext<CR>
:nmap ]b <Cmd>:bnext<CR>
" Open quickfix
:nmap <Leader>co <Cmd>:copen<CR>
:nmap <Leader>cl <Cmd>:copen<CR>
" Previous quickfix
:nmap <Leader>cp <Cmd>:cprevious<CR>
:nmap [q <Cmd>:cprevious<CR>
" Next quickfix
:nmap <Leader>cn <Cmd>:cnext<CR>
:nmap ]q <Cmd>:cnext<CR>
" Clear highlights by pressing <Esc> key
:nmap <Esc> <Cmd>:nohlsearch<CR>
" Diagnostic quickfix list
:nmap <Leader>dl :lua vim.diagnostic.setloclist()<CR>
" Diagnostic quickfix show
:nmap <Leader>ds :lua vim.diagnostic.open_float()<CR>
" Toggle wrap
:nmap <Leader>tw :set wrap!<CR>

" Lsp keymaps
:nmap grn :lua vim.lsp.buf.rename()<CR>
:nmap gra :lua vim.lsp.buf.code_action()<CR>
:vmap gra :lua vim.lsp.buf.code_action()<CR>
:nmap grr :lua vim.lsp.buf.references()<CR>
:nmap gri :lua vim.lsp.buf.implementation()<CR>
:nmap gO :lua vim.lsp.buf.document_symbol()<CR>
:imap <C-S> <Cmd>:lua vim.lsp.buf.signature_help()<CR>
" Not keymaps, just to remember the lsp-defaults
" 'omnifunc' is set to vim.lsp.omnifunc(), use i_CTRL-X_CTRL-O to trigger completion.
" 'tagfunc' is set to vim.lsp.tagfunc(). This enables features like go-to-definition, :tjump, and keymaps like CTRL-], CTRL-W_], CTRL-W_} to utilize the language server.
" 'formatexpr' is set to vim.lsp.formatexpr(), so you can format lines via gq if the language server supports it.
" To opt out of this use gw instead of gq, or clear 'formatexpr' on LspAttach.
" K is mapped to vim.lsp.buf.hover() unless 'keywordprg' is customized or a custom keymap for K exists.

" Plugins section
" Clone plugins in ~/.local/share/nvim/site/pack/plugins/start/

" gitsigns.nvim
" https://github.com/lewis6991/gitsigns.nvim
:lua require('gitsigns').setup()
:lua vim.cmd("Gitsigns toggle_current_line_blame")
" Git diff
:nmap <Leader>gd <Cmd>:Gitsigns preview_hunk<CR>
" Git previous
:nmap <Leader>gp <Cmd>:Gitsigns prev_hunk<CR>
:nmap [g <Cmd>:Gitsigns prev_hunk<CR>
" Git next
:nmap <Leader>gn <Cmd>:Gitsigns next_hunk<CR>
:nmap ]g <Cmd>:Gitsigns next_hunk<CR>
" Git reset
:nmap <Leader>gr <Cmd>:Gitsigns reset_hunk<CR>
" Git blame
:nmap <Leader>gb <Cmd>:Gitsigns blame_line<CR>

" nvim-jdtls
" https://github.com/mfussenegger/nvim-jdtls

" nvim-dap
" https://github.com/mfussenegger/nvim-dap
" Toggle breakpoint
:nmap <Leader>tb <Cmd>:lua require'dap'.toggle_breakpoint()<CR>
" Step continue
:nmap <Leader>sc <Cmd>:lua require'dap'.continue()<CR>
" Step over
:nmap <Leader>so <Cmd>:lua require'dap'.step_over()<CR>
" Step into
:nmap <Leader>si <Cmd>:lua require'dap'.step_into()<CR>
" Step exit, so is already used
:nmap <Leader>se <Cmd>:lua require'dap'.step_out()<CR>
" IDK, i'm not using it
:nmap <Leader>ro <Cmd>:lua require'dap'.repl.open()<CR>
" Debug hover
:nmap <Leader>dh <Cmd>:lua require'dap.ui.widgets'.hover()<CR>
" Debug preview
:nmap <Leader>dp <Cmd>:lua require'dap.ui.widgets'.preview()<CR>

" plenary.nvim
" https://github.com/nvim-lua/plenary.nvim

" telescope.nvim
" https://github.com/nvim-telescope/telescope.nvim
:nmap <Leader>ff <Cmd>Telescope find_files<CR>
:nmap <Leader>fg <Cmd>Telescope live_grep<CR>
:nmap <Leader>fb <Cmd>Telescope buffers<CR>
:nmap <Leader>fh <Cmd>Telescope help_tags<CR>

" oil.nvim
" https://github.com/stevearc/oil.nvim.git
:lua require("oil").setup()
:nmap - <CMD>Oil<CR>

" nvim-lspconfig
" https://github.com/neovim/nvim-lspconfig.git

" HTML
" npm i -g vscode-langservers-extracted
":lua require'lspconfig'.html.setup{configurationSection = { "html", "css", "javascript" }, embeddedLanguages = { css = true, javascript = true }, provideFormatter = true}
:lua require'lspconfig'.html.setup{}

" CSS
" npm i -g vscode-langservers-extracted
":lua require'lspconfig'.cssls.setup{provideFormatter = true}
:lua require'lspconfig'.cssls.setup{}

" JavaScript
" npm i -g vscode-langservers-extracted
:lua require'lspconfig'.eslint.setup{}
