QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
local BudSkunkCount = 0
local BudKushCount = 0
local BudBlueCount = 0
local BudPurpCount = 0
local BudAkCount = 0
local BudAmCount = 0
local BudWhiteCount = 0
local BudCarpCount = 0

local BrickTimerMath = 0
local AssignedBricker = 0
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


--!!!!!!!!!!!BRICKS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!----------------------------
RegisterNetEvent("ksuie_brickpackager:server:checkDryInv")
AddEventHandler("ksuie_brickpackager:server:checkDryInv", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
        if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
            for k, v in pairs(Player.PlayerData.items) do 
                if Player.PlayerData.items[k] ~= nil then 
                    if Player.PlayerData.items[k].name == "skunk_bud_dry" then 
                        BudSkunkCount = Player.PlayerData.items[k].amount

                    elseif Player.PlayerData.items[k].name == "og-kush_bud_dry" then 
                        BudKushCount = Player.PlayerData.items[k].amount

                    elseif Player.PlayerData.items[k].name == "bluedream_bud_dry" then 
                        BudBlueCount = Player.PlayerData.items[k].amount

                    elseif Player.PlayerData.items[k].name == "purple-haze_bud_dry" then 
                        BudPurpCount = Player.PlayerData.items[k].amount

                    elseif Player.PlayerData.items[k].name == "ak47_bud_dry" then 
                        BudAkCount = Player.PlayerData.items[k].amount

                    elseif Player.PlayerData.items[k].name == "amnesia_bud_dry" then 
                        BudAmCount = Player.PlayerData.items[k].amount

                    elseif Player.PlayerData.items[k].name == "white-widow_bud_dry" then 
                        BudWhiteCount = Player.PlayerData.items[k].amount

                    elseif Player.PlayerData.items[k].name == "thecarpfather_bud_dry" then 
                        BudCarpCount = Player.PlayerData.items[k].amount

                    else
                        TriggerClientEvent('QBCore:Notify', src, 'You have no ingredients.', 'error') 
                    end
                end
            end
        if BudSkunkCount ~= 0 then
            local amt = math.floor(BudSkunkCount/50)*50
            BrickTimerMath = BrickTimerMath+amt
            TriggerClientEvent('QBCore:Notify', src, 'You put '..BudSkunkCount..' Skunk buds on the dryer.', 'success')
            Player.Functions.RemoveItem('skunk_bud_dry', amt)
        end
        if BudKushCount ~=0 then
            local amt = math.floor(BudKushCount/50)*50
            BrickTimerMath = BrickTimerMath+amt
            TriggerClientEvent('QBCore:Notify', src, 'You put '..BudKushCount..' OG Kush buds in the brick que.', 'success')
            Player.Functions.RemoveItem('og-kush_bud_dry', amt)
        end
        if BudBlueCount ~=0 then
            local amt = math.floor(BudBlueCount/50)*50
            BrickTimerMath = BrickTimerMath+amt
            TriggerClientEvent('QBCore:Notify', src, 'You put '..BudBlueCount..' Blue Dream buds in the brick que.', 'success')
            Player.Functions.RemoveItem('bluedream_bud_dry', amt)
        end
        if BudPurpCount ~=0 then
            local amt = math.floor(BudPurpCount/50)*50
            BrickTimerMath = BrickTimerMath+amt
            TriggerClientEvent('QBCore:Notify', src, 'You put '..BudPurpCount..' Purple Haze buds in the brick que.', 'success')
            Player.Functions.RemoveItem('purple-haze_bud_dry', amt)
        end
        if BudAkCount ~=0 then
            local amt = math.floor(BudAkCount/50)*50
            BrickTimerMath = BrickTimerMath+amt
            TriggerClientEvent('QBCore:Notify', src, 'You put '..BudAkCount..' AK47 buds in the brick que.', 'success')
            Player.Functions.RemoveItem('ak47_bud_dry', amt)
        end
        if BudAmCount ~=0 then
            local amt = math.floor(BudAmCount/50)*50
            BrickTimerMath = BrickTimerMath+amt
            TriggerClientEvent('QBCore:Notify', src, 'You put '..BudAmCount..' Amnesia buds in the brick que.', 'success')
            Player.Functions.RemoveItem('amnesia_bud_dry', amt)
        end
        if BudWhiteCount ~=0 then
            local amt = math.floor(BudWhiteCount/50)*50
            BrickTimerMath = BrickTimerMath+amt
            TriggerClientEvent('QBCore:Notify', src, 'You put '..BudWhiteCount..' White Widow buds in the brick que.', 'success')
            Player.Functions.RemoveItem('white-widow_bud_dry', amt)
        end
        if BudCarpCount ~=0 then
            local amt = math.floor(BudCarpCount/50)*50
            BrickTimerMath = BrickTimerMath+amt
            TriggerClientEvent('QBCore:Notify', src, 'You put '..BudCarpCount..' TheCarpFather buds in the brick que.', 'success')
            Player.Functions.RemoveItem('thecarpfather_bud_dry', amt)
        end
        if BudSkunkCount ~=0 or BudKushCount ~=0 or BudBlueCount ~=0 or BudPurpCount ~=0 or BudAkCount ~=0 or BudAmCount ~=0 or BudWhiteCount ~=0 or BudCarpCount ~=0 then
            TriggerClientEvent('ksuie_brickpackager:client:startBrickTimer', src, BrickTimerMath)---DONT FORGET TO UPDATE WHEN DONE KSUIE
        end

    end
end)

RegisterNetEvent("ksuie_brickpackager:server:giveBricks")
AddEventHandler("ksuie_brickpackager:server:giveBricks", function(amt)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if math.floor(BudSkunkCount/50) > 0 then
        Player.Functions.AddItem('skunk_brick', math.floor(BudSkunkCount/50))
    end
    if math.floor(BudKushCount/50) > 0 then
        Player.Functions.AddItem('og-kush_brick', math.floor(BudKushCount/50))
    end
    if math.floor(BudBlueCount/50) > 0 then
        Player.Functions.AddItem('bluedream_brick', math.floor(BudBlueCount/50))
    end
    if math.floor(BudPurpCount/50) > 0 then
        Player.Functions.AddItem('purple-haze_brick', math.floor(BudPurpCount/50))
    end
    if math.floor(BudAkCount/50) > 0 then
        Player.Functions.AddItem('ak47_brick', math.floor(BudAkCount/50))
    end
    if math.floor(BudAmCount/50) > 0 then
        Player.Functions.AddItem('amnesia_brick', math.floor(BudAmCount/50))
    end
    if math.floor(BudWhiteCount/50) > 0 then
        Player.Functions.AddItem('white-widow_brick', math.floor(BudWhiteCount/50))
    end
    if math.floor(BudCarpCount/50) > 0 then
        Player.Functions.AddItem('thecarpfather_brick', math.floor(BudCarpCount/50))
    end
    BudSkunkCount = 0
    BudKushCount = 0
    BudBlueCount = 0
    BudAmCount = 0
    BudAkCount = 0
    BudAmCount = 0
    BudWhiteCount = 0
    BudCarpCount = 0
end)

RegisterNetEvent("ksuie_drybuds:server:AssignBricker")
AddEventHandler("ksuie_drybuds:server:AssignBricker", function(PlayerBricker)
    AssignedBricker = PlayerBricker
end)

RegisterNetEvent("ksuie_drybuds:server:AssignBrickerBricks")
AddEventHandler("ksuie_drybuds:server:AssignBrickerBricks", function(PlayerBricker)
    if AssignedBricker == 1 then
        SK1 = BudSkunkCount
        KU1 = BudKushCount
        BL1 = BudBlueCount
        PU1 = BudPurpCount
        AK1 = BudAkCount
        AM1 = BudAmCount
        WW1 = BudWhiteCount
        CF1 = BudCarpCount
    elseif AssignedBricker == 2 then
        SK2 = BudSkunkCount
        KU2 = BudKushCount
        BL2 = BudBlueCount
        PU2 = BudPurpCount
        AK2 = BudAkCount
        AM2 = BudAmCount
        WW2 = BudWhiteCount
        CF2 = BudCarpCount
    elseif AssignedBricker == 3 then
        SK3 = BudSkunkCount
        KU3 = BudKushCount
        BL3 = BudBlueCount
        PU3 = BudPurpCount
        AK3 = BudAkCount
        AM3 = BudAmCount
        WW3 = BudWhiteCount
        CF3 = BudCarpCount
    elseif AssignedBricker == 4 then
        SK4 = BudSkunkCount
        KU4 = BudKushCount
        BL4 = BudBlueCount
        PU4 = BudPurpCount
        AK4 = BudAkCount
        AM4 = BudAmCount
        WW4 = BudWhiteCount
        CF4 = BudCarpCount
    end
end)

RegisterNetEvent("ksuie_drybuds:server:GetBrickerBricks")
AddEventHandler("ksuie_drybuds:server:GetBrickerBricks", function(PlayerBricker)
    AssignedBricker = PlayerBricker
    if AssignedBricker == 1 then
        BudSkunkCount = SK1
        BudKushCount = KU1
        BudBlueCount = BL1
        BudPurpCount = PU1
        BudAkCount = AK1
        BudAmCount = AM1
        BudWhiteCount = WW1
        BudCarpCount = CF1
    elseif AssignedBricker == 2 then
        BudSkunkCount = SK2
        BudKushCount = KU2
        BudBlueCount = BL2
        BudPurpCount = PU2
        BudAkCount = AK2
        BudAmCount = AM2
        BudWhiteCount = WW2
        BudCarpCount = CF2
    elseif AssignedBricker == 3 then
        BudSkunkCount = SK3
        BudKushCount = KU3
        BudBlueCount = BL3
        BudPurpCount = PU3
        BudAkCount = AK3
        BudAmCount = AM3
        BudWhiteCount = WW3
        BudCarpCount = CF3
    elseif AssignedBricker == 4 then
        BudSkunkCount = SK4
        BudKushCount = KU4
        BudBlueCount = BL4
        BudPurpCount = PU4
        BudAkCount = AK4
        BudAmCount = AM4
        BudWhiteCount = WW4
        BudCarpCount = CF4
    end
end)

