QBCore = nil

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

QBCore.Functions.CreateCallback('qb-fishing:GetItemData', function(source, cb, itemName)
	local retval = false
	local Player = QBCore.Functions.GetPlayer(source)
	if Player ~= nil then 
		if Player.Functions.GetItemByName(itemName) ~= nil then
			retval = true
		end
	end
	
	cb(retval)
end)	

QBCore.Functions.CreateUseableItem("fishingrod", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)

    TriggerClientEvent('qb-fishing:tryToFish', source)
end)

RegisterServerEvent('qb-fishing:receiveFish')
AddEventHandler('qb-fishing:receiveFish', function(cabin, house)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local luck = math.random(1, 100)
    local itemFound = true
    local itemCount = 1

    if itemFound then
        for i = 1, itemCount, 1 do
            local randomItem = Config.FishingItems["type"]math.random(1, 2)
            local itemInfo = QBCore.Shared.Items[randomItem]
            if luck == 100 then
                randomItem = "greatwhiteshark"
                itemInfo = QBCore.Shared.Items[randomItem]
                Player.Functions.AddItem(randomItem, 1)
				TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
			elseif luck >= 99 and luck <= 100 then
				randomItem = "bluemarlin"
				itemInfo = QBCore.Shared.Items[randomItem]
                Player.Functions.AddItem(randomItem, 1)
				TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
			elseif luck >= 98 and luck <= 99 then
				randomItem = "tigershark"
				itemInfo = QBCore.Shared.Items[randomItem]
                Player.Functions.AddItem(randomItem, 1)
				TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
			elseif luck >= 97 and luck <= 98 then
				randomItem = "ahituna"
				itemInfo = QBCore.Shared.Items[randomItem]
                Player.Functions.AddItem(randomItem, 1)
				TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
			elseif luck >= 95 and luck <= 97 then
				randomItem = "bluefintuna"
				itemInfo = QBCore.Shared.Items[randomItem]
                Player.Functions.AddItem(randomItem, 1)
				TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
			elseif luck >= 93 and luck <= 95 then
				randomItem = "mahimahi"
				itemInfo = QBCore.Shared.Items[randomItem]
                Player.Functions.AddItem(randomItem, 1)
				TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
			elseif luck >= 90 and luck <= 93 then
				randomItem = "grouper"
				itemInfo = QBCore.Shared.Items[randomItem]
                Player.Functions.AddItem(randomItem, 1)
				TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
			elseif luck >= 85 and luck <= 90 then
				randomItem = "redfish"
				itemInfo = QBCore.Shared.Items[randomItem]
                Player.Functions.AddItem(randomItem, 1)
				TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
			elseif luck >= 80 and luck <= 85 then
				randomItem = "nurseshark"
				itemInfo = QBCore.Shared.Items[randomItem]
                Player.Functions.AddItem(randomItem, 1)
				TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
			elseif luck >= 70 and luck <= 80 then
				randomItem = "snapper"
				itemInfo = QBCore.Shared.Items[randomItem]
                Player.Functions.AddItem(randomItem, 1)
				TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
			elseif luck >= 0 and luck <= 70 then
				randomItem = "mullet"
				itemInfo = QBCore.Shared.Items[randomItem]
                Player.Functions.AddItem(randomItem, 1)
				TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
            end
            Citizen.Wait(500)
        end
    end
end)

RegisterServerEvent("qb-fishing:sellFish")
AddEventHandler("qb-fishing:sellFish", function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local price = 0
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if Player.PlayerData.items[k].name == "mullet" then 
                    price = price + (Config.FishingItems["mullet"]["price"] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("mullet", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "snapper" then 
                    price = price + (Config.FishingItems["snapper"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("snapper", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "nurseshark" then 
                    price = price + (Config.FishingItems["nurseshark"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("nurseshark", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "redfish" then 
                    price = price + (Config.FishingItems["redfish"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("redfish", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "grouper" then 
                    price = price + (Config.FishingItems["grouper"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("grouper", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "mahimahi" then 
                    price = price + (Config.FishingItems["mahimahi"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("mahimahi", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "bluefintuna" then 
                    price = price + (Config.FishingItems["bluefintuna"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("bluefintuna", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "ahituna" then 
                    price = price + (Config.FishingItems["ahituna"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("ahituna", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "bluemarlin" then 
                    price = price + (Config.FishingItems["bluemarlin"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("bluemarlin", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "tigershark" then 
                    price = price + (Config.FishingItems["tigershark"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("tigershark", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "greatwhiteshark" then 
                    price = price + (Config.FishingItems["greatwhiteshark"]["price"] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("greatwhiteshark", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "mullet_fillet" then 
                    price = price + (Config.FishingItems["mullet_fillet"]["price"] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("mullet_fillet", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "snapper_fillet" then 
                    price = price + (Config.FishingItems["snapper_fillet"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("snapper_fillet", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "nurseshark_fillet" then 
                    price = price + (Config.FishingItems["nurseshark_fillet"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("nurseshark_fillet", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "redfish_fillet" then 
                    price = price + (Config.FishingItems["redfish_fillet"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("redfish_fillet", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "grouper_fillet" then 
                    price = price + (Config.FishingItems["grouper_fillet"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("grouper_fillet", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "mahimahi_fillet" then 
                    price = price + (Config.FishingItems["mahimahi_fillet"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("mahimahi_fillet", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "bluefintuna_fillet" then 
                    price = price + (Config.FishingItems["bluefintuna_fillet"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("bluefintuna_fillet", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "ahituna_fillet" then 
                    price = price + (Config.FishingItems["ahituna_fillet"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("ahituna_fillet", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "bluemarlin_fillet" then 
                    price = price + (Config.FishingItems["bluemarlin_fillet"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("bluemarlin", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "tigershark_fillet" then 
                    price = price + (Config.FishingItems["tigershark_fillet"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("tigershark_fillet", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "greatwhiteshark_fillet" then 
                    price = price + (Config.FishingItems["greatwhiteshark_fillet"]["price"] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("greatwhiteshark_fillet", Player.PlayerData.items[k].amount, k)
                end

            end
        end
        Player.Functions.AddMoney("cash", price, "sold-fish")
		TriggerClientEvent('QBCore:Notify', src, "You have sold your fish")
	end
end)