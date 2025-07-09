return {
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                options = {
                    theme = {
                        normal = {
                            a = { fg = "#ffffff", bg = "#5f87af", gui = "bold" },
                        },
                        insert = {
                            a = { fg = "#ffffff", bg = "#87af5f", gui = "bold" },
                        },
                        visual = {
                            a = { fg = "#ffffff", bg = "#af875f", gui = "bold" },
                        },
                        command = {
                            a = { fg = "#ffffff", bg = "#af5f87", gui = "bold" },
                        },
                    }
                },
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                globalstatus = true,
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { "filename" },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" }
            },
        },
    },
}
