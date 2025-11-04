-- Target Settings Management (Client)
-- Handles player-specific target UI customization and persistence

local targetSettings = nil
local hasInitialized = false

-- Retrieves the current target settings for the player
-- @return table The target settings configuration
function GetTargetSettings()
    local playerState = LocalPlayer.state
    local savedSettings = playerState.targetSettings
    
    if savedSettings then
        if savedSettings.hasSavedTargetOptions then
            if Config["Target-Settings"].Settings["Enable-Player-Menu"] then
                local settings = {
                    mainColor = savedSettings.mainColor,
                    hoverColor = savedSettings.hoverColor,
                    backgroundColor = savedSettings.backgroundColor,
                    eyeIcon = savedSettings.eyeIcon,
                    eyeSize = savedSettings.eyeSize,
                    defaultEyeColor = savedSettings.eyeColor,
                    textColor = savedSettings.textColor,
                    eyeLeft = savedSettings.eyeLeft,
                    eyeTop = savedSettings.eyeTop,
                    uiScale = savedSettings.uiScale,
                    textSize = savedSettings.textSize
                }
                
                targetSettings = settings
                return settings
            end
        end
    else
        -- Return default settings from config
        local defaults = Config["Target-Settings"].Defaults
        local settings = {
            mainColor = defaults["Main-Color"],
            hoverColor = defaults["Hover-Color"],
            backgroundColor = defaults["Background-Color"],
            eyeIcon = defaults["Eye-Icon"],
            eyeSize = defaults["Eye-Size"],
            defaultEyeColor = defaults["Eye-Color"],
            textColor = defaults["Text-Color"],
            eyeLeft = defaults["Eye-Left"],
            eyeTop = defaults["Eye-Top"],
            uiScale = defaults["UI-Scale"],
            textSize = defaults["Text-Size"]
        }
        
        return settings
    end
end

-- Monitor for changes to target settings in player state
AddStateBagChangeHandler(
    "targetSettings",
    ("player:%s"):format(cache.serverId),
    function(bagName, key, value, reserved, replicated)
        if value then
            targetSettings = nil
            hasInitialized = true
        end
    end
)

-- Opens the target settings customization menu
function OpenTargetSettings()
    SetNuiFocus(true, true)
    SendNUIMessage({
        event = "openTargetSettings"
    })
end

-- Handle saving target configuration from NUI
RegisterNUICallback("saveTargetConfigurations", function(data, callback)
    SetNuiFocus(false, false)
    TriggerServerEvent("SK-Target:Server:SaveTargetConfig", data)
    callback("ok")
end)

-- Handle closing target settings menu
RegisterNUICallback("closeTargetSettings", function(data, callback)
    SetNuiFocus(false, false)
    callback("ok")
end)

-- Register command to open target settings if enabled
if Config["Target-Settings"].Settings["Enable-Player-Menu"] then
    RegisterCommand(
        Config["Target-Settings"].Settings["Player-Menu-Command"],
        function()
            OpenTargetSettings()
        end,
        false
    )
end

-- Initialize target settings on player spawn
CreateThread(function()
    -- Wait for server ID to be available
    while not cache.serverId do
        Wait(100)
    end
    
    -- Request settings from server if player menu is enabled
    if Config["Target-Settings"].Settings["Enable-Player-Menu"] then
        TriggerServerEvent("SK-Target:Server:UpdateTargetConfig", cache.serverId)
    end
end)
