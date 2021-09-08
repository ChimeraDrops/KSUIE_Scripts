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
local queing = false
local timer = 0
local collectbrick = false
local dryer = 0
local amount1 = 0
local amount2 = 0
local amount3 = 0
local amount4 = 0
local amount5 = 0
local PlayerBricker = 0


Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(1)
		local inRange = false
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
		local distance1 = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, brickLocations.pOne.x, brickLocations.pOne.y, brickLocations.pOne.z, true)
		local distance2 = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, brickLocations.pTwo.x, brickLocations.pTwo.y, brickLocations.pTwo.z, true)
		local distance3 = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, brickLocations.pThree.x, brickLocations.pThree.y, brickLocations.pThree.z, true)
		local distance4 = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, brickLocations.pFour.x, brickLocations.pFour.y, brickLocations.pFour.z, true)

        if queing and distance1 < 5.0 and Config.ShowTimer then
            inRange = true
            DrawText3D(brickLocations.pOne.x, brickLocations.pOne.y, brickLocations.pOne.z, "Time left in que: " .. timer .. ' seconds.')      
        end
        if queing and distance2 < 5.0 and Config.ShowTimer then
            inRange = true
            DrawText3D(brickLocations.pTwo.x, brickLocations.pTwo.y, brickLocations.pTwo.z, "Time left in que: " .. timer .. ' seconds.')      
        end
        if queing and distance3 < 5.0 and Config.ShowTimer then
            inRange = true
            DrawText3D(brickLocations.pThree.x, brickLocations.pThree.y, brickLocations.pThree.z, "Time left in que: " .. timer .. ' seconds.')      
        end
        if queing and distance4 < 5.0 and Config.ShowTimer then
            inRange = true
            DrawText3D(brickLocations.pFour.x, brickLocations.pFour.y, brickLocations.pFour.z, "Time left in que: " .. timer .. ' seconds.')      
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

        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, brickLocations.pOne.x, brickLocations.pOne.y, brickLocations.pOne.z, true) < 10.5 then
            inRange = true
            DrawMarker(markerConfig.markerType, brickLocations.pOne.x, brickLocations.pOne.y, brickLocations.pOne.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, brickLocations.pOne.x, brickLocations.pOne.y, brickLocations.pOne.z, true) < 0.5 then
                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, brickLocations.pOne.x, brickLocations.pOne.y, brickLocations.pOne.z, true) < 0.5 then      
                    if not queing and not collectbrick then      
                        DrawText3D(brickLocations.pOne.x, brickLocations.pOne.y, brickLocations.pOne.z, "~g~E~w~ - Start Brick Que")
                        if IsControlJustReleased(1, Keys['E']) then
                            QueingAnimation()
                            QBCore.Functions.Progressbar("brick_que", "Adding Buds to Brick Que...", math.random(5000, 10000), false, true, {
                                disableMovement = false,
                                disableCarMovement = false,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mp_car_bomb",
                                anim = "car_bomb_mechanic",
                                flags = 16,
                            }, {}, {}, function() -- Done
                                TriggerServerEvent('ksuie_brickpackager:server:checkDryInv', amt)
                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                                dryer = 1
                                amount1 = amt
                                PlayerBricker = dryer
                                TriggerServerEvent("ksuie_drybuds:server:AssignBricker", PlayerBricker)
                                TriggerServerEvent("ksuie_drybuds:server:AssignBrickerBricks", PlayerBricker)
                            end, function()
                                QBCore.Functions.Notify("Canceled..", "error")
                            end)                        
                        end   
                    end
                end
            end
        end
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, brickLocations.pTwo.x, brickLocations.pTwo.y, brickLocations.pTwo.z, true) < 10.5 then
            inRange = true
            DrawMarker(markerConfig.markerType, brickLocations.pTwo.x, brickLocations.pTwo.y, brickLocations.pTwo.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, brickLocations.pTwo.x, brickLocations.pTwo.y, brickLocations.pTwo.z, true) < 0.5 then
                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, brickLocations.pTwo.x, brickLocations.pTwo.y, brickLocations.pTwo.z, true) < 0.5 then      
                    if not queing and not collectbrick then      
                        DrawText3D(brickLocations.pTwo.x, brickLocations.pTwo.y, brickLocations.pTwo.z, "~g~E~w~ - Start Brick Que")
                        if IsControlJustReleased(1, Keys['E']) then
                            QueingAnimation()
                            QBCore.Functions.Progressbar("brick_que", "Adding Buds to Brick Que...", math.random(5000, 10000), false, true, {
                                disableMovement = false,
                                disableCarMovement = false,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mp_car_bomb",
                                anim = "car_bomb_mechanic",
                                flags = 16,
                            }, {}, {}, function() -- Done
                                TriggerServerEvent('ksuie_brickpackager:server:checkDryInv', amt)
                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                                dryer = 2
                                amount2 = amt
                                PlayerBricker = dryer
                                TriggerServerEvent("ksuie_drybuds:server:AssignBricker", PlayerBricker)
                                TriggerServerEvent("ksuie_drybuds:server:AssignBrickerBricks", PlayerBricker)
                            end, function()
                                QBCore.Functions.Notify("Canceled..", "error")
                            end)                        
                        end   
                    end
                end
            end
        end
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, brickLocations.pThree.x, brickLocations.pThree.y, brickLocations.pThree.z, true) < 10.5 then
            inRange = true
            DrawMarker(markerConfig.markerType, brickLocations.pThree.x, brickLocations.pThree.y, brickLocations.pThree.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, brickLocations.pThree.x, brickLocations.pThree.y, brickLocations.pThree.z, true) < 0.5 then
                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, brickLocations.pThree.x, brickLocations.pThree.y, brickLocations.pThree.z, true) < 0.5 then      
                    if not queing and not collectbrick then      
                        DrawText3D(brickLocations.pThree.x, brickLocations.pThree.y, brickLocations.pThree.z, "~g~E~w~ - Start Brick Que")
                        if IsControlJustReleased(1, Keys['E']) then
                            QueingAnimation()
                            QBCore.Functions.Progressbar("brick_que", "Adding Buds to Brick Que...", math.random(5000, 10000), false, true, {
                                disableMovement = false,
                                disableCarMovement = false,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mp_car_bomb",
                                anim = "car_bomb_mechanic",
                                flags = 16,
                            }, {}, {}, function() -- Done
                                TriggerServerEvent('ksuie_brickpackager:server:checkDryInv', amt)
                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                                dryer = 3
                                amount3 = amt
                                PlayerBricker = dryer
                                TriggerServerEvent("ksuie_drybuds:server:AssignBricker", PlayerBricker)
                                TriggerServerEvent("ksuie_drybuds:server:AssignBrickerBricks", PlayerBricker)
                            end, function()
                                QBCore.Functions.Notify("Canceled..", "error")
                            end)                        
                        end   
                    end
                end
            end
        end
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, brickLocations.pFour.x, brickLocations.pFour.y, brickLocations.pFour.z, true) < 10.5 then
            inRange = true
            DrawMarker(markerConfig.markerType, brickLocations.pFour.x, brickLocations.pFour.y, brickLocations.pFour.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, brickLocations.pFour.x, brickLocations.pFour.y, brickLocations.pFour.z, true) < 0.5 then
                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, brickLocations.pFour.x, brickLocations.pFour.y, brickLocations.pFour.z, true) < 0.5 then      
                    if not queing and not collectbrick then      
                        DrawText3D(brickLocations.pFour.x, brickLocations.pFour.y, brickLocations.pFour.z, "~g~E~w~ - Start Brick Que")
                        if IsControlJustReleased(1, Keys['E']) then
                            QueingAnimation()
                            QBCore.Functions.Progressbar("brick_que", "Adding Buds to Brick Que...", math.random(5000, 10000), false, true, {
                                disableMovement = false,
                                disableCarMovement = false,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mp_car_bomb",
                                anim = "car_bomb_mechanic",
                                flags = 16,
                            }, {}, {}, function() -- Done
                                TriggerServerEvent('ksuie_brickpackager:server:checkDryInv', amt)
                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                                dryer = 4
                                amount4 = amt
                                PlayerBricker = dryer
                                TriggerServerEvent("ksuie_drybuds:server:AssignBricker", PlayerBricker)
                                TriggerServerEvent("ksuie_drybuds:server:AssignBrickerBricks", PlayerBricker)
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


RegisterNetEvent('ksuie_brickpackager:client:BrickTimer')
AddEventHandler('ksuie_brickpackager:client:BrickTimer', function()
    Citizen.Wait(0)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local inRange = false

    while queing do
        if dryer == 1 then
            dryCoordX = brickLocations.pOne.x
            dryCoordY = brickLocations.pOne.y
            dryCoordZ = brickLocations.pOne.z
        Citizen.Wait(0)      
        end
        if dryer == 2 then
            dryCoordX = brickLocations.pTwo.x
            dryCoordY = brickLocations.pTwo.y
            dryCoordZ = brickLocations.pTwo.z
        Citizen.Wait(0)      
        end
        if dryer == 3 then
            dryCoordX = brickLocations.pThree.x
            dryCoordY = brickLocations.pThree.y
            dryCoordZ = brickLocations.pThree.z
        Citizen.Wait(0)      
        end
        if dryer == 4 then
            dryCoordX = brickLocations.pFour.x
            dryCoordY = brickLocations.pFour.y
            dryCoordZ = brickLocations.pFour.z
        Citizen.Wait(0)      
        end
    end
end)


function collectBricks(amt)
    Citizen.CreateThread(function()
    	while collectbrick do
    		Citizen.Wait(0)
	        if dryer == 1 then
	            collectCoordX = brickLocations.pOne.x
	            collectCoordY = brickLocations.pOne.y
	            collectCoordZ = brickLocations.pOne.z
	        end
            if dryer == 2 then
                collectCoordX = brickLocations.pTwo.x
                collectCoordY = brickLocations.pTwo.y
                collectCoordZ = brickLocations.pTwo.z
            Citizen.Wait(0)      
            end
            if dryer == 3 then
                collectCoordX = brickLocations.pThree.x
                collectCoordY = brickLocations.pThree.y
                collectCoordZ = brickLocations.pThree.z
            Citizen.Wait(0)      
            end
            if dryer == 4 then
                collectCoordX = brickLocations.pFour.x
                collectCoordY = brickLocations.pFour.y
                collectCoordZ = brickLocations.pFour.z
            Citizen.Wait(0)      
            end

	        local inRange = false
            local ped = PlayerPedId()
	        local pos = GetEntityCoords(ped)
    
        	DrawText3D(collectCoordX, collectCoordY, collectCoordZ, "~g~E~w~ - Collect Bricks")

        	if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, collectCoordX,collectCoordY, collectCoordZ, true) < 0.5 then
            	inRange = true
                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, collectCoordX,collectCoordY, collectCoordZ, true) < 0.5 then      
                    if IsControlJustReleased(1, Keys['E']) and inRange then
                        QueingAnimation()
                        QBCore.Functions.Progressbar("bricks_collect", "Collecting bricks from que...", math.random(5000, 10000), false, true, {
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
                                PlayerBricker = 1
                                amt = amount1
                                TriggerServerEvent('ksuie_drybuds:server:GetBrickerBricks', PlayerBricker)
                                Citizen.Wait(5)
                                TriggerServerEvent("ksuie_brickpackager:server:giveBricks", amt)
                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                                collectbrick = false 
                            elseif dryer == 2 then
                                PlayerBricker = 2
                                amt = amount2
                                TriggerServerEvent('ksuie_drybuds:server:GetBrickerBricks', PlayerBricker)
                                Citizen.Wait(5)
                                TriggerServerEvent("ksuie_brickpackager:server:giveBricks", amt)
                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                                collectbrick = false 
                            elseif dryer == 3 then
                                PlayerBricker = 3
                                amt = amount3
                                TriggerServerEvent('ksuie_drybuds:server:GetBrickerBricks', PlayerBricker)
                                Citizen.Wait(5)
                                TriggerServerEvent("ksuie_brickpackager:server:giveBricks", amt)
                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                                collectbrick = false 
                            elseif dryer == 4 then
                                PlayerBricker = 4
                                amt = amount4
                                TriggerServerEvent('ksuie_drybuds:server:GetBrickerBricks', PlayerBricker)
                                Citizen.Wait(5)
                                TriggerServerEvent("ksuie_brickpackager:server:giveBricks", amt)
                                StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                                collectbrick = false
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


RegisterNetEvent('ksuie_brickpackager:client:startBrickTimer')
AddEventHandler('ksuie_brickpackager:client:startBrickTimer', function(amt)
    queing = true
    timer = math.ceil(0.1 * amt)
    if timer <= 60 then
        timer = 60
    elseif timer > 2700 then
        timer = 2700
    end
    TriggerEvent('ksuie_brickpackager:client:BrickTimer')
    while queing do
        timer = timer - 1
        if timer <= 0 then
            queing = false
            collectbrick = true
            TriggerServerEvent('qb-phone_new:server:sendNewMail', {
                sender = "Brick Packager",
                subject = "",
                message = "Your bricks are ready, come back to get them.."
            })
            if dryer == 1 then
                amt = amount1
                collectBricks(amt)
            elseif dryer == 2 then
                amt = amount2
                collectBricks(amt)
            elseif dryer == 3 then
                amt = amount3
                collectBricks(amt)
            elseif dryer == 4 then
                amt = amount4
                collectBricks(amt)
            elseif dryer == 5 then
                amt = amount5
                collectBricks(amt)
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

function QueingAnimation()
    loadAnimDict("mp_car_bomb")
    TaskPlayAnim(GetPlayerPed(-1), "mp_car_bomb", "car_bomb_mechanic" ,3.0, 3.0, -1, 16, 0, false, false, false)
    Citizen.CreateThread(function()
        while queing do
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

