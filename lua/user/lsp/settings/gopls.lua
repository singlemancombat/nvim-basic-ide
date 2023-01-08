return {
  settings = {
    gopls = {
      analyses = {
        nilness = true,
        unusedparams = true,
        unusedwrite = true,
        useany = true,
      },
      experimentalPostfixCompletions = true,
      gofumpt = true,
      staticcheck = true,
      usePlaceholders = true,
      buildFlags = { "-tags=embed kodo ec28p4" },
      --env = {
      --  GOFLAGS = "-tags=embed",
      --},
    },
  },
}
