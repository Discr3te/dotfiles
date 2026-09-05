---------------------
---- KEYBINDINGS ----
---------------------

local terminal = "alacritty"
local fileManager = "nautilus"
local menu = "pkill fuzzel || fuzzel"
local browser = "firefox"
local exit_hyprland = "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"

if HOSTNAME == DESKTOP then
	MainMod = "SUPER" -- Sets "Windows" key as main modifier
elseif HOSTNAME == LAPTOP then
	MainMod = "ALT"
end

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(MainMod .. " + N", hl.dsp.exec_cmd(exit_hyprland))

-- Move window to masters
hl.bind(MainMod .. " + M", hl.dsp.layout("swapwithmaster"))

-- Fake Fullscreen
hl.bind(
	MainMod .. " + F",
	hl.dsp.window.fullscreen_state({
		internal = 0,
		client = 2,
		action = "toggle",
		layout_aware = true,
		window = "activewindow",
	})
)

hl.bind(MainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(MainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(MainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(MainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(MainMod .. " + Q", hl.dsp.window.close())

-- Resize windows with MainMod + Shift + hjkl
hl.bind(MainMod .. " + SHIFT + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
	hl.bind("H", hl.dsp.window.resize({ x = -1, y = 0, relative = true }), { repeating = true })
	hl.bind("L", hl.dsp.window.resize({ x = 1, y = 0, relative = true }), { repeating = true })
	hl.bind("K", hl.dsp.window.resize({ x = 0, y = 1, relative = true }), { repeating = true })
	hl.bind("J", hl.dsp.window.resize({ x = 0, y = -1, relative = true }), { repeating = true })
	hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Move focus with MainMod + arrow keys
hl.bind(MainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(MainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(MainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(MainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Example special workspace (scratchpad)
hl.bind(MainMod .. " + S", hl.dsp.workspace.toggle_special("spotify"))
hl.bind(MainMod .. " + R", hl.dsp.workspace.toggle_special("btop"))

-- Scroll through existing workspaces with MainMod + scroll
-- hl.bind(MainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
-- hl.bind(MainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with MainMod + LMB/RMB and dragging
hl.bind(MainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(MainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind(MainMod .. " + " .. 1, hl.dsp.focus({ workspace = 1 }))
hl.bind(MainMod .. " + SHIFT + " .. 1, hl.dsp.window.move({ workspace = 1 }))

hl.bind(MainMod .. " + " .. 2, hl.dsp.focus({ workspace = 2 }))
hl.bind(MainMod .. " + SHIFT + " .. 2, hl.dsp.window.move({ workspace = 2 }))

hl.bind(MainMod .. " + " .. 3, hl.dsp.focus({ workspace = 3 }))
hl.bind(MainMod .. " + SHIFT + " .. 3, hl.dsp.window.move({ workspace = 3 }))

hl.bind(MainMod .. " + " .. 4, hl.dsp.focus({ workspace = 4 }))
hl.bind(MainMod .. " + SHIFT + " .. 4, hl.dsp.window.move({ workspace = 4 }))

hl.bind(MainMod .. " + " .. 5, hl.dsp.focus({ workspace = 5 }))
hl.bind(MainMod .. " + SHIFT + " .. 5, hl.dsp.window.move({ workspace = 5 }))
