
local notify = require('notify')

notify.setup({
  stages = "fade_in_slide_out",
  timeout = 5000,
  background_colour = "#000000",
  text_colour = "#d0d0d0",
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
})
