local wezterm = require("wezterm")
local colors = require("colors")

-- This is the module table that we will export
local module = {}

-- define a function in the module table.
-- Only functions defined in `module` will be exported to
-- code that imports this module.
-- The suggested convention for making modules that update
-- the config is for them to export an `apply_to_config`
-- function that accepts the config object, like this:
function module.apply_to_config(config)
	-- default distrobox
	-- config.default_prog = { "distrobox-enter", "bluefin-cli", "--", "zsh -l" }

	-- distroboxes
	config.launch_menu = {
		{
			label = "New Tab",
			args = { os.getenv("SHELL"), "-l" },
		},
		{
			label = "New RBox Tab",
			args = { "distrobox-enter", "rbox", "--", os.getenv("SHELL"), "-l" },
		},
		{
			label = "New Box Tab ",
			args = { "distrobox-enter", "box", "--", os.getenv("SHELL"), "-l" },
		},
	}

	-- command palette
	config.command_palette_font_size = 12.0
	config.command_palette_fg_color = colors.palette.white
	config.command_palette_bg_color = colors.palette.dull_black
end

-- return our module table
return module
