local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")

local helpers = {
    client = {},
    tag = {},
}

-- Client
function helpers.client.focus_prev()
    awful.client.focus.history.previous()
    if client.focus then
        client.focus:raise()
    end
end

function helpers.client.restore_minimized()
    local c = awful.client.restore()
    -- Focus restored client
    if c then
        c:emit_signal(
            "request::activate", "key.unminimize", {raise = true}
        )
    end
end

function helpers.client.toggle_attr(c, attr)
    c[attr] = not c[attr]
    c:raise()
end

function helpers.client.move_focused_to_tag_index(i)
    if client.focus then
        local tag = client.focus.screen.tags[i]
        if tag then
            client.focus:move_to_tag(tag)
        end
   end
end

function helpers.client.move_focused_to_tag(t)
    if client.focus then
        client.focus:move_to_tag(t)
    end
end

function helpers.client.toggle_focused_on_tag_index(i)
    if client.focus then
        local tag = client.focus.screen.tags[i]
        if tag then
            client.focus:toggle_tag(tag)
        end
    end
end

function helpers.client.toggle_focused_on_tag(t)
    if client.focus then
        client.focus:toggle_tag(t)
    end
end

-- Tag
function helpers.tag.view(i)
    local screen = awful.screen.focused()
    local tag = screen.tags[i]
    if tag then
       tag:view_only()
    end
end

function helpers.tag.toggle(i)
    local screen = awful.screen.focused()
    local tag = screen.tags[i]
    if tag then
       awful.tag.viewtoggle(tag)
    end
end

-- Other
function helpers.set_wallpaper(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

function helpers.lua_prompt()
    awful.prompt.run {
        prompt       = "Run Lua code: ",
        textbox      = awful.screen.focused().mypromptbox.widget,
        exe_callback = awful.util.eval,
        history_path = awful.util.get_cache_dir() .. "/history_eval"
    }
end

function helpers.focus_highest()
    local s = awful.screen.focused()
    local c = awful.client.focus.history.get(s, 0)
    if c == nil then return end
    awful.client.focus.byidx(0, c)
end

function helpers.toggle_wibar()
	for s in screen do 
		s.wibox.visible = not s.wibox.visible
	end
end

return helpers
