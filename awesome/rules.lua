local awful = require("awful")
local beautiful = require("beautiful")

return function (clientkeys, clientbuttons)
    return {
        -- All clients will match this rule.
        { 
            rule = { },
            properties = { 
                border_width = beautiful.border_width,
                border_color = beautiful.border_normal,
                focus = awful.client.focus.filter,
                raise = true,
                keys = clientkeys,
                buttons = clientbuttons,
                screen = awful.screen.preferred,
                placement = awful.placement.no_overlap+awful.placement.no_offscreen,
                size_hints_honor = false,
                maximized = false,
                maximized_vertical   = false,
                maximized_horizontal = false,
            }
        },
        -- Floating clients.
        { 
            rule_any = {
                instance = {
                    "DTA",  -- Firefox addon DownThemAll.
                    "copyq",  -- Includes session name in class.
                    "pinentry",
                },
                class = {
                    "Arandr",
                    "Blueman-manager",
                    "Gpick",
                    "Kruler",
                    "MessageWin",  -- kalarm.
                    "Sxiv",
                    "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
                    "Wpa_gui",
                    "veromix",
                    "xtightvncviewer"
                },
                -- Note that the name property shown in xprop might be set slightly after creation of the client
                -- and the name shown there might not match defined rules here.
                name = {
                    "Event Tester",  -- xev.
                },
                role = {
                    "AlarmWindow",  -- Thunderbird's calendar.
                    "ConfigManager",  -- Thunderbird's about:config.
                    "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
                }
            },
            properties = {
                floating = true
            }
        },
        -- Add titlebars to normal clients and dialogs
        {
            rule_any = {
                type = { "normal", "dialog" }
            },
            properties = {
                titlebars_enabled = false
            }
        },
        -- Set common browsers to always map on the tag named "2" on screen 1.
        {
            rule_any = {
                class = {
                    "Firefox",
                    "Google-chrome",
                    "Chromium",
                }
            },
            properties = {
                screen = 1,
                tag = "2"
            }
        },
        -- Code editors assigned to tag 3 screen 1
        {
            rule_any = {
                class = {
                    "Code",
                }
            },
            properties = {
                screen = 1,
                tag = "3"
            }
        },
        -- Tag 4 screen 1
        {
            rule_any = {
                class = {
                    "TelegramDesktop",
                    "Skype",
                }
            },
            properties = {
                screen = 1,
                tag = "4"
            }
        },
        -- Tag 5 screen 1
        {
            rule_any = {
                class = {
                    "discord",
                }
            },
            properties = {
                screen = 1,
                tag = "5",
                maximized = true,
                floating = true
            }
        },
        -- Tag 6 screen 1
        {
            rule_any = {
                class = {
                    "Mattermost",
                    "zoom",
                }
            },
            properties = {
                screen = 1,
                tag = "6"
            }
        },
    }
end