Teleports = Teleports or {}
Teleports.Locations = { -- Here you can add more TP locations
    [1] = { -- tp to lawyers office
         [1] = {x = -72.81, y = -824.39, z = 243.39, h = 237.68, r = 1.0},
         [2] = {x = -69.34, y = -802.67, z = 44.23, h = 235.85, r = 1.0},
    },
    [2] = { -- tp to lawyers office
         [1] = {x = -77.95, y = -822.3, z = 243.39, h = 167.5, r = 1.0}, 
         [2] = {x = -84.35, y = -822.02, z = 36.03, h = 172.5, r = 1.0},
    },
}
JustTeleported = false

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

Citizen.CreateThread(function()
    while true do
        local inRange = false
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        for loc,_ in pairs(Teleports.Locations) do
            for k, v in pairs(Teleports.Locations[loc]) do
                local dist = #(pos - vector3(v.x, v.y, v.z))
                if dist < 2 then
                    inRange = true
                    DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.15, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)

                    if dist < 1 then
                        DrawText3Ds(v.x, v.y, v.z, '[E] To Teleport')
                        if IsControlJustReleased(0, 51) then
                            if k == 1 then
                                SetEntityCoords(ped, Teleports.Locations[loc][2].x, Teleports.Locations[loc][2].y, Teleports.Locations[loc][2].z)
                            elseif k == 2 then
                                SetEntityCoords(ped, Teleports.Locations[loc][1].x, Teleports.Locations[loc][1].y, Teleports.Locations[loc][1].z)
                            end
                            ResetTeleport()
                        end
                    end
                end
            end
        end

        if not inRange then
            Citizen.Wait(1000)
        end

        Citizen.Wait(3)
    end
end)

ResetTeleport = function()
    SetTimeout(1000, function()
        JustTeleported = false
    end)
end