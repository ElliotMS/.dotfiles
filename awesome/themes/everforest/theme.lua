local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local theme = {}

-- Colors from httts://github.com/sainnhe/everforest (Dark & Hard)
bg_dim      = "#1e2326"
bg0         = "#272e33"
bg1         = "#2e383c"
bg2         = "#374145"
bg3         = "#414b50"
bg4         = "#495156"
bg5         = "#4f5b58"
bg_red      = "#4c3743"
bg_visual   = "#493b40"
bg_yellow   = "#45443c"
bg_green    = "#3c4841"
bg_blue     = "#384b55"
red         = "#e67e80"
orange      = "#e69875"
yellow      = "#dbbc7f"
green       = "#a7c080"
blue        = "#7fbbb3"
aqua        = "#83c095"
purple      = "#d699b6"
fg          = "#d3c6aa"
statusline1 = "#a7c080"
statusline2 = "#d3c6aa"
statusline3 = "#e67e80"
gray0       = "#7a8478"
gray1       = "#859289"
gray2       = "#9da9a0"


theme.font          = "sans 12"

theme.bg_normal     = bg_dim
theme.bg_focus      = bg0
theme.bg_urgent     = statusline3
theme.bg_minimize   = bg_dim
theme.bg_systray    = bg_dim
theme.fg_normal     = fg
theme.fg_focus      = fg
theme.fg_urgent     = fg
theme.fg_minimize   = fg
theme.useless_gap   = dpi(5)
theme.border_width  = dpi(1)
theme.border_normal = bg_dim
theme.border_focus  = fg
theme.border_marked = fg

theme.taglist_spacing = 10
theme.taglist_bg_focus = fg
theme.taglist_bg_occupied = bg5
theme.taglist_bg_empty = bg0

theme.wallpaper = "~/.config/awesome/themes/everforest/wallpaper.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme