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
		local distance1 = GetDistanceBetweenCoords(pos, -23.73, -1405.92, 24.56, true)--UPDATE LOCATION
		local distance2 = GetDistanceBetweenCoords(pos, 1981.59, -2610.41, 3.55, true)--UPDATE LOCATION

      if distance1 < 2 then
          inRange = true
          if distance1 < .5 then
            DrawText3D(-23.73, -1405.92, 24.56, "~g~E~w~ -  Open Coke Crafting Station")--UPDATE LOCATION
            if IsControlJustPressed(1, Keys["E"]) then
              TriggerServerEvent("ksuie_cokecrafting:server:countinv")
              menuopen = 1
            end
          end
      elseif distance2 < 2 then
          inRange = true
          if distance2 < .5 then
            DrawText3D(1981.59, -2610.41, 3.55, "~g~E~w~ -  Open Coke Crafting Station")--UPDATE LOCATION
            if IsControlJustPressed(1, Keys["E"]) then
              TriggerServerEvent("ksuie_cokecrafting:server:countinv")
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
cokecraftMainMenu = NativeUI.CreateMenu("Coke Craft Menu", "~b~Choose the product you wish to craft")
_menuPool:Add(cokecraftMainMenu)
opencokecraftmenu = false

craftables = {
  "Coke Bags",
  "Crack"
}

craftnum = nil

-------------------------------CRAFT BAGS-----------------------------------------
function CraftButton(menu)
  local selctedcraftable = "none"
  local craftList = NativeUI.CreateListItem("Select Chemical", craftables, 1, "Must have required components & tools.")
--    local craftList = NativeUI.CreateListItem("Select Seed", weedbricks, 1)
  menu:AddItem(craftList)
  menu.OnListSelect = function(sender, item, index)  
      if item == craftList then
          selctedcraftable = item:IndexToItem(index)
            cokecraftMainMenu:Visible(not cokecraftMainMenu:Visible())
--[[!!!!!!!!!!!!ASSIGN NUMBER TO SEED SELECTED!!!!!!!!!!!!!!!!!!!!!]]            
          if selctedcraftable == "Coke Bags" then
            Citizen.Wait(0)
            TriggerEvent("cokecraft:off", true)
            TriggerServerEvent('ksuie_cokecrafting:server:coke')

          elseif selctedcraftable == "Crack" then
            Citizen.Wait(0)
            TriggerEvent("cokecraft:off", true)
            TriggerServerEvent('ksuie_cokecrafting:server:crack')

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
            cokecraftMainMenu:Visible(not cokecraftMainMenu:Visible())
            TriggerEvent("cokecraft:off", true)
        end
    end
end

CraftButton(cokecraftMainMenu)--works
CloseButton(cokecraftMainMenu)--works
_menuPool:RefreshIndex()

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
      _menuPool:ProcessMenus()
      --[[ The "e" button will activate the menu ]]
      if menuopen == 1 then
          cokecraftMainMenu:Visible(not cokecraftMainMenu:Visible())
          TriggerEvent('cokecraft:on', true)
      end
      menuopen = 0
    end
end)

--[[!!!!!!!!!!!!!!!!!!!!HTML TURN INFO ON AND OFF CODE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!]]
local display = false

RegisterCommand("cokeon", function()
    Citizen.CreateThread(function()
      TriggerEvent('cokecraft:on', true)
    end)
end)

  RegisterCommand("cokeoff", function()
    Citizen.CreateThread(function()
        TriggerEvent("cokecraft:off", true)
    end)
  end)

  --[[!!!!!!!!!!!!!!!!!!!!!SEND COMMAND TO LISTENER.JS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!]]

  RegisterNetEvent('cokecraft:on')
  AddEventHandler('cokecraft:on', function()
    SendNUIMessage({
      action = "showcokecraftInfo",
      display = true
    })
  end)

  RegisterNetEvent('cokecraft:off')
  AddEventHandler('cokecraft:off', function()
    SendNUIMessage({
      action = "showcokecraftInfo",
      display = false
    })
  end)

--[[!!!!!!!!!!!!!!!!!!!!!!!!!!!!!BEGIN CRAFTING CODE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!]]

