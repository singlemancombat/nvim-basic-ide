local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "plugins.lua" },
  callback = function()
    vim.cmd("luafile %")
    vim.cmd("PackerSync")
  end,
})


-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  git = {
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use { "wbthomason/packer.nvim" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim" } -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs" } -- Autopairs, integrates with both cmp and treesitter
  use { "numToStr/Comment.nvim" }
  use { "JoosepAlviste/nvim-ts-context-commentstring" }
  use { "kyazdani42/nvim-web-devicons" }
  use { "kyazdani42/nvim-tree.lua" }
  use { "akinsho/bufferline.nvim" }
  use { "moll/vim-bbye" }
  use { "nvim-lualine/lualine.nvim" }
  use { "akinsho/toggleterm.nvim" }
  use { "ahmedkhalf/project.nvim" }
  use { "lewis6991/impatient.nvim" }
  use { "lukas-reineke/indent-blankline.nvim" }
  use { "folke/which-key.nvim" }

  -- color schemes
  use({
		"catppuccin/nvim",
		as = "catppuccin",
	})
  use { "folke/tokyonight.nvim" }
  use { "lunarvim/darkplus.nvim" }
	use { "EdenEast/nightfox.nvim" }
	use { "marko-cerovac/material.nvim" }
	use { "Mofiqul/dracula.nvim" }
  use { "Shatur/neovim-ayu" }

  -- neovim-ui-enhancerususe
	use { "MunifTanjim/nui.nvim" }

  -- winbar stuff
	use { "SmiteshP/nvim-navic" }
	use { "utilyre/barbecue.nvim" }

  -- cmp plugins
  use { "hrsh7th/nvim-cmp" } -- The completion plugin
  use { "hrsh7th/cmp-buffer" } -- buffer completions
  use { "hrsh7th/cmp-path" } -- path completions
  use { "hrsh7th/cmp-cmdline" } -- cmdline completion
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-nvim-lua" }
  use { "saadparwaiz1/cmp_luasnip" } -- snippet completions

  -- snippets
  use { "L3MON4D3/LuaSnip" } --snippet engine
  use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use

  -- LSP
  -- use { "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" } -- simple to use language server installer
  use { "neovim/nvim-lspconfig" } -- enable LSP
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }
  use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
  use { "RRethy/vim-illuminate" }

  --for-json-schemas
	use("b0o/schemastore.nvim")

	--for-showing lsp progress
	use("j-hui/fidget.nvim")

	-- Quickrun Plugin
	use({ "is0n/jaq-nvim" })

  -- Dashboard
  use { "goolord/alpha-nvim" }

  -- Telescope
  use { "nvim-telescope/telescope.nvim" }
  use { "nvim-telescope/telescope-file-browser.nvim" }

  -- Treesitter
  use ({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })

  -- Git
  use { "lewis6991/gitsigns.nvim" }

  -- DAP
  use { "mfussenegger/nvim-dap" }
  use { 'mfussenegger/nvim-dap-python' }
  use { "leoluz/nvim-dap-go"}
  use { "rcarriga/nvim-dap-ui" }
  use { "ravenxrz/DAPInstall.nvim" }
  use { "ethanholz/nvim-lastplace" }
	use { "p00f/clangd_extensions.nvim" }

  -- vim-go
  use { "fatih/vim-go" }

  -- vim java
  use { "mfussenegger/nvim-jdtls" }

  -- rust-tools.vim
  use { 'simrat39/rust-tools.nvim' }

  -- ascii-stuff
	use({
    "MaximilianLloyd/ascii.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
    }
  })

  -- zen mode
  use({ "folke/zen-mode.nvim" })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end

end)
