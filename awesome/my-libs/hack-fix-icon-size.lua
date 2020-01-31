return function(naughty)
    local beautiful = require("beautiful")
    local naughty_notify = naughty.notify

    naughty.notify = function(args)
        args.icon_size = beautiful.notification_icon_size
        return naughty_notify(args)
    end
end