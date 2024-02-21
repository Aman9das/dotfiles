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
	-- set the font order
	config.font = wezterm.font_with_fallback({
		"IntoneMono NF",
		"SauceCodePro NF",
		"Intel One Mono",
		"Fira Code",
		"DejaVu Sans Mono",
	})

	-- font size
	config.font_size = 11

	-- hinting
	config.freetype_load_target = "HorizontalLcd"

	-- font shaping
	-- config.harfbuzz_features
end

-- return our module table
return module
