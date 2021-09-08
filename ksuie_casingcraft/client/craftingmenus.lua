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
		local distance1 = GetDistanceBetweenCoords(pos, -26.62, -1399.64, 24.56, true)--UPDATE LOCATION
    local distance2 = GetDistanceBetweenCoords(pos, 972.5, -1845.99, 26.41, true)--UPDATE LOCATION
		local distance3 = GetDistanceBetweenCoords(pos, 412.25, 7.83, 84.92, true)--UPDATE LOCATION
		local distance4 = GetDistanceBetweenCoords(pos, 947.71, -1468.27, 30.4, true)--UPDATE LOCATION

        if distance1 < 2 then
          inRange = true
          if distance1 < 0.5 then
            DrawText3D(-26.62, -1399.64, 24.56, "~g~E~w~ -  Open Reload Casing Station")--UPDATE LOCATION
            if IsControlJustPressed(1, Keys["E"]) then
              TriggerServerEvent("ksuie_casingcraft:server:countinv")
              menuopen = 1
            end
          end
        elseif distance2 < 2 then
            inRange = true
            if distance2 < 0.5 then
              DrawText3D(972.5, -1845.99, 26.41, "~g~E~w~ -  Open Reload Casing Station")--UPDATE LOCATION
              if IsControlJustPressed(1, Keys["E"]) then
                TriggerServerEvent("ksuie_casingcraft:server:countinv")
                menuopen = 1
              end
            end
        elseif distance3 < 2 then
            inRange = true
            if distance3 < 0.5 then
              DrawText3D(412.25, 7.83, 84.92, "~g~E~w~ -  Open Reload Casing Station")--UPDATE LOCATION
              if IsControlJustPressed(1, Keys["E"]) then
                TriggerServerEvent("ksuie_casingcraft:server:countinv")
                menuopen = 1
              end
            end
        elseif distance4 < 2 then
            inRange = true
            if distance4 < 0.5 then
              DrawText3D(947.71, -1468.27, 30.4, "~g~E~w~ -  Open Reload Casing Station")--UPDATE LOCATION
              if IsControlJustPressed(1, Keys["E"]) then
                TriggerServerEvent("ksuie_casingcraft:server:countinv")
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
CasingCraftMainMenu = NativeUI.CreateMenu("Casing Craft Menu", "~b~Choose the items you wish to craft")
_menuPool:Add(CasingCraftMainMenu)
opencasingcraftmenu = false

craftables = {
  "Pistol Casing",
  "Shotgun Casing",
  "SMG Casing",
  "Rifle Casing",
  "Empty MG Belt",
  "Gunpowder"
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
            CasingCraftMainMenu:Visible(not CasingCraftMainMenu:Visible())
--[[!!!!!!!!!!!!ASSIGN NUMBER TO SEED SELECTED!!!!!!!!!!!!!!!!!!!!!]]            
          if selctedcraftable == "Pistol Casing" then
            Citizen.Wait(0)
            TriggerEvent("casingcraft:off", true)
            TriggerServerEvent('ksuie_casingcraft:server:pistol')

          elseif selctedcraftable == "Shotgun Casing" then
            Citizen.Wait(0)
            TriggerEvent("casingcraft:off", true)
            TriggerServerEvent('ksuie_casingcraft:server:shotgun')

          elseif selctedcraftable == "SMG Casing" then
            TriggerEvent("casingcraft:off", true)
            TriggerServerEvent('ksuie_casingcraft:server:smg')

          elseif selctedcraftable == "Rifle Casing" then
            TriggerEvent("casingcraft:off", true)
            TriggerServerEvent('ksuie_casingcraft:server:rifle')

          elseif selctedcraftable == "Empty MG Belt" then
            TriggerEvent("casingcraft:off", true)
            TriggerServerEvent('ksuie_casingcraft:server:mg')

          elseif selctedcraftable == "Gunpowder" then
            TriggerEvent("casingcraft:off", true)
            TriggerServerEvent('ksuie_casingcraft:server:gunpowder')

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
            CasingCraftMainMenu:Visible(not CasingCraftMainMenu:Visible())
            TriggerEvent("casingcraft:off", true)
        end
    end
end

CraftButton(CasingCraftMainMenu)--works
CloseButton(CasingCraftMainMenu)--works
_menuPool:RefreshIndex()

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
      _menuPool:ProcessMenus()
      --[[ The "e" button will activate the menu ]]
      if menuopen == 1 then
          CasingCraftMainMenu:Visible(not CasingCraftMainMenu:Visible())
          TriggerEvent('casingcraft:on', true)
      end
      menuopen = 0
    end
end)

--[[!!!!!!!!!!!!!!!!!!!!HTML TURN INFO ON AND OFF CODE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!]]
local display = false

RegisterCommand("casingon", function()
    Citizen.CreateThread(function()
      TriggerEvent('casingcraft:on', true)
    end)
end)

  RegisterCommand("casingoff", function()
    Citizen.CreateThread(function()
        TriggerEvent("casingcraft:off", true)
    end)
  end)

  --[[!!!!!!!!!!!!!!!!!!!!!SEND COMMAND TO LISTENER.JS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!]]

  RegisterNetEvent('casingcraft:on')
  AddEventHandler('casingcraft:on', function()
    SendNUIMessage({
      action = "showCasingInfo",
      display = true
    })
  end)

  RegisterNetEvent('casingcraft:off')
  AddEventHandler('casingcraft:off', function()
    SendNUIMessage({
      action = "showCasingInfo",
      display = false
    })
  end)

--[[!!!!!!!!!!!!!!!!!!!!!!!!!!!!!BEGIN CRAFTING CODE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!]]

