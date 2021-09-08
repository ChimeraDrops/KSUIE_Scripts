local ScrapCount = 0
local PlasticCount = 0
local CopperCount = 0
local SteelCount = 0
local SaltpeterCount = 0
local CharcoalCount = 0

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

RegisterNetEvent('ksuie_casingcraft:server:countinv')
AddEventHandler('ksuie_casingcraft:server:countinv', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if Player.PlayerData.items[k].name == "metalscrap" then 
                    ScrapCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "plastic" then 
                    PlasticCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "copper" then 
                    CopperCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "steel" then 
                    SteelCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "saltpeter" then 
                    SaltpeterCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "charcoal" then 
                    CharcoalCount = Player.PlayerData.items[k].amount

                end
            end
        end
	end
    TriggerClientEvent('QBCore:Notify', src, "Inventory Counted")
end)


--!!!!!!!!!!!!!!!!!!Casing Craft!!!!!!!!!!!!!!!!!!!!!-------------------------

RegisterNetEvent('ksuie_casingcraft:server:pistol')
AddEventHandler('ksuie_casingcraft:server:pistol', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "ScrapCount = "..ScrapCount)
    local craftItem = "pistol_casing"
    local ing1 = "metalscrap"
    local ing1count = ScrapCount
    local ing1req = 10
    local ing2 = nil
    local ing2count = 0
    local ing2req = 0
    local ing3 = nil
    local ing3count = 0
    local ing3req = 0
    local ing4 = nil
    local ing4count = 0
    local ing4req = 0
    local ing5 = nil
    local ing5count = 0
    local ing5req = 0

    local ing1math = 0
    local ing2math = 0
    local ing3math = 0
    local ing4math = 0
    local ing5math = 0
    local craftamount = 10


        if ing1count >= ing1req  and ing2count >= ing2req and ing3count >= ing3req and ing4count >= ing4req and ing5count >= ing5req then
            ing1math = ing1req
            if ing1math>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, ing1math)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            ScrapCount = 0
            craftItem = nil
            ing1 = nil
            ing1math = 0
            ing1count = 0
        else
        TriggerClientEvent('QBCore:Notify', src, "You are missing some ingredients or tools")
        end
    Citizen.Wait(300)
end)

RegisterNetEvent('ksuie_casingcraft:server:shotgun')
AddEventHandler('ksuie_casingcraft:server:shotgun', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "PlasticCount = "..PlasticCount)
    local craftItem = "shotgun_casing"
    local ing1 = "plastic"
    local ing1count = PlasticCount
    local ing1req = 10
    local ing2 = nil
    local ing2count = 0
    local ing2req = 0
    local ing3 = nil
    local ing3count = 0
    local ing3req = 0
    local ing4 = nil
    local ing4count = 0
    local ing4req = 0
    local ing5 = nil
    local ing5count = 0
    local ing5req = 0

    local ing1math = 0
    local ing2math = 0
    local ing3math = 0
    local ing4math = 0
    local ing5math = 0
    local craftamount = 10


        if ing1count >= ing1req  and ing2count >= ing2req and ing3count >= ing3req and ing4count >= ing4req and ing5count >= ing5req then
            ing1math = ing1req
            if ing1math>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, ing1math)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            PlasticCount = 0
            craftItem = nil
            ing1 = nil
            ing1math = 0
            ing1count = 0
        else
        TriggerClientEvent('QBCore:Notify', src, "You are missing some ingredients or tools")
        end
    Citizen.Wait(300)
end)

RegisterNetEvent('ksuie_casingcraft:server:smg')
AddEventHandler('ksuie_casingcraft:server:smg', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "metalscrap = "..ScrapCount.. "CopperCount = "..CopperCount)
    local craftItem = "smg_casing"
    local ing1 = "metalscrap"
    local ing1count = ScrapCount
    local ing1req = 10
    local ing2 = "copper"
    local ing2count = CopperCount
    local ing2req = 10
    local ing3 = nil
    local ing3count = 0
    local ing3req = 0
    local ing4 = nil
    local ing4count = 0
    local ing4req = 0
    local ing5 = nil
    local ing5count = 0
    local ing5req = 0

    local ing1math = 0
    local ing2math = 0
    local ing3math = 0
    local ing4math = 0
    local ing5math = 0
    local craftamount = 10


        if ing1count >= ing1req  and ing2count >= ing2req and ing3count >= ing3req and ing4count >= ing4req and ing5count >= ing5req then
            ing1math = ing1req
            ing2math = ing2req
            if ing1math>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, ing1math)
                Player.Functions.RemoveItem(ing2, ing2math)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            ScrapCount = 0
            CopperCount = 0
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

RegisterNetEvent('ksuie_casingcraft:server:rifle')
AddEventHandler('ksuie_casingcraft:server:rifle', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "SteelCount = "..SteelCount.. "CopperCount = "..CopperCount)
    local craftItem = "rifle_casing"
    local ing1 = "steel"
    local ing1count = SteelCount
    local ing1req = 10
    local ing2 = "copper"
    local ing2count = CopperCount
    local ing2req = 10
    local ing3 = nil
    local ing3count = 0
    local ing3req = 0
    local ing4 = nil
    local ing4count = 0
    local ing4req = 0
    local ing5 = nil
    local ing5count = 0
    local ing5req = 0

    local ing1math = 0
    local ing2math = 0
    local ing3math = 0
    local ing4math = 0
    local ing5math = 0
    local craftamount = 10


        if ing1count >= ing1req  and ing2count >= ing2req and ing3count >= ing3req and ing4count >= ing4req and ing5count >= ing5req then
            ing1math = ing1req
            ing2math = ing2req
            if ing1math>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, ing1math)
                Player.Functions.RemoveItem(ing2, ing2math)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            PlasticCount = 0
            CopperCount = 0
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

RegisterNetEvent('ksuie_casingcraft:server:mg')
AddEventHandler('ksuie_casingcraft:server:mg', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "SteelCount = "..SteelCount.. "CopperCount = "..CopperCount.." ScrapCount = "..ScrapCount)
    local craftItem = "mg_casing"
    local ing1 = "steel"
    local ing1count = SteelCount
    local ing1req = 20
    local ing2 = "copper"
    local ing2count = CopperCount
    local ing2req = 20
    local ing3 = "metalscrap"
    local ing3count = ScrapCount
    local ing3req = 20
    local ing4 = nil
    local ing4count = 0
    local ing4req = 0
    local ing5 = nil
    local ing5count = 0
    local ing5req = 0

    local ing1math = 0
    local ing2math = 0
    local ing3math = 0
    local ing4math = 0
    local ing5math = 0
    local craftamount = 10

        if ing1count >= ing1req  and ing2count >= ing2req and ing3count >= ing3req and ing4count >= ing4req and ing5count >= ing5req then
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
            SteelCount = 0
            CopperCount = 0
            ScrapCount = 0
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
        else
        TriggerClientEvent('QBCore:Notify', src, "You are missing some ingredients or tools")
        end
    Citizen.Wait(300)
end)

RegisterNetEvent('ksuie_casingcraft:server:gunpowder')
AddEventHandler('ksuie_casingcraft:server:gunpowder', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "SaltpeterCount = "..SaltpeterCount.. "CharcoalCount = "..CharcoalCount)
    local craftItem = "gunpowder"
    local ing1 = "saltpeter"
    local ing1count = SaltpeterCount
    local ing1req = 10
    local ing2 = "charcoal"
    local ing2count = CharcoalCount
    local ing2req = 1

    local ing1math = 0
    local ing2math = 0
    local craftamount = 20

        if ing1count >= ing1req  and ing2count >= ing2req then
            ing1math = ing1req
            ing2math = ing2req
            ing3math = ing3req
            if ing1math>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, ing1math)
                Player.Functions.RemoveItem(ing2, ing2math)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            SaltpeterCount = 0
            CharcoalCount = 0
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
