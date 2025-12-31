---@meta

---@module 'oxwm'

-- autostart
oxwm.autostart("dunst")
oxwm.autostart("udiskie")

-- local variables
local tags = { "", "󰊯", "", "", "󰙯", "󱇤", "", "󱘶", "󰧮" }
local terminal = "wezterm"
local mod = "Mod4"
local colors = require("colors")

-- basic settings
oxwm.set_tags(tags)
oxwm.set_terminal(terminal)
oxwm.set_modkey(mod)
oxwm.set_layout_symbol("tiling", "[T]")
oxwm.set_layout_symbol("normie", "[F]")

-- key binds

oxwm.key.bind({ mod, "Control" }, "Q", oxwm.quit())
oxwm.key.bind({ mod, "Control" }, "R", oxwm.restart())
oxwm.key.bind({ mod }, "Return", oxwm.spawn_terminal())
oxwm.key.bind({ mod }, "Space", oxwm.spawn({ "sh", "-c", "dmenu_run -l 10" }))
oxwm.key.bind({ mod }, "Print", oxwm.spawn({ "sh", "-c", "maim -s | xclip -selection clipboard -t image/png" }))
oxwm.key.bind({ mod }, "C", oxwm.client.kill())
oxwm.key.bind({ mod }, "F", oxwm.client.toggle_fullscreen())
oxwm.key.bind({ mod, "Control" }, "Slash", oxwm.show_keybinds())
oxwm.key.bind({ mod, "Control" }, "Space", oxwm.client.toggle_floating())
oxwm.key.bind({ mod, "Control" }, "F", oxwm.layout.set("normie"))
oxwm.key.bind({ mod, "Control" }, "T", oxwm.layout.set("tiling"))

-- tiling layout control; Master-Slave layout
oxwm.key.bind({ mod }, "Bracketleft", oxwm.set_master_factor(-5))
oxwm.key.bind({ mod }, "Bracketright", oxwm.set_master_factor(5))
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

-- bar settings

local bar_font = "JetbrainsMono nerd Font:style=Bold:size=16"
local blocks = {
    oxwm.bar.block.ram({
        format = "Ram: {used}/{total} GB",
        interval = 5,
        color = colors.light_blue,
        underline = true,
    }),
    oxwm.bar.block.static({
        text = " │  ",
        interval = 999999999,
        color = colors.lavender,
        underline = false,
    }),
    oxwm.bar.block.shell({
        format = "{}",
        command = "uname -r",
        interval = 999999999,
        color = colors.red,
        underline = true,
    }),
    oxwm.bar.block.static({
        text = " │  ",
        interval = 999999999,
        color = colors.lavender,
        underline = false,
    }),
    oxwm.bar.block.datetime({
        format = "{}",
        date_format = "%a, %b %d - %-I:%M %P",
        interval = 1,
        color = colors.cyan,
        underline = true,
    }),
    -- Uncomment to add battery status (useful for laptops)
    -- oxwm.bar.block.battery({
    --     format = "Bat: {}%",
    --     charging = "⚡ Bat: {}%",
    --     discharging = "- Bat: {}%",
    --     full = "✓ Bat: {}%",
    --     interval = 30,
    --     color = colors.green,
    --     underline = true,
    -- }),
};

oxwm.bar.set_font(bar_font)
oxwm.bar.set_blocks(blocks)

-- Bar color schemes (for workspace tag display)
-- Parameters: foreground, background, border

-- Unoccupied tags
oxwm.bar.set_scheme_normal(colors.fg, colors.bg, "#444444")
-- Occupied tags
oxwm.bar.set_scheme_occupied(colors.cyan, colors.bg, colors.cyan)
-- Currently selected tag
oxwm.bar.set_scheme_selected(colors.cyan, colors.bg, colors.purple)
-- Urgent tags (windows requesting attention)
oxwm.bar.set_scheme_urgent(colors.red, colors.bg, colors.red)

-- appearance

-- Width in pixels
oxwm.border.set_width(2)
-- Color of focused window border
oxwm.border.set_focused_color(colors.blue)
-- Color of unfocused window borders
oxwm.border.set_unfocused_color(colors.grey)

-- Smart Enabled = No border if 1 window
oxwm.gaps.set_smart(true)
-- Inner gaps (horizontal, vertical) in pixels
oxwm.gaps.set_inner(5, 5)
-- Outer gaps (horizontal, vertical) in pixels
oxwm.gaps.set_outer(5, 5)





