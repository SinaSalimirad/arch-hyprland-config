---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal 		= "kitty"
local fileManager	= "nautilus"
local menu		    = "walker"
local browser		= "firefox"
local editor        = "vscodium"
local github        = "github-desktop"
local screenLock    = "hyprlock"
local reload        = 'hyprctl reload'
local screenshot    = "mkdir -p ~/Pictures/Screenshots && grim -g \"$(slurp)\" ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png"
local wifi          = "nm-sidebar" 

---------------------
---- KEYBINDINGS ----
---------------------
local mod           = "SUPER"

hl.bind(mod .. " + C", hl.dsp.window.close())
hl.bind(mod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mod .. " + W", hl.dsp.exec_cmd(browser)) 
hl.bind(mod .. " + L", hl.dsp.exec_cmd(screenLock))
hl.bind(mod .. " + G", hl.dsp.exec_cmd(github))
hl.bind(mod .. " + Q", hl.dsp.exec_cmd(editor))
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mod .. " + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu -display-columns 2 -theme ~/.config/rofi/launchers/type-6/style-7.rasi | cliphist decode | wl-copy"))
hl.bind(mod .. " + N", hl.dsp.exec_cmd("nm-sidebar --toggle"))

hl.bind(mod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + SHIFT + R", hl.dsp.exec_cmd(reload))
hl.bind(mod .. " + SHIFT + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown"))

hl.bind("print", hl.dsp.exec_cmd(screenshot))

-- Move focus with mod + arrow keys
hl.bind(mod .. " + left",   hl.dsp.focus({direction = "left"}))
hl.bind(mod .. " + right",  hl.dsp.focus({direction = "right"}))
hl.bind(mod .. " + up",     hl.dsp.focus({direction = "up"}))
hl.bind(mod .. " + down",   hl.dsp.focus({direction = "down"}))

-- Move/resize windows with mod + LMB and dragging
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + SHIFT + mouse:272", hl.dsp.window.resize(), { mouse = true })

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mod + SHIFT + [0-5]
for i = 1, 5 do
    local key = i % 5 -- 5 maps to key 0
    hl.bind(mod .. " + " ..key,             hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " ..key,     hl.dsp.window.move({ workspace = i })) 
end

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })
