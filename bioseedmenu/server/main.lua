SkunkCount = 0
BioKushCount = 0
BioBlueCount = 0
BioPurpCount = 0
BioAkCount = 0
BioAmCount = 0
BioWhiteCount = 0
BioCarpCount = 0
SeedIngSud = 0
SeedIngPai = 0
SeedIngMdp = 0
SeedIngGun = 0
SeedIngEph = 0
SeedIngFis = 0

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

RegisterNetEvent('bioseedmenu:server:countseeds')
AddEventHandler('bioseedmenu:server:countseeds', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if Player.PlayerData.items[k].name == "weed_skunk_seed" then
                    SkunkCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "weed_og-kush_seed" then 
                    BioKushCount = Player.PlayerData.items[k].amount

				elseif Player.PlayerData.items[k].name == "weed_bluedream_seed" then 
                    BioBlueCount = Player.PlayerData.items[k].amount

				elseif Player.PlayerData.items[k].name == "weed_purple-haze_seed" then 
                    BioPurpCount = Player.PlayerData.items[k].amount

				elseif Player.PlayerData.items[k].name == "weed_ak47_seed" then 
                    BioAkCount = Player.PlayerData.items[k].amount

				elseif Player.PlayerData.items[k].name == "weed_amnesia_seed" then 
                    BioAmCount = Player.PlayerData.items[k].amount

				elseif Player.PlayerData.items[k].name == "weed_white-widow_seed" then 
                    BioWhiteCount = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "sudafed" then
                    SeedIngSud = Player.PlayerData.items[k].amount

                elseif Player.PlayerData.items[k].name == "painkillers" then 
                    SeedIngPai = Player.PlayerData.items[k].amount

				elseif Player.PlayerData.items[k].name == "mdp2p" then 
                    SeedIngMdp = Player.PlayerData.items[k].amount

				elseif Player.PlayerData.items[k].name == "gunpowder" then 
                    SeedIngGun = Player.PlayerData.items[k].amount

				elseif Player.PlayerData.items[k].name == "ephedrine" then 
                    SeedIngEph = Player.PlayerData.items[k].amount

				elseif Player.PlayerData.items[k].name == "greatwhiteshark_fillet" then 
                    SeedIngFis = Player.PlayerData.items[k].amount

                end
            end
        end
	end
    TriggerClientEvent('QBCore:Notify', src, "Inventory Counted")
end)



RegisterNetEvent('bioseedmenu:server:biokush')
AddEventHandler('bioseedmenu:server:biokush', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "SkunkCount = "..SkunkCount)
    TriggerClientEvent('QBCore:Notify', src, "Sudafed = "..SeedIngSud)
    local craftseed = "weed_og-kush_seed"
    local craftIng = "sudafed"
    local baseseed = "weed_skunk_seed"
    local baseseedmath = 0
    local baseing = SeedIngSud
        if SkunkCount > 1 and baseing > 0 then
            baseseedmath = math.floor(SkunkCount/2)
            if baseseedmath*2 > baseing then
                Player.Functions.AddItem(craftseed, baseing)
                Player.Functions.RemoveItem(baseseed, baseing*2)
                Player.Functions.RemoveItem(craftIng, baseing)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..baseing..craftseed.."s")
            else
                Player.Functions.AddItem(craftseed, baseseedmath)
                Player.Functions.RemoveItem(baseseed, baseseedmath*2)
                Player.Functions.RemoveItem(craftIng, baseseedmath)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..baseseedmath..craftseed.."s")
            end
            craftseed = "none"
            craftIng = "none"
            baseseed = "none"
            baseseedmath = 0
            baseing = 0
            SeedIngSud = 0
            SkunkCount = 0
        else
        TriggerClientEvent('QBCore:Notify', src, "You are missing some ingredients")
        end
    Citizen.Wait(300)
end)

RegisterNetEvent('bioseedmenu:server:blue')
AddEventHandler('bioseedmenu:server:blue', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "weed_og-kush_seed = "..BioKushCount)
    TriggerClientEvent('QBCore:Notify', src, "painkillers = "..SeedIngPai)
    local craftseed = "weed_bluedream_seed"
    local craftIng = "painkillers"
    local baseseed = "weed_og-kush_seed"
    local baseseedmath = 0
    local baseing = SeedIngPai
        if BioKushCount > 1 and baseing > 0 then
            baseseedmath = math.floor(BioKushCount/2)
            if baseseedmath*2 > baseing then
                Player.Functions.AddItem(craftseed, baseing)
                Player.Functions.RemoveItem(baseseed, baseing*2)
                Player.Functions.RemoveItem(craftIng, baseing)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..baseing..craftseed.."s")
            else
                Player.Functions.AddItem(craftseed, baseseedmath)
                Player.Functions.RemoveItem(baseseed, baseseedmath*2)
                Player.Functions.RemoveItem(craftIng, baseseedmath)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..baseseedmath..craftseed.."s")
            end
            craftseed = "none"
            craftIng = "none"
            baseseed = "none"
            baseseedmath = 0
            baseing = 0
            SeedIngPai = 0
            BioKushCount = 0
        else
        TriggerClientEvent('QBCore:Notify', src, "You are missing some ingredients")
        end
    Citizen.Wait(300)
end)

RegisterNetEvent('bioseedmenu:server:purple')
AddEventHandler('bioseedmenu:server:purple', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "weed_bluedream_seed = "..BioBlueCount)
    TriggerClientEvent('QBCore:Notify', src, "mdp2p = "..SeedIngMdp)
    local craftseed = "weed_purple-haze_seed"
    local craftIng = "mdp2p"
    local baseseed = "weed_bluedream_seed"
    local baseseedmath = 0
    local baseing = SeedIngMdp
        if BioBlueCount > 1 and baseing > 0 then
            baseseedmath = math.floor(BioBlueCount/2)
            if baseseedmath*2 > baseing then
                Player.Functions.AddItem(craftseed, baseing)
                Player.Functions.RemoveItem(baseseed, baseing*2)
                Player.Functions.RemoveItem(craftIng, baseing)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..baseing..craftseed.."s")
            else
                Player.Functions.AddItem(craftseed, baseseedmath)
                Player.Functions.RemoveItem(baseseed, baseseedmath*2)
                Player.Functions.RemoveItem(craftIng, baseseedmath)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..baseseedmath..craftseed.."s")
            end
            craftseed = "none"
            craftIng = "none"
            baseseed = "none"
            baseseedmath = 0
            baseing = 0
            SeedIngMdp = 0
            BioBlueCount = 0
        else
        TriggerClientEvent('QBCore:Notify', src, "You are missing some ingredients")
        end
    Citizen.Wait(300)
end)

RegisterNetEvent('bioseedmenu:server:ak47')
AddEventHandler('bioseedmenu:server:ak47', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "weed_purple-haze_seed = "..BioPurpCount)
    TriggerClientEvent('QBCore:Notify', src, "gunpowder = "..SeedIngGun)
    local craftseed = "weed_ak47_seed"
    local craftIng = "gunpowder"
    local baseseed = "weed_purple-haze_seed"
    local baseseedmath = 0
    local baseing = SeedIngGun
        if BioPurpCount > 1 and baseing > 0 then
            baseseedmath = math.floor(BioPurpCount/2)
            if baseseedmath*2 > baseing then
                Player.Functions.AddItem(craftseed, baseing)
                Player.Functions.RemoveItem(baseseed, baseing*2)
                Player.Functions.RemoveItem(craftIng, baseing)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..baseing..craftseed.."s")
            else
                Player.Functions.AddItem(craftseed, baseseedmath)
                Player.Functions.RemoveItem(baseseed, baseseedmath*2)
                Player.Functions.RemoveItem(craftIng, baseseedmath)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..baseseedmath..craftseed.."s")
            end
            craftseed = "none"
            craftIng = "none"
            baseseed = "none"
            baseseedmath = 0
            baseing = 0
            SeedIngGun = 0
            BioPurpCount = 0
        else
        TriggerClientEvent('QBCore:Notify', src, "You are missing some ingredients")
        end
    Citizen.Wait(300)
end)

RegisterNetEvent('bioseedmenu:server:amnesia')
AddEventHandler('bioseedmenu:server:amnesia', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "weed_ak47_seed = "..BioAkCount)
    TriggerClientEvent('QBCore:Notify', src, "ephedrine = "..SeedIngEph)
    local craftseed = "weed_amnesia_seed"
    local craftIng = "ephedrine"
    local baseseed = "weed_ak47_seed"
    local baseseedmath = 0
    local baseing = SeedIngEph
        if BioAkCount > 1 and baseing > 0 then
            baseseedmath = math.floor(BioAkCount/2)
            if baseseedmath*2 > baseing then
                Player.Functions.AddItem(craftseed, baseing)
                Player.Functions.RemoveItem(baseseed, baseing*2)
                Player.Functions.RemoveItem(craftIng, baseing)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..baseing..craftseed.."s")
            else
                Player.Functions.AddItem(craftseed, baseseedmath)
                Player.Functions.RemoveItem(baseseed, baseseedmath*2)
                Player.Functions.RemoveItem(craftIng, baseseedmath)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..baseseedmath..craftseed.."s")
            end
            craftseed = "none"
            craftIng = "none"
            baseseed = "none"
            baseseedmath = 0
            baseing = 0
            SeedIngEph = 0
            BioAkCount = 0
        else
        TriggerClientEvent('QBCore:Notify', src, "You are missing some ingredients")
        end
    Citizen.Wait(300)
end)

RegisterNetEvent('bioseedmenu:server:widow')
AddEventHandler('bioseedmenu:server:widow', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "weed_amnesia_seed = "..BioAmCount)
    TriggerClientEvent('QBCore:Notify', src, "painkillers = "..SeedIngPai)
    local craftseed = "weed_white-widow_seed"
    local craftIng = "painkillers"
    local baseseed = "weed_amnesia_seed"
    local baseseedmath = 0
    local baseing = SeedIngPai
        if BioAmCount > 1 and baseing > 0 then
            baseseedmath = math.floor(BioAmCount/2)
            if baseseedmath*2 > baseing then
                Player.Functions.AddItem(craftseed, baseing)
                Player.Functions.RemoveItem(baseseed, baseing*2)
                Player.Functions.RemoveItem(craftIng, baseing)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..baseing..craftseed.."s")
            else
                Player.Functions.AddItem(craftseed, baseseedmath)
                Player.Functions.RemoveItem(baseseed, baseseedmath*2)
                Player.Functions.RemoveItem(craftIng, baseseedmath)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..baseseedmath..craftseed.."s")
            end
            craftseed = "none"
            craftIng = "none"
            baseseed = "none"
            baseseedmath = 0
            baseing = 0
            SeedIngPai = 0
            BioAmCount = 0
        else
        TriggerClientEvent('QBCore:Notify', src, "You are missing some ingredients")
        end
    Citizen.Wait(300)
end)

RegisterNetEvent('bioseedmenu:server:carpfather')
AddEventHandler('bioseedmenu:server:carpfather', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "weed_white-widow_seed = "..BioWhiteCount)
    TriggerClientEvent('QBCore:Notify', src, "greatwhiteshark_fillet = "..SeedIngFis)
    local craftseed = "weed_thecarpfather_seed"
    local craftIng = "greatwhiteshark_fillet"
    local baseseed = "weed_white-widow_seed"
    local baseseedmath = 0
    local baseing = SeedIngFis
        if BioWhiteCount > 1 and baseing > 0 then
            baseseedmath = math.floor(BioWhiteCount/2)
            if baseseedmath*2 > baseing then
                Player.Functions.AddItem(craftseed, baseing)
                Player.Functions.RemoveItem(baseseed, baseing*2)
                Player.Functions.RemoveItem(craftIng, baseing)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..baseing..craftseed.."s")
            else
                Player.Functions.AddItem(craftseed, baseseedmath)
                Player.Functions.RemoveItem(baseseed, baseseedmath*2)
                Player.Functions.RemoveItem(craftIng, baseseedmath)
                TriggerClientEvent('QBCore:Notify', src, "You are crafting "..baseseedmath..craftseed.."s")
            end
            craftseed = "none"
            craftIng = "none"
            baseseed = "none"
            baseseedmath = 0
            baseing = 0
            SeedIngFis = 0
            BioWhiteCount = 0
        else
        TriggerClientEvent('QBCore:Notify', src, "You are missing some ingredients")
        end
    Citizen.Wait(300)
end)


