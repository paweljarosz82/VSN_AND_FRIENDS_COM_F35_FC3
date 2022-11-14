self_ID = "VSN_F35"
declare_plugin(self_ID,
{
image     	 = "FC3.bmp",
installed 	 = true, -- if false that will be place holder , or advertising
dirName	  	 = current_mod_path,
displayName  = _("VSN_F35"),
developerName = _("VSN"),

fileMenuName = _("VSN_F35"),
update_id        = "VSN_F35",
version		 = "2.8.01",
state		 = "installed",
info		 = _("VSN F-35, Die Lockheed Martin F-35 Lightning II ist ein Tarnkappen-Mehrzweckkampfflugzeug, das aus dem Joint Strike Fighter-Programm (JSF) des US-Verteidigungsministeriums hervorgegangen ist. Sie soll in vielen westlichen Luftwaffen die F-16 Fighting Falcon oder noch aeltere Flugzeuge ersetzen, wobei die US Air Force weiterhin der mit Abstand groesste Abnehmer bleibt. Fuer sie ist es bereits das vierte beschaffte Tarnkappen-Muster; da die Vorgaenger F-117, B-2 und F-22 jedoch nicht exportiert wurden, ist es fuer die Partnerlaender das erste seiner Art. Das Kampfflugzeug wird in drei verschiedenen Varianten bereitgestellt. "),

Skins	=
	{
		{
		    name	= _("VSN_F35"),
			dir		= "Theme"
		},
	},
Missions =
	{
		{
			name		    = _("VSN_F35"),
			dir			    = "Missions",
  		},
	},
LogBook =
	{
		{
			name		= _("VSN_F35A"),
			type		= "VSN_F35A",
		},
		{
			name		= _("VSN_F35A_AG"),
			type		= "VSN_F35A_AG",
		},
		{
			name		= _("VSN_F35B"),
			type		= "VSN_F35B",
		},
		{
			name		= _("VSN_F35B_AG"),
			type		= "VSN_F35B_AG",
		},
		{
			name		= _("VSN_F35C"),
			type		= "VSN_F35C",
		},
		{
			name		= _("VSN_F35C_AG"),
			type		= "VSN_F35C_AG",
		},
	},	
		
InputProfiles =
	{
		["VSN_F35A"] = current_mod_path .. '/Input/VSN_F35A',
		["VSN_F35A_AG"] = current_mod_path .. '/Input/VSN_F35A_AG',
		["VSN_F35B"] = current_mod_path .. '/Input/VSN_F35B',
		["VSN_F35B_AG"] = current_mod_path .. '/Input/VSN_F35B_AG',
		["VSN_F35C"] = current_mod_path .. '/Input/VSN_F35C',
		["VSN_F35C_AG"] = current_mod_path .. '/Input/VSN_F35C_AG',
	},
binaries = {
"F35",
},	
})
----------------------------------------------------------------------------------------
mount_vfs_model_path	(current_mod_path.."/Shapes")
mount_vfs_liveries_path (current_mod_path.."/Liveries")
mount_vfs_texture_path  (current_mod_path.."/Textures/VSN_F35")
mount_vfs_texture_path  (current_mod_path.."/Textures/DEVRiM_DCS_SU-27_EnglishGrayCockpitMod")
-------------------------------------------------------------------------------------
local cfg_path = current_mod_path ..  "/FM/F35/config.lua"
dofile(cfg_path)
F35[1] 				= self_ID
F35[2] 				= 'F35'
F35.config_path 	= cfg_path
F35.old 			= 6
dofile(current_mod_path.."/LUA/Views_F15PitA.lua")
make_view_settings('VSN_F35A', ViewSettings, SnapViews)
--make_flyable('VSN_F35A',current_mod_path..'/Cockpit/KneeboardRight/',{nil, old = 6}, current_mod_path..'/comm.lua')--SFM
make_flyable('VSN_F35A',current_mod_path..'/Cockpit/Scripts/',F35, current_mod_path..'/comm.lua')--EFM
-------------------------------------------------------------------------------------
local cfg_path = current_mod_path ..  "/FM/F35/config.lua"
dofile(cfg_path)
F35[1] 				= self_ID
F35[2] 				= 'F35'
F35.config_path 	= cfg_path
F35.old 			= 54
dofile(current_mod_path.."/LUA/Views_su27PitA.lua")
make_view_settings('VSN_F35A_AG', ViewSettings, SnapViews)
--make_flyable('VSN_F35A_AG',current_mod_path..'/Cockpit/KneeboardRight/',{nil, old = 54}, current_mod_path..'/comm.lua')--SFM
make_flyable('VSN_F35A_AG',current_mod_path..'/Cockpit/Scripts/',F35, current_mod_path..'/comm.lua')--EFM
-------------------------------------------------------------------------------------
local cfg_path = current_mod_path ..  "/FM/F35/config.lua"
dofile(cfg_path)
F35[1] 				= self_ID
F35[2] 				= 'F35'
F35.config_path 	= cfg_path
F35.old 			= 6
dofile(current_mod_path.."/LUA/Views_F15PitB.lua")
make_view_settings('VSN_F35B', ViewSettings, SnapViews)
--make_flyable('VSN_F35B',current_mod_path..'/Cockpit/KneeboardRight/',{nil, old = 6}, current_mod_path..'/comm.lua')--SFM
make_flyable('VSN_F35B',current_mod_path..'/Cockpit/Scripts/',F35, current_mod_path..'/comm.lua')--EFM
-------------------------------------------------------------------------------------
local cfg_path = current_mod_path ..  "/FM/F35/config.lua"
dofile(cfg_path)
F35[1] 				= self_ID
F35[2] 				= 'F35'
F35.config_path 	= cfg_path
F35.old 			= 54
dofile(current_mod_path.."/LUA/Views_su27PitB.lua")
make_view_settings('VSN_F35B_AG', ViewSettings, SnapViews)
--make_flyable('VSN_F35B_AG',current_mod_path..'/Cockpit/KneeboardRight/',{nil, old = 54}, current_mod_path..'/comm.lua')--SFM
make_flyable('VSN_F35B_AG',current_mod_path..'/Cockpit/Scripts/',F35, current_mod_path..'/comm.lua')--EFM
-------------------------------------------------------------------------------------
local cfg_path = current_mod_path ..  "/FM/F35/config.lua"
dofile(cfg_path)
F35[1] 				= self_ID
F35[2] 				= 'F35'
F35.config_path 	= cfg_path
F35.old 			= 6
dofile(current_mod_path.."/LUA/Views_F15PitC.lua")
make_view_settings('VSN_F35C', ViewSettings, SnapViews)
--make_flyable('VSN_F35C',current_mod_path..'/Cockpit/KneeboardRight/',{nil, old = 6}, current_mod_path..'/comm.lua')--SFM
make_flyable('VSN_F35C',current_mod_path..'/Cockpit/Scripts/',F35, current_mod_path..'/comm.lua')--EFM
-------------------------------------------------------------------------------------
local cfg_path = current_mod_path ..  "/FM/F35/config.lua"
dofile(cfg_path)
F35[1] 				= self_ID
F35[2] 				= 'F35'
F35.config_path 	= cfg_path
F35.old 			= 54
dofile(current_mod_path.."/LUA/Views_su27PitC.lua")
make_view_settings('VSN_F35C_AG', ViewSettings, SnapViews)
--make_flyable('VSN_F35C_AG',current_mod_path..'/Cockpit/KneeboardRight/',{nil, old = 54}, current_mod_path..'/comm.lua')--SFM
make_flyable('VSN_F35C_AG',current_mod_path..'/Cockpit/Scripts/',F35, current_mod_path..'/comm.lua')--EFM
-------------------------------------------------------------------------------------
dofile(current_mod_path..'/VSN_F35A.lua')
dofile(current_mod_path..'/VSN_F35A_AG.lua')
dofile(current_mod_path..'/VSN_F35B.lua')
dofile(current_mod_path..'/VSN_F35B_AG.lua')
dofile(current_mod_path..'/VSN_F35C.lua')
dofile(current_mod_path..'/VSN_F35C_AG.lua')
dofile(current_mod_path.."/WEAPONS/Weapons.lua")
--dofile(current_mod_path.."/WEAPONS/Gunpod.lua") --mal zum Testen ob es was tut...
-------------------------------------------------------------------------------------
plugin_done()
