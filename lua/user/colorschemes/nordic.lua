local colorscheme = "nordic"

require('nordic').setup({
  telescope = {
    -- Available styles: `classic`, `flat`.
    style = 'flat'
  },
  -- Enable bold keywords and operators.
  bold_keywords = true,
  -- Enable italicized comments.
  italic_comments = true,
  -- Enable editor background transparency.
  transparent_bg = false,
  -- See below for an example.
  override = {},
})

local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
