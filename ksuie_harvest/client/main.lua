QBCore = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if QBCore == nil then
            TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
            Citizen.Wait(200)
        end
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    onDuty = true
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = true
end)

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
  end

local harvesting = false
local harvested1 = false
local harvested2 = false
local harvested3 = false
local harvested4 = false
local harvested5 = false
local harvested6 = false
local harvested7 = false
local harvested8 = false
local harvested9 = false
local harvested10 = false

local timer1 = 0
local timer2 = 0
local timer3 = 0
local timer4 = 0
local timer5 = 0
local timer6 = 0
local timer7 = 0
local timer8 = 0
local timer9 = 0
local timer10 = 0

local collect = false
local harvester = 0
local locHarv = 0

Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(1)
		local inRange = false
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
		local distance1 = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pOne.x, harvestLocations.pOne.y, harvestLocations.pOne.z, true)
		local distance2 = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pTwo.x, harvestLocations.pTwo.y, harvestLocations.pTwo.z, true)
		local distance3 = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pThree.x, harvestLocations.pThree.y, harvestLocations.pThree.z, true)
		local distance4 = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pFour.x, harvestLocations.pFour.y, harvestLocations.pFour.z, true)
		local distance5 = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pFive.x, harvestLocations.pFive.y, harvestLocations.pFive.z, true)
        local distance6 = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pSix.x, harvestLocations.pSix.y, harvestLocations.pSix.z, true)
		local distance7 = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pSeven.x, harvestLocations.pSeven.y, harvestLocations.pSeven.z, true)
		local distance8 = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pEight.x, harvestLocations.pEight.y, harvestLocations.pEight.z, true)
		local distance9 = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pNine.x, harvestLocations.pNine.y, harvestLocations.pNine.z, true)
		local distance10 = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pTen.x, harvestLocations.pTen.y, harvestLocations.pTen.z, true)


        if harvested1 and distance1 < 0.5 and Config.ShowTimer then
            inRange = true
            DrawText3D(harvestLocations.pOne.x, harvestLocations.pOne.y, harvestLocations.pOne.z, "Let them grow: " .. timer1 .. ' seconds.')      
        end
        if harvested2 and distance2 < 0.5 and Config.ShowTimer then
            inRange = true
            DrawText3D(harvestLocations.pTwo.x, harvestLocations.pTwo.y, harvestLocations.pTwo.z, "Let them grow: " .. timer2 .. ' seconds.')      
        end
        if harvested3 and distance3 < 0.5 and Config.ShowTimer then
            inRange = true
            DrawText3D(harvestLocations.pThree.x, harvestLocations.pThree.y, harvestLocations.pThree.z, "Let them grow: " .. timer3 .. ' seconds.')      
        end
        if harvested4 and distance4 < 0.5 and Config.ShowTimer then
            inRange = true
            DrawText3D(harvestLocations.pFour.x, harvestLocations.pFour.y, harvestLocations.pFour.z, "Let them grow: " .. timer4 .. ' seconds.')      
        end
        if harvested5 and distance5 < 0.5 and Config.ShowTimer then
            inRange = true
            DrawText3D(harvestLocations.pFive.x, harvestLocations.pFive.y, harvestLocations.pFive.z, "Let them grow: " .. timer5 .. ' seconds.')      
        end
        if harvested6 and distance6 < 0.5 and Config.ShowTimer then
            inRange = true
            DrawText3D(harvestLocations.pSix.x, harvestLocations.pSix.y, harvestLocations.pSix.z, "Let them grow: " .. timer6 .. ' seconds.')      
        end
        if harvested7 and distance7 < 0.5 and Config.ShowTimer then
            inRange = true
            DrawText3D(harvestLocations.pSeven.x, harvestLocations.pSeven.y, harvestLocations.pSeven.z, "Let them grow: " .. timer7 .. ' seconds.')      
        end
        if harvested8 and distance8 < 0.5 and Config.ShowTimer then
            inRange = true
            DrawText3D(harvestLocations.pEight.x, harvestLocations.pEight.y, harvestLocations.pEight.z, "Let them grow: " .. timer8 .. ' seconds.')      
        end
        if harvested9 and distance9 < 0.5 and Config.ShowTimer then
            inRange = true
            DrawText3D(harvestLocations.pNine.x, harvestLocations.pNine.y, harvestLocations.pNine.z, "Let them grow: " .. timer9 .. ' seconds.')      
        end
        if harvested10 and distance10 < 0.5 and Config.ShowTimer then
            inRange = true
            DrawText3D(harvestLocations.pTen.x, harvestLocations.pTen.y, harvestLocations.pTen.z, "Let them grow: " .. timer10 .. ' seconds.')      
        end

        if not inRange then
            Wait(1500)
        end
    end
end)

Citizen.CreateThread(function(amt)
	while true do 
		Citizen.Wait(1)
		local inRange = false
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pOne.x, harvestLocations.pOne.y, harvestLocations.pOne.z, true)  < 3 then
            inRange = true
            DrawMarker(markerConfig.markerType, harvestLocations.pOne.x, harvestLocations.pOne.y, harvestLocations.pOne.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pOne.x, harvestLocations.pOne.y, harvestLocations.pOne.z, true) < 2.5 then
                harvester = 1

                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pOne.x, harvestLocations.pOne.y, harvestLocations.pOne.z, true) < 0.5 then      
                    if not harvested1 then     
                        DrawText3D(harvestLocations.pOne.x, harvestLocations.pOne.y, harvestLocations.pOne.z, "~g~E~w~ - Harvest")
                        if IsControlJustReleased(1, Keys['E']) then
                            DryAnimation()
                            QBCore.Functions.Progressbar("buds_dry", "Picking Flowers...", math.random(5000, 10000), false, true, {
                                disableMovement = false,
                                disableCarMovement = false,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mp_car_bomb",
                                anim = "car_bomb_mechanic",
                                flags = 16,
                            }, {}, {}, function() -- Done
                                harvesting = true
                                TriggerServerEvent('ksuie_harvest:server:harvestMG', amt)
                                TriggerServerEvent('ksuie_harvest:server:settimer', amt)

                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                            end, function()
                                QBCore.Functions.Notify("Canceled..", "error")
                            end)                        
                        end   
                    end
                end
            end
        end
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pTwo.x, harvestLocations.pTwo.y, harvestLocations.pTwo.z, true)  < 3 then
            inRange = true
            DrawMarker(markerConfig.markerType, harvestLocations.pTwo.x, harvestLocations.pTwo.y, harvestLocations.pTwo.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pTwo.x, harvestLocations.pTwo.y, harvestLocations.pTwo.z, true) < 2.5 then
                harvester = 2

                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pTwo.x, harvestLocations.pTwo.y, harvestLocations.pTwo.z, true) < 0.5 then      
                    if not harvested2 then  
                        DrawText3D(harvestLocations.pTwo.x, harvestLocations.pTwo.y, harvestLocations.pTwo.z, "~g~E~w~ - Harvest")
                        if IsControlJustReleased(1, Keys['E']) then
                            DryAnimation()
                            QBCore.Functions.Progressbar("buds_dry", "Picking Flowers...", math.random(5000, 10000), false, true, {
                                disableMovement = false,
                                disableCarMovement = false,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mp_car_bomb",
                                anim = "car_bomb_mechanic",
                                flags = 16,
                            }, {}, {}, function() -- Done
                                harvesting = true
                                TriggerServerEvent('ksuie_harvest:server:harvestMG', amt)
                                TriggerServerEvent('ksuie_harvest:server:settimer', amt)
                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                            end, function()
                                QBCore.Functions.Notify("Canceled..", "error")
                            end)                        
                        end   
                    end
                end
            end
        end
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pThree.x, harvestLocations.pThree.y, harvestLocations.pThree.z, true)  < 3 then
            inRange = true
            DrawMarker(markerConfig.markerType, harvestLocations.pThree.x, harvestLocations.pThree.y, harvestLocations.pThree.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pThree.x, harvestLocations.pThree.y, harvestLocations.pThree.z, true) < 2.5 then
                harvester = 3

                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pThree.x, harvestLocations.pThree.y, harvestLocations.pThree.z, true) < 0.5 then      
                    if not harvested3 then     
                        DrawText3D(harvestLocations.pThree.x, harvestLocations.pThree.y, harvestLocations.pThree.z, "~g~E~w~ - Harvest")
                        if IsControlJustReleased(1, Keys['E']) then
                            DryAnimation()
                            QBCore.Functions.Progressbar("buds_dry", "Picking Flowers...", math.random(5000, 10000), false, true, {
                                disableMovement = false,
                                disableCarMovement = false,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mp_car_bomb",
                                anim = "car_bomb_mechanic",
                                flags = 16,
                            }, {}, {}, function() -- Done
                                harvesting = true
                                TriggerServerEvent('ksuie_harvest:server:settimer', amt)
                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                            end, function()
                                QBCore.Functions.Notify("Canceled..", "error")
                            end)                        
                        end   
                    end
                end
            end
        end
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pFour.x, harvestLocations.pFour.y, harvestLocations.pFour.z, true)  < 3 then
            inRange = true
            DrawMarker(markerConfig.markerType, harvestLocations.pFour.x, harvestLocations.pFour.y, harvestLocations.pFour.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pFour.x, harvestLocations.pFour.y, harvestLocations.pFour.z, true) < 2.5 then
                harvester = 4

                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pFour.x, harvestLocations.pFour.y, harvestLocations.pFour.z, true) < 0.5 then      
                    if not harvested4 then    
                        DrawText3D(harvestLocations.pFour.x, harvestLocations.pFour.y, harvestLocations.pFour.z, "~g~E~w~ - Harvest")
                        if IsControlJustReleased(1, Keys['E']) then
                            DryAnimation()
                            QBCore.Functions.Progressbar("buds_dry", "Picking Flowers...", math.random(5000, 10000), false, true, {
                                disableMovement = false,
                                disableCarMovement = false,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mp_car_bomb",
                                anim = "car_bomb_mechanic",
                                flags = 16,
                            }, {}, {}, function() -- Done
                                harvesting = true
                                TriggerServerEvent('ksuie_harvest:server:harvestMG', amt)
                                TriggerServerEvent('ksuie_harvest:server:settimer', amt)
                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                            end, function()
                                QBCore.Functions.Notify("Canceled..", "error")
                            end)                        
                        end   
                    end
                end
            end
        end
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pFive.x, harvestLocations.pFive.y, harvestLocations.pFive.z, true)  < 3 then
            inRange = true
            DrawMarker(markerConfig.markerType, harvestLocations.pFive.x, harvestLocations.pFive.y, harvestLocations.pFive.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pFive.x, harvestLocations.pFive.y, harvestLocations.pFive.z, true) < 2.5 then
                harvester = 5

                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pFive.x, harvestLocations.pFive.y, harvestLocations.pFive.z, true) < 0.5 then      
                    if not harvested5 then
                        DrawText3D(harvestLocations.pFive.x, harvestLocations.pFive.y, harvestLocations.pFive.z, "~g~E~w~ - Harvest")
                        if IsControlJustReleased(1, Keys['E']) then
                            DryAnimation()
                            QBCore.Functions.Progressbar("buds_dry", "Picking Flowers...", math.random(5000, 10000), false, true, {
                                disableMovement = false,
                                disableCarMovement = false,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mp_car_bomb",
                                anim = "car_bomb_mechanic",
                                flags = 16,
                            }, {}, {}, function() -- Done
                                harvesting = true
                                TriggerServerEvent('ksuie_harvest:server:harvestMG', amt)
                                TriggerServerEvent('ksuie_harvest:server:settimer', amt)
                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                            end, function()
                                QBCore.Functions.Notify("Canceled..", "error")
                            end)                        
                        end   
                    end
                end
            end
        end
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pSix.x, harvestLocations.pSix.y, harvestLocations.pSix.z, true)  < 3 then
            inRange = true
            DrawMarker(markerConfig.markerType, harvestLocations.pSix.x, harvestLocations.pSix.y, harvestLocations.pSix.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pSix.x, harvestLocations.pSix.y, harvestLocations.pSix.z, true) < 2.5 then
                harvester = 6

                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pSix.x, harvestLocations.pSix.y, harvestLocations.pSix.z, true) < 0.5 then      
                    if not harvested6 then
                        DrawText3D(harvestLocations.pSix.x, harvestLocations.pSix.y, harvestLocations.pSix.z, "~g~E~w~ - Harvest")
                        if IsControlJustReleased(1, Keys['E']) then
                            DryAnimation()
                            QBCore.Functions.Progressbar("buds_dry", "Picking Flowers...", math.random(5000, 10000), false, true, {
                                disableMovement = false,
                                disableCarMovement = false,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mp_car_bomb",
                                anim = "car_bomb_mechanic",
                                flags = 16,
                            }, {}, {}, function() -- Done
                                harvesting = true
                                TriggerServerEvent('ksuie_harvest:server:harvestMG', amt)
                                TriggerServerEvent('ksuie_harvest:server:settimer', amt)
                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                            end, function()
                                QBCore.Functions.Notify("Canceled..", "error")
                            end)                        
                        end   
                    end
                end
            end
        end
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pSeven.x, harvestLocations.pSeven.y, harvestLocations.pSeven.z, true)  < 3 then
            inRange = true
            DrawMarker(markerConfig.markerType, harvestLocations.pSeven.x, harvestLocations.pSeven.y, harvestLocations.pSeven.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pSeven.x, harvestLocations.pSeven.y, harvestLocations.pSeven.z, true) < 2.5 then
                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pSeven.x, harvestLocations.pSeven.y, harvestLocations.pSeven.z, true) < 0.5 then
                    harvester = 7
    
                    if not harvested7 then
                        DrawText3D(harvestLocations.pSeven.x, harvestLocations.pSeven.y, harvestLocations.pSeven.z, "~g~E~w~ - Harvest")
                        if IsControlJustReleased(1, Keys['E']) then
                            DryAnimation()
                            QBCore.Functions.Progressbar("buds_dry", "Picking Flowers...", math.random(5000, 10000), false, true, {
                                disableMovement = false,
                                disableCarMovement = false,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mp_car_bomb",
                                anim = "car_bomb_mechanic",
                                flags = 16,
                            }, {}, {}, function() -- Done
                                harvesting = true
                                TriggerServerEvent('ksuie_harvest:server:harvestMG', amt)
                                TriggerServerEvent('ksuie_harvest:server:settimer', amt)
                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                            end, function()
                                QBCore.Functions.Notify("Canceled..", "error")
                            end)                        
                        end   
                    end
                end
            end
        end
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pEight.x, harvestLocations.pEight.y, harvestLocations.pEight.z, true)  < 3 then
            inRange = true
            DrawMarker(markerConfig.markerType, harvestLocations.pEight.x, harvestLocations.pEight.y, harvestLocations.pEight.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pEight.x, harvestLocations.pEight.y, harvestLocations.pEight.z, true) < 2.5 then
                harvester = 8

                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pEight.x, harvestLocations.pEight.y, harvestLocations.pEight.z, true) < 0.5 then      
                    if not harvested8 then  
                        DrawText3D(harvestLocations.pEight.x, harvestLocations.pEight.y, harvestLocations.pEight.z, "~g~E~w~ - Harvest")
                        if IsControlJustReleased(1, Keys['E']) then
                            DryAnimation()
                            QBCore.Functions.Progressbar("buds_dry", "Picking Flowers...", math.random(5000, 10000), false, true, {
                                disableMovement = false,
                                disableCarMovement = false,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mp_car_bomb",
                                anim = "car_bomb_mechanic",
                                flags = 16,
                            }, {}, {}, function() -- Done
                                harvesting = true
                                TriggerServerEvent('ksuie_harvest:server:harvestMG', amt)
                                TriggerServerEvent('ksuie_harvest:server:settimer', amt)
                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                            end, function()
                                QBCore.Functions.Notify("Canceled..", "error")
                            end)                        
                        end   
                    end
                end
            end
        end
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pNine.x, harvestLocations.pNine.y, harvestLocations.pNine.z, true)  < 3 then
            inRange = true
            DrawMarker(markerConfig.markerType, harvestLocations.pNine.x, harvestLocations.pNine.y, harvestLocations.pNine.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pNine.x, harvestLocations.pNine.y, harvestLocations.pNine.z, true) < 2.5 then
                harvester = 9
                
                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pNine.x, harvestLocations.pNine.y, harvestLocations.pNine.z, true) < 0.5 then      
                    if not harvested9 then  
                        DrawText3D(harvestLocations.pNine.x, harvestLocations.pNine.y, harvestLocations.pNine.z, "~g~E~w~ - Harvest")
                        if IsControlJustReleased(1, Keys['E']) then
                            DryAnimation()
                            QBCore.Functions.Progressbar("buds_dry", "Picking Flowers...", math.random(5000, 10000), false, true, {
                                disableMovement = false,
                                disableCarMovement = false,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mp_car_bomb",
                                anim = "car_bomb_mechanic",
                                flags = 16,
                            }, {}, {}, function() -- Done
                                harvesting = true
                                TriggerServerEvent('ksuie_harvest:server:harvestMG', amt)
                                TriggerServerEvent('ksuie_harvest:server:settimer', amt)
                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                            end, function()
                                QBCore.Functions.Notify("Canceled..", "error")
                            end)                        
                        end   
                    end
                end
            end
        end
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pTen.x, harvestLocations.pTen.y, harvestLocations.pTen.z, true)  < 3 then
            inRange = true
            DrawMarker(markerConfig.markerType, harvestLocations.pTen.x, harvestLocations.pTen.y, harvestLocations.pTen.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pTen.x, harvestLocations.pTen.y, harvestLocations.pTen.z, true) < 2.5 then
                harvester = 10

                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, harvestLocations.pTen.x, harvestLocations.pTen.y, harvestLocations.pTen.z, true) < 0.5 then      
                    if not harvested10 then   
                        DrawText3D(harvestLocations.pTen.x, harvestLocations.pTen.y, harvestLocations.pTen.z, "~g~E~w~ - Harvest")
                        if IsControlJustReleased(1, Keys['E']) then
                            DryAnimation()
                            QBCore.Functions.Progressbar("buds_dry", "Picking Flowers...", math.random(5000, 10000), false, true, {
                                disableMovement = false,
                                disableCarMovement = false,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mp_car_bomb",
                                anim = "car_bomb_mechanic",
                                flags = 16,
                            }, {}, {}, function() -- Done
                                harvesting = true
                                TriggerServerEvent('ksuie_harvest:server:harvestMG', amt)
                                TriggerServerEvent('ksuie_harvest:server:settimer', amt)
--                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                            end, function()
                                QBCore.Functions.Notify("Canceled..", "error")
                            end)                        
                        end   
                    end
                end
            end
        end


        if not inRange then
            Wait(1500)
        end
    end 
end)

RegisterNetEvent('ksuie_harvest:client:dryTimer')
AddEventHandler('ksuie_harvest:client:dryTimer', function()
    Citizen.Wait(0)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local inRange = false
    notify("loop1")


    if harvester == 1 then
        notify("loop2")
        while harvested1 do

            dryCoordX = harvestLocations.pOne.x
            dryCoordY = harvestLocations.pOne.y
            dryCoordZ = harvestLocations.pOne.z
        Citizen.Wait(0)      
        end
    end
    if harvester == 2 then
        notify("loop2")

        while harvested2 do

            dryCoordX = harvestLocations.pTwo.x
            dryCoordY = harvestLocations.pTwo.y
            dryCoordZ = harvestLocations.pTwo.z
        Citizen.Wait(0)      
        end
    end
    if harvester == 3 then
        notify("loop2")

        while harvested3 do

            dryCoordX = harvestLocations.pThree.x
            dryCoordY = harvestLocations.pThree.y
            dryCoordZ = harvestLocations.pThree.z
        Citizen.Wait(0)      
        end
    end
    if harvester == 4 then
        notify("loop2")

        while harvested4 do

            dryCoordX = harvestLocations.pFour.x
            dryCoordY = harvestLocations.pFour.y
            dryCoordZ = harvestLocations.pFour.z
        Citizen.Wait(0)      
        end
    end
    if harvester == 5 then
        notify("loop2")

        while harvested5 do

            dryCoordX = harvestLocations.pFive.x
            dryCoordY = harvestLocations.pFive.y
            dryCoordZ = harvestLocations.pFive.z
        Citizen.Wait(0)      
        end
    end
    if harvester == 6 then
        notify("loop2")

        while harvested6 do

            dryCoordX = harvestLocations.pSix.x
            dryCoordY = harvestLocations.pSix.y
            dryCoordZ = harvestLocations.pSix.z
        Citizen.Wait(0)      
        end
    end
    if harvester == 7 then
        notify("loop2")

        while harvested7 do

            dryCoordX = harvestLocations.pSeven.x
            dryCoordY = harvestLocations.pSeven.y
            dryCoordZ = harvestLocations.pSeven.z
        Citizen.Wait(0)      
        end
    end
    if harvester == 8 then
        notify("loop2")

        while harvested8 do

            dryCoordX = harvestLocations.pEight.x
            dryCoordY = harvestLocations.pEight.y
            dryCoordZ = harvestLocations.pEight.z
        Citizen.Wait(0)      
        end
    end
    if harvester == 9 then
        notify("loop2")

        while harvested9 do

            dryCoordX = harvestLocations.pNine.x
            dryCoordY = harvestLocations.pNine.y
            dryCoordZ = harvestLocations.pNine.z
        Citizen.Wait(0)      
        end
    end
    if harvester == 10 then
        notify("loop2")

        while harvested10 do

            dryCoordX = harvestLocations.pTen.x
            dryCoordY = harvestLocations.pTen.y
            dryCoordZ = harvestLocations.pTen.z
        Citizen.Wait(0)      
        end
    end
end)


RegisterNetEvent('ksuie_harvest:client:startTimer')
AddEventHandler('ksuie_harvest:client:startTimer', function(TimerMath)

    timer = TimerMath
    TriggerEvent('ksuie_harvest:client:dryTimer')
    if harvester ==1 then
        notify("loop3")

        harvested1 = true
        timer1 = timer
        while harvested1 do
            timer1 = timer1 - 1
            if timer1 <= 0 then
                harvested1 = false
            end
            Citizen.Wait(1000)
        end
    elseif harvester ==2 then
        notify("loop3")

        harvested2 = true
        timer2 = timer
       while harvested2 do
            timer2 = timer2 - 1
            if timer2 <= 0 then
                harvested2 = false
            end
            Citizen.Wait(1000)
        end
    elseif harvester ==3 then
        notify("loop3")

        harvested3 = true
        timer3 = timer
        while harvested3 do
            timer3 = timer3 - 1
            if timer3 <= 0 then
                harvested3 = false
            end
            Citizen.Wait(1000)
        end
    elseif harvester ==4 then
        notify("loop3")

        harvested4 = true
        timer4 = timer
        while harvested4 do
            timer4 = timer4 - 1
            if timer4 <= 0 then
                harvested4 = false
            end
            Citizen.Wait(1000)
        end
    elseif harvester ==5 then
        notify("loop3")

        harvested5 = true
        timer5 = timer
        while harvested5 do
            timer5 = timer5 - 1
            if timer5 <= 0 then
                harvested5 = false
            end
            Citizen.Wait(1000)
        end
    elseif harvester ==6 then
        notify("loop3")

        harvested6 = true
        timer6 = timer
        while harvested6 do
            timer6 = timer6 - 1
            if timer6 <= 0 then
                harvested6 = false
            end
            Citizen.Wait(1000)
        end
    elseif harvester ==7 then
        notify("loop3")

        harvested7 = true
        timer7 = timer
        while harvested7 do
            timer7 = timer7 - 1
            if timer7 <= 0 then
                harvested7 = false
            end
            Citizen.Wait(1000)
        end
    elseif harvester ==8 then
        notify("loop3")

        harvested8 = true
        timer8 = timer
        while harvested8 do
            timer8 = timer8 - 1
            if timer8 <= 0 then
                harvested8 = false
            end
            Citizen.Wait(1000)
        end
    elseif harvester ==9 then
        notify("loop3")

        harvested9 = true
        timer9 = timer
        while harvested9 do
            timer9 = timer9 - 1
            if timer9 <= 0 then
                harvested9 = false
            end
            Citizen.Wait(1000)
        end
    elseif harvester ==10 then
        notify("loop3")

        harvested10 = true
        timer10 = timer
        while harvested10 do
            timer10 = timer10 - 1
            if timer10 <= 0 then
                harvested10 = false
            end
            Citizen.Wait(1000)
        end
    end  
end)

function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end
local lp1 = 1
function DryAnimation()
    loadAnimDict("mp_car_bomb")
    TaskPlayAnim(GetPlayerPed(-1), "mp_car_bomb", "car_bomb_mechanic" ,3.0, 3.0, -1, 16, 0, false, false, false)
    Citizen.CreateThread(function()
        while harvesting do
            notify("HarvLoop1")
            TaskPlayAnim(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 3.0, 3.0, -1, 16, 0, 0, 0, 0)
            Citizen.Wait(3000)
            StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
            lp1 = lp1+1
            if lp1 > 2 then
                lp1 = 0
                harvesting = false
                break
            end
        end
    end)
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

