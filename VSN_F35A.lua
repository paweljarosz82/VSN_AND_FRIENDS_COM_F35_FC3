
local tips 		= {
	{ CLSID = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}" ,arg_value = 0.0},--AIM-9M
	{ CLSID = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}" ,arg_value = 0.0},--AIM-9P
	{ CLSID = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}" ,arg_value = 0.0},--AIM-9X
	--{ CLSID = "{C8E06185-7CD6-4C90-959F-044679E90751}" ,arg_value = 0.0},--AIM-120B
	--{ CLSID = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}" ,arg_value = 0.0},--AIM-120C
	{ CLSID	= "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}" ,arg_value = 0.0}, --Smokewinder - red
	{ CLSID	= "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}" ,arg_value = 0.0}, --Smokewinder - green
	{ CLSID	= "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}" ,arg_value = 0.0}, --Smokewinder - blue
	{ CLSID	= "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}" ,arg_value = 0.0}, --Smokewinder - white
	{ CLSID	= "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}" ,arg_value = 0.0}, --Smokewinder - yellow
	{ CLSID = "{AIS_ASQ_T50}" ,arg_value = 0.0, attach_point_position = {0.30,  0.0,  0.0}},-- ACMI pod
}

local outboardleft 	= {
	{ CLSID = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}" ,arg_value = 0.7},--AIM-9M
	{ CLSID = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}" ,arg_value = 0.7},--AIM-9P
	{ CLSID = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}" ,arg_value = 0.0},--AIM-9X
	{ CLSID = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}" ,arg_value = 0.7},--AIM-120C
	--{ CLSID = "{C8E06185-7CD6-4C90-959F-044679E90751}" ,arg_value = 0.7},--AIM-120B
    --{ CLSID = "{51F9AAE5-964F-4D21-83FB-502E3BFE5F8A}" ,arg_value = 0.0},--GBU-10
	--{ CLSID = "{0D33DDAE-524F-4A4E-B5B8-621754FE3ADE}" ,arg_value = 0.0},--GBU-16
	--{ CLSID = "{34759BBC-AF1E-4AEE-A581-498FF7A6EBCE}" ,arg_value = 0.0},--GBU-24
	{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,arg_value = 0.0},--Mk-82
	{ CLSID = "{D5D51E24-348C-4702-96AF-97A714E72697}" ,arg_value = 0.0},--MMK82*2
	{ CLSID = "{7A44FF09-527C-4B7E-B42B-3F111CFE50FB}" ,arg_value = 0.0},--Mk-83
	--{ CLSID = "{18617C93-78E7-4359-A8CE-D754103EDF63}" ,arg_value = 0.0},--MK83*2
	--{ CLSID = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}" ,arg_value = 0.0},--Mk-84
	{ CLSID = "{5335D97A-35A5-4643-9D9B-026C75961E52}" ,arg_value = 0.0},--CBU-97
	{ CLSID = "{444BA8AE-82A7-4345-842E-76154EFCCA46}" ,arg_value = 0.0},-- AGM-65D LAU-117
	{ CLSID = "{F16A4DE0-116C-4A71-97F0-2CF85B0313EC}" ,arg_value = 0.0},-- AGM-65E LAU-117
	{ CLSID = "{69DC8AE7-8F77-427B-B8AA-B19D3F478B66}" ,arg_value = 0.0},-- AGM-65K LAU-117
	{ CLSID = "LAU_117_AGM_65G" ,arg_value = 0},-- AGM-65G
	{ CLSID = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C9C}" ,arg_value = 0.0},-- AGM-88C
	{ CLSID = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}" ,arg_value = 0.0},--GBU-12
	--{ CLSID = "{GBU-31}" ,arg_value = 0.0},--GBU-31
	--{ CLSID = "{GBU-38}" ,arg_value = 0.0},--GBU-38
    { CLSID = "{9BCC2A2B-5708-4860-B1F1-053A18442067}" ,arg_value = 0.0},--AGM-154C
	{ CLSID = "{CBU_103}" ,arg_value = 0.0},--CBU-103
	{ CLSID = "{CBU_105}" ,arg_value = 0.0},--CBU-105
	--{ CLSID = "{ee368869-c35a-486a-afe7-284beb7c5d52}" ,arg_value = 0.0},--AGM-114
	{ CLSID = "{AF42E6DF-9A60-46D8-A9A0-1708B241AADB}" ,arg_value = 0.0},--AGM-84E
}

local outboardright 	= {
	--{ CLSID = "<CLEAN>"
}

local inboard 	= {
	{ CLSID = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}" ,arg_value = 0.7},--AIM-9M
	{ CLSID = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}" ,arg_value = 0.7},--AIM-9P
	{ CLSID = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}" ,arg_value = 0.0},--AIM-9X
	{ CLSID = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}" ,arg_value = 0.7},--AIM-120C
	{ CLSID = "LAU-115_2*LAU-127_AIM-120C"				,arg_value = 0.7},	-- 2xAIM-120C
	--{ CLSID = "{C8E06185-7CD6-4C90-959F-044679E90751}" ,arg_value = 0.7},--AIM-120B
    { CLSID = "{51F9AAE5-964F-4D21-83FB-502E3BFE5F8A}" ,arg_value = 0.0},--GBU-10
	{ CLSID = "{0D33DDAE-524F-4A4E-B5B8-621754FE3ADE}" ,arg_value = 0.0},--GBU-16
	{ CLSID = "{34759BBC-AF1E-4AEE-A581-498FF7A6EBCE}" ,arg_value = 0.0},--GBU-24
	{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,arg_value = 0.0},--Mk-82
	{ CLSID = "{D5D51E24-348C-4702-96AF-97A714E72697}" ,arg_value = 0.0},--MMK82*2
	{ CLSID = "{7A44FF09-527C-4B7E-B42B-3F111CFE50FB}" ,arg_value = 0.0},--Mk-83
	{ CLSID = "{18617C93-78E7-4359-A8CE-D754103EDF63}" ,arg_value = 0.0},--MK83*2
	{ CLSID = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}" ,arg_value = 0.0},--Mk-84
	{ CLSID = "{5335D97A-35A5-4643-9D9B-026C75961E52}" ,arg_value = 0.0},--CBU-97
	{ CLSID = "{444BA8AE-82A7-4345-842E-76154EFCCA46}" ,arg_value = 0.0},-- AGM-65D LAU-117
	{ CLSID = "{F16A4DE0-116C-4A71-97F0-2CF85B0313EC}" ,arg_value = 0.0},-- AGM-65E LAU-117
	{ CLSID = "{69DC8AE7-8F77-427B-B8AA-B19D3F478B66}" ,arg_value = 0.0},-- AGM-65K LAU-117
	{ CLSID = "LAU_117_AGM_65G" ,arg_value = 0},-- AGM-65G
	{ CLSID = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C9C}" ,arg_value = 0.0},-- AGM-88C
	{ CLSID = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}" ,arg_value = 0.0},--GBU-12
	--{ CLSID = "{GBU-31}" ,arg_value = 0.0},--GBU-31
	--{ CLSID = "{GBU-38}" ,arg_value = 0.0},--GBU-38
    { CLSID = "{9BCC2A2B-5708-4860-B1F1-053A18442067}" ,arg_value = 0.0},--AGM-154C
	{ CLSID = "{CBU_103}" ,arg_value = 0.0},--CBU-103
	{ CLSID = "{CBU_105}" ,arg_value = 0.0},--CBU-105
	{ CLSID = "{ee368869-c35a-486a-afe7-284beb7c5d52}" ,arg_value = 0.0},--AGM-114
	{ CLSID = "{AF42E6DF-9A60-46D8-A9A0-1708B241AADB}" ,arg_value = 0.0},--AGM-84E
	{ CLSID = "{VSN_F35A_PTB}" ,arg_value = 0},--Fuel tank
}

local fuselageRear	= { --
	--{ CLSID = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}" ,arg_value = 0.0},--AIM-9M
	--{ CLSID = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}" ,arg_value = 0.0},--AIM-9P
	{ CLSID = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}" ,arg_value = 0.0},--AIM-120C
	{ CLSID = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}" ,arg_value = 0.5},--GBU-12
	{ CLSID = "{0D33DDAE-524F-4A4E-B5B8-621754FE3ADE}" ,arg_value = 0.8},--GBU-16
	{ CLSID = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}" ,arg_value = 1.0},--Mk-84
	--{ CLSID = "{GBU-31}" ,arg_value = 0.0},--GBU-31
	--{ CLSID = "{GBU-38}" ,arg_value = 0.0},--GBU-38
    { CLSID = "{9BCC2A2B-5708-4860-B1F1-053A18442067}" ,arg_value = 1.0},--AGM-154C
	{ CLSID = "{CBU_103}" ,arg_value = 0.7},--CBU-103
	{ CLSID = "{CBU_105}" ,arg_value = 0.7},--CBU-105
	{ CLSID = "{5335D97A-35A5-4643-9D9B-026C75961E52}" ,arg_value = 0.7},--CBU-97
	--{ CLSID = "{ee368869-c35a-486a-afe7-284beb7c5d52}" ,arg_value = 0.0},--AGM-114
	--{ CLSID = "{AF42E6DF-9A60-46D8-A9A0-1708B241AADB}" ,arg_value = 0.0},--AGM-84E
}

local fuselageFront	= {
	--{ CLSID = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}" ,arg_value = 0.0},--AIM-9M
	--{ CLSID = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}" ,arg_value = 0.0},--AIM-9P
	{ CLSID = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}" ,arg_value = 0.0},--AIM-120C
}

local centerline 	= {
	{ CLSID = "{INV-SMOKE-RED}"		,arg_value = 1,connector = "AFTERBURN_001"}, --Smoke - red
	{ CLSID = "{INV-SMOKE-GREEN}"	,arg_value = 1,connector = "AFTERBURN_001"}, --Smoke - green
	{ CLSID = "{INV-SMOKE-BLUE}"	,arg_value = 1,connector = "AFTERBURN_001"}, --Smoke - blue
	{ CLSID = "{INV-SMOKE-WHITE}"	,arg_value = 1,connector = "AFTERBURN_001"}, --Smoke - white
	{ CLSID = "{INV-SMOKE-YELLOW}"	,arg_value = 1,connector = "AFTERBURN_001"}, --Smoke - yellow	
	{ CLSID = "{INV-SMOKE-ORANGE}"	,arg_value = 1,connector = "AFTERBURN_001"}, --Smoke - orange
	--{ CLSID = "{VSN_Smoke_Black}"	,arg_value = 1,connector = "AFTERBURN_001"}, --Smoke - black
}

local ECM 			= { --AA
	--
}

local ELINT			= { --AA
	--
}


VSN_F35A =  {
      
		Name 			= 'VSN_F35A',--AG
		DisplayName		= _('F-35A Lightning'),--AG
        Picture 		= "VSN_F35A.png",
        Rate 			= "50",
        Shape			= "VSN_F35A",--AG	
        WorldID			=  WSTYPE_PLACEHOLDER, 
        
	shape_table_data 	= 
	{
		{
			file  	 	= 'VSN_F35A';--AG
			life  	 	= 20; -- lifebar
			vis   	 	= 3; -- visibility gain.
			desrt    	= 'VSN_F35A-oblomok'; -- Name of destroyed object file name
			fire  	 	= { 300, 2}; 			-- Fire on the ground after destoyed: 300sec 2m
			username	= 'VSN_F35A';--AG
			index       =  WSTYPE_PLACEHOLDER;
			classname   = "lLandPlane";
			positioning = "BYNORMAL";
		},
		{
			name  		= "VSN_F35A-oblomok";
			file  		= "VSN_F35A-oblomok";
			fire  		= { 240, 2};
		},
	},
	
	net_animation ={--Beschreibung der externen Animation 32 Animationen begrenzen
        --0, -- front gear
		2,  -- nose wheel steering
        --3, -- right gear
        --5, -- left gear
		--8, -- FoldableWings
        --9, -- right flap
        --10, -- left flap
        --11, -- right aileron
        --12, -- left aileron
		--13, -- right slat
		--14, -- left slat
        --15, -- right elevator
        --16, -- left elevator
        --17, -- rudder
        --21, -- SFM air brake
		22,  -- REFUEL BOOM
        --25, -- tail hook
		26, -- Bay Doors
		28, -- nachbrenner
		--29, -- nachbrenner
		--35, --	brakeshute
		--36, --	brakeshute
		--37, --	brakeshute
        --38, -- canopy
		89, -- Triebwerk
		--90, -- Triebwerk
		--85, -- launch_bar
		101, -- arg_wheel_rotation
		102, -- arg_wheel_rotation
		103, -- arg_wheel_rotation
		134, -- arg_wheel_damage
		135, -- arg_wheel_damage
		136, -- arg_wheel_damage
		182, -- air brake
        --190, -- left (red) navigation wing-tip light
        --191, -- right (green) navigation wing-tip light
        --192, -- tail (white) light
        --198, -- anticollision (flashing red) top light
        --199, -- anticollision (flashing red) bottom light
        --208, -- taxi light (white) right main gear door
		--209, -- taxi light (white) right main gear door
		--325, -- ENGINE FAN
		--404, -- VTOL
    },
	
	LandRWCategories = 
        {
        [1] = 
        {
			Name = "AircraftCarrier",
        },
        [2] = 
        {
            Name = "AircraftCarrier With Catapult",
        }, 
        [3] = 
        {
            Name = "AircraftCarrier With Tramplin",
        }, 
    }, -- end of LandRWCategories
        TakeOffRWCategories = 
        {
        [1] = 
        {
			Name = "AircraftCarrier",
        },
        [2] = 
        {
            Name = "AircraftCarrier With Catapult",
        }, 
        [3] = 
        {
            Name = "AircraftCarrier With Tramplin",
        }, 
    }, -- end of TakeOffRWCategories
	
	mapclasskey 		= "P0091000024",
	attribute  			= {wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER, "Fighters", "Refuelable", "Datalink", "Link16"},
	Categories= {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor",},
	
		M_empty						=	13290,	-- kg  with pilot and nose load, F35
		M_nominal					=	22471,	-- kg (Empty Plus Full Internal Fuel)
		M_max						=	31751,	-- kg (Maximum Take Off Weight)
		M_fuel_max					=	8278,	-- kg (Internal Fuel Only)
		H_max						=	16500,	-- m  (Maximum Operational Ceiling)
		average_fuel_consumption	=	0.222,
		CAS_min						=	55,		-- Minimum CAS speed (m/s) (for AI)
		V_opt						=	215,	-- Cruise speed (m/s) (for AI)
		V_take_off					=	61,		-- Take off speed in m/s (for AI)
		V_land						=	65,		-- Land speed in m/s (for AI)
		has_afteburner				=	true,
		has_speedbrake				=	true,
		radar_can_see_ground		=	true,

		nose_gear_pos 				                = {5.84, -2.40, 0},
	    nose_gear_amortizer_direct_stroke   		=  0,      -- down from nose_gear_pos !!!
	    nose_gear_amortizer_reversal_stroke  		=  -0.43,  -- up 
	    nose_gear_amortizer_normal_weight_stroke 	=  -0.215,   -- up 
	    nose_gear_wheel_diameter 	                =  0.754,  -- in m
	
	    main_gear_pos 						 	    = {-0.8, -2.17, 2.12}, -- {-0.714,	-1.309,	1.352}
	    main_gear_amortizer_direct_stroke	 	    =   0,     --  down from main_gear_pos !!!
	    main_gear_amortizer_reversal_stroke  	    =   -0.228, --  up 
	    main_gear_amortizer_normal_weight_stroke    =   -0.114,-- down from main_gear_pos
	    main_gear_wheel_diameter 				    =   0.972, --  in m

		AOA_take_off				=	0.16,	-- AoA in take off (for AI)
		stores_number				=	11,
		bank_angle_max				=	60,		-- Max bank angle (for AI)
		Ny_min						=	-3,		-- Min G (for AI)
		Ny_max						=	9,		-- Max G (for AI)
		V_max_sea_level				=	355,	-- Max speed at sea level in m/s (for AI)
		V_max_h						=	548.8,	-- Max speed at max altitude in m/s (for AI)
		wing_area					=	42.74,	-- wing area in m2
		thrust_sum_max				=	12746,	-- thrust in kgf (125kN)
		thrust_sum_ab				=	19476,	-- thrust in kgf (181kN)
		Vy_max						=	245,	-- Max climb speed in m/s (for AI)
		flaps_maneuver				=	1,
		Mach_max					=	1.6,	-- Max speed in Mach (for AI)
		range						=	2050,	-- Max range in km (for AI)
		RCS							=	0.001,		-- Radar Cross Section m2
		Ny_max_e					=	9,		-- Max G (for AI)
		detection_range_max			=	400,
		IR_emission_coeff			=	0.51,	-- Normal engine -- IR_emission_coeff = 1 is Su-27 without afterburner. It is reference.
		IR_emission_coeff_ab		=	1.5,		-- With afterburner
		tand_gear_max				=	3.73,--XX  1.732 FA18 3.73, 
		tanker_type					=	1,--F14=2/S33=4/ M29=0/S27=0/F15=1/ F16=1/To=0/F18=2/A10A=1/ M29K=4/F4=0/
		wing_span					=	10.7,--XX  wing spain in m
		wing_type 					= 	0,-- 0=FIXED_WING/ 1=VARIABLE_GEOMETRY/ 2=FOLDED_WING/ 3=ARIABLE_GEOMETRY_FOLDED
		length						=	15.7,
		height						=	4.39,--XX
		crew_size					=	1, --XX
		engines_count				=	1, --XX
		wing_tip_pos              	= 	{ -4.0,   0.74,   5.3}, 
		
		--EPLRS 						= true,--?
		TACAN_AA					= true,--?
		--launch_bar_connected_arg_value	= 0.85,
		
		mechanimations = {
        Door0 = {
            {Transition = {"Close", "Open"},  Sequence = {{C = {{"Arg", 38, "to", 0.9, "in", 9.0},},},}, Flags = {"Reversible"},},
            {Transition = {"Open", "Close"},  Sequence = {{C = {{"Arg", 38, "to", 0.0, "in", 6.0},},},}, Flags = {"Reversible", "StepsBackwards"},},
            {Transition = {"Any", "Bailout"}, Sequence = {{C = {{"JettisonCanopy", 0},},},},},
        },
		ServiceHatches = {--Parkposition
            {Transition = {"Close", "Open"}, Sequence = {{C = {{"PosType", 3}, {"Sleep", "for", 30.0}}}, {C = {{"Arg", 24, "set", 1.0}}}}},
            {Transition = {"Open", "Close"}, Sequence = {{C = {{"PosType", 6}, {"Sleep", "for", 5.0}}}, {C = {{"Arg", 24, "set", 0.0}}}}},
        },
    }, -- end of mechanimations
		
		engines_nozzles = 
		{
			[1] = 
			{
				pos = 	{-6.00, 0.66, 0}, 
				elevation	=	0,
				diameter	=	1.137,
				exhaust_length_ab	=	12.0,
				exhaust_length_ab_K	=	0.76,
				smokiness_level     = 	0.01, 
			}, -- end of [1]
		}, -- end of engines_nozzles
		crew_members = 
		{
			[1] = 
			{
				ejection_seat_name	=	58,
				pilot_name			= 	19,
				drop_canopy_name	=	"VSN_F35A-fonar";
				pos = 	{6.277,	1.198,	0},
			}, -- end of [1]
		}, -- end of crew_members
		brakeshute_name	=	0,--Mig29=3/Su27=4/
		is_tanker	=	false,
		air_refuel_receptacle_pos = 	{ -.015,   1.589,   0.00}, 
		fires_pos = 
		{
			[1] = 	{-0.707,	0.553,	-0.213},
			[2] = 	{-0.037,	0.285,	1.391},
			[3] = 	{-0.037,	0.285,	-1.391},
			[4] = 	{-0.82,	0.265,	2.774},
			[5] = 	{-0.82,	0.265,	-2.774},
			[6] = 	{-0.82,	0.255,	4.274},
			[7] = 	{-0.82,	0.255,	-4.274},
			[8] = 	{-5.003,	0.261,	0},
			[9] = 	{-5.003,	0.261,	0},
			[10] = 	{-0.707,	0.453,	1.036},
			[11] = 	{-0.707,	0.453,	-1.036},
		}, -- end of fires_pos
		
		effects_presets = {
			{effect = "OVERWING_VAPOR", file = current_mod_path.."/Effects/VSN_F35A_overwingVapor.lua"},
		},
		
		chaff_flare_dispenser = 
		{
			[1] = 
			{
				dir = 	{0,	-1,	0},
				pos = 	{-3.158,	-1.77,	-0.967},
			}, -- end of [1]
			[2] = 
			{
				dir = 	{0,	-1,	0},
				pos = 	{-3.158,	-1.77,	0.967},
			}, -- end of [2]
		}, -- end of chaff_flare_dispenser

        -- Countermeasures
passivCounterm 		= {
CMDS_Edit 			= true,
SingleChargeTotal 	= 240,
chaff 				= {default = 120, increment = 60, chargeSz = 1},
flare 				= {default = 120, increment = 60, chargeSz = 1}
 },
	
	
        CanopyGeometry 	= {
            azimuth 	= {-145.0, 145.0},-- pilot view horizontal (AI)
            elevation 	= {-50.0, 90.0}-- pilot view vertical (AI)
        },

Sensors = {
RADAR 	= "AN/APG-63",--F15
RWR 	= "Abstract RWR"--F15
},
Countermeasures = {
ECM 			= "AN/ALQ-135"--F15
},
	Failures = {
			{ id = 'asc', 		label = _('ASC'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'autopilot', label = _('AUTOPILOT'), enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'hydro',  	label = _('HYDRO'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'l_engine',  label = _('L-ENGINE'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'r_engine',  label = _('R-ENGINE'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'radar',  	label = _('RADAR'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		  --{ id = 'eos',  		label = _('EOS'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		  --{ id = 'helmet',  	label = _('HELMET'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'mlws',  	label = _('MLWS'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'rws',  		label = _('RWS'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'ecm',   	label = _('ECM'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'hud',  		label = _('HUD'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'mfd',  		label = _('MFD'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },		
	},
	HumanRadio = {
		frequency 		= 251.0,  -- Radio Freq
		editable 		= true,
		minFrequency	= 127.000,
		maxFrequency 	= 399.000,
		modulation 		= MODULATION_AM
	},

Guns =	{
		gun_mount("ADEN",--25-mm-GAU-22/A-Gatling-Kanone in LO-Behälter (bei der F-35A intern 180)
		{
			count = 180
		},
		{
			muzzle_pos				= {4.904,  0.239,-0.248},
			muzzle_pos_connector	= "Gun_point",
			ejector_pos_connector	= "Gun_extractor",
			ejector_dir 			= {-2,0,0},
		})
	},
	
ammo_type_default = 2, -- interface to set desired ammunition mix in ME (DCSCORE-1104)
ammo_type ={_("HEI High Explosive Incendiary"),
			_("CM Combat Mix"),
			_("AP Armor Piercing"),
			_("TP Target Practice"),
	},


	Pylons =     {

        pylon(1, 0, 0, 0, 0,
			{
				arg = 308,
				arg_value = 1,
				DisplayName = "1",
  				use_full_connector_position = true,
				connector = "Pylon1",
			},
			tips
		),
		pylon(2, 0, 0, 0, 0,
			{
				arg = 310,
				arg_value = 1,
				DisplayName = "2",
				use_full_connector_position = true,
				connector = "Pylon3",
			},
			outboardleft
		),
        pylon(3, 0, 0, 0, 0,
			{
				arg = 309,
				arg_value = 1,
				DisplayName = "3",
				use_full_connector_position = true,
				connector = "Pylon2",
			},
			inboard
		),
        pylon(4, 1, 0, 0, 0,
            {
				arg = 311,
				arg_value = 0,
				DisplayName = "4",
            	use_full_connector_position = true,
				connector = "Pylon4",
			},
			fuselageRear
		),
        pylon(5, 1, 0, 0, 0,
			{
				arg = 312,
				arg_value = 0,
				DisplayName = "5",
				use_full_connector_position = true,
				connector = "Pylon5",
			},
			fuselageFront
		),
        pylon(6, 2, 0, 0, 0,
			{
				arg = 313,
				arg_value = 0,
				DisplayName = "Smoke",
				use_full_connector_position = true,
				--connector = "Pylon6",
				connector = "AFTERBURN_001",
			},
			centerline
		),
		pylon(7, 1, 0, 0, 0,
			{
				arg = 314,
				arg_value = 0,
				DisplayName = "6",
				use_full_connector_position = true,
				connector = "Pylon7",
			},
			fuselageFront
		),
        pylon(8, 1, 0, 0, 0,
            {
				arg = 315,
				arg_value = 0,
				DisplayName = "7",
            	use_full_connector_position = true,
				connector = "Pylon8",
			},
			fuselageRear
		),
        pylon(9, 0, 0, 0, 0,
			{
				arg = 317,
				arg_value = 1,
				DisplayName = "8",
				use_full_connector_position = true,
				connector = "Pylon10",
			},
			inboard
		),
		pylon(10, 0, 0, 0, 0,
			{
				arg = 316,
				arg_value = 1,
				DisplayName = "9",
				use_full_connector_position = true,
				connector = "Pylon9",
			},
			outboardleft
		),
		pylon(11, 0, 0, 0, 0,
			{
				arg = 318,
				arg_value = 1,
				DisplayName = "10",
				use_full_connector_position = true,
				connector = "Pylon11",
			},
			tips
		),
		pylon(12, 2, 0, 0, 0,
			{
				DisplayName = "", --AA
				use_full_connector_position = true,
				connector = "disable",
			},
			ECM
		),
		pylon(13, 2, 0, 0, 0,
			{
				DisplayName = "", --AA
				use_full_connector_position = true,
				connector = "disable",
			},
			ELINT
		),
},
	
	Tasks = {
        aircraft_task(CAP),
     	aircraft_task(Escort),
        aircraft_task(FighterSweep),
		aircraft_task(Intercept),
		aircraft_task(Reconnaissance),
    	aircraft_task(GroundAttack),
     	aircraft_task(CAS),
        aircraft_task(AFAC),
	    aircraft_task(RunwayAttack),
--  	aircraft_task(AntishipStrike),
    },	
	DefaultTask = aircraft_task(CAS),

	SFM_Data = {
	aerodynamics = --F35 eb
		{
			Cy0			=	0,
			Mzalfa		=	6,
			Mzalfadt	=	1,
			kjx 		= 2.99,
			kjz 		= 0.00125,
			Czbe 		= -0.016,
			cx_gear 	= 0.0225,
			cx_flap 	= 0.04,
			cy_flap 	= 0.25,
			cx_brk 		= 0.06,
			table_data = 
			{
			--      M	 Cx0		 Cya		 B		 B4	      Omxmax	Aldop	Cymax
				{0.0,	0.0205,		0.055,		0.08,		0.22,	0.65,	25.0,	1.2 	},
				{0.2,	0.0205,		0.055,		0.08,		0.22,	1.80,	25.0,	1.2     },
				{0.4,	0.0205,		0.055,		0.08,	   	0.22,	3.00,	25.0,	1.2     },
				{0.6,	0.0205,		0.055,		0.05,		0.28,	4.20,	25.0,	1.2     },
				{0.7,	0.0205,		0.055,		0.05,		0.28,	4.20,	23.0,	1.15    },
				{0.8,	0.0205,		0.055,		0.05,		0.28,	4.20,	21.7,	1.1     },
				{0.9,	0.0220,		0.058,		0.09,		0.20,	4.20,	20.1,	1.07    },
				{1.0,	0.0300,		0.062,		0.17,		0.15,	4.20,	18.9,	1.04    },
				{1.1,	0.0395,		0.062,	   	0.235,		0.09,	3.78,	17.4,	1.02    },
				{1.2,	0.0430,		0.062,	   	0.285,		0.08,	2.94,	17.0,	1.00 	},		
				{1.3,	0.0450,		0.06,	   	0.29,		0.10,	2.10,	16.0,	0.92 	},				
				{1.4,	0.0470,		0.056,	   	0.3,		0.136,	1.80,	15.0,	0.80 	},					
				{1.6,	0.0470,		0.052,	   	0.34,		0.21,	1.08,	13.0,	0.7 	},					
				{1.8,	0.0490,		0.042,	   	0.34,		2.43,	0.96,	12.0,	0.55 	},		
				{2.2,	0.0495,		0.037,	   	0.49,		3.5,	0.84,	 10.0,	0.37 	},					
				{2.5,	0.0499,		0.033,		0.6,		4.7,	0.84,	 9.0,	0.3 	},		
				{3.9,	0.0499,		0.023,		0.9,		6.0,	0.84,	 7.0,	0.2		},
			}, -- end of table_data
		}, -- end of aerodynamics
		engine = 
		{
			Nmg	=	67.5,
			MinRUD	=	0,
			MaxRUD	=	1,
			MaksRUD	=	0.85,
			ForsRUD	=	0.91,
			type	=	"TurboJet",
			hMaxEng	=	19.5,
			dcx_eng	=	0.0114,
			cemax	=	1.24,
			cefor	=	2.56,
			dpdh_m	=	6000,
			dpdh_f	=	14000.0,
			table_data = {
			--   M		Pmax		 Pfor
				{0.0,	125000,		191000},
				{0.2,	130225,		191712},
				{0.4,	141225,		193319},
				{0.6,	155225,		196819},
				{0.7,	162225,		201678},
				{0.8,	160225,		207454},
				{0.9,	152225,		222555},
				{1.0,	145225,		245222},
				{1.1,	132225,		255225},
				{1.2,	118225,		260225},
				{1.3,	105225,		262225},
				{1.4,	 82255,		265225},
				{1.6,	 52255,		267552},
				{1.8,	 31225,		245225},
				{2.2,	 23558,		132225},
				{2.5,	 23005,		79225},
				{3.9,	 23005,		25225},
			}, -- end of table_data
		}, -- end of engine
	},


	--damage , index meaning see in  Scripts\Aircrafts\_Common\Damage.lua
	Damage = {
	[0]  = {critical_damage = 5,  args = {146}},--NOSE_CENTER
	[1]  = {critical_damage = 3,  args = {296}},--NOSE_LEFT_SIDE
	[2]  = {critical_damage = 3,  args = {297}},--NOSE_RIGHT_SIDE
	[3]  = {critical_damage = 8,  args = {65}}, --CABINA
	[4]  = {critical_damage = 2,  args = {298}},--CABIN_LEFT_SIDE
	[5]  = {critical_damage = 2,  args = {301}},--CABIN_RIGHT_SIDE
	[7]  = {critical_damage = 2,  args = {249}},--GUN
	[8]  = {critical_damage = 3,  args = {265}},--FRONT_GEAR_BOX
	[9]  = {critical_damage = 3,  args = {154}},--FUSELAGE_LEFT_SIDE
	[10] = {critical_damage = 3,  args = {153}},--FUSELAGE_RIGHT_SIDE
	[11] = {critical_damage = 1,  args = {167}},--ENGINE_L_IN
	[12] = {critical_damage = 1,  args = {161}},--ENGINE_R_IN
	[13] = {critical_damage = 2,  args = {169}},--MTG_L_BOTTOM
	[14] = {critical_damage = 2,  args = {163}},--MTG_R_BOTTOM
	[15] = {critical_damage = 2,  args = {267}},--LEFT_GEAR_BOX
	[16] = {critical_damage = 2,  args = {266}},--RIGHT_GEAR_BOX
	[17] = {critical_damage = 2,  args = {168}},--MTG_L  (ENGINE)
	[18] = {critical_damage = 2,  args = {162}},--MTG_R  (ENGINE)
	[20] = {critical_damage = 2,  args = {183}},--AIR_BRAKE_R
	[23] = {critical_damage = 5,  args = {223}},--WING_L_OUT
	[24] = {critical_damage = 5,  args = {213}},--WING_R_OUT
	[25] = {critical_damage = 2,  args = {226}},--ELERON_L
	[26] = {critical_damage = 2,  args = {216}},--ELERON_R
	[29] = {critical_damage = 5,  args = {224}, deps_cells = {23, 25}},--WING_L_CENTER
	[30] = {critical_damage = 5,  args = {214}, deps_cells = {24, 26}},--WING_R_CENTER
	[35] = {critical_damage = 6,  args = {225}, deps_cells = {23, 29, 25, 37}},--WING_L_IN
	[36] = {critical_damage = 6,  args = {215}, deps_cells = {24, 30, 26, 38}},--WING_R_IN
	[37] = {critical_damage = 2,  args = {228}},--FLAP_L
	[38] = {critical_damage = 2,  args = {218}},--FLAP_R
	[39] = {critical_damage = 2,  args = {244}, deps_cells = {53}},--FIN_L_TOP
	[40] = {critical_damage = 2,  args = {241}, deps_cells = {54}},--FIN_R_TOP
	[43] = {critical_damage = 2,  args = {243}, deps_cells = {39, 53}},--FIN_L_BOTTOM
	[44] = {critical_damage = 2,  args = {242}, deps_cells = {40, 54}},--FIN_R_BOTTOM
	[51] = {critical_damage = 2,  args = {240}},--ELEVATOR_L
	[52] = {critical_damage = 2,  args = {238}},--ELEVATOR_R
	[53] = {critical_damage = 2,  args = {248}},--RUDDER_L
	[54] = {critical_damage = 2,  args = {247}},--RUDDER_R
	[56] = {critical_damage = 2,  args = {158}},--TAIL_LEFT_SIDE
	[57] = {critical_damage = 2,  args = {157}},--TAIL_RIGHT_SIDE
	[59] = {critical_damage = 3,  args = {148}},--NOSE_BOTTOM
	[61] = {critical_damage = 2,  args = {147}},--FUEL_TANK_F
	[82] = {critical_damage = 2,  args = {152}},--FUSELAGE_BOTTOM
	[83] = {critical_damage = 3,  args = {134}},--WHEEL_F
	[84] = {critical_damage = 3,  args = {136}},--WHEEL_L
	[85] = {critical_damage = 3,  args = {135}},--WHEEL_R
	},
	
	DamageParts = 
	{  
		[1] = "VSN_F35A-oblomok-wing-r", -- wing R
		[2] = "VSN_F35A-oblomok-wing-l", -- wing L
--		[3] = "VSN_F35A-oblomok-noise", -- nose
--		[4] = "VSN_F35A-oblomok-tail-r", -- tail
--		[5] = "VSN_F35A-oblomok-tail-l", -- tail
	},
	
-- VSN DCS World\Scripts\Aircrafts\_Common\Lights.lua

	lights_data = {
		typename = "collection",
		lights = {
			-- STROBES
			[WOLALIGHT_STROBES] = { 
					typename = "collection",
					lights = {
					--	{typename = "natostrobelight", argument = 193, period = 1.2, phase_shift = 0, color = {0.9, 1.0, 0.7, 0.4}, connector = "BANO_0_BACK"},
					--	{typename = "natostrobelight", argument = 193, period = 1.2, phase_shift = 0, color = {0.9, 1.0, 0.7, 0.4}, connector = "BANO_00_BACK"},
						{typename = "natostrobelight", argument = 193, period = 1.2, phase_shift = 0, color = {0.8, 0.0, 0.0, 0.4}, connector = "TOP_BEACON"},--rot
						{typename = "natostrobelight", argument = 193, period = 1.2, phase_shift = 0, color = {0.8, 0.0, 0.0, 0.4}, connector = "BOTTOM_BEACON"},--rot
					}
			},
			-- SPOTS
			[WOLALIGHT_LANDING_LIGHTS] = { 
					typename = "collection",
					lights = {
						{typename = "argumentlight", argument = 208, movable = true, },
					},
			},
			[WOLALIGHT_TAXI_LIGHTS] = { 
					typename = "collection",
					lights = {
						{typename = "argumentlight", argument = 209, movable = true, },
					},
			},
			[WOLALIGHT_NAVLIGHTS]= {	
					typename = "collection", -- nav_lights
					lights = {
						{typename = "argumentlight", argument = 190}, -- Left Position(red)
					--	controller = "Strobe", mode = 1, power_up_t = 0.3, cool_down_t = 0.6, period = 1.0, flash_time = 0.7,
						{typename = "argumentlight", argument = 191}, -- Right Position(green)
					--	controller = "Strobe", mode = 1, power_up_t = 0.3, cool_down_t = 0.6, period = 1.0, flash_time = 0.7,
					--	{typename = "argumentlight", argument = 192}, -- Tail Position white)
					},
			},
			[WOLALIGHT_FORMATION_LIGHTS] = { 
					typename = "collection",
					lights = {
						{typename = "argumentlight" ,argument = 200,},--formation_lights_tail_1 = 200;
						{typename = "argumentlight" ,argument =  88,},--old aircraft arg 
					},
			},
	[WOLALIGHT_REFUEL_LIGHTS]	= {},-- REFUEL
	[WOLALIGHT_BEACONS]	= {},-- STROBE / ANTI-COLLISION
	[WOLALIGHT_CABIN_NIGHT]	= {},--
	}},
}

add_aircraft(VSN_F35A) --AG
