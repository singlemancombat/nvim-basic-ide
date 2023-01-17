-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = {
  noremap = true,
  silent = true,
}

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Better window split
-- reset the s key 
keymap("n", "s", "<Nop>", opts)
-- split vertically
keymap("n", "sv", ":vsp<CR>", opts)
-- split horizontally
keymap("n", "sh", ":sp<CR>", opts)
-- close current tab 
keymap("n", "sc", "<C-w>c", opts)
-- close other tabs
keymap("n", "so", "<C-w>o", opts)

-- Resize with arrows
keymap("n", "<S-Up>", ":resize -2<CR>", opts)
keymap("n", "<S-Down>", ":resize +2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)
-- quickly make all windows of equal size
keymap("n", "s=", "<C-w>=", opts)

-- Navigate buffers
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<C-w>", ":Bdelete!<CR>", opts)
keymap("n", "<leader>bl", ":BufferLineCloseRight<CR>", opts)
keymap("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opts)
keymap("n", "<leader>bc", ":BufferLinePickClose<CR>", opts)


-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Terminal --
keymap("n", "<leader>t", ":sp | terminal<CR>", opts)
keymap("n", "<leader>vt", ":vsp | terminal<CR>", opts)
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

-- Cheatsheet --
keymap("n", "<leader>?", ":Cheatsheet<CR>", opts)

-- Nvim Tree sidebar --
keymap("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", opts)

-- fzf --
keymap("n", "<C-P>", "<cmd>lua require('fzf-lua').files()<CR>", opts)
--------------------------------------------------------------------------------------
----------------------------------- Plugins BEGIN ------------------------------------
-- -----------------------------------------------------------------------------------
local pluginKeys = {}

-- NvimTree begin --
pluginKeys.nvimTreeList = {
  -- open file to edit or expand/fold directory
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- open file in a split window
  { key = "h", action = "split" },
  { key = "v", action = "vsplit" },
  -- show hidden files
  { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- files operation
  { key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "D", action = "trash" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "s", action = "system_open" },
}
-- NvimTree end --

-- Telescope begin --
local actions = require("telescope.actions")

pluginKeys.telescopeList = {
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

}
-- Telescope end --

-- end

return pluginKeys
