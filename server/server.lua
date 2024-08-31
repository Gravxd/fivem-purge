local Purge = false
exports("Purge", function()
    return Purge
end)

lib.callback.register(
    "Purge:Status",
    function()
        return Purge
    end
)

local function StartPurge()
    if Purge then
        return
    end

    Purge = true

    EnablePurgeWeather()

    SetTimeout(
        5000,
        function()
            TriggerClientEvent("Purge:Sync", -1, "start")
            SetTimeout(
                10000,
                function()
                    if Config.NPC.Enabled then
                        SetRoutingBucketPopulationEnabled(0, true)
                    end
                end
            )
        end
    )
end

if Config.Triggers.ScheduledRestart then
    AddEventHandler(
        "txAdmin:events:scheduledRestart",
        function(eventData)
            if eventData.secondsRemaining == Config.Triggers.ScheduledRestart then
                StartPurge()
            end
        end
    )
end

if Config.Triggers.Command then
    RegisterCommand(
        "purge",
        function(source, args, rawCommand)
            StartPurge()
        end,
        true
    )
end
