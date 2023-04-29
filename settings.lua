dofile("data/scripts/lib/mod_settings.lua")
dofile("data/scripts/lib/utilities.lua")


local mod_id = "moss-mod"
mod_settings_version = 1


local mod_settings = 
{
	{
		category_id = "group_of_settings",
		ui_name = "Moss Mod Settings",
		ui_description = "",
		settings = {
			{
				id = "slimy_blood",
				ui_name = "Slimy Blood",
				ui_description = "Turns your blood black. Acts as normal blood.",
				value_default = false,
				scope = MOD_SETTING_SCOPE_NEW_GAME,
			},
			{
				id = "slime_perk",
				ui_name = "Slime Blood Perk",
				ui_description = "Gives the Slime Blood perk on new game.",
				value_default = false,
				scope = MOD_SETTING_SCOPE_NEW_GAME,
			},
		},
	},
}


function ModSettingsUpdate( init_scope )
	local old_version = mod_settings_get_version( mod_id )
	mod_settings_update( mod_id, mod_settings, init_scope )
end


function ModSettingsGuiCount()
	return mod_settings_gui_count( mod_id, mod_settings )
end


function ModSettingsGui( gui, in_main_menu )
	mod_settings_gui( mod_id, mod_settings, gui, in_main_menu )
end
