start_custom_command   = 10000
local __count_custom = start_custom_command-1
local function __custom_counter()
	__count_custom = __count_custom + 1
	return __count_custom
end

Keys =
{
	iCommandPlaneFonar							= 71, --Canopy open/close
	iCommandPlaneWingtipSmokeOnOff 				= 78,
	iCommandPlaneJettisonWeapons 				= 82,
 	iCommandPlaneFire 							= 84,
	iCommandPlaneFireOff 						= 85,
	
	--Master-Modes FC3---------------------------------
	iCommandPlaneChangeWeapon 					= 101,
	iCommandPlaneModeNAV						= 105,
	iCommandPlaneModeBVR						= 106,
	iCommandPlaneModeVS							= 107,
	iCommandPlaneModeBore						= 108,
	iCommandPlaneModeFI0						= 110,
	iCommandPlaneModeGround						= 111,
	iCommandPlaneModeCannon						= 113,
	-------------------------Nozzle Movement-------------------------
	iCommandPlaneLeftMFD_OSB19					= 660, --nozzle step down
	iCommandPlaneLeftMFD_OSB20					= 661, --nozzle step up
	
	
	iCommandActiveJamming 						= 136,
	iCommandPlaneJettisonFuelTanks 				= 178,
	iCommandToggleCommandMenu					= 179,
	
	iCommandPlanePickleOn	 					= 350,
	iCommandPlanePickleOff 						= 351,
	
	iCommandHUDBrightnessUp						= 746,
	iCommandHUDBrightnessDown	                = 747,
	
	iCommandPlane_HOTAS_NoseWheelSteeringButtonOff = 606, --NWS-Button/Toggle
	iCommandPlaneLeftMFD_OSB14					= 655, --BayDoor Toggle
	-------------------Radio-COMMANDS----------------------------
	--COM1                     					= __custom_counter(),
    --COM2                    			 		= __custom_counter(),
    --COM3                     					= __custom_counter(),

	------------------WEAPON SYSTEM---------------------------------
	-----------------Launch, Fire, Release and Drop-----------------
	pickle_on 									= __custom_counter(),
	pickle_off 									= __custom_counter(),
	trigger_on									= __custom_counter(),
	trigger_off									= __custom_counter(),
	
	----------------Station Selection--------------------------------
	station_zero								= __custom_counter(),
	station_one									= __custom_counter(),
	station_two									= __custom_counter(),
	station_three								= __custom_counter(),
	station_four								= __custom_counter(),
	station_five								= __custom_counter(),
	station_six									= __custom_counter(),
	station_seven								= __custom_counter(),
	station_eight								= __custom_counter(),
	station_nine								= __custom_counter(),
	station_ten									= __custom_counter(),
	station_eleven								= __custom_counter(),
	
	change_station								= __custom_counter(),
	-----------------------------------------------------------------
	
	-----------------------------HUD--------------------------------
	--GunPipper_Up								= __custom_counter(),
	--GunPipper_Down								= __custom_counter(),
	--GunPipper_Right								= __custom_counter(),
	--GunPipper_Left								= __custom_counter(),
	--GunPipper_Center							= __custom_counter(),
	--GunPipper_Automatic							= __custom_counter(),
	--Gunpipper_Manual							= __custom_counter(),
	--SetTargetRange_up							= __custom_counter(),
	--SetTargetRange_down							= __custom_counter(),
	-----------------Arm-Selector-Switch-----------------------------
	--armament_selector_toggle					= __custom_counter(),
	-----------------Bomb-Arm-Selector Switch-------------------------
	--bomb_armament_selector_toggle				= __custom_counter(),
	-----------------Bomb-RP Selector Switch--------------------------
	--bomb_rp_selector_toggle						= __custom_counter(),
	------------------Rocket-Selector-Switch-------------------------
	--rocket_switch_tgl							= __custom_counter(),
	--------------------------GUN Switch------------------------------
	--gun_switch_tgl								= __custom_counter(),
}
start_command   = 3000
local __count = start_command-1
local function __counter()
	__count = __count + 1
	return __count
end

device_commands = {

    
}

