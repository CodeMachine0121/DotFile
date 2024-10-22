local troublesum = require("troublesum")

troublesum.setup({
    enabled = true,
    autocmd = true,
    severity_format = { "E", "W", "I", "H" },
    severity_highlight = { "DiagnosticError", "DiagnosticWarn", "DiagnosticInfo", "DiagnosticHint" },
})

