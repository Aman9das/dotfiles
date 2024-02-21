local wezterm = require("wezterm")

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

	-- terminal border
	config.window_padding = {
		left = "0.5cell",
		right = "0.5cell",
		top = "0.2cell",
		bottom = "0.1cell",
	}
end

-- return our module table
return module
