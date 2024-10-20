local status, refactoring = pcall(require, "refactoring")

if not status then
    return
end

refactoring.setup({
    prompt_func_return_type = {
        go = false,
        java = false,

        cpp = false,
        c = true,
        h = false,
        hpp = false,
        cxx = false,
        typescript = true,
    },
    prompt_func_param_type = {
        go = false,
        java = false,

        cpp = false,
        c = false,
        h = false,
        hpp = false,
        cxx = false,
        typescript = true,
    },
    printf_statements = {},
    print_var_statements = {},
    show_success_message = true, -- shows a message with information about the refactor on success
})
