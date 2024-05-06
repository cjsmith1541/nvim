return{
    "michaelb/sniprun",
    branch = "master",

    build = "sh install.sh",

    config = function()
        require("sniprun").setup({
            display= { "Terminal" },
            display_options = {
                terminal_scrollback = 1,
                terminal_line_number = true,
                terminal_position = "vertical",
                terminal_width = 70,
            },
            selected_interpreters = {"Generic"},
            interpreter_options = {
                Generic = {
                    jam_compiler = {
                        supported_filetypes = {"jam"},
                        extension = ".jam",
                        interpreter = "jam",
                    }
                }
            },
        })
    end,
}
