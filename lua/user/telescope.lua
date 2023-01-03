local tele_status_ok, telescope = pcall(require, "telescope")
if not tele_status_ok then
  return
end

local act_status_ok, actions = pcall(require, "telescope.actions")
if not act_status_ok then
  return
end

local _, icons = pcall(require, "user.icons")
if not _ then
	return
end

telescope.load_extension("file_browser")

telescope.setup({
  defaults = {
    prompt_prefix = icons.ui.Telescope .. " ",
    selection_caret = " ",
    path_display = { "smart" },
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
    mappings = {
      i = {
        ["<Down>"] = actions.cycle_history_next,
        ["<Up>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,

				["<C-b>"] = actions.results_scrolling_up,
				["<C-f>"] = actions.results_scrolling_down,

				["<C-c>"] = actions.close,

				["<CR>"] = actions.select_default,
				["<C-s>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<c-d>"] = actions.delete_buffer,

				-- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<Tab>"] = actions.close,
				["<S-Tab>"] = actions.close,
				-- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-h>"] = actions.which_key, -- keys from pressing <C-h>
				-- ["<esc>"] = actions.close,
      },
      n = {
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,
				["<C-b>"] = actions.results_scrolling_up,
				["<C-f>"] = actions.results_scrolling_down,

				["<Tab>"] = actions.close,
				["<S-Tab>"] = actions.close,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,
				["q"] = actions.close,
				["dd"] = actions.delete_buffer,
				["s"] = actions.select_horizontal,
				["v"] = actions.select_vertical,
				["t"] = actions.select_tab,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["?"] = actions.which_key,
			},
    },
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
			previewer = false,
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
			enable_preview = false,
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
	},
})
