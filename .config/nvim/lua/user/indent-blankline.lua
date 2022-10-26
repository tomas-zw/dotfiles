local status_ok, blankline = pcall(require, "indent-blankline")
if not status_ok then
    vim.notify('indent-blankline failed to load.')
  return
end


blankline.setup({
  --show_end_of_line = true,
  --space_char_blankline = " ",
  --show_current_context = true,
  --show_current_context_start = true,
  char = "▏",
  show_trailing_blankline_indent = false,
  show_current_context = true,
  filetype_exclude = {
    "help",
    "startify",
    "dashboard",
    "packer",
    "neogitstatus",
    "NvimTree",
    "Trouble",
  }
})
