local colors = require("colors")
local tabs = require("tabs")
local fonts = require("fonts")
local windows = require("windows")
local system = require("system")
local launchers = require("launchers")
local keymaps = require("keymaps")

local config = {}

-- colorscheme
colors.apply_to_config(config)

-- tab bar
tabs.apply_to_config(config)

-- fonts
fonts.apply_to_config(config)

-- window configuration
windows.apply_to_config(config)

-- system settings
system.apply_to_config(config)

-- launchers
launchers.apply_to_config(config)

-- keymaps
keymaps.apply_to_config(config)

-- startup
require("startup")

return config
