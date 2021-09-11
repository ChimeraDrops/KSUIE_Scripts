---======================---
-----
---======================---
local ActivePolice = 0  		--<< needed policemen to activate the mission
local cashA = 250 				--<<how much minimum you can get from a robbery
local cashB = 500				--<< how much maximum you can get from a robbery
local ActivationCost = 2500		--<< how much is the activation of the mission (clean from the bank)
local ResetTimer = 2700 * 1000  --<< timer every how many missions you can do, default is 600 seconds
-----------------------------------
local ActiveMission = 0

QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

isLoggedIn = false

RegisterNetEvent("QBCore:Client:OnPlayerUnload")
AddEventHandler("QBCore:Client:OnPlayerUnload", function()
    isLoggedIn = false
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
    isLoggedIn = true
end)


RegisterServerEvent('AttackTransport:accept')
AddEventHandler('AttackTransport:accept', function()
	local copsOnDuty = 0
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	local accountMoney = 0
	accountMoney = xPlayer.PlayerData.money["bank"]
if ActiveMission == 0 then
	if accountMoney < ActivationCost then
	TriggerClientEvent('QBCore:Notify', _source, "You need $"..ActivationCost.." in the bank to accept the mission")
	else
		for k, v in pairs(QBCore.Functions.GetPlayers()) do
			local Player = QBCore.Functions.GetPlayer(v)
			if Player ~= nil then 
				if (Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty) then
					copsOnDuty = copsOnDuty + 1
				end
			end
		end
	if copsOnDuty >= ActivePolice then
		TriggerClientEvent("AttackTransport:ArmTruckSpawn", _source)
		xPlayer.Functions.RemoveMoney('bank', ActivationCost, "armored-truck")
		
		OdpalTimer()
    else
		TriggerClientEvent('QBCore:Notify', _source, 'Need at least '..ActivePolice.. ' Police to activate the mission.')
    end
	end
else
TriggerClientEvent('QBCore:Notify', _source, 'Someone is already carrying out this mission')
end
end)

RegisterServerEvent('qb-armoredtruckheist:server:callCops')
AddEventHandler('qb-armoredtruckheist:server:callCops', function(streetLabel, coords)
    local place = "Armored Truck"
    local msg = "The Alram has been activated from a "..place.. " at " ..streetLabel

    TriggerClientEvent("qb-armoredtruckheist:client:robberyCall", -1, streetLabel, coords)

end)

function OdpalTimer()
ActiveMission = 1
Wait(ResetTimer)
ActiveMission = 0
TriggerClientEvent('AttackTransport:CleanUp', -1)
end

RegisterServerEvent('AttackTransport:assault')
AddEventHandler('AttackTransport:assault', function(x ,y, z)
    TriggerClientEvent('AttackTransport:InfoForLspd', -1, x, y, z)
end)

RegisterServerEvent('AttackTransport:ActiveRobbery')
AddEventHandler('AttackTransport:ActiveRobbery', function(moneyCalc)
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	local bags = math.random(1000,5000)
	local info = {
		worth = math.random(cashA, cashB)
	}
	xPlayer.Functions.AddItem('markedbills', bags)
	TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['markedbills'], "add")

	local chance = math.random(1, 100)
	TriggerClientEvent('QBCore:Notify', _source, 'You took '..bags..' bags of cash from the van')

	if chance >= 95 then
	xPlayer.Functions.AddItem('security_card_02', 1)
	TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['security_card_02'], "add")
	end

	if chance <= 30 then
		xPlayer.Functions.AddItem('sudafed', 5)
		TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['sudafed'], "add")
	end

	if chance >= 40 and chance <= 60 then
		xPlayer.Functions.AddItem('gold_bar', 5)
		TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['gold_bar'], "add")
	end

	if chance <=10 then
		xPlayer.Functions.AddItem('security_card_01', 1)
		TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['security_card_01'], "add")
	end

	if chance <=50 then
		xPlayer.Functions.AddItem('goldchain', 2)
		TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['goldchain'], "add")
	end


Wait(2500)
end)

RegisterCommand("ksuie_strikeforce", function ()
	local spiceitup = 1
	if spiceitup == 1 then
		TriggerClientEvent('qb-truckrobbery:Client:ksuiespice')
		spiceitup = spiceitup-1
	end
end, true)

