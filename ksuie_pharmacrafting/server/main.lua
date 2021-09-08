local SudCount = 0
local BatCount = 0
local MDPCount = 0
local MornCount = 0
local IsoCount = 0
local BagCount = 0
local HamCount = 0
local MortCount = 0

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

RegisterNetEvent('ksuie_pharmacrafting:server:countinv')
AddEventHandler('ksuie_pharmacrafting:server:countinv', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if Player.PlayerData.items[k].name == "sudafed" then 
                    SudCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "batteries" then 
                    BatCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "mdp2p" then 
                    MDPCount = Player.PlayerData.items[k].amount
                
                elseif Player.PlayerData.items[k].name == "morningglory" then 
                    MornCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "isosafrole" then 
                    IsoCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "empty_weed_bag" then 
                    BagCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "weapon_hammer" then 
                    HamCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "mortar_pestle" then 
                    MortCount = Player.PlayerData.items[k].amount

                end
            end
        end
	end
    TriggerClientEvent('QBCore:Notify', src, "Inventory Counted")
end)


--!!!!!!!!!!!!!!!!!!Casing Craft!!!!!!!!!!!!!!!!!!!!!-------------------------

RegisterNetEvent('ksuie_pharmacrafting:server:eph')
AddEventHandler('ksuie_pharmacrafting:server:eph', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "Sudafed = "..SudCount.." Hammer = "..HamCount.." Mortar&Pestle = "..MortCount)
    local craftItem = "ephedrine"
    local ing1 = "sudafed"
    local ing1count = SudCount
    local ing1req = 10
    local ing2 = "weapon_hammer"
    local ing2count = HamCount
    local ing2req = 1
    local ing3 = "mortar_pestle"
    local ing3count = MortCount
    local ing3req = 1
    local ing4 = nil
    local ing4count = 0
    local ing4req = 0
    local ing5 = nil
    local ing5count = 0
    local ing5req = 0
    local ing6 = nil
    local ing6count = 0
    local ing6req = 0

    local ing1math = 0
    local ing2math = 0
    local ing3math = 0
    local ing4math = 0
    local ing5math = 0
    local ing6math = 0
    local craftamount = math.floor(SudCount/ing1req)

        if ing1count >= ing1req  and ing2count >= ing2req and ing3count >= ing3req and ing4count >= ing4req and ing5count >= ing5req and ing6count >= ing6req then
            ing1math = ing1req*craftamount
            ing2math = ing2req
            ing3math = ing3req
            ing4math = ing4req
            ing5math = ing5req
            ing6math = ing6req
            if ing1math>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, ing1math)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            SudCount = 0
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
            ing4 = nil
            ing4math = 0
            ing4count = 0

        else
        TriggerClientEvent('QBCore:Notify', src, "You are missing some ingredients or tools")
        end
    Citizen.Wait(300)
end)

RegisterNetEvent('ksuie_pharmacrafting:server:lith')
AddEventHandler('ksuie_pharmacrafting:server:lith', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "Batteries = "..BatCount.." Hammer = "..HamCount.." Mortar&Pestle = "..MortCount)
    local craftItem = "lithium"
    local ing1 = "batteries"
    local ing1count = BatCount
    local ing1req = 10
    local ing2 = "weapon_hammer"
    local ing2count = HamCount
    local ing2req = 1
    local ing3 = "mortar_pestle"
    local ing3count = MortCount
    local ing3req = 1
    local ing4 = nil
    local ing4count = 0
    local ing4req = 0
    local ing5 = nil
    local ing5count = 0
    local ing5req = 0
    local ing6 = nil
    local ing6count = 0
    local ing6req = 0

    local ing1math = 0
    local ing2math = 0
    local ing3math = 0
    local ing4math = 0
    local ing5math = 0
    local ing6math = 0

    local craftamount = math.floor(BatCount/ing1req)

        if ing1count >= ing1req  and ing2count >= ing2req and ing3count >= ing3req and ing4count >= ing4req and ing5count >= ing5req and ing6count >= ing6req then
            ing1math = ing1req*craftamount
            ing2math = ing2req
            ing3math = ing3req
            ing4math = ing4req
            ing5math = ing5req
            ing6math = ing6req
            if ing1math>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, ing1math)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            BatCount = 0
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
            ing4 = nil
            ing4math = 0
            ing4count = 0
        end

        if ing1count<ing1req or ing2count < ing2req or ing3count < ing3req or ing4count < ing4req or ing5count < ing5req or ing6count < ing6req then
        TriggerClientEvent('QBCore:Notify', src, "You are missing some ingredients or tools")
        end
    Citizen.Wait(300)
end)

RegisterNetEvent('ksuie_pharmacrafting:server:xtc')
AddEventHandler('ksuie_pharmacrafting:server:xtc', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "MDP2P = "..MDPCount.." Isosaphrole = "..IsoCount.." Empty Bags = "..BagCount.." Mortar&Pestle = "..MortCount)
    local craftItem = "xtcbaggy"
    local ing1 = "mdp2p"
    local ing1count = MDPCount
    local ing1req = 2
    local ing2 = "isosafrole"
    local ing2count = IsoCount
    local ing2req = 2
    local ing3 = "empty_weed_bag"
    local ing3count = BagCount
    local ing3req = 1
    local ing4 = "mortar_pestle"
    local ing4count = MortCount
    local ing4req = 1
    local ing5 = nil
    local ing5count = 0
    local ing5req = 0
    local ing6 = nil
    local ing6count = 0
    local ing6req = 0

    local ing1math = 0
    local ing2math = 0
    local ing3math = 0
    local ing4math = 0
    local ing5math = 0
    local ing6math = 0

    local craftamount = 0

        if ing1count >= ing1req  and ing2count >= ing2req and ing3count >= ing3req and ing4count >= ing4req and ing5count >= ing5req and ing6count >= ing6req then
            ing1math = ing1req*MDPCount
            ing2math = ing2req*IsoCount
            ing3math = ing3req*BagCount
            ing4math = ing4req
            ing5math = ing5req
            ing6math = ing6req
            craftamount = math.min(ing1math,ing2math,ing3math)

            if craftamount>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, craftamount*ing1req)
                Player.Functions.RemoveItem(ing2, craftamount*ing2req)
                Player.Functions.RemoveItem(ing3, craftamount*ing3req)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            MDPCount = 0
            IsoCount = 0
            BagCount = 0
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
            ing4 = nil
            ing4math = 0
            ing4count = 0

        else
        TriggerClientEvent('QBCore:Notify', src, "You are missing some ingredients or tools")
        end
    Citizen.Wait(300)
end)

RegisterNetEvent('ksuie_pharmacrafting:server:lsa')
AddEventHandler('ksuie_pharmacrafting:server:lsa', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "Morning Glory Seeds = "..MornCount.." Hammer = "..HamCount.." Mortar&Pestle = "..MortCount)
    local craftItem = "lysergic_acid"
    local ing1 = "morningglory"
    local ing1count = MornCount
    local ing1req = 10
    local ing2 = "weapon_hammer"
    local ing2count = HamCount
    local ing2req = 1
    local ing3 = "mortar_pestle"
    local ing3count = MortCount
    local ing3req = 1
    local ing4 = nil
    local ing4count = 0
    local ing4req = 0
    local ing5 = nil
    local ing5count = 0
    local ing5req = 0
    local ing6 = nil
    local ing6count = 0
    local ing6req = 0

    local ing1math = 0
    local ing2math = 0
    local ing3math = 0
    local ing4math = 0
    local ing5math = 0
    local ing6math = 0

    local craftamount = math.floor(ing1count/10)

        if ing1count >= ing1req  and ing2count >= ing2req and ing3count >= ing3req and ing4count >= ing4req and ing5count >= ing5req and ing6count >= ing6req then
            ing1math = ing1req*craftamount
            ing2math = ing2req
            ing3math = ing3req
            ing4math = ing4req
            ing5math = ing5req
            ing6math = ing6req
            if ing1math>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, ing1math)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            MornCount = 0
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
            ing4 = nil
            ing4math = 0
            ing4count = 0

        else
        TriggerClientEvent('QBCore:Notify', src, "You are missing some ingredients or tools")
        end
    Citizen.Wait(300)
end)

