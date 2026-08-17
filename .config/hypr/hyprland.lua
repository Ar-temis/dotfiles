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

-- csgo-vulkan-fix (hyprpm plugin).
-- Unlike the old .conf format, Lua rejects config keys that no loaded plugin
-- has registered, so this has to wait until the plugin is actually there.
-- autostart.lua runs `hyprpm reload -n`, which loads plugins and reloads the
-- config; on that pass the keys exist and the settings below apply.
local function plugin_loaded(name)
  for _, plugin in ipairs(hl.get_loaded_plugins() or {}) do
    if (plugin.name or ""):find(name, 1, true) then
      return true
    end
  end

  return false
end

if plugin_loaded("csgo-vulkan-fix") then
  hl.config({
    plugin = {
      csgo_vulkan_fix = {
        -- Whether to fix the mouse position. A select few apps might be wonky with this.
        fix_mouse = true,

        -- Add apps with ["vkfix-app"] = "initialClass, width, height"
        ["vkfix-app"] = "cs2, 1920, 1440",
      },
    },
  })
end
