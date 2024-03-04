local wezterm = require("wezterm")
local act = wezterm.action

-- This is the module table that we will export
local module = {}

-- define a function in the module table.
-- Only functions defined in `module` will be exported to
-- code that imports this module.
-- The suggested convention for making modules that update
-- the config is for them to export an `apply_to_config`
-- function that accepts the config object, like this:
function module.apply_to_config(config)
	-- don't confirm closing the window
	-- config.window_close_confirmation = "NeverPrompt"
	config.keys = {
		{ key = "W", mods = "CTRL", action = act.CloseCurrentTab({ confirm = false }) },
		{ key = "W", mods = "SHIFT|CTRL", action = act.CloseCurrentTab({ confirm = false }) },
		{ key = "w", mods = "SHIFT|CTRL", action = act.CloseCurrentTab({ confirm = false }) },
		{ key = "w", mods = "SUPER", action = act.CloseCurrentTab({ confirm = false }) },
	}
end

-- return our module table
return module
