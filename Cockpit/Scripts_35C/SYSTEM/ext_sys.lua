
dofile(LockOn_Options.script_path .. "command_defs.lua")
local dev = GetSelf()
local update_time_step = 0.02
make_default_activity(update_time_step)
local sensor_data = get_base_data()
--update = function()
function update()
local aoa = sensor_data:getAngleOfAttack()
local speed = sensor_data:getSelfVelocity()
local sas = sensor_data:getSelfAirspeed()
local tas = sensor_data:getTrueAirSpeed()
local ias = sensor_data:getIndicatedAirSpeed()
local mach = sensor_data:getMachNumber()
local vv = sensor_data:getVerticalVelocity()
local gforce = sensor_data:getVerticalAcceleration()
local balt = sensor_data:getBarometricAltitude()
local ralt = sensor_data:getRadarAltitude()
local pitch = sensor_data:getStickRollPosition() / 100--Parkposition
local roll = sensor_data:getStickPitchPosition() / 100--Parkposition
local rudder = sensor_data:getRudderPosition()  / 100--Parkposition
local throttle = sensor_data:getThrottleLeftPosition()
local gear = sensor_data:getLandingGearHandlePos()
local speedbrake = sensor_data:getSpeedBrakePos()
local rpm = sensor_data:getEngineLeftRPM()
local flaps = sensor_data:getFlapsPos()
local cpy_state = sensor_data:getCanopyState()
local cpy_pos = sensor_data:getCanopyPos()
local wown = sensor_data:getWOW_NoseLandingGear()
local wowl = sensor_data:getWOW_LeftMainLandingGear()
local wowr = sensor_data:getWOW_RightMainLandingGear()


------------------------------------------------------
-- Katapultstart TASTE ( U )
-- Lua ==> launch_bar_connected_arg_value	= 0.85,
------------------------------------------------------
local FRONT_GEAR = get_aircraft_draw_argument_value(0)
local Launsch_Bar = 0
  if FRONT_GEAR > 0 then
	Launsch_Bar = 1
  end
  if Launsch_Bar == 1 then
    set_aircraft_draw_argument_value(85, 0.85)
end
------------------------------------------------------

end

need_to_be_closed = false


