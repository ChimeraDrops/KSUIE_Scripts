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

--LOCAL VARIABLES
local hasCard = false
local robberyAlert = false
local isLoggedIn = false
local firstAlarm = false
--Functions--
function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end

function DrawText3Ds(x, y, z, text)
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

function CheckPockets()
    TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end) 
    Wait(3)
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
        if result then
           hasCard = true
        else
           hasCard = false
        end
    end, "security_card_01")
end

--CheckPockets--
Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId(-1)
        local pos = GetEntityCoords(ped)
        local inRangeCardSwipe = false
        local processcard = false
        local JewelThief = false
        local dist = GetDistanceBetweenCoords(pos, -606.94, -245.5, 50.24)
        if dist < 20 then 
            JewelThief = true
            if JewelThief then
                if dist < 2 then
                    while true do 
                        local distance2 = GetDistanceBetweenCoords(pos, -606.94, -245.5, 50.24)
                        inRangeCardSwipe = true
                        if inRangeCardSwipe then
                            if distance2 < 2 then
                                CheckPockets()
                                local pos2 = GetEntityCoords(ped)
                                distance2 = GetDistanceBetweenCoords(pos2, -606.94, -245.5, 50.24)

                                if hasCard then
                                    local pos3 = GetEntityCoords(ped)
                                    distance2 = GetDistanceBetweenCoords(pos3, -606.94, -245.5, 50.24)
            
                                        DrawText3Ds(-606.94, -245.5, 50.24, '[E] Swipe Bank Card A')
                                        if IsControlJustPressed(0, Keys["E"]) then
                                            TriggerServerEvent('ksuie-jewellery:server:changejob')
                                            processcard = true
                                            if processcard == true then
                                                QBCore.Functions.Progressbar("security_pass", "Validitating card..", math.random(5000, 6000), false, true, {
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
                                                    TriggerServerEvent('nui_doorlock:updateState', 178, false)
                                                    TriggerServerEvent("QBCore:Server:RemoveItem", "security_card_01", 1)
                                                end, function() -- Cancel
                                                    StopAnimTask(GetPlayerPed(-1), "anim@gangops@facility@servers@", "hotwire", 1.0)
                                                    QBCore.Functions.Notify("Canceled..", "error")
                                                end)
                                            end
                                            Citizen.Wait(6500)
                                            TriggerServerEvent('ksuie-jewellery:server:restorejob')
                                            Citizen.Wait(1000)
                                            hasCard = false
                                        end
                                    if distance2 > 2 then
                                        hasCard = false
                                        break
                                    end
                                else
                                    DrawText3Ds(-606.94, -245.5, 50.24, 'You Need Bank Card A')
                                end
                                Citizen.Wait(3)
                                if distance2 > 5 then
                                    hasCard = false
                                    dist = 4
                                    break
                                end
                            end
                        end
                        Citizen.Wait(3)
                    end
                end
                Citizen.Wait(1000)
            elseif dist >= 2 then
                JewelThief = false
                Citizen.Wait(4000)
            end
            Citizen.Wait(3)
        end
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local inRange = false
        TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end) 
        Wait(3)
    
        PlayerData = QBCore.Functions.GetPlayerData()

        for case,_ in pairs(Config.Locations) do
            local dist = GetDistanceBetweenCoords(pos, Config.Locations[case]["coords"]["x"], Config.Locations[case]["coords"]["y"], Config.Locations[case]["coords"]["z"])
            local storeDist = GetDistanceBetweenCoords(pos, Config.JewelleryLocation["coords"]["x"], Config.JewelleryLocation["coords"]["y"], Config.JewelleryLocation["coords"]["z"])
            if dist < .5 then
                inRange = true

                if inRange then
                    if not Config.Locations[case]["isBusy"] and not Config.Locations[case]["isOpened"] then
                        DrawText3Ds(Config.Locations[case]["coords"]["x"], Config.Locations[case]["coords"]["y"], Config.Locations[case]["coords"]["z"], '[E] Smash showcase')
                        if IsControlJustPressed(0, Keys["E"]) then
                            QBCore.Functions.TriggerCallback('ksuie-jewellery:server:getCops', function(cops)
                                if validWeapon() then
                                    smashVitrine(case)
                                else
                                    QBCore.Functions.Notify('Your weapon is not strong enough..', 'error')
                                end
                            end)
                        end
                    end
                end

                if storeDist < 5 then
                    if not firstAlarm then
                        if validWeapon() then
                            TriggerServerEvent('ksuie-jewellery:server:PoliceAlertMessage', "Suspicious situation", pos, true)
                            firstAlarm = true
                        end
                    end
                end
            end
        end
        Citizen.Wait(3)

    end
end)


function loadParticle()
	if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
    RequestNamedPtfxAsset("scr_jewelheist")
    end
    while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
    Citizen.Wait(0)
    end
    SetPtfxAssetNextCall("scr_jewelheist")
end

function loadAnimDict(dict)  
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(3)
    end
end

function validWeapon()
    local ped = PlayerPedId()
    local pedWeapon = GetSelectedPedWeapon(ped)

    for k, v in pairs(Config.WhitelistedWeapons) do
        if pedWeapon == k then
            return true
        end
    end
    return false
end

local smashing = false

function smashVitrine(k)
    local animDict = "missheist_jewel"
    local animName = "smash_case"
    local ped = PlayerPedId()
    local plyCoords = GetOffsetFromEntityInWorldCoords(ped, 0, 0.6, 0)
    local pedWeapon = GetSelectedPedWeapon(ped)
    local alertchance= 0

    smashing = true

    QBCore.Functions.Progressbar("smash_vitrine", "Banging showcase..", Config.WhitelistedWeapons[pedWeapon]["timeOut"], false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('ksuie-jewellery:server:setVitrineState', "isOpened", true, k)
        TriggerServerEvent('ksuie-jewellery:server:setVitrineState', "isBusy", false, k)
        TriggerServerEvent('ksuie-jewellery:server:vitrineReward')
        TriggerServerEvent('ksuie-jewellery:server:setTimeout')
        alertchance = math.random(1,100)
        if alertchance > 75 then
            TriggerServerEvent('ksuie-jewellery:server:PoliceAlertMessage', "Jewellery robery", plyCoords, false)
        end
        smashing = false
        TaskPlayAnim(ped, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
    end, function() -- Cancel
        smashing = false
        TriggerServerEvent('ksuie-jewellery:server:setVitrineState', "isBusy", false, k)
        TaskPlayAnim(ped, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
    end)
    TriggerServerEvent('ksuie-jewellery:server:setVitrineState', "isBusy", true, k)

    Citizen.CreateThread(function()
        while smashing do
            loadAnimDict(animDict)
            TaskPlayAnim(ped, animDict, animName, 3.0, 3.0, -1, 2, 0, 0, 0, 0 )
            Citizen.Wait(500)
            TriggerServerEvent("InteractSound_SV:PlayOnSource", "breaking_vitrine_glass", 0.25)
            loadParticle()
            StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", plyCoords.x, plyCoords.y, plyCoords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
            Citizen.Wait(2500)
        end
    end)
end

RegisterNetEvent('ksuie-jewellery:client:setVitrineState')
AddEventHandler('ksuie-jewellery:client:setVitrineState', function(stateType, state, k)
    Config.Locations[k][stateType] = state
end)

RegisterNetEvent('ksuie-jewellery:client:setAlertState')
AddEventHandler('ksuie-jewellery:client:setAlertState', function(bool)
    robberyAlert = bool
end)

RegisterNetEvent('ksuie-jewellery:client:PoliceAlertMessage')
AddEventHandler('ksuie-jewellery:client:PoliceAlertMessage', function(title, coords, blip)
    if blip then
        TriggerEvent('qb-policealerts:client:AddPoliceAlert', {
            timeOut = 5000,
            alertTitle = title,
            details = {
                [1] = {
                    icon = '<i class="fas fa-gem"></i>',
                    detail = "Vangelico Jewellery",
                },
                [2] = {
                    icon = '<i class="fas fa-video"></i>',
                    detail = "31 | 32 | 33 | 34",
                },
                [3] = {
                    icon = '<i class="fas fa-globe-europe"></i>',
                    detail = "Rockford Dr",
                },
            },
            callSign = QBCore.Functions.GetPlayerData().metadata["callsign"],
        })
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        Citizen.Wait(100)
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        Citizen.Wait(100)
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        local transG = 100
        local blip = AddBlipForRadius(coords.x, coords.y, coords.z, 100.0)
        SetBlipSprite(blip, 9)
        SetBlipColour(blip, 1)
        SetBlipAlpha(blip, transG)
        SetBlipAsShortRange(blip, false)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("112 - Suspect situation jewellery")
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    else
        if not robberyAlert then
            PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
            TriggerEvent('qb-policealerts:client:AddPoliceAlert', {
                timeOut = 5000,
                alertTitle = title,
                details = {
                    [1] = {
                        icon = '<i class="fas fa-gem"></i>',
                        detail = "Vangelico Jewellery",
                    },
                    [2] = {
                        icon = '<i class="fas fa-video"></i>',
                        detail = "31 | 32 | 33 | 34",
                    },
                    [3] = {
                        icon = '<i class="fas fa-globe-europe"></i>',
                        detail = "Rockford Dr",
                    },
                },
                callSign = QBCore.Functions.GetPlayerData().metadata["callsign"],
            })
            robberyAlert = true
        end
    end
end)

Citizen.CreateThread(function()
    Dealer = AddBlipForCoord(Config.JewelleryLocation["coords"]["x"], Config.JewelleryLocation["coords"]["y"], Config.JewelleryLocation["coords"]["z"])

    SetBlipSprite (Dealer, 617)
    SetBlipDisplay(Dealer, 4)
    SetBlipScale  (Dealer, 0.7)
    SetBlipAsShortRange(Dealer, true)
    SetBlipColour(Dealer, 3)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Vangelico Jewellery")
    EndTextCommandSetBlipName(Dealer)
end)

