local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local helpers = require("helpers")
local beautiful = require("beautiful")

local lain = require("lain")
local markup = lain.util.markup 

-- Widgets
local textclock = wibox.widget {
    widget = wibox.widget.textclock,
    format = ' %R',
}

local bat = lain.widget.bat({
    battery = "BAT0",
    timeout = 1,
    settings = function()
        local perc = bat_now.perc
        local color = beautiful.fg_normal
        if bat_now.status == "Charging" or bat_now.status == "Full" then
            color = "#8ec07c"
        end
        widget:set_markup(markup("#94928F", " Bat ") .. markup(color, perc  .. "% "))
    end
})

local vol = lain.widget.pulse({
    timeout = 0.1,
    settings = function()
        level = volume_now.left .. "% "
        color = beautiful.fg_normal
        if volume_now.muted == "yes" then
            color = "#504954"
        end
        
        widget:set_markup(markup("#94928F", " Vol ") .. markup(color, level))
    end
})

local net = lain.widget.net({
    settings = function()
        if net_now.state == "up" then 
            state = "On "
            color = beautiful.fg_normal
        else 
            state = "Off "
            color = "#504954"
         end
        widget:set_markup(markup("#94928F", " Net ") .. markup(color, state))
    end
})

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({      }, 1, function(t) t:view_only() end),
                    awful.button({modkey}, 1, function(t) helpers.client.move_focused_to_tag(t) end),
                    awful.button({      }, 3, awful.tag.viewtoggle),
                    awful.button({modkey}, 3, function(t) helpers.client.toggle_focused_on_tag(t) end),
                    awful.button({      }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({      }, 5, function(t) awful.tag.viewprev(t.screen) end))

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    helpers.set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({"1", "2", "3", "4", "5"}, s, awful.layout.layouts[1])

    -- Create a taglist widget
    s.taglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
    }

    -- Create the wibox
    s.wibox = awful.wibar({
		position = "top", 
		screen = s, 
		height = 30,
	})

    -- Add widgets to the wibox
    s.wibox:setup {
        layout = wibox.layout.align.horizontal,
        expand = 'none',
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            textclock,
        },
        s.taglist, -- Middle widgetlayout
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            -- wibox.widget.systray(),
            vol.widget,
            net.widget,
            bat.widget,
        },
    }
end)
