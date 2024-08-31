function Notify(title, msg)
    -- example notify for ox_lib
    lib.notify(
        {
            title = title,
            description = msg,
            duration = 10000,
            type = "inform",
            position = "center-right"
        }
    )
end
