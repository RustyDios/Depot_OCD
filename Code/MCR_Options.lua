--[[ =========== Start:: Depot_OCD:: MCR Options ========== --]]

local mod_name = "Depot_OCD"
local steamID = "1793460653"
-- local author = "RustyDios, SkiRich"
-- local version ="26"

local RustyPrint = false
local ModDir = CurrentModPath

local MCR_Q = table.find(ModsLoaded, "steam_id", "1542863522") or false

--[[ =========== Start:: Depot_OCD:: MCR Options : Default/Stored Game Values ========== --]]

--default game values
local new_max_x_2hex      = 12
local new_max_x_3hex      = 22
local new_max_y           = 5
local new_max_z           = 3
local new_max_rock_sml    = 105
local new_max_rock_big    = 285
local z_4_USD             = true
local x_z_convert         = false

--[[ =========== Finish:: Depot_OCD:: MCR Options : Default Game Values ========== --]]

--[[ =========== Start:: Depot_OCD:: MCR Options : ID's to affect lists ========== --]]

--2hex depots
local depot_ids_2hex = {
    ["UniversalStorageDepot"]   = "UniversalStorageDepot", 
    ["StorageConcrete"]         = "StorageConcrete",
	["StorageMetals"]           = "StorageMetals", 
	["StorageFood"]             = "StorageFood", 
	["StorageRareMetals"]       = "StorageRareMetals", 
	["StoragePolymers"]         = "StoragePolymers", 
	["StorageElectronics"]      = "StorageElectronics", 
	["StorageMachineParts"]     = "StorageMachineParts", 
    ["StorageFuel"]             = "StorageFuel", 
    ["StorageMysteryResource"]  = "StorageMysteryResource",
    --GreenPlanet DLC
    ["StorageSeeds"]            = "StorageSeeds",
    --Lukes 2 hex depots
    ["LH_StorageCrystals"]      = "StorageCrystals",
    ["LH_StorageRadioactive"]   = "StorageRadioactive",
    ["LH_StorageBooze"]         = "StorageBooze",
    ["LH_StorageMeat"]          = "StorageMeat",
}

--3hex depots
local depot_ids_3hex = {
    ["Storage3x"]                 = "Storage3x", 
    ["Storage3xConcrete"]         = "Storage3xConcrete",
	["Storage3xMetals"]           = "Storage3xMetals", 
	["Storage3xFood"]             = "Storage3xFood", 
	["Storage3xRares"]            = "Storage3xRares", 
	["Storage3xPolymers"]         = "Storage3xPolymers", 
	["Storage3xElectronics"]      = "Storage3xElectronics", 
	["Storage3xMachineParts"]     = "Storage3xMachineParts", 
    ["Storage3xFuel"]             = "Storage3xFuel", 
    ["Storage3xMysteryResource"]  = "Storage3xMysteryResource",
    --GreenPlanet DLC 3 hex depots
    ["Storage3xSeeds"]            = "Storage3xSeeds",
    --Lukes/mine 3 hex depots
    ["Storage3xCrystals"]         = "Storage3xCrystals",
    ["Storage3xRadioactive"]      = "Storage3xRadioactive",
    ["Storage3xBooze"]            = "Storage3xBooze",
    ["Storage3xMeat"]             = "Storage3xMeat",
}

-- waste rock sites, includes black cube storage
local depot_ids_dumps = {
    ["BlackCubeDump"]       = "BlackCubeDump",      --2 hex
    ["Storage3xBlackCubes"] = "Storage3xBlackCubes", --3 hex
    ["WasteRockDumpBig"]    = "WasteRockDumpBig",   --sml one
    ["WasteRockDumpHuge"]   = "WasteRockDumpHuge",  --big one
}

--[[ =========== Finish:: Depot_OCD:: MCR Options : ID's to affect lists ========== --]]

--[[ =========== Start:: Depot_OCD:: MCR Options : Function to adjust depot stack options ========== --]]

--this function adjust the templates for the next game and also the Ui numbers
local function RustyAdjustTemplateStacks()   

    if MCR_Q then 
        for i,template in pairs(BuildingTemplates) do

            if depot_ids_dumps[tostring(template.id)] == "WasteRockDumpBig" then
                template.max_amount_WasteRock = ModConfig:Get(mod_name, "new_max_rock_sml") * 1000 or new_max_rock_sml * 1000
            end

            if depot_ids_dumps[tostring(template.id)] == "WasteRockDumpHuge" then
                template.max_amount_WasteRock = ModConfig:Get(mod_name, "new_max_rock_big") * 1000 or new_max_rock_big *1000
            end 

            if depot_ids_2hex[tostring(template.id)] and template.id ~= "UniversalStorageDepot" then
                template.max_x = ModConfig:Get(mod_name, "new_max_x_2hex")
                template.max_z = ModConfig:Get(mod_name, "new_max_z")

                if not x_z_convert then 
                    -- adjust area size AND new max based on new values if not in "visual" mode
                    template.max_storage_per_resource = template.max_x * template.max_y * template.max_z * 1000
                end
            end

            if depot_ids_3hex[tostring(template.id)] and template.id ~= "Storage3x" then
                template.max_x = ModConfig:Get(mod_name, "new_max_x_3hex")
                template.max_z = ModConfig:Get(mod_name, "new_max_z")

                if not x_z_convert then 
                    -- adjust area size AND new max based on new values if not in "visual" mode
                    template.max_storage_per_resource = template.max_x * template.max_y * template.max_z * 1000
                end
            end

            if depot_ids_2hex[tostring(template.id)] == "UniversalStorageDepot" or depot_ids_3hex[tostring(template.id)] == "Storage3x" then

                if z_4_USD and not x_z_convert then
                    template.max_z = ModConfig:Get(mod_name, "new_max_z")
                    template.max_storage_per_resource = template.max_x * template.max_y * template.max_z * 1000
                end--if z_4_USD

            end--end USD

        end--end for loop, template in pairs BT

        if RustyPrint then print ("Depot OCD :: MCR Template Stacks Adjusted") end
    end -- mod config Q
end

local function RustyAdjustExistingStacks()

    if MCR_Q then 
        local stored_amount = false
        local res = false 
        local list = "RD_DepotOCD_DepotType_All"
        local container = UICity.RD_DepotOCD_DepotLists[list]

        for i,obj in pairs(container) do
                
            if obj.class == "WasteRockDumpSite" then
                stored_amount = obj:GetStored_WasteRock()                                           --get whats in it right now

                --updating WasteRock Sml
                if depot_ids_dumps[tostring(obj.template_name)] == "WasteRockDumpBig" then          --check and compare to lists
                    obj.max_amount_WasteRock = ModConfig:Get(mod_name, "new_max_rock_sml") * 1000   --update the maxium value
                end
        
                --updating WasteRock Big
                if depot_ids_dumps[tostring(obj.template_name)] == "WasteRockDumpHuge" then
                    obj.max_amount_WasteRock = ModConfig:Get(mod_name, "new_max_rock_big") * 1000
                end

                obj.demand["WasteRock"]:SetAmount(obj.max_amount_WasteRock - stored_amount)         --re-calc demand based on new max   
                obj.supply["WasteRock"]:SetAmount(stored_amount)                                    --re-calc supply based on stores

                --special rock to concrete stuff going on? ie "old" Tech:Liquidification
                if obj.supply["Concrete"] then
                    obj.supply["Concrete"]:SetAmount(stored_amount / Max(1, g_Consts.WasteRockToConcreteRatio))
                end

                --set the ammount visually back to what it was
                obj:SetCount(stored_amount)                                                           --ensure visual count matches actual count
                if RustyPrint then print("Depot_OCD All# ",i,":: OBJ ::",obj.class,obj.template_name,":: Values ::",stored_amount/1000,"/",obj.max_amount_WasteRock/1000) end
            end

            --update 2hex BlackCubedumps, in the depot_ids_dumps list
            --or not cause fuck em, set to 81 (* 1000) and thats what they'll stay because fuck that stack issue

            --update 2hex depots 
            if depot_ids_2hex[tostring(obj.template_name)] and obj.template_name ~= "UniversalStorageDepot" then

                res = obj.resource[1] or obj.resource                                   --get the resource type of the depot
                stored_amount = obj.supply[res]:GetActualAmount()                       --get current storage

                obj.max_x = ModConfig:Get(mod_name, "new_max_x_2hex")                   --set new x -- new length
                --obj.max_y = ModConfig:Get(mod_name, "new_max_y")                        --set new y -- default y, changing y really messes things up
                obj.max_z = ModConfig:Get(mod_name, "new_max_z")                        --set new z -- new height

                if x_z_convert then 
                    --don't adjust the ammount of resource based on the new values, just adjust the area size
                    obj.max_z = 500 -- set the sky as the limit, well only actually needs to be max 240
                else
                    -- adjust area size AND new max based on new values
                    obj.max_storage_per_resource = obj.max_x * obj.max_y * obj.max_z * 1000 
                end

                obj.demand[res]:SetAmount(obj.max_storage_per_resource - stored_amount) --re-calc demand based on new max
                obj.supply[res]:SetAmount(0)                                            --set to 0 stored to remove boxes
                obj:SetCount(0)                                                         --set to 0 stored to remove boxes
                obj.supply[res]:SetAmount(stored_amount)                                --set to original
                obj:SetCount(stored_amount)                                             --set to refil boxes to original, confined to new xyz

                if RustyPrint then print("Depot_OCD All# ",i,":: OBJ ::",obj.class,obj.template_name,":: Values ::[",obj.max_x,",",obj.max_y,",",obj.max_z,"]::",stored_amount/1000,"/",obj.max_storage_per_resource/1000) end
            end

            -- update 3hex BlackCube storage, in the depot_ids_dumps list
            -- or not cause fuck em too, see above

            --update 3hex depots 
            if depot_ids_3hex[tostring(obj.template_name)] and obj.template_name ~= "Storage3x" then

                res = obj.resource[1] or obj.resource
                stored_amount = obj.supply[res]:GetActualAmount()

                obj.max_x = ModConfig:Get(mod_name, "new_max_x_3hex")
                --obj.max_y = ModConfig:Get(mod_name, "new_max_y")
                obj.max_z = ModConfig:Get(mod_name, "new_max_z")

                if x_z_convert then 
                    --don't adjust the ammount of resource based on the new values, just adjust the area size
                    obj.max_z = 500 -- set the sky as the limit, well only actually needs to be max 240
                else
                    -- adjust area size AND new max based on new values
                    obj.max_storage_per_resource = obj.max_x * obj.max_y * obj.max_z * 1000 
                end

                obj.demand[res]:SetAmount(obj.max_storage_per_resource - stored_amount)
                obj.supply[res]:SetAmount(0)
                obj:SetCount(0)
                obj.supply[res]:SetAmount(stored_amount)
                obj:SetCount(stored_amount)

                if RustyPrint then print("Depot_OCD All# ",i,":: OBJ ::",obj.class,obj.template_name,":: Values ::[",obj.max_x,",",obj.max_y,",",obj.max_z,"]::",stored_amount/1000,"/",obj.max_storage_per_resource/1000) end
            end
            
            --update 2hex(old) Universal Depot
            --update 3hex(new) Universal Depot
            if depot_ids_2hex[tostring(obj.template_name)] == "UniversalStorageDepot" or depot_ids_3hex[tostring(obj.template_name)] == "Storage3x" then

                if z_4_USD then
                    for i, res in ipairs(obj.storable_resources or empty_table) do
                        stored_amount = obj.supply[res]:GetActualAmount()

                        --obj.max_x = ModConfig:Get(mod_name, "new_max_x_3hex") --dont adjust x for USD
                        --obj.max_y = ModConfig:Get(mod_name, "new_max_y")      --dont adjust y for USD
                        obj.max_z = ModConfig:Get(mod_name, "new_max_z")

                        obj.max_storage_per_resource = obj.max_x * obj.max_y * obj.max_z * 1000

                        obj.demand[res]:SetAmount(obj.max_storage_per_resource - stored_amount)
                        obj.stockpiled_amount[res] = 0
                        obj.supply[res]:SetAmount(0)
                        obj:SetCount(0, res)
                        obj.supply[res]:SetAmount(stored_amount)
                        obj.stockpiled_amount[res] = stored_amount
                        obj:SetCount(stored_amount,res)
                    end

                    if RustyPrint then print("Depot_OCD All# ",i,":: OBJ ::",obj.template_name,":: Values ::[22,5,",obj.max_z,"]:: Per Resource Max ::",obj.max_storage_per_resource/1000) end
                end--if z_4_USD
            end--end USD

        end -- end for loop, obj in pairs container

        if RustyPrint then print ("Depot OCD :: MCR Existing Stacks Adjusted") end
    end -- mod config Q
end--end Rusty Existing

--[[ =========== Finish:: Depot_OCD:: MCR Options : Function to adjust depot stack options ========== --]]

--[[ =========== Start:: Depot_OCD:: MCR Options : Custom Msg Listener ========== --]]

--OnMsg fired from Depot_OCD > AddToRustyLabels >  on complete
--this ensures the item is registered on the lists for the adjust stacks function to pick it up and change it :)
function OnMsg.DepotOCDDepotAdded()
    RustyAdjustExistingStacks()
end

--[[ =========== Finish:: Depot_OCD:: MCR Options : Custom Msg Listener ========== --]]

--[[ =========== Start:: Depot_OCD:: MCR Options : Register Options with MCR ========== --]]

-- register it with mod config, if available
function OnMsg.ModConfigReady()
    --local StringIdBase = 7878934676631337681623 -- RustyDiosMod_Depot_OCD

    ModConfig:RegisterMod(mod_name,
        T(mod_name),
        T("Manipulates the depot stockpile boundaries on the pad. <newline>Includes functionality for all current game depots and piles, except for BlackCube Storage (if active).")
    )

    --[[
    ModConfig:RegisterOption(mod_name,"option_id",{
        name = T("name"),
        desc = T("description"),
        order = #, -- defaults to 1, same number order will sort alphabetically by option_id
        type = xxx, -- defaults to boolean... boolean, enum,number,slider,note
        values = {
            --used if type is enum for what to show user
            value = "value", label = T("display to user"),
        }
        min = x, -- defaults to no limits for type=number, or 0 for type=slider
        max = y, -- defaults to no limits for type=number, or 100 for type=slider
        step = z, -- how much to +/- when clicking for number or snapto for slider
        label = "string", if type=slider optionally displays current value T("Set to <value>") or a % T("percent<value>")
        default = value to use if the user hasn't or can't set a value
    })
    --]]

    ModConfig:RegisterOption(mod_name, "new_max_x_2hex", {
        name = T("2 Hex Depots Stack Length:"),
        desc = T("How much of the depot should the boxes fill.<newline>Vanilla value is 12.<newline>Icon is always visable at 6"),
        order = 1,
        type = "number",
        default = new_max_x_2hex,
        min = 2,
        max = 12,
        step = 2,
    })

    ModConfig:RegisterOption(mod_name, "new_max_x_3hex", {
        name = T("3 Hex Depots Stack Length:"),
        desc = T("How much of the depot should the boxes fill.<newline>Vanilla value is 22.<newline>Icon is always visable at 16"),
        order = 2,
        type = "number",
        default = new_max_x_3hex,
        min = 2,
        max = 22,
        step = 2,
    })

    --[[
    ModConfig:RegisterOption(mod_name, "new_max_y", {
        name = T("Stack Depth:"),
        desc = T("How much of the depot should the boxes fill.<newline>Vanilla value is 5."),
        order = 3,
        type = "number",
        default = new_max_y,
        min = 1,
        max = 5,
        step = 1,
    })
    --]]

    ModConfig:RegisterOption(mod_name, "new_max_z", {
        name = T("Stack Height:"),
        desc = T("How high should the boxes stack.<newline>Affects both 2 and 3 Hex depots.<newline>Vanilla value is 3."),
        order = 4,
        type = "number",
        default = new_max_z,
        min = 1,
        max = 20,
        step = 1,
    })

    ModConfig:RegisterOption(mod_name, "z_4_USD", {
        name = T("Stack Height Affects Universal Storage Depots:"),
        desc = T("Stack height also applies to Universal Storage Depots."),
        order = 5,
        type = "boolean",
        default = true,
    })

    ModConfig:RegisterOption(mod_name, "x_z_convert", {
        name = T("Convert reduced length to extra height:"),
        desc = T("Choosing this option will attempt to convert any reduction to stack length into an increase in height.<newline>This still allows for maximum storage.<newline><newline> Decide how much you want to store <color em>before</color> choosing this option on how to visually stack it."),
        order = 6,
        type = "boolean",
        default = false,
    })

    ModConfig:RegisterOption(mod_name,"MCR_space",{
        name = T("<newline><newline>"),
        desc = T("<newline><newline>"),
        order = 7, 
        type = "note",
    })

    ModConfig:RegisterOption(mod_name, "new_max_rock_sml", {
        name = T("Small Waste Rock Dump Capacity:"),
        desc = T("How much waste rock can you store in one dump.<newline>Vanilla value is 105."),
        order = 8,
        type = "number",
        default = new_max_rock_sml,
        min = 105,
        max = 2100,
        step = 105,
    })

    ModConfig:RegisterOption(mod_name, "new_max_rock_big", {
        name = T("Large Waste Rock Dump Capacity:"),
        desc = T("How much waste rock can you store in one dump.<newline>Vanilla value is 285."),
        order = 9,
        type = "number",
        default = new_max_rock_big,
        min = 285,
        max = 5700,
        step = 285,
    })

    --load saved options
    new_max_x_2hex      = ModConfig:Get(mod_name, "new_max_x_2hex")     or 12
    new_max_x_3hex      = ModConfig:Get(mod_name, "new_max_x_3hex")     or 22
    new_max_y           = ModConfig:Get(mod_name, "new_max_y")          or 5    --option removed so will always revert to default 5
    new_max_z           = ModConfig:Get(mod_name, "new_max_z")          or 3
    new_max_rock_sml    = ModConfig:Get(mod_name, "new_max_rock_sml")   or 105
    new_max_rock_big    = ModConfig:Get(mod_name, "new_max_rock_big")   or 285
    z_4_USD             = ModConfig:Get(mod_name, "z_4_USD")            --or true  --lol can't have this duh, if false = true..think about it!
    x_z_convert         = ModConfig:Get(mod_name, "x_z_convert")        --or false  

    RustyAdjustTemplateStacks()
    if RustyPrint then print ("Depot OCD :: MCR options loaded in, BT adjusted") end
end

--[[ =========== Finish:: Depot_OCD:: MCR Options : Register Options with MCR ========== --]]

--[[ =========== Start:: Depot_OCD:: MCR Options : Update on MCR option change ========== --]]

function OnMsg.ModConfigChanged(mod_id, option_id, value, old_value,token)
    if mod_id == mod_name then
        if RustyPrint then print("Depot OCD :: MCR value changed:",option_id,"from",old_value,"to",value) end
        
        new_max_x_2hex      = ModConfig:Get(mod_name, "new_max_x_2hex")     or 12
        new_max_x_3hex      = ModConfig:Get(mod_name, "new_max_x_3hex")     or 22
        new_max_y           = ModConfig:Get(mod_name, "new_max_y")          or 5    --option removed so will always revert to default 5
        new_max_z           = ModConfig:Get(mod_name, "new_max_z")          or 3
        new_max_rock_sml    = ModConfig:Get(mod_name, "new_max_rock_sml")   or 105
        new_max_rock_big    = ModConfig:Get(mod_name, "new_max_rock_big")   or 285
        z_4_USD             = ModConfig:Get(mod_name, "z_4_USD")            --or true  --lol can't have this duh, if false = true..think about it!
        x_z_convert         = ModConfig:Get(mod_name, "x_z_convert")        --or false  
        
        RustyAdjustTemplateStacks()
        RustyAdjustExistingStacks()
    end
end
--[[ =========== Finish:: Depot_OCD:: MCR Options : Update on MCR option change ========== --]]

--[[ =========== Finsh:: Depot_OCD:: MCR Options ========== --]]

--[[
    ModConfig:Set(mod_name,option_id,value,token)   -- returns new value --Sends Msg("ModConfigChanged"), token can be something for your mod config handler to check
    ModConfig:Get(mod_name,option_id)               -- returns the current option, default if defined or nil
    ModConfig:Toggle(mod_id, option_id, token)      -- if boolean toogles and return, if not nil
    ModConfig:Revert(mod_id, option_id, token)      -- returns default if defined or nil
    ModConfig:GetDefault(mod_id, option_id)         -- returns default if defined or nil

    OnMsg.UIReady() -- sent out when the Ui is ready to be changed or modified
    OnMsg.ModConfigReady() -- sent out when it's safe to use ModConfig
    OnMsg.ModConfigChanged(mod_id, option_id, value, old_value, token) -- sent when anything changes
]]