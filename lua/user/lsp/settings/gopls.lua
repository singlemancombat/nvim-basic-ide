return {
  settings = {
    gopls = {
      analyses = {
        unreachable = true,
        nilness = true,
        unusedparams = true,
        useany = true,
        unusedwrite = true,
        ST1003 = true,
        undeclaredname = true,
        fillreturns = true,
        nonewvars = true,
        fieldalignment = false,
        shadow = true,
      },
      codelenses = {
        generate = true, -- show the `go generate` lens.
        gc_details = true, -- Show a code lens toggling the display of gc's choices.
        test = true,
        tidy = true,
        vendor = true,
        regenerate_cgo = true,
        upgrade_dependency = true,
      },
      staticcheck = true,
      linksInHover = true,
      usePlaceholders = true,
      completeUnimported = true,
      staticcheck = true,
      matcher = 'Fuzzy',
      diagnosticsDelay = '500ms',
      symbolMatcher = 'fuzzy',
      gofumpt = true,
      buildFlags = { '-tags', 'integration' },
    },
  },
}
