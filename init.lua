dofile_once("data/scripts/lib/utilities.lua")
dofile_once("data/scripts/perks/perk.lua")


local function get_player()
	return EntityGetWithTag("player_unit")[1]
end


function give_perk(perk_name)
    local player = get_player()
	local x, y = EntityGetTransform(player)
	local perk = perk_spawn(x, y, perk_name)
	perk_pickup(perk, p, EntityGetName(perk), false, false)
end


function give_extras()
    print("tbd")
end


function OnPlayerSpawned(player_id)
    if ModSettingsGet("extras") == true then
        give_extras()
    end
end
