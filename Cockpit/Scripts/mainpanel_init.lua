--shape_name   	   = "F100Cockpit.edm"
--is_EDM			   = true
--new_model_format   = true



external_model_canopy_arg	 = 38

use_external_views = false

local  aircraft = get_aircraft_type()

local controllers = LoRegisterPanelControls()

--[[
-----------AoA-Indexer------------------------------------------------------------
AOAindicationGauge 							= CreateGauge("parameter")
AOAindicationGauge.arg_number 				= 7
AOAindicationGauge.input 					= { -10.0, 0.0, 10.0, 20.0, 30.0, 36.0}
AOAindicationGauge.output 					= { -0.022, 0.213, 0.426, 0.640, 0.853, 1.0}
AOAindicationGauge.parameter_name 			= "AOA_INDICATOR"

---------G-Meter------------------------------------------------------------------
G_meterGauge 								= CreateGauge("parameter")
G_meterGauge.arg_number 					= 6
G_meterGauge.input 							= { -5.0, -4.0, -2.0, 0.0,  4.0, 8.0, 10.0} 
G_meterGauge.output 						= { 0.0, 0.05, 0.184, 0.324, 0.6, 0.860, 1.0}
G_meterGauge.parameter_name 				= "G_METER"

----------------------------------------------------------------------------------
-----------------Speed Indicators-------------------------------------------------
-----------------IAS in Knots-----------------------------------------------------
IAS_Indicator								= CreateGauge("parameter")
IAS_Indicator.arg_number 					= 8
IAS_Indicator.input 						= { 0.0, 100.0, 150.0, 200.0, 300.0, 400.0, 500.0, 550.0} 
IAS_Indicator.output 						= { 0.0, 0.176, 0.316, 0.492, 0.682, 0.823, 0.942, 1.0}
IAS_Indicator.parameter_name 				= "IAS_IN_KNOTS"

-----------------RPM-Meter------------------------------------------------------------------

RPM_Indicator_Left							= CreateGauge("parameter")
RPM_Indicator_Left.arg_number				= 16
RPM_Indicator_Left.input					= { 0.0, 1.0}
RPM_Indicator_Left.output					= { 0.0, 1.0}
RPM_Indicator_Left.parameter_name			= "RPM_ENGINE_LEFT"

---------Clock--------------------------------------------------------------------
ClockHourHand								= CreateGauge("parameter")
ClockHourHand.arg_number					= 19
ClockHourHand.input							= { 0.0, 3.0, 6.0, 9.0, 12.0}
ClockHourHand.output						= {0.0, 0.250, 0.50, 0.75, 1.0}
ClockHourHand.parameter_name				= "CLOCK_HOUR_HAND"

ClockMinuteHand								= CreateGauge("parameter")
ClockMinuteHand.arg_number					= 18
ClockMinuteHand.input						= {0.0, 5.0, 10.0, 15.0, 30.0, 45.0, 60.0}
ClockMinuteHand.output						= {0.0, 0.08, 0.16, 0.249, 0.5, 0.75, 1.0}

---------Radar Altimeter----------------------------------------------------------
RadAltimeterHunHand 				= CreateGauge("parameter")
RadAltimeterHunHand.arg_number		= 400
RadAltimeterHunHand.input 			= { 0.0, 500.0, 1000.0}
RadAltimeterHunHand.output 			= { 0.0, 0.5, 0.64}
RadAltimeterHunHand.parameter_name 	= "RAD_ALT_HUN_HAND"

RadAltimeterKHand					= CreateGauge("parameter")
RadAltimeterKHand.arg_number		= 401
RadAltimeterKHand.input				= {0.0, 5000.0, 10000.0, 50000.0}
RadAltimeterKHand.output			= {0.0, 0.5, 0.64, 0.80}
RadAltimeterKHand.parameter_name	= "RAD_ALT_K_HAND"

-------------Baro Altimeter----------------------------------------------------------
BaroAltimeterHunHand						= CreateGauge("parameter")
BaroAltimeterHunHand.arg_number				= 11
BaroAltimeterHunHand.input 					= { 0.0, 1.0}
BaroAltimeterHunHand.output 				= { 0.0, 1.0}
BaroAltimeterHunHand.parameter_name 		= "BARO_ALT_HUN_HAND"

BaroAltimeterK								= CreateGauge("parameter")
BaroAltimeterK.arg_number					= 415
BaroAltimeterK.input 						= { 0.0, 1.0}
BaroAltimeterK.output 						= { 0.0, 1.0}
BaroAltimeterK.parameter_name 				= "BARO_ALT_K_HAND"

BaroAltimeterTenK							= CreateGauge("parameter")
BaroAltimeterTenK.arg_number				= 416
BaroAltimeterTenK.input 					= { 0.0, 1.0}
BaroAltimeterTenK.output 					= { 0.0, 1.0}
BaroAltimeterTenK.parameter_name 			= "BARO_ALT_TenK_HAND"
-----------Armament Panel---------------------------------------------------------
ArmSelectorSwitch							= CreateGauge("parameter")
ArmSelectorSwitch.arg_number				= 651--abstimmen
ArmSelectorSwitch.input						= { 0, 1, 2, 3, 4, 5, 6, 7, 8}
ArmSelectorSwitch.output					= {0.0, 0.5, 1.0}
ArmSelectorSwitch.parameter_name			= "ARMAMENT_SELECTOR_SWITCH"
-----Pylon-Selectors and Light----------------------------------------------------
Pylon1SelectorAndLight1						= CreateGauge("parameter")
Pylon1SelectorAndLight1.arg_number			= 64
Pylon1SelectorAndLight1.input				= {0.0, 1.0}
Pylon1SelectorAndLight1.output				= {0.0, 1.0}
Pylon1SelectorAndLight1.parameter_name		= "PYLON_ONE_SELECTOR_LIGHT"

Pylon1SelectorAndLight2						= CreateGauge("parameter")
Pylon1SelectorAndLight2.arg_number			= 68
Pylon1SelectorAndLight2.input				= {0.0, 1.0}
Pylon1SelectorAndLight2.output				= {0.0, 1.0}
Pylon1SelectorAndLight2.parameter_name		= "PYLON_TWO_SELECTOR_LIGHT"

Pylon1SelectorAndLight3						= CreateGauge("parameter")
Pylon1SelectorAndLight3.arg_number			= 86
Pylon1SelectorAndLight3.input				= {0.0, 1.0}
Pylon1SelectorAndLight3.output				= {0.0, 1.0}
Pylon1SelectorAndLight3.parameter_name		= "PYLON_THREE_SELECTOR_LIGHT"

Pylon1SelectorAndLight4						= CreateGauge("parameter")
Pylon1SelectorAndLight4.arg_number			= 90
Pylon1SelectorAndLight4.input				= {0.0, 1.0}
Pylon1SelectorAndLight4.output				= {0.0, 1.0}
Pylon1SelectorAndLight4.parameter_name		= "PYLON_FOUR_SELECTOR_LIGHT"
]]
need_to_be_closed = true -- schließt diese Lua nach der Initialisierung

-- RudderPedals						= CreateGauge()
-- RudderPedals.arg_number				= 500
-- RudderPedals.input					= {-100,100}
-- RudderPedals.output					= {-1,1}
-- RudderPedals.controller				= controllers.base_gauge_RudderPosition

-- StickPitch							= CreateGauge()
-- StickPitch.arg_number				= 1001
-- StickPitch.input					= {-100, 100}
-- StickPitch.output					= {-1, 1}
-- StickPitch.controller				= controllers.base_gauge_StickRollPosition

-- StickRoll							= CreateGauge()
-- StickRoll.arg_number				= 1002
-- StickRoll.input						= {-100, 100}
-- StickRoll.output					= {-1, 1}
-- StickRoll.controller				= controllers.base_gauge_StickPitchPosition

-- ThrottleL							= CreateGauge()
-- ThrottleL.arg_number				= 104
-- ThrottleL.input						= {0, 100}
-- ThrottleL.output					= {0, 1}
-- ThrottleL.controller				= controllers.base_gauge_ThrottleLeftPosition

-- ThrottleR							= CreateGauge()
-- ThrottleR.arg_number				= 105
-- ThrottleR.input						= {0, 100}
-- ThrottleR.output					= {0, 1}
-- ThrottleR.controller				= controllers.base_gauge_ThrottleRightPosition

-- mirrors_data = {
--     center_point          = {0.0,0.0,0}, 
--     width                 = 0.8, --integrated (keep in mind that mirrors can be none planar )
--     aspect                = 5.0,
--     rotation              = math.rad(-4);
--     animation_speed       = 4.0;
--     near_clip             = 0.1;
--     middle_clip           = 40;
--     far_clip              = 60000;
--     flaps                 = 
--     {
--         "PNT_MIRROR_CTR",
--         "PNT_L_MIRROR",
--         "PNT_R_MIRROR",
--     }
-- }
-- mirrors_draw                        = CreateGauge()
-- mirrors_draw.arg_number                = 1000
-- mirrors_draw.input                   = {0,1}
-- mirrors_draw.output                   = {1,0}
-- mirrors_draw.controller             = controllers.mirrors_draw
--need_to_be_closed = true
-- need_to_be_closed = false


