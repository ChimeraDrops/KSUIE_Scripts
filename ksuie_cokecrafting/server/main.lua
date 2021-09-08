local CokeBrickCount = 0
local BagCount = 0
local BakCount = 0

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

RegisterNetEvent('ksuie_cokecrafting:server:countinv')
AddEventHandler('ksuie_cokecrafting:server:countinv', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if Player.PlayerData.items[k].name == "coke_small_brick" then 
                    CokeBrickCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "empty_weed_bag" then 
                    BagCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "bakingsoda" then 
                    BakCount = Player.PlayerData.items[k].amount
                
                end
            end
        end
	end
    TriggerClientEvent('QBCore:Notify', src, "Inventory Counted")
end)


--!!!!!!!!!!!!!!!!!!Casing Craft!!!!!!!!!!!!!!!!!!!!!-------------------------

RegisterNetEvent('ksuie_cokecrafting:server:coke')
AddEventHandler('ksuie_cokecrafting:server:coke', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "Small Bricks = "..CokeBrickCount.." Bags = "..BagCount)
    local craftItem = "cokebaggy"
    local ing1 = "coke_small_brick"
    local ing1count = CokeBrickCount
    local ing1req = 1
    local ing2 = "empty_weed_bag"
    local ing2count = BagCount
    local ing2req = 20

    local ing1math = 0
    local ing2math = 0
    local craftamount = 20

        if ing1count >= ing1req  and ing2count >= ing2req  then
            ing1math = ing1req
            ing2math = ing2req
            if ing1math>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, ing1math)
                Player.Functions.RemoveItem(ing2, ing2math)

                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            CokeBrickCount = 0
            BagCount = 0
            craftItem = nil
            ing1 = nil
            ing1math = 0
            ing1count = 0
            ing2 = nil
            ing2math = 0
            ing2count = 0

        else
        TriggerClientEvent('QBCore:Notify', src, "You are missing some ingredients or tools")
        end
    Citizen.Wait(300)
end)

RegisterNetEvent('ksuie_cokecrafting:server:crack')
AddEventHandler('ksuie_cokecrafting:server:crack', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "Small Coke Bricks = "..CokeBrickCount.." Bags = "..BagCount.." Baking Soda = "..BakCount)
    local craftItem = "crack_baggy"
    local ing1 = "coke_small_brick"
    local ing1count = CokeBrickCount
    local ing1req = 1
    local ing2 = "empty_weed_bag"
    local ing2count = BagCount
    local ing2req = 40
    local ing3 = "bakingsoda"
    local ing3count = BakCount
    local ing3req = 10

    local ing1math = 0
    local ing2math = 0
    local ing3math = 0

    local craftamount = 40

        if ing1count >= ing1req  and ing2count >= ing2req and ing3count >= ing3req then
            ing1math = ing1req
            ing2math = ing2req
            ing3math = ing3req
            if ing1math>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, ing1math)
                Player.Functions.RemoveItem(ing2, ing2math)
                Player.Functions.RemoveItem(ing3, ing3math)

                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            CokeBrickCount = 0
            BagCount = 0
            BakCount = 0
            craftItem = nil
            ing1 = nil
            ing1math = 0
            ing1count = 0
            ing2 = nil
            ing2math = 0
            ing2count = 0
            ing3 = nil
            ing3math = 0
            ing3count = 0
        end

        if ing1count<ing1req or ing2count < ing2req or ing3count < ing3req or ing4count < ing4req or ing5count < ing5req or ing6count < ing6req then
        TriggerClientEvent('QBCore:Notify', src, "You are missing some ingredients or tools")
        end
    Citizen.Wait(300)
end)

