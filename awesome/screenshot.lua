local awful = require("awful")

local SCREENSHOTS_DIR = "~/Pictures/screenshots/"
local CLIPBOARD_CMD = "xclip -selection clipboard -target image/png"
local SCROT_CMD = "scrot "..SCREENSHOTS_DIR.."%s.png --exec '"..CLIPBOARD_CMD.." $f'"

-- make sure screenshots dir exists
awful.spawn.with_shell("mkdir --parents "..SCREENSHOTS_DIR.."")

local function fullscreen()
    awful.spawn.with_shell(SCROT_CMD)
end

local function window()
    awful.spawn.with_shell(SCROT_CMD.." --focused")
end

local function selection()
    awful.spawn.with_shell(SCROT_CMD.." --select")
end

return {
    fullscreen = fullscreen,
    window = window,
    selection = selection
}