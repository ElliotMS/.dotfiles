local awful = require("awful")
local gears = require("gears")
local helpers = require("helpers")
-- local hotkeys_popup = require("awful.hotkeys_popup")

local keys = {}

modkey = "Mod4"

-- Mouse bindings
-- root.buttons(gears.table.join(
--     awful.button({}, 3, function () mainmenu:toggle() end),
--     awful.button({}, 4, awful.tag.viewnext),
--     awful.button({}, 5, awful.tag.viewprev)
-- ))

-- Key bindings
keys.globalkeys = gears.table.join(
    -- awful.key({modkey,          }, "s",         hotkeys_popup.show_help, {description = "show help", group="awesome"}),
    awful.key({modkey,          }, "s",         function () awful.util.spawn("flameshot gui") end, {}),
    awful.key({                 }, "Print",     function () awful.util.spawn("flameshot full -p /home/elliot/Pictures/screenshots/") end, {}),
    awful.key({modkey,          }, "Left",      awful.tag.viewprev, {description = "view previous", group = "tag"}),
    awful.key({modkey,          }, "Right",     awful.tag.viewnext, {description = "view next", group = "tag"}),
    awful.key({modkey,          }, "Escape",    awful.tag.history.restore, {description = "go back", group = "tag"}),
    awful.key({modkey,          }, "j",         function () awful.client.focus.byidx( 1) end, {description = "focus next by index", group = "client"}),
    awful.key({modkey,          }, "k",         function () awful.client.focus.byidx(-1) end, {description = "focus previous by index", group = "client"}),
    -- awful.key({modkey,          }, "w",         function () mymainmenu:show() end, {description = "show main menu", group = "awesome"}),
	awful.key({modkey,          }, "w",         helpers.toggle_wibar, {description = "toggle wibar", group = "awesome"}),

    -- Layout manipulation
    awful.key({modkey, "Shift"  }, "j",         function () awful.client.swap.byidx(  1) end, {description = "swap with next client by index", group = "client"}),
    awful.key({modkey, "Shift"  }, "k",         function () awful.client.swap.byidx( -1) end, {description = "swap with previous client by index", group = "client"}),
    awful.key({modkey, "Control"}, "j",         function () awful.screen.focus_relative( 1) end, {description = "focus the next screen", group = "screen"}),
    awful.key({modkey, "Control"}, "k",         function () awful.screen.focus_relative(-1) end, {description = "focus the previous screen", group = "screen"}),
    awful.key({modkey,          }, "u",         awful.client.urgent.jumpto, {description = "jump to urgent client", group = "client"}),
    awful.key({modkey,          }, "Tab",       helpers.client.focus_prev, {description = "go back", group = "client"}), 

    -- Standard  
    awful.key({modkey,          }, "Return",    function () awful.spawn(terminal) end, {description = "open a terminal", group = "launcher"}),
    awful.key({modkey, "Control"}, "r",         awesome.restart, {description = "reload awesome", group = "awesome"}),
    awful.key({modkey, "Shift"  }, "q",         awesome.quit, {description = "quit awesome", group = "awesome"}),
    awful.key({modkey,          }, "l",         function () awful.tag.incmwfact( 0.05) end, {description = "increase master width factor", group = "layout"}),
    awful.key({modkey,          }, "h",         function () awful.tag.incmwfact(-0.05) end, {description = "decrease master width factor", group = "layout"}),
    awful.key({modkey, "Shift"  }, "h",         function () awful.tag.incnmaster( 1, nil, true) end, {description = "increase the number of master clients", group = "layout"}),
    awful.key({modkey, "Shift"  }, "l",         function () awful.tag.incnmaster(-1, nil, true) end, {description = "decrease the number of master clients", group = "layout"}),
    awful.key({modkey, "Control"}, "h",         function () awful.tag.incncol( 1, nil, true) end, {description = "increase the number of columns", group = "layout"}),
    awful.key({modkey, "Control"}, "l",         function () awful.tag.incncol(-1, nil, true) end, {description = "decrease the number of columns", group = "layout"}),
    awful.key({modkey,          }, "space",     function () awful.layout.inc( 1) end, {description = "select next", group = "layout"}),
    awful.key({modkey, "Shift"  }, "space",     function () awful.layout.inc(-1) end, {description = "select previous", group = "layout"}),
    awful.key({modkey, "Control"}, "n",         helpers.client.restore_minimized, {description = "restore minimized", group = "client"}),

    -- Prompt
    awful.key({modkey,          }, "r",         function () awful.util.spawn("rofi -show run") end, {description = "rofi run", group = "launcher"}),
    awful.key({modkey,          }, "d",         function () awful.util.spawn("rofi -show drun") end, {description = "rofi drun", group = "launcher"}),
    -- awful.key({modkey,          }, "r",         helpers.lua_prompt, {description = "lua execute prompt", group = "awesome"}),

    -- Menubar
    -- awful.key({modkey,          }, "p",         function () menubar.show() end, {description = "show the menubar", group = "launcher"}),

    -- Multimedia
    awful.key({     }, "XF86MonBrightnessDown", function () awful.util.spawn("brightnessctl s 10%-") end),
    awful.key({     }, "XF86MonBrightnessUp",   function () awful.util.spawn("brightnessctl s +10%") end),
    awful.key({     }, "XF86AudioMute",         function () awful.util.spawn("pulsemixer --toggle-mute") end),
    awful.key({     }, "XF86AudioLowerVolume",  function () awful.util.spawn("pulsemixer --change-volume -5") end),
    awful.key({     }, "XF86AudioRaiseVolume",  function () awful.util.spawn("pulsemixer --change-volume +5") end),
    awful.key({     }, "XF86AudioMicMute",      function () awful.util.spawn("amixer set Dmic0 toggle") end)
)

keys.clientkeys = gears.table.join(
    awful.key({modkey,          }, "f",         function (c) helpers.client.toggle_attr(c, "fullscreen") end, {description = "toggle fullscreen", group = "client"}),
    awful.key({modkey, "Shift"  }, "c",         function (c) c:kill() end, {description = "close", group = "client"}),
    awful.key({modkey, "Control"}, "space",     awful.client.floating.toggle, {description = "toggle floating", group = "client"}),
    awful.key({modkey, "Control"}, "Return",    function (c) c:swap(awful.client.getmaster()) end, {description = "move to master", group = "client"}),
    awful.key({modkey,          }, "o",         function (c) c:move_to_screen() end, {description = "move to screen", group = "client"}),
    awful.key({modkey,          }, "t",         function (c) c.ontop = not c.ontop end, {description = "toggle keep on top", group = "client"}),
    awful.key({modkey,          }, "n",         function (c) c.minimized = true end, {description = "minimize", group = "client"}),
    awful.key({modkey,          }, "m",         function (c) helpers.client.toggle_attr(c, "maximized") end, {description = "(un)maximize", group = "client"}),
    awful.key({modkey, "Control"}, "m",         function (c) helpers.client.toggle_attr(c, "maximized_vertical") end, {description = "(un)maximize vertically", group = "client"}),
    awful.key({modkey, "Shift"  }, "m",         function (c) helpers.client.toggle_attr(c, "maximized_horizontal") end, {description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
local ntags = 5
for i = 1, ntags do
    keys.globalkeys = gears.table.join(keys.globalkeys,
        awful.key({modkey,                   }, "#"..i+9, function () helpers.tag.view(i) end, {description = "view tag #"..i, group = "tag"}),
        awful.key({modkey, "Control"         }, "#"..i+9, function () helpers.tag.toggle(i) end, {description = "toggle tag #" .. i, group = "tag"}),
        awful.key({modkey, "Shift"           }, "#"..i+9, function () helpers.client.move_focused_to_tag_index(i) end, {description = "move focused client to tag #"..i, group = "tag"}),
        awful.key({modkey, "Control", "Shift"}, "#"..i+9, function () helpers.client.toggle_focused_on_tag_index(i) end, {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

keys.clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

return keys
