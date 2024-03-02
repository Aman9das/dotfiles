local wezterm = require("wezterm")
local colors = require("colors")

local palette = colors.palette

-- This is the module table that we will export
local module = {}

-- define a function in the module table.
-- Only functions defined in `module` will be exported to
-- code that imports this module.
-- The suggested convention for making modules that update
-- the config is for them to export an `apply_to_config`
-- function that accepts the config object, like this:
function module.apply_to_config(config)
	-- title bar
	config.window_decorations = "RESIZE"

	-- window initial size
	config.initial_cols = 160
	config.initial_rows = 40

	-- window border
	config.window_frame = {
		-- border_left_width = "0.25cell",
		border_right_width = "0.5cell",
		-- border_bottom_height = "0.15cell",
		-- border_top_height = "0.15cell",
		border_left_color = palette.black,
		border_right_color = palette.black,
		border_bottom_color = palette.black,
		border_top_color = palette.black,
	}

	-- terminal border
	config.window_padding = {
		left = "0.5cell",
		right = "0cell",
		top = "0.2cell",
		bottom = "0cell",
	}
end

-- return our module table
return module
