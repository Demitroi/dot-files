local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local home = os.getenv("HOME")

local jdtls_mason = home .. '/.local/share/nvim/mason/bin/jdtls'
local lombok_mason = home .. '/.local/share/nvim/mason/packages/jdtls/lombok.jar'

local config = {
    cmd = {
        jdtls_mason,
        '--jvm-arg=-javaagent:' .. lombok_mason,
        '-configuration', home .. '/.cache/jdtls',
        '-data', home .. '/.cache/jdtls.workspace/' .. project_name
    },
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = 'JavaSE-21',
                        path = '/usr/lib/jvm/java-21-openjdk/',
                        default = true
                    },
                    {
                        name = 'JavaSE-1.8',
                        path = '/usr/lib/jvm/java-8-openjdk/',
                        default = true
                    },
                },
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
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
