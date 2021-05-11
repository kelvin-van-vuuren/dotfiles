require("kelvin.telescope")
require("kelvin.lspsaga")
require("kelvin.lualine")
require("kelvin.bufferline")
require("kelvin.treesitter")
--require("theprimeagen.lsp")

P = function(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, 'plenary') then
  RELOAD = require('plenary.reload').reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end
