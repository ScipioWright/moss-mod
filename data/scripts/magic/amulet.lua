dofile_once("data/scripts/lib/utilities.lua")

local entity_id = GetUpdatedEntityID()

if HasFlagPersistent( "secret_amulet" ) then
	EntitySetComponentsWithTagEnabled( entity_id, "player_amulet", true )
end

if HasFlagPersistent( "secret_amulet_gem" ) then
	EntitySetComponentsWithTagEnabled( entity_id, "player_amulet_gem", true )
end

if HasFlagPersistent( "secret_hat" ) then
	EntitySetComponentsWithTagEnabled( entity_id, "player_hat2", true )
end