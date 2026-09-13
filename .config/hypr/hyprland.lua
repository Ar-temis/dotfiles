-- Learn how to configure Hyprland: https://wiki.hypr.land/Configuring/Start/

-- Omarchy's bootstrap keeps path setup out of this user config.
dofile((os.getenv("OMARCHY_PATH") or "/usr/share/omarchy") .. "/default/hypr/bootstrap.lua")

-- Disable all Omarchy default bindings. Add your own in hypr/bindings.lua.
-- omarchy_default_bindings = false
--
-- Or disable only bindings for Omarchy's preinstalled apps/web apps while
-- keeping core window-manager bindings:
-- omarchy_preinstalled_bindings = false

-- Load Omarchy defaults.
require("default.hypr.omarchy")

-- Put your personal overrides in these files. They're loaded after Omarchy's
-- defaults so package updates can improve the defaults without rewriting your
-- ~/.config/hypr files.
require("hypr.monitors")
require("hypr.input")
require("hypr.bindings")
require("hypr.looknfeel")
require("hypr.autostart")

-- Toggle config flags dynamically.
require("default.hypr.toggles")

-- Add any other personal Hyprland configuration below.
o.window("org.gnome.Calendar", { float = true, center = true })

-- Gamepad/wheel input arrives on evdev joystick nodes, which libinput (and
-- therefore Hyprland's idle clock) ignores entirely, so a long stint with only
-- controller input reads as "idle" and the screensaver fires mid-game. Omarchy's
-- idle service respects inhibitors, so an idle-inhibit rule on the game window
-- holds it off.
--
-- Matched generically rather than per-game: Proton assigns every Steam title a
-- `steam_app_<appid>` class (Assetto Corsa is steam_app_244210, DiRT Rally 2.0
-- is steam_app_690790), gamescope covers the Big Picture session, and non-Steam
-- Wine titles keep their `.exe` class. New games are covered with no edit here.
--
-- Mode is "focus", not "fullscreen": "fullscreen" only inhibits while the window
-- is both fullscreen and in front, so it misses windowed games, and "focus"
-- still lets the machine lock normally when a game is left running in the
-- background on another workspace.
o.window("^(steam_app_[0-9]+|gamescope|.+\\.exe)$", {
  idle_inhibit = "focus",
})

-- csgo-vulkan-fix (hyprpm plugin).
-- hl.plugin.csgo_vulkan_fix is nil until the plugin is loaded, and Lua rejects
-- config keys no loaded plugin has registered, so both halves stay behind the
-- guard. autostart.lua runs `hyprpm reload -n`, which loads plugins and reloads
-- the config; on that pass the settings below apply.
if hl.plugin.csgo_vulkan_fix ~= nil then
  -- Add apps with { app = initialClass, w = width, h = height }.
  hl.plugin.csgo_vulkan_fix.vkfix_app({ app = "cs2", w = 1920, h = 1440 })

  hl.config({
    plugin = {
      csgo_vulkan_fix = {
        -- Whether to fix the mouse position. A select few apps might be wonky with this.
        fix_mouse = true,
      },
    },
  })
end

-- VA-API driver override for this hybrid Intel + NVIDIA laptop.
--
-- Omarchy's default/hypr/nvidia.lua sets LIBVA_DRIVER_NAME=nvidia whenever it
-- detects an NVIDIA GPU with GSP firmware. Its detector (omarchy-hw-nvidia-gsp)
-- only asks whether such a GPU exists in the machine, not whether it is the one
-- driving the display -- and here those differ: the only panel, eDP-2, hangs off
-- card2 (PCI 0000:00:02.0, Intel Iris Xe), so Hyprland renders and scans out on
-- the iGPU while the RTX 3070 Ti sits idle on the PRIME offload side.
--
-- With LIBVA_DRIVER_NAME=nvidia, Chromium/Brave decode video through
-- libva-nvidia-driver on the dGPU and then hand the resulting buffers to a GL
-- context living on Intel. The cross-GPU import fails, and the GPU process
-- floods with:
--   eglCreateImage failed with 0x00003009   (EGL_BAD_MATCH)
--   OzoneImageBacking::ProduceSkiaGanesh failed to create GL representation
-- which is the black-video-then-blank-window behaviour: the surface dies on the
-- next reconfigure, so moving or resizing the window empties it while Hyprland
-- keeps drawing the border.
--
-- Pointing VA-API at the Intel driver (intel-media-driver's iHD_drv_video.so)
-- puts decode on the same GPU as the compositor and the errors disappear.
-- Set last so it wins over the default from default.hypr.nvidia.
hl.env("LIBVA_DRIVER_NAME", "iHD")
