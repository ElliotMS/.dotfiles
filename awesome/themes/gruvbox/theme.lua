local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local theme = {}

theme.font          = "Monospace 14"

-- https://github.com/morhets/gruvbox#dark-mode-1
theme.bg_normal     = "#282828"
theme.bg_focus      = "#3c3836"
theme.bg_urgent     = theme.bg_normal
theme.bg_minimize   = theme.bg_focus
theme.bg_systray    = theme.bg_normal
theme.fg_normal     = "#ebdbb2"
theme.fg_focus      = theme.fg_normal
theme.fg_urgent     = "#cc241d"
theme.fg_minimize   = theme.fg_normal
theme.useless_gap   = dpi(5)
theme.border_width  = dpi(2)
theme.border_normal = "#928374"
theme.border_focus  = theme.fg_focus
theme.border_marked = theme.fg_normal

-- theme.hotkeys_bg = theme.bg_normal
-- theme.hotkeys_fg = theme.fg_normal
-- theme.hotkeys_border_color = theme.border_focus
-- theme.hotkeys_border_width = theme.border_width
-- theme.hotkeys_modifiers_fg = theme.fg_urgent
-- theme.hotkeys_group_margin = 10

theme.taglist_spacing       = 10
-- theme.taglist_font          = "Monospace 15"
theme.taglist_bg_focus      = theme.bg_normal -- theme.fg_focus
theme.taglist_bg_occupied   = theme.bg_normal -- theme.border_normal
theme.taglist_bg_empty      = theme.bg_normal -- theme.bg_focus
theme.taglist_fg_focus      = theme.fg_focus
theme.taglist_fg_occupied   = theme.border_normal
theme.taglist_fg_empty      = "#504954"

-- theme.wallpaper = "~/.config/awesome/themes/gruvbox/wallpaper.jpg"
theme.wallpaper = "~/Pictures/wallpapers/gruvbox/mountainside.jpeg"

theme.icon_theme = nil

return theme
