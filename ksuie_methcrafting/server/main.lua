local LithCount = 0
local EphCount = 0
local TrayCount = 0
local BagCount = 0
local IsoCount = 0
local LSACount = 0
local PapCount = 0

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

RegisterNetEvent('ksuie_methcrafting:server:countinv')
AddEventHandler('ksuie_methcrafting:server:countinv', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if Player.PlayerData.items[k].name == "lithium" then 
                    LithCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "ephedrine" then 
                    EphCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "puremethtray" then 
                    TrayCount = Player.PlayerData.items[k].amount
                
                elseif Player.PlayerData.items[k].name == "empty_weed_bag" then 
                    BagCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "lysergic_acid" then 
                    LSACount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "rolling_paper" then 
                    PapCount = Player.PlayerData.items[k].amount

                end
            end
        end
	end
    TriggerClientEvent('QBCore:Notify', src, "Inventory Counted")
end)


--!!!!!!!!!!!!!!!!!!Casing Craft!!!!!!!!!!!!!!!!!!!!!-------------------------

RegisterNetEvent('ksuie_methcrafting:server:tray')
AddEventHandler('ksuie_methcrafting:server:tray', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "Lithium = "..LithCount.." Ephedrine = "..EphCount)
    local craftItem = "puremethtray"
    local ing1 = "lithium"
    local ing1count = LithCount
    local ing1req = 10
    local ing2 = "ephedrine"
    local ing2count = EphCount
    local ing2req = 10

    local ing1math = 0
    local ing2math = 0
    local craftamount = math.min(math.floor(LithCount/ing1req),math.floor(EphCount/ing2req))

        if ing1count >= ing1req  and ing2count >= ing2req and ing3count >= ing3req and ing4count >= ing4req and ing5count >= ing5req and ing6count >= ing6req then
            ing1math = ing1req*craftamount
            ing2math = ing2req*craftamount
            if ing1math>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, ing1math)
                Player.Functions.RemoveItem(ing2, ing2math)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            LithCount = 0
            EphCount = 0
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

RegisterNetEvent('ksuie_methcrafting:server:meth')
AddEventHandler('ksuie_methcrafting:server:meth', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "Meth Trays = "..TrayCount.." Bags = "..BagCount)
    local craftItem = "meth"
    local ing1 = "puremethtray"
    local ing1count = TrayCount
    local ing1req = 1
    local ing2 = "empty_weed_bag"
    local ing2count = BagCount
    local ing2req = 20

    local ing1math = 0
    local ing2math = 0

    local craftamount = math.min(math.floor(ing1count/ing1req),math.floor(ing2count/ing2req))

        if ing1count >= ing1req  and ing2count >= ing2req and ing3count >= ing3req and ing4count >= ing4req and ing5count >= ing5req and ing6count >= ing6req then
            ing1math = ing1req*craftamount
            ing2math = ing2req*craftamount
            if ing1math>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, ing1math)
                Player.Functions.RemoveItem(ing2, ing2math)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            TrayCount = 0
            BagCount = 0
            craftItem = nil
            ing1 = nil
            ing1math = 0
            ing1count = 0
            ing2 = nil
            ing2math = 0
            ing2count = 0
        end

        if ing1count<ing1req or ing2count < ing2req or ing3count < ing3req or ing4count < ing4req or ing5count < ing5req or ing6count < ing6req then
        TriggerClientEvent('QBCore:Notify', src, "You are missing some ingredients or tools")
        end
    Citizen.Wait(300)
end)

RegisterNetEvent('ksuie_methcrafting:server:lsd')
AddEventHandler('ksuie_methcrafting:server:lsd', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "LSA = "..LSACount.." Paper = "..PapCount)
    local craftItem = "lsd"
    local ing1 = "lysergic_acid"
    local ing1count = LSACount
    local ing1req = 10
    local ing2 = "rolling_paper"
    local ing2count = PapCount
    local ing2req = 10

    local ing1math = 0
    local ing2math = 0

    local craftamount = math.min(math.floor(ing1count/ing1req),math.floor(ing2count/ing2req))

        if ing1count >= ing1req  and ing2count >= ing2req and ing3count >= ing3req and ing4count >= ing4req and ing5count >= ing5req and ing6count >= ing6req then
            ing1math = ing1req*craftamount
            ing2math = ing2req*craftamount

            if craftamount>0 then
                Player.Functions.AddItem(craftItem, craftamount)
                Player.Functions.RemoveItem(ing1, ing1math)
                Player.Functions.RemoveItem(ing2, ing2math)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..craftamount..craftItem.."s")
            end
            LSACount = 0
            PapCount = 0
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

