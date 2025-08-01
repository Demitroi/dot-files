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
-- vim.cmd.colorscheme 'lunaperche'
-- vim.cmd.colorscheme 'wildcharm'
-- vim.cmd.colorscheme 'desert'

-- Show the cursorline
vim.opt.cursorline = true

-- Set list mode to show tabs and spaces
vim.opt.list = true

-- Minimal number of screen lines
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- No wrap
vim.opt.wrap = false
-- Linebreak
vim.opt.linebreak = true
-- Breakindent
vim.opt.breakindent = true

-- Set <Space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable show mode
vim.opt.showmode = false

-- Buffer list
vim.keymap.set('n', '<Leader>bl', '<Cmd>:buffers<CR>')
-- Buffer delete
vim.keymap.set('n', '<Leader>bd', '<Cmd>:bdelete<CR>')
-- Open quickfix
vim.keymap.set('n', '<Leader>co', '<Cmd>:copen<CR>')
vim.keymap.set('n', '<Leader>cl', '<Cmd>:copen<CR>')
-- Clear highlights by pressing <Esc> key
vim.keymap.set('n', '<Esc>', '<Cmd>:nohlsearch<CR>')
-- Diagnostic quickfix list
vim.keymap.set('n', '<Leader>dl', vim.diagnostic.setloclist)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
-- Diagnostic quickfix show
vim.keymap.set('n', '<Leader>ds', vim.diagnostic.open_float)
-- Toggle wrap
vim.keymap.set('n', '<Leader>tw', '<Cmd>:set wrap!<CR>')
-- Toggle relative numbers
vim.keymap.set('n', '<Leader>tl', '<Cmd>:set rnu!<CR>')

-- Move the focus between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>')
vim.keymap.set('n', '<C-l>', '<C-w><C-l>')
vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-k>', '<C-w><C-k>')

-- Move windows
vim.keymap.set("n", "<C-S-h>", "<C-w>H")
vim.keymap.set("n", "<C-S-l>", "<C-w>L")
vim.keymap.set("n", "<C-S-j>", "<C-w>J")
vim.keymap.set("n", "<C-S-k>", "<C-w>K")

-- Create window splits
vim.keymap.set('n', '<Leader>hs', '<Cmd>:split<CR>')
vim.keymap.set('n', '<Leader>vs', '<Cmd>:vsplit<CR>')

-- Lsp keymaps
vim.keymap.set('n', 'grf', vim.lsp.buf.format)
vim.keymap.set('n', 'grh', vim.lsp.buf.document_highlight)

-- Enable diagnostic virtual lines
-- See: https://neovim.io/doc/user/diagnostic.html#vim.diagnostic.config()
vim.diagnostic.config({ virtual_text = true})

-- Plugins section
-- Install lazy.nvim automatically
-- https://github.com/folke/lazy.nvim
-- Thanks to kickstart.nvim
-- https://github.com/nvim-lua/kickstart.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- vim-sleuth
    -- https://github.com/tpope/vim-sleuth.git
    'tpope/vim-sleuth',
    -- gitsigns.nvim
    -- https://github.com/lewis6991/gitsigns.nvim
    {
        'https://github.com/lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
            vim.cmd('Gitsigns toggle_current_line_blame')
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
        end,
    },
    -- nvim-jdtls
    -- https://github.com/mfussenegger/nvim-jdtls
    'mfussenegger/nvim-jdtls',
    -- nvim-dap
    -- https://github.com/mfussenegger/nvim-dap
    {
        'mfussenegger/nvim-dap',
        config = function()
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
        end,
    },
    -- telescope.nvim
    -- https://github.com/nvim-telescope/telescope.nvim
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            -- plenary.nvim
            -- https://github.com/nvim-lua/plenary.nvim
            'nvim-lua/plenary.nvim',
        },
        config = function()
            vim.keymap.set('n', '<Leader>fb', '<Cmd>Telescope buffers<CR>')
            vim.keymap.set('n', '<Leader>fd', '<Cmd>Telescope diagnostics<CR>')
            vim.keymap.set('n', '<Leader>ff', '<Cmd>Telescope find_files<CR>')
            vim.keymap.set('n', '<Leader>fg', '<Cmd>Telescope live_grep<CR>')
            vim.keymap.set('n', '<Leader>fh', '<Cmd>Telescope help_tags<CR>')
            vim.keymap.set('n', '<Leader>fj', '<Cmd>Telescope jumplist<CR>')
            vim.keymap.set('n', '<Leader>fk', '<Cmd>Telescope keymaps<CR>')
            vim.keymap.set('n', '<Leader>fm', '<Cmd>Telescope marks<CR>')
            vim.keymap.set('n', '<Leader>fq', '<Cmd>Telescope quickfix<CR>')
            vim.keymap.set('n', '<Leader>fr', '<Cmd>Telescope registers<CR>')
            vim.keymap.set('n', '<Leader>fs', '<Cmd>Telescope git_status<CR>')
        end,
    },
    -- oil.nvim
    -- https://github.com/stevearc/oil.nvim
    {
        'stevearc/oil.nvim',
        config = function()
            require('oil').setup({
                view_options = {
                    show_hidden = true,
                },
            })
            vim.keymap.set('n', '-', '<CMD>Oil<CR>')
        end,
        lazy = false,
    },
    -- nvim-lspconfig
    -- https://github.com/neovim/nvim-lspconfig
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            -- mason.nvim
            -- https://github.com/mason-org/mason.nvim
            {
                'mason-org/mason.nvim',
                opts = {},
            },
            -- mason-lspconfig.nvim
            -- https://github.com/mason-org/mason-lspconfig.nvim
            {
                'mason-org/mason-lspconfig.nvim',
                opts = {
                    ensure_installed = { 'cssls', 'jdtls', 'gopls', 'html', 'ts_ls', 'angularls' },
                }
            },
        },
        config = function()
            -- HTML
            require'lspconfig'.html.setup{}

            -- CSS
            require'lspconfig'.cssls.setup{}

            -- JavaScript
            require'lspconfig'.ts_ls.setup{}

            -- Golang
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

            -- Angularls
            require'lspconfig'.angularls.setup{}

            -- Highlight references
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
                callback = function(event)

                    local function client_supports_method(client, method, bufnr)
                        if vim.fn.has 'nvim-0.11' == 1 then
                            return client:supports_method(method, bufnr)
                        else
                            return client.supports_method(method, { bufnr = bufnr })
                        end
                    end

                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
                        local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
                        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.clear_references,
                        })

                        vim.api.nvim_create_autocmd('LspDetach', {
                            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
                            callback = function(event2)
                                vim.lsp.buf.clear_references()
                                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
                            end,
                        })
                    end
                end,
            })
        end,
    },
    {
        -- nvim-treesitter
        -- https://github.com/nvim-treesitter/nvim-treesitter
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require'nvim-treesitter.configs'.setup {
                -- A list of parser names, or "all" (the listed parsers MUST always be installed)
                ensure_installed = {
                    'bash', 'css', 'desktop', 'diff', 'dockerfile', 'git_config', 'gitignore', 'go',
                    'gomod', 'gosum', 'gotmpl', 'gowork', 'html', 'java', 'javascript', 'jq', 'json',
                    'lua', 'make', 'markdown', 'markdown_inline', 'nginx', 'php', 'php_only', 'python',
                    'sql', 'ssh_config', 'templ', 'tmux', 'toml', 'typescript', 'vue', 'xml', 'yaml',
                },
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                },
            }
        end,
    },
    {
        -- blink.cmp
        -- https://github.com/Saghen/blink.cmp
        'saghen/blink.cmp',
        dependencies = {
            -- friendly-snippets
            -- https://github.com/rafamadriz/friendly-snippets
            'rafamadriz/friendly-snippets',
        },
        version = '1.*',
        opts = {
            keymap = {
                preset = 'default'
            },
            completion = {
                documentation = {
                    auto_show = false
                }
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer', },
            },
            fuzzy = {
                implementation = 'prefer_rust_with_warning',
            },
        },
        opts_extend = { 'sources.default', },
    },
    --[[
    Disable linter temporarily
    {
        -- mason-tool-installer.nvim
        -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        dependencies = {
            -- nvim-lint
            -- https://github.com/mfussenegger/nvim-lint
            'mfussenegger/nvim-lint',
            event = { 'BufReadPre', 'BufNewFile', },
            config = function()
                local lint = require 'lint'
                lint.linters_by_ft = {
                    -- check: https://golangci-lint.run/
                    go = { 'golangcilint' },
                    -- check: https://eslint.org/docs/latest/use/getting-started
                    javascript = { 'eslint_d' },
                    typescript = { 'eslint_d' },
                    javascriptreact = { 'eslint_d' },
                    typescriptreact = { 'eslint_d' },
                    -- check: https://htmlhint.com/docs/user-guide/getting-started
                    html = { 'htmlhint' },
                    -- check: https://github.com/stylelint/stylelint/blob/main/docs/user-guide/get-started.md
                    css = { 'stylelint' },
                }
                local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
                vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
                    group = lint_augroup,
                    callback = function()
                        -- Only run the linter in buffers that you can modify in order to
                        -- avoid superfluous noise, notably within the handy LSP pop-ups that
                        -- describe the hovered symbol using Markdown.
                        if vim.opt_local.modifiable:get() then
                            lint.try_lint()
                        end
                    end,
                })
            end,
        },
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = { 'eslint_d', 'golangci-lint', 'htmlhint', 'stylelint' },
            })
        end,
    },
    --]]
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            signs = false
        }
    },
    {
        'github/copilot.vim'
    },
    {
        'idr4n/github-monochrome.nvim',
        lazy = false,
        priority = 1000, -- Make sure to load this before all the other start plugins.
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require('github-monochrome').setup {
                styles = {
                    comments = { italic = false }, -- Disable italics in comments
                },
            }

            -- Load the colorscheme here.
            -- Like many other themes, this one has different styles, and you could load
            -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
            vim.cmd.colorscheme 'github-monochrome-zenbones'
        end,
    },

})
