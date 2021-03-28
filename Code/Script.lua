--[[ =========== Start:: Depot_OCD:: Main Script ========== --]]

local mod_name = "Depot_OCD"
local steamID = "1793460653"
-- local authors = "RustyDios, Choggi"
-- local version ="34"

local RustyPrint = false
local ModDir = CurrentModPath

--[[ =========== Start:: Depot OCD:: Add BT's and IP's ========== --]]
function OnMsg.ClassesPostprocess()

	if not BuildingTemplates.Storage3x then
		
		PlaceObj("BuildMenuSubcategory", {
			--__copy = "Depots",
			id = "RD_DepotOCD_3Hex",
			comment = "Rustys Depot OCD 3 Hex Group",
			group = "Default",
			category = "Storages",
			category_name = "RD_DepotOCD_3Hex",
			build_pos = 3,
			display_name = T("Extended Depots"),
			description = T("Resource-specific Extended Depots"),
			icon = "UI/Icons/Buildings/depots.dds",
			--close_parent = true, -- causes instant closure on selection do NOT re-add it (again)
		})-- new build menu sub category, 3hex Depots

		PlaceObj("ModItemBuildingTemplate",{
			"Id", "Storage3x",
			"template_class", "Storage3x_UD",
			"Group", "RD_DepotOCD_3Hex",
			"build_category", "RD_DepotOCD_3Hex",
			"build_pos", 1,
			"build_shortcut1", "U",
			"display_name", T("Universal Depot"),
			"display_name_pl", T("Universal Depots"),
			"description", T("Stores <resource(max_storage_per_resource)> units of each transportable resource. Some resources will be transported to other depots within Drone range."),
			"display_icon", "UI/Icons/Buildings/universal_storage.tga",
			"encyclopedia_id", "UniversalStorageDepot",
			"encyclopedia_image", "UI/Encyclopedia/UniversalDepot.tga",
			"entity", "Storage3x",
			"storable_resources", {},
			--"fill_group_idx", 9,
			"desire_slider_max", 30,
			"desired_amount", 3000,
			--"switch_fill_order", false,
			"instant_build", true,
			"build_points", 0,
			"dome_forbidden", true,
			"on_off_button", false,
			"prio_button", false,
			"count_as_building", false,
		})-- end Uni Depot bt

		PlaceObj("ModItemBuildingTemplate", {
			"Id", "Storage3xBlackCubes",
			"template_class", "BlackCubeDumpSite",
			"Group", "RD_DepotOCD_3Hex",
			"build_category", "RD_DepotOCD_3Hex",
			"build_pos", 11,
			"pin_rollover_hint", T("<image UI/Infopanel/left_click.tga 1400> Select"),
			"pin_rollover_hint_xbox", T("<image UI/PS4/Cross.tga> View"),
			"display_name", T(5039, --[[BuildingTemplate BlackCubeDump display_name]] "Cube Depot"),
			"display_name_pl", T(5040, --[[BuildingTemplate BlackCubeDump display_name_pl]] "Cube Depots"),
			"description", T(5041, --[[BuildingTemplate BlackCubeDump description]] "A safe place to store Black Cubes."),
			"display_icon", "UI/Icons/Buildings/black_cube_dump_site.tga",
			"encyclopedia_id", "StorageCubes",
			"encyclopedia_image", "UI/Encyclopedia/ConcreteDepot.tga",
			"entity", "Storage3xCubes_C",
			"entity2","Storage3xCubes_M",
			"resource","BlackCube",
			"max_amount_BlackCube", 81000, -- same size as base game
			"instant_build", true,
			"build_points", 0,
			"dome_forbidden", true,			
			"on_off_button", false,
			"prio_button", false,
			"count_as_building", true,
			"key_bindable", false,
		})-- end Cube Depot bt

		PlaceObj("ModItemBuildingTemplate", {
			"Id", "Storage3xConcrete",
			"template_class", "UniversalStorageDepot",
			"Group", "RD_DepotOCD_3Hex",
			"build_category", "RD_DepotOCD_3Hex",
			"build_pos", 3,	
			"display_name", T(5036, --[[BuildingTemplate StorageConcrete display_name]] "Concrete Depot"),
			"display_name_pl", T(5037, --[[BuildingTemplate StorageConcrete display_name_pl]] "Concrete Depots"),
			"description", T(5038, --[[BuildingTemplate StorageConcrete description]] "Stores <concrete(max_storage_per_resource)>. Some resources will be transported to other depots within Drone range."),
			"pin_summary1", T(5035, --[[BuildingTemplate StorageConcrete pin_summary1]] "<concrete(Stored_Concrete)>"),	
			"display_icon", "UI/Icons/Buildings/concrete_storage.tga",
			"encyclopedia_id", "StorageConcrete",
			"encyclopedia_image", "UI/Encyclopedia/ConcreteDepot.tga",
			"entity", "Storage3xConcrete_C",
			"entity2","Storage3xConcrete_M",
			"storable_resources", {
				"Concrete",
			},
			"max_storage_per_resource", 330000, -- 330 due to increased size
			"max_x", 22,
			"instant_build", true,
			"build_points", 0,
			"dome_forbidden", true,			
			"on_off_button", false,
			"prio_button", false,
			"count_as_building", false,	
		})-- end Concrete Depot bt

		PlaceObj("ModItemBuildingTemplate", {
			"Id", "Storage3xElectronics",
			"template_class", "UniversalStorageDepot",
			"Group", "RD_DepotOCD_3Hex",
			"build_category", "RD_DepotOCD_3Hex",
			"build_pos", 7,	
			"display_name", T(5062, --[[BuildingTemplate StorageElectronics pin_summary1]] "<electronics(Stored_Electronics)>"),
			"display_name_pl", T(5063, --[[BuildingTemplate StorageElectronics display_name_pl]] "Electronics Depots"),
			"description", T(5064, --[[BuildingTemplate StorageElectronics description]] "Stores <electronics(max_storage_per_resource)>. Some resources will be transported to other depots within Drone range."),
			"pin_summary1", T(5061, --[[BuildingTemplate StorageElectronics pin_summary1]] "<electronics(Stored_Electronics)>"),
			"display_icon", "UI/Icons/Buildings/electronics_storage.tga",
			"encyclopedia_id", "StorageElectronics",
			"encyclopedia_image", "UI/Encyclopedia/ElectronicsDepot.tga",
			"entity", "Storage3xElec_C",
			"entity2","Storage3xElec_M",
			"storable_resources", {
				"Electronics",
			},
			"max_storage_per_resource", 330000, -- 330 due to increased size
			"max_x", 22,
			"instant_build", true,
			"build_points", 0,
			"dome_forbidden", true,			
			"on_off_button", false,
			"prio_button", false,
			"count_as_building", false,	
		})-- end Elec Depot bt

		PlaceObj("ModItemBuildingTemplate", {
			"Id", "Storage3xFood",
			"template_class", "UniversalStorageDepot",
			"Group", "RD_DepotOCD_3Hex",
			"build_category", "RD_DepotOCD_3Hex",
			"build_pos", 4,	
			"display_name", T(5071, --[[BuildingTemplate StorageFood display_name]] "Food Depot"),
			"display_name_pl", T(5072, --[[BuildingTemplate StorageFood display_name_pl]] "Food Depots"),
			"description", T(5073, --[[BuildingTemplate StorageFood description]] "Stores <food(max_storage_per_resource)>. Some resources will be transported to other depots within Drone range."),
			"pin_summary1", T(5070, --[[BuildingTemplate StorageFood pin_summary1]] "<food(Stored_Food)>"),
			"display_icon", "UI/Icons/Buildings/food_storage.tga",
			"encyclopedia_id", "StorageFood",
			"encyclopedia_image", "UI/Encyclopedia/FoodDepot.tga",
			"entity", "Storage3xFood_C",
			"entity2","Storage3xFood_M",
			"storable_resources", {
				"Food",
			},
			"max_storage_per_resource", 330000, -- 330 due to increased size
			"max_x", 22,
			"instant_build", true,
			"build_points", 0,
			"dome_forbidden", true,			
			"on_off_button", false,
			"prio_button", false,
			"count_as_building", false,	
		})-- end Food Depot bt

		PlaceObj("ModItemBuildingTemplate", {
			"Id", "Storage3xFuel",
			"template_class", "UniversalStorageDepot",
			"Group", "RD_DepotOCD_3Hex",
			"build_category", "RD_DepotOCD_3Hex",
			"build_pos", 9,	
			"display_name", T(5078, --[[BuildingTemplate StorageFuel display_name]] "Fuel Depot"),
			"display_name_pl", T(5079, --[[BuildingTemplate StorageFuel display_name_pl]] "Fuel Depots"),
			"description", T(5080, --[[BuildingTemplate StorageFuel description]] "Stores <fuel(max_storage_per_resource)>. Some resources will be transported to other depots within Drone range."),
			"pin_summary1", T(5077, --[[BuildingTemplate StorageFuel pin_summary1]] "<fuel(Stored_Fuel)>"),	
			"display_icon", "UI/Icons/Buildings/fuel_storage.tga",
			"encyclopedia_id", "StorageFuel",
			"encyclopedia_image", "UI/Encyclopedia/FuelDepot.tga",
			"entity", "Storage3xFuel_C",
			"entity2","Storage3xFuel_M",
			"storable_resources", {
				"Fuel",
			},
			"max_storage_per_resource", 330000, -- 330 due to increased size
			"max_x", 22,
			"instant_build", true,
			"build_points", 0,
			"dome_forbidden", true,			
			"on_off_button", false,
			"prio_button", false,
			"count_as_building", false,
		})-- end Fuel Depot bt

		PlaceObj("ModItemBuildingTemplate", {
			"Id", "Storage3xMachineParts",
			"template_class", "UniversalStorageDepot",
			"Group", "RD_DepotOCD_3Hex",
			"build_category", "RD_DepotOCD_3Hex",
			"build_pos", 8,	
			"display_name", T(5134, --[[BuildingTemplate StorageMachineParts display_name]] "MachineParts Depot"),
			"display_name_pl", T(5135, --[[BuildingTemplate StorageMachineParts display_name_pl]] "MachineParts Depots"),
			"description", T(5136, --[[BuildingTemplate StorageMachineParts description]] "Stores <machineparts(max_storage_per_resource)>. Some resources will be transported to other depots within Drone range."),
			"pin_summary1", T(5133, --[[BuildingTemplate StorageMachineParts pin_summary1]] "<machineparts(Stored_MachineParts)>"),	
			"display_icon", "UI/Icons/Buildings/machine_parts_storage.tga",
			"encyclopedia_id", "StorageMachineParts",
			"encyclopedia_image", "UI/Encyclopedia/MachinePartsDepot.tga",
			"entity", "Storage3xParts_C",
			"entity2","Storage3xParts_M",
			"storable_resources", {
				"MachineParts",
			},
			"max_storage_per_resource", 330000, -- 330 due to increased size
			"max_x", 22,
			"instant_build", true,
			"build_points", 0,
			"dome_forbidden", true,			
			"on_off_button", false,
			"prio_button", false,
			"count_as_building", false,	
		})-- end MachineParts Depot bt

		PlaceObj("ModItemBuildingTemplate", {
			"Id", "Storage3xMetals",
			"template_class", "UniversalStorageDepot",
			"Group", "RD_DepotOCD_3Hex",
			"build_category", "RD_DepotOCD_3Hex",
			"build_pos", 2,	
			"display_name", T(5162, --[[BuildingTemplate StorageMetals display_name]] "Metals Depot"),
			"display_name_pl", T(5163, --[[BuildingTemplate StorageMetals display_name_pl]] "Metals Depots"),
			"description", T(5164, --[[BuildingTemplate StorageMetals description]] "Stores <metals(max_storage_per_resource)>. Some resources will be transported to other depots within Drone range."),
			"pin_summary1", T(5161, --[[BuildingTemplate StorageMetals pin_summary1]] "<metals(Stored_Metals)>"),	
			"display_icon", "UI/Icons/Buildings/metal_storage.tga",
			"encyclopedia_id", "Storage3xMetals",
			"encyclopedia_image", "UI/Encyclopedia/MetalsDepot.tga",
			"encyclopedia_text","..",
			"entity", "Storage3xMetals_C",
			"entity2","Storage3xMetals_M",
			"storable_resources", {
				"Metals",
			},
			"max_storage_per_resource", 330000, -- 330 due to increased size
			"max_x", 22,
			"instant_build", true,
			"build_points", 0,
			"dome_forbidden", true,			
			"on_off_button", false,
			"prio_button", false,
			"count_as_building", false,	
		})-- end Metals Depot bt

		PlaceObj("ModItemBuildingTemplate", {
			"Id", "Storage3xMysteryResource",
			"template_class", "MysteryDepot",
			"Group", "RD_DepotOCD_3Hex",
			"build_category", "RD_DepotOCD_3Hex",
			"build_pos", 13,	
			"display_name", T(8112, --[[BuildingTemplate StorageMysteryResource display_name]] "Mystery Depot"),
			"display_name_pl", T(8112, --[[BuildingTemplate StorageMysteryResource display_name_pl]] "Mystery Depots"),
			"description", T(8113, --[[BuildingTemplate StorageMysteryResource description]] "It's very mysterious."),
			"pin_summary1", T(8111, --[[BuildingTemplate StorageMysteryResource pin_summary1]] "<mysteryresource(Stored_MysteryResource, MysteryResource)>"),	
			"display_icon", "UI/Icons/Buildings/mystery_resource_storage.tga",
			"encyclopedia_id", "StorageMysteryResource",
			"encyclopedia_image", "UI/Encyclopedia/MysteryResourceDepot.tga",
			"entity", "Storage3xMyst_C",
			"entity2","Storage3xMyst_M",
			"storable_resources", {
				"MysteryResource",
			},
			"max_storage_per_resource", 330000, -- 330 due to increased size
			"max_x", 22,
			"instant_build", true,
			"build_points", 0,
			"dome_forbidden", true,			
			"on_off_button", false,
			"prio_button", false,
			"count_as_building", false,	
		})-- end MysteryResource Depot bt

		PlaceObj("ModItemBuildingTemplate", {
			"Id", "Storage3xPolymers",
			"template_class", "UniversalStorageDepot",
			"Group", "RD_DepotOCD_3Hex",
			"build_category", "RD_DepotOCD_3Hex",
			"build_pos", 6,	
			"display_name", T(5202, --[[BuildingTemplate StoragePolymers display_name]] "Polymers Depot"),
			"display_name_pl", T(5203, --[[BuildingTemplate StoragePolymers display_name_pl]] "Polymers Depots"),
			"description", T(5204, --[[BuildingTemplate StoragePolymers description]] "Stores <polymers(max_storage_per_resource)>. Some resources will be transported to other depots within Drone range."),
			"pin_summary1", T(5201, --[[BuildingTemplate StoragePolymers pin_summary1]] "<polymers(Stored_Polymers)>"),	
			"display_icon", "UI/Icons/Buildings/polymers_storage.tga",
			"encyclopedia_id", "StoragePolymers",
			"encyclopedia_image", "UI/Encyclopedia/PolymersDepot.tga",
			"entity", "Storage3xPolymers_C",
			"entity2","Storage3xPolymers_M",
			"storable_resources", {
				"Polymers",
			},
			"max_storage_per_resource", 330000, -- 330 due to increased size
			"max_x", 22,
			"instant_build", true,
			"build_points", 0,
			"dome_forbidden", true,			
			"on_off_button", false,
			"prio_button", false,
			"count_as_building", false,	
		})-- end Polymers Depot bt

		PlaceObj("ModItemBuildingTemplate", {
			"Id", "Storage3xRares",
			"template_class", "UniversalStorageDepot",
			"Group", "RD_DepotOCD_3Hex",
			"build_category", "RD_DepotOCD_3Hex",
			"build_pos", 5,	
			"display_name", T(5226, --[[BuildingTemplate StorageRareMetals display_name]] "RareMetals Depot"),
			"display_name_pl", T(5227, --[[BuildingTemplate StorageRareMetals display_name_pl]] "RareMetals Depots"),
			"description", T(5228, --[[BuildingTemplate StorageRareMetals description]] "Stores <preciousmetals(max_storage_per_resource)>. Some resources will be transported to other depots within Drone range."),
			"pin_summary1", T(5225, --[[BuildingTemplate StorageRareMetals pin_summary1]] "<preciousmetals(Stored_PreciousMetals)>"),	
			"display_icon", "UI/Icons/Buildings/rare_metals_storage.tga",
			"encyclopedia_id", "StorageRareMetals",
			"encyclopedia_image", "UI/Encyclopedia/RareMetalsDepot.tga",
			"entity", "Storage3xRares_C",
			"entity2","Storage3xRares_M",
			"storable_resources", {
				"PreciousMetals",
			},
			"max_storage_per_resource", 330000, -- 330 due to increased size
			"max_x", 22,
			"instant_build", true,
			"build_points", 0,
			"dome_forbidden", true,			
			"on_off_button", false,
			"prio_button", false,
			"count_as_building", false,	
		})-- end Rares Depot bt

		local XT = XTemplates.ipBuilding[1][1]
		local LRTSidx = table.find(XT,"Id","ToggleLRTServiceButton")
		--inserting a new button to storage depots after the shuttle button, before salvage
		table.insert(XT,LRTSidx +1,	PlaceObj("XTemplateTemplate",{
			"comment", "RD Cycle depot button",
			"__template", "InfopanelButton",
			"__condition", function (parent, context) 
				---
				-- add to all storage depots but not rockets or the elevator ((universalDepots, depots, waste rock, black cube))
				if context:IsKindOfClasses("StorageDepot") and not context:IsKindOfClasses("SupplyRocket","SpaceElevator") then
					return context
				end
				---
			end,
			"Icon", ModDir .. "UI/RustyUniCycleLR.dds",
			"RolloverTitle", T("Cycle Depot"),
			"RolloverText", T("Click to cycle through your currently placed Depots of this type."),
			"RolloverHint", T("<left_click> Next <right_click> Previous "),
			"OnContextUpdate", function (self, context, ...)
				---
				local label = label or ""
				if self.context.storable_resources and #self.context.storable_resources >1 then
					label = "RD_DepotOCD_DepotType_Universal"
				else
					local type = self.context.resource[1] or self.context.resource
					label = "RD_DepotOCD_DepotType_" .. type
				end --end if resource type q
			
				local container = UICity.RD_DepotOCD_DepotLists[label]
				local idx = self.context and table.find(container, self.context) or 0

				self:SetRolloverText("Click to cycle through your currently placed Depots of this type.<newline>Current Location ;<right><color em>".. idx .. "</color> of <color em>" .. #container)
				---
			end,
			"OnPress", function (self, context, ...)
				---
				local flable = flable or ""
				if self.context.storable_resources and #self.context.storable_resources >1 then
					flable = "RD_DepotOCD_DepotType_Universal"
				else
					local type = self.context.resource[1] or self.context.resource
					flable = "RD_DepotOCD_DepotType_" .. type
				end --end if resource type q
				
				self.context:RD_DepotOCD_CycleDepots("NextDepot",flable, self.context)
				if RustyPrint then print ("You left clicked the cycle button.") end
				---
			end,
			"AltPress", true,
			"OnAltPress", function (self, context, ...)
				---
				local plable = plable or ""
				if self.context.storable_resources and #self.context.storable_resources >1 then
					plable = "RD_DepotOCD_DepotType_Universal"
				else
					local type = self.context.resource[1] or self.context.resource
					plable = "RD_DepotOCD_DepotType_" .. type
				end --end if resource type q
				
				self.context:RD_DepotOCD_CycleDepots("PrevDepot",plable,self.context)
				if RustyPrint then print ("You right clicked the cycle button.") end
				---
			end,
		}) )-- end cycle button	--end table.insert
		
		--overwriting ip for BlackCubes and WasteRock to make them look more like other storages :)
		XTemplates.customBlackCubeDumpSite = PlaceObj("XTemplate",{
			group = "Infopanel Sections",
			id = "customBlackCubeDump",
			__condition = function (parent,context)
				---
				if context.resource == "BlackCube" then
					return context
				end
				---
			end,

			PlaceObj("XTemplateTemplate",{
				"__context_of_kind", "BlackCubeDumpSite",
				"__template", "InfopanelSection",
				"comment","Rusty_Extra_Uni_Slots_Other",
				"Title", "Other Resources",
				"Icon","",
			}),-- end ip section header for "Other" Resources

			PlaceObj("XTemplateTemplate", {
				"__template", "InfopanelActiveSection",
				"Title", T("<resource('BlackCube')><right><blackcube(Stored_BlackCube, MaxAmount_BlackCube)>"),
				"RolloverTitle",T("BlackCube"),
				"RolloverText",T("Amount of resource stored here.<newline>Unable to toggle storage for this type of resource."),
				"Icon", ModDir .. "UI/resource_lock.dds",
				"TitleHAlign", "stretch",
				"OnContextUpdate", function (self, context, ...)
					self.idSectionTitle:SetTextStyle("InfopanelResourceAccept")
				end,
			}),-- end ip storage blackcubes
		})-- end ip cubes overwrite

		XTemplates.customWasteRockDumpSite = PlaceObj("XTemplate",{
			group = "Infopanel Sections",
			id = "customWasteRockDumpSite",
			__condition = function (parent,context)
				---
				if context.resource == "WasteRock" then
					return context
				end
				---
			end,

			PlaceObj("XTemplateTemplate", {
				"__context_of_kind", "WasteRockDumpSite",
				"__template", "InfopanelSection",
				"RolloverText", T(10461, --[[XTemplate customWasteRockDumpSite RolloverText]] "Drones and Shuttles will attempt to stockpile at least <DesiredAmountUI> of each resources stored here."),
				"RolloverHint", T(116367034467, --[[XTemplate customWasteRockDumpSite RolloverHint]] "<left_click> Set Desired Amount <newline><em>Ctrl + <left_click></em> Set Desired Amount in all <display_name_pl>"),
				"RolloverHintGamepad", T(10462, --[[XTemplate customWasteRockDumpSite RolloverHintGamepad]] "<LB> / <RB>    change desired amount"),
				"Title", T(10463, --[[XTemplate customWasteRockDumpSite Title]] "Desired Amount <DesiredAmountUI>"),
				"Icon", "UI/Icons/Sections/facility.tga",
			}, {
				PlaceObj("XTemplateTemplate", {
					"__template", "InfopanelSlider",
					"BindTo", "DesiredAmountSlider",
				}),--end ip slider
			}),--end ip slider section
		
			PlaceObj("XTemplateTemplate",{
				"__template", "InfopanelSection",
				"comment","Rusty_Extra_Uni_Slots_Other",
				"Title", "Other Resources",
				"Icon","",
			}),-- end ip section header for "Other" Resources

			PlaceObj("XTemplateTemplate", {
				"__template", "InfopanelActiveSection",
				"Title", T("<resource('WasteRock')><right><wasterock(Stored_WasteRock, MaxAmount_WasteRock)>"),
				"RolloverTitle",T("WasteRock"),
				"RolloverText",T("Amount of resource stored here.<newline>Unable to toggle storage for this type of resource."),
				"Icon", ModDir .. "UI/resource_lock.dds",
				"TitleHAlign", "stretch",
				"OnContextUpdate", function (self, context, ...)
					self.idSectionTitle:SetTextStyle("InfopanelResourceAccept")
				end,
			}),-- end ip storage waste rock
		})--end ip rock overwrite

		if RustyPrint then print ("Depot_OCD :: BT & IP Added for default resources") end

	end-- end if not BT -- added all default depots

	if IsDlcAvailable("armstrong") then
		if not BuildingTemplates.Storage3xSeeds then

			PlaceObj("ModItemBuildingTemplate", {
				"Id", "Storage3xSeeds",
				"template_class", "UniversalStorageDepot",
				"Group", "RD_DepotOCD_3Hex",
				"build_category", "RD_DepotOCD_3Hex",
				"build_pos", 11,	
				"display_name", T(710259377624, "Seeds Depot"),
				"display_name_pl", T(686258836140, "Seeds Depots"),
				"description", T(333579055417, "Stores <seeds(max_storage_per_resource)>. Some resources will be transported to other depots within Drone range."),
				"pin_summary1", T(851744359351, --[[BuildingTemplate StorageConcrete pin_summary1]] "<seeds(stored_seeds)>"),	
				"display_icon", "UI/Icons/Buildings/seeds_storage.tga",
				"encyclopedia_id", "StorageSeeds",
				"encyclopedia_image", "UI/Encyclopedia/SeedsDepot.tga",
				"entity", "Storage3xSeeds_C",
				"entity2","Storage3xSeeds_M",
				"storable_resources", {
					"Seeds",
				},
				"max_storage_per_resource", 330000, -- 330 due to increased size
				"max_x", 22,
				"instant_build", true,
				"build_points", 0,
				"dome_forbidden", true,			
				"on_off_button", false,
				"prio_button", false,
				"count_as_building", false,	
			})-- end Seeds Depot bt

			if RustyPrint then print ("Depot_OCD :: BT Added for DLC Green Planet resources") end
		end -- endif not bt -- DLC depot
	end -- end if DLC Q

	local LukesResQ = table.find(ModsLoaded, "id", "LH_Resources")
	if LukesResQ then

		local LukesPath = Mods.LH_Resources.env.CurrentModPath

		if not BuildingTemplates.Storage3xCrystals then
			PlaceObj("ModItemBuildingTemplate", {
				"Id", "Storage3xCrystals",
				"template_class", "UniversalStorageDepot",
				"Group", "RD_DepotOCD_3Hex",
				"build_category", "RD_DepotOCD_3Hex",
				"build_pos", 10,	
				"display_name", T("Crystals Depot"),
				"display_name_pl", T("Crystals Depots"),
				"description", T("Stores <crystals(max_storage_per_resource)>. Some resources will be transported to other depots within Drone range."),
				"pin_summary1", T("<crystals(Stored_Crystals)>"),	
				"display_icon", LukesPath .. "UI/Icons/Buildings/lh_crystals_storage.tga",
				"encyclopedia_id", "StorageCrystals",
				"encyclopedia_image", "UI/Encyclopedia/CrystalsDepot.tga",
				"entity", "Storage3xCrystal_C",
				"entity2","Storage3xCrystal_M",
				"storable_resources", {
					"Crystals",
				},
				"max_storage_per_resource", 330000, -- 330 due to increased size
				"max_x", 22,
				"instant_build", true,
				"build_points", 0,
				"dome_forbidden", true,			
				"on_off_button", false,
				"prio_button", false,
				"count_as_building", false,	
			})-- end Crystals Depot bt

			PlaceObj("ModItemBuildingTemplate", {
				"Id", "Storage3xRadioactive",
				"template_class", "UniversalStorageDepot",
				"Group", "RD_DepotOCD_3Hex",
				"build_category", "RD_DepotOCD_3Hex",
				"build_pos", 10,	
				"display_name", T("Radioactive Depot"),
				"display_name_pl", T("Radioactive Depots"),
				"description", T("Stores <radioactive(max_storage_per_resource)>. Some resources will be transported to other depots within Drone range."),
				"pin_summary1", T("<radioactive(Stored_Radioactive)>"),	
				"display_icon", LukesPath .. "UI/Icons/Buildings/lh_radioactive_storage.tga",
				"encyclopedia_id", "StorageRadioactive",
				"encyclopedia_image", "UI/Encyclopedia/RadioactiveDepot.tga",
				"entity", "Storage3xRad_C",
				"entity2","Storage3xRad_M",
				"storable_resources", {
					"Radioactive",
				},
				"max_storage_per_resource", 330000, -- 330 due to increased size
				"max_x", 22,
				"instant_build", true,
				"build_points", 0,
				"dome_forbidden", true,			
				"on_off_button", false,
				"prio_button", false,
				"count_as_building", false,	
			})-- end Radioactive Depot bt

			PlaceObj("ModItemBuildingTemplate", {
				"Id", "Storage3xBooze",
				"template_class", "UniversalStorageDepot",
				"Group", "RD_DepotOCD_3Hex",
				"build_category", "RD_DepotOCD_3Hex",
				"build_pos", 10,	
				"display_name", T("Booze Depot"),
				"display_name_pl", T("Booze Depots"),
				"description", T("Stores <booze(max_storage_per_resource)>. Some resources will be transported to other depots within Drone range."),
				"pin_summary1", T("<booze(Stored_Booze)>"),	
				"display_icon", LukesPath .. "UI/Icons/Buildings/lh_booze_storage.tga",
				"encyclopedia_id", "StorageBooze",
				"encyclopedia_image", "UI/Encyclopedia/BoozeDepot.tga",
				"entity", "Storage3xBooze_C",
				"entity2","Storage3xBooze_M",
				"storable_resources", {
					"Booze",
				},
				"max_storage_per_resource", 330000, -- 330 due to increased size
				"max_x", 22,
				"instant_build", true,
				"build_points", 0,
				"dome_forbidden", true,			
				"on_off_button", false,
				"prio_button", false,
				"count_as_building", false,	
			})-- end Booze Depot bt

			PlaceObj("ModItemBuildingTemplate", {
				"Id", "Storage3xMeat",
				"template_class", "UniversalStorageDepot",
				"Group", "RD_DepotOCD_3Hex",
				"build_category", "RD_DepotOCD_3Hex",
				"build_pos", 10,	
				"display_name", T("Meat Depot"),
				"display_name_pl", T("Meat Depots"),
				"description", T("Stores <meat(max_storage_per_resource)>. Some resources will be transported to other depots within Drone range."),
				"pin_summary1", T("<meat(Stored_Meat)>"),	
				"display_icon", LukesPath .. "UI/Icons/Buildings/lh_meat_storage.tga",
				"encyclopedia_id", "StorageMeat",
				"encyclopedia_image", "UI/Encyclopedia/MeatDepot.tga",
				"entity", "Storage3xMeat_C",
				"entity2","Storage3xMeat_M",
				"storable_resources", {
					"Meat",
				},
				"max_storage_per_resource", 330000, -- 330 due to increased size
				"max_x", 22,
				"instant_build", true,
				"build_points", 0,
				"dome_forbidden", true,			
				"on_off_button", false,
				"prio_button", false,
				"count_as_building", false,	
			})-- end Meat Depot bt

			local XT = XTemplates.sectionStorage[2]
			local terra_idx = 12 -- base game index for the terraforming title, so we slot lukes new stuff before terraforming
			table.insert(XT,terra_idx, PlaceObj("XTemplateTemplate",{
				"__condition", function (parent, context) return context:DoesAcceptResource("Crystals") or context:DoesAcceptResource("Radioactive") end,
				"__template", "InfopanelSection",
				"RelativeFocusOrder", "",
				"Id","Rusty_Extra_Uni_Slots_Lukes",
				"Title", "Extended Resources",
				"Icon","",
			}))-- end ip section for Luke's Resources, end table.insert

			table.insert(XT,terra_idx +1, PlaceObj("XTemplateTemplate", {
				"__context", function (parent, context) return SubContext(context, {res = "Crystals"}) end,
				"__template", "sectionStorageRow",
				"Id","Rusty_Extra_Uni_Slots_Crystals",
				"Title", T("<resource(res)><right><resource(GetStoredAmount(res),GetMaxStorage(res),res)>"),
				"Icon", "UI/Icons/Sections/workshifts_active.tga",
				"TitleHAlign", "stretch",
			}))-- end ip storage crystals, end table.insert

			table.insert(XT,terra_idx +2, PlaceObj("XTemplateTemplate", {
				"__context", function (parent, context) return SubContext(context, {res = "Radioactive"}) end,
				"__template", "sectionStorageRow",
				"Id","Rusty_Extra_Uni_Slots_Rads",
				"Title", T("<resource(res)><right><resource(GetStoredAmount(res),GetMaxStorage(res),res)>"),
				"Icon", "UI/Icons/Sections/workshifts_active.tga",
				"TitleHAlign", "stretch",
			}))-- end ip storage rads, end table.insert

			table.insert(XT,terra_idx +3, PlaceObj("XTemplateTemplate", {
				"__context", function (parent, context) return SubContext(context, {res = "Booze"}) end,
				"__template", "sectionStorageRow",
				"Id","Rusty_Extra_Uni_Slots_Booze",
				"Title", T("<resource(res)><right><resource(GetStoredAmount(res),GetMaxStorage(res),res)>"),
				"Icon", "UI/Icons/Sections/workshifts_active.tga",
				"TitleHAlign", "stretch",
			}))-- end ip storage booze, end table.insert

			table.insert(XT,terra_idx +4, PlaceObj("XTemplateTemplate", {
				"__context", function (parent, context) return SubContext(context, {res = "Meat"}) end,
				"__template", "sectionStorageRow",
				"Id","Rusty_Extra_Uni_Slots_Meat",
				"Title", T("<resource(res)><right><resource(GetStoredAmount(res),GetMaxStorage(res),res)>"),
				"Icon", "UI/Icons/Sections/workshifts_active.tga",
				"TitleHAlign", "stretch",
			}))-- end ip storage rads, end table.insert

			if RustyPrint then print ("Depot_OCD :: BT & IP Added for Luke's Resources") end

		end-- end if not bt done, lukes

	end-- end lukes resources additional
	
end-- end on msg CPP

--[[ =========== Finish:: Depot OCD:: Add BT's and IP's ========== --]]

--[[ =========== Start:: Depot OCD:: Adjust Old BT's ========== --]]

function OnMsg.ModsReloaded()

		local bt = BuildingTemplates

		--[[ -- Decided to keep the 2 hex depots in case people want to use them
		bt.BlackCubeDump.build_category 			= nil
		bt.StorageConcrete.build_category 			= nil
		bt.StorageElectronics.build_category 		= nil
		bt.StorageFood.build_category 				= nil
		bt.StorageFuel.build_category 				= nil
		bt.StorageMachineParts.build_category 		= nil
		bt.StorageMetals 							= nil
		bt.StorageMysteryResource.build_category 	= nil
		bt.StoragePolymers.build_category 			= nil
		bt.StorageRareMetals.build_category 		= nil

		-- remove entirely lukes small depots from the buildmenu, not needed
		bt.LH_StorageCrystals 		= nil
		bt.LH_StorageRadioactive 	= nil
		--]]

		--move the Universal Depot into the "Old 2Hex" menu, clear it's shortcut
		bt.UniversalStorageDepot.build_category 	= "Depots"
		bt.UniversalStorageDepot.group			 	= "Depots"
		bt.UniversalStorageDepot.build_shortcut1	= nil

		-- remove lukes ip additionals - they clashes with mine, sorry Luke (but thanks for making em, super easy to find)!
		local idx = table.find(XTemplates.sectionStorage[2],"Crystals", true)
		if idx then
			table.remove(XTemplates.sectionStorage[2],idx)
		end

		local idx = table.find(XTemplates.sectionStorage[2],"Radioactive", true)
		if idx then
			table.remove(XTemplates.sectionStorage[2],idx)
		end

		local idx = table.find(XTemplates.sectionStorage[2],"Booze", true)
		if idx then
			table.remove(XTemplates.sectionStorage[2],idx)
		end

		local idx = table.find(XTemplates.sectionStorage[2],"Meat", true)
		if idx then
			table.remove(XTemplates.sectionStorage[2],idx)
		end

		if RustyPrint then print ("Depot_OCD :: Old Storage Templates Adjusted") end

end-- end on msg Mods Reload

--[[ =========== Finish:: Depot OCD:: Adjust Old BT's ========== --]]

--[[ =========== Start:: Depot OCD:: Define Class :: Mighty Morphin Universal Depot ========== --]]

--effectively a dummy class, but needed for correct initializations/sorting
DefineClass.Storage3x_UD = {
	__parents = { "UniversalStorageDepot" },
	properties = {	},
}

local function ConfigureUniversalStorage3xList(obj)

	local self = obj
	local LukesResQ = table.find(ModsLoaded, "id", "LH_Resources")
	
	if LukesResQ then
		self.storable_resources = {
			--[[ Slot 1, Right Outer 	]]	"Radioactive",
			--[[ Slot 2, Left Outer 	]]	"Concrete", 						
			--[[ Slot 3, Right Inner 	]]	"Crystals",
			--[[ Slot 4, Left Inner 	]]	"Food",
			--[[ Slot 5, Right Middle 	]]	"Fuel", 
			--[[ Slot 6, Left Middle 	]]	"PreciousMetals", 
			--[[ Slot 7, Right Center 	]]	"MachineParts", 
			--[[ Slot 8, Left Center 	]]	"Polymers", 
			--[[ Slot 9, Center 		]]	"Electronics", 
			--[[ Slot 10, Left Edge 	]]	"Metals", 
			--[[ Slot 11, Right Edge 	]]	--"Seeds",
			}
			-- Order from left to right: 10,2,4,6,8,9,7,5,3,1,(11)
		if RustyPrint then print ("Depot_OCD :: Sorting Universal Storage list :: Luke's Resources Detected") end
	else
		self.storable_resources = {
			--[[ Slot 1, Right Outer 	]]	"Fuel",
			--[[ Slot 2, Left Outer 	]]	"Metals", 						
			--[[ Slot 3, Right Inner 	]]	"MachineParts", 
			--[[ Slot 4, Left Inner 	]]	"Concrete",
			--[[ Slot 5, Right Middle 	]]	"Electronics", 
			--[[ Slot 6, Left Middle 	]]	"Food", 
			--[[ Slot 7, Right Center 	]]	"Polymers", 
			--[[ Slot 8, Left Center 	]]	"PreciousMetals", 
			--[[ Slot 9, Center 		]]	--"Seeds", 
			--[[ Slot 10, Left Edge 	]]	--"Crystals", 
			--[[ Slot 11, Right Edge 	]]	--"Radioactive", 
			}
			-- Order from left to right: (10),2,4,6,8,(9),7,5,3,1,(11)
		if RustyPrint then print("Depot_OCD :: Sorting Universal Storage list :: Base Game") end
	end

	--add seeds to the list if GP is active
	if IsDlcAvailable("armstrong") then
		local idx = #self.storable_resources
		self.storable_resources[idx +1] = "Seeds"
		if RustyPrint then print("Depot_OCD :: Sorting Universal Storage list :: Green Planet DLC Detected") end
	end

	if RustyPrint then print ("Depot_OCD :: 3hex Universal Storage loaded with options for ::\n",self.storable_resources) end
end

--configure the storage list on placement to ensure it is correct
function Storage3x_UD:Init()
	ConfigureUniversalStorage3xList(self)
end

--ensure we behave like a default Uni - helps to override Luke's placement overrides
local RD_DepotOCD_Vanilla_USDGI = UniversalStorageDepot.GameInit
function Storage3x_UD:GameInit()
	if RD_DepotOCD_Vanilla_USDGI then
		RD_DepotOCD_Vanilla_USDGI(self)
	end

	--reverse Luke's offset (if luke's res) for my USD
	local LukesResQ = table.find(ModsLoaded, "id", "LH_Resources")
	if LukesResQ then
		local len = #self.storable_resources
		for i = 1, len do
			local resource_name = self.storable_resources[i]
			local s_name = "Box" .. i
			if not self:HasSpot(s_name) and len == 1 and self:HasSpot("Box") then
				s_name = "Box"
			end
			
			self.placement_offset[resource_name] = GetEntitySpotPos(self:GetEntity(), self:GetSpotBeginIndex(s_name))
			
			local amount = (self.stockpiled_amount[resource_name] or 0)
			self:SetCount(amount, resource_name)
		end
	end
end

--[[ =========== Finish:: Depot OCD:: Define Class :: Mighty Morphin Universal Depot ========== --]]

--[[ =========== Start:: Depot OCD:: Functions to control custom label gathering ========== --]]

--func to create and store things in custom labels
local function AddToRustyLabels(obj,remove)
	
	local label = ""
	local l_all = "RD_DepotOCD_DepotType_All"
	-- rockets and elevators are not in my DEPOTS lists... .. 
	if obj:IsKindOfClasses("SupplyRocket","SpaceElevator") then
		return
	end

	if obj.storable_resources and #obj.storable_resources >1 then
		label = "RD_DepotOCD_DepotType_Universal"
	else
		local type = obj.resource[1] or obj.resource
		label = "RD_DepotOCD_DepotType_" .. type
	end --end if resource type q

	--UICity:AddToLabel(label,self)
	--if not in a city set up game yet, do nothing else
	if not UICity then
		return
	end

	if not UICity.RD_DepotOCD_DepotLists then
		UICity.RD_DepotOCD_DepotLists = {}
	end

	if not UICity.RD_DepotOCD_DepotLists[label] then
		UICity.RD_DepotOCD_DepotLists[label] = {}
	end

	if not UICity.RD_DepotOCD_DepotLists[l_all] then
		UICity.RD_DepotOCD_DepotLists[l_all] = {}
	end

	local idx = table.find (UICity.RD_DepotOCD_DepotLists[label], "handle", obj.handle)
	local idx_all = table.find (UICity.RD_DepotOCD_DepotLists[l_all], "handle", obj.handle)

	--add if its not there .... remove only if it is
	if not remove then
		if not idx then
			UICity.RD_DepotOCD_DepotLists[label][#UICity.RD_DepotOCD_DepotLists[label]+1] = obj
		end
		--added an all list to help with MCR options
		if not idx_all then
			UICity.RD_DepotOCD_DepotLists[l_all][#UICity.RD_DepotOCD_DepotLists[l_all]+1] = obj
			Msg("DepotOCDDepotAdded") --@@Msg fired when a new item is added to the depot list, used in MCR options script
		end

		if RustyPrint then print ("Depot_OCD:: Depot lists updated :: Depot Added") end
		
	else
		if idx then
			table.remove (UICity.RD_DepotOCD_DepotLists[label], idx)
			table.remove (UICity.RD_DepotOCD_DepotLists[l_all], idx_all)

			if RustyPrint then print ("Depot_OCD:: Depot lists updated :: Depot Removed") end
		end
		
	end
end

--default USD:GI stored earlier, up there... 
function UniversalStorageDepot:GameInit()
	if RD_DepotOCD_Vanilla_USDGI then
		RD_DepotOCD_Vanilla_USDGI(self)
	end
	AddToRustyLabels(self)
end

--ugh ffs BlackCubes, wtf are these things so awkward!! also works for waste rocks
-- game doesn't f'ing have a default GameInit so this kept breaking, forgot my if check, lesson learned
local RD_DepotOCD_Vanilla_DSWVPBGI = DumpSiteWithAttachedVisualPilesBase.GameInit 
function DumpSiteWithAttachedVisualPilesBase:GameInit()
	if RD_DepotOCD_Vanilla_DSWVPBGI then
		RD_DepotOCD_Vanilla_DSWVPBGI(self)
	end
	AddToRustyLabels(self)
end

local RD_DepotOCD_Vanilla_USDone = UniversalStorageDepot.Done
function UniversalStorageDepot:Done()
	if RD_DepotOCD_Vanilla_USDone then
		RD_DepotOCD_Vanilla_USDone(self)
	end

	AddToRustyLabels (self, true) -- remove from table
end

local RD_DepotOCD_Vanilla_DSWVPBDone = DumpSiteWithAttachedVisualPilesBase.Done
function DumpSiteWithAttachedVisualPilesBase:Done()
	if RD_DepotOCD_Vanilla_DSWVPBDone then
		RD_DepotOCD_Vanilla_DSWVPBDone(self)
	end

	AddToRustyLabels (self, true) -- remove from table
end

--func to loop through stuff on load/new game and add them to labels
local function UpdateDepotsListsForNonModdedLoadedGame()
	if not UICity then
		return
	end

	local lable = "RD_DepotOCD_DepotType_All"
	local list = UICity.RD_DepotOCD_DepotLists[label]
	if not list then

		local all_objs = MapGet(true, "StorageDepot", function(a) 
			return not a:IsKindOfClasses("SupplyRocket","SpaceElevator") 
			end )--end map get 

		for i,obj in ipairs(all_objs) do
			--this stops duplicates in the lists
			obj = SelectionPropagate(obj)

			AddToRustyLabels(obj)
		end
		
		if RustyPrint then print ("Depot_OCD:: Depot lists updated :: Loaded Game") end
	end
end

function OnMsg.CityStart()
	UpdateDepotsListsForNonModdedLoadedGame()
end

function OnMsg.LoadGame()
	UpdateDepotsListsForNonModdedLoadedGame()
end

--[[ =========== Finish:: Depot OCD:: Functions to control custom label gathering ========== --]]

--[[ =========== Start:: Depot OCD:: Functions to control vFX on selection ========== --]]

--for some reason they were silent on selection, this forces them to recognise their class
function OnMsg.SelectionAdded(obj, ...)

	if obj:IsKindOfClasses("UniversalStorageDepot") and not obj:IsKindOfClasses ("SupplyRocket","SpaceElevator") then
		obj.fx_actor_class = obj.class
		
		-- make the extra depot types all sound the same
		if obj.fx_actor_class == "Storage3x_UD" or obj.fx_actor_class == "MysteryDepot" or obj.fx_actor_class == "BlackCubeDumpSite" then
			obj.fx_actor_class = "UniversalStorageDepot"
		end

		--if RustyPrint then print ("Depot_OCD :: Forced a depot to squeal") end -- this just gets annoying real fast, I can HEAR them working 
	end
end

--[[ =========== Finish:: Depot OCD:: Functions to control vFX on selection ========== --]]

--[[ =========== Start:: Depot OCD:: Function to control new ip section ========== --]]

--new function added to all storage depots (yes this includes Rockets and Elevators).. the activator button only shows for actual depots though
function StorageDepot:RD_DepotOCD_CycleDepots(direction, list, obj)
	
	if obj:IsKindOfClasses("SupplyRocket","SpaceElevator") then
		return
	end

	-- grab the label and refer the correct container from activator button
	local container = UICity.RD_DepotOCD_DepotLists[list]

	--find where in the list the current depot is, default to 1 if not found
	local idx = table.find(container, "handle", obj.handle)
	if not idx then
		idx = 1
	end

	--add one or reset to one if past end of list
	if direction == "NextDepot" then
		idx = idx +1
		if idx > #container then
			idx = 1
		end
	--subtract one or jump to end of list if past beginning of list
	elseif direction == "PrevDepot" then
		idx = idx -1
		if idx == 0 then
			idx = #container or 1 -- or 1 catch in case #container is nil/false
		end
	end

	if RustyPrint then print ("Depot_OCD ::",direction,"direction clicked. Moved to index",idx,"of",#container) end

	--jump and view next/prev/new idx position, reset idx

	local objtoview = container[idx] or SelectedObj() -- or catch in case container is nil
	ViewAndSelectObject(objtoview)
	local idx = nil

end

--[[ =========== Start:: Depot OCD:: Function to control new ip section ========== --]]

--[[ =========== Finish:: Depot OCD:: Main Script ========== --]]
