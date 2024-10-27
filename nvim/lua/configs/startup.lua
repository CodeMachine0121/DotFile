local startup = require('startup')
startup.setup({
  theme = "dashboard",
  options = {
    mapping_keys = true,
    cursor_column = 0.5,
    empty_lines_between_mappings = true,
    disable_statuslines = true,
    paddings = {1,2},
  },
  parts = {
    { type = "padding", val = 1 },
    {
      type = "text",
      oldfiles_directory = false,
      align = "center",
      fold_section = false,
      title = "Header",
      margin = 5,
      content = {
        "Your Header Content Here",
      },
      highlight = "Statement",
      default_color = "",
      oldfiles_amount = 0,
    },
    { type = "padding", val = 1 },
  },
})
