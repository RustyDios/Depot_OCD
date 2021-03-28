return PlaceObj('ModDef', {
	'title', "Depot_OCD",
	'description', "Compatible with Cernan Update (Space Race and Green Planet DLC's)\n\nDepot OCD: Giving you the choice of having all Depots as 3hexes long.\n\nEver get triggered by how a Universal Storage Depot is 3 Hexes long and the base plate of Warehouse Depots are 3 Hexes long BUT every other single storage depot is 2 Hexes ~ then this is a mod for you!\n\nCosts;\nFree to build and maintain, just like 2 hex depots.\n\nDue to the extra Hex worth of storage space all 3 hex depots can store a maximum of 330 resources, this is split into a maxium of 11 types at 30 each for a Universal Depot. This is actually proportional to the vanilla storage.\n\nSingle Resource Depots fill up from the right side so the icon is the last thing to be covered by the bottom layer. Universal depots stack from left to right in the same order as is displayed on the infopanel. There is now room and functionality on a Universal Depot for all  of LukeH's extra resources and single storage support for that mod is included.\n\nSupport is now included for Seeds single storage and if you own the Green Planet DLC, Seeds should slot into either the middle space of a Universal Storage Depot, or the end space if you also have LukeH's resources.\n\nDepots by default are colourised as per my companion mod (which is still required for the colourisation of 2 hex and Auto/Mechanised Storage Warehouses). I have included a mono- version of the 3 hex depots if that is your preference.\n\nCompatible with saved games. Previously built depots should still function perfectly fine. You can easily cycle through your depots using the InfoBar or the new infopanel button. I would also like to point out that the new 3 Hex Universal Depot should steal the 'U' keybinding assigned in the option menu to become the default, but if it doesn't it is your choice to assign it/ unlink the default game Universal Storage Depot.\n\nI have moved the old Universal Depot into the same sub menu as 2 hex depots and all the 3 hex depots have an entire new sub menu.\n\nBonus feature; The mod standardises the infopanel for all depots, including Waste Rock.\n\nBonus feature; As per a request from DreeseDatalink, Now has MCR options to adjust the amount of storage for all depots (including Waste Rock Dumps, but excluding Black Cube Depots). \nThese options are inspired by another mod and will likely conflict with that mod (or any mod doing similar), because the options adjust the same game values.\nThese options will allow a 2 hex depot to store upto 1,200, a 3 hex depot to store upto 2,200 and Universal Storage Depots to store upto 200 of each resource. Small Waste Rock dumps can store upto 2,100 and Large Waste Rock Dumps can store upto 5,700, I feel these values are in keeping with game balance. \n\nThe amazing MCR can be found here;\nhttps://steamcommunity.com/sharedfiles/filedetails/?id=1542863522\n\nThe inspiration for the Larger Depots MCR options can be found here;\nhttps://steamcommunity.com/sharedfiles/filedetails/?id=1525669914\n\nMy Coloured Depots companion mod can be found here;\nhttps://steamcommunity.com/sharedfiles/filedetails/?id=1575253675\n\nLukeH's extra resources mod can be found here;\nhttps://steamcommunity.com/sharedfiles/filedetails/?id=1742141295 \n\n Special Thanks to;\n Silva for creating the base Blender mesh file for me to texturize and implement\n 'The Surviving Mars Modders Discord' for always being on hand for help and support.\nSirMcKaby, Destroyer of Mods, from the discord group for catching bugs :)\n\nUpdate Notes; If you had built Hydrocarbon Depots prior to v3.2 they might show as a spinning white cube on Game Load, they should be safe to Salvage/remove.\n\nEnjoy!!",
	'image', "Thumbnail.jpg",
	'last_changes', "v3.5 \nFinally added storages for LukeH's Booze and Meat",
	'ignore_files', {
		"*.git/*",
		"*.svn/*",
		"*Preview*",
	},
	'id', "QSNGAQ2",
	'steam_id', "1793460653",
	'pops_desktop_uuid', "052756b8-4748-479f-9c54-e3ab62b1df7b",
	'pops_any_uuid', "e6c62583-08b5-42ff-a0d9-e90ea8b663da",
	'author', "RustyDios",
	'version_major', 3,
	'version_minor', 5,
	'version', 51,
	'lua_revision', 233360,
	'saved_with_revision', 249143,
	'code', {
		"Code/AddEntities.lua",
		"Code/MCR_Options.lua",
		"Code/Script.lua",
	},
	'saved', 1585205741,
	'TagGameplay', true,
	'TagBuildings', true,
	'TagCosmetics', true,
	'TagInterface', true,
	'TagOther', true,
})