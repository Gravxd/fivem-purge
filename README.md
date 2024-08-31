# Purge! [FiveM]
A purge-style in-game event for your players!

![chrome_jBYYjRojnW](https://github.com/user-attachments/assets/67d54f74-32be-4847-a6ba-a4bbb979f451)

Originally created for CaliRP, but thought i'd release so people can use it themselves and have fun with it with halloween approaching!

## Youtube Trailer
https://www.youtube.com/watch?v=aUx4WiRaRhs&t=1s

I made some edits to make it more friendly for GitHub including editable files for people with different resources.

### Exports
exports("Purge") -- SHARED (can be used on client OR server) - (handy to get purge status for scripts that conditions change e.g revive script)

### Easy To Edit Config
```lua
Config = {
    Triggers = {
        -- you can have both command and auto trigger
        Command = true, -- Should the purge be started by a command?
        ScheduledRestart = 180 -- How many seconds before a scheduled restart should the purge auto start? To disable, set to false
    },
    WeatherResource = "vMenu", -- If vMenu does not handle your weather, please change this to "custom" and edit the function in editable_functions.lua
    RandomBlackouts = true,
    NPC = {
        Enabled = true, -- If you want to enable NPCs during the event, set this to true
        RiotMode = true -- Should they also attack players with weapons?
    },
    SpawnEvent = "playerSpawned", -- custom spawn selector, you can add that event here once the player fully spawns in to start the purge on their end if they load in after its already started
    Notify = {
        Style = "gta", -- What style of notifications? For custom, put "custom" - By default it does a big message from GTA, but you can edit this in the editable_functions.lua
        Title = "~r~EMERGENCY BROADCAST ANNOUNCEMENT",
        Message = "Stay safe. Seek shelter. Be cautious of the locals, they will attack you. You can do /revive"
    },
    SoundVolume = 0.65, -- Volume of the sound
}
```

### Dependencies
[ox_lib](https://github.com/overextended/ox_lib/releases/latest)

This resource is configured to use vMenu for weather but you can change it yourself in the easy to edit config files.
If you have vMenu, this will be a drag and drop.
