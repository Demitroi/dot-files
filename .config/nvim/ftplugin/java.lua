local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local home = os.getenv("HOME")

local workspace_dir = home .. '/.local/share/eclipse.jdt.ls.workspace/' .. project_name
local java_path = '/usr/lib/jvm/jdk-17.0.13+11/bin/java'
local lombok_path = home .. '/.local/share/java/lombok/1.18.36/lombok.jar'
local eclipse_jdt_ls_dir = home .. '/.local/share/java/eclipse.jdt.ls/1.43.0'
local eclipse_jdt_ls_jar = eclipse_jdt_ls_dir .. '/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar'
local java_debug_plugin_jar = home .. '/.local/share/java/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.53.1.jar'

local config = {
    cmd = {
        java_path,
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xms1g',
        '-Xmx4g',
        '-javaagent:' .. lombok_path,
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-jar', eclipse_jdt_ls_jar,
        '-configuration', eclipse_jdt_ls_dir .. '/config_linux',
        '-data', workspace_dir
    },
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    settings = {
      java = {
        configuration = {
          runtimes = {
            {
              name = "JavaSE-17",
              path = "/usr/lib/jvm/jdk-17.0.13+11/bin/java",
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
