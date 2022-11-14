dofile(LockOn_Options.common_script_path.."elements_defs.lua")
dofile(LockOn_Options.common_script_path.."Fonts/symbols_locale.lua")
dofile(LockOn_Options.common_script_path.."Fonts/fonts_cmn.lua")

local HUD_TEXTURES_PATH      = LockOn_Options.script_path .. "Textures/" 
local IND_FONT_PATH			 = LockOn_Options.script_path.."Fonts/"

stringdefs = {0.012,0.75 * 0.012, 0, 0}
HUD_strdefs_text  = {0.007, 0.007, 0, 0}
HUD_strdefs_digit = {0.007, 0.007, 0, 0}
 
--SetScale(METERS) --das setzt eine Betrachtungsweise/Scala für die Maßangaben. Anderer Möglichkeiten in (FOV) oder (MILLYRADIENS) gem. elements_defs.lua im Installationsordner 
SetScale(MILLYRADIANS)

--Diese Materials werden anders benutzt. Für HUD-Materials die Local-Aufzählung unten benutzen---------------
--Diese Materials scheinen über zu sein...bitte vor dem Entfernen testen-------------------------------------
materials = {}
materials["GUN_PIPPER_ORANGE"]	=	{255.0, 139.0, 50.0, 150.0}
--materials["DBG_GREY"]    = {5, 5, 5, 255}
--materials["DBG_BLACK"]   = {0, 0, 0, 255}
materials["DBG_BLUE"]    = {0, 0, 100, 255}
materials["DBG_GREEN"]   = {0,255,0,255}	
materials["DBG_RED"]     = {255, 0, 0, 255}
materials["DBG_WHITE"]   = {255, 255, 255, 255}
--materials["DBG_CYAN"]    = {1, 244, 244, 255}
--materials["BASE_GREEN"]  = {0,255,0, 255}

local GunpipperOrange = {255.0, 139.0, 50.0, 220.0} --this is the color and Name of the Material for the GunPipper...
local Green = {0,255,0,220}
local Black = {0, 0, 0, 220}

-------Einmal eine Konvertierung-Funktionen-Liste, weil es nicht schaden kann----------
DEGREE_TO_MRAD = 17.4532925199433
DEGREE_TO_RAD  = 0.0174532925199433
RAD_TO_DEGREE  = 57.29577951308233
MRAD_TO_DEGREE = 0.05729577951308233

---------Das hier ist wichtig, weil es die Render-Level des Cockpit-Krams setzt------
HUD_DEFAULT_LEVEL = 2                               
HUD_DEFAULT_NOCLIP_LEVEL  = HUD_DEFAULT_LEVEL - 1  
-------------------------------------------------------------------------------------
--------------FONTS------------------------------------------------------------------
fontdescription = {}
CMFD_X_PIXEL =  99--88
CMFD_Y_PIXEL =  144

local PeeJott_Font_1 = 
{
    texture = IND_FONT_PATH.."TestFont_3.tga",
    size        = {10, 10},
    resolution  = {1440, 1440},
    default     = {CMFD_X_PIXEL, CMFD_Y_PIXEL},
    chars       = {
        {32, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- space
        {48, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- 0
        {49, CMFD_X_PIXEL*0.8, CMFD_Y_PIXEL}, -- 1
        {50, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- 2
        {51, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- 3
        {52, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- 4
        {53, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- 5
        {54, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- 6
        {55, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- 7
        {56, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- 8
        
		{57, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- 9
        {65, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- A
        {66, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- B
        {67, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- C
        {68, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- D
        {69, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- E
        {70, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- F
        {71, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- G
        {72, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- H
        {73, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- I
		
        {74, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- J
        {75, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- K
        {76, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- L
        {77, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- M
        {78, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- N
        {79, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- O
        {80, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- P
        {81, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- Q
        {82, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- R
        {83, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- S
		
        {84, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- T
        {85, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- U
        {86, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- V
        {87, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- W
		
        {88, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- X
        {89, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- Y
        {90, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- Z 
        --{42, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- *
        --{43, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- +
        --{45, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- -
        --{47, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- /
        --{92, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- \
        --{40, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- (
        --{41, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- )
        --{91, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- [
        --{93, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- ]
        --{123, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- {
        --{125, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- }
        --{60, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- <
        --{62, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- >
        --{61, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- =
        --{63, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- ?
        --{124, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- |
        --{33, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- !
        --{35, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- #
        --{37, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- %
        --{94, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- ^
        --{38, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- &
        --{96, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- o -- degree, change its ascii code to 96 ', original 248 (out of index)
        --{46, CMFD_X_PIXEL*0.65, CMFD_Y_PIXEL*0.65}, -- .
        --{58, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- :
        --{44, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- ,
        --{126, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- cursor -> ~
        --{95, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- _
        --{39, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- '
        --{34, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- "
        --{32, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- [space]
        --{127, CMFD_X_PIXEL, CMFD_Y_PIXEL}, -- delta, use last ascii code
    }
}


PeeJottFont_Green  	= MakeFont(PeeJott_Font_1, Green, "PeeJottFont_Green")
PeeJottFont_Orange  = MakeFont(PeeJott_Font_1, GunpipperOrange, "PeeJottFont_Orange")
PeeJottFont_Black  	= MakeFont(PeeJott_Font_1, Black, "PeeJottFont_Black")

fonts = {}
fonts["PeeJottFont_Green"]  	= PeeJottFont_Green
fonts["PeeJottFont_Orange"]  	= PeeJottFont_Orange
fonts["PeeJottFont_Black"]  	= PeeJottFont_Black

--------------Fonts ENDE-------------------------------------------------------------------------

---------------GUN-Pipper-Material---------------------------------------------------------------
HUD_GUNPIPPER_TEXT = MakeMaterial(HUD_TEXTURES_PATH.."GUNSIGHT_TEXTURE_F4_TEST", GunpipperOrange)

----------diese Local-Funktion ist der default-generator für einen Kasten durch Indices(triangles)---
local box_indices =
{
	0,1,2;0,2,3
}

function hud_texture_box(UL_X,UL_Y,W,H, texture_size_x, texture_size_y)
local ux = UL_X / texture_size_x
local uy = UL_Y / texture_size_y
local w  = W / texture_size_x
local h  = H / texture_size_y
return {{ux	    ,uy},
		{ux + w ,uy},
		{ux + w ,uy + h},
		{ux	 	,uy + h}}
end



function create_HUD_texture(HUD_material, UL_X,UL_Y,DR_X,DR_Y, sale,CENTER_X,CENTER_Y)

if sale == nil then
	sale = 1.4
end

local mils_per_pixel =  sale/512
local W 	   		 = DR_X - UL_X
local H 	   		 = DR_Y - UL_Y
local cx		     = (UL_X + 0.5 * W)
local cy		     = (UL_Y + 0.5 * H)

local CENTER_X 		 = CENTER_X or cx
local CENTER_Y 		 = CENTER_Y or cy
local dcx 		 	 = mils_per_pixel * (CENTER_X - cx)
local dcy 		     = mils_per_pixel * (CENTER_Y - cy)

local half_x 		 = 0.49 * W * mils_per_pixel
local half_y 		 = 0.49 * H * mils_per_pixel


local object = CreateElement "ceTexPoly"
	  object.material 	=  HUD_material
 	  object.vertices 	=  {{-half_x - dcx, half_y + dcy},
						   { half_x - dcx, half_y + dcy},
						   { half_x - dcx,-half_y + dcy},
						   {-half_x - dcx,-half_y + dcy}}
	  object.tex_coords = hud_texture_box(UL_X,UL_Y,W,H, 1024, 1024) -- You will need this function hud_texture_box
	  object.indices	= box_indices
	  return object
end

function AddHudElement(object)
	object.h_clip_relation  = h_clip_relations.COMPARE	--INCREASE_IF_LEVEL zuvor war es .COMPARE 
	object.level  		 	= HUD_DEFAULT_LEVEL --zuvor war es einfach HUD_DEFAULT_LEVEL 
    object.use_mipfilter    = true
	object.additive_alpha   = true
    object.collimated       = true
	object.blend_mode 		=  blend_mode.IBM_REGULAR_ADDITIVE_ALPHA --einfach mal auskommentiert, war vorher drin
    Add(object)
end

function add_text_hud(text, posx, posy, pparent, font_mat, stringdefs, valign)

	local rec_parent       		= CreateElement "ceSimple"
	rec_parent.name				= create_guid_string()
	rec_parent.init_pos       	= {posx, posy}
	if pparent ~= nil then
		rec_parent.parent_element	= pparent.name
	end
	AddHudElement(rec_parent)
	-------------------
	if valign == nil then
		valign = "CenterCenter"
	end
	vfont_mat = fonts["PeeJottFont_Green"]
	if font_mat ~= nil then
		vfont_mat = fonts[font_mat]
	end
	if stringdefs == nil then
		stringdefs = HUD_strdefs_text
	end		
	-------------------
	if text ~= nil then
		local parent          = CreateElement "ceStringPoly"
		parent.name           = create_guid_string()
		parent.material       = vfont_mat
		parent.init_pos       = {0, 0}
		parent.stringdefs     = stringdefs
		parent.alignment	  = valign
		parent.value  	      = text
		parent.parent_element = rec_parent.name
		parent.element_params 	= {"SYS_HUD_BRIGHTNESS"}
		parent.controllers    	= {{"opacity_using_parameter", 0}}
		AddHudElement(parent)
	end
	-------------------
	return rec_parent
end

function add_text_hud_param(posx, posy, element_parm, element_parm2, tformat, pparent, stringdefs, font_mat, talignment)
	if tformat == nil then
		tformat = "%.0f"
	end
	if talignment == nil then
		talignment = "CenterCenter"
	end
	vfont_mat = fonts["PeeJottFont_Green"]
	if font_mat ~= nil then
		vfont_mat = fonts[font_mat]
	end	
	if stringdefs == nil then
		stringdefs = HUD_strdefs_text
	end	
	
	local parent          = CreateElement "ceStringPoly"
	parent.name           = create_guid_string()
	parent.material       = vfont_mat
	parent.init_pos       = {posx, posy}
	parent.stringdefs     = stringdefs
	parent.alignment	  = talignment
	if pparent ~= nil then
		parent.parent_element = pparent.name
	end
	parent.formats           = {tformat} 
	parent.element_params    = {element_parm2, element_parm,"%s"}
	parent.controllers       = {{"opacity_using_parameter", 0},{"text_using_parameter",1}}
	AddHudElement(parent)
	-------------------
	return parent
end

