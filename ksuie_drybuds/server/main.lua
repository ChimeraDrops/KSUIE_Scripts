QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
local SkunkCount = 0
local BioKushCount = 0
local BioBlueCount = 0
local BioPurpCount = 0
local BioAkCount = 0
local BioAmCount = 0
local BioWhiteCount = 0
local BioCarpCount = 0
local TimerMath = 0
local AssignedDryer = 0
local SK1 = 0
local KU1 = 0
local BL1 = 0
local PU1 = 0
local AK1 = 0
local AM1 = 0
local WW1 = 0
local CF1 = 0
local SK2 = 0
local KU2 = 0
local BL2 = 0
local PU2 = 0
local AK2 = 0
local AM2 = 0
local WW2 = 0
local CF2 = 0
local SK3 = 0
local KU3 = 0
local BL3 = 0
local PU3 = 0
local AK3 = 0
local AM3 = 0
local WW3 = 0
local CF3 = 0
local SK4 = 0
local KU4 = 0
local BL4 = 0
local PU4 = 0
local AK4 = 0
local AM4 = 0
local WW4 = 0
local CF4 = 0
local SK5 = 0
local KU5 = 0
local BL5 = 0
local PU5 = 0
local AK5 = 0
local AM5 = 0
local WW5 = 0
local CF5 = 0



RegisterNetEvent("ksuie_drybuds:server:checkInv")
AddEventHandler("ksuie_drybuds:server:checkInv", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
        if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
            for k, v in pairs(Player.PlayerData.items) do 
                if Player.PlayerData.items[k] ~= nil then 
                    if Player.PlayerData.items[k].name == "skunk_bud_wet" then
                        SkunkCount = Player.PlayerData.items[k].amount
    
                    elseif Player.PlayerData.items[k].name == "og-kush_bud_wet" then 
                        BioKushCount = Player.PlayerData.items[k].amount
    
                    elseif Player.PlayerData.items[k].name == "bluedream_bud_wet" then 
                        BioBlueCount = Player.PlayerData.items[k].amount
    
                    elseif Player.PlayerData.items[k].name == "purple-haze_bud_wet" then 
                        BioPurpCount = Player.PlayerData.items[k].amount
    
                    elseif Player.PlayerData.items[k].name == "ak47_bud_wet" then 
                        BioAkCount = Player.PlayerData.items[k].amount
    
                    elseif Player.PlayerData.items[k].name == "amnesia_bud_wet" then 
                        BioAmCount = Player.PlayerData.items[k].amount
    
                    elseif Player.PlayerData.items[k].name == "white-widow_bud_wet" then 
                        BioWhiteCount = Player.PlayerData.items[k].amount

                    elseif Player.PlayerData.items[k].name == "thecarpfather_bud_wet" then 
                        BioCarpCount = Player.PlayerData.items[k].amount
                    else
                        TriggerClientEvent('QBCore:Notify', src, 'You have no wet buds.', 'error') 
                    end
                end
            end
        if SkunkCount ~= 0 then
            local amt = SkunkCount
            TimerMath = TimerMath+amt
            TriggerClientEvent('QBCore:Notify', src, 'You put '..SkunkCount..' Skunk buds on the dryer.', 'success')
            Player.Functions.RemoveItem('skunk_bud_wet', amt)
        end
        if BioKushCount ~=0 then
            local amt = BioKushCount
            TimerMath = TimerMath+amt
            TriggerClientEvent('QBCore:Notify', src, 'You put '..BioKushCount..' OG Kush buds on the dryer.', 'success')
            Player.Functions.RemoveItem('og-kush_bud_wet', amt)
        end
        if BioBlueCount ~=0 then
            local amt = BioBlueCount
            TimerMath = TimerMath+amt
            TriggerClientEvent('QBCore:Notify', src, 'You put '..BioBlueCount..' Blue Dream buds on the dryer.', 'success')
            Player.Functions.RemoveItem('bluedream_bud_wet', amt)
        end
        if BioPurpCount ~=0 then
            local amt = BioPurpCount
            TimerMath = TimerMath+amt
            TriggerClientEvent('QBCore:Notify', src, 'You put '..BioPurpCount..' Purple Haze buds on the dryer.', 'success')
            Player.Functions.RemoveItem('bluedream_bud_wet', amt)
        end
        if BioPurpCount ~=0 then
            local amt = BioPurpCount
            TimerMath = TimerMath+amt
            TriggerClientEvent('QBCore:Notify', src, 'You put '..BioPurpCount..' Purple Haze buds on the dryer.', 'success')
            Player.Functions.RemoveItem('purple-haze_bud_wet', amt)
        end
        if BioAkCount ~=0 then
            local amt = BioAkCount
            TimerMath = TimerMath+amt
            TriggerClientEvent('QBCore:Notify', src, 'You put '..BioAkCount..' AK47 buds on the dryer.', 'success')
            Player.Functions.RemoveItem('ak47_bud_wet', amt)
        end
        if BioAmCount ~=0 then
            local amt = BioAmCount
            TimerMath = TimerMath+amt
            TriggerClientEvent('QBCore:Notify', src, 'You put '..BioAmCount..' Amnesia buds on the dryer.', 'success')
            Player.Functions.RemoveItem('amnesia_bud_wet', amt)
        end
        if BioWhiteCount ~=0 then
            local amt = BioWhiteCount
            TimerMath = TimerMath+amt
            TriggerClientEvent('QBCore:Notify', src, 'You put '..BioWhiteCount..' White Widow buds on the dryer.', 'success')
            Player.Functions.RemoveItem('white-widow_bud_wet', amt)
        end
        if BioCarpCount ~=0 then
            local amt = BioCarpCount
            TimerMath = TimerMath+amt
            TriggerClientEvent('QBCore:Notify', src, 'You put '..BioCarpCount..' TheCarpFather buds on the dryer.', 'success')
            Player.Functions.RemoveItem('thecarpfather_bud_wet', amt)
        end
        if SkunkCount ~=0 or BioKushCount ~=0 or BioBlueCount ~=0 or BioPurpCount ~=0 or BioAkCount ~=0 or BioAmCount ~=0 or BioWhiteCount ~=0 or BioCarpCount ~=0 then
            TriggerClientEvent('ksuie_drybuds:client:startTimer', src, TimerMath)---DONT FORGET TO UPDATE WHEN DONE KSUIE
        end
    end
end)

RegisterNetEvent("ksuie_drybuds:server:giveBuds")
AddEventHandler("ksuie_drybuds:server:giveBuds", function(amt)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if SkunkCount > 0 then
        Player.Functions.AddItem('skunk_bud_dry', SkunkCount)
    end
    if BioKushCount > 0 then
        Player.Functions.AddItem('og-kush_bud_dry', BioKushCount)
    end
    if BioBlueCount > 0 then
        Player.Functions.AddItem('bluedream_bud_dry', BioBlueCount)
    end
    if BioPurpCount > 0 then
        Player.Functions.AddItem('purple-haze_bud_dry', BioPurpCount)
    end
    if BioAkCount > 0 then
        Player.Functions.AddItem('ak47_bud_dry', BioAkCount)
    end
    if BioAmCount > 0 then
        Player.Functions.AddItem('amnesia_bud_dry', BioAmCount)
    end
    if BioWhiteCount > 0 then
        Player.Functions.AddItem('white-widow_bud_dry', BioWhiteCount)
    end
    if BioCarpCount > 0 then
    Player.Functions.AddItem('thecarpfather_bud_dry', BioCarpCount)
    end
    SkunkCount = 0
    BioKushCount = 0
    BioBlueCount = 0
    BioPurpCount = 0
    BioAkCount = 0
    BioAmCount = 0
    BioWhiteCount = 0
    BioCarpCount = 0
end)

RegisterNetEvent("ksuie_drybuds:server:AssignDryer")
AddEventHandler("ksuie_drybuds:server:AssignDryer", function(PlayerDryer)
    AssignedDryer = PlayerDryer
end)

RegisterNetEvent("ksuie_drybuds:server:AssignDryerBuds")
AddEventHandler("ksuie_drybuds:server:AssignDryerBuds", function(PlayerDryer)
    if AssignedDryer == 1 then
        SK1 = SkunkCount
        KU1 = BioKushCount
        BL1 = BioBlueCount
        PU1 = BioPurpCount
        AK1 = BioAkCount
        AM1 = BioAmCount
        WW1 = BioWhiteCount
        CF1 = BioCarpCount
    elseif AssignedDryer == 2 then
        SK2 = SkunkCount
        KU2 = BioKushCount
        BL2 = BioBlueCount
        PU2 = BioPurpCount
        AK2 = BioAkCount
        AM2 = BioAmCount
        WW2 = BioWhiteCount
        CF2 = BioCarpCount
    elseif AssignedDryer == 3 then
        SK3 = SkunkCount
        KU3 = BioKushCount
        BL3 = BioBlueCount
        PU3 = BioPurpCount
        AK3 = BioAkCount
        AM3 = BioAmCount
        WW3 = BioWhiteCount
        CF3 = BioCarpCount
    elseif AssignedDryer == 4 then
        SK4= SkunkCount
        KU4 = BioKushCount
        BL4 = BioBlueCount
        PU4 = BioPurpCount
        AK4 = BioAkCount
        AM4 = BioAmCount
        WW4 = BioWhiteCount
        CF4 = BioCarpCount
    elseif AssignedDryer == 5 then
        SK5 = SkunkCount
        KU5 = BioKushCount
        BL5 = BioBlueCount
        PU5 = BioPurpCount
        AK5 = BioAkCount
        AM5 = BioAmCount
        WW5 = BioWhiteCount
        CF5 = BioCarpCount
    end
end)

RegisterNetEvent("ksuie_drybuds:server:GetDryerBuds")
AddEventHandler("ksuie_drybuds:server:GetDryerBuds", function(PlayerDryer)
    AssignedDryer = PlayerDryer
    if AssignedDryer == 1 then
        SkunkCount = SK1
        BioKushCount = KU1
        BioBlueCount = BL1
        BioPurpCount = PU1
        BioAkCount = AK1
        BioAmCount = AM1
        BioWhiteCount = WW1
        BioCarpCount = CF1
    elseif AssignedDryer == 2 then
        SkunkCount = SK2
        BioKushCount = KU2
        BioBlueCount = BL2
        BioPurpCount = PU2
        BioAkCount = AK2
        BioAmCount = AM2
        BioWhiteCount = WW2
        BioCarpCount = CF2
    elseif AssignedDryer == 3 then
        SkunkCount = SK3
        BioKushCount = KU3
        BioBlueCount = BL3
        BioPurpCount = PU3
        BioAkCount = AK3
        BioAmCount = AM3
        BioWhiteCount = WW3
        BioCarpCount = CF3
    elseif AssignedDryer == 4 then
        SkunkCount = SK4
        BioKushCount = KU4
        BioBlueCount = BL4
        BioPurpCount = PU4
        BioAkCount = AK4
        BioAmCount = AM4
        BioWhiteCount = WW4
        BioCarpCount = CF4
    elseif AssignedDryer == 5 then
        SkunkCount = SK5
        BioKushCount = KU5
        BioBlueCount = BL5
        BioPurpCount = PU5
        BioAkCount = AK5
        BioAmCount = AM5
        BioWhiteCount = WW5
        BioCarpCount = CF5
    end
end)

