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
--Start Script--
QBCore = nil

Citizen.CreateThread(function()
    while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
        Citizen.Wait(1000)
    end
end)

function notify(text)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(text)
  DrawNotification(true, true)
end

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

local menuopen = 0
Citizen.CreateThread(function()
	while true do
    Citizen.Wait(0)
		local ped = GetPlayerPed(-1)
		local pos = GetEntityCoords(ped)
		local inRange = false
		local distance1 = GetDistanceBetweenCoords(pos, -28.07, -1397.59, 24.56, true)--UPDATE LOCATION
    local distance2 = GetDistanceBetweenCoords(pos, -973.26, -1847.55, 26.41, true)--UPDATE LOCATION
    local distance3 = GetDistanceBetweenCoords(pos, 412.75, 4.91, 84.92, true)--UPDATE LOCATION
    local distance4 = GetDistanceBetweenCoords(pos, 947.76, -1465.67, 30.4, true)--UPDATE LOCATION

        if distance1 < 2 then
          inRange = true
          if distance1 < 0.5 then
            DrawText3D(-28.07, -1397.59, 24.56, "~g~E~w~ -  Open Reload Station")--UPDATE LOCATION
            if IsControlJustPressed(1, Keys["E"]) then
              TriggerServerEvent("ksuie_ammocraft:server:countinv")
              menuopen = 1
            end
          end
        elseif distance2 < 2 then
            inRange = true
            if distance2 < 0.5 then
              DrawText3D(-973.26, -1847.55, 26.41, "~g~E~w~ -  Open Reload Station")--UPDATE LOCATION
              if IsControlJustPressed(1, Keys["E"]) then
                TriggerServerEvent("ksuie_ammocraft:server:countinv")
                menuopen = 1
              end
            end
          elseif distance3 < 2 then
            inRange = true
            if distance3 < 0.5 then
              DrawText3D(412.75, 4.91, 84.92, "~g~E~w~ -  Open Reload Station")--UPDATE LOCATION
              if IsControlJustPressed(1, Keys["E"]) then
                TriggerServerEvent("ksuie_ammocraft:server:countinv")
                menuopen = 1
              end
            end
          elseif distance4 < 2 then
            inRange = true
            if distance4 < 0.5 then
              DrawText3D(947.76, -1465.67, 30.4, "~g~E~w~ -  Open Reload Station")--UPDATE LOCATION
              if IsControlJustPressed(1, Keys["E"]) then
                TriggerServerEvent("ksuie_ammocraft:server:countinv")
                menuopen = 1
              end
            end
        end
        if inRange == false then
          Citizen.Wait(6000)
          menuopen = 0
        end
      end
end)


_menuPool = NativeUI.CreatePool()
AmmoCraftMainMenu = NativeUI.CreateMenu("Ammo Craft Menu", "~b~Choose the items you wish to craft")
_menuPool:Add(AmmoCraftMainMenu)
opencasingcraftmenu = false

craftables = {
  "Pistol Ammo",
  "Shotgun Ammo",
  "SMG Ammo",
  "Rifle Ammo",
  "MG Ammo",
  "Sniper Ammo"
}

craftnum = nil

-------------------------------CRAFT BAGS-----------------------------------------
function CraftButton(menu)
  local selctedcraftable = "none"
  local craftList = NativeUI.CreateListItem("Select Craft Item", craftables, 1, "Must have required ingredients.")
--    local craftList = NativeUI.CreateListItem("Select Seed", weedbricks, 1)
  menu:AddItem(craftList)
  menu.OnListSelect = function(sender, item, index)  
      if item == craftList then
          selctedcraftable = item:IndexToItem(index)
            AmmoCraftMainMenu:Visible(not AmmoCraftMainMenu:Visible())
--[[!!!!!!!!!!!!ASSIGN NUMBER TO SEED SELECTED!!!!!!!!!!!!!!!!!!!!!]]            
          if selctedcraftable == "Pistol Ammo" then
            Citizen.Wait(0)
            TriggerEvent("ammocraft:off", true)
            TriggerServerEvent('ksuie_ammocraft:server:pistol')

          elseif selctedcraftable == "Shotgun Ammo" then
            Citizen.Wait(0)
            TriggerEvent("ammocraft:off", true)
            TriggerServerEvent('ksuie_ammocraft:server:shotgun')

          elseif selctedcraftable == "SMG Ammo" then
            TriggerEvent("ammocraft:off", true)
            TriggerServerEvent('ksuie_ammocraft:server:smg')

          elseif selctedcraftable == "Rifle Ammo" then
            TriggerEvent("ammocraft:off", true)
            TriggerServerEvent('ksuie_ammocraft:server:rifle')

          elseif selctedcraftable == "MG Ammo" then
            TriggerEvent("ammocraft:off", true)
            TriggerServerEvent('ksuie_ammocraft:server:mg')

          elseif selctedcraftable == "Sniper Ammo" then
            TriggerEvent("ammocraft:off", true)
            TriggerServerEvent('ksuie_ammocraft:server:sniper')

          else
            craftnum = 0
          end
      end
  end
end

function CloseButton(menu) 
    local click = NativeUI.CreateItem("Close", "~g~Close the Menu")
    menu:AddItem(click)
    menu.OnItemSelect = function(sender, item, index)
        if item == click then
            AmmoCraftMainMenu:Visible(not AmmoCraftMainMenu:Visible())
            TriggerEvent("ammocraft:off", true)
        end
    end
end

CraftButton(AmmoCraftMainMenu)--works
CloseButton(AmmoCraftMainMenu)--works
_menuPool:RefreshIndex()

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
      _menuPool:ProcessMenus()
      --[[ The "e" button will activate the menu ]]
      if menuopen == 1 then
          AmmoCraftMainMenu:Visible(not AmmoCraftMainMenu:Visible())
          TriggerEvent('ammocraft:on', true)
      end
      menuopen = 0
    end
end)

--[[!!!!!!!!!!!!!!!!!!!!HTML TURN INFO ON AND OFF CODE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!]]
local display = false

RegisterCommand("ammoon", function()
    Citizen.CreateThread(function()
      TriggerEvent('ammocraft:on', true)
    end)
end)

  RegisterCommand("ammooff", function()
    Citizen.CreateThread(function()
        TriggerEvent("ammocraft:off", true)
    end)
  end)

  --[[!!!!!!!!!!!!!!!!!!!!!SEND COMMAND TO LISTENER.JS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!]]

  RegisterNetEvent('ammocraft:on')
  AddEventHandler('ammocraft:on', function()
    SendNUIMessage({
      action = "showAmmoCraftInfo",
      display = true
    })
  end)

  RegisterNetEvent('ammocraft:off')
  AddEventHandler('ammocraft:off', function()
    SendNUIMessage({
      action = "showAmmoCraftInfo",
      display = false
    })
  end)

--[[!!!!!!!!!!!!!!!!!!!!!!!!!!!!!BEGIN CRAFTING CODE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!]]

