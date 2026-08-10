-- Migrated from hyprland.conf to Lua syntax for Hyprland 0.55+
-- Date: 2026-05-16

------------------
---- MONITORS ----
------------------

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1,
})


-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("autostart-kde-polkit & MauiManServer & brightnessctl -s set 48000 & nx-powerd & hyprscreend")
    hl.exec_cmd("hyprsunset --config /etc/greetd/hyprsunset.conf & hyprpaper --config /etc/greetd/hyprpaper.conf & hypridle --config /etc/greetd/hypridle.conf")
    hl.exec_cmd("qmlgreet; hyprctl dispatch 'hl.dsp.exit()'")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- hl.env("AQ_DRM_DEVICES", "/dev/dri/card0")

-- hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("GTK_USE_PORTAL", "1")

hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "nitrux_snow_cursors")

hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "kde")

-- hl.env("SDL_VIDEODRIVER", "wayland")

hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "nitrux_snow_cursors")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")


-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    decoration = {
        rounding = 12,
        active_opacity = 1.0,
        inactive_opacity = 0.8,
        blur = {
            enabled = true,
            size = 6,
            passes = 3,
            new_optimizations = true,
            ignore_opacity = true,
            vibrancy = 0.1696,
        },
    },
})

hl.config({
    animations = {
        enabled = true,
    },
})

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("leanBack", { type = "bezier", points = { { 0, 0 }, { 0, 1 } } })

hl.animation({ leaf = "monitorAdded", enabled = true, speed = 3, bezier = "leanBack" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 7, bezier = "myBezier", style = "slide top" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        vrr = 3,
        enable_anr_dialog = false,
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
    name = "fullscreen-all",
    match = { class = "^.*$" },
    fullscreen = true,
})


----------------
---- NO NEWS ---
----------------

hl.config({
    ecosystem = {
        no_update_news = true,
    },
})


------------------
---- XWAYLAND ----
------------------

hl.config({
    xwayland = {
        enabled = false,
        force_zero_scaling = true,
    },
})
