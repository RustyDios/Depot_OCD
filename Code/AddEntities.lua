--[[ =========== Start:: Depot_OCD:: Add Entities ========== --]]

local mod_name = "Depot_OCD"
local steamID = "1793460653"
-- local author = "RustyDios"
-- local version ="4"

--[[ =========== Start:: Add Entities ========== --]]

-- list of entities we're going to be adding
local entity_list = {
	"Storage3x",
	"Storage3xBooze_C",
	"Storage3xConcrete_C",
	"Storage3xCrystal_C",
	"Storage3xCubes_C",
	"Storage3xElec_C",
	"Storage3xFood_C",
	"Storage3xFuel_C",
	"Storage3xMeat_C",
	"Storage3xMetals_C",
	"Storage3xMyst_C",
	"Storage3xParts_C",
	"Storage3xPolymers_C",
	"Storage3xRad_C",
	"Storage3xRares_C",
	"Storage3xSeeds_C",
	"Storage3xBooze_M",
	"Storage3xConcrete_M",
	"Storage3xCrystal_M",
	"Storage3xCubes_M",
	"Storage3xElec_M",
	"Storage3xFood_M",
	"Storage3xFuel_M",
	"Storage3xMeat_M",
	"Storage3xMetals_M",
	"Storage3xMyst_M",
	"Storage3xParts_M",
	"Storage3xPolymers_M",
	"Storage3xRad_M",
	"Storage3xRares_M",
	"Storage3xSeeds_M",	
}
-- getting called a bunch, so make them local
local path_loc_str = CurrentModPath .. "Entities/%s.ent"
local mod = Mods.mod_name
local EntityData = EntityData
local EntityLoadEntities = EntityLoadEntities
local SetEntityFadeDistances = SetEntityFadeDistances

-- no sense in making a new one for each entity
local EntityDataTableTemplate = {
	category_Building = true,
	entity = {
		fade_category = "Never",
		material_type = "Metal",
	},
}

-- pretty much using what happens when you use ModItemEntity
local function AddEntity(name)
	EntityData[name] = EntityDataTableTemplate
	EntityLoadEntities[#EntityLoadEntities + 1] = {
		mod,
		name,
		path_loc_str:format(name)
	}
	SetEntityFadeDistances(name, -1, -1)
end

for i = 1, #entity_list do
	AddEntity(entity_list[i])
end
--[[ =========== Finish :: Depot_OCD :: Add Entities ========== --]]
