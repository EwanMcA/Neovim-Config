require("catppuccin").setup({
    transparent_background = true,
    color_overrides = {
        all = {
            mantle = "#242424",
            crust = "#474747",
            text = "#FFFFFF",
        },
        latte = {},
        frappe = {},
        macchiato = {},
        mocha = {},
    }
})

vim.cmd.colorscheme "catppuccin"
