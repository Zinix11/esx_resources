ESX 						         = nil
local CopsConnected       	        = 0
--Cocaine
local PlayersHarvestingCoke         = {}
local PlayersTransformCokeBrick     = {}
local PlayersTransformCokePowder    = {}
local PlayersTransformCokeCrack     = {}
local PlayersSellCokeBrick          = {}
local PlayersSellCokePowder         = {}
-- Meth
local PlayersHarvestingMeth         = {}
local PlayersTransformMethBrick     = {}
local PlayersTransformMethSpeed     = {}
local PlayersTransformMethIce       = {}
local PlayersSellMethBrick          = {}
local PlayersSellMethSpeed          = {}
-- Opium
local PlayersHarvestingOpium        = {}
local PlayersTransformOpiumBrick    = {}
local PlayersTransformOpiumPowder   = {}
local PlayersTransformOpiumHeroin   = {}
local PlayersSellOpiumBrick         = {}
local PlayersSellOpiumPowder        = {}
-- Cannabis
local PlayersHarvestingWeed         = {}
local PlayersTransformWeedBrick     = {}
local PlayersTransformWeedHash      = {}
local PlayersTransformWeedJoint     = {}
local PlayersSellWeedBrick          = {}
local PlayersSellWeedHash           = {}

-- Cop Count
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function CountCops()

	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			CopsConnected = CopsConnected + 1
		end
	end

    SetTimeout(5000, CountCops)
    
end

CountCops()

-- Cocaine

-- Stage 1 Cocaine Extraction
local function HarvestCoke(source)

	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoke))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingCoke[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local coke = xPlayer.getInventoryItem('coke')

			if coke.limit ~= -1 and coke.count >= coke.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_coke'))
			else
				xPlayer.addInventoryItem('coke', 1)
				HarvestCoke(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startCollectionCoke')
AddEventHandler('esx_drugs:startCollectionCoke', function()

	local _source = source

	PlayersHarvestingCoke[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('extract_in_prog'))

	HarvestCoke(_source)

end)

RegisterServerEvent('esx_drugs:stopCollectionCoke')
AddEventHandler('esx_drugs:stopCollectionCoke', function()

	local _source = source

	PlayersHarvestingCoke[_source] = false

end)

-- Stage 2 Manufacturing

-- Brick Manufacturing
local function TransformCokeBrick(source)

	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoke))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformCokeBrick[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local cokeQuantity = xPlayer.getInventoryItem('coke').count
			local brickQuantity = xPlayer.getInventoryItem('meth_brick').count

			if brickQuantity > 5 then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_meth_brick'))
			elseif cokeQuantity < 100 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_coke'))
			else
				xPlayer.removeInventoryItem('coke', 100)
				xPlayer.addInventoryItem('meth_brick', 1)
			
				TransformCokeBrick(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformCokeBrick')
AddEventHandler('esx_drugs:startTransformCokeBrick', function()

	local _source = source

	PlayersTransformCokeBrick[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformCokeBrick(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformCokeBrick')
AddEventHandler('esx_drugs:stopTransformCokeBrick', function()

	local _source = source

	PlayersTransformCokeBrick[_source] = false

end)

-- Powdered Cocaine Manufacturing
local function TransformCokePowder(source)

	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoke))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformCokePowder[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local cokeQuantity = xPlayer.getInventoryItem('coke').count
			local powderQuantity = xPlayer.getInventoryItem('coke_powder').count

			if powderQuantity > 50 then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_coke_powder'))
			elseif cokeQuantity < 10 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_coke'))
			else
				xPlayer.removeInventoryItem('coke', 10)
				xPlayer.addInventoryItem('coke_powder', 1)
			
				TransformCokePowder(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformCokePowder')
AddEventHandler('esx_drugs:startTransformCokePowder', function()

	local _source = source

	PlayersTransformCokePowder[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformCokePowder(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformCokePowder')
AddEventHandler('esx_drugs:stopTransformCokePowder', function()

	local _source = source

	PlayersTransformCokePowder[_source] = false

end)

-- Crack Cocaine Manufacturing
local function TransformCokeCrack(source)

	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoke))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformCokeCrack[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local cokeQuantity = xPlayer.getInventoryItem('coke').count
			local crackQuantity = xPlayer.getInventoryItem('coke_crack').count

			if crackQuantity > 100 then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_coke_crack'))
			elseif cokeQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_coke'))
			else
				xPlayer.removeInventoryItem('coke', 5)
				xPlayer.addInventoryItem('coke_crack', 1)
			
				TransformCokeCrack(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformCokeCrack')
AddEventHandler('esx_drugs:startTransformCokeCrack', function()

	local _source = source

	PlayersTransformCokeCrack[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformCokeCrack(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformCokeCrack')
AddEventHandler('esx_drugs:stopTransformCokeCrack', function()

	local _source = source

	PlayersTransformCokeCrack[_source] = false

end)

-- Stage 3 Selling

-- Brick Selling

local function SellCokeBrick(source)

	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoke))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellCokeBrick[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local brickQuantity = xPlayer.getInventoryItem('coke_brick').count

			if brickQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_coke_brick_sale'))
			else
				xPlayer.removeInventoryItem('coke_brick', 1)
				if CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 2742)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke_brick'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 2742)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke_brick'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 2742)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke_brick'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 2742)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke_brick'))
				end
				
				SellCokeBrick(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startSellCokeBrick')
AddEventHandler('esx_drugs:startSellCokeBrick', function()

	local _source = source

	PlayersSellCokeBrick[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellCokeBrick(_source)

end)

RegisterServerEvent('esx_drugs:stopSellCokeBrick')
AddEventHandler('esx_drugs:stopSellCokeBrick', function()

	local _source = source

	PlayersSellCokeBrick[_source] = false

end)

-- Powdered Cocaine Selling
local function SellCokePowder(source)

	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoke))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellCokePowder[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local powderQuantity = xPlayer.getInventoryItem('coke_powder').count

			if powderQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_coke_powder_sale'))
			else
				xPlayer.removeInventoryItem('coke_powder', 1)                  
				if CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 425)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke_powder'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 425)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke_powder'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 425)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke_powder'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 425)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke_powder'))
				end
				
				SellCokePowder(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellCokePowder')
AddEventHandler('esx_drugs:startSellCokePowder', function()

	local _source = source

	PlayersSellCokePowder[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellCokePowder(_source)

end)

RegisterServerEvent('esx_drugs:stopSellCokePowder')
AddEventHandler('esx_drugs:stopSellCokePowder', function()

	local _source = source

	PlayersSellCokePowder[_source] = false

end)

-- Meth

-- Stage 1 Meth Production
local function HarvestingMeth(source)

	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMeth))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingMeth[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local meth = xPlayer.getInventoryItem('meth')

			if meth.limit ~= -1 and meth.count >= meth.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_meth'))
			else
				xPlayer.addInventoryItem('meth', 1)
				HarvestingMeth(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startCollectionMeth')
AddEventHandler('esx_drugs:startCollectionMeth', function()

	local _source = source

	PlayersHarvestingMeth[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('produce_in_prog'))

	HarvestingMeth(_source)

end)

RegisterServerEvent('esx_drugs:startCollectionMeth')
AddEventHandler('esx_drugs:startCollectionMeth', function()

	local _source = source

	PlayersHarvestingMeth[_source] = false

end)

-- Stage 2 Manufacturing

-- Brick Manufacturing
local function TransformMethBrick(source)

	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMeth))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformMethBrick[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local methQuantity = xPlayer.getInventoryItem('meth').count
			local brickQuantity = xPlayer.getInventoryItem('meth_brick').count

			if brickQuantity > 5 then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_meth_brick'))
			elseif methQuantity < 100 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_meth'))
			else
				xPlayer.removeInventoryItem('meth', 100)
				xPlayer.addInventoryItem('meth_brick', 1)
			
				TransformMethBrick(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformMethBrick')
AddEventHandler('esx_drugs:startTransformMethBrick', function()

	local _source = source

	PlayersTransformMethBrick[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformMethBrick(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformMethBrick')
AddEventHandler('esx_drugs:stopTransformMethBrick', function()

	local _source = source

	PlayersTransformMethBrick[_source] = false

end)

-- Speed Manufacturing
local function TransformMethSpeed(source)

	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMeth))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformMethSpeed[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local methQuantity = xPlayer.getInventoryItem('meth').count
			local speedQuantity = xPlayer.getInventoryItem('meth_speed').count

			if speedQuantity > 50 then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_meth_speed'))
			elseif methQuantity < 10 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_meth'))
			else
				xPlayer.removeInventoryItem('meth', 10)
				xPlayer.addInventoryItem('meth_speed', 1)
			
				TransformMethSpeed(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformMethSpeed')
AddEventHandler('esx_drugs:startTransformMethSpeed', function()

	local _source = source

	PlayersTransformMethSpeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformMethSpeed(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformMethSpeed')
AddEventHandler('esx_drugs:stopTransformMethSpeed', function()

	local _source = source

	PlayersTransformMethSpeed[_source] = false

end)

-- ICE Manufacturing
local function TransformMethIce(source)

	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMeth))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformMethIce[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local methQuantity = xPlayer.getInventoryItem('meth').count
			local iceQuantity = xPlayer.getInventoryItem('meth_ice').count

			if iceQuantity > 100 then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_meth_ice'))
			elseif methQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_meth'))
			else
				xPlayer.removeInventoryItem('meth', 5)
				xPlayer.addInventoryItem('meth_ice', 1)
			
				TransformMethIce(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformMethIce')
AddEventHandler('esx_drugs:startTransformMethIce', function()

	local _source = source

	PlayersTransformMethIce[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformMethIce(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformMethIce')
AddEventHandler('esx_drugs:stopTransformMethIce', function()

	local _source = source

	PlayersTransformMethIce[_source] = false

end)

-- Stage 3 Selling

-- Brick Selling

local function SellMethBrick(source)

	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMeth))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellMethBrick[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local brickQuantity = xPlayer.getInventoryItem('meth_brick').count

			if brickQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_meth_brick_sale'))
			else
				xPlayer.removeInventoryItem('meth_brick', 1)
				if CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 5019)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth_brick'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 5019)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth_brick'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 5019)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth_brick'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 5019)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth_brick'))
				end
				
				SellMethBrick(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startSellMethBrick')
AddEventHandler('esx_drugs:startSellMethBrick', function()

	local _source = source

	PlayersSellMethBrick[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellMethBrick(_source)

end)

RegisterServerEvent('esx_drugs:stopSellMethBrick')
AddEventHandler('esx_drugs:stopSellMethBrick', function()

	local _source = source

	PlayersSellMethBrick[_source] = false

end)

-- Speed Selling
local function SellMethSpeed(source)

	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMeth))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellMethSpeed[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local speedQuantity = xPlayer.getInventoryItem('meth_speed').count

			if speedQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_meth_speed_sale'))
			else
				xPlayer.removeInventoryItem('meth_speed', 1)                  
				if CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 479)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth_speed'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 479)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth_speed'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 479)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth_speed'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 479)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth_speed'))
				end
				
				SellMethSpeed(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellMethSpeed')
AddEventHandler('esx_drugs:startSellMethSpeed', function()

	local _source = source

	PlayersSellMethSpeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellMethSpeed(_source)

end)

RegisterServerEvent('esx_drugs:stopSellMethSpeed')
AddEventHandler('esx_drugs:stopSellMethSpeed', function()

	local _source = source

	PlayersSellMethSpeed[_source] = false

end)

-- Opium

-- Stage 1 Opium Production
local function HarvestingOpium(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingOpium[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local opium = xPlayer.getInventoryItem('opium')

			if opium.limit ~= -1 and opium.count >= opium.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_opium'))
			else
				xPlayer.addInventoryItem('opium', 1)
				HarvestingOpium(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startCollectionOpium')
AddEventHandler('esx_drugs:startCollectionOpium', function()

	local _source = source

	PlayersHarvestingOpium[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('extract_in_prog'))

	HarvestingOpium(_source)

end)

RegisterServerEvent('esx_drugs:stopCollectionOpium')
AddEventHandler('esx_drugs:stopCollectionOpium', function()

	local _source = source

	PlayersHarvestingOpium[_source] = false

end)

-- Stage 2 Manufacturing

-- Brick Manufacturing
local function TransformOpiumBrick(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformOpiumBrick[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local opiumQuantity = xPlayer.getInventoryItem('opium').count
			local brickQuantity = xPlayer.getInventoryItem('opium_brick').count

			if brickQuantity > 5 then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_opium_brick'))
			elseif opiumQuantity < 100 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_opium'))
			else
				xPlayer.removeInventoryItem('opium', 100)
				xPlayer.addInventoryItem('opium_brick', 1)
			
				TransformOpiumBrick(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformOpiumBrick')
AddEventHandler('esx_drugs:startTransformOpiumBrick', function()

	local _source = source

	PlayersTransformOpiumBrick[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformOpiumBrick(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformOpiumBrick')
AddEventHandler('esx_drugs:stopTransformOpiumBrick', function()

	local _source = source

	PlayersTransformOpiumBrick[_source] = false

end)

-- Powdered Opium Manufacturing
local function TransformOpiumPowder(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformOpiumPowder[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local opiumQuantity = xPlayer.getInventoryItem('opium').count
			local powderQuantity = xPlayer.getInventoryItem('opium_powder').count

			if powderQuantity > 50 then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_opium_powder'))
			elseif opiumQuantity < 10 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_opium'))
			else
				xPlayer.removeInventoryItem('opium', 10)
				xPlayer.addInventoryItem('opium_powder', 1)
			
				TransformOpiumPowder(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformOpiumPowder')
AddEventHandler('esx_drugs:startTransformOpiumPowder', function()

	local _source = source

	PlayersTransformOpiumPowder[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformOpiumPowder(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformOpiumPowder')
AddEventHandler('esx_drugs:stopTransformOpiumPowder', function()

	local _source = source

	PlayersTransformOpiumPowder[_source] = false

end)

-- ICE Manufacturing
local function TransformOpiumHeroin(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformOpiumHeroin[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local opiumQuantity = xPlayer.getInventoryItem('opium').count
			local herionQuantity = xPlayer.getInventoryItem('opium_herion').count

			if herionQuantity > 100 then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_opium_herion'))
			elseif opiumQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_opium'))
			else
				xPlayer.removeInventoryItem('opium', 5)
				xPlayer.addInventoryItem('opium_herion', 1)
			
				TransformOpiumHeroin(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformOpiumHeroin')
AddEventHandler('esx_drugs:startTransformOpiumHeroin', function()

	local _source = source

	PlayersTransformOpiumHeroin[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformOpiumHeroin(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformOpiumHeroin')
AddEventHandler('esx_drugs:stopTransformOpiumHeroin', function()

	local _source = source

	PlayersTransformOpiumHeroin[_source] = false

end)

-- Stage 3 Selling

-- Brick Selling

local function SellOpiumBrick(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellOpiumBrick[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local brickQuantity = xPlayer.getInventoryItem('opium_brick').count

			if brickQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_opium_brick_sale'))
			else
				xPlayer.removeInventoryItem('opium_brick', 1)
				if CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 6000)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium_brick'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 6500)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium_brick'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 7000)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium_brick'))
				end
				
				SellOpiumBrick(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startSellOpiumBrick')
AddEventHandler('esx_drugs:startSellOpiumBrick', function()

	local _source = source

	PlayersSellOpiumBrick[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellOpiumBrick(_source)

end)

RegisterServerEvent('esx_drugs:stopSellOpiumBrick')
AddEventHandler('esx_drugs:stopSellOpiumBrick', function()

	local _source = source

	PlayersSellOpiumBrick[_source] = false

end)

-- Powdered Opium Selling
local function SellOpiumPowder(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellOpiumPowder[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local powderQuantity = xPlayer.getInventoryItem('opium_powder').count

			if powderQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_opium_powder_sale'))
			else
				xPlayer.removeInventoryItem('opium_powder', 1)                  
				if CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 519)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium_powder'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 519)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium_powder'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 519)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium_powder'))
				end
				
				SellOpiumPowder(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellOpiumPowder')
AddEventHandler('esx_drugs:startSellOpiumPowder', function()

	local _source = source

	PlayersSellOpiumPowder[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellOpiumPowder(_source)

end)

RegisterServerEvent('esx_drugs:stopSellOpiumPowder')
AddEventHandler('esx_drugs:stopSellOpiumPowder', function()

	local _source = source

	PlayersSellOpiumPowder[_source] = false

end)

-- Cannabis

-- Stage 1 Cannabis Harvesting
local function HarvestingnWeed(source)

	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsWeed))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingnWeed[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local weed = xPlayer.getInventoryItem('weed')

			if weed.limit ~= -1 and weed.count >= weed.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_weed'))
			else
				xPlayer.addInventoryItem('weed', 1)
				HarvestingnWeed(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startCollectionWeed')
AddEventHandler('esx_drugs:startCollectionWeed', function()

	local _source = source

	PlayersHarvestingnWeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('harvest_in_prog'))

	HarvestingnWeed(_source)

end)

RegisterServerEvent('esx_drugs:stopCollectionWeed')
AddEventHandler('esx_drugs:stopCollectionWeed', function()

	local _source = source

	PlayersHarvestingnWeed[_source] = false

end)

-- Stage 2 Manufacturing

-- Brick Manufacturing
local function TransformWeedBrick(source)

	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsWeed))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformWeedBrick[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local weedQuantity = xPlayer.getInventoryItem('weed').count
			local brickQuantity = xPlayer.getInventoryItem('weed_brick').count

			if brickQuantity > 5 then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_weed_brick'))
			elseif weedQuantity < 100 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_weed'))
			else
				xPlayer.removeInventoryItem('weed', 100)
				xPlayer.addInventoryItem('weed_brick', 1)
			
				TransformWeedBrick(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformWeedBrick')
AddEventHandler('esx_drugs:startTransformWeedBrick', function()

	local _source = source

	PlayersTransformWeedBrick[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformWeedBrick(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformWeedBrick')
AddEventHandler('esx_drugs:stopTransformWeedBrick', function()

	local _source = source

	PlayersTransformWeedBrick[_source] = false

end)

-- Hash Oil Manufacturing
local function TransformWeedHash(source)

	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsWeed))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformWeedHash[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local weedQuantity = xPlayer.getInventoryItem('weed').count
			local hashQuantity = xPlayer.getInventoryItem('weed_hash').count

			if hashQuantity > 50 then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_weed_hash'))
			elseif weedQuantity < 10 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_weed'))
			else
				xPlayer.removeInventoryItem('weed', 10)
				xPlayer.addInventoryItem('weed_hash', 1)
			
				TransformWeedHash(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformWeedHash')
AddEventHandler('esx_drugs:startTransformWeedHash', function()

	local _source = source

	PlayersTransformWeedHash[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformWeedHash(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformWeedHash')
AddEventHandler('esx_drugs:stopTransformWeedHash', function()

	local _source = source

	PlayersTransformWeedHash[_source] = false

end)

-- Joint Manufacturing
local function TransformWeedJoint(source)

	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsWeed))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformWeedJoint[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local weedQuantity = xPlayer.getInventoryItem('weed').count
			local herionQuantity = xPlayer.getInventoryItem('weed_joint').count

			if herionQuantity > 100 then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_weed_joint'))
			elseif weedQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_weed'))
			else
				xPlayer.removeInventoryItem('weed', 5)
				xPlayer.addInventoryItem('weed_joint', 1)
			
				TransformWeedJoint(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformWeedJoint')
AddEventHandler('esx_drugs:startTransformWeedJoint', function()

	local _source = source

	PlayersTransformWeedJoint[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformWeedJoint(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformWeedJoint')
AddEventHandler('esx_drugs:stopTransformWeedJoint', function()

	local _source = source

	PlayersTransformWeedJoint[_source] = false

end)

-- Stage 3 Selling

-- Brick Selling

local function SellWeedBrick(source)

	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsWeed))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellWeedBrick[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local brickQuantity = xPlayer.getInventoryItem('weed_brick').count

			if brickQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('weed_brick', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 1293)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed_brick'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 1293)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed_brick'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 1293)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed_brick'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 1293)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed_brick'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 1293)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed_brick'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 1293)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed_brick'))
				end
				
				SellWeedBrick(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startSellWeedBrick')
AddEventHandler('esx_drugs:startSellWeedBrick', function()

	local _source = source

	PlayersSellWeedBrick[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellWeedBrick(_source)

end)

RegisterServerEvent('esx_drugs:stopSellWeedBrick')
AddEventHandler('esx_drugs:stopSellWeedBrick', function()

	local _source = source

	PlayersSellWeedBrick[_source] = false

end)

-- Hash Oil Selling
local function SellWeedHash(source)

	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsWeed))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellWeedHash[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local hashQuantity = xPlayer.getInventoryItem('weed_hash').count

			if hashQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_weed_hash_sale'))
			else
				xPlayer.removeInventoryItem('weed_hash', 1)                  
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 182)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed_hash'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 182)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed_hash'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 182)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed_hash'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 182)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed_hash'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 182)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed_hash'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 182)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed_hash'))
				end
				
				SellWeedHash(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellWeedHash')
AddEventHandler('esx_drugs:startSellWeedHash', function()

	local _source = source

	PlayersSellWeedHash[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellWeedHash(_source)

end)

RegisterServerEvent('esx_drugs:stopSellWeedHash')
AddEventHandler('esx_drugs:stopSellWeedHash', function()

	local _source = source

	PlayersSellWeedHash[_source] = false

end)

RegisterServerEvent('esx_drugs:GetUserInventory')
AddEventHandler('esx_drugs:GetUserInventory', function(currentZone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx_drugs:ReturnInventory', 
        _source, 
        -- Cocaine
		xPlayer.getInventoryItem('coke').count, 
        xPlayer.getInventoryItem('coke_brick').count,
        xPlayer.getInventoryItem('coke_powder').count, 
        xPlayer.getInventoryItem('coke_crack').count,
        -- Meth
		xPlayer.getInventoryItem('meth').count, 
        xPlayer.getInventoryItem('meth_brick').count, 
        xPlayer.getInventoryItem('meth_speed').count, 
        xPlayer.getInventoryItem('meth_ice').count, 
        -- Opium
		xPlayer.getInventoryItem('opium').count, 
        xPlayer.getInventoryItem('opium_brick').count,
		xPlayer.getInventoryItem('opium_powder').count, 
        xPlayer.getInventoryItem('opium_herion').count,
        -- Cannabis
        xPlayer.getInventoryItem('weed').count, 
        xPlayer.getInventoryItem('weed_brick').count, 		
        xPlayer.getInventoryItem('weed_hash').count, 
		xPlayer.getInventoryItem('weed_joint').count, 
		xPlayer.job.name, 
		currentZone
	)
end)

-- Cocaine Useable item Function
ESX.RegisterUsableItem('coke_crack', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('coke_crack', 1)

	TriggerClientEvent('esx_drugs:onDrugs', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('used_one_crack'))
end)
-- Meth Useable item Function
ESX.RegisterUsableItem('meth_ice', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('meth_ice', 1)

	TriggerClientEvent('esx_drugs:onDrugs', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('used_one_ice'))
end)
-- Opium Useable item Function
ESX.RegisterUsableItem('opium_herion', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('opium_herion', 1)

	TriggerClientEvent('esx_drugs:onDrugs', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('used_one_herion'))
end)
-- Cannabis Useable item Function
ESX.RegisterUsableItem('weed_joint', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('weed_joint', 1)

	TriggerClientEvent('esx_drugs:onDrugs', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('used_one_joint'))
end)


