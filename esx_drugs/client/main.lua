local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX 			    			= nil
GUI.Time            			= 0
local PID           			= 0
local GUI           			= {}
-- Cocaine 
local cokeQTE       			= 0
local coke_brickQTE 			= 0
local coke_powderQTE  			= 0
local coke_crackQTE 			= 0
-- Meth
local methQTE					= 0
local meth_brickQTE     		= 0
local meth_speedQTE    			= 0
local meth_iceQTE      			= 0
-- Opium
local opiumQTE					= 0
local opium_brickQTE 			= 0
local opium_powderQTE 			= 0
local opium_heroinQTE 			= 0
-- Cannabis
local weedQTE					= 0
local weed_brickQTE 			= 0
local weed_hashQTE 		    	= 0
local weed_jointQTE 			= 0
-- other
local myJob 					= nil
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}
local isInZone                  = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

AddEventHandler('esx_ecstasy:hasEnteredMarker', function(zone)

    ESX.UI.Menu.CloseAll()

-- Zones

-- Cocaine Collection Zones

    if zone == 'CokeField' then
        if myJob ~= "police" then
            CurrentAction     = 'coke_collection'
            CurrentActionMsg  = _U('press_collect_coke')
            CurrentActionData = {}
        end
    end

    if zone == 'CokeField2' then
        if myJob ~= "police" then
            CurrentAction     = 'coke_collection'
            CurrentActionMsg  = _U('press_collect_coke')
            CurrentActionData = {}
        end
    end

-- Cocaine Proccessing Zones

    if zone == 'CokeBrick' then
        if myJob ~= "police" then
            if cokeQTE >= 100 then
                CurrentAction     = 'coke_brick_package'
                CurrentActionMsg  = _U('press_process_coke_brick')
                CurrentActionData = {}
            end
        end
    end

    if zone == 'CokePowder' then
        if myJob ~= "police" then
            if cokeQTE >= 10 then
                CurrentAction     = 'coke_powder_package'
                CurrentActionMsg  = _U('press_process_coke_powder')
                CurrentActionData = {}
            end
        end
    end

    if zone == 'CokeCrack' then
        if myJob ~= "police" then
            if cokeQTE >= 5 then
                CurrentAction     = 'coke_crack_package'
                CurrentActionMsg  = _U('press_process_coke_crack')
                CurrentActionData = {}
            end
        end
    end

-- Cocaine Dealer Zones

    if zone == 'CokeDealer' then
        if myJob ~= "police" then
            if coke_brickQTE >= 1 then  
                CurrentAction     = 'coke_brick_sell'
                CurrentActionMsg  = _U('press_sell_coke_brick')
                CurrentActionData = {}
            end
        end
    end

    if zone == 'CokeStreetDealer' then
        if myJob ~= "police" then
            if coke_powderQTE >= 1 then
                CurrentAction     = 'coke_powder_sell'
                CurrentActionMsg  = _U('press_sell_coke_powder')
                CurrentActionData = {}
            end
        end
    end

-- Meth Collection Zones

    if zone == 'MethField' then
        if myJob ~= "police" then
            CurrentAction     = 'meth_collection'
            CurrentActionMsg  = _U('press_collect_meth')
            CurrentActionData = {}
        end
    end

    if zone == 'MethField2' then
        if myJob ~= "police" then
            CurrentAction     = 'meth_collection'
            CurrentActionMsg  = _U('press_collect_meth')
            CurrentActionData = {}
        end
    end

-- Meth Proccessing Zones

    if zone == 'MethBrick' then
        if myJob ~= "police" then
            if methQTE >= 100 then
                CurrentAction     = 'meth_brick_package'
                CurrentActionMsg  = _U('press_process_meth_brick')
                CurrentActionData = {}
            end
        end
    end

    if zone == 'MethSpeed' then
        if myJob ~= "police" then
            if methQTE >= 10 then
                CurrentAction     = 'meth_speed_package'
                CurrentActionMsg  = _U('press_process_meth_speed')
                CurrentActionData = {}
            end
        end
    end

    if zone == 'MethIce' then
        if myJob ~= "police" then
            if methQTE >= 5 then
                CurrentAction     = 'meth_ice_package'
                CurrentActionMsg  = _U('press_process_meth_ice')
                CurrentActionData = {}
            end
        end
    end

-- Meth Dealer Zones

    if zone == 'MethDealer' then
        if myJob ~= "police" then
            if meth_brickQTE >= 1 then
                CurrentAction     = 'meth_brick_sell'
                CurrentActionMsg  = _U('press_sell_meth_brick')
                CurrentActionData = {}
            end
        end
    end

    if zone == 'MethStreetDealer' then
        if myJob ~= "police" then
            if meth_speedQTE >= 1 then
                CurrentAction     = 'meth_speed_sell'
                CurrentActionMsg  = _U('press_sell_meth_speed')
                CurrentActionData = {}
            end
        end
    end

-- Opium Collection Zones

    if zone == 'OpiumField' then
        if myJob ~= "police" then
            CurrentAction     = 'opium_collection'
            CurrentActionMsg  = _U('press_collect_opium')
            CurrentActionData = {}
        end
    end

    if zone == 'OpiumField2' then
        if myJob ~= "police" then
            CurrentAction     = 'opium_collection'
            CurrentActionMsg  = _U('press_collect_opium')
            CurrentActionData = {}
        end
    end

-- Opium Proccessing Zones

    if zone == 'OpiumBrick' then
        if myJob ~= "police" then
            if opiumQTE >= 100 then
                CurrentAction     = 'opium_brick_package'
                CurrentActionMsg  = _U('press_process_opium_brick')
                CurrentActionData = {}
            end
        end
    end

    if zone == 'OpiumPowder' then
        if myJob ~= "police" then
            if opiumQTE >= 10 then
                CurrentAction     = 'opium_powder_package'
                CurrentActionMsg  = _U('press_process_opium_powder')
                CurrentActionData = {}
            end
        end
    end

    if zone == 'OpiumHeroin' then
        if myJob ~= "police" then
            if opiumQTE >= 5 then
                CurrentAction     = 'opium_heroin_package'
                CurrentActionMsg  = _U('press_process_opium_heroin')
                CurrentActionData = {}
            end
        end
    end

-- Opium Dealer Zones

    if zone == 'OpiumDealer' then
        if myJob ~= "police" then
            if opium_brickQTE >= 1 then
                CurrentAction     = 'opium_brick_sell'
                CurrentActionMsg  = _U('press_sell_opium_brick')
                CurrentActionData = {}
            end
        end
    end

    if zone == 'OpiumStreetDealer' then
        if myJob ~= "police" then
            if opium_powderQTE >= 1 then   
                CurrentAction     = 'opium_powder_sell'
                CurrentActionMsg  = _U('press_sell_opium_powder')
                CurrentActionData = {}
            end
        end
    end    

-- Cannabis Collection Zones

    if zone == 'WeedField' then
        if myJob ~= "police" then
            CurrentAction     = 'opium_collection'
            CurrentActionMsg  = _U('press_collect_opium')
            CurrentActionData = {}
        end
    end

    if zone == 'WeedField2' then
        if myJob ~= "police" then
            CurrentAction     = 'opium_collection'
            CurrentActionMsg  = _U('press_collect_opium')
            CurrentActionData = {}
        end
    end

-- Cannabis Proccessing Zones

    if zone == 'WeedBrick' then
        if myJob ~= "police" then
            if weedQTE >= 100 then
                CurrentAction     = 'weed_brick_package'
                CurrentActionMsg  = _U('press_process_weed_brick')
                CurrentActionData = {}
            end
        end
    end

    if zone == 'WeedHash' then
        if myJob ~= "police" then
            if weedQTE >= 10 then
                CurrentAction     = 'weed_hash_package'
                CurrentActionMsg  = _U('press_process_weed_hash')
                CurrentActionData = {}
            end
        end
    end

    if zone == 'WeedJoint' then
        if myJob ~= "police" then
            if weedQTE >= 5 then
                CurrentAction     = 'weed_joint_package'
                CurrentActionMsg  = _U('press_process_weed_joint')
                CurrentActionData = {}
            end
        end
    end

-- Cannabis Dealer Zones

    if zone == 'WeedDealer' then
        if myJob ~= "police" then
            if weed_brickQTE >= 1 then             
                CurrentAction     = 'weed_brick_sell'
                CurrentActionMsg  = _U('press_sell_weed_brick')
                CurrentActionData = {}
        
            end
        end
    end

    if zone == 'WeedStreetDealer' then
        if myJob ~= "police" then
            if weed_hashQTE >= 1 then
                CurrentAction     = 'weed_hash_sell'
                CurrentActionMsg  = _U('press_sell_weed_hash')
                CurrentActionData = {}
        
            end
        end
    end
end)


AddEventHandler('esx_drugs:hasExitedMarker', function(zone)

    CurrentAction = nil
    ESX.UI.Menu.CloseAll()

    -- Cocaine Stop Events
    TriggerServerEvent('esx_drugs:stopCollectionCoke')
    TriggerServerEvent('esx_drugs:stopTransformCokeBrick')
    TriggerServerEvent('esx_drugs:stopTransformCokePowder')
    TriggerServerEvent('esx_drugs:stopTransformCokeCrack')
    TriggerServerEvent('esx_drugs:stopSellCokeBrick')
    TriggerServerEvent('esx_drugs:stopSellCokePowder')
    -- Meth Stop Events
    TriggerServerEvent('esx_drugs:stopCollectionMeth')
    TriggerServerEvent('esx_drugs:stopTransformMethBrick')
    TriggerServerEvent('esx_drugs:stopTransformMethSpeed')
    TriggerServerEvent('esx_drugs:stopTransformMethIce')
    TriggerServerEvent('esx_drugs:stopSellMethBrick')
    TriggerServerEvent('esx_drugs:stopSellMethSpeed')
    -- Opium Stop Events
    TriggerServerEvent('esx_drugs:stopCollectionOpium')
    TriggerServerEvent('esx_drugs:stopTransformOpiumBrick')
    TriggerServerEvent('esx_drugs:stopTransformOpiumPowder')
    TriggerServerEvent('esx_drugs:stopTransformOpiumHeroin')
    TriggerServerEvent('esx_drugs:stopSellOpiumBrick')
    TriggerServerEvent('esx_drugs:stopSellOpiumPowder')
    -- Cannabis Stop Events
    TriggerServerEvent('esx_drugs:stopCollectionWeed')
    TriggerServerEvent('esx_drugs:stopTransformWeedBrick')
    TriggerServerEvent('esx_drugs:stopTransformWeedHash')
    TriggerServerEvent('esx_drugs:stopTransformWeedJoint')
    TriggerServerEvent('esx_drugs:stopSellWeedBrick')
    TriggerServerEvent('esx_drugs:stopSellWeedHash')
end)

-- Render markers
Citizen.CreateThread(function()
    while true do

        Wait(0)

        local coords = GetEntityCoords(GetPlayerPed(-1))

        if myJob ~= "police" then -- Stops Police from seeing markers
            for k,v in pairs(Config.Zones) do
                if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.DrawDistance) then
                    DrawMarker(Config.MarkerType, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
                end
            end
		end
    end
end)

-- Create Blips
Citizen.CreateThread(function()
    
    if myJob ~= "police" then -- Stops Police from seeing markers    
	    for i=1, #Config.Map, 1 do
		
		    local blip = AddBlipForCoord(Config.Map[i].x, Config.Map[i].y, Config.Map[i].z)
		    SetBlipSprite (blip, Config.Map[i].id)
		    SetBlipDisplay(blip, 4)
		    SetBlipColour (blip, Config.Map[i].color)
		    SetBlipScale  (blip, Config.Map[i].scale)
		    SetBlipAsShortRange(blip, true)

		    BeginTextCommandSetBlipName("STRING")
		    AddTextComponentString(Config.Map[i].name)
            EndTextCommandSetBlipName(blip)
        end
    end
end)

-- Return number of items from server
RegisterNetEvent('esx_drugs:ReturnInventory')
AddEventHandler('esx_drugs:ReturnInventory', function(cokeNbr, cokebrickNbr, cokepowderNbr, cokecrackNbr, methNbr, methbrickNbr, methspeedNbr, methiceNbr, opiumNbr, opiumbrickNbr, opiumpowderNbr, opiumheroinNbr, weedNbr, weedbrickNbr, weedhashNbr, weedjointNbr, jobName, currentZone)
    -- Cocaine Inventory QTEs
    cokeQTE             = cokeNbr
	coke_brickQTE       = cokebrickNbr
    coke_powderQTE      = cokepowderNbr
    coke_crackQTE       = cokecrackNbr
    -- Meth Inventory QTEs
    methQTE             = methNbr
    meth_brickQTE       = methbrickNbr
    meth_speedQTE       = methspeedNbr
    meth_iceQTE         = methiceNbr
    -- Opium Inventory QTEs
    opiumQTE             = opiumNbr
    opium_brickQTE       = opiumbrickNbr
    opium_powderQTE      = opiumpowderNbr
    opium_heroinQTE      = opiumheroinNbr
    -- Cannabis Inventory QTEs
    weedQTE             = weedNbr
    weed_brickQTE       = weedbrickNbr
    weed_hashQTE        = weedhashNbr
    weed_jointQTE       = weedjointNbr
    -- Other
    myJob               = jobName
	TriggerEvent('esx_drugs:hasEnteredMarker', currentZone)
end)

-- Activate menu when player is inside marker
Citizen.CreateThread(function()
    while true do

        Wait(0)

        local coords      = GetEntityCoords(GetPlayerPed(-1))
        local isInMarker  = false
        local currentZone = nil

        for k,v in pairs(Config.Zones) do
            if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.ZoneSize.x / 2) then
                isInMarker  = true
                currentZone = k
            end
        end

        if isInMarker and not hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = true
            lastZone                = currentZone
            TriggerServerEvent('esx_drugs:GetUserInventory', currentZone)
        end

        if not isInMarker and hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = false
            TriggerEvent('esx_drugs:hasExitedMarker', lastZone)
        end
		if isInMarker and isInZone then
			TriggerEvent('esx_drugs:hasEnteredMarker', 'exitMarker')
        end
    end
end)

-- Key Controls
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if CurrentAction ~= nil then
            SetTextComponentFormat('STRING')
            AddTextComponentString(CurrentActionMsg)
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            if IsControlJustReleased(0, 38) then
                isInZone = true -- unless we set this boolean to false, we will always freeze the user
				if CurrentAction == 'exitMarker' then
					isInZone = false -- do not freeze user
					TriggerEvent('esx_drugs:freezePlayer', false)
					TriggerEvent('esx_drugs:hasExitedMarker', lastZone)
					Citizen.Wait(5000)
                -- Cocaine Actions
                elseif CurrentAction == 'coke_collection' then
                    TriggerServerEvent('esx_drugs:startCollectionCoke')
                elseif CurrentAction == 'coke_brick_package' then
                    TriggerServerEvent('esx_drugs:startTransformCokeBrick')
                elseif CurrentAction == 'coke_powder_package' then
                    TriggerServerEvent('esx_drugs:startTransformCokePowder')
                elseif CurrentAction == 'coke_crack_package' then
                    TriggerServerEvent('esx_drugs:startTransformCokeCrack')
                elseif CurrentAction == 'coke_brick_sell' then
                    TriggerServerEvent('esx_drugs:startSellCokeBrick')
                elseif CurrentAction == 'coke_powder_sell' then
                    TriggerServerEvent('esx_drugs:startSellCokePowder')
                -- Meth Actions       
                elseif CurrentAction == 'meth_collection' then
                    TriggerServerEvent('esx_drugs:startCollectionMeth')
                elseif CurrentAction == 'meth_brick_package' then
                    TriggerServerEvent('esx_drugs:startTransformMethBrick')
                elseif CurrentAction == 'meth_speed_package' then
                    TriggerServerEvent('esx_drugs:startTransformMethSpeed')
                elseif CurrentAction == 'meth_ice_package' then
                    TriggerServerEvent('esx_drugs:startTransformMethIce')
                elseif CurrentAction == 'meth_brick_sell' then
                    TriggerServerEvent('esx_drugs:startSellMethBrick')
                elseif CurrentAction == 'meth_speed_sell' then
                    TriggerServerEvent('esx_drugs:startSellMethSpeed')
                -- Opium Actions       
                elseif CurrentAction == 'coke_collection' then
                    TriggerServerEvent('esx_drugs:startCollectionOpium')
                elseif CurrentAction == 'coke_brick_package' then
                    TriggerServerEvent('esx_drugs:startTransformOpiumBrick')
                elseif CurrentAction == 'coke_powder_package' then
                    TriggerServerEvent('esx_drugs:startTransformOpiumPowder')
                elseif CurrentAction == 'coke_crack_package' then
                    TriggerServerEvent('esx_drugs:startTransformOpiumHeroin')
                elseif CurrentAction == 'coke_brick_sell' then
                    TriggerServerEvent('esx_drugs:startSellOpiumBrick')
                elseif CurrentAction == 'coke_powder_sell' then
                    TriggerServerEvent('esx_drugs:startSellOpiumPowder')
				else
					isInZone = false -- not a esx_drugs zone
				end
				if isInZone then
					TriggerEvent('esx_drugs:freezePlayer', true)
				end
                CurrentAction = nil
            end
        end
    end
end)

-- Freeze Player Command
RegisterNetEvent('esx_drugs:freezePlayer')
AddEventHandler('esx_drugs:freezePlayer', function(freeze)
	FreezeEntityPosition(GetPlayerPed(-1), freeze)
end)

-- Drug Effect
RegisterNetEvent('esx_drugs:onDrugs')
AddEventHandler('esx_drugs:onDrugs', function()
	RequestAnimSet("MOVE_M@DRUNK@SLIGHTLYDRUNK")
	while not HasAnimSetLoaded("MOVE_M@DRUNK@SLIGHTLYDRUNK") do
		Citizen.Wait(0)
	end
	TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING_POT", 0, true)
	Citizen.Wait(5000)
	DoScreenFadeOut(1000)
	Citizen.Wait(1000)
	ClearPedTasksImmediately(GetPlayerPed(-1))
	SetTimecycleModifier("spectator5")
	SetPedMotionBlur(GetPlayerPed(-1), true)
	SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
	SetPedIsDrunk(GetPlayerPed(-1), true)
	DoScreenFadeIn(1000)
	Citizen.Wait(120000)
	DoScreenFadeOut(1000)
	Citizen.Wait(1000)
	DoScreenFadeIn(1000)
	ClearTimecycleModifier()
	ResetScenarioTypesEnabled()
	ResetPedMovementClipset(GetPlayerPed(-1), 0)
	SetPedIsDrunk(GetPlayerPed(-1), false)
	SetPedMotionBlur(GetPlayerPed(-1), false)
end)