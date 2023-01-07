local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local status_ok1, fidget = pcall(require, "fidget")
if not status_ok1 then
  return
end

local status_ok2, saga = pcall(require, "lspsaga")
if not status_ok2 then
  return
end

require("user.lsp.mason")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
require("user.lsp.clangd")

fidget.setup({})

-- this is for the fix of clangd otherwise it keeps giving some error
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
lspconfig.clangd.setup({ capabilities = capabilities })
