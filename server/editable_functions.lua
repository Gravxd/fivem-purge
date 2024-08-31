function EnablePurgeWeather()
    if Config.WeatherResource == "vMenu" then
        TriggerEvent("vMenu:UpdateServerTime", 0, 0, true)
        TriggerEvent("vMenu:UpdateServerWeather", "HALLOWEEN", true, false, false)
        -- Weather --> Blackout (params)

        if Config.RandomBlackouts then
            local function Blackout(bool)
                TriggerEvent("vMenu:UpdateServerWeather", "HALLOWEEN", bool, false, false)
            end
    
            CreateThread(function()
                while true do
                    Wait(5000)
        
                    local random = math.random(1000, 5000)
                    Blackout(true)
                    Wait(random)
                    Blackout(false)
                end
            end)
        end

    else
        -- your code here

        if Config.RandomBlackouts then
            
        end

    end
end
