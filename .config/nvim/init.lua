-- Show numbers and relative numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Ignore case when searching in lowercase and do not ignore when searching
-- witch capital cases.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Use system clipboard
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Prefered colorscheme, wildcharm and desert are cool two
vim.cmd.colorscheme 'lunaperche'
-- vim.cmd.colorscheme 'wildcharm'
-- vim.cmd.colorscheme 'desert'

-- Show the cursorline
vim.opt.cursorline = true

-- Set list mode to show tabs and spaces
vim.opt.list = true

-- Minimal number of screen lines
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- " Tabsize and when insert spaces with the '>' and '<' commands
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- No wrap
vim.opt.wrap = false
-- Linebreak
vim.opt.linebreak = true

-- Set <Space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Buffer list
vim.keymap.set('n', '<Leader>bl', '<Cmd>:buffers<CR>')
-- Buffer delete
vim.keymap.set('n', '<Leader>bd', '<Cmd>:bdelete<CR>')
-- Buffer first
vim.keymap.set('n', '[B', '<Cmd>:bfirst<CR>')
-- Buffer previous
vim.keymap.set('n', '[b', '<Cmd>:bprevious<CR>')
-- Buffer next
vim.keymap.set('n', ']b', '<Cmd>:bnext<CR>')
-- Buffer last
vim.keymap.set('n', ']B', '<Cmd>:blast<CR>')
-- Open quickfix
vim.keymap.set('n', '<Leader>co', '<Cmd>:copen<CR>')
vim.keymap.set('n', '<Leader>cl', '<Cmd>:copen<CR>')
-- Quickfix first
vim.keymap.set('n', '[Q', '<Cmd>:cfirst<CR>')
-- Quickfix previous
vim.keymap.set('n', '[q', '<Cmd>:cprevious<CR>')
-- Quickfix next
vim.keymap.set('n', ']q', '<Cmd>:cnext<CR>')
-- Quickfix last
vim.keymap.set('n', ']Q', '<Cmd>:clast<CR>')
-- Clear highlights by pressing <Esc> key
vim.keymap.set('n', '<Esc>', '<Cmd>:nohlsearch<CR>')
-- Diagnostic quickfix list
vim.keymap.set('n', '<Leader>dl', vim.diagnostic.setloclist)
-- Diagnostic quickfix show
vim.keymap.set('n', '<Leader>ds', vim.diagnostic.open_float)
-- Toggle wrap
vim.keymap.set('n', '<Leader>tw', '<Cmd>:set wrap!<CR>')

-- Lsp keymaps
vim.keymap.set('n', 'grn', ':lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', 'gra', ':lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('v', 'gra', ':lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', 'grr', ':lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', 'gri', ':lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', 'grf', ':lua vim.lsp.buf.format({async = true})<CR>')
vim.keymap.set('n', 'gO', ':lua vim.lsp.buf.document_symbol()<CR>')
vim.keymap.set('i', '<C-S>', '<Cmd>:lua vim.lsp.buf.signature_help()<CR>')
-- Not keymaps, just to remember the lsp-defaults
-- 'omnifunc' is set to vim.lsp.omnifunc(), use i_CTRL-X_CTRL-O to trigger completion.
-- 'tagfunc' is set to vim.lsp.tagfunc(). This enables features like go-to-definition, :tjump, and keymaps like CTRL-], CTRL-W_], CTRL-W_} to utilize the language server.
-- 'formatexpr' is set to vim.lsp.formatexpr(), so you can format lines via gq if the language server supports it.
-- To opt out of this use gw instead of gq, or clear 'formatexpr' on LspAttach.
-- K is mapped to vim.lsp.buf.hover() unless 'keywordprg' is customized or a custom keymap for K exists.

-- Plugins section
-- Clone plugins in ~/.local/share/nvim/site/pack/plugins/start/

-- gitsigns.nvim
-- https://github.com/lewis6991/gitsigns.nvim
require('gitsigns').setup()
vim.cmd("Gitsigns toggle_current_line_blame")
-- Git diff
vim.keymap.set('n', '<Leader>gd', '<Cmd>:Gitsigns preview_hunk<CR>')
-- Git previous
vim.keymap.set('n', '[g', '<Cmd>:Gitsigns prev_hunk<CR>')
-- Git next
vim.keymap.set('n', ']g', '<Cmd>:Gitsigns next_hunk<CR>')
-- Git reset
vim.keymap.set('n', '<Leader>gr', '<Cmd>:Gitsigns reset_hunk<CR>')
-- Git blame
vim.keymap.set('n', '<Leader>gb', '<Cmd>:Gitsigns blame_line<CR>')

-- nvim-jdtls
-- https://github.com/mfussenegger/nvim-jdtls

-- nvim-dap
-- https://github.com/mfussenegger/nvim-dap
-- Toggle breakpoint
vim.keymap.set('n', '<Leader>tb', require'dap'.toggle_breakpoint)
-- Step continue
vim.keymap.set('n', '<Leader>sc', require'dap'.continue)
-- Step over
vim.keymap.set('n', '<Leader>so', require'dap'.step_over)
-- Step into
vim.keymap.set('n', '<Leader>si', require'dap'.step_into)
-- Step exit, so is already used
vim.keymap.set('n', '<Leader>se', require'dap'.step_out)
-- IDK, i'm not using it
vim.keymap.set('n', '<Leader>ro', require'dap'.repl.open)
-- Debug hover
vim.keymap.set('n', '<Leader>dh', require'dap.ui.widgets'.hover)
-- Debug preview
vim.keymap.set('n', '<Leader>dp', require'dap.ui.widgets'.preview)

-- plenary.nvim
-- https://github.com/nvim-lua/plenary.nvim

-- telescope.nvim
-- https://github.com/nvim-telescope/telescope.nvim
vim.keymap.set('n', '<Leader>ff', '<Cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<Leader>fg', '<Cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<Leader>fb', '<Cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<Leader>fh', '<Cmd>Telescope help_tags<CR>')

-- oil.nvim
-- https://github.com/stevearc/oil.nvim.git
require("oil").setup()
vim.keymap.set('n', '-', '<CMD>Oil<CR>')

-- nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig.git

-- HTML
-- npm i -g vscode-langservers-extracted
require'lspconfig'.html.setup{}

-- CSS
-- npm i -g vscode-langservers-extracted
require'lspconfig'.cssls.setup{}

-- JavaScript
-- npm i -g vscode-langservers-extracted
require'lspconfig'.eslint.setup{}

-- Golang
-- sudo pacman -S gopls
require'lspconfig'.gopls.setup{
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
        },
    },
}
