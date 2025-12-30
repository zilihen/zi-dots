--- @module 'oxwm'

-- Set up variables 
local terminal = "wezterm"
local mod = "Mod4"

oxwm.set_terminal(terminal)
oxwm.set_modkey(mod)

-- Basic Usage and binds 
-- oxwm.key.bind({ mod, "Control" }, "Q", oxwm.quit())
oxwm.key.bind({ mod, "Control" }, "R", oxwm.restart())
oxwm.key.bind({ mod }, "Return", oxwm.spawn_terminal())
oxwm.key.bind({ mod }, "D", oxwm.spawn({ "sh", "-c", "dmenu_run -l 10" }))
oxwm.key.bind({ mod }, "Print", oxwm.spawn({ "sh", "-c", "maim -s | xclip -selection clipboard -t image/png" }))
oxwm.key.bind({ mod }, "C", oxwm.client.kill())
oxwm.key.bind({ mod }, "F", oxwm.client.toggle_fullscreen())
oxwm.key.bind({ mod, "Control" }, "Slash", oxwm.show_keybinds())
oxwm.key.bind({ mod, "Control" }, "Space", oxwm.client.toggle_floating())
oxwm.key.bind({ mod, "Control" }, "F", oxwm.layout.set("normie"))
oxwm.key.bind({ mod, "Control" }, "T", oxwm.layout.set("tiling"))

-- tiling layout control; Master-Slave layout
oxwm.key.bind({ mod }, "H", oxwm.set_master_factor(-5))
oxwm.key.bind({ mod }, "L", oxwm.set_master_factor(5))
oxwm.key.bind({ mod }, "I", oxwm.inc_num_master(1))
oxwm.key.bind({ mod }, "P", oxwm.inc_num_master(-1))
oxwm.key.bind({ mod }, "Up", oxwm.client.focus_stack(1))
oxwm.key.bind({ mod }, "Down", oxwm.client.focus_stack(-1))
oxwm.key.bind({ mod, "Control" }, "Up", oxwm.client.move_stack(1))
oxwm.key.bind({ mod, "Control" }, "Down", oxwm.client.move_stack(-1))

-- Workspace management
oxwm.key.bind({ mod }, "1", oxwm.tag.view(0))
oxwm.key.bind({ mod }, "2", oxwm.tag.view(1))
oxwm.key.bind({ mod }, "3", oxwm.tag.view(2))
oxwm.key.bind({ mod }, "4", oxwm.tag.view(3))
oxwm.key.bind({ mod }, "5", oxwm.tag.view(4))
oxwm.key.bind({ mod }, "6", oxwm.tag.view(5))
oxwm.key.bind({ mod }, "7", oxwm.tag.view(6))
oxwm.key.bind({ mod }, "8", oxwm.tag.view(7))
oxwm.key.bind({ mod }, "9", oxwm.tag.view(8))
oxwm.key.bind({ mod, "Shift" }, "1", oxwm.tag.move_to(0))
oxwm.key.bind({ mod, "Shift" }, "2", oxwm.tag.move_to(1))
oxwm.key.bind({ mod, "Shift" }, "3", oxwm.tag.move_to(2))
oxwm.key.bind({ mod, "Shift" }, "4", oxwm.tag.move_to(3))
oxwm.key.bind({ mod, "Shift" }, "5", oxwm.tag.move_to(4))
oxwm.key.bind({ mod, "Shift" }, "6", oxwm.tag.move_to(5))
oxwm.key.bind({ mod, "Shift" }, "7", oxwm.tag.move_to(6))
oxwm.key.bind({ mod, "Shift" }, "8", oxwm.tag.move_to(7))
oxwm.key.bind({ mod, "Shift" }, "9", oxwm.tag.move_to(8))






