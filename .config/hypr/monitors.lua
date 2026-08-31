-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

-- Straight 1x setup for low-resolution displays like 1080p or 1440p,
-- or for ultrawide monitors like 34" 3440x1440 or 49" 5120x1440.
hl.env("GDK_SCALE", "1")

-- Fallback for any monitor not listed below.
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60", position = "0x0", scale = 1 })
hl.monitor({ output = "eDP-2", mode = "2560x1440@240", position = "1920x0", scale = 1 })

-- Keep workspace 1 on the external monitor; use the built-in display for the
-- main workspace range.
hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-1", default = true })
hl.workspace_rule({ workspace = "2", monitor = "eDP-2", default = true })
for workspace = 3, 10 do
  hl.workspace_rule({ workspace = tostring(workspace), monitor = "eDP-2" })
end

-- Portrait/rotated secondary monitor (transform: 1 = 90°, 3 = 270°).
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })
