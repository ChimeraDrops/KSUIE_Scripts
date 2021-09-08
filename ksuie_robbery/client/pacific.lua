Keys = {
	['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
	['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
	['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
	['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
	['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
	['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
	['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
	['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

local requiredItemsShowed = false
local requiredItemsShowed2 = false
local requiredItemsShowed3 = false
local requiredItemsShowed4 = false
QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
processcard = false
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




Citizen.CreateThread(function()
    Citizen.Wait(2000)
    local requiredItems3 = {
        [1] = {name = QBCore.Shared.Items["thermite"]["name"], image = QBCore.Shared.Items["thermite"]["image"]},
    }
    local requiredItems2 = {
        [1] = {name = QBCore.Shared.Items["electronickit"]["name"], image = QBCore.Shared.Items["electronickit"]["image"]},
        [2] = {name = QBCore.Shared.Items["trojan_usb"]["name"], image = QBCore.Shared.Items["trojan_usb"]["image"]},
    }
    local requiredItems = {
        [1] = {name = QBCore.Shared.Items["security_card_02"]["name"], image = QBCore.Shared.Items["security_card_02"]["image"]},
    }
    while true do
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        local inRange = false
        if QBCore ~= nil then
            if GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["coords"][1]["x"], Config.BigBanks["pacific"]["coords"][1]["y"], Config.BigBanks["pacific"]["coords"][1]["z"], true) < 1 then
                inRange = true
                if not Config.BigBanks["pacific"]["isOpened"] then
                    local dist = GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["coords"][1]["x"], Config.BigBanks["pacific"]["coords"][1]["y"], Config.BigBanks["pacific"]["coords"][1]["z"], true)
                    if dist < .8 then
                        if not requiredItemsShowed then
                            requiredItemsShowed = true
                            Citizen.CreateThread(function()
                                QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
                                    if result then
                                        while true do
                                            local ped = GetPlayerPed(-1)
                                            local pos = GetEntityCoords(ped)
                                            local inRange = false
                                            local distance = GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["coords"][1]["x"], Config.BigBanks["pacific"]["coords"][1]["y"],Config.BigBanks["pacific"]["coords"][1]["z"], true)
                                    
                                            if distance < 5 then
                                                inRange = true
                                                if distance < 1.5 then
                                                    DrawText3D(Config.BigBanks["pacific"]["coords"][1]["x"], Config.BigBanks["pacific"]["coords"][1]["y"],Config.BigBanks["pacific"]["coords"][1]["z"], "~g~E~w~ - Use Security Card B")
                                                    if IsControlJustPressed(0, Keys["E"]) then
                                                        processcard = true
                                                    end
                                                    if processcard == true then
                                                        QBCore.Functions.Progressbar("security_pass", "Validitating card..", math.random(5000, 10000), false, true, {
                                                            disableMovement = true,
                                                            disableCarMovement = true,
                                                            disableMouse = false,
                                                            disableCombat = true,
                                                        }, {
                                                            animDict = "anim@gangops@facility@servers@",
                                                            anim = "hotwire",
                                                            flags = 16,
                                                        }, {}, {}, function() -- Done
                                                            StopAnimTask(GetPlayerPed(-1), "anim@gangops@facility@servers@", "hotwire", 1.0)
                                                            TriggerServerEvent('qb-doorlock:server:updateState', 2, false)
                                                            TriggerServerEvent("QBCore:Server:RemoveItem", "security_card_02", 1)
                                                        end, function() -- Cancel
                                                            StopAnimTask(GetPlayerPed(-1), "anim@gangops@facility@servers@", "hotwire", 1.0)
                                                            QBCore.Functions.Notify("Canceled..", "error")
                                                        end)
                                                    end
                                                    notify("You opened the door")
                                                    processcard = false
                                                end
                                            end
                                    
                                            if not inRange then
                                                Citizen.Wait(3000)
                                            end
                                            Citizen.Wait(3)
                                        end
                                    end
                                end, "security_card_02")
                            end)
                        end
                    else
                        if requiredItemsShowed then
                            requiredItemsShowed = false
                            TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                        end
                    end
                end
            end
            if GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["coords"][2]["x"], Config.BigBanks["pacific"]["coords"][2]["y"], Config.BigBanks["pacific"]["coords"][2]["z"], true) < 1 then
                inRange = true
                if not Config.BigBanks["pacific"]["isOpened"] then
                    local dist = GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["coords"][2]["x"], Config.BigBanks["pacific"]["coords"][2]["y"], Config.BigBanks["pacific"]["coords"][2]["z"], true)
                    if dist < 0.8 then
                        if not requiredItemsShowed2 then
                            requiredItemsShowed2 = true
                            TriggerEvent('inventory:client:requiredItems', requiredItems2, true)
                        end
                    else
                        if requiredItemsShowed2 then
                            requiredItemsShowed2 = false
                            TriggerEvent('inventory:client:requiredItems', requiredItems2, false)
                        end
                    end
                end
            end
            if GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["thermite"][1]["x"], Config.BigBanks["pacific"]["thermite"][1]["y"], Config.BigBanks["pacific"]["thermite"][1]["z"], true) < 1 then
                inRange = true
                if not Config.BigBanks["pacific"]["thermite"][1]["isOpened"] then
                    local dist = GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["thermite"][1]["x"], Config.BigBanks["pacific"]["thermite"][1]["y"], Config.BigBanks["pacific"]["thermite"][1]["z"], true)
                    if dist < 0.8 then
                        currentThermiteGate = Config.BigBanks["pacific"]["thermite"][1]["doorId"]
                        if not requiredItemsShowed3 then
                            requiredItemsShowed3 = true
                            TriggerEvent('inventory:client:requiredItems', requiredItems3, true)
                        end
                    end
                end
            end
            if GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["thermite"][2]["x"], Config.BigBanks["pacific"]["thermite"][2]["y"], Config.BigBanks["pacific"]["thermite"][2]["z"], true) < 1 then
                inRange = true
                if not Config.BigBanks["pacific"]["thermite"][2]["isOpened"] then
                    local dist = GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["thermite"][2]["x"], Config.BigBanks["pacific"]["thermite"][2]["y"], Config.BigBanks["pacific"]["thermite"][2]["z"], true)
                    if dist < 0.8 then
                        currentThermiteGate = Config.BigBanks["pacific"]["thermite"][2]["doorId"]
                        if not requiredItemsShowed3 then
                            requiredItemsShowed3 = true
                            TriggerEvent('inventory:client:requiredItems', requiredItems3, true)
                        end
                    end
                end
            end
            if GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["thermite"][3]["x"], Config.BigBanks["pacific"]["thermite"][3]["y"], Config.BigBanks["pacific"]["thermite"][3]["z"], true) < 1 then
                inRange = true
                if not Config.BigBanks["pacific"]["thermite"][3]["isOpened"] then
                    local dist = GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["thermite"][3]["x"], Config.BigBanks["pacific"]["thermite"][3]["y"], Config.BigBanks["pacific"]["thermite"][3]["z"], true)
                    if dist < 0.8 then
                        currentThermiteGate = Config.BigBanks["pacific"]["thermite"][3]["doorId"]
                        if not requiredItemsShowed3 then
                            requiredItemsShowed3 = true
                            TriggerEvent('inventory:client:requiredItems', requiredItems3, true)
                        end
                    end
                end
            end
            if Config.BigBanks["pacific"]["isOpened"] then
                for k, v in pairs(Config.BigBanks["pacific"]["lockers"]) do
                    local lockerDist = GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["lockers"][k].x, Config.BigBanks["pacific"]["lockers"][k].y, Config.BigBanks["pacific"]["lockers"][k].z)
                    if not Config.BigBanks["pacific"]["lockers"][k]["isBusy"] then
                        if not Config.BigBanks["pacific"]["lockers"][k]["isOpened"] then
                            if lockerDist < 5 then
                                inRange = true
                                DrawMarker(2, Config.BigBanks["pacific"]["lockers"][k].x, Config.BigBanks["pacific"]["lockers"][k].y, Config.BigBanks["pacific"]["lockers"][k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
                                if lockerDist < 0.5 then
                                    DrawText3Ds(Config.BigBanks["pacific"]["lockers"][k].x, Config.BigBanks["pacific"]["lockers"][k].y, Config.BigBanks["pacific"]["lockers"][k].z + 0.3, '[E] Crack the vault')
                                    if IsControlJustPressed(0, Keys["E"]) then
                                        if CurrentCops >= Config.MinimumPacificPolice then
                                            openLocker("pacific", k)
                                        else
                                            QBCore.Functions.Notify("Not enough police.. (6 needed)", "error")
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            if not inRange then
                Citizen.Wait(2500)
            end
        end
        Citizen.Wait(1)
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(2000)
    local requiredItems4 = {
        [1] = {name = QBCore.Shared.Items["thermite"]["name"], image = QBCore.Shared.Items["thermite"]["image"]},
    }
    while true do 
        Citizen.Wait(1)
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        local inRange = false
        local currentThermiteGate = 0
        if QBCore ~= nil then
            if GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["thermite"][3]["x"], Config.BigBanks["pacific"]["thermite"][3]["y"], Config.BigBanks["pacific"]["thermite"][3]["z"], true) < 1.5 then
                inRange = true
                if not Config.BigBanks["pacific"]["thermite"][3]["isOpened"] then
                    local dist = GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["thermite"][3]["x"], Config.BigBanks["pacific"]["thermite"][3]["y"], Config.BigBanks["pacific"]["thermite"][3]["z"], true)
                    if dist < 1.5 then
                        currentThermiteGate = Config.BigBanks["pacific"]["thermite"][3]["doorId"]
                        if not requiredItemsShowed4 then
                            requiredItemsShowed4 = true
                            TriggerEvent('inventory:client:requiredItems', requiredItems4, true)
                        end
                    else
                        if GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["thermite"][2]["x"], Config.BigBanks["pacific"]["thermite"][2]["y"], Config.BigBanks["pacific"]["thermite"][2]["z"], true) < 1.5 then
                            inRange = true
                            if not Config.BigBanks["pacific"]["thermite"][2]["isOpened"] then
                                local dist = GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["thermite"][2]["x"], Config.BigBanks["pacific"]["thermite"][2]["y"], Config.BigBanks["pacific"]["thermite"][2]["z"], true)
                                if dist < 1.5 then
                                    currentThermiteGate = Config.BigBanks["pacific"]["thermite"][2]["doorId"]
                                    if not requiredItemsShowed4 then
                                        requiredItemsShowed4 = true
                                        TriggerEvent('inventory:client:requiredItems', requiredItems4, true)
                                    end
                                else
                                    if GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["thermite"][1]["x"], Config.BigBanks["pacific"]["thermite"][1]["y"], Config.BigBanks["pacific"]["thermite"][1]["z"], true) < 1.5 then
                                        inRange = true
                                        if not Config.BigBanks["pacific"]["thermite"][1]["isOpened"] then
                                            local dist = GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["thermite"][1]["x"], Config.BigBanks["pacific"]["thermite"][1]["y"], Config.BigBanks["pacific"]["thermite"][1]["z"], true)
                                            if dist < 1.5 then
                                                currentThermiteGate = Config.BigBanks["pacific"]["thermite"][1]["doorId"]
                                                if not requiredItemsShowed4 then
                                                    requiredItemsShowed4 = true
                                                    TriggerEvent('inventory:client:requiredItems', requiredItems4, true)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('electronickit:UseElectronickit')
AddEventHandler('electronickit:UseElectronickit', function()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    local requiredItems ={
        [1] = {name = QBCore.Shared.Items["electronickit"]["name"], image = QBCore.Shared.Items["electronickit"]["image"]},
        [2] = {name = QBCore.Shared.Items["trojan_usb"]["name"], image = QBCore.Shared.Items["trojan_usb"]["image"]},
    } 
    local dist = GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["coords"][2]["x"], Config.BigBanks["pacific"]["coords"][2]["y"], Config.BigBanks["pacific"]["coords"][2]["z"])
    if dist < 2.5 then
        QBCore.Functions.TriggerCallback('ksuie_robbery:server:isRobberyActive', function(isBusy)
            if not isBusy then
                local dist = GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["coords"][2]["x"], Config.BigBanks["pacific"]["coords"][2]["y"], Config.BigBanks["pacific"]["coords"][2]["z"])
                if dist < 1.5 then
                    if CurrentCops >= Config.MinimumPacificPolice then
                        if not Config.BigBanks["pacific"]["isOpened"] then 
                            QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
                                if result then 
                                    TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                                    QBCore.Functions.Progressbar("hack_gate", "Connecting electronic kit..", math.random(5000, 10000), false, true, {
                                        disableMovement = true,
                                        disableCarMovement = true,
                                        disableMouse = false,
                                        disableCombat = true,
                                    }, {
                                        animDict = "anim@gangops@facility@servers@",
                                        anim = "hotwire",
                                        flags = 16,
                                    }, {}, {}, function() -- Done
                                        StopAnimTask(GetPlayerPed(-1), "anim@gangops@facility@servers@", "hotwire", 1.0)
                                        TriggerEvent("mhacking:show")
                                        TriggerEvent("mhacking:start", math.random(5, 9), math.random(15, 20), OnHackPacificDone)
                                        if not copsCalled then
                                            local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, pos.x, pos.y, pos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
                                            local street1 = GetStreetNameFromHashKey(s1)
                                            local street2 = GetStreetNameFromHashKey(s2)
                                            local streetLabel = street1
                                            if street2 ~= nil then 
                                                streetLabel = streetLabel .. " " .. street2
                                            end
                                            if Config.BigBanks["pacific"]["alarm"] then
                                                TriggerServerEvent("ksuie_robbery:server:callCops", "pacific", 0, streetLabel, pos)
                                                copsCalled = true
                                            end
                                        end
                                    end, function() -- Cancel
                                        StopAnimTask(GetPlayerPed(-1), "anim@gangops@facility@servers@", "hotwire", 1.0)
                                        QBCore.Functions.Notify("Canceled..", "error")
                                    end)
                                else
                                    QBCore.Functions.Notify("You are missing something..", "error")
                                end
                            end, "trojan_usb")
                        else
                            QBCore.Functions.Notify("It looks like the bank is already opened..", "error")
                        end
                    else
                        QBCore.Functions.Notify("Not enough police.. (6 needed)", "error")
                    end
                end
            else
                QBCore.Functions.Notify("The security lock is active, the door cannot be opened at the moment..", "error", 5500)
            end
        end)
    end
end)


function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end

function OnHackPacificDone(success, timeremaining)
    if success then
        TriggerEvent('mhacking:hide')
        TriggerServerEvent('ksuie_robbery:server:setBankState', "pacific", true)
    else
		TriggerEvent('mhacking:hide')
	end
end

function OpenPacificDoor()
    local object = GetClosestObjectOfType(Config.BigBanks["pacific"]["coords"][2]["x"], Config.BigBanks["pacific"]["coords"][2]["y"], Config.BigBanks["pacific"]["coords"][2]["z"], 20.0, Config.BigBanks["pacific"]["object"], false, false, false)
    local timeOut = 10
    local entHeading = Config.BigBanks["pacific"]["heading"].closed

    if object ~= 0 then
        Citizen.CreateThread(function()
            while true do

                if entHeading > Config.BigBanks["pacific"]["heading"].open then
                    SetEntityHeading(object, entHeading - 10)
                    entHeading = entHeading - 0.5
                else
                    break
                end

                Citizen.Wait(10)
            end
        end)
    end
end