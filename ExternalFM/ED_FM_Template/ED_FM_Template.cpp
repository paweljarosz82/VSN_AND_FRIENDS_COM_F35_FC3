// ED_FM_Template.cpp : Defines the exported functions for the DLL application.
#include "Vec3.h"
#include "stdafx.h"
#include "ED_FM_Template.h"
#include "ED_FM_Utility.h"
#include "FlightModel.h"
#include "State.h"
#include "Engine.h"
#include "Fuel_System.h"
#include <Math.h>
#include <stdio.h>
#include <string>
#include "Input.h"
#include "Airframe.h"
#include "BaseComponent.h"
#include "Maths.h"
#include "PID.h"
#include "AutoPilot.h"


//Vec3	common_moment;
//Vec3	common_force;
//Vec3    center_of_gravity;
//Vec3	wind;
//Vec3	velocity_world_cs;
//double  throttle		  = 0;
//double  stick_roll		  = 0;
//double  stick_pitch		  = 0;

//double  internal_fuel     = 0;
//double  fuel_consumption_since_last_time  = 0;
//double  atmosphere_density = 0;
//double  aoa = 0;
//double  speed_of_sound = 320;

//============================= OLD Statics ===================================//
//static Input s_input;
//static State s_state;
//static Engine s_engine(s_state, s_input); //NEU (s_input, s_state)// !!WICHTIG!! überall muss die Reihenfolge Input/State/Engine/Flightmodel sein, NICHT andersrum
//static Fuelsystem s_fuelsystem(s_state, s_input, s_engine);
//static Airframe s_airframe(s_state, s_input, s_engine);
//static FlightModel s_flightModel(s_state, s_input, s_engine, s_airframe); 


//=========================================================================//

//--------------------------NEW Statics-------------------------------------//

static Input* s_input = NULL;
static State* s_state = NULL;
static Engine* s_engine = NULL; //NEU (s_input, s_state)// !!WICHTIG!! überall muss die Reihenfolge Input/State/Engine/Flightmodel sein, NICHT andersrum
static Fuelsystem* s_fuelsystem = NULL;
static Airframe* s_airframe = NULL;
static FlightModel* s_flightModel = NULL;
static PID* s_PID = NULL;
static AutoPilot* s_autoPilot = NULL;

//------------------------NEW static functions-------------------------------//
static void init();
static void cleanup();
//---------------------------------------------------------------------------//

void init()
{
	s_input = new Input;
	s_state = new State;
	s_PID = new PID;
	s_engine = new Engine(*s_state, *s_input);
	s_fuelsystem = new Fuelsystem(*s_state, *s_input, *s_engine);
	s_airframe = new Airframe(*s_state, *s_input, *s_engine);
	s_autoPilot = new AutoPilot(*s_state, *s_input, *s_PID, *s_airframe);
	s_flightModel = new FlightModel(*s_state, *s_input, *s_engine, *s_airframe, *s_fuelsystem, *s_autoPilot);

}

void cleanup()
{
	delete s_input;
	delete s_state;
	delete s_engine;
	delete s_fuelsystem;
	delete s_airframe;
	delete s_flightModel;
	delete s_PID;
	delete s_autoPilot;

	s_input = NULL;
	s_state = NULL;
	s_engine = NULL;
	s_fuelsystem = NULL;
	s_airframe = NULL;
	s_flightModel = NULL;
	s_PID = NULL;
	s_autoPilot = NULL;

}

void ed_fm_add_local_force(double & x,double &y,double &z,double & pos_x,double & pos_y,double & pos_z)
{
	x = s_flightModel->getForce().x;
	y = s_flightModel->getForce().y;
	z = s_flightModel->getForce().z;

	pos_x = s_state->m_com.x;
	pos_y = s_state->m_com.y;
	pos_z = s_state->m_com.z;
}

void ed_fm_add_global_force(double & x,double &y,double &z,double & pos_x,double & pos_y,double & pos_z)
{
	
}

void ed_fm_add_global_moment(double & x,double &y,double &z)
{

}

void ed_fm_add_local_moment(double& x,double& y,double& z)
{
	x = s_flightModel->getMoment().x;
	y = s_flightModel->getMoment().y;
	z = s_flightModel->getMoment().z;
}

void ed_fm_simulate(double dt)
{
	s_input->inputUpdate(dt);
	s_flightModel->update(dt);
	s_engine->update(dt);
	s_airframe->airframeUpdate(dt);
	s_fuelsystem->update(dt);
	s_autoPilot->AutoPilotUpdate(dt);
}

void ed_fm_set_atmosphere(double h,//altitude above sea level
							double t,//current atmosphere temperature , Kelwins
							double a,//speed of sound
							double ro,// atmosphere density
							double p,// atmosphere pressure
							double wind_vx,//components of velocity vector, including turbulence in world coordinate system
							double wind_vy,//components of velocity vector, including turbulence in world coordinate system
							double wind_vz //components of velocity vector, including turbulence in world coordinate system
						)
{
	//void State::setCurrentAtmosphere( double temperature, double speedOfSound, double density, double pressure, const Vec3& wind )

	s_state->setCurrentAtmosphere(t, a, ro, p, Vec3(wind_vx, wind_vy, wind_vz));
}
/*
called before simulation to set up your environment for the next step
*/
void ed_fm_set_current_mass_state (double mass,
									double center_of_mass_x,
									double center_of_mass_y,
									double center_of_mass_z,
									double moment_of_inertia_x,
									double moment_of_inertia_y,
									double moment_of_inertia_z
									)
{
	s_state->setCOM(Vec3(center_of_mass_x, center_of_mass_y, center_of_mass_z));
}
/*
called before simulation to set up your environment for the next step
*/
void ed_fm_set_current_state (double ax,//linear acceleration component in world coordinate system
							double ay,//linear acceleration component in world coordinate system
							double az,//linear acceleration component in world coordinate system
							double vx,//linear velocity component in world coordinate system
							double vy,//linear velocity component in world coordinate system
							double vz,//linear velocity component in world coordinate system
							double px,//center of the body position in world coordinate system
							double py,//center of the body position in world coordinate system
							double pz,//center of the body position in world coordinate system
							double omegadotx,//angular accelearation components in world coordinate system
							double omegadoty,//angular accelearation components in world coordinate system
							double omegadotz,//angular accelearation components in world coordinate system
							double omegax,//angular velocity components in world coordinate system
							double omegay,//angular velocity components in world coordinate system
							double omegaz,//angular velocity components in world coordinate system
							double quaternion_x,//orientation quaternion components in world coordinate system
							double quaternion_y,//orientation quaternion components in world coordinate system
							double quaternion_z,//orientation quaternion components in world coordinate system
							double quaternion_w //orientation quaternion components in world coordinate system
							)
{
	s_state->setCurrentStateWorldAxis(
		Vec3(px, py, pz),
		Vec3(vx, vy, vz));
}


void ed_fm_set_current_state_body_axis(
	double ax,//linear acceleration component in body coordinate system
	double ay,//linear acceleration component in body coordinate system
	double az,//linear acceleration component in body coordinate system
	double vx,//linear velocity component in body coordinate system
	double vy,//linear velocity component in body coordinate system
	double vz,//linear velocity component in body coordinate system
	double wind_vx,//wind linear velocity component in body coordinate system
	double wind_vy,//wind linear velocity component in body coordinate system
	double wind_vz,//wind linear velocity component in body coordinate system

	double omegadotx,//angular accelearation components in body coordinate system
	double omegadoty,//angular accelearation components in body coordinate system
	double omegadotz,//angular accelearation components in body coordinate system
	double omegax,//angular velocity components in body coordinate system
	double omegay,//angular velocity components in body coordinate system
	double omegaz,//angular velocity components in body coordinate system
	double yaw,  //radians
	double pitch,//radians
	double roll, //radians
	double common_angle_of_attack, //AoA radians
	double common_angle_of_slide   //AoS radians
	)
{
	//void State::setCurrentStateBodyAxis(double aoa, double beta, const Vec3& angle, const Vec3& omega, const Vec3& omegaDot, const Vec3& speed, const Vec3& airspeed, const Vec3& acceleration)

	Vec3 velocity(vx, vy, vz);
	Vec3 windVelocity(wind_vx, wind_vy, wind_vz);

	s_state->setCurrentStateBodyAxis(
		common_angle_of_attack,
		common_angle_of_slide,
		Vec3(roll, yaw, pitch),
		Vec3(omegax, omegay, omegaz),
		Vec3(omegadotx, omegadoty, omegadotz),
		velocity,
		velocity - windVelocity,
		Vec3(ax, ay, az)
	);
}

void ed_fm_on_damage(int element, double element_integrity_factor)
{
	s_airframe->setIntegrityElement((Airframe::Damage)element, (float)element_integrity_factor);
}

/*
input handling
*/
void ed_fm_set_command(int command,
	float value)
{
	switch (command)
	{
	case COMMAND_PITCH:
		s_input->pitch(value);
		break;

	case COMMAND_ROLL:
		s_input->roll(value);
		break;
	
	case COMMAND_THROTTLE:
		s_input->throttle(value);
		break;

	case COMMAND_THROTTLE2:
		s_input->throttle2(value);
		break;

	case COMMAND_THROTTLE_ALL:
		s_input->throttleAll(value);
		break;

	case COMMAND_YAW:
		s_input->yaw(value);
		break;
		
	case COMMAND_TRIMM_UP:
		s_input->trimmUP();
		break;
	
	case COMMAND_TRIMM_DOWN:
		s_input->trimmDOWN();
		break;
	
	case COMMAND_TRIMM_AIL_L:
		s_input->trimmAilL();
		break;
	
	case COMMAND_TRIMM_AIL_R:
		s_input->trimmAilR();
		break;
	
	case COMMAND_GEAR_TOGGLE:
		s_input->gearToggle();
		break;
		
	case COMMAND_GEAR_UP:
		s_input->gearUP();
		break;
	
	case COMMAND_GEAR_DOWN: 
		s_input->gearDOWN();
		break;

	case COMMAND_BRAKE: 
		s_input->brake();
		break;

	case COMMAND_RELEASE_BRAKE:
		s_input->releaseBrake();
		break;

	case COMMAND_LEFT_BRAKE:
		s_input->m_leftbrake = value;
		break;

	case COMMAND_RIGHT_BRAKE:
		s_input->m_rightbrake = value;
		break;

	case COMMAND_FLAPS_DOWN:
		s_input->flapsDown();
		break;

	case COMMAND_FLAPS_UP:
		s_input -> flapsUp();
		break;

	case COMMAND_FLAPS_TOGGLE:
		s_input->flapsToggle();
		break;

	case COMMAND_AIRBRAKE:
		s_input->airbrake();
		break;

	case COMMAND_AIRBRAKE_EXTEND:
		s_input->airbrakeExt();
		break;

	case COMMAND_AIRBRAKE_RETRACT:
		s_input->airbrakeRet();
		break;

	case COMMAND_HOOK_TOGGLE:
		s_input->hookToggle();
		break;

	case COMMAND_WING_FOLD_TOGGLE:
		s_input->wingFoldToggle();
		break;

	case COMMAND_NOSEWHEEL_STEERING:
		s_input->nwSteering();
		break;

	case COMMAND_BRAKE_CHUTE:
		s_input->brakeChute();
		break;

	case COMMAND_ENGINES_START:
		s_input->enginesStart();
		break;

	case COMMAND_ENGINES_STOP:
		s_input->enginesStop();
		break;

	case COMMAND_ENGINE_START1:
		s_input->engineStart1();
		break;

	case COMMAND_ENGINE_START2:
		s_input->engineStart2();
		break;

	case COMMAND_ENGINE_STOP1:
		s_input->engineStop1();
		break;
	
	case COMMAND_ENGINE_STOP2:
		s_input->engineStop2();
		break;
	case COMMAND_AUTOPILOT_ALT_HOLD:
		s_input->autoPilotEng();
		break;

	case COMMAND_LIGHT_TOGGLE:
		s_input->lightToggle();
		break;

	case COMMAND_THROTTLE_UP_GO:
		s_input->throttleUpGO();
		break;
	case COMMAND_THROTTLE_STOP:
		s_input->throttleSTOP();
		break;
	case COMMAND_THROTTLE_DOWN_GO:
		s_input->throttleDownGO();
		break;

	case COMMAND_ELEV_UP_GO:
		s_input->elevUpGO();
		break;

	case COMMAND_ELEV_UP_STOP:
		s_input->elevUpStop();
		break;

	case COMMAND_ELEV_DOWN_GO:
		s_input->elevDownGO();
		break;

	case COMMAND_ELEV_DOWN_STOP:
		s_input->elevDownStop();
		break;

	case COMMAND_RUD_LEFT_GO:
		s_input->rudLeftGO();// m_rudder_left_go;
		break;

	case COMMAND_RUD_LEFT_STOP:
		s_input->rudLeftStop();//m_rudder_left_stop;
		break;

	case COMMAND_RUD_RIGHT_GO:
		s_input->rudRightGO();// m_rudder_right_go;
		break;

	case COMMAND_RUD_RIGHT_STOP:
		s_input->rudRightStop();// m_rudder_right_stop;
	break;

	case COMMAND_AIL_RIGHT_GO:
		s_input->ailRightGO();// m_ail_right_go;
		break;

	case COMMAND_AIL_RIGHT_STOP:
		s_input->ailRightStop();// m_ail_right_stop;
		break;

	case COMMAND_AIL_LEFT_GO:
		s_input->ailLeftGO();// m_ail_left_go;
		break;

	case COMMAND_AIL_LEFT_STOP:
		s_input->ailLeftStop();// m_ail_left_stop;
		break;

	case COMMAND_ELECTRIC_SYSTEM:
		s_input->electricSystem();
		break;
	case COMMAND_CROSSHAIR_LEFT:
		s_input->crossHLeft();
		break;

	case COMMAND_CROSSHAIR_RIGHT:
		s_input->crossHRight();
		break;

	case COMMAND_CROSSHAIR_UP:
		s_input->crossHUp();
		break;

	case COMMAND_CROSSHAIR_DOWN:
		s_input->crossHDown();
		break;

	case COMMAND_HUD_DARK:
		s_input->hudDark();
		break;

	case COMMAND_SIGHT_HORIZONTAL:
		s_input->sightHorizontal(value);
		break;

	case COMMAND_SIGHT_VERTICAL:
		s_input->sightVertical(value);
		break;

	case COMMAND_WHEELBRAKE_LEFT:
		s_input->brakeLeft(value);
		break;

	case COMMAND_WHEELBRAKE_RIGHT:
		s_input->brakeRight(value);
		break;

	/*case COMMAND_NOSEWHEEL_STEERING_ENGAGE:
		s_input->m_nwsteeringeng = value;
		break;
	case COMMMAND_NOSEWHEEL_STEERING_DISENGAGE:
		s_input->m_nwsteeringdiseng = value;
		break;
	case COMMAND_STARTER_BUTTON:
		s_input->m_starterbutton = value;
		break;
	case COMMAND_THROTTLE_DETEND:
		s_input->m_starterbutton = value;
		break;*/
	case COMMAND_MASTER_AA_1:
		s_input->masterAtoA1();
		break;

	case COMMAND_MASTER_AA_2:
		s_input->masterAtoA2();
		break;

	case COMMAND_MASTER_AA_3:
		s_input->masterAtoA3();
		break;

	case COMMAND_MASTER_AA_4:
		s_input->masterAtoA4();
		break;

	case COMMAND_MASTER_AG:
		s_input->masterAtoG();
		break;

	case COMMAND_MASTER_NAVI:
		s_input->masterNAVI();
		break;

	case COMMAND_MASTER_GUN:
		s_input->masterGUN();
		break;

	case COMMAND_QNH_UP:
		s_input->qnhUP();
		break;

	case COMMAND_QNH_DOWN:
		s_input->qnhDOWN();
		break;

	case COMMAND_QNH_STOP:
		s_input->qnhSTOP();
		break;

	case COMMAND_INST_LIGHT_TGL:
		s_input->instLightTgl();
		break;

	case COMMAND_AUTOPILOT_ATT_HOLD:
		s_input->autoPilotAttHold();
		break;
		
	case COMMAND_REFUELING_DOOR_TGL:
		s_input->refuelingDoorTgl();
		break;

	case COMMAND_LAUNCH_BAR_TGL:
		s_input->launchBarToggle();
		break;

	case COMMAND_TILT_ENGINE_NOZZLE_TGL_PLS:
		s_input->tiltEngineNozzleTGLPLUS();
		break;

	case COMMAND_TILT_ENGINE_NOZZLE_TGL_MNS:
		s_input->tiltEngineNozzleTGLMINUS();
		break;

	case COMMAND_BAYDOORS_TOGGLE:
		s_input->bayDoorsOpenClose();
		break;

	default:
		printf("number %d: %f\n", command, value); //neu eingefügt um "unbekannte" Kommandos zur Konsole auszugeben
	}
}
/*
	Mass handling 

	will be called  after ed_fm_simulate :
	you should collect mass changes in ed_fm_simulate 

	double delta_mass = 0;
	double x = 0;
	double y = 0; 
	double z = 0;
	double piece_of_mass_MOI_x = 0;
	double piece_of_mass_MOI_y = 0; 
	double piece_of_mass_MOI_z = 0;
 
	//
	while (ed_fm_change_mass(delta_mass,x,y,z,piece_of_mass_MOI_x,piece_of_mass_MOI_y,piece_of_mass_MOI_z))
	{
	//internal DCS calculations for changing mass, center of gravity,  and moments of inertia
	}
*/
bool ed_fm_change_mass  (double & delta_mass,
						double & delta_mass_pos_x,
						double & delta_mass_pos_y,
						double & delta_mass_pos_z,
						double & delta_mass_moment_of_inertia_x,
						double & delta_mass_moment_of_inertia_y,
						double & delta_mass_moment_of_inertia_z
						)
{
	Fuelsystem::Tank tank = s_fuelsystem->getSelectedTank();//DAb hier Change Mass geht los
	if (tank == Fuelsystem::NUMBER_OF_TANKS)
	{
		s_fuelsystem->setSelectedTank(Fuelsystem::INTERNAL);
		return false;
	}

	Vec3 pos = s_fuelsystem->getFuelPos(tank);
	//-------Vec3 r = pos - s_state->getCOM();---------------------------

	delta_mass = s_fuelsystem->getFuelQtyDelta(tank);
	s_fuelsystem->setFuelPrevious(tank);

	//-----------printf( "Tank %d, Pos: %lf, %lf, %lf, dm: %lf\n", tank, pos.x, pos.y, pos.z, delta_mass );---------------

	delta_mass_pos_x = pos.x;
	delta_mass_pos_y = pos.y;
	delta_mass_pos_z = pos.z;

	s_fuelsystem->setSelectedTank((Fuelsystem::Tank)((int)tank + 1));
	return true;
	
	//return false;


	//if (fuel_consumption_since_last_time > 0)
	//{
	//	delta_mass		 = fuel_consumption_since_last_time;
	//	delta_mass_pos_x = -1->0;
	//	delta_mass_pos_y =  1.0;
	//	delta_mass_pos_z =  0;

	//	delta_mass_moment_of_inertia_x	= 0;
	//	delta_mass_moment_of_inertia_y	= 0;
	//	delta_mass_moment_of_inertia_z	= 0;

	//	fuel_consumption_since_last_time = 0; // set it 0 to avoid infinite loop, because it called in cycle 
	//	// better to use stack like structure for mass changing 
	//	return true;
	//}
	//else 
	//{
	//	return false;
	//}
}
/*
	set internal fuel volume , init function, called on object creation and for refueling , 
	you should distribute it inside at different fuel tanks
*/
void   ed_fm_set_internal_fuel(double fuel)
{
	s_fuelsystem->setInternal(fuel);
	//internal_fuel = fuel;
}
/*
	get internal fuel volume 
*/

//---------------NEU EINGEFÜGT---------------------
void ed_fm_refueling_add_fuel(double fuel)
{
		//printf("Add fuel: %lf\n", fuel);
		s_fuelsystem->addFuel(fuel);
}
//-----------------NEU EINGEFÜGT ENDE----------------

double ed_fm_get_internal_fuel()
{
	//return 1.0;
	return s_fuelsystem->getFuelQtyInternal();
}
/*
	set external fuel volume for each payload station , called for weapon init and on reload
*/
//lediglich Änderung in der {} für StationToTank

void  ed_fm_set_external_fuel(int	 station,
	double fuel,
	double x,
	double y,
	double z)
{
	Fuelsystem::Tank tank = s_fuelsystem->stationToTank(station);
	s_fuelsystem->setFuelQty(tank, Vec3(x, y, z), fuel);
}

	//Das folgende ist das Original, davor ist meine schlechte Fälschung
/*{
	s_fuelsystem->setFuelQty((Fuelsystem::Tank)(station + 1), Vec3(x, y, z), fuel);
}*/

/*
	get external fuel volume 
*/
double ed_fm_get_external_fuel ()
{
	//return 0;
	return s_fuelsystem->getFuelQtyExternal();
}

/*ACHTUNG-ACHTUNG Veränderungen im Anmarsch: Ab DCS V2.7 muss ed_fm_set_draw_args und
ed_fm_set_fc3_cockpit_draw_args wie folgt verändert werden


NEU!! void ed_fm_set_fc3_cockpit_draw_args_v2(float* data, size_t size)
NEU!! {
NEU!!	data[YOUR_ARGUMENT] = WHAT_YOU_WANT;
NEU!! }
NEU!!
NEU!! Compared to
ALT!! void ed_fm_set_fc3_cockpit_draw_args(EdDrawArgument* drawargs, size_t size)
ALT!! {
ALT!!	drawargs[YOUR_ARGUMENT].f = WHAT_YOU_WANT;
ALT!! }

in der ed_fm_template.h müssen auch Änderungen vorgenommen werden in:

void ed_fm_set_fc3_cockpit_draw_args_v2(float* data, size_t size)
*/


void ed_fm_set_draw_args (EdDrawArgument * drawargs,size_t size)
{
	//drawargs[28].f   = (float)throttle;
	//drawargs[29].f   = (float)throttle;

	if (size > 616)
	{	
		drawargs[611].f = drawargs[0].f;
		drawargs[614].f = drawargs[3].f;
		drawargs[616].f = drawargs[5].f;
	}

	drawargs[12].f = -s_airframe->getAileron();//left Aileron
	drawargs[11].f = s_airframe->getAileron();//right aileron
	drawargs[15].f = s_airframe->getStabilizer(); //right elevator ist standard für ein Leitwerk
	drawargs[16].f = s_airframe->getStabilizer();//left elevator
	drawargs[17].f = -s_airframe->getRudder(); //rudder
	drawargs[18].f = -s_airframe->getRudder();//rudder nr. 2
	drawargs[9].f = s_airframe->getFlapsPosition();//right flap Versuch
	drawargs[10].f = s_airframe->getFlapsPosition();//left flap Versuch
	drawargs[182].f = s_airframe->getSpeedBrakePosition();//airbrake #1
	drawargs[184].f = s_airframe->getSpeedBrakePosition();//airbrake #2
	drawargs[0].f = s_airframe->getGearNPosition();//Nosewheel Position
	drawargs[3].f = s_airframe->getGearRPosition();//Right Gear Position
	drawargs[5].f = s_airframe->getGearLPosition();//Left Gear Position
	drawargs[402].f = s_airframe->getHookPosition();//Hook Position statt 402 wider 25
	drawargs[28].f = s_engine->updateBurner();//Burner Stage 1 and 0 for right engine
	//drawargs[29].f = s_engine->updateBurner2();//Burner Stage 1 and 0 for left engine
	drawargs[89].f = s_airframe->getNozzlePosition();//Engine Nozzle Stage 1 - 0 - 1
	//drawargs[90].f = s_airframe->getNozzle2Position();//Engine2 Nozzle Position 1 - 0 - 1
	drawargs[2].f = s_airframe->getNoseWheelAngle();//Nosewheel Angle +/- 60°
	drawargs[35].f = s_airframe->brkChutePosition();
	drawargs[36].f = s_airframe->getChutePositionY();//slew chute in Y-Axis (-1 to +1)
	drawargs[37].f = s_airframe->getChutePositionZ();//slew chute in Z-Axis (-1 to +1)
	drawargs[401].f = s_airframe->getWingFoldMechanics();//Wing-Tip-Folding Mechanics anstatt Arg.Nr.8
	drawargs[274].f = s_airframe->getLEFlapPosition();//Slats/LE-Flaps Position due to auto drive flaps left
	drawargs[275].f = s_airframe->getLEFlapPosition();//Slats/LE-Flaps Position due to auto drive flaps right
	drawargs[403].f = s_airframe->getRefuelingDoor();//Refueling-Door toggle Function
	drawargs[85].f = s_airframe->getLaunchBarPos();//aktuell noch ohne Anbindung an die Actuators, weil wir auch eh nix zum anziegne haben...
	//drawargs[404].f = s_airframe->getTiltEngineNozzlePosition();// gibt die TiltNozzlePosition wieder mit 0.0 = gerade 1.0 = 90° runter
	drawargs[26].f = s_airframe->getBayDoorsPosition();//BayDoorPosition 0.0 = zu 1.0 = auf
	drawargs[290].f = s_airframe->getTopRotorClap();// 290 ist Top-Klappe Unten
	drawargs[291].f = s_airframe->getWingNozzles();// 291 sind die FlügelDüsen
	drawargs[292].f = s_airframe->getTiltEngineNozzlePosition();// 292 ist die HeckDüse !!DAS STIMMT SO!!
	//drawargs[293].f = s_airframe->getTopRotorClap();// 293 ist die Rotor-TopKlappe

	//--------this is Refueling-Probe argument---------
	//drawargs[22].f = 1.0; //auskommentiert um zu testen ob FC3 das auch so macht...

}

void ed_fm_set_fc3_cockpit_draw_args_v2(float* data, size_t size)
{
	data[635] = s_airframe->getGearLLamp();//39 zu 635 Fahrwerkslampe linkes Fahrwerk
	data[636] = s_airframe->getGearFLamp();//40 zu 636Fahrwerkslampe Bugrad
	data[637] = s_airframe->getGearRLamp();//41 zu 637Fahrwerkslampe rechtes Fahrwerk
	data[638] = s_airframe->getFlapIndLEPos();//42 zu 638 FlapPosition-Indicator LE-Flaps
	data[639] = s_airframe->getFlapIndTEPos();//43 zu 639 FlapPosition-Indicator TE-Flaps
	data[600] = s_airframe->getFlapLevPos();//FlapLever-Position

	data[641] = s_airframe->fuelFlowIndGaugeUpdate();//531 zu 641 FuelFlow-Indicator

	data[602] = s_engine->overHeatInd();//OverHeat-Warning-Light 0.0/0.5/0.75 == off/yellow/red
	data[601] = s_engine->overSpeedInd();//OverSpeed Warning indicator
	data[606] = s_airframe->getAutoPilotInd();// 0=aus 1.0 = grün-an
	data[603] = s_input->getLightToggle();//0=aus 0.5 = gelb 1.0=grün
	data[604] = s_fuelsystem->lowFuelWarning();//LowFuelIndicator
	//data[607] = s_fuelsystem->getFuelQtyTotal();//Fuel-Indicator for total Fuel
	data[608] = s_fuelsystem->getAdjFuelQtyExternal();//Fuel-Indicator for External Fuel only
	data[609] = s_airframe->brkChuteInd();//Chute-Position_Indicator 0.0 = aus 1.0 = Chute released
	data[646] = s_airframe->getHookInd(); //226 zu 646 Hook-Position Indicator 1.0 = ausgefahren 0.0 = eingefahren
	data[644] = s_fuelsystem->bingoFuelWarning();//225 zu 644 BingoFuel Indicator 1.0 = an/rot 0.0 = aus
	data[642] = s_airframe->getSpeedBrakeInd();//200 zu 642SpdBrk-Position-Indicator 1.0 = an 0.0 = aus
	data[643] = s_airframe->ailDamageIndicator();//221 zu 643 Damage-Indicator for aileron Damage 1.0 = an; 0.0=aus
	data[645] = s_airframe->stabDamageIndicator();//209 zu 645 Damage-Indicator for horizontal stabilizer 1.0=an; 0.0=aus
	data[610] = s_airframe->airSpeedInKnotsEASInd();// Airspeedindicator in Knots 0.0 = 0; 1.0 = 1.000
	data[611] = s_airframe->airSpeedInMachInd();//Airspeedindicator in Mach 0.0 = 0; 1.0 = Mach 10
	//data[616] = s_airframe->getCrossHairHori();//CrossHair horizontal movement
	//data[615] = s_airframe->getCrossHairVerti();//CrossHair vertical movement
	data[617] = s_airframe->getAltIndHundreds();//Altimeter 100er
	data[618] = s_airframe->getAltIndThousands();//Altimeter 1000er
	data[619] = s_airframe->getAltIndTenThousands();//Altimeter 10000er
	data[620] = s_airframe->getAltIndHundreds();//Altimeter in 10er
	data[612] = s_airframe->overSpeedFlapDamageInd();//Indcator for overspeed flap damage
	data[613] = s_airframe->overSpeedGearDamageInd();//Indicator for overspeed gear damage
	data[614] = s_flightModel->getStabAugSystem();//Indicator for function of stability augmentation system for pitch axis
	//data[621] = s_airframe->getPylonIndLightA();//pylon indicator loghts 0.0; 0.5; 1.0 == off; inner; on
	//data[622] = s_airframe->getPylonIndLightG();
	//data[623] = s_airframe->getPylonIndLightG();
	//data[624] = s_airframe->getPylonIndLightG();
	//data[625] = s_airframe->getPylonIndLightG();
	//data[626] = s_airframe->getPylonIndLightA();
	//data[627] = s_airframe->gunIndSwitch();//gun-selector-switch 0.0; 1.0
	data[628] = s_airframe->getGearLeverLamp();//Gear-Lever-Lamp an bei 0.0 > und < 1.0; bei 0.0 und 1.0 aus.
	data[629] = s_airframe->getQNHinThousand();//QNH-Anzeige tausender Bereich
	data[630] = s_airframe->getQNHinHundred();//QNH-Anzeige hunderter Bereich
	data[631] = s_airframe->getQNHinTen();//QNH-Anzeige zehner Bereich
	data[632] = s_airframe->getQNHinOne();//QNH-Anzeige einer Bereich
	data[633] = s_fuelsystem->getAdjFuelQtyInternal();//neue interne Fuel Anzeige.
	data[634] = s_airframe->getNozzlePosition();//für die Nozzle-Pos-Anzeige die Werte der externen Nozzle-Position, 0.4, 0.2, 0.8
	data[640] = s_airframe->getInstLight();//Instrument Light toggle 1.0 = on 0.0 = off

}


void ed_fm_configure(const char * cfg_path) //neu eingefügt wegen Pointer und steuert die Initialisierung
{
	//printf("Initialising...\n");//zur überprüfung des Initialisierungsprozesses
	init();
}

void ed_fm_release() //neu eingefügt wegen Pointer und steuert den CleanUp nach dem Shut-Down
{
	cleanup();
}

double test_gear_state = 0;

double ed_fm_get_param(unsigned index)
{
	
switch (index)
{
case ED_FM_SUSPENSION_0_GEAR_POST_STATE:
case ED_FM_SUSPENSION_0_DOWN_LOCK:
case ED_FM_SUSPENSION_0_UP_LOCK:
	return s_airframe->getGearNPosition(); //vorher zum testen bei allen 3 "return 1.0;"

case ED_FM_SUSPENSION_1_GEAR_POST_STATE:
case ED_FM_SUSPENSION_1_DOWN_LOCK:
case ED_FM_SUSPENSION_1_UP_LOCK:
	return s_airframe->getGearLPosition();

case ED_FM_SUSPENSION_2_GEAR_POST_STATE:
case ED_FM_SUSPENSION_2_DOWN_LOCK:
case ED_FM_SUSPENSION_2_UP_LOCK:
	return s_airframe->getGearRPosition();

case ED_FM_SUSPENSION_1_RELATIVE_BRAKE_MOMENT:
	return s_airframe->updateBrakeLeft();//updateBrake();
case ED_FM_SUSPENSION_2_RELATIVE_BRAKE_MOMENT:
	return s_airframe->updateBrakeRight();//updateBrake();

case ED_FM_ANTI_SKID_ENABLE:
	return 1.0;

//NWS-Stuff
case ED_FM_SUSPENSION_0_WHEEL_SELF_ATTITUDE:
	return s_input->getNWS() == 1.0 ? 0.0 : 1.0; //was return s_airframe->NWSstate() == 1.0 ? 1.0 : 0.0;
case ED_FM_SUSPENSION_0_WHEEL_YAW:
	return s_airframe->getNoseWheelAngle() * 0.75; //war 1.0 dan 0.75 //> 0.5 ? -s_input.m_yaw * 0.5 : 0.0; //rotation to 45 degrees, half 90 (range of the wheel)//jetzt statt 0.65 0.75 wegen Carrier.

//Engine-Stuff
case ED_FM_ENGINE_1_CORE_RPM: //RPM in Rad/s
	//return s_engine->getRPMNorm() * 777;
case ED_FM_ENGINE_1_RPM: 
	return s_engine->getRPMNorm() * 777;//RPM in Rad/s
case ED_FM_ENGINE_1_TEMPERATURE:
	return s_engine->tempInC();
case ED_FM_ENGINE_1_OIL_PRESSURE:
	return (s_engine->getRPMNorm()) * 650.0;
case ED_FM_ENGINE_1_FUEL_FLOW:
	return s_engine->FuelFlowUpdate();
case ED_FM_ENGINE_1_CORE_RELATED_THRUST:
	return s_engine->updateThrust() / 50000.0 ;
case ED_FM_ENGINE_1_RELATED_THRUST:
	//return s_engine->updateThrust() / 50000.0; //NEUer Versuch, wegen HeatBlurr-Effekt
case ED_FM_ENGINE_1_RELATED_RPM:
	return s_engine->getRPMNorm();
case ED_FM_ENGINE_1_CORE_RELATED_RPM: //related=normalised RPM in %
	return s_engine->getRPMNorm();

case ED_FM_ENGINE_1_THRUST:
	return s_engine->updateThrust();

case ED_FM_ENGINE_1_COMBUSTION:
	return s_engine->FuelFlowUpdate();

/*case ED_FM_ENGINE_2_CORE_RPM: //RPM in Rad/s
	//return s_engine->getRPMNorm() * 777;
case ED_FM_ENGINE_2_RPM:
	return s_engine->getRPMNorm2() * 777;//RPM in Rad/s
case ED_FM_ENGINE_2_TEMPERATURE:
	return s_engine->tempInC2();
case ED_FM_ENGINE_2_OIL_PRESSURE:
	return (s_engine->getRPMNorm2()) * 650.0;
case ED_FM_ENGINE_2_FUEL_FLOW:
	return s_engine->FuelFlowUpdate2();
case ED_FM_ENGINE_2_CORE_RELATED_THRUST:
	return s_engine->updateThrust2() / 50000.0;
case ED_FM_ENGINE_2_RELATED_THRUST:
	//return s_engine->updateThrust() / 50000.0; //NEUer Versuch, wegen HeatBlurr-Effekt
case ED_FM_ENGINE_2_RELATED_RPM:
	return s_engine->getRPMNorm2();
case ED_FM_ENGINE_2_CORE_RELATED_RPM: //related=normalised RPM in %
	return s_engine->getRPMNorm2();

case ED_FM_ENGINE_2_THRUST:
	return s_engine->updateThrust2();

case ED_FM_ENGINE_2_COMBUSTION:
	return s_engine->FuelFlowUpdate2();
*/
case ED_FM_FUEL_INTERNAL_FUEL:
	return s_fuelsystem->getFuelQtyInternal();

case ED_FM_FUEL_TOTAL_FUEL:
	return s_fuelsystem->getFuelQtyTotal();

case ED_FM_FUEL_FUEL_TANK_GROUP_0_LEFT:
	return s_fuelsystem->getFuelQtyExternalLeft();

case ED_FM_FUEL_FUEL_TANK_GROUP_0_RIGHT:
	return s_fuelsystem->getFuelQtyExternalRight();

case ED_FM_CAN_ACCEPT_FUEL_FROM_TANKER:
	return s_airframe->getRefuelingDoor();//Versuch, damit es nicht mehr flackert...
	//return 1.0;

case ED_FM_FC3_STICK_PITCH:
	return s_input->getPitch();
case ED_FM_FC3_STICK_ROLL:
	return s_input->getRoll();
case ED_FM_FC3_RUDDER_PEDALS:
	return s_input->getYaw();

case ED_FM_FC3_THROTTLE_LEFT:
	return s_airframe->getIntThrottlePosition();


case ED_FM_FC3_GEAR_HANDLE_POS:
	return s_input->getGearToggle();

//-------------Neu eingefügt zum Testen von AtoA refueling----------------
case ED_FM_FC3_AR_DOOR_PROBE_HANDLE_POS:
	return s_airframe->getRefuelingDoor();
//-------------------------------------------------------------------------

case ED_FM_STICK_FORCE_CENTRAL_PITCH:
	return 0.0;
case ED_FM_STICK_FORCE_FACTOR_PITCH:
	return 0.75;
case ED_FM_STICK_FORCE_CENTRAL_ROLL:
	return 0.0;
case ED_FM_STICK_FORCE_FACTOR_ROLL:
	return 0.75;




}

	return 0;

}


bool ed_fm_pop_simulation_event(ed_fm_simulation_event& out)
{
	if (s_airframe->catapultState() == Airframe::ON_CAT_NOT_READY && !s_airframe->catapultStateSent())
	{
		out.event_type = ED_FM_EVENT_CARRIER_CATAPULT;
		out.event_params[0] = 0;
		s_airframe->catapultStateSent() = true;
		return true;
	}
	else if (s_airframe->catapultState() == Airframe::ON_CAT_READY)
	{
		out.event_type = ED_FM_EVENT_CARRIER_CATAPULT;
		out.event_params[0] = 1;
		out.event_params[1] = 3.0f;
		out.event_params[2] = 95.0f;// original Funktion "60.0f + 20.0 * std::min(s_airframe->getMass() / c_maxTakeoffMass, 1.0);"
		out.event_params[3] = s_engine->updateThrust();
		s_airframe->catapultState() = Airframe::ON_CAT_WAITING;
		return true;
	}
	else
	{
		Airframe::Damage damage;
		float integrity;

		if (s_airframe->processDamageStack(damage, integrity))
		{
			out.event_type = ED_FM_EVENT_STRUCTURE_DAMAGE;
			out.event_params[0] = (float)damage;
			out.event_params[1] = integrity;

			return true;
		}
		else
		{
			return false;
		}
	}
}

bool ed_fm_push_simulation_event(const ed_fm_simulation_event& in)
{
	if (in.event_type == ED_FM_EVENT_CARRIER_CATAPULT)
	{
		if (in.event_params[0] == 1)
		{
			s_airframe->catapultState() = Airframe::ON_CAT_NOT_READY;
		}
		else if (in.event_params[0] == 2)
		{
			s_airframe->catapultState() = Airframe::ON_CAT_LAUNCHING;
		}
		else if (in.event_params[0] == 3)
		{
			if (s_airframe->catapultState() == Airframe::ON_CAT_LAUNCHING)
			{
				s_airframe->catapultState() = Airframe::OFF_CAT;
			}
			else
			{
				s_airframe->catapultState() = Airframe::OFF_CAT;
			}
		}
	}
	return true;
}

void ed_fm_cold_start()
{
	s_state->coldInit();
	s_input->coldInit();
	s_airframe->coldInit();
	s_engine->coldInit();
	s_fuelsystem->coldInit();
	s_flightModel->coldInit();
	s_PID->coldInit();
	s_autoPilot->coldInit();
	
}

void ed_fm_hot_start()
{
	s_state->hotInit();
	s_input->hotInit();
	s_airframe->hotInit();
	s_engine->hotInit();
	s_fuelsystem->hotInit();
	s_flightModel->hotInit();
	s_PID->hotInit();
	s_autoPilot->hotInit();
}

void ed_fm_hot_start_in_air()
{
	s_state->airborneInit();
	s_input->airborneInit();
	s_airframe->airborneInit();
	s_engine->airborneInit();
	//s_engine->airborneInit();
	s_flightModel->airborneInit();
	s_PID->airborneInit();
	s_autoPilot->airborneInit();
}

//Neu eingefügt und in der ED_FM_Template.h ebenfalls
void ed_fm_repair()
{
	s_airframe->resetDamage();
	s_airframe->resetOSdamage();
	s_engine->repairHeatDamage();
}

bool ed_fm_need_to_be_repaired()
{
	if (s_engine->overHeatInd() == 1.0)
		return true;
	if ((s_airframe->overSpeedGearDamageInd() == 1.0) || (s_airframe->overSpeedFlapDamageInd() == 1.0))
	{
		return true;
	}
	else
	{
		return false;
	}
}

double ed_fm_get_shake_amplitude()
{
	return s_flightModel->getCockpitShake();
}

void ed_fm_suspension_feedback(int idx, const ed_fm_suspension_info* info)
{
	if (idx == 0)
	{
		s_airframe->setWeightOnWheels(info->struct_compression);
	}

	//-----possible info about structs---------------------------------------
	//printf("Struct Compression %d: %lf\n", idx, info->struct_compression);
	//printf("Integrity Factor: %lf", info->integrity_factor);
}

/*bool ed_fm_enable_debug_info()
{
	return true;
}*/


bool ed_fm_add_local_force_component( double & x,double &y,double &z,double & pos_x,double & pos_y,double & pos_z )
{
	return false;
}

bool ed_fm_add_global_force_component( double & x,double &y,double &z,double & pos_x,double & pos_y,double & pos_z )
{
	return false;
}

bool ed_fm_add_local_moment_component( double & x,double &y,double &z )
{
	return false;
}

bool ed_fm_add_global_moment_component( double & x,double &y,double &z )
{
	return false;
}

