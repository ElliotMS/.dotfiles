local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

-- Helper functions
local helpers = require("helpers")

-- Keybindings
local keys = require("keys")
root.keys(keys.globalkeys)
require("awful.hotkeys_popup.keys")

-- Theme
local theme = "gruvbox"
beautiful.init("~/.config/awesome/themes/" .. theme .. "/theme.lua")

-- Rules
local rules = require("rules")
awful.rules.rules = rules

-- Terminal & Editor
terminal = "kitty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

-- Layouts
awful.layout.layouts = {
    awful.layout.suit.tile,
}

-- Signals
require("signals")

-- Wibar
require("wibar")

-- Mount Google Drive
awful.spawn.with_shell("rclone mount --vfs-cache-mode full drive: ~/Drive")
