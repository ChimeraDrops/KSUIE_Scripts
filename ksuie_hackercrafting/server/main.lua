local PlasticCount = 0
local CopperCount = 0
local GoldCount = 0
local ElecKitCount = 0
local PhoneCount = 0
local SimCount = 0
local ToolCount = 0
local AluminumCount = 0
local SteelCount = 0
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

RegisterNetEvent('ksuie_hackercrafting:server:countinv')
AddEventHandler('ksuie_hackercrafting:server:countinv', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if Player.PlayerData.items[k].name == "plastic" then 
                    PlasticCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "copper" then 
                    CopperCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "goldchain" then 
                    GoldCount = Player.PlayerData.items[k].amount
                
                elseif Player.PlayerData.items[k].name == "electronickit" then 
                    ElecKitCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "phone" then 
                    PhoneCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "craft_sim_card" then 
                    SimCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "screwdriverset" then 
                    ToolCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "aluminum" then 
                    AluminumCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "steel" then 
                    SteelCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "drill" then 
                    DrillCount = Player.PlayerData.items[k].amount


                end
            end
        end
	end
    TriggerClientEvent('QBCore:Notify', src, "Inventory Counted")
end)


--!!!!!!!!!!!!!!!!!!Casing Craft!!!!!!!!!!!!!!!!!!!!!-------------------------

RegisterNetEvent('ksuie_hackercrafting:server:carda')
AddEventHandler('ksuie_hackercrafting:server:carda', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "Plastic = "..PlasticCount.." Copper = "..CopperCount.." Gold = "..GoldCount.." Electronic = "..ElecKitCount)
    local craftItem = "security_card_01"
    local ing1 = "plastic"
    local ing1count = PlasticCount
    local ing1req = 10
    local ing2 = "copper"
    local ing2count = CopperCount
    local ing2req = 10
    local ing3 = "goldchain"
    local ing3count = GoldCount
    local ing3req = 5
    local ing4 = "electronickit"
    local ing4count = ElecKitCount
    local ing4req = 1

    local ing1math = 0
    local ing2math = 0
    local ing3math = 0
    local ing4math = 0

    local craftamount = 1

        if ing1count >= ing1req  and ing2count >= ing2req and ing3count >= ing3req and ing4count >= ing4req then
            ing1math = ing1req
            ing2math = ing2req
            ing3math = ing3req
            ing4math = ing4req
            if ing1math>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, ing1math)
                Player.Functions.RemoveItem(ing2, ing2math)
                Player.Functions.RemoveItem(ing3, ing3math)
                Player.Functions.RemoveItem(ing4, ing4math)

                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            PlasticCount = 0
            CopperCount = 0
            GoldCount = 0
            ElecKitCount = 0
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

        if ing1count < ing1req  or ing2count < ing2req or ing3count < ing3req or ing4count < ing4req then
            TriggerClientEvent('QBCore:Notify', src, "You are missing some ingredients or tools")
        end
    Citizen.Wait(300)
end)

RegisterNetEvent('ksuie_hackercrafting:server:cardb')
AddEventHandler('ksuie_hackercrafting:server:cardb', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "Plastic = "..PlasticCount.." Copper = "..CopperCount.." Gold = "..GoldCount.." Electronic = "..ElecKitCount)
    local craftItem = "security_card_02"
    local ing1 = "plastic"
    local ing1count = PlasticCount
    local ing1req = 20
    local ing2 = "copper"
    local ing2count = CopperCount
    local ing2req = 20
    local ing3 = "goldchain"
    local ing3count = GoldCount
    local ing3req = 10
    local ing4 = "electronickit"
    local ing4count = ElecKitCount
    local ing4req = 1

    local ing1math = 0
    local ing2math = 0
    local ing3math = 0
    local ing4math = 0

    local craftamount = 1

        if ing1count >= ing1req  and ing2count >= ing2req and ing3count >= ing3req and ing4count >= ing4req then
            ing1math = ing1req
            ing2math = ing2req
            ing3math = ing3req
            ing4math = ing4req
            if ing1math>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, ing1math)
                Player.Functions.RemoveItem(ing2, ing2math)
                Player.Functions.RemoveItem(ing3, ing3math)
                Player.Functions.RemoveItem(ing4, ing4math)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            PlasticCount = 0
            CopperCount = 0
            GoldCount = 0
            ElecKitCount = 0
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

RegisterNetEvent('ksuie_hackercrafting:server:hack')
AddEventHandler('ksuie_hackercrafting:server:hack', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "Phone = "..PhoneCount.." SimCard = "..SimCount.." Copper = "..CopperCount.." Gold = "..GoldCount.." Electronics ="..ElecKitCount.." Tools = "..ToolCount)
    local craftItem = "hackerdevice"
    local ing1 = "phone"
    local ing1count = PhoneCount
    local ing1req = 1
    local ing2 = "craft_sim_card"
    local ing2count = SimCount
    local ing2req = 10
    local ing3 = "copper"
    local ing3count = CopperCount
    local ing3req = 20
    local ing4 = "goldchain"
    local ing4count = GoldCount
    local ing4req = 15
    local ing5 = "electronickit"
    local ing5count = ElecKitCount
    local ing5req = 1
    local ing6 = "screwdriverset"
    local ing6count = ToolCount
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
                Player.Functions.RemoveItem(ing5, ing5math)
                Player.Functions.RemoveItem(ing6, ing6math)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            PhoneCount = 0
            CopperCount = 0
            PlasticCount = 0
            SimCount = 0
            GoldCount = 0
            ElecKitCount = 0 
            ToolCount = 0
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
            ing5 = nil
            ing5math = 0
            ing5count = 0
            ing6 = nil
            ing6math = 0
            ing6count = 0

        else
        TriggerClientEvent('QBCore:Notify', src, "You are missing some ingredients or tools")
        end
    Citizen.Wait(300)
end)

RegisterNetEvent('ksuie_hackercrafting:server:trojan')
AddEventHandler('ksuie_hackercrafting:server:trojan', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "Phones = "..PhoneCount.." Simcards = "..SimCount.." Copper = "..CopperCount.." Gold = "..GoldCount.." ScrewdriverSet ="..ToolCount)
    local craftItem = "trojan_usb"
    local ing1 = "phone"
    local ing1count = PhoneCount
    local ing1req = 1
    local ing2 = "craft_sim_card"
    local ing2count = SimCount
    local ing2req = 5
    local ing3 = "copper"
    local ing3count = CopperCount
    local ing3req = 10
    local ing4 = "goldchain"
    local ing4count = GoldCount
    local ing4req = 5
    local ing5 = "screwdriverset"
    local ing5count = ToolCount
    local ing5req = 1

    local ing1math = 0
    local ing2math = 0
    local ing3math = 0
    local ing4math = 0
    local ing5math = 0

    local craftamount = 1

        if ing1count >= ing1req  and ing2count >= ing2req and ing3count >= ing3req and ing4count >= ing4req and ing5count >= ing5req then
            ing1math = ing1req
            ing2math = ing2req
            ing3math = ing3req
            ing4math = ing4req
            ing5math = ing5req
            if ing1math>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, ing1math)
                Player.Functions.RemoveItem(ing2, ing2math)
                Player.Functions.RemoveItem(ing3, ing3math)
                Player.Functions.RemoveItem(ing4, ing4math)
                Player.Functions.RemoveItem(ing5, ing5math)

                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            PhoneCount = 0
            SimCount = 0
            CopperCount = 0
            GoldCount = 0
            ToolCount = 0
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
            ing5 = nil
            ing5math = 0
            ing5count = 0

        else
        TriggerClientEvent('QBCore:Notify', src, "You are missing some ingredients or tools")
        end
    Citizen.Wait(300)
end)

RegisterNetEvent('ksuie_hackercrafting:server:handcuffs')
AddEventHandler('ksuie_hackercrafting:server:handcuffs', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "Aluminum = "..AluminumCount.." Steel = "..SteelCount.." ScrewdriverSet ="..ToolCount.." Drill = "..DrillCount)
    local craftItem = "weapon_handcuffs"
    local ing1 = "aluminum"
    local ing1count = AluminumCount
    local ing1req = 20
    local ing2 = "steel"
    local ing2count = SteelCount
    local ing2req = 10
    local ing3 = "screwdriverset"
    local ing3count = ToolCount
    local ing3req = 1
    local ing4 = "drill"
    local ing4count = DrillCount
    local ing4req = 1

    local ing1math = 0
    local ing2math = 0
    local ing3math = 0
    local ing4math = 0

    local craftamount = 1

        if ing1count >= ing1req  and ing2count >= ing2req and ing3count >= ing3req and ing4count >= ing4req then
            ing1math = ing1req
            ing2math = ing2req
            ing3math = ing3req
            ing4math = ing4req
            if ing1math>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, ing1math)
                Player.Functions.RemoveItem(ing2, ing2math)
                Player.Functions.RemoveItem(ing3, ing3math)
                Player.Functions.RemoveItem(ing4, ing4math)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            AluminumCount = 0
            SteelCount = 0
            ToolCount = 0
            DrillCount = 0
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

RegisterNetEvent('ksuie_hackercrafting:server:key')
AddEventHandler('ksuie_hackercrafting:server:key', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "Aluminum = "..AluminumCount.." Drill = "..DrillCount)
    local craftItem = "labkey"
    local ing1 = "aluminum"
    local ing1count = AluminumCount
    local ing1req = 10
    local ing2 = "drill"
    local ing2count = DrillCount
    local ing2req = 1

    local ing1math = 0
    local ing2math = 0

    local craftamount = 1

        if ing1count >= ing1req  and ing2count >= ing2req then
            ing1math = ing1req
            ing2math = ing2req
            if ing1math>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, ing1math)
                Player.Functions.RemoveItem(ing2, ing2math)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            AluminumCount = 0
            DrillCount = 0
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

