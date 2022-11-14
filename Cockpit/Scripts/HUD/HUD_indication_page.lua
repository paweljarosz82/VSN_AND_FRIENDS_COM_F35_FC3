dofile(LockOn_Options.script_path.."HUD/HUD_definitions.lua")
dofile(LockOn_Options.common_script_path .."elements_defs.lua")




--[[
-- alignment options:
--"RightBottom"
--"LeftTop"
--"RightTop"
--"LeftCenter"
--"RightCenter"
--"CenterBottom"
--"CenterTop"
--"CenterCenter"
--"LeftBottom"

========================================================================================================================================

--GUN_PIPPER.element_params 	= {"param_nr0","param_nr1","param_nr2"}

-- {"change_color_when_parameter_equal_to_number", param_nr, number, red, green, blue}
-- {"text_using_parameter", param_nr, format_nr}
-- {"move_left_right_using_parameter", param_nr, gain}
-- {"move_up_down_using_parameter", param_nr, gain}
-- {"opacity_using_parameter", param_nr}
-- {"rotate_using_parameter", param_nr, gain}
-- {"compare_parameters", param1_nr, param2_nr} -- if param1 == param2 then visible
-- {"parameter_in_range", param_nr, greaterthanvalue, lessthanvalue} -- if greaterthanvalue < param < lessthanvalue then visible
-- {"parameter_compare_with_number", param_nr, number} -- if param == number then visible
-- {"draw_argument_in_range", arg_nr, greaterthanvalue, lessthanvalue} -- if greaterthanvalue < arg < lessthanvalue then visible
-- {"line_object_set_point_using_parameters", point_nr, param_x, param_y, gain_x, gain_y} -- applies to ceSimpleLineObject at least


--]]

--local sensor_data 				= get_base_data() ---it is always a good idea to get_base_data :-)
-- this might not work since get_base_data() has to be updated every frame in a function update(). see hud device
 

----------Creation of parent-Element to "slave" the Gunpipper to-----------------------------------
local HUD_BASE 					= CreateElement "ceSimple"
HUD_BASE.name  					= create_guid_string()
HUD_BASE.init_pos				= {0.0, -0.0, 0.0}									--{0, -1.345,0}
--HUD_BASE.element_params     = {"MAINPOWER"}             
--HUD_BASE.controllers        = {{"parameter_in_range" ,0,0.9,1.1} }
AddHudElement(HUD_BASE)

-----------Finally, the Gunpipper built through the function/s in HUD_definitions.lua-----------------------------------------------------------
--[[
local GUN_PIPPER 				= create_HUD_texture(HUD_GUNPIPPER_TEXT, 0,0,1024,1024, 40.0) -- Alte Werte für SetScale(Meters): create_HUD_texture(HUD_GUNPIPPER_TEXT, 0,0,1024,1024, 0.022)
GUN_PIPPER.name					= create_guid_string()
GUN_PIPPER.init_pos				= {0.0, 0.00, 0.0} -- "{0.0, -0.005, 0.0}" passt gut :-) war zuvor {0.0, 0.0, 0.0} sollte aber {-links/+rechts, -runter/+hoch, +vor/-zurück}
GUN_PIPPER.parent_element		= HUD_BASE.name --mal auskommentiert
--									Param #0,        Param #1
GUN_PIPPER.element_params 		= {"GUNPIPPER_SIDE","GUNPIPPER_UPDOWN"}
--									  								Param #, Gain							Param #, Gain // Gain von 0,1 zu 1 wegen auto Gunpipper Test
GUN_PIPPER.controllers    		= {{"move_left_right_using_parameter", 0, 1.0}, {"move_up_down_using_parameter", 1, 1.0}}
AddHudElement(GUN_PIPPER)
]]
----------------Now to some Fonts----------------------------------------------------------------------------------------------------------------
--[[local Station_One_HUD_Indicator					= CreateElement "ceStringPoly"
Station_One_HUD_Indicator.name 					= create_guid_string()
Station_One_HUD_Indicator.parent_element		= HUD_BASE.name
Station_One_HUD_Indicator.material				= fonts["PeeJottFont_Green"]
Station_One_HUD_Indicator.init_pos 				= {-90.0, -200.0, -0.0}
Station_One_HUD_Indicator.alignment 			= "CenterCenter"
Station_One_HUD_Indicator.stringdefs 			= HUD_strdefs_digit
Station_One_HUD_Indicator.formats 				= {"%0.0f"}--{"%0.2f","%s"}
Station_One_HUD_Indicator.element_params 		= {"WEP_ON_PYLON_ONE","SYS_HUD_BRIGHTNESS"}
Station_One_HUD_Indicator.controllers 			= {{"text_using_parameter",0,0},{"parameter_in_range" ,0, 0, 3},{"opacity_using_parameter", 1}}
AddHudElement(Station_One_HUD_Indicator)

local Station_1_Indicator 		  		= add_text_hud("STATIONS", -0.0, -185.0, HUD_BASE, "PeeJottFont_Green", HUD_strdefs_text, "CenterCenter")
--Station_1_Indicator.element_params  	= {"WEP_ON_PYLON_ONE"}
--Station_1_Indicator.controllers     	= {{"parameter_in_range", 0, 0, 3} }
]]

local Nozzle_Pos_Indicator		  			= add_text_hud("NOZZLE POS", -80.0, -170.0, HUD_BASE, "PeeJottFont_Green", HUD_strdefs_text, "CenterCenter")

local Nozzle_Position_Number				= CreateElement "ceStringPoly"
Nozzle_Position_Number.name 				= create_guid_string()
Nozzle_Position_Number.parent_element		= HUD_BASE.name
Nozzle_Position_Number.material				= fonts["PeeJottFont_Green"]
Nozzle_Position_Number.init_pos 			= {-30.0, -170.0, -0.0}
Nozzle_Position_Number.alignment 			= "CenterCenter"
Nozzle_Position_Number.stringdefs 			= HUD_strdefs_text
Nozzle_Position_Number.formats 				= {"%0.0f"}--{"%0.2f","%s"}
Nozzle_Position_Number.element_params 		= {"NOZZLE_TILT","SYS_HUD_BRIGHTNESS"}
Nozzle_Position_Number.controllers 			= {{"text_using_parameter",0,0},{"parameter_in_range" ,0, -1, 7},{"opacity_using_parameter", 1}}
AddHudElement(Nozzle_Position_Number)

local BayDoor_Indicator			  			= add_text_hud("BAYDOORS", -80.0, -185.0, HUD_BASE, "PeeJottFont_Green", HUD_strdefs_text, "CenterCenter")

local BayDoorPositionOpen_Ind				= add_text_hud("OPEN", -20.0, -185.0, HUD_BASE, "PeeJottFont_Green", HUD_strdefs_text, "CenterCenter")
BayDoorPositionOpen_Ind.element_params		= {"BAY_DOORS"}
BayDoorPositionOpen_Ind.controllers			= {{"parameter_in_range", 0, 0, 2}, }

local BayDoorPositionClosed_Ind				= add_text_hud("CLOSED", -20.0, -185.0, HUD_BASE, "PeeJottFont_Green", HUD_strdefs_text, "CenterCenter")
BayDoorPositionClosed_Ind.element_params	= {"BAY_DOORS"}
BayDoorPositionClosed_Ind.controllers		= {{"parameter_in_range", 0, -1, 1}, }


local NWS_Indicator			  				= add_text_hud("NWS", 40.0, -170.0, HUD_BASE, "PeeJottFont_Green", HUD_strdefs_text, "CenterCenter")

local NWS_IndicatorActive					= add_text_hud("ON", 70.0, -170.0, HUD_BASE, "PeeJottFont_Green", HUD_strdefs_text, "CenterCenter")
NWS_IndicatorActive.element_params			= {"NWS_TOGGLE"}
NWS_IndicatorActive.controllers				= {{"parameter_in_range", 0, 0, 2}, }

local NWS_IndicatorInactive					= add_text_hud("OFF", 70.0, -170.0, HUD_BASE, "PeeJottFont_Green", HUD_strdefs_text, "CenterCenter")
NWS_IndicatorInactive.element_params		= {"NWS_TOGGLE"}
NWS_IndicatorInactive.controllers			= {{"parameter_in_range", 0, -1, 1}, }