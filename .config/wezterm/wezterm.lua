local colors = require("colors")
local tabs = require("tabs")
local fonts = require("fonts")
local windows = require("windows")

local config = {}

-- colorscheme
colors.apply_to_config(config)

-- tab bar
tabs.apply_to_config(config)

-- fonts
fonts.apply_to_config(config)

-- window configuration
windows.apply_to_config(config)

-- startup
require("startup")

return config
