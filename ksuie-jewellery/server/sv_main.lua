QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

QBCore.Functions.CreateCallback('ksuie-jewellery:server:checkpockets', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local Item = nil
    local NoCard = 0
    if Player.Functions.GetItemByName("security_card_01") == nil then
        Item.name = "none"
        Item.amount = 0
    else
        Item.name = "security_card_01"
        Item.amount = 1
    end
    cb(Item)
end)

local timeOut = false

local alarmTriggered = false

RegisterServerEvent('ksuie-jewellery:server:setVitrineState')
AddEventHandler('ksuie-jewellery:server:setVitrineState', function(stateType, state, k)
    Config.Locations[k][stateType] = state
    TriggerClientEvent('ksuie-jewellery:client:setVitrineState', -1, stateType, state, k)
end)

RegisterServerEvent('ksuie-jewellery:server:vitrineReward')
AddEventHandler('ksuie-jewellery:server:vitrineReward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local otherchance = math.random(1, 4)
    local odd = math.random(1, 4)

    if otherchance == odd then
        local item = math.random(1, #Config.VitrineRewards)
        local amount = math.random(Config.VitrineRewards[item]["amount"]["min"], Config.VitrineRewards[item]["amount"]["max"])
        if Player.Functions.AddItem(Config.VitrineRewards[item]["item"], amount) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.VitrineRewards[item]["item"]], 'add')
        else
            TriggerClientEvent('QBCore:Notify', src, 'You\'re ..', 'error')
        end
    else
        local amount = math.random(2, 4)
        if Player.Functions.AddItem("10kgoldchain", amount) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["10kgoldchain"], 'add')
        else
            TriggerClientEvent('QBCore:Notify', src, 'You are carrying to much..', 'error')
        end
    end
end)

RegisterServerEvent('ksuie-jewellery:server:setTimeout')
AddEventHandler('ksuie-jewellery:server:setTimeout', function()
    if not timeOut then
        timeOut = true
        TriggerEvent('qb-scoreboard:server:SetActivityBusy', "jewellery", true)
        Citizen.CreateThread(function()
            Citizen.Wait(Config.Timeout)

            for k, v in pairs(Config.Locations) do
                Config.Locations[k]["isOpened"] = false
                TriggerClientEvent('ksuie-jewellery:client:setVitrineState', -1, 'isOpened', false, k)
                TriggerClientEvent('ksuie-jewellery:client:setAlertState', -1, false)
                TriggerEvent('qb-scoreboard:server:SetActivityBusy', "jewellery", false)
            end
            timeOut = false
            TriggerServerEvent('nui_doorlock:updateState', 178, true)
            alarmTriggered = false
        end)
    end
end)

RegisterServerEvent('ksuie-jewellery:server:PoliceAlertMessage')
AddEventHandler('ksuie-jewellery:server:PoliceAlertMessage', function(title, coords, blip)
    local src = source
    local alertData = {
        title = title,
        coords = {x = coords.x, y = coords.y, z = coords.z},
        description = "Possible robbery going on at the Vangelico Jeweler<br>Available cameras: 31, 32, 33, 34",
    }

    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player ~= nil then 
            if (Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty) then
                if blip then
                    if not alarmTriggered then
                        TriggerClientEvent("qb-phone:client:addPoliceAlert", v, alertData)
                        TriggerClientEvent("ksuie-jewellery:client:PoliceAlertMessage", v, title, coords, blip)
                        alarmTriggered = true
                    end
                else
                    TriggerClientEvent("qb-phone:client:addPoliceAlert", v, alertData)
                    TriggerClientEvent("ksuie-jewellery:client:PoliceAlertMessage", v, title, coords, blip)
                end
            end
        end
    end
end)

QBCore.Functions.CreateCallback('ksuie-jewellery:server:getCops', function(source, cb)
	local amount = 0
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player ~= nil then 
            if (Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty) then
                amount = amount + 1
            end
        end
	end
	cb(amount)
end)

local job1 = nil
local joblevel = 0
local jobindexed = 0


RegisterServerEvent('ksuie-jewellery:server:changejob')
AddEventHandler('ksuie-jewellery:server:changejob', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if jobindexed == 0 then
        job1 = Player.PlayerData.job.name
        joblevel = Player.PlayerData.job.grade.level
        TriggerClientEvent('QBCore:Notify', source, "Job1 ="..job1..joblevel, "error")
        --QBCore.Functions.Notify("Job1 ="..job1)
        Player.Functions.SetJob("thief", 1)
        TriggerClientEvent('QBCore:Notify', source, "NewJob = Thief Newgrade = 1")
        --QBCore.Functions.Notify("NewJob = Thief Newgrade = 1")
        jobindexed = jobindexed+1
        TriggerClientEvent('QBCore:Notify', source, "JobIndex ="..jobindexed)

    end
end)


RegisterServerEvent('ksuie-jewellery:server:restorejob')
AddEventHandler('ksuie-jewellery:server:restorejob', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if jobindexed == 1 then
        Player.Functions.SetJob(job1, joblevel)
        TriggerClientEvent('QBCore:Notify', source, "JobRestored ="..job1..joblevel)
        --QBCore.Functions.Notify("JobRestored ="..job1)
        jobindexed = 0
        TriggerClientEvent('QBCore:Notify', source, "JobIndex ="..jobindexed)
    end

end)
