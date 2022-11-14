dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path .."devices.lua")
--dofile(LockOn_Options.script_path .."Systems/weapon_system.lua")




--Brauchen wir die hier überhaupt oder läuft das schlicht über das Weapon-System????
--mal drüber nachdenken!!!
dev = GetSelf()
local update_time_step = 0.05 --update 20 times per second
make_default_activity(update_time_step)
local sensor_data = get_base_data()

-------Listen to those commands--------------
dev:listen_command(Keys.iCommandPlaneChangeWeapon)
dev:listen_command(Keys.iCommandPlaneModeBVR)
dev:listen_command(Keys.iCommandPlaneModeVS)
dev:listen_command(Keys.iCommandPlaneModeBore)
dev:listen_command(Keys.iCommandPlaneModeFI0)
dev:listen_command(Keys.iCommandPlaneModeGround)
dev:listen_command(Keys.iCommandPlaneModeCannon)
dev:listen_command(Keys.iCommandHUDBrightnessDown)
dev:listen_command(Keys.iCommandHUDBrightnessUp)

dev:listen_command(Keys.iCommandPlaneLeftMFD_OSB19)
dev:listen_command(Keys.iCommandPlaneLeftMFD_OSB20)

dev:listen_command(Keys.iCommandPlane_HOTAS_NoseWheelSteeringButtonOff) --NWS Steering toogle
dev:listen_command(Keys.iCommandPlaneLeftMFD_OSB14) -- BayDoor Toggle

---------------Params----------------------------
--[[
local Weapon_on_Station_One_Param				= get_param_handle("WEP_ON_PYLON_ONE")
local Weapon_on_Station_Two_Param				= get_param_handle("WEP_ON_PYLON_TWO")
local Weapon_on_Station_Three_Param				= get_param_handle("WEP_ON_PYLON_THREE")
local Weapon_on_Station_Four_Param				= get_param_handle("WEP_ON_PYLON_FOUR")
local Weapon_on_Station_Five_Param				= get_param_handle("WEP_ON_PYLON_FIVE")
local Weapon_on_Station_Six_Param				= get_param_handle("WEP_ON_PYLON_SIX")
local Weapon_on_Station_Seven_Param				= get_param_handle("WEP_ON_PYLON_SEVEN")
local Weapon_on_Station_Eight_Param				= get_param_handle("WEP_ON_PYLON_EIGHT")
local Weapon_on_Station_Nine_Param				= get_param_handle("WEP_ON_PYLON_NINE")
local Weapon_on_Station_Ten_Param				= get_param_handle("WEP_ON_PYLON_TEN")
local Weapon_on_Station_Eleven_Param			= get_param_handle("WEP_ON_PYLON_ELEVEN")
]]

local SYS_Hud_Brightness_Param					= get_param_handle("SYS_HUD_BRIGHTNESS")
local Nozzle_Tilt_Param							= get_param_handle("NOZZLE_TILT")
local BayDoor_Toggle_Param						= get_param_handle("BAY_DOORS")
local NoseWheel_Steering_Toggle_Param			= get_param_handle("NWS_TOGGLE")

local HUD_brightnes_selector	= 0.0
local Nozzle_Tilt				= 0.0

local nosewheel_button			= 0.0
local bay_doors					= 0.0

function keys_hud_bright_up(value)

	HUD_brightnes_selector = HUD_brightnes_selector + 0.1
	SYS_Hud_Brightness_Param:set(HUD_brightnes_selector)

end

function keys_hud_bright_down(value)

	HUD_brightnes_selector = HUD_brightnes_selector - 0.1
	SYS_Hud_Brightness_Param:set(HUD_brightnes_selector)
	
end

function keys_nozzle_step_down(value)

	if(Nozzle_Tilt <= 4) then
		Nozzle_Tilt = Nozzle_Tilt +1
		Nozzle_Tilt_Param:set(Nozzle_Tilt)
		--print_message_to_user("Nozzle is set at: " ..tostring(Nozzle_Tilt))
	else
		Nozzle_Tilt = 5
		Nozzle_Tilt_Param:set(Nozzle_Tilt)
		--print_message_to_user("Nozzle is set at 90°.")
	end

end

function keys_nozzle_step_up(value)

	if(Nozzle_Tilt >= 1) then
		Nozzle_Tilt = Nozzle_Tilt -1
		Nozzle_Tilt_Param:set(Nozzle_Tilt)
		--print_message_to_user("Nozzle is set at: " ..tostring(Nozzle_Tilt))
	else
		Nozzle_Tilt = 0
		Nozzle_Tilt_Param:set(Nozzle_Tilt)
		--print_message_to_user("Nozzle is set at 0°.")
	end

end


function keys_nosewheel_steering_toggle(value)

	if(nosewheel_button == 0.0) then
		nosewheel_button = 1.0
	else
		nosewheel_button = 0.0
	end
	
	NoseWheel_Steering_Toggle_Param:set(nosewheel_button)

end

function keys_bay_door_toggle(value)

	if(bay_doors == 0.0)then
		bay_doors = 1.0
	else
		bay_doors = 0.0
	end
	
	BayDoor_Toggle_Param:set(bay_doors)

end


command_table = {
    
	[Keys.iCommandHUDBrightnessDown]						=	keys_hud_bright_down,
	[Keys.iCommandHUDBrightnessUp]							=	keys_hud_bright_up,
	[Keys.iCommandPlaneLeftMFD_OSB19]						= 	keys_nozzle_step_down,
	[Keys.iCommandPlaneLeftMFD_OSB20]						=	keys_nozzle_step_up,
	[Keys.iCommandPlane_HOTAS_NoseWheelSteeringButtonOff]	= 	keys_nosewheel_steering_toggle,
	[Keys.iCommandPlaneLeftMFD_OSB14]						=	keys_bay_door_toggle,
	
	--[Keys.SetTargetRange_down]	= keys_set_target_range_down,
}

function SetCommand(command, value)

    if command_table[command] then
        command_table[command](value)
    end
end


function post_initialize()
    
	-----------------------------------------------------------------------------------
	--Das hier ist GOLD, da es ALLE aktuellen Params anzeigt mit Wert und Veränderung--
	--show_param_handles_list()
	-----------------------------------------------------------------------------------
	
	HUD_brightnes_selector	= 0.75
	SYS_Hud_Brightness_Param:set(HUD_brightnes_selector)

end


function update()

	

end

need_to_be_closed = false