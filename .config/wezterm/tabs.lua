-- local wezterm = require("wezterm")

-- This is the module table that we will export
local module = {}

-- This function is private to this module and is not visible
-- outside.
-- local function private_helper()
-- 	wezterm.log_error("hello!")
-- end

-- define a function in the module table.
-- Only functions defined in `module` will be exported to
-- code that imports this module.
-- The suggested convention for making modules that update
-- the config is for them to export an `apply_to_config`
-- function that accepts the config object, like this:
function module.apply_to_config(config)
	-- private_helper()

	-- enable retro tab bar
	config.use_fancy_tab_bar = false
	config.tab_max_width = 24

	-- hide a single tab
	-- config.hide_tab_bar_if_only_one_tab = true

	-- bottom tab bar
	-- config.tab_bar_at_bottom = true

	-- prefer to launch tabs
	config.prefer_to_spawn_tabs = true
end

-- return our module tale
return module
