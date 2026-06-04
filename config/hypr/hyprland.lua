
-- autostart
hl.on("hyprland.start", function () 
  hl.exec_cmd("udiskie")
  hl.exec_cmd("wayle panel start & hyprpaper & hypridle")
end)

-- env variables
hl.env("HYPRSHOT_DIR", "$HOME/Pictures/Screenshots")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")


-- Keybinds

-- Session
hl.bind("SHIFT + CTRL + Q", hl.dsp.exit())

-- Launch Applications/Commands
hl.bind("SUPER + CTRL + R", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind("SUPER + Return", hl.dsp.exec_cmd("foot"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("thunar"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("microsoft-edge-stable"))
hl.bind("SUPER + Space", hl.dsp.exec_cmd("hyprlauncher"))
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))

hl.bind("Print", hl.dsp.exec_cmd("flameshot gui"))
hl.bind("CTRL + Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | swappy -f -')) -- in case flameshot doesn't work
-- hl.bind("Print", hl.dsp.exec_cmd("hyprshot -zm region"))
-- hl.bind("SHIFT + CTRL + Print", hl.dsp.exec_cmd("hyprshot -m window"))
-- hl.bind("CTRL + Print", hl.dsp.exec_cmd("hyprshot -m output"))

-- Window Management
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + M", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind("SUPER + C", hl.dsp.window.center())
hl.bind("SUPER + CTRL + space", hl.dsp.window.float({ action = "toggle" }))

hl.bind("SUPER + Left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + Right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + Up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + Down", hl.dsp.focus({ direction = "down" }))

hl.bind("SUPER + SHIFT + Left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + Right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + Up", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + Down", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })

hl.bind("SUPER + CTRL + Left", hl.dsp.window.swap({ direction = "left" }))
hl.bind("SUPER + CTRL + Right", hl.dsp.window.swap({ direction = "right" }))
hl.bind("SUPER + CTRL + Up", hl.dsp.window.swap({ direction = "up" }))
hl.bind("SUPER + CTRL + Down", hl.dsp.window.swap({ direction = "down" }))

hl.bind("ALT + Tab", function()
    hl.dispatch(hl.dsp.window.cycle_next())    -- Change focus to another window
    hl.dispatch(hl.dsp.window.bring_to_top()) -- Bring it to the top
end)

-- Workspace Management
hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind("SUPER + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind("SUPER + 9", hl.dsp.focus({ workspace = 9 }))

hl.bind("SUPER + CTRL + 1", hl.dsp.window.move({ workspace = 1, follow = false }))
hl.bind("SUPER + CTRL + 2", hl.dsp.window.move({ workspace = 2, follow = false }))
hl.bind("SUPER + CTRL + 3", hl.dsp.window.move({ workspace = 3, follow = false }))
hl.bind("SUPER + CTRL + 4", hl.dsp.window.move({ workspace = 4, follow = false }))
hl.bind("SUPER + CTRL + 5", hl.dsp.window.move({ workspace = 5, follow = false }))
hl.bind("SUPER + CTRL + 6", hl.dsp.window.move({ workspace = 6, follow = false }))
hl.bind("SUPER + CTRL + 7", hl.dsp.window.move({ workspace = 7, follow = false }))
hl.bind("SUPER + CTRL + 8", hl.dsp.window.move({ workspace = 8, follow = false }))
hl.bind("SUPER + CTRL + 9", hl.dsp.window.move({ workspace = 9, follow = false }))

hl.bind("SUPER + Tab", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + CTRL + Tab", hl.dsp.focus({ workspace = "e-1" }))

-- Mouse Binds
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), {
    mouse = true,
})
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), {
    mouse = true,
})

-- Laptop Volume Keybinds
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Media control
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Monitor
hl.monitor({
    output   = "",
    mode     = "2256x1504@60",
    position = "0x0",
    scale    = 1.33,
    vrr      = 3,
})

-- Input: Keyboard, Mouse, Touchpad

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",
        numlock_by_default = true,
        repeat_rate = 25, 
        repeat_delay = 250,

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
        accel_profile = "adaptive",

        touchpad = {
            natural_scroll = true,
            tap_to_click = true, 
            tap_and_drag = true, 
            scroll_factor = 1,
            clickfinger_behavior = true
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- General Setting and Decoration
hl.config({
    general = {
        gaps_in  = 2,
        gaps_out = 8,

        border_size = 2,

        col = {
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 0.95,
        inactive_opacity = 0.9,

        shadow = {
            enabled      = false,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true, 
    },
})


-- Animation Setting

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })


-- Rules
hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({ 
    name = "Launcher", 
    match = { 
        class = "(steam)|(heroic)|(org.prismlauncher.PrismLauncher)"
    },
    float = true, 
    workspace = 4, 
    center = true,
    no_initial_focus = true,
})

hl.window_rule({ 
    name = "discord", 
    match = { 
        class = "discord"
    }, 
    workspace = 3, 
    no_initial_focus = true,
})

hl.window_rule({ 
    name = "games", 
    match = { 
        class = "^steam_app_[0-9]*$",
    }, 
    workspace = 4,
    float = true, 
    no_initial_focus = true, 
    size = {"monitor_w * 0.75", "monitor_h * 0.6"}, 
    center = true,
})

hl.window_rule({ 
    name = "float layout workspace 4", 
    match = { 
        workspace = 4,
    }, 
    float = true,
    size = {"monitor_w * 0.75", "monitor_h * 0.6"}
})

