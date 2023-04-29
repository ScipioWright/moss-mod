dofile_once("data/scripts/lib/utilities.lua") -- Noita's internal utilities
dofile_once("data/scripts/perks/perk.lua") -- Perk-related commands

ModMaterialsFileAdd("data/moss/materials.xml")

local function get_player() -- outputs the player's entity ID
	return EntityGetWithTag("player_unit")[1]
end


function give_perk(perk_name)
	local player_id = get_player()
	local x, y = EntityGetTransform(player_id)
	local perk = perk_spawn(x, y, perk_name)
	perk_pickup(perk, player_id, EntityGetName(perk), false, false)
end


function SlimyBlood(player_id) -- makes the blood very slimy
	local damage_model_comp = EntityGetFirstComponent(player_id, "DamageModelComponent")
	ComponentSetValue2(damage_model_comp, "blood_material", "moss_blood_fading")
	ComponentSetValue2(damage_model_comp, "blood_spray_material", "moss_blood")
end


function SlimyBloodAfterPerk(player_id)
	local damage_model_comp = EntityGetFirstComponent(player_id, "DamageModelComponent")
	ComponentSetValue2(damage_model_comp, "blood_material", "moss_blood_slime")
	ComponentSetValue2(damage_model_comp, "blood_spray_material", "moss_blood_slime")
	ComponentSetValue2(damage_model_comp, "blood_sprite_directional", "data/moss/bloodsplatters/bloodsplatter_directional_$[1-3].xml")
	ComponentSetValue2(damage_model_comp, "blood_sprite_large", "data/moss/bloodsplatters/bloodsplatter_$[1-3].xml")
end


function OnPlayerSpawned(player_id) -- called when the player spawns on both new game and continue
	if ModSettingGet("moss-mod.slimy_blood") == true then
		SlimyBlood(player_id)
	end
    if ModSettingGet("moss-mod.slime_perk") == true then
        give_perk("BLEED_SLIME") -- Slime Blood perk
		if ModSettingGet("moss-mod.slimy_blood") == true then
			SlimyBloodAfterPerk(player_id)
		end
    end
end
