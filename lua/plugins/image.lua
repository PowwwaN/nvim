return {
    {
        "vhyrro/luarocks.nvim",
        priority = 1001,
        opts = { rocks = { "magick" } },
    },
    {
        "3rd/image.nvim",
        dependencies = { "luarocks.nvim" },
        -- build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
        -- opts = {}
        config = function()
            require("image").setup({
                backend = "kitty",
                processor = "magick_rock",
                kitty_method = "normal",
                integrations = {
                    markdown = {
                        enabled = true,
                        download_remote_images = true,
                        only_render_image_at_cursor = true,
                    },
                    html = {
                        enabled = true,
                        download_remote_images = true,
                        download_css = true,
                        download_fonts = true,
                    },
                },
            })
        end,
    }
}
