QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
local TimerMath = 0

RegisterNetEvent("ksuie_harvest:server:settimer")
AddEventHandler("ksuie_harvest:server:settimer", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
            TimerMath = 3600
            TriggerClientEvent('ksuie_harvest:client:startTimer', src, TimerMath)---DONT FORGET TO UPDATE WHEN DONE KSUIE
end)

RegisterNetEvent("ksuie_harvest:server:harvestMG")
AddEventHandler("ksuie_harvest:server:harvestMG", function(amt)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    amt = math.random(10,40)
        Player.Functions.AddItem('morningglory', amt)
end)
