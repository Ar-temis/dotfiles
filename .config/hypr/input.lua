-- Keep only your personal input overrides here. Settings below replace
-- Omarchy's defaults.

-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input
hl.config({
  input = {
    kb_layout = "us",

    -- Caps Lock acts as Escape (Omarchy's default makes it the compose key).
    kb_options = "caps:escape", -- ,grp:alts_toggle

    -- Change speed of keyboard repeat.
    repeat_rate = 40,
    repeat_delay = 250,

    -- Start with numlock on by default.
    numlock_by_default = true,

    -- Focus windows only on click or keyboard navigation, not mouse hover.
    follow_mouse = 0,

    -- Increase sensitivity for mouse/trackpad (default: 0).
    sensitivity = 0,

    scroll_factor = 2.0,

    -- Turn off mouse acceleration (default: adaptive).
    accel_profile = "flat",
    force_no_accel = true,

    touchpad = {
      -- Use two-finger clicks for right-click instead of lower-right corner.
      clickfinger_behavior = true,

      -- Control the speed of your scrolling.
      scroll_factor = 0.4,
    },
  },
})

-- External ASUS ROG Strix Impact mouse.
hl.device({ name = "asus-rog-strix-impact", sensitivity = 0.1 })

-- Enable touchpad gestures for changing workspaces.
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
-- hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- Enable touchpad gestures for moving focus (helpful on scrolling layout).
-- hl.gesture({ fingers = 3, direction = "left", action = function() hl.dispatch(hl.dsp.focus({ direction = "l" })) end })
-- hl.gesture({ fingers = 3, direction = "right", action = function() hl.dispatch(hl.dsp.focus({ direction = "r" })) end })
