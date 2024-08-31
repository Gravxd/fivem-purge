local function PlayPurgeSound()
    SendNUIMessage(
        {
            transactionType = "startsound",
            transactionFile = "purge",
            transactionVolume = Config.SoundVolume
        }
    )
end

local function Initialize(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
    PushScaleformMovieFunctionParameterString(Config.Notify.Title)
    PushScaleformMovieFunctionParameterString(Config.Notify.Message)
    PopScaleformMovieFunctionVoid()
    return scaleform
end

local AnnouncementActive = false
local function ShowAnnouncement()
    CreateThread(
        function()
            while AnnouncementActive do
                scaleform = Initialize("mp_big_message_freemode")
                DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
                Wait(0)
            end
        end
    )
end

local Purge = false

local Spawned = false
AddEventHandler(
    Config.SpawnEvent,
    function()
        if Spawned then
            return
        end
        Spawned = true
        local Active = lib.callback.await("Purge:Status", false)
        if Active then
            Wait(3500)
            PlayPurgeSound()
            Purge = true
            AnnouncementActive = true
            if Config.Notify.Style == "gta" then
                ShowAnnouncement()
            else
                Notify(Config.Notify.Title, Config.Notify.Message)
            end
            SetTimeout(
                12500,
                function()
                    AnnouncementActive = false
                    if Config.NPC.RiotMode and Config.NPC.Enabled then
                        SetRiotModeEnabled(true)
                    end
                end
            )
        end
    end
)

exports(
    "Purge",
    function()
        return Purge
    end
)

RegisterNetEvent(
    "Purge:Sync",
    function(action)
        if action == "start" then
            PlayPurgeSound()
            Purge = true
            if Config.Notify.Style == "gta" then
                AnnouncementActive = true
                ShowAnnouncement()
            else
                Notify(Config.Notify.Title, Config.Notify.Message)
            end
            SetTimeout(
                12500,
                function()
                    AnnouncementActive = false
                    if Config.NPC.RiotMode and Config.NPC.Enabled then
                        SetRiotModeEnabled(true)
                    end
                end
            )
        end
    end
)
