local PistolCaseCount = 0
local ShotgunCaseCount = 0
local SMGCaseCount = 0
local RifleCaseCount = 0
local MGCaseCount = 0
local GunpowderCount = 0
local CopperCount = 0
local MetalSrapCount = 0
local SteelCount = 0

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

RegisterNetEvent('ksuie_ammocraft:server:countinv')
AddEventHandler('ksuie_ammocraft:server:countinv', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if Player.PlayerData.items[k].name == "pistol_casing" then 
                    PistolCaseCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "shotgun_casing" then 
                    ShotgunCaseCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "smg_casing" then 
                    SMGCaseCount = Player.PlayerData.items[k].amount
                
                elseif Player.PlayerData.items[k].name == "rifle_casing" then 
                    RifleCaseCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "mg_casing" then 
                    MGCaseCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "gunpowder" then 
                    GunpowderCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "metalscrap" then 
                    MetalSrapCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "copper" then 
                    CopperCount = Player.PlayerData.items[k].amount


                elseif Player.PlayerData.items[k].name == "steel" then 
                    SteelCount = Player.PlayerData.items[k].amount
                end
            end
        end
	end
    TriggerClientEvent('QBCore:Notify', src, "Inventory Counted")
end)


--!!!!!!!!!!!!!!!!!!Casing Craft!!!!!!!!!!!!!!!!!!!!!-------------------------

RegisterNetEvent('ksuie_ammocraft:server:pistol')
AddEventHandler('ksuie_ammocraft:server:pistol', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "GunpowderCount = "..GunpowderCount.." PistolCasing = "..PistolCaseCount.." Copper = "..CopperCount)
    local craftItem = "pistol_ammo"
    local ing1 = "gunpowder"
    local ing1count = GunpowderCount
    local ing1req = 10
    local ing2 = "pistol_casing"
    local ing2count = PistolCaseCount
    local ing2req = 10
    local ing3 = "copper"
    local ing3count = CopperCount
    local ing3req = 10
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
            GunpowderCount = 0
            PistolCaseCount = 0
            CopperCount = 0
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

RegisterNetEvent('ksuie_ammocraft:server:shotgun')
AddEventHandler('ksuie_ammocraft:server:shotgun', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "MetalSrapCount = "..MetalSrapCount.." Gunpowder = "..GunpowderCount.." Shotgun Casing = "..ShotgunCaseCount)
    local craftItem = "shotgun_ammo"
    local ing1 = "metalscrap"
    local ing1count = MetalSrapCount
    local ing1req = 10
    local ing2 = "gunpowder"
    local ing2count = GunpowderCount
    local ing2req = 30
    local ing3 = "shotgun_casing"
    local ing3count = ShotgunCaseCount
    local ing3req = 10
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

            MetalSrapCount = 0
            GunpowderCount = 0
            ShotgunCaseCount = 0
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

RegisterNetEvent('ksuie_ammocraft:server:smg')
AddEventHandler('ksuie_ammocraft:server:smg', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "Gunpowder = "..GunpowderCount.. "SMG Casing = "..SMGCaseCount.." Copper = "..CopperCount)
    local craftItem = "smg_ammo"
    local ing1 = "gunpowder"
    local ing1count = GunpowderCount
    local ing1req = 10
    local ing2 = "smg_casing"
    local ing2count = SMGCaseCount
    local ing2req = 10
    local ing3 = "copper"
    local ing3count = CopperCount
    local ing3req = 10
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
            ing1math = ing1count
            ing2math = ing2count
            ing3math = ing3count
            if ing1math>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, ing1math)
                Player.Functions.RemoveItem(ing2, ing2math)
                Player.Functions.RemoveItem(ing3, ing3math)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            GunpowderCount = 0
            SMGCaseCount = 0
            CopperCount = 0
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

RegisterNetEvent('ksuie_ammocraft:server:rifle')
AddEventHandler('ksuie_ammocraft:server:rifle', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "Gunpowder = "..GunpowderCount.. "Rifle Casing = "..RifleCaseCount.." Steel = "..SteelCount)
    local craftItem = "rifle_ammo"
    local ing1 = "gunpowder"
    local ing1count = GunpowderCount
    local ing1req = 20
    local ing2 = "rifle_casing"
    local ing2count = RifleCaseCount
    local ing2req = 10
    local ing3 = "steel"
    local ing3count = 10
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
            ing1math = ing1count
            ing2math = ing2count
            ing3math = ing3count
            if ing1math>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, ing1math)
                Player.Functions.RemoveItem(ing2, ing2math)
                Player.Functions.RemoveItem(ing3, ing3math)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            GunpowderCount = 0
            RifleCaseCount = 0
            SteelCount = 0
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

RegisterNetEvent('ksuie_ammocraft:server:mg')
AddEventHandler('ksuie_ammocraft:server:mg', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "Gunpowder = "..GunpowderCount.. "Steel = "..SteelCount.." MG Belts = "..MGCaseCount)
    local craftItem = "mg_ammo"
    local ing1 = "gunpowder"
    local ing1count = GunpowderCount
    local ing1req = 50
    local ing2 = "steel"
    local ing2count = SteelCount
    local ing2req = 20
    local ing3 = "mg_casing"
    local ing3count = MGCaseCount
    local ing3req = 10
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
            ing1math = ing1count
            ing2math = ing2count
            ing3math = ing3count
            if ing1math>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, ing1math)
                Player.Functions.RemoveItem(ing2, ing2math)
                Player.Functions.RemoveItem(ing3, ing3math)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            GunpowderCount = 0
            SteelCount = 0
            MGCaseCount = 0
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

RegisterNetEvent('ksuie_ammocraft:server:sniper')
AddEventHandler('ksuie_ammocraft:server:sniper', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "Gunpowder = "..GunpowderCount.. "Rifle Casing = "..RifleCaseCount.." Steel = "..SteelCount)
    local craftItem = "sniper_ammo"
    local ing1 = "gunpowder"
    local ing1count = GunpowderCount
    local ing1req = 20
    local ing2 = "rifle_casing"
    local ing2count = RifleCaseCount
    local ing2req = 10
    local ing3 = "steel"
    local ing3count = SteelCount
    local ing3req = 10
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
            ing1math = ing1count
            ing2math = ing2count
            ing3math = ing3count
            if ing1math>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, ing1math)
                Player.Functions.RemoveItem(ing2, ing2math)
                Player.Functions.RemoveItem(ing3, ing3math)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            GunpowderCount = 0
            RifleCaseCount = 0
            SteelCount = 0
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
