local status_ok, hop = pcall(require, "hop")
if not status_ok then
  return
end

hop.setup({
  keys = "etovxqpdygfblzhckisuran"
})

local directions = require('hop.hint').HintDirection

vim.keymap.set('n', 'f', function()
  hop.hint_words({
    direction = directions.AFTER_CURSOR,
    current_line_only = false,
  })
end, {remap = true})

vim.keymap.set('n', 'F', function()
  hop.hint_words({
    direction = directions.BEFORE_CURSOR,
    current_line_only = false,
  })
end, {remap = true})

vim.keymap.set('n', 't', function()
  hop.hint_words({
    direction = directions.AFTER_CURSOR,
    current_line_only = true,
    hint_offset = -1,
  })
end, {remap = true})

vim.keymap.set('n', 'T', function()
  hop.hint_words({
    direction = directions.BEFORE_CURSOR,
    current_line_only = true,
    hint_offset = 1,
  })
end, {remap = true})
