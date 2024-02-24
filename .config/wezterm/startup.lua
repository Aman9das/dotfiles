local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- right status

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

wezterm.on("update-right-status", function(window, pane)
	-- Each element holds the text for a cell in a "powerline" style << fade
	local cells = {}

  -- insert user name
  -- local os = require("os")
  -- local user = os.getenv("USER")
  -- table.insert(cells, user)

	-- Figure out the cwd and host of the current pane.
	-- This will pick up the hostname for the remote host if your
	-- shell is using OSC 7 on the remote host.
	local cwd_uri = pane:get_current_working_dir()
	if cwd_uri then
		local cwd = ""
		local hostname = ""

		if type(cwd_uri) == "userdata" then
			-- Running on a newer version of wezterm and we have
			-- a URL object here, making this simple!

			cwd = cwd_uri.file_path
			hostname = cwd_uri.host or wezterm.hostname()
		else
			-- an older version of wezterm, 20230712-072601-f4abf8fd or earlier,
			-- which doesn't have the Url object
			cwd_uri = cwd_uri:sub(8)
			local slash = cwd_uri:find("/")
			if slash then
				hostname = cwd_uri:sub(1, slash - 1)
				-- and extract the cwd from the uri, decoding %-encoding
				cwd = cwd_uri:sub(slash):gsub("%%(%x%x)", function(hex)
					return string.char(tonumber(hex, 16))
				end)
			end
		end

		-- Remove the domain name portion of the hostname
		local dot = hostname:find("[.]")
		if dot then
			hostname = hostname:sub(1, dot - 1)
		end
		if hostname == "" then
			hostname = wezterm.hostname()
		end

		table.insert(cells, cwd)
		table.insert(cells, hostname)
	end

	-- I like my date/time in this style: "08:14 PM, Wed Mar 3"
	local date = wezterm.strftime("%I:%M %p, %a %b %-d")
	table.insert(cells, date)

	-- An entry for each battery (typically 0 or 1 battery)
	for _, b in ipairs(wezterm.battery_info()) do
		table.insert(cells, string.format("%.0f%%", b.state_of_charge * 100))
	end

	-- The powerline < symbol
	-- local LEFT_ARROW = utf8.char(0xe0b3)
	-- The filled in variant of the < symbol
	-- local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

	-- Color palette for the backgrounds of each cell
	local colors = {
		"#000000",
		tomorrow.palette.black,
		tomorrow.palette.bright_black,
    tomorrow.palette.dull_blue,
    tomorrow.palette.black,
	}

	-- Foreground color for the text across the fade
	local text_fg = {
    tomorrow.palette.dull_white,
    tomorrow.palette.white,
    tomorrow.palette.white,
    tomorrow.palette.bright_black,
	}

	-- The elements to be formatted
	local elements = {}
	-- How many cells have been formatted
	local num_cells = 0

	-- Translate a cell into elements
	function push(text, is_last)
		local cell_no = num_cells + 1
		table.insert(elements, { Foreground = { Color = text_fg[cell_no] } })
		table.insert(elements, { Background = { Color = colors[cell_no] } })
		table.insert(elements, { Text = " " .. text .. " " })
		if not is_last then
			table.insert(elements, { Foreground = { Color = colors[cell_no + 1] } })
			-- table.insert(elements, { Text = SOLID_LEFT_ARROW })
		end
		num_cells = num_cells + 1
	end

	while #cells > 0 do
		local cell = table.remove(cells, 1)
		push(cell, #cells == 0)
	end

	window:set_right_status(wezterm.format(elements))
end)
