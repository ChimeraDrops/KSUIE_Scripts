local AllCount = 0
local SteelCount = 0
local PlasticCount = 0
local CleanCount = 0
local ScrewDrCount = 0
local DrillCount = 0

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

RegisterNetEvent('ksuie_pistolcraft:server:countinv')
AddEventHandler('ksuie_pistolcraft:server:countinv', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if Player.PlayerData.items[k].name == "aluminum" then 
                    AllCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "steel" then 
                    SteelCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "plastic" then 
                    PlasticCount = Player.PlayerData.items[k].amount
                
                elseif Player.PlayerData.items[k].name == "cleaningkit" then 
                    CleanCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "screwdriverset" then 
                    ScrewDrCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "drill" then 
                    DrillCount = Player.PlayerData.items[k].amount

                end
            end
        end
	end
    TriggerClientEvent('QBCore:Notify', src, "Inventory Counted")
end)


--!!!!!!!!!!!!!!!!!!Casing Craft!!!!!!!!!!!!!!!!!!!!!-------------------------

RegisterNetEvent('ksuie_pistolcraft:server:pistol')
AddEventHandler('ksuie_pistolcraft:server:pistol', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "Aluminum = "..AllCount.." Steel = "..SteelCount.." Plastic = "..PlasticCount.." CleaningKit = "..CleanCount.." ScrewdriverSet ="..ScrewDrCount.." Drill = "..DrillCount)
    local craftItem = "weapon_pistol"
    local ing1 = "aluminum"
    local ing1count = AllCount
    local ing1req = 10
    local ing2 = "steel"
    local ing2count = SteelCount
    local ing2req = 10
    local ing3 = "plastic"
    local ing3count = PlasticCount
    local ing3req = 10
    local ing4 = "cleaningkit"
    local ing4count = CleanCount
    local ing4req = 1
    local ing5 = "screwdriverset"
    local ing5count = ScrewDrCount
    local ing5req = 1
    local ing6 = "drill"
    local ing6count = DrillCount
    local ing6req = 1

    local ing1math = 0
    local ing2math = 0
    local ing3math = 0
    local ing4math = 0
    local ing5math = 0
    local ing6math = 0

    local craftamount = 1

        if ing1count >= ing1req  and ing2count >= ing2req and ing3count >= ing3req and ing4count >= ing4req and ing5count >= ing5req and ing6count >= ing6req then
            ing1math = ing1req
            ing2math = ing2req
            ing3math = ing3req
            ing4math = ing4req
            ing5math = ing5req
            ing6math = ing6req
            if ing1math>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, ing1math)
                Player.Functions.RemoveItem(ing2, ing2math)
                Player.Functions.RemoveItem(ing3, ing3math)
                Player.Functions.RemoveItem(ing4, ing4math)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            AllCount = ing1count-ing1req
            SteelCount = ing2count-ing2req
            PlasticCount = ing3count-ing3req
            CleanCount = ing4count-ing4req
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

RegisterNetEvent('ksuie_pistolcraft:server:mk2')
AddEventHandler('ksuie_pistolcraft:server:mk2', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "Aluminum = "..AllCount.." Steel = "..SteelCount.." Plastic = "..PlasticCount.." CleaningKit = "..CleanCount.." ScrewdriverSet ="..ScrewDrCount.." Drill = "..DrillCount)
    local craftItem = "weapon_pistol_mk2"
    local ing1 = "aluminum"
    local ing1count = AllCount
    local ing1req = 15
    local ing2 = "steel"
    local ing2count = SteelCount
    local ing2req = 15
    local ing3 = "plastic"
    local ing3count = PlasticCount
    local ing3req = 10
    local ing4 = "cleaningkit"
    local ing4count = CleanCount
    local ing4req = 1
    local ing5 = "screwdriverset"
    local ing5count = ScrewDrCount
    local ing5req = 1
    local ing6 = "drill"
    local ing6count = DrillCount
    local ing6req = 1

    local ing1math = 0
    local ing2math = 0
    local ing3math = 0
    local ing4math = 0
    local ing5math = 0
    local ing6math = 0

    local craftamount = 1

        if ing1count >= ing1req  and ing2count >= ing2req and ing3count >= ing3req and ing4count >= ing4req and ing5count >= ing5req and ing6count >= ing6req then
            ing1math = ing1req
            ing2math = ing2req
            ing3math = ing3req
            ing4math = ing4req
            ing5math = ing5req
            ing6math = ing6req
            if ing1math>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, ing1math)
                Player.Functions.RemoveItem(ing2, ing2math)
                Player.Functions.RemoveItem(ing3, ing3math)
                Player.Functions.RemoveItem(ing4, ing4math)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            AllCount = ing1count-ing1req
            SteelCount = ing2count-ing2req
            PlasticCount = ing3count-ing3req
            CleanCount = ing4count-ing4req
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

RegisterNetEvent('ksuie_pistolcraft:server:combat')
AddEventHandler('ksuie_pistolcraft:server:combat', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "Aluminum = "..AllCount.." Steel = "..SteelCount.." Plastic = "..PlasticCount.." CleaningKit = "..CleanCount.." ScrewdriverSet ="..ScrewDrCount.." Drill = "..DrillCount)
    local craftItem = "weapon_combatpistol"
    local ing1 = "aluminum"
    local ing1count = AllCount
    local ing1req = 20
    local ing2 = "steel"
    local ing2count = SteelCount
    local ing2req = 20
    local ing3 = "plastic"
    local ing3count = PlasticCount
    local ing3req = 10
    local ing4 = "cleaningkit"
    local ing4count = CleanCount
    local ing4req = 1
    local ing5 = "screwdriverset"
    local ing5count = ScrewDrCount
    local ing5req = 1
    local ing6 = "drill"
    local ing6count = DrillCount
    local ing6req = 1

    local ing1math = 0
    local ing2math = 0
    local ing3math = 0
    local ing4math = 0
    local ing5math = 0
    local ing6math = 0

    local craftamount = 1

        if ing1count >= ing1req  and ing2count >= ing2req and ing3count >= ing3req and ing4count >= ing4req and ing5count >= ing5req and ing6count >= ing6req then
            ing1math = ing1req
            ing2math = ing2req
            ing3math = ing3req
            ing4math = ing4req
            ing5math = ing5req
            ing6math = ing6req
            if ing1math>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, ing1math)
                Player.Functions.RemoveItem(ing2, ing2math)
                Player.Functions.RemoveItem(ing3, ing3math)
                Player.Functions.RemoveItem(ing4, ing4math)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            AllCount = ing1count-ing1req
            SteelCount = ing2count-ing2req
            PlasticCount = ing3count-ing3req
            CleanCount = ing4count-ing4req
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

RegisterNetEvent('ksuie_pistolcraft:server:app')
AddEventHandler('ksuie_pistolcraft:server:app', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "Aluminum = "..AllCount.." Steel = "..SteelCount.." Plastic = "..PlasticCount.." CleaningKit = "..CleanCount.." ScrewdriverSet ="..ScrewDrCount.." Drill = "..DrillCount)
    local craftItem = "weapon_appistol"
    local ing1 = "aluminum"
    local ing1count = AllCount
    local ing1req = 25
    local ing2 = "steel"
    local ing2count = SteelCount
    local ing2req = 25
    local ing3 = "plastic"
    local ing3count = PlasticCount
    local ing3req = 10
    local ing4 = "cleaningkit"
    local ing4count = CleanCount
    local ing4req = 1
    local ing5 = "screwdriverset"
    local ing5count = ScrewDrCount
    local ing5req = 1
    local ing6 = "drill"
    local ing6count = DrillCount
    local ing6req = 1

    local ing1math = 0
    local ing2math = 0
    local ing3math = 0
    local ing4math = 0
    local ing5math = 0
    local ing6math = 0

    local craftamount = 1

        if ing1count >= ing1req  and ing2count >= ing2req and ing3count >= ing3req and ing4count >= ing4req and ing5count >= ing5req and ing6count >= ing6req then
            ing1math = ing1req
            ing2math = ing2req
            ing3math = ing3req
            ing4math = ing4req
            ing5math = ing5req
            ing6math = ing6req
            if ing1math>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, ing1math)
                Player.Functions.RemoveItem(ing2, ing2math)
                Player.Functions.RemoveItem(ing3, ing3math)
                Player.Functions.RemoveItem(ing4, ing4math)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            AllCount = ing1count-ing1req
            SteelCount = ing2count-ing2req
            PlasticCount = ing3count-ing3req
            CleanCount = ing4count-ing4req
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

RegisterNetEvent('ksuie_pistolcraft:server:50cal')
AddEventHandler('ksuie_pistolcraft:server:50cal', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "Aluminum = "..AllCount.." Steel = "..SteelCount.." Plastic = "..PlasticCount.." CleaningKit = "..CleanCount.." ScrewdriverSet ="..ScrewDrCount.." Drill = "..DrillCount)
    local craftItem = "weapon_pistol50"
    local ing1 = "aluminum"
    local ing1count = AllCount
    local ing1req = 30
    local ing2 = "steel"
    local ing2count = SteelCount
    local ing2req = 30
    local ing3 = "plastic"
    local ing3count = PlasticCount
    local ing3req = 10
    local ing4 = "cleaningkit"
    local ing4count = CleanCount
    local ing4req = 1
    local ing5 = "screwdriverset"
    local ing5count = ScrewDrCount
    local ing5req = 1
    local ing6 = "drill"
    local ing6count = DrillCount
    local ing6req = 1

    local ing1math = 0
    local ing2math = 0
    local ing3math = 0
    local ing4math = 0
    local ing5math = 0
    local ing6math = 0

    local craftamount = 1

        if ing1count >= ing1req  and ing2count >= ing2req and ing3count >= ing3req and ing4count >= ing4req and ing5count >= ing5req and ing6count >= ing6req then
            ing1math = ing1req
            ing2math = ing2req
            ing3math = ing3req
            ing4math = ing4req
            ing5math = ing5req
            ing6math = ing6req
            if ing1math>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, ing1math)
                Player.Functions.RemoveItem(ing2, ing2math)
                Player.Functions.RemoveItem(ing3, ing3math)
                Player.Functions.RemoveItem(ing4, ing4math)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            AllCount = ing1count-ing1req
            SteelCount = ing2count-ing2req
            PlasticCount = ing3count-ing3req
            CleanCount = ing4count-ing4req
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
