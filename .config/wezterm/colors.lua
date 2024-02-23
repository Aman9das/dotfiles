-- I am helpers.lua and I should live in ~/.config/wezterm/helpers.lua

-- local wezterm = require("wezterm")

-- This is the module table that we will export
local module = {}

local tomorrow = {}

-- stylua: ignore start
tomorrow.palette = {
    bright_black    = "#373b41",
    black           = "#1d1f21",
    dull_black      = "#151718",

    bright_white    = "#eaeaea",
    white           = "#c5c8c6",
    dull_white      = "#707880",

    bright_red      = "#d54e53",
    red             = "#cc6666",
    dull_red        = "#a54242",

    bright_green    = "#b9ca4a",
    green           = "#b5bd68",
    dull_green      = "#8c9440",

    bright_yellow   = "#e7c547",
    yellow          = "#f0c674",
    dull_yellow     = "#de935f",

    bright_blue     = "#7aa6da",
    blue            = "#81a2be",
    dull_blue       = "#5f819d",

    bright_magenta  = "#c397d8",
    magenta         = "#b294bb",
    dull_magenta    = "#85678f",

    bright_cyan     = "#70c0b1",
    cyan            = "#8abeb7",
    dull_cyan       = "#5e8d87",
}

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
	config.color_scheme = "Tomorrow Night Bright"

	config.colors = {
		tab_bar = {
			-- The color of the strip that goes along the top of the window
			-- (does not apply when fancy tab bar is in use)
			background = "#000",

			-- The active tab is the one that has focus in the window
			active_tab = {
				-- The color of the background area for the tab
				bg_color = tomorrow.palette.dull_blue,
				-- The color of the text for the tab
				fg_color = tomorrow.palette.black,

				-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
				-- label shown for this tab.
				-- The default is "Normal"
				intensity = "Normal",

				-- Specify whether you want "None", "Single" or "Double" underline for
				-- label shown for this tab.
				-- The default is "None"
				underline = "None",

				-- Specify whether you want the text to be italic (true) or not (false)
				-- for this tab.  The default is false.
				italic = false,

				-- Specify whether you want the text to be rendered with strikethrough (true)
				-- or not for this tab.  The default is false.
				strikethrough = false,
			},

			-- Inactive tabs are the tabs that do not have focus
			inactive_tab = {
				bg_color = tomorrow.palette.dull_black,
				fg_color = tomorrow.palette.dull_white,

        intensity = "Bold",
				-- The same options that were listed under the `active_tab` section above
				-- can also be used for `inactive_tab`.
			},

			-- You can configure some alternate styling when the mouse pointer
			-- moves over inactive tabs
			inactive_tab_hover = {
				bg_color = tomorrow.palette.dull_black,
				fg_color = tomorrow.palette.bright_blue,
				italic = false,
        intensity = "Bold",

				-- The same options that were listed under the `active_tab` section above
				-- can also be used for `inactive_tab_hover`.
			},

			-- The new tab button that let you create new tabs
			new_tab = {
        bg_color = tomorrow.palette.dull_green,
				fg_color = tomorrow.palette.black,

        intensity = "Bold",

				-- The same options that were listed under the `active_tab` section above
				-- can also be used for `new_tab`.
			},

			-- You can configure some alternate styling when the mouse pointer
			-- moves over the new tab button
			new_tab_hover = {
        bg_color = tomorrow.palette.green,
				fg_color = tomorrow.palette.bright_black,
				italic = false,
        intensity = "Bold",

				-- The same options that were listed under the `active_tab` section above
				-- can also be used for `new_tab_hover`.
			},
		},
	}
end

-- return our module table
return module
