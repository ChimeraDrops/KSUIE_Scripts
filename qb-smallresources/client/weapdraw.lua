local weapons = {
	'WEAPON_KNIFE',
	'WEAPON_NIGHTSTICK',
	'WEAPON_BREAD',
	'WEAPON_FLASHLIGHT',
	'WEAPON_HAMMER',
	'WEAPON_BAT',
	'WEAPON_GOLFCLUB',
	'WEAPON_CROWBAR',
	'WEAPON_BOTTLE',
	'WEAPON_DAGGER',
	'WEAPON_HATCHET',
	'WEAPON_MACHETE',
	'WEAPON_SWITCHBLADE',
	'WEAPON_BATTLEAXE',
	'WEAPON_POOLCUE',
	'WEAPON_WRENCH',
	'WEAPON_PISTOL',
	'WEAPON_PISTOL_MK2',
	'WEAPON_COMBATPISTOL',
	'WEAPON_APPISTOL',
	'WEAPON_PISTOL50',
	'WEAPON_REVOLVER',
	'WEAPON_SNSPISTOL',
	'WEAPON_HEAVYPISTOL',
	'WEAPON_VINTAGEPISTOL',
	'WEAPON_MICROSMG',
	'WEAPON_SMG',
	'WEAPON_ASSAULTSMG',
	'WEAPON_MINISMG',
	'WEAPON_MACHINEPISTOL',
	'WEAPON_COMBATPDW',
	'WEAPON_PUMPSHOTGUN',
	'WEAPON_SAWNOFFSHOTGUN',
	'WEAPON_ASSAULTSHOTGUN',
	'WEAPON_BULLPUPSHOTGUN',
	'WEAPON_HEAVYSHOTGUN',
	'WEAPON_ASSAULTRIFLE',
	'WEAPON_CARBINERIFLE',
	'WEAPON_ADVANCEDRIFLE',
	'WEAPON_SPECIALCARBINE',
	'WEAPON_BULLPUPRIFLE',
	'WEAPON_COMPACTRIFLE',
	'WEAPON_MG',
	'WEAPON_COMBATMG',
	'WEAPON_GUSENBERG',
	'WEAPON_SNIPERRIFLE',
	'WEAPON_HEAVYSNIPER',
	'WEAPON_MARKSMANRIFLE',
	'WEAPON_GRENADELAUNCHER',
	'WEAPON_RPG',
	'WEAPON_STINGER',
	'WEAPON_MINIGUN',
	'WEAPON_GRENADE',
	'WEAPON_STICKYBOMB',
	'WEAPON_SMOKEGRENADE',
	'WEAPON_BZGAS',
	'WEAPON_MOLOTOV',
	'WEAPON_DIGISCANNER',
	'WEAPON_FIREWORK',
	'WEAPON_MUSKET',
	'WEAPON_STUNGUN',
	'WEAPON_HOMINGLAUNCHER',
	'WEAPON_PROXMINE',
	'WEAPON_FLAREGUN',
	'WEAPON_MARKSMANPISTOL',
	'WEAPON_RAILGUN',
	'WEAPON_DBSHOTGUN',
	'WEAPON_AUTOSHOTGUN',
	'WEAPON_COMPACTLAUNCHER',
	'WEAPON_PIPEBOMB',
	'WEAPON_DOUBLEACTION',
}

-- Wheapons that require the Police holster animation
local holsterableWeapons = {
	--'WEAPON_STUNGUN',
	'WEAPON_PISTOL',
	'WEAPON_PISTOL_MK2',
	'WEAPON_COMBATPISTOL',
	'WEAPON_APPISTOL',
	'WEAPON_PISTOL50',
	'WEAPON_REVOLVER',
	'WEAPON_SNSPISTOL',
	'WEAPON_HEAVYPISTOL',
	'WEAPON_VINTAGEPISTOL'
}

local holstered = true
local canFire = true
local currWeapon = GetHashKey('WEAPON_UNARMED')
local currentHoldster = nil

QBCore = nil

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(10)
        if QBCore == nil then
            TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)    
            Citizen.Wait(200)
        end
    end
end)

RegisterNetEvent('weapons:ResetHolster')
AddEventHandler('weapons:ResetHolster', function()
	holstered = true
	canFire = true
	currWeapon = GetHashKey('WEAPON_UNARMED')
	currentHoldster = nil
end)

Citizen.CreateThread(function()
	local unHash = GetHashKey('WEAPON_UNARMED')
	local dict = "reaction@intimidation@1h"
	local dict2 = "reaction@intimidation@cop@unarmed"
	local dict3 = "rcmjosh4"
	--local dict4 = "weapons@pistol@"

	while true do
		local ped = PlayerPedId()
		local deadentity = IsEntityDead(ped)
		local getpedcoords = GetEntityCoords(ped, true)
		if DoesEntityExist(ped) and not deadentity then
			if currWeapon ~= GetSelectedPedWeapon(ped) then
				pos = GetEntityCoords(ped, true)
				rot = GetEntityHeading(ped)

				local newWeap = GetSelectedPedWeapon(ped)
				SetCurrentPedWeapon(ped, currWeapon, true)
				loadAnimDict(dict)
				loadAnimDict(dict2)
				loadAnimDict(dict3)
				--loadAnimDict(dict4)
				if CheckWeapon(newWeap) then
					if holstered then
						if QBCore.Functions.GetPlayerData().job.name == "police" then
							--TaskPlayAnim(ped, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
							canFire = false
							currentHoldster = GetPedDrawableVariation(ped, 7)
							TaskPlayAnimAdvanced(ped, dict3, "josh_leadout_cop2", getpedcoords, 0, 0, rot, 3.0, 3.0, -1, 50, 0, 0, 0)
							Citizen.Wait(300)
							SetCurrentPedWeapon(ped, newWeap, true)

							if IsWeaponHolsterable(newWeap) then
								if currentHoldster == 8 then
									SetPedComponentVariation(ped, 7, 2, 0, 2)
								elseif currentHoldster == 1 then
									SetPedComponentVariation(ped, 7, 3, 0, 2)
								elseif currentHoldster == 6 then
									SetPedComponentVariation(ped, 7, 5, 0, 2)
								end
							end
							currWeapon = newWeap
							Citizen.Wait(300)
							ClearPedTasks(ped)
							holstered = false
							canFire = true
						else
							canFire = false
							TaskPlayAnimAdvanced(ped, dict, "intro", getpedcoords, 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
							Citizen.Wait(1000)
							SetCurrentPedWeapon(ped, newWeap, true)
							currWeapon = newWeap
							Citizen.Wait(1400)
							ClearPedTasks(ped)
							holstered = false
							canFire = true
						end
					elseif newWeap ~= currWeapon and CheckWeapon(currWeapon) then
						if QBCore.Functions.GetPlayerData().job.name == "police" then
							canFire = false

							TaskPlayAnimAdvanced(ped, dict2, "intro", getpedcoords, 0, 0, rot, 3.0, 3.0, -1, 50, 0, 0, 0)
							Citizen.Wait(500)

							if IsWeaponHolsterable(currWeapon) then
								SetPedComponentVariation(ped, 7, currentHoldster, 0, 2)
							end

							SetCurrentPedWeapon(ped, unHash, true)
							currentHoldster = GetPedDrawableVariation(ped, 7)

							TaskPlayAnimAdvanced(ped, dict3, "josh_leadout_cop2", getpedcoords, 0, 0, rot, 3.0, 3.0, -1, 50, 0, 0, 0)
							Citizen.Wait(300)
							SetCurrentPedWeapon(ped, newWeap, true)

							if IsWeaponHolsterable(newWeap) then
								if currentHoldster == 8 then
									SetPedComponentVariation(ped, 7, 2, 0, 2)
								elseif currentHoldster == 1 then
									SetPedComponentVariation(ped, 7, 3, 0, 2)
								elseif currentHoldster == 6 then
									SetPedComponentVariation(ped, 7, 5, 0, 2)
								end
							end

							Citizen.Wait(500)
							currWeapon = newWeap
							ClearPedTasks(ped)
							holstered = false
							canFire = true
						else
							canFire = false
							TaskPlayAnimAdvanced(ped, dict, "outro", getpedcoords, 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
							Citizen.Wait(1600)
							SetCurrentPedWeapon(ped, unHash, true)
							TaskPlayAnimAdvanced(ped, dict, "intro", getpedcoords, 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
							Citizen.Wait(1000)
							SetCurrentPedWeapon(ped, newWeap, true)
							currWeapon = newWeap
							Citizen.Wait(1400)
							ClearPedTasks(ped)
							holstered = false
							canFire = true
						end
					else
						if QBCore.Functions.GetPlayerData().job.name == "police" then
							SetCurrentPedWeapon(ped, unHash, true)
							currentHoldster = GetPedDrawableVariation(ped, 7)
							TaskPlayAnimAdvanced(ped, dict3, "josh_leadout_cop2", getpedcoords, 0, 0, rot, 3.0, 3.0, -1, 50, 0, 0, 0)
							Citizen.Wait(300)
							SetCurrentPedWeapon(ped, newWeap, true)

							if IsWeaponHolsterable(newWeap) then
								if currentHoldster == 8 then
									SetPedComponentVariation(ped, 7, 2, 0, 2)
								elseif currentHoldster == 1 then
									SetPedComponentVariation(ped, 7, 3, 0, 2)
								elseif currentHoldster == 6 then
									SetPedComponentVariation(ped, 7, 5, 0, 2)
								end
							end

							currWeapon = newWeap
							Citizen.Wait(300)
							ClearPedTasks(ped)
							holstered = false
							canFire = true
						else
							SetCurrentPedWeapon(ped, unHash, true)
							TaskPlayAnimAdvanced(ped, dict, "intro", getpedcoords, 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
							Citizen.Wait(1000)
							SetCurrentPedWeapon(ped, newWeap, true)
							currWeapon = newWeap
							Citizen.Wait(1400)
							ClearPedTasks(ped)
							holstered = false
							canFire = true
						end
					end
				else
					if not holstered and CheckWeapon(currWeapon) then
						if QBCore.Functions.GetPlayerData().job.name == "police" then
							canFire = false
							TaskPlayAnimAdvanced(ped, dict2, "intro", getpedcoords, 0, 0, rot, 3.0, 3.0, -1, 50, 0, 0, 0)
							Citizen.Wait(500)
							
							if IsWeaponHolsterable(currWeapon) then
								SetPedComponentVariation(ped, 7, currentHoldster, 0, 2)
							end

							SetCurrentPedWeapon(ped, unHash, true)
							ClearPedTasks(ped)
							SetCurrentPedWeapon(ped, newWeap, true)
							holstered = true
							canFire = true
							currWeapon = newWeap
						else
							canFire = false
							TaskPlayAnimAdvanced(ped, dict, "outro", getpedcoords, 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
							Citizen.Wait(1400)
							SetCurrentPedWeapon(ped, unHash, true)
							ClearPedTasks(ped)
							SetCurrentPedWeapon(ped, newWeap, true)
							holstered = true
							canFire = true
							currWeapon = newWeap
						end
					else
						SetCurrentPedWeapon(ped, newWeap, true)
						holstered = false
						canFire = true
						currWeapon = newWeap
					end
				end
			end
		else
			Citizen.Wait(250)
		end

		Citizen.Wait(7)
	end
end)


Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		if not canFire then
			DisableControlAction(0, 25, true)
			DisablePlayerFiring(ped, true)
		else
			Citizen.Wait(250)
		end

		Citizen.Wait(7)
	end
end)

function CheckWeapon(newWeap)
	for i = 1, #weapons do
		if GetHashKey(weapons[i]) == newWeap then
			return true
		end
	end
	return false
end

function IsWeaponHolsterable(weap)
	for i = 1, #holsterableWeapons do
		if GetHashKey(holsterableWeapons[i]) == weap then
			return true
		end
	end
	return false
end

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(7)
	end
end