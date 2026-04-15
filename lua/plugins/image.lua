return {
	{
		"3rd/image.nvim",
		build = false,
		opts = {
			backend = "kitty",
			processor = "magick_cli",
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = false,
					only_render_image_at_cursor = false,
					filetypes = { "markdown", "vimwiki" },
				},
				html = {
					enabled = false,
				},
				css = {
					enabled = false,
				},
			},
			max_width = nil,
			max_height = nil,
			max_width_window_percentage = nil,
			max_height_window_percentage = 50,
			scale_factor = 1,
			hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
		},
	},
}
