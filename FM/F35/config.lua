
-- total static spring force should probably be around 262525 N which corresponds to weight with internal fuel and no weapons.
-- No, because f14 is supposed to ride quite low on main gears

--F4  = 28055 9% leichter als F15 / F4 11% leichter als F14

front_static 				= 105000; --F-4B war = 97500; --F14=70000; F15=47500
main_static 				= 252394; --F14=8000; F15=202394  ******* Bei Schaden erhöhen

front_spring_factor 		= 35000;--F14=3823600; F15=990000
main_spring_factor 			= 55000;--F14=1757840;  F15=29370398 Federung einstellen ?

front_spring_factor_rate	= 2;--F14=2.5 	F18=9 		F15=2 -- höher = weicher ? 
main_spring_factor_rate 	= 3;--F14=5 	F18=1.5 	F15=3 -- höher = weicher ?

main_direct_damper 			= 25000;--F14=160000; F15=50000	/ kraft Hydraulikzylinder ausfahren
main_back_damper 			= 25000;--F14=160000; F15=25000	/ kraft Hydraulikzylinder einfahren 
														-- hat keinen einfluss auf schaden
front_direct_damper 		= 50000;--F14=152000, F15=50000	/ kraft Hydraulikzylinder ausfahren
front_back_damper 			= 60000;--F14=152000, F15=60000	/ kraft Hydraulikzylinder einfahren 

--front_damper_coeff 			= 20;--F14=20
--main_damper_coeff 			= 30;--F14=30

local mainGear = {
			-- nicht in F104 mass									= 80,
			wheel_radius							= 0.38, -- Ø 0.76 / 2
			-- nicht in F104 wheel_moment_of_inertia 				= 9,

			-- nicht in F104 yaw_limit	 							= 0.0,
			-- nicht in F104 self_attitude	 						= false,
			anti_skid_installed 					= true,
			
			crossover_locked_wheel_protection			= true, -- in F-104
			crossover_locked_wheel_protection_speed_min	= 18.0, -- in F-104
			anti_skid_improved							= true, -- in F-104
			anti_skid_gain								= 400.0, -- in F-104

			amortizer_max_length					= 0.443, --3D Modell
			amortizer_basic_length					= 0.443, --3D Modell
			amortizer_reduce_length					= 0.399, --Die Länge muss reduziert werden, sonst wird Kraft hinzugefügt.
			allowable_hard_contact_length			= 0.3,

			amortizer_spring_force_factor			= main_spring_factor,
			amortizer_spring_force_factor_rate		= main_spring_factor_rate,
			amortizer_static_force					= main_static,
			amortizer_direct_damper_force_factor	= main_direct_damper,
			amortizer_back_damper_force_factor		= main_back_damper,


			wheel_static_friction_factor			= 0.42 ,
			wheel_side_friction_factor				= 0.95 ,
			wheel_roll_friction_factor				= 0.067 ,
			wheel_glide_friction_factor				= 0.8 ,

			wheel_damage_force_factor				= 200,
			wheel_brake_moment_max					= 18000.0,
			wheel_kz_factor							= 0.52, -- in F-104
			noise_k									= 0.4, -- in F-104
			wheel_damage_speedX						= 115, --223 Knoten
			wheel_damage_delta_speedX				= 20,--
}

F35 = {
	center_of_mass		= {0.250  ,  -0.25,	   0},--x,y,z//Nach dem Modell per Augemaß :-) CG-X 0.288 CG-Y 0.055// Aktuelle-Values waren {0.755, -0.25, 0.0}// OLD-Values = center_of_mass		= {-0.288  ,  -0.55,	   0},
	moment_of_inertia 	= {33896, 189487, 1165661 , 7106},--Ix,Iy,Iz,Ixy
	zeroize_amortizers_before_collision_check = false,
	suspension 			= {
		{ -- NOSE WHEEL
			-- nicht in F104 mass									= 50.0,
			damage_element							= 83,
			wheel_axle_offset						= 0,
			self_attitude							= false,--true,
			yaw_limit								= math.rad(70.0),--F-104 math.rad(32.0),
			moment_limit							= 750.0, -- in F-104
			damper_coeff							= 300.0, -- in F-104
			filter_yaw								= false, -- in F-104

			amortizer_min_length					= 0.0,
			amortizer_max_length					= 0.405, -- 3D Modell
			amortizer_basic_length					= 0.405, -- 3D Modell
			amortizer_reduce_length					= 0.405,--0.365,
			allowable_hard_contact_length			= 1.0,

			amortizer_spring_force_factor			= front_spring_factor,
			amortizer_spring_force_factor_rate		= front_spring_factor_rate,
			amortizer_static_force					= front_static,
			amortizer_direct_damper_force_factor	= front_direct_damper,
			amortizer_back_damper_force_factor		= front_back_damper,


			anti_skid_installed 					= false,

			-- nicht in F104 wheel_moment_of_inertia 				= 7,
			wheel_radius							= 0.255,	-- Ø 0.51 / 2
			wheel_static_friction_factor			= 0.35 ,
			wheel_side_friction_factor				= 1.1,
			wheel_roll_friction_factor				= 0.06 ,
			wheel_glide_friction_factor				= 0.58 ,
			wheel_damage_force_factor				= 450,
			wheel_kz_factor							= 0.3, -- in F-104
			noise_k									= 1.0, -- in F-104
			wheel_damage_speedX						= 105.0,--neu
			wheel_damage_delta_speedX				= 15.0,--neu

			arg_post			= 0,
			arg_amortizer		= 1,
			arg_wheel_rotation	= 101,
			arg_wheel_damage	= 134,
		},
		{ -- LEFT WHEEL
			damage_element							= 84,
			-- nicht in F104 mass									= mainGear.mass,
			wheel_radius							= mainGear.wheel_radius,
			-- nicht in F104 wheel_moment_of_inertia 				= mainGear.wheel_moment_of_inertia,

			-- nicht in F104 yaw_limit	 							= mainGear.yaw_limit,
			-- nicht in F104 self_attitude	 						= mainGear.self_attitude,
			anti_skid_installed 					= mainGear.anti_skid_installed,
			
			crossover_locked_wheel_protection			= mainGear.crossover_locked_wheel_protection,
			crossover_locked_wheel_protection_wheel		= 2, -- in F-104
			crossover_locked_wheel_protection_speed_min	= mainGear.crossover_locked_wheel_protection_speed_min,
			anti_skid_improved							= mainGear.anti_skid_improved;
			anti_skid_gain								= mainGear.anti_skid_gain,

			amortizer_max_length					= mainGear.amortizer_max_length,
			amortizer_basic_length					= mainGear.amortizer_basic_length,
			amortizer_reduce_length					= mainGear.amortizer_reduce_length,
			allowable_hard_contact_length			= mainGear.allowable_hard_contact_length,

			amortizer_spring_force_factor			= mainGear.amortizer_spring_force_factor,
			amortizer_spring_force_factor_rate		= mainGear.amortizer_spring_force_factor_rate,
			amortizer_static_force					= mainGear.amortizer_static_force,
			amortizer_direct_damper_force_factor	= mainGear.amortizer_direct_damper_force_factor,
			amortizer_back_damper_force_factor		= mainGear.amortizer_back_damper_force_factor,

			wheel_static_friction_factor			= mainGear.wheel_static_friction_factor ,
			wheel_side_friction_factor				= mainGear.wheel_side_friction_factor,
			wheel_roll_friction_factor				= mainGear.wheel_roll_friction_factor,
			wheel_glide_friction_factor				= mainGear.wheel_glide_friction_factor,

			wheel_damage_force_factor				= mainGear.wheel_damage_force_factor,
			wheel_brake_moment_max					= mainGear.wheel_brake_moment_max,
			wheel_kz_factor							= mainGear.wheel_kz_factor, -- in F-104
			noise_k									= mainGear.noise_k, -- in F-104
			wheel_damage_speedX						= mainGear.wheel_damage_speedX,
			wheel_damage_delta_speedX				= mainGear.wheel_damage_delta_speedX,

			arg_post			= 5,
			arg_amortizer		= 6,
			arg_wheel_rotation	= 102,
			arg_wheel_damage	= 136,
		},
		{  -- RIGHT WHEEL
			damage_element							= 85,
			-- nicht in F104 mass									= mainGear.mass,
			wheel_radius							= mainGear.wheel_radius,
			-- nicht in F104 wheel_moment_of_inertia 				= mainGear.wheel_moment_of_inertia,

			-- nicht in F104 yaw_limit	 							= mainGear.yaw_limit,
			-- nicht in F104 self_attitude	 						= mainGear.self_attitude,
			anti_skid_installed 					= mainGear.anti_skid_installed,
			
			crossover_locked_wheel_protection			= mainGear.crossover_locked_wheel_protection,
			crossover_locked_wheel_protection_wheel		= 1, -- in F-104
			crossover_locked_wheel_protection_speed_min	= mainGear.crossover_locked_wheel_protection_speed_min,
			anti_skid_improved							= mainGear.anti_skid_improved;
			anti_skid_gain								= mainGear.anti_skid_gain,

			amortizer_max_length					= mainGear.amortizer_max_length,
			amortizer_basic_length					= mainGear.amortizer_basic_length,
			amortizer_reduce_length					= mainGear.amortizer_reduce_length,
			allowable_hard_contact_length			= mainGear.allowable_hard_contact_length,

			amortizer_spring_force_factor			= mainGear.amortizer_spring_force_factor,
			amortizer_spring_force_factor_rate		= mainGear.amortizer_spring_force_factor_rate,
			amortizer_static_force					= mainGear.amortizer_static_force,
			amortizer_direct_damper_force_factor	= mainGear.amortizer_direct_damper_force_factor,
			amortizer_back_damper_force_factor		= mainGear.amortizer_back_damper_force_factor,

			wheel_static_friction_factor			= mainGear.wheel_static_friction_factor ,
			wheel_side_friction_factor				= mainGear.wheel_side_friction_factor,
			wheel_roll_friction_factor				= mainGear.wheel_roll_friction_factor,
			wheel_glide_friction_factor				= mainGear.wheel_glide_friction_factor,

			wheel_damage_force_factor				= mainGear.wheel_damage_force_factor,
			wheel_brake_moment_max					= mainGear.wheel_brake_moment_max,
			wheel_kz_factor							= mainGear.wheel_kz_factor, -- in F-104
			noise_k									= mainGear.noise_k, -- in F-104
			wheel_damage_speedX						= mainGear.wheel_damage_speedX,
			wheel_damage_delta_speedX				= mainGear.wheel_damage_delta_speedX,

			arg_post			= 3,
			arg_amortizer		= 4,
			arg_wheel_rotation	= 103,
			arg_wheel_damage	= 135,
		},
	}, -- gears


disable_built_in_oxygen_system	= true,
--[[ ------------------------------------------------------------- ]]--
-- END -- this part of the file is not intended for an end-user editing

	-- FFB force multiplier
	ffbPitchK	= 0.65,
	ffbRollK	= 0.65,

	-- view shake amplitude
	minor_shake_ampl = 0.07,
	major_shake_ampl = 0.25,


-- view shake amplitude
cs_shakeAoA0 				=   10, -- shake0 start at AoA 17° NEW//NEW 13° // NEW 10
cs_shakeAoA1 				= 	14, -- shake1 start at AoA 19° NEW// NEW 16° // NEW 14
cs_shakeNy0 				= 	5.5, -- shake0 start bei 6,5 Gs NEW//NEW 5,5 Gs
cs_shakeNy1 				= 	6.5, -- shake1 start at 7,5 Gs NEW//NEW 6,5 Gs
cs_shakeAmpl 				=   0.7, -- shake amplitude NEW // NEW 0.7
cs_shakeFreq 				= 	3,--5, -- shake frequency NEW // NEW 5

-- debug
debugLine = "{M}:%1.3f {IAS}:%4.1f {AoA}:%2.1f {ny}:%2.1f {nx}:%1.2f {AoS}:%2.1f {mass}:%2.1f {Fy}:%2.1f {Fx}:%2.1f {wx}:%.1f {wy}:%.1f {wz}:%.1f {Vy}:%2.1f {dPsi}:%2.1f",
record_enabled = false,
}
