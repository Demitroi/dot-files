local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local home = os.getenv("HOME")

local java_debug_plugin_jar = home .. '/.local/share/java/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.53.1.jar'
local jdtls_mason = home .. '/.local/share/nvim/mason/bin/jdtls'

local config = {
    cmd = {
        -- '/usr/share/java/jdtls/bin/jdtls',
        jdtls_mason,
        '--jvm-arg=-javaagent:/usr/share/java/lombok/lombok.jar',
        '-configuration', home .. '/.cache/jdtls',
        '-data', home .. '/.cache/jdtls.workspace/' .. project_name
    },
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-17",
                        path = '/usr/lib/jvm/java-17-temurin/'
                    }
                },
                runtimes = {
                    {
                        name = "JavaSE-21",
                        path = '/usr/lib/jvm/java-21-temurin/',
                        default = true
                    }
                }
            },
            import = {
                maven = {
                    offline = {
                        enabled = true
                    }
                }
            }
        }
    },
    init_options = {
        bundles = {
            vim.fn.glob(java_debug_plugin_jar, 1)
        }
    },
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)

-- Auto document highlight
vim.api.nvim_exec([[
          augroup lsp_document_highlight
            autocmd!
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            autocmd CursorMovedI <buffer> lua vim.lsp.buf.clear_references()
          augroup END
      ]], false)

-- Debug
local dap = require('dap')
dap.configurations.java = {
    {
        type = 'java';
        request = 'attach';
        name = "Debug (Attach) - Remote";
        hostName = "127.0.0.1";
        port = 5005;
    },
}
