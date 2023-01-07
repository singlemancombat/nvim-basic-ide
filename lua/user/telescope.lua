local tele_status_ok, telescope = pcall(require, "telescope")
if not tele_status_ok then
  return
end

local _, icons = pcall(require, "user.icons")
if not _ then
  return
end

telescope.load_extension("file_browser")
telescope.load_extension("project")

local list_keys = require('user.keybindings').telescopeList

telescope.setup({
  defaults = {
    prompt_prefix = icons.ui.Telescope .. " ",
    selection_caret = " ",
    path_display = { "smart" },
    initial_mode = "normal",
    file_ignore_patterns = {
      ".git/",
      "node_modules",
      "node_modules/*",
      "target/",
      "vendor/*",
      "%.lock",
      "__pycache__/*",
      "%.sqlite3",
      "%.ipynb",
      "%.webp",
      ".dart_tool/",
      ".github/",
      ".gradle/",
      "gradle/",
      ".idea/",
      ".settings/",
      ".vscode/",
      "__pycache__/",
      "build/",
      "%.pdb",
      "%.class",
      "%.cache",
      "%.ico",
      "%.pdf",
      "%.dylib",
      "%.met",
      ".vale/",
      -- media files
      "%.jar",
      "%.jpg",
      "%.jpeg",
      "%.png",
      "%.svg",
      "%.otf",
      "%.ttf",
      "%.mp4",
      "%.mkv",
      "%.flac",
      -- zip files
      "%.rar",
      "%.zip",
      "%.7z",
      "%.tar",
      "%.bz2",
      "%.tar.gz",
    },
    mappings = list_keys,
  },

  pickers = {
    live_grep = {
      theme = "dropdown",
    },
    grep_string = {
      theme = "dropdown",
    },
    find_files = {
      theme = "dropdown",
      preview = true,
    },
    buffers = {
      theme = "dropdown",
      previewer = false,
      initial_mode = "normal",
    },
    planets = {
      show_pluto = true,
      show_moon = true,
    },
    colorscheme = {
      enable_preview = true,
    },
    lsp_references = {
      theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_definitions = {
      theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_declarations = {
      theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_implementations = {
      theme = "dropdown",
      initial_mode = "normal",
    },

    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },

  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
      opts = {
        hidden = true,
      },
    },
    project = {
      base_dirs = {
        {path = '~/go/src'},
        {path = '~/code'},
        {path = '~/github'},
      },
      hidden_files = false, -- default: false
      theme = "dropdown",
      order_by = "asc",
      search_by = "title",
      sync_with_nvim_tree = false, -- default false
    },
  },
})
