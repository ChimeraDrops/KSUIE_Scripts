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
		local distance1 = GetDistanceBetweenCoords(pos, -572.72, 228.29, 74.89, true)--UPDATE LOCATION
      if distance1 < 5 then
          inRange = true
          if distance1 < 1.5 then
            DrawText3D(-572.72, 228.29, 74.89, "~g~E~w~ -  Open Hacker Crafting Station")--UPDATE LOCATION
            if IsControlJustPressed(1, Keys["E"]) then
              TriggerServerEvent("ksuie_hackercrafting:server:countinv")
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
hackercraftMainMenu = NativeUI.CreateMenu("Hacker Craft Menu", "~b~Choose the item you wish to craft")
_menuPool:Add(hackercraftMainMenu)
openhackercraftmenu = false

craftables = {
  "Card A",
  "Card B",
  "Hack",
  "Trojan",
  "Handcuffs",
  "Key"
}

craftnum = nil

-------------------------------CRAFT BAGS-----------------------------------------
function CraftButton(menu)
  local selctedcraftable = "none"
  local craftList = NativeUI.CreateListItem("Select Hack", craftables, 1, "Must have required components & tools.")
--    local craftList = NativeUI.CreateListItem("Select Seed", weedbricks, 1)
  menu:AddItem(craftList)
  menu.OnListSelect = function(sender, item, index)  
      if item == craftList then
          selctedcraftable = item:IndexToItem(index)
            hackercraftMainMenu:Visible(not hackercraftMainMenu:Visible())
--[[!!!!!!!!!!!!ASSIGN NUMBER TO SEED SELECTED!!!!!!!!!!!!!!!!!!!!!]]            
          if selctedcraftable == "Card A" then
            Citizen.Wait(0)
            TriggerEvent("hackercraft:off", true)
            TriggerServerEvent('ksuie_hackercrafting:server:carda')

          elseif selctedcraftable == "Card B" then
            Citizen.Wait(0)
            TriggerEvent("hackercraft:off", true)
            TriggerServerEvent('ksuie_hackercrafting:server:cardb')

          elseif selctedcraftable == "Hack" then
            TriggerEvent("hackercraft:off", true)
            TriggerServerEvent('ksuie_hackercrafting:server:hack')

          elseif selctedcraftable == "Trojan" then
            TriggerEvent("hackercraft:off", true)
            TriggerServerEvent('ksuie_hackercrafting:server:trojan')

          elseif selctedcraftable == "Handcuffs" then
            TriggerEvent("hackercraft:off", true)
            TriggerServerEvent('ksuie_hackercrafting:server:handcuffs')

          elseif selctedcraftable == "Key" then
            TriggerEvent("hackercraft:off", true)
            TriggerServerEvent('ksuie_hackercrafting:server:key')

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
            hackercraftMainMenu:Visible(not hackercraftMainMenu:Visible())
            TriggerEvent("hackercraft:off", true)
        end
    end
end

CraftButton(hackercraftMainMenu)--works
CloseButton(hackercraftMainMenu)--works
_menuPool:RefreshIndex()

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
      _menuPool:ProcessMenus()
      --[[ The "e" button will activate the menu ]]
      if menuopen == 1 then
          hackercraftMainMenu:Visible(not hackercraftMainMenu:Visible())
          TriggerEvent('hackercraft:on', true)
      end
      menuopen = 0
    end
end)

--[[!!!!!!!!!!!!!!!!!!!!HTML TURN INFO ON AND OFF CODE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!]]
local display = false

RegisterCommand("hackon", function()
    Citizen.CreateThread(function()
      TriggerEvent('hackercraft:on', true)
    end)
end)

  RegisterCommand("hackoff", function()
    Citizen.CreateThread(function()
        TriggerEvent("hackercraft:off", true)
    end)
  end)

  --[[!!!!!!!!!!!!!!!!!!!!!SEND COMMAND TO LISTENER.JS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!]]

  RegisterNetEvent('hackercraft:on')
  AddEventHandler('hackercraft:on', function()
    SendNUIMessage({
      action = "showhackercraftInfo",
      display = true
    })
  end)

  RegisterNetEvent('hackercraft:off')
  AddEventHandler('hackercraft:off', function()
    SendNUIMessage({
      action = "showhackercraftInfo",
      display = false
    })
  end)

--[[!!!!!!!!!!!!!!!!!!!!!!!!!!!!!BEGIN CRAFTING CODE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!]]

