Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

Consumeables = {
    ["sandwich"] = math.random(35, 54),
    ["water_bottle"] = math.random(35, 54),
    ["tosti"] = math.random(40, 50),
    ["kurkakola"] = math.random(35, 54),
    ["twerks_candy"] = math.random(35, 54),
    ["snikkel_candy"] = math.random(40, 50),
    ["coffee"] = math.random(40, 50),
    ["whiskey"] = math.random(20, 30),
    ["beer"] = math.random(30, 40),
    ["vodka"] = math.random(20, 40),
    ["glasswhiskey"] = math.random(10, 40),
    ["glasswine"] = math.random(10, 40),
    ["bloodymary"] = math.random(20, 40),
    ["champagne"] = math.random(30, 54),
    ["glasschampagne"] = math.random(10, 40),
    ["dusche"] = math.random(20, 40),
    ["tequila"] = math.random(30, 40),
    ["tequilashot"] = math.random(10, 20),
    ["whitewine"] = math.random(30, 50),
    ["pinacolada"] = math.random(19, 35),
    ["cluckin-soda"] = math.random(35, 54),
    ["frappe"] = math.random(35, 54),
    ["diegos_donuts"] = math.random(50, 50),
    ["burrito"] = math.random(35, 54),
    ["chicken-bucket"] = math.random(35, 54),
    ["cluckin-balls"] = math.random(35, 54),
    ["cluckin-fries"] = math.random(35, 54),
    ["hotdog"] = math.random(35, 54),
    ["money-shot"] = math.random(35, 54),
    ["pizza-slice"] = math.random(35, 54),
    ["spaghetti"] = math.random(35, 54),
    ["taco"] = math.random(35, 54),
    ["heart-stopper"] = math.random(35, 54),
    ["cluckin-rings"] = math.random(35, 54),
    ["popcorn"] = math.random(35, 54),
    ["bleederburger"] = math.random(35, 54),
    ["burger"] = math.random(35, 54),
    ["barnuts"] = math.random(35, 54),
    ["nachos"] = math.random(35, 54),
    ["kale_smoothie"] = math.random(35, 54),
    ["peach_smoothie"] = math.random(35, 54),
    ["apple_juice"] = math.random(35, 54),
    ["orange_juice"] = math.random(35, 54),

}

Config = {}

Config.DiscordRichPresenceSettings = {
    --This is the Application ID (Replace this with you own)
    DiscordAppID = "799322351384133642",

    --Here you will have to put the image name for the "large" icon.
    DiscordIcon = 'logo-mk1',

    --Here you can add hover text for the "large" icon.
    DiscordLargeHover = 'https://discord.gg/mKydrpC',

    --Here you will have to put the image name for the "small" icon.
    --SetDiscordRichPresenceAssetSmall('logo-mk3')

    --Here you can add hover text for the "small" icon.
    DiscordSmallHover = 'https://discord.gg/mKydrpC',
}

Config.RemoveWeaponDrops = true
Config.RemoveWeaponDropsTimer = 25

Config.JointEffectTime = 60

Config.BlacklistedScenarios = {
    ['TYPES'] = {
        "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
        "WORLD_VEHICLE_MILITARY_PLANES_BIG",
    },
    ['GROUPS'] = {
        2017590552,
        2141866469,
        1409640232,
        `ng_planes`,
    }
}

Config.BlacklistedVehs = {
    [`SHAMAL`] = true,
    [`LUXOR`] = true,
    [`LUXOR2`] = true,
    [`JET`] = true,
    [`LAZER`] = true,
    [`BUZZARD`] = true,
    [`BUZZARD2`] = true,
    [`ANNIHILATOR`] = true,
    [`SAVAGE`] = true,
    [`TITAN`] = true,
    [`RHINO`] = true,
    [`POLICE`] = true,
    [`POLICE2`] = true,
    [`POLICE3`] = true,
    [`POLICE4`] = true,
    [`POLICEB`] = true,
    [`POLICET`] = true,
    [`SHERIFF`] = true,
    [`SHERIFF2`] = true,
    [`FIRETRUK`] = true,
    [`MULE`] = true,
    --[`POLMAV`] = true,
    [`MAVERICK`] = true,
    [`BLIMP`] = true,
    [`AIRTUG`] = true,
    --[`CAMPER`] = true,   
}

Config.BlacklistedPeds = {
    [`s_m_y_ranger_01`] = true,
    [`s_m_y_sheriff_01`] = true,
    [`s_m_y_cop_01`] = true,
    [`s_f_y_sheriff_01`] = true,
    [`s_f_y_cop_01`] = true,
    [`s_m_y_hwaycop_01`] = true,
}