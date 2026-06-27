local jdtls = require("jdtls")

local lombok_path = vim.fn.expand("~/.local/share/nvim/mason/packages/jdtls/lombok.jar")

local config = {
  cmd = {
    "jdtls",
    "--jvm-arg=-javaagent:" .. lombok_path,
  },
  settings = {
    java = {
      autobuild = { enabled = false },
    },
  },
}

jdtls.start_or_attach(config)
