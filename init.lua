dofile_once("data/scripts/lib/utilities.lua") -- Noita's internal utilities
dofile_once("data/scripts/perks/perk.lua") -- Perk-related commands


local function get_player() -- outputs the player's entity ID
	return EntityGetWithTag("player_unit")[1]
end


function give_perk(perk_name)
	local player_id = get_player()
	local x, y = EntityGetTransform(player_id)
	local perk = perk_spawn(x, y, perk_name)
	perk_pickup(perk, player_id, EntityGetName(perk), false, false)
end


function give_extras() -- todo: something to check whether the player has the extras already
    give_perk("BLEED_SLIME") -- Slime Blood perk
end


function OnPlayerSpawned(player_id) -- called when the player spawns on both new game and continue
    if ModSettingsGet("extras") == true then
        give_extras()
    end
end
