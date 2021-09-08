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
		local distance = GetDistanceBetweenCoords(pos, 3566.37, 3702.75, 36.64, true)
        if distance < 5 then
          inRange = true
          if distance < 1.5 then
            DrawText3D(3566.37, 3702.75, 36.64, "~g~E~w~ -  BioEngineer Weed Seeds")
            if IsControlJustPressed(1, Keys["E"]) then
              TriggerServerEvent("bioseedmenu:server:countseeds")
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
BioSeedMainMenu = NativeUI.CreateMenu("BioSeed Crafting Menu", "~b~Choose the items you wish to craft")
_menuPool:Add(BioSeedMainMenu)
openbiomenu = false
bioseeds = {
    "weed_og-kush_seed",
    "weed_bluedream_seed",
    "weed_purple-haze_seed",
    "weed_ak47_seed",
    "weed_amnesia_seed",
    "weed_white-widow_seed",
    "weed_thecarpfather_seed"
}

seednum = nil
--[[!!!!!!!!!!!!!!!!!MENU INTERACTION CODE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!]]
function SeedButton(menu)
    local selectedseed = "none"
    local seedsList = NativeUI.CreateListItem("Select Seed", bioseeds, 1, "See required ingredients on right")
--    local seedsList = NativeUI.CreateListItem("Select Seed", bioseeds, 1)
    menu:AddItem(seedsList)
    menu.OnListSelect = function(sender, item, index)  
        if item == seedsList then
            selectedseed = item:IndexToItem(index)
              BioSeedMainMenu:Visible(not BioSeedMainMenu:Visible())
--[[!!!!!!!!!!!!ASSIGN NUMBER TO SEED SELECTED!!!!!!!!!!!!!!!!!!!!!]]            
            if selectedseed == "weed_og-kush_seed" then
              Citizen.Wait(0)
              TriggerEvent("nui:off", true)
              TriggerServerEvent('bioseedmenu:server:biokush')
            elseif selectedseed == "weed_bluedream_seed" then
              Citizen.Wait(0)
              TriggerEvent("nui:off", true)
              TriggerServerEvent('bioseedmenu:server:blue')
            elseif selectedseed == "weed_purple-haze_seed" then
              TriggerEvent("nui:off", true)
              TriggerServerEvent('bioseedmenu:server:purple')
            elseif selectedseed == "weed_ak47_seed" then
              TriggerEvent("nui:off", true)
              TriggerServerEvent('bioseedmenu:server:ak47')
            elseif selectedseed == "weed_amnesia_seed" then
              TriggerEvent("nui:off", true)
              TriggerServerEvent('bioseedmenu:server:amnesia')
            elseif selectedseed == "weed_white-widow_seed" then
              TriggerEvent("nui:off", true)
              TriggerServerEvent('bioseedmenu:server:widow')
            elseif selectedseed == "weed_thecarpfather_seed" then
              TriggerEvent("nui:off", true)
              TriggerServerEvent('bioseedmenu:server:carpfather')
            else
              seednum = 0
            end
        end
    end
end


function CloseButton(menu) 
    local click = NativeUI.CreateItem("Close", "~g~Close the Menu")
    menu:AddItem(click)
    menu.OnItemSelect = function(sender, item, index)
        if item == click then
            BioSeedMainMenu:Visible(not BioSeedMainMenu:Visible())
            TriggerEvent("nui:off", true)
        end
    end
end

SeedButton(BioSeedMainMenu)
CloseButton(BioSeedMainMenu)
_menuPool:RefreshIndex()

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
      _menuPool:ProcessMenus()
      --[[ The "e" button will activate the menu ]]
      if menuopen == 1 then
          BioSeedMainMenu:Visible(not BioSeedMainMenu:Visible())
          TriggerEvent('nui:on', true)
      end
      menuopen = 0
    end
end)

--[[!!!!!!!!!!!!!!!!!!!!HTML TURN INFO ON AND OFF CODE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!]]
local display = false

RegisterCommand("on", function()
    Citizen.CreateThread(function()
      TriggerEvent('nui:on', true)
    end)
end)

  RegisterCommand("off", function()
    Citizen.CreateThread(function()
        TriggerEvent("nui:off", true)
    end)
  end)

  --[[!!!!!!!!!!!!!!!!!!!!!SEND COMMAND TO LISTENER.JS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!]]

  RegisterNetEvent('nui:on')
  AddEventHandler('nui:on', function()
    SendNUIMessage({
      action = "showBioInfo",
      display = true
    })
  end)

  RegisterNetEvent('nui:off')
  AddEventHandler('nui:off', function()
    SendNUIMessage({
      action = "showBioInfo",
      display = false
    })
  end)

--[[!!!!!!!!!!!!!!!!!!!!!!!!!!!!!BEGIN CRAFTING CODE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!]]

