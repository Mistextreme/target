-- Target Settings Management (Server)
-- Handles persistence and synchronization of player target settings

-- Gets the primary license identifier for a player
-- @param playerId number The server ID of the player
-- @return string|nil The license identifier or nil if not found
local function getPlayerLicense(playerId)
    local identifiers = GetPlayerIdentifiers(playerId)
    
    for _, identifier in ipairs(identifiers) do
        if identifier:sub(1, 8) == "license:" then
            return identifier
        end
    end
    
    return nil
end

-- Cache of active player settings
local activePlayerSettings = {}

-- Load and apply saved target settings when player joins
if Config["Target-Settings"].Settings["Enable-Player-Menu"] then
    AddEventHandler("playerJoining", function()
        local playerId = source
        local license = getPlayerLicense(playerId)
        
        if not license then
            return
        end
        
        -- Retrieve saved settings from KVP storage
        local savedData = GetResourceKvpString(license)
        
        if savedData then
            local settings = json.decode(savedData)
            
            if settings then
                -- Apply settings to player state
                local playerState = Player(playerId).state
                playerState:set("targetSettings", settings, true)
                activePlayerSettings[playerId] = settings
            end
        end
    end)
    
    -- Clean up player settings when they disconnect
    AddEventHandler("playerDropped", function()
        local playerId = source
        activePlayerSettings[playerId] = nil
    end)
    
    -- Save player target configuration
    RegisterServerEvent("SK-Target:Server:SaveTargetConfig", function(configData)
        local playerId = source
        local license = getPlayerLicense(playerId)
        
        if not license then
            return
        end
        
        -- Notify player of save progress
        TriggerClientEvent("ox_lib:notify", playerId, {
            description = "Saving, Please wait: 2 seconds."
        })
        
        -- Build settings object
        local settings = {
            hasSavedTargetOptions = true,
            mainColor = configData.mainColor,
            hoverColor = configData.hoverColor,
            backgroundColor = configData.backgroundColor,
            eyeIcon = configData.eyeIcon,
            eyeSize = configData.eyeSize,
            eyeColor = configData.defaultEyeColor,
            eyeActiveColor = configData.activeEyeColor,
            textColor = configData.textColor,
            eyeLeft = configData.eyeLeft,
            eyeTop = configData.eyeTop,
            uiScale = configData.uiScale,
            textSize = configData.textSize
        }
        
        -- Update player state
        local playerState = Player(playerId).state
        playerState:set("targetSettings", settings, true)
        activePlayerSettings[playerId] = settings
        
        -- Persist to KVP storage
        SetResourceKvp(license, json.encode(settings))
        
        -- Progress notifications
        Wait(1000)
        TriggerClientEvent("ox_lib:notify", playerId, {
            description = "Saving, Please wait: 1 seconds."
        })
        
        Wait(1000)
        TriggerClientEvent("ox_lib:notify", playerId, {
            description = "Saving Complete",
            type = "success"
        })
    end)
    
    -- Update/sync player target configuration on request
    RegisterServerEvent("SK-Target:Server:UpdateTargetConfig", function(playerId)
        local license = getPlayerLicense(playerId)
        
        if not license then
            return
        end
        
        local savedData = GetResourceKvpString(license)
        
        if savedData then
            local settings = json.decode(savedData)
            
            if settings then
                local playerState = Player(playerId).state
                playerState:set("targetSettings", settings, true)
                activePlayerSettings[playerId] = settings
            end
        end
    end)
end

-- Callback to retrieve player settings
lib.callback.register("SK-Target:GetIdent", function(playerId)
    return activePlayerSettings[playerId]
end)

-- Command to reset player target settings to defaults
if Config["Target-Settings"].Settings["Reset-Player-Target"] then
    RegisterCommand(
        Config["Target-Settings"].Settings["Player-Reset-Command"],
        function(playerId, args, rawCommand)
            -- Only allow players to reset their own settings
            if playerId == 0 then
                return
            end
            
            local license = getPlayerLicense(playerId)
            
            if not license then
                return
            end
            
            -- Delete saved settings
            DeleteResourceKvp(license)
            
            -- Clear player state
            local playerState = Player(playerId).state
            playerState:set("targetSettings", nil, true)
            activePlayerSettings[playerId] = nil
            
            -- Notify player of reset progress
            TriggerClientEvent("ox_lib:notify", playerId, {
                description = "Resetting, Please wait: 2 seconds."
            })
            
            Wait(1000)
            TriggerClientEvent("ox_lib:notify", playerId, {
                description = "Resetting, Please wait: 1 seconds."
            })
            
            Wait(1000)
            TriggerClientEvent("ox_lib:notify", playerId, {
                description = "Target Reset Complete | Refresh your eye by opening and closing it!",
                type = "success"
            })
        end,
        false
    )
end

-- Clear all player states when resource stops
AddEventHandler("onResourceStop", function(resourceName)
    if GetCurrentResourceName() ~= resourceName then
        return
    end
    
    -- Clear state for all active players
    for playerId, settings in pairs(activePlayerSettings) do
        if GetPlayerPing(playerId) > 0 then
            local playerState = Player(playerId).state
            playerState:set("targetSettings", nil, true)
        end
    end
end)
