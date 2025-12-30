--- @module 'oxwm'

-- basic settings
local tags = { "", "󰊯", "", "", "󰙯", "󱇤", "", "󱘶", "󰧮" } 
oxwm.set_tags(tags)
oxwm.set_layout_symbol("tiling", "[T]")
oxwm.set_layout_symbol("normie", "[F]")

require("binds")
require("bar")
require("decorations")
require("rules")





