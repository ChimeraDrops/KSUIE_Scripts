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

local drying = false
local timer = 0
local collect = false
local dryer = 0
local amount1 = 0
local amount2 = 0
local amount3 = 0
local amount4 = 0
local amount5 = 0
local PlayerDryer = 0

Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(1)
		local inRange = false
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
		local distance1 = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dryLocations.pOne.x, dryLocations.pOne.y, dryLocations.pOne.z, true)
		local distance2 = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dryLocations.pTwo.x, dryLocations.pTwo.y, dryLocations.pTwo.z, true)
		local distance3 = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dryLocations.pThree.x, dryLocations.pThree.y, dryLocations.pThree.z, true)
		local distance4 = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dryLocations.pFour.x, dryLocations.pFour.y, dryLocations.pFour.z, true)
		local distance5 = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dryLocations.pFive.x, dryLocations.pFive.y, dryLocations.pFive.z, true)

        if drying and distance1 < 5.0 and Config.ShowTimer then
            inRange = true
            DrawText3D(dryLocations.pOne.x, dryLocations.pOne.y, dryLocations.pOne.z, "Time left on dryer: " .. timer .. ' seconds.')      
        end
        if drying and distance2 < 5.0 and Config.ShowTimer then
            inRange = true
            DrawText3D(dryLocations.pTwo.x, dryLocations.pTwo.y, dryLocations.pTwo.z, "Time left on dryer: " .. timer .. ' seconds.')      
        end
        if drying and distance3 < 5.0 and Config.ShowTimer then
            inRange = true
            DrawText3D(dryLocations.pThree.x, dryLocations.pThree.y, dryLocations.pThree.z, "Time left on dryer: " .. timer .. ' seconds.')      
        end
        if drying and distance4 < 5.0 and Config.ShowTimer then
            inRange = true
            DrawText3D(dryLocations.pFour.x, dryLocations.pFour.y, dryLocations.pFour.z, "Time left on dryer: " .. timer .. ' seconds.')      
        end
        if drying and distance5 < 5.0 and Config.ShowTimer then
            inRange = true
            DrawText3D(dryLocations.pFive.x, dryLocations.pFive.y, dryLocations.pFive.z, "Time left on dryer: " .. timer .. ' seconds.')      
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

        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dryLocations.pOne.x, dryLocations.pOne.y, dryLocations.pOne.z, true) < 10.5 then
            inRange = true
            DrawMarker(markerConfig.markerType, dryLocations.pOne.x, dryLocations.pOne.y, dryLocations.pOne.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dryLocations.pOne.x, dryLocations.pOne.y, dryLocations.pOne.z, true) < 0.5 then
                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dryLocations.pOne.x, dryLocations.pOne.y, dryLocations.pOne.z, true) < 0.5 then      
                    if not drying and not collect then      
                        DrawText3D(dryLocations.pOne.x, dryLocations.pOne.y, dryLocations.pOne.z, "~g~E~w~ - Start dryer")
                        if IsControlJustReleased(1, Keys['E']) then
                            DryAnimation()
                            QBCore.Functions.Progressbar("buds_dry", "Putting buds on the dryer...", math.random(5000, 10000), false, true, {
                                disableMovement = false,
                                disableCarMovement = false,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mp_car_bomb",
                                anim = "car_bomb_mechanic",
                                flags = 16,
                            }, {}, {}, function() -- Done
                                TriggerServerEvent('ksuie_drybuds:server:checkInv', amt)
                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                                dryer = 1
                                amount1 = amt
                                PlayerDryer = dryer
                                TriggerServerEvent("ksuie_drybuds:server:AssignDryer", PlayerDryer)
                                TriggerServerEvent("ksuie_drybuds:server:AssignDryerBuds", PlayerDryer)
                            end, function()
                                QBCore.Functions.Notify("Canceled..", "error")
                            end)                        
                        end   
                    end
                end
            end
        end
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dryLocations.pTwo.x, dryLocations.pTwo.y, dryLocations.pTwo.z, true) < 10.5 then
            inRange = true
            DrawMarker(markerConfig.markerType, dryLocations.pTwo.x, dryLocations.pTwo.y, dryLocations.pTwo.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dryLocations.pTwo.x, dryLocations.pTwo.y, dryLocations.pTwo.z, true) < 0.5 then
                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dryLocations.pTwo.x, dryLocations.pTwo.y, dryLocations.pTwo.z, true) < 0.5 then      
                    if not drying and not collect then      
                        DrawText3D(dryLocations.pTwo.x, dryLocations.pTwo.y, dryLocations.pTwo.z, "~g~E~w~ - Start dryer")
                        if IsControlJustReleased(1, Keys['E']) then
                            DryAnimation()
                            QBCore.Functions.Progressbar("buds_dry", "Putting buds on the dryer...", math.random(5000, 10000), false, true, {
                                disableMovement = false,
                                disableCarMovement = false,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mp_car_bomb",
                                anim = "car_bomb_mechanic",
                                flags = 16,
                            }, {}, {}, function() -- Done
                                TriggerServerEvent('ksuie_drybuds:server:checkInv', amt)
                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                                dryer = 2
                                amount2 = amt
                                PlayerDryer = dryer
                                TriggerServerEvent("ksuie_drybuds:server:AssignDryer", PlayerDryer)
                                TriggerServerEvent("ksuie_drybuds:server:AssignDryerBuds", PlayerDryer)
                            end, function()
                                QBCore.Functions.Notify("Canceled..", "error")
                            end)                        
                        end   
                    end
                end
            end
        end
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dryLocations.pThree.x, dryLocations.pThree.y, dryLocations.pThree.z, true) < 10.5 then
            inRange = true
            DrawMarker(markerConfig.markerType, dryLocations.pThree.x, dryLocations.pThree.y, dryLocations.pThree.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dryLocations.pThree.x, dryLocations.pThree.y, dryLocations.pThree.z, true) < 0.5 then
                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dryLocations.pThree.x, dryLocations.pThree.y, dryLocations.pThree.z, true) < 0.5 then      
                    if not drying and not collect then      
                        DrawText3D(dryLocations.pThree.x, dryLocations.pThree.y, dryLocations.pThree.z, "~g~E~w~ - Start dryer")
                        if IsControlJustReleased(1, Keys['E']) then
                            DryAnimation()
                            QBCore.Functions.Progressbar("buds_dry", "Putting buds on the dryer...", math.random(5000, 10000), false, true, {
                                disableMovement = false,
                                disableCarMovement = false,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mp_car_bomb",
                                anim = "car_bomb_mechanic",
                                flags = 16,
                            }, {}, {}, function() -- Done
                                TriggerServerEvent('ksuie_drybuds:server:checkInv', amt)
                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                                dryer = 3
                                amount3 = amt
                                PlayerDryer = dryer
                                TriggerServerEvent("ksuie_drybuds:server:AssignDryer", PlayerDryer)
                                TriggerServerEvent("ksuie_drybuds:server:AssignDryerBuds", PlayerDryer)

                            end, function()
                                QBCore.Functions.Notify("Canceled..", "error")
                            end)                        
                        end   
                    end
                end
            end
        end
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dryLocations.pFour.x, dryLocations.pFour.y, dryLocations.pFour.z, true) < 10.5 then
            inRange = true
            DrawMarker(markerConfig.markerType, dryLocations.pFour.x, dryLocations.pFour.y, dryLocations.pFour.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dryLocations.pFour.x, dryLocations.pFour.y, dryLocations.pFour.z, true) < 0.5 then
                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dryLocations.pFour.x, dryLocations.pFour.y, dryLocations.pFour.z, true) < 0.5 then      
                    if not drying and not collect then      
                        DrawText3D(dryLocations.pFour.x, dryLocations.pFour.y, dryLocations.pFour.z, "~g~E~w~ - Start dryer")
                        if IsControlJustReleased(1, Keys['E']) then
                            DryAnimation()
                            QBCore.Functions.Progressbar("buds_dry", "Putting buds on the dryer...", math.random(5000, 10000), false, true, {
                                disableMovement = false,
                                disableCarMovement = false,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mp_car_bomb",
                                anim = "car_bomb_mechanic",
                                flags = 16,
                            }, {}, {}, function() -- Done
                                TriggerServerEvent('ksuie_drybuds:server:checkInv', amt)
                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                                dryer = 4
                                amount4 = amt
                                PlayerDryer = dryer
                                TriggerServerEvent("ksuie_drybuds:server:AssignDryer", PlayerDryer)
                                TriggerServerEvent("ksuie_drybuds:server:AssignDryerBuds", PlayerDryer)

                            end, function()
                                QBCore.Functions.Notify("Canceled..", "error")
                            end)                        
                        end   
                    end
                end
            end
        end
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dryLocations.pFive.x, dryLocations.pFive.y, dryLocations.pFive.z, true) < 10.5 then
            inRange = true
            DrawMarker(markerConfig.markerType, dryLocations.pFive.x, dryLocations.pFive.y, dryLocations.pFive.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dryLocations.pFive.x, dryLocations.pFive.y, dryLocations.pFive.z, true) < 0.5 then
                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dryLocations.pFive.x, dryLocations.pFive.y, dryLocations.pFive.z, true) < 0.5 then      
                    if not drying and not collect then      
                        DrawText3D(dryLocations.pFive.x, dryLocations.pFive.y, dryLocations.pFive.z, "~g~E~w~ - Start dryer")
                        if IsControlJustReleased(1, Keys['E']) then
                            DryAnimation()
                            QBCore.Functions.Progressbar("buds_dry", "Putting buds on the dryer...", math.random(5000, 10000), false, true, {
                                disableMovement = false,
                                disableCarMovement = false,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mp_car_bomb",
                                anim = "car_bomb_mechanic",
                                flags = 16,
                            }, {}, {}, function() -- Done
                                TriggerServerEvent('ksuie_drybuds:server:checkInv', amt)
                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                                dryer = 5
                                amount5 = amt
                                PlayerDryer = dryer
                                TriggerServerEvent("ksuie_drybuds:server:AssignDryer", PlayerDryer)
                                TriggerServerEvent("ksuie_drybuds:server:AssignDryerBuds", PlayerDryer)

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

RegisterNetEvent('ksuie_drybuds:client:dryTimer')
AddEventHandler('ksuie_drybuds:client:dryTimer', function()
    Citizen.Wait(0)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local inRange = false

    while drying do
        if dryer == 1 then
            dryCoordX = dryLocations.pOne.x
            dryCoordY = dryLocations.pOne.y
            dryCoordZ = dryLocations.pOne.z
        Citizen.Wait(0)      
        end
        if dryer == 2 then
            dryCoordX = dryLocations.pTwo.x
            dryCoordY = dryLocations.pTwo.y
            dryCoordZ = dryLocations.pTwo.z
        Citizen.Wait(0)      
        end
        if dryer == 3 then
            dryCoordX = dryLocations.pThree.x
            dryCoordY = dryLocations.pThree.y
            dryCoordZ = dryLocations.pThree.z
        Citizen.Wait(0)      
        end
        if dryer == 4 then
            dryCoordX = dryLocations.pFour.x
            dryCoordY = dryLocations.pFour.y
            dryCoordZ = dryLocations.pFour.z
        Citizen.Wait(0)      
        end
        if dryer == 5 then
            dryCoordX = dryLocations.pFive.x
            dryCoordY = dryLocations.pFive.y
            dryCoordZ = dryLocations.pFive.z
        Citizen.Wait(0)      
        end

    end
end)

function collectBuds(amt)
    Citizen.CreateThread(function()
    	while collect do
    		Citizen.Wait(0)
	        if dryer == 1 then
	            collectCoordX = dryLocations.pOne.x
	            collectCoordY = dryLocations.pOne.y
	            collectCoordZ = dryLocations.pOne.z
	        end
            if dryer == 2 then
                collectCoordX = dryLocations.pTwo.x
                collectCoordY = dryLocations.pTwo.y
                collectCoordZ = dryLocations.pTwo.z
            Citizen.Wait(0)      
            end
            if dryer == 3 then
                collectCoordX = dryLocations.pThree.x
                collectCoordY = dryLocations.pThree.y
                collectCoordZ = dryLocations.pThree.z
            Citizen.Wait(0)      
            end
            if dryer == 4 then
                collectCoordX = dryLocations.pFour.x
                collectCoordY = dryLocations.pFour.y
                collectCoordZ = dryLocations.pFour.z
            Citizen.Wait(0)      
            end
            if dryer == 5 then
                collectCoordX = dryLocations.pFive.x
                collectCoordY = dryLocations.pFive.y
                collectCoordZ = dryLocations.pFive.z
            Citizen.Wait(0)      
            end
    
	        local inRange = false
            local ped = PlayerPedId()
	        local pos = GetEntityCoords(ped)
    
        	DrawText3D(collectCoordX, collectCoordY, collectCoordZ, "~g~E~w~ - Collect Dry Buds")

        	if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, collectCoordX,collectCoordY, collectCoordZ, true) < 0.5 then
            	inRange = true
                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, collectCoordX,collectCoordY, collectCoordZ, true) < 0.5 then      
                    if IsControlJustReleased(1, Keys['E']) and inRange then
                        DryAnimation()
                        QBCore.Functions.Progressbar("buds_collect", "Collecting dry buds from dryer...", math.random(5000, 10000), false, true, {
                            disableMovement = false,
                            disableCarMovement = false,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "mp_car_bomb",
                            anim = "car_bomb_mechanic",
                            flags = 16,
                        }, {}, {}, function() -- Done
                            if dryer == 1 then
                                PlayerDryer = 1
                                amt = amount1
                                TriggerServerEvent('ksuie_drybuds:server:GetDryerBuds', PlayerDryer)
                                Citizen.Wait(5)
                                TriggerServerEvent("ksuie_drybuds:server:giveBuds", amt)
                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                                collect = false 
                            elseif dryer == 2 then
                                PlayerDryer = 2
                                amt = amount2
                                TriggerServerEvent('ksuie_drybuds:server:GetDryerBuds', PlayerDryer)
                                Citizen.Wait(5)
                                TriggerServerEvent("ksuie_drybuds:server:giveBuds", amt)
                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                                collect = false 
                            elseif dryer == 3 then
                                PlayerDryer = 3
                                amt = amount3
                                TriggerServerEvent('ksuie_drybuds:server:GetDryerBuds', PlayerDryer)
                                Citizen.Wait(5)
                                TriggerServerEvent("ksuie_drybuds:server:giveBuds", amt)
                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                                collect = false 
                            elseif dryer == 4 then
                                PlayerDryer = 4
                                amt = amount4
                                TriggerServerEvent('ksuie_drybuds:server:GetDryerBuds', PlayerDryer)
                                Citizen.Wait(5)
                                TriggerServerEvent("ksuie_drybuds:server:giveBuds", amt)
                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                                collect = false 
                            elseif dryer == 5 then
                                PlayerDryer = 5
                                amt = amount5
                                TriggerServerEvent('ksuie_drybuds:server:GetDryerBuds', PlayerDryer)
                                Citizen.Wait(5)
                                TriggerServerEvent("ksuie_drybuds:server:giveBuds", amt)
                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                                collect = false 

                            end                       
                            end, function()
                            QBCore.Functions.Notify("Canceled..", "error")
                        end) 
                    end                   
                end
            end            
        end
    end)
end

RegisterNetEvent('ksuie_drybuds:client:startTimer')
AddEventHandler('ksuie_drybuds:client:startTimer', function(amt)
    drying = true
    timer = math.ceil(0.01 * amt)
    if timer <= 60 then
        timer = 60
    elseif timer > 2700 then
        timer = 2700
    end
    TriggerEvent('ksuie_drybuds:client:dryTimer')
    while drying do
        timer = timer - 1
        if timer <= 0 then
            drying = false
            collect = true
            TriggerServerEvent('qb-phone_new:server:sendNewMail', {
                sender = "Weed Dryer",
                subject = "",
                message = "Your buds are ready, come back to get them.."
            })
            if dryer == 1 then
                amt = amount1
                collectBuds(amt)
            elseif dryer == 2 then
                amt = amount2
                collectBuds(amt)
            elseif dryer == 3 then
                amt = amount3
                collectBuds(amt)
            elseif dryer == 4 then
                amt = amount4
                collectBuds(amt)
            elseif dryer == 5 then
                amt = amount5
                collectBuds(amt)
            end
        end
        Citizen.Wait(1000)
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
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 41, 11, 41, 60)    
    ClearDrawOrigin()
end

function DryAnimation()
    loadAnimDict("mp_car_bomb")
    TaskPlayAnim(GetPlayerPed(-1), "mp_car_bomb", "car_bomb_mechanic" ,3.0, 3.0, -1, 16, 0, false, false, false)
    Citizen.CreateThread(function()
        while drying do
            TaskPlayAnim(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 3.0, 3.0, -1, 16, 0, 0, 0, 0)
            Citizen.Wait(2000)
        end
    end)
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

