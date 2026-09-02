-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- Application bindings ------------------------------------------------------

o.bind("SUPER + B", "Browser", { omarchy = "browser" })
o.bind("SUPER + E", "File manager", { launch = "nautilus --new-window" })

-- Was: Browser
hl.unbind("SUPER + SHIFT + B")
o.bind("SUPER + SHIFT + B", "Browser (private)", { omarchy = "browser --private" })

-- Was: Email (hey.com)
hl.unbind("SUPER + SHIFT + E")
o.bind("SUPER + SHIFT + E", "Email", { webapp = "https://outlook.office.com/mail" })

-- Logitech MX Keys ----------------------------------------------------------

o.bind("ALT + SHIFT + 4", "Screenshot", "omarchy-capture-screenshot") -- Print Screen button
-- o.bind("SUPER + H", nil, "voxtype record toggle")                     -- Dictation button
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis") -- Emoji button

-- Brightness controls for keyboards without dedicated brightness keys.
o.bind("SUPER + CTRL + UP", "Brightness up", "omarchy-brightness-display +5%", { locked = true, repeating = true })
o.bind("SUPER + CTRL + DOWN", "Brightness down", "omarchy-brightness-display 5%-", { locked = true, repeating = true })

-- Menus ---------------------------------------------------------------------

o.bind("SUPER + ALT + H", "Hardware menu", "omarchy-menu toggle hardware")

-- Was: Tmux keybindings
hl.unbind("SUPER + ALT + K")
o.bind("SUPER + ALT + K", "Show key bindings", "omarchy-menu-keybindings")

-- i3-style window management ------------------------------------------------

-- Focus
o.bind("SUPER + H", "Focus left", hl.dsp.focus({ direction = "l" }))
hl.unbind("SUPER + J") -- was: Toggle window split
o.bind("SUPER + J", "Focus down", hl.dsp.focus({ direction = "d" }))
hl.unbind("SUPER + K") -- was: Keybindings menu
o.bind("SUPER + K", "Focus up", hl.dsp.focus({ direction = "u" }))
hl.unbind("SUPER + L") -- was: Toggle workspace layout
o.bind("SUPER + L", "Focus right", hl.dsp.focus({ direction = "r" }))

-- Resize
hl.unbind("SUPER + CTRL + H") -- was: Hardware menu
o.bind("SUPER + CTRL + H", "Resize left", hl.dsp.window.resize({ x = -100, y = 0, relative = true }))
o.bind("SUPER + CTRL + J", "Resize down", hl.dsp.window.resize({ x = 0, y = 100, relative = true }))
hl.unbind("SUPER + CTRL + K") -- was: Herdr keybindings
o.bind("SUPER + CTRL + K", "Resize up", hl.dsp.window.resize({ x = 0, y = -100, relative = true }))
hl.unbind("SUPER + CTRL + L") -- was: Lock system (still on the system menu, SUPER + ESCAPE)
o.bind("SUPER + CTRL + L", "Resize right", hl.dsp.window.resize({ x = 100, y = 0, relative = true }))

-- Move
o.bind("SUPER + SHIFT + H", "Move window left", hl.dsp.window.move({ direction = "l" }))
o.bind("SUPER + SHIFT + J", "Move window down", hl.dsp.window.move({ direction = "d" }))
o.bind("SUPER + SHIFT + K", "Move window up", hl.dsp.window.move({ direction = "u" }))
o.bind("SUPER + SHIFT + L", "Move window right", hl.dsp.window.move({ direction = "r" }))

-- Cycle the tiling layout of the active workspace (SUPER + backslash).
o.bind("SUPER + code:51", "Cycle workspace layout", (os.getenv("HOME") or "") .. "/.config/hypr/cycle-layout")

-- Agent ---------------------------------------------------------------------

-- Was: Agent (omarchy-agent, which starts claude with bypassPermissions)
-- hl.unbind("SUPER + SHIFT + CTRL + A")
-- o.bind("SUPER + SHIFT + CTRL + A", "Agent", (os.getenv("HOME") or "") .. "/.local/bin/claude-agent")
