local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  debug = false,
  sources = {
    -- Formatting ---------------------
    formatting.astyle,
    --  brew install shfmt
    formatting.shfmt,
    -- StyLua
    formatting.stylua.with({
      extra_args = {
        "--indent-type", "Spaces",
        "--indent-width", "2",
      }
    }),
    -- frontend
    formatting.prettier.with({
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "css",
        "scss",
        "less",
        "html",
        "json",
        "yaml",
        "markdown",
        "graphql",
      },
      prefer_local = "node_modules/.bin",
    }),
    -- gofmt
    formatting.gofmt,
    formatting.goimports,
    -- rustfmt
    -- rustup component add rustfmt
    formatting.rustfmt,
    -- Python
    -- pip install black
    -- asdf reshim python
    formatting.black.with({ extra_args = { "--fast" } }),
    -- Java
    formatting.google_java_format,
    -----------------------------------------------------
    -- formatting.fixjson,
    -- Diagnostics  ---------------------
    diagnostics.eslint.with({
      prefer_local = "node_modules/.bin",
      method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
    }),
    diagnostics.shellcheck,
    -- diagnostics.markdownlint,
    -- markdownlint-cli2
    -- diagnostics.markdownlint.with({
    --   prefer_local = "node_modules/.bin",
    --   command = "markdownlint-cli2",
    --   args = { "$FILENAME", "#node_modules" },
    -- }),
    --
    -- code actions ---------------------
    code_actions.gitsigns,
    code_actions.shellcheck,
    -- code_actions.eslint.with({
    --   prefer_local = "node_modules/.bin",
    -- }),
  },
  -- #{m}: message
  -- #{s}: source name (defaults to null-ls if not specified)
  -- #{c}: code (if available)
  diagnostics_format = "[#{s}] #{m}",
  on_attach = function(_)
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()']])
    -- if client.resolved_capabilities.document_formatting then
    --   vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    -- end
  end,
})

local unwrap = {
  method = null_ls.methods.DIAGNOSTICS,
  filetypes = { "rust" },
  generator = {
    fn = function(params)
      local diagnostics = {}
      -- sources have access to a params object
      -- containing info about the current file and editor state
      for i, line in ipairs(params.content) do
        local col, end_col = line:find "unwrap()"
        if col and end_col then
          -- null-ls fills in undefined positions
          -- and converts source diagnostics into the required format
          table.insert(diagnostics, {
            row = i,
            col = col,
            end_col = end_col,
            source = "unwrap",
            message = "hey " .. os.getenv("USER") .. ", don't forget to handle this" ,
            severity = 2,
          })
        end
      end
      return diagnostics
    end,
  },
}

null_ls.register(unwrap)
