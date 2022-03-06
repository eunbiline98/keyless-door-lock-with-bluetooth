//POVRay-File created by 3d41.ulp v20110101
//C:/Users/Ath Thaareq Mahesa/Documents/Work/Eunbiline98_project/keyless-door-lock-with-bluetooth/ESP-WROOM-32-Breakout.brd
//06/03/2022 19:51:37

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

#declare global_use_radiosity = on;

#declare global_ambient_mul = 1;
#declare global_ambient_mul_emit = 0;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare e3d_environment = off;

#local cam_x = 0;
#local cam_y = 196;
#local cam_z = -105;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -4;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 0;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#local pcb_wire_bridges = off;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 21;
#local lgt1_pos_y = 32;
#local lgt1_pos_z = 24;
#local lgt1_intense = 0.737147;
#local lgt2_pos_x = -21;
#local lgt2_pos_y = 32;
#local lgt2_pos_z = 24;
#local lgt2_intense = 0.737147;
#local lgt3_pos_x = 21;
#local lgt3_pos_y = 32;
#local lgt3_pos_z = -16;
#local lgt3_intense = 0.737147;
#local lgt4_pos_x = -21;
#local lgt4_pos_y = 32;
#local lgt4_pos_z = -16;
#local lgt4_intense = 0.737147;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 56.800000;
#declare pcb_y_size = 45.780000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(625);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "e3d_tools.inc"
#include "e3d_user.inc"

global_settings{charset utf8}

#if(e3d_environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animation data
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "No/not enough Animation Data available (min. 3 points) (Flight path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "No/not enough Animation Data available (min. 3 points) (View path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-28.400000,0,-22.890000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro ESP_WROOM_32_BREAKOUT(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,16
<0.200000,0.200000><0.200000,45.980000>
<0.200000,45.980000><57.000000,45.980000>
<57.000000,45.980000><57.000000,0.200000>
<57.000000,0.200000><0.200000,0.200000>
<9.100000,39.100000><9.100000,45.400000>
<9.100000,45.400000><26.500000,45.400000>
<26.500000,45.400000><26.500000,39.100000>
<26.500000,39.100000><9.100000,39.100000>
texture{col_brd}}
}//End union(PCB)
//Holes(real)/Parts
//Holes(real)/Board
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_0603()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<19.110000,0.000000,6.898000>translate<0,0.035000,0> }#end		//SMD Capacitor 0603 C1 10u C0603
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_SMD_CHIP_0603()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<16.490000,0.000000,11.168000>translate<0,0.035000,0> }#end		//SMD Capacitor 0603 C2 10u C0603
#ifndef(pack_C3) #declare global_pack_C3=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<6.596000,0.000000,37.200000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C3 22u 0805
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_SMD_CHIP_0603()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<11.296000,0.000000,16.172000>translate<0,0.035000,0> }#end		//SMD Capacitor 0603 C4 10u C0603
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_SMD_CHIP_0603()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<13.308000,0.000000,4.566000>translate<0,0.035000,0> }#end		//SMD Capacitor 0603 C5 2u2 C0603
#ifndef(pack_C7) #declare global_pack_C7=yes; object {CAP_SMD_CHIP_0603()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<10.136000,0.000000,8.772000>translate<0,0.035000,0> }#end		//SMD Capacitor 0603 C7 3n3 0603
#ifndef(pack_C8) #declare global_pack_C8=yes; object {CAP_SMD_CHIP_0603()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<5.172000,0.000000,37.308000>translate<0,0.035000,0> }#end		//SMD Capacitor 0603 C8 100n C0603
#ifndef(pack_C9) #declare global_pack_C9=yes; object {CAP_SMD_CHIP_0603()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<23.316000,0.000000,5.368000>translate<0,0.035000,0> }#end		//SMD Capacitor 0603 C9 100n C0603
#ifndef(pack_D1) #declare global_pack_D1=yes; object {DIODE_SMD_MELF("SM4007",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<47.100000,0.000000,33.900000>translate<0,0.035000,0> }#end		//SMD-Diode MELF-Outline D1 SM4007 MELF-MLL41
//#ifndef(pack_K1) #declare global_pack_K1=yes; object {IC_BECK_SC12()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<46.900000,0.000000,20.400000>}#end		//BECK IPC@CHIP SC1x K1 ZF112 ZF112
#ifndef(pack_LED1) #declare global_pack_LED1=yes; object {DIODE_SMD_LED_CHIP_0603(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,90.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<6.800000,0.000000,7.100000>translate<0,0.035000,0> }#end		//SMD-LED im 0603 LED1  CHIPLED_0603
#ifndef(pack_OK1) #declare global_pack_OK1=yes; object {IC_DIS_DIP4("PC817","ST",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<34.300000,0.000000,28.000000>}#end		//DIP4 OK1 PC817 DIL04
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_0603("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<27.232000,0.000000,16.664000>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R1 10k R0603
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_0603("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<2.240000,0.000000,40.648000>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R2 10k R0603
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_SMD_CHIP_0603("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<18.476000,0.000000,4.650000>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R3 0 R0603
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_SMD_CHIP_0603("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<27.124000,0.000000,13.100000>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R4 10K R0603
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_SMD_CHIP_0805("102",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<30.500000,0.000000,36.900000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R5 1K R0805
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_SMD_CHIP_0805("102",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<38.400000,-1.500000,27.700000>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 R6 1K R0805
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_SMD_CHIP_0603("102",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<6.800000,0.000000,8.490000>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R7 1K R0603
#ifndef(pack_R8) #declare global_pack_R8=yes; object {RES_SMD_CHIP_0603("154",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<8.900000,0.000000,13.800000>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R8 150K R0603
#ifndef(pack_R9) #declare global_pack_R9=yes; object {RES_SMD_CHIP_0603("473",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<8.900000,0.000000,10.800000>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R9 47K R0603
#ifndef(pack_T1) #declare global_pack_T1=yes; object {TR_TO18("2N2222",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<39.100000,0.000000,35.800000>}#end		//  T1 2N2222 TO18
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<18.260000,0.000000,6.898000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<19.960000,0.000000,6.898000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<16.490000,0.000000,10.318000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<16.490000,0.000000,12.018000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<6.596000,0.000000,36.300000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<6.596000,0.000000,38.100000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<11.296000,0.000000,15.322000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<11.296000,0.000000,17.022000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<12.458000,0.000000,4.566000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<14.158000,0.000000,4.566000>}
object{TOOLS_PCB_SMD(3.556000,1.778000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<18.788000,-1.537000,36.568000>}
object{TOOLS_PCB_SMD(3.556000,1.778000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.692000,-1.537000,36.568000>}
object{TOOLS_PCB_SMD(1.000000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<10.986000,0.000000,8.772000>}
object{TOOLS_PCB_SMD(1.000000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<9.286000,0.000000,8.772000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<5.172000,0.000000,36.458000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<5.172000,0.000000,38.158000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<24.166000,0.000000,5.368000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<22.466000,0.000000,5.368000>}
object{TOOLS_PCB_SMD(3.200000,1.650000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<13.073000,0.000000,16.200000>}
object{TOOLS_PCB_SMD(3.200000,1.650000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<16.927000,0.000000,16.200000>}
object{TOOLS_PCB_SMD(2.500000,3.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.475000,0.000000,33.900000>}
object{TOOLS_PCB_SMD(2.500000,3.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<49.725000,0.000000,33.900000>}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.000000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<22.050000,0,14.084000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.000000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<19.510000,0,14.084000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<5.070000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.000000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<9.644000,0,2.324000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.000000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<7.104000,0,2.324000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.000000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<4.564000,0,2.324000> texture{col_thl}}
#ifndef(global_pack_K1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<52.894400,0,26.496000> texture{col_thl}}
#ifndef(global_pack_K1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<40.905600,0,26.496000> texture{col_thl}}
#ifndef(global_pack_K1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<52.894400,0,14.304000> texture{col_thl}}
#ifndef(global_pack_K1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.705100,1.803400,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<46.900000,0,28.604200> texture{col_thl}}
#ifndef(global_pack_K1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<40.905600,0,14.304000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.016000,0.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<6.050000,0.000000,7.100000>}
object{TOOLS_PCB_SMD(1.016000,0.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<7.650000,0.000000,7.100000>}
#ifndef(global_pack_OK1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,4+global_tmp,100) rotate<0,-90.000000,0>translate<35.570000,0,31.810000> texture{col_thl}}
#ifndef(global_pack_OK1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,4+global_tmp,100) rotate<0,-90.000000,0>translate<33.030000,0,31.810000> texture{col_thl}}
#ifndef(global_pack_OK1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,4+global_tmp,100) rotate<0,-270.000000,0>translate<33.030000,0,24.190000> texture{col_thl}}
#ifndef(global_pack_OK1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,4+global_tmp,100) rotate<0,-270.000000,0>translate<35.570000,0,24.190000> texture{col_thl}}
#ifndef(global_pack_P1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.000000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<26.154000,0,2.224000> texture{col_thl}}
#ifndef(global_pack_P1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.000000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<23.614000,0,2.224000> texture{col_thl}}
#ifndef(global_pack_P1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.000000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<21.074000,0,2.224000> texture{col_thl}}
#ifndef(global_pack_P1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.000000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<18.534000,0,2.224000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<28.540000,0.000000,2.214000>}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<32.540000,0.000000,2.214000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<28.082000,0.000000,16.664000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<26.382000,0.000000,16.664000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<1.390000,0.000000,40.648000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<3.090000,0.000000,40.648000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<18.476000,0.000000,3.800000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<18.476000,0.000000,5.500000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<26.274000,0.000000,13.100000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<27.974000,0.000000,13.100000>}
object{TOOLS_PCB_SMD(1.200000,1.300000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<29.484000,0.000000,36.900000>}
object{TOOLS_PCB_SMD(1.200000,1.300000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<31.516000,0.000000,36.900000>}
object{TOOLS_PCB_SMD(1.200000,1.300000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<38.400000,-1.537000,26.684000>}
object{TOOLS_PCB_SMD(1.200000,1.300000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<38.400000,-1.537000,28.716000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<5.950000,0.000000,8.490000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<7.650000,0.000000,8.490000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<8.900000,0.000000,14.650000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<8.900000,0.000000,12.950000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<8.900000,0.000000,9.950000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<8.900000,0.000000,11.650000>}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<16.246000,0.000000,1.904000>}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<12.246000,0.000000,1.904000>}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<37.830000,0,34.530000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<40.370000,0,34.530000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<40.370000,0,37.070000> texture{col_thl}}
object{TOOLS_PCB_SMD(0.558800,1.193800,0.037000,51) rotate<0,-270.000000,0> texture{col_pds} translate<18.191100,0.000000,11.650600>}
object{TOOLS_PCB_SMD(0.600000,2.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<19.688000,0.000000,10.152000>}
object{TOOLS_PCB_SMD(2.000000,3.000000,0.037000,40) rotate<0,-90.000000,0> texture{col_pds} translate<21.074000,0.000000,10.152000>}
object{TOOLS_PCB_SMD(0.558800,1.193800,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<18.191100,0.000000,10.152000>}
object{TOOLS_PCB_SMD(0.558800,1.193800,0.037000,51) rotate<0,-270.000000,0> texture{col_pds} translate<18.191100,0.000000,8.653400>}
object{TOOLS_PCB_SMD(0.500000,0.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<13.708000,0.000000,10.660000>}
object{TOOLS_PCB_SMD(0.500000,0.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<13.708000,0.000000,11.310000>}
object{TOOLS_PCB_SMD(0.500000,0.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<13.708000,0.000000,11.960000>}
object{TOOLS_PCB_SMD(0.500000,0.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<13.708000,0.000000,12.610000>}
object{TOOLS_PCB_SMD(0.500000,0.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<11.608000,0.000000,12.610000>}
object{TOOLS_PCB_SMD(0.500000,0.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<11.608000,0.000000,11.960000>}
object{TOOLS_PCB_SMD(0.500000,0.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<11.608000,0.000000,11.310000>}
object{TOOLS_PCB_SMD(0.500000,0.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<11.608000,0.000000,10.660000>}
object{TOOLS_PCB_SMD(1.100000,1.900000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<12.658000,0.000000,11.660000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<8.772000,0.000000,38.172000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<8.772000,0.000000,36.902000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<8.772000,0.000000,35.632000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<8.772000,0.000000,34.362000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<8.772000,0.000000,33.092000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<8.772000,0.000000,31.822000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<8.772000,0.000000,30.552000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<8.772000,0.000000,29.282000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<8.772000,0.000000,28.012000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<8.772000,0.000000,26.742000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<8.772000,0.000000,25.472000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<8.772000,0.000000,24.202000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<8.772000,0.000000,22.932000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<8.772000,0.000000,21.662000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<12.057000,0.000000,20.172000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<13.327000,0.000000,20.172000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<14.597000,0.000000,20.172000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<15.867000,0.000000,20.172000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<17.137000,0.000000,20.172000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<18.407000,0.000000,20.172000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.677000,0.000000,20.172000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<20.947000,0.000000,20.172000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<22.217000,0.000000,20.172000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.487000,0.000000,20.172000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<26.772000,0.000000,21.662000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<26.772000,0.000000,22.932000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<26.772000,0.000000,24.202000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<26.772000,0.000000,25.472000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<26.772000,0.000000,26.742000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<26.772000,0.000000,28.012000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<26.772000,0.000000,29.282000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<26.772000,0.000000,30.552000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<26.772000,0.000000,31.822000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<26.772000,0.000000,33.092000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<26.772000,0.000000,34.362000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<26.772000,0.000000,35.632000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<26.772000,0.000000,36.902000>}
object{TOOLS_PCB_SMD(0.900000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<26.772000,0.000000,38.172000>}
object{TOOLS_PCB_SMD(6.000000,6.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<17.772000,0.000000,30.472000>}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<51.980000,0,5.935000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<46.900000,0,5.935000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<41.820000,0,5.935000> texture{col_thl}}
//Pads/Vias
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<12.200000,0,1.900000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<12.700000,0,35.400000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<12.700000,0,37.800000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<12.700000,0,36.700000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<15.700000,0,32.400000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<17.200000,0,32.400000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<18.700000,0,32.400000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<15.700000,0,30.900000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<17.200000,0,30.900000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<18.700000,0,30.900000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<15.700000,0,29.400000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<17.200000,0,29.400000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<18.700000,0,29.400000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<15.700000,0,27.900000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<17.200000,0,27.900000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<18.700000,0,27.900000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<20.200000,0,32.400000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<20.200000,0,30.900000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<20.200000,0,29.400000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<20.200000,0,27.900000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<18.000000,0,31.600000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<19.400000,0,31.600000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<16.500000,0,31.600000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<16.500000,0,30.200000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<18.000000,0,30.100000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<19.400000,0,30.200000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<16.500000,0,28.700000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<17.900000,0,28.700000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<19.400000,0,28.700000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<8.900000,0,38.200000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<14.100000,0,4.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.655600,0.300000,1,16,1,0) translate<12.500000,0,7.900000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<26.900000,0,38.200000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.655600,0.300000,1,16,1,0) translate<24.700000,0,14.900000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.655600,0.300000,1,16,1,0) translate<24.700000,0,18.100000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.655600,0.300000,1,16,1,0) translate<13.200000,0,18.600000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.655600,0.300000,1,16,1,0) translate<8.400000,0,5.900000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.500000,1.000000,1,16,2,0) translate<2.100000,0,44.200000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.500000,1.000000,1,16,2,0) translate<55.000000,0,44.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.500000,1.000000,1,16,2,0) translate<28.900000,0,19.900000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.500000,1.000000,1,16,2,0) translate<4.100000,0,19.900000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<26.800000,0,34.300000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<8.900000,0,36.900000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<11.180000,0,15.290000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.655600,0.300000,1,16,1,0) translate<10.130000,0,12.880000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.655600,0.300000,1,16,1,0) translate<9.990000,0,13.760000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<13.350000,0,17.050000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<6.700000,0,36.300000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<5.100000,0,36.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<13.350000,0,16.150000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<13.350000,0,15.150000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.655600,0.300000,1,16,1,0) translate<24.200000,0,5.300000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.655600,0.300000,1,16,1,0) translate<18.500000,0,5.300000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.655600,0.300000,1,16,1,0) translate<18.200000,0,8.700000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.655600,0.300000,1,16,1,0) translate<14.800000,0,12.700000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.855600,0.500000,1,16,1,0) translate<26.700000,0,10.300000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.390000,0.000000,40.648000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.390000,0.000000,36.010000>}
box{<0,0,-0.203200><4.638000,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.390000,0.000000,36.010000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.400000,0.000000,1.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.400000,0.000000,35.264000>}
box{<0,0,-0.203200><33.564000,0.035000,0.203200> rotate<0,90.000000,0> translate<1.400000,0.000000,35.264000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.390000,0.000000,36.010000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.768000,0.000000,35.632000>}
box{<0,0,-0.203200><0.534573,0.035000,0.203200> rotate<0,44.997030,0> translate<1.390000,0.000000,36.010000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.400000,0.000000,35.264000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.768000,0.000000,35.632000>}
box{<0,0,-0.203200><0.520431,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.400000,0.000000,35.264000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.400000,0.000000,2.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.400000,0.000000,7.500000>}
box{<0,0,-0.203200><4.600000,0.035000,0.203200> rotate<0,90.000000,0> translate<2.400000,0.000000,7.500000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.400000,0.000000,1.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.500000,0.000000,0.600000>}
box{<0,0,-0.203200><1.555635,0.035000,0.203200> rotate<0,44.997030,0> translate<1.400000,0.000000,1.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.400000,0.000000,2.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.976000,0.000000,2.324000>}
box{<0,0,-0.203200><0.814587,0.035000,0.203200> rotate<0,44.997030,0> translate<2.400000,0.000000,2.900000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.090000,0.000000,40.648000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.090000,0.000000,40.510000>}
box{<0,0,-0.152400><0.138000,0.035000,0.152400> rotate<0,-90.000000,0> translate<3.090000,0.000000,40.510000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.400000,0.000000,7.500000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.400000,0.000000,8.500000>}
box{<0,0,-0.203200><1.414214,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.400000,0.000000,7.500000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.000000,0.000000,39.600000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.000000,0.000000,37.600000>}
box{<0,0,-0.203200><2.000000,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.000000,0.000000,37.600000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.090000,0.000000,40.510000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.000000,0.000000,39.600000>}
box{<0,0,-0.203200><1.286934,0.035000,0.203200> rotate<0,44.997030,0> translate<3.090000,0.000000,40.510000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.976000,0.000000,2.324000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.564000,0.000000,2.324000>}
box{<0,0,-0.203200><1.588000,0.035000,0.203200> rotate<0,0.000000,0> translate<2.976000,0.000000,2.324000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.000000,0.000000,37.600000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.100000,0.000000,36.500000>}
box{<0,0,-0.203200><1.555635,0.035000,0.203200> rotate<0,44.997030,0> translate<4.000000,0.000000,37.600000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.172000,0.000000,38.158000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.314000,0.000000,38.100000>}
box{<0,0,-0.304800><0.153388,0.035000,0.304800> rotate<0,22.216128,0> translate<5.172000,0.000000,38.158000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.172000,0.000000,36.458000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.330000,0.000000,36.300000>}
box{<0,0,-0.304800><0.223446,0.035000,0.304800> rotate<0,44.997030,0> translate<5.172000,0.000000,36.458000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.400000,0.000000,8.500000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.940000,0.000000,8.500000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<3.400000,0.000000,8.500000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.940000,0.000000,8.500000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.950000,0.000000,8.490000>}
box{<0,0,-0.203200><0.014142,0.035000,0.203200> rotate<0,44.997030,0> translate<5.940000,0.000000,8.500000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.950000,0.000000,8.490000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.000000,0.000000,8.540000>}
box{<0,0,-0.203200><0.070711,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.950000,0.000000,8.490000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.000000,0.000000,9.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.000000,0.000000,8.540000>}
box{<0,0,-0.203200><1.360000,0.035000,0.203200> rotate<0,-90.000000,0> translate<6.000000,0.000000,8.540000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.000000,0.000000,9.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.050000,0.000000,9.950000>}
box{<0,0,-0.203200><0.070711,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.000000,0.000000,9.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.050000,0.000000,7.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.100000,0.000000,7.050000>}
box{<0,0,-0.203200><0.070711,0.035000,0.203200> rotate<0,44.997030,0> translate<6.050000,0.000000,7.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.100000,0.000000,6.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.100000,0.000000,7.050000>}
box{<0,0,-0.203200><0.850000,0.035000,0.203200> rotate<0,90.000000,0> translate<6.100000,0.000000,7.050000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.100000,0.000000,6.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.400000,0.000000,5.900000>}
box{<0,0,-0.203200><0.424264,0.035000,0.203200> rotate<0,44.997030,0> translate<6.100000,0.000000,6.200000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.330000,0.000000,36.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.596000,0.000000,36.300000>}
box{<0,0,-0.304800><1.266000,0.035000,0.304800> rotate<0,0.000000,0> translate<5.330000,0.000000,36.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.314000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.596000,0.000000,38.100000>}
box{<0,0,-0.304800><1.282000,0.035000,0.304800> rotate<0,0.000000,0> translate<5.314000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.700000,0.000000,36.300000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.700000,0.000000,36.700000>}
box{<0,0,-0.203200><0.400000,0.035000,0.203200> rotate<0,90.000000,0> translate<6.700000,0.000000,36.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.700000,0.000000,36.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.000000,0.000000,37.000000>}
box{<0,0,-0.203200><0.424264,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.700000,0.000000,36.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.104000,0.000000,2.324000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.104000,0.000000,3.504000>}
box{<0,0,-0.203200><1.180000,0.035000,0.203200> rotate<0,90.000000,0> translate<7.104000,0.000000,3.504000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.650000,0.000000,7.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.650000,0.000000,8.490000>}
box{<0,0,-0.203200><1.390000,0.035000,0.203200> rotate<0,90.000000,0> translate<7.650000,0.000000,8.490000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.400000,0.000000,5.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.400000,0.000000,5.900000>}
box{<0,0,-0.203200><2.000000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.400000,0.000000,5.900000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.596000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.600000,0.000000,38.100000>}
box{<0,0,-0.304800><2.004000,0.035000,0.304800> rotate<0,0.000000,0> translate<6.596000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.000000,0.000000,37.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.674000,0.000000,37.000000>}
box{<0,0,-0.203200><1.674000,0.035000,0.203200> rotate<0,0.000000,0> translate<7.000000,0.000000,37.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.768000,0.000000,35.632000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.772000,0.000000,35.632000>}
box{<0,0,-0.203200><7.004000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.768000,0.000000,35.632000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.674000,0.000000,37.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.772000,0.000000,36.902000>}
box{<0,0,-0.203200><0.138593,0.035000,0.203200> rotate<0,44.997030,0> translate<8.674000,0.000000,37.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.772000,0.000000,38.172000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.800000,0.000000,38.200000>}
box{<0,0,-0.203200><0.039598,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.772000,0.000000,38.172000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.780000,0.000000,12.670000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.860000,0.000000,11.960000>}
box{<0,0,-0.203200><0.714493,0.035000,0.203200> rotate<0,83.565737,0> translate<8.780000,0.000000,12.670000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.050000,0.000000,9.950000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.900000,0.000000,9.950000>}
box{<0,0,-0.203200><2.850000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.050000,0.000000,9.950000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.800000,0.000000,38.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.900000,0.000000,38.200000>}
box{<0,0,-0.203200><0.100000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.800000,0.000000,38.200000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.600000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.928000,0.000000,38.072000>}
box{<0,0,-0.304800><0.329193,0.035000,0.304800> rotate<0,4.878952,0> translate<8.600000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.772000,0.000000,38.172000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.928000,0.000000,38.072000>}
box{<0,0,-0.304800><0.185300,0.035000,0.304800> rotate<0,32.658757,0> translate<8.772000,0.000000,38.172000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.900000,0.000000,9.950000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.950000,0.000000,9.950000>}
box{<0,0,-0.203200><0.050000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.900000,0.000000,9.950000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.860000,0.000000,11.960000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.060000,0.000000,12.626000>}
box{<0,0,-0.203200><0.695382,0.035000,0.203200> rotate<0,-73.280135,0> translate<8.860000,0.000000,11.960000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.780000,0.000000,12.670000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.100000,0.000000,11.846000>}
box{<0,0,-0.203200><0.883955,0.035000,0.203200> rotate<0,68.771805,0> translate<8.780000,0.000000,12.670000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.400000,-1.535000,5.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.200000,-1.535000,6.700000>}
box{<0,0,-0.203200><1.131371,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.400000,-1.535000,5.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.200000,-1.535000,17.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.200000,-1.535000,6.700000>}
box{<0,0,-0.203200><11.200000,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.200000,-1.535000,6.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.900000,0.000000,14.650000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.200000,0.000000,14.650000>}
box{<0,0,-0.203200><0.300000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.900000,0.000000,14.650000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.286000,0.000000,8.772000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.300000,0.000000,8.758000>}
box{<0,0,-0.203200><0.019799,0.035000,0.203200> rotate<0,44.997030,0> translate<9.286000,0.000000,8.772000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.300000,0.000000,7.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.300000,0.000000,8.758000>}
box{<0,0,-0.203200><0.858000,0.035000,0.203200> rotate<0,90.000000,0> translate<9.300000,0.000000,8.758000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.286000,0.000000,8.772000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.300000,0.000000,8.786000>}
box{<0,0,-0.203200><0.019799,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.286000,0.000000,8.772000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.300000,0.000000,9.600000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.300000,0.000000,8.786000>}
box{<0,0,-0.203200><0.814000,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.300000,0.000000,8.786000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.950000,0.000000,9.950000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.300000,0.000000,9.600000>}
box{<0,0,-0.203200><0.494975,0.035000,0.203200> rotate<0,44.997030,0> translate<8.950000,0.000000,9.950000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.300000,0.000000,7.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.400000,0.000000,7.800000>}
box{<0,0,-0.203200><0.141421,0.035000,0.203200> rotate<0,44.997030,0> translate<9.300000,0.000000,7.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.900000,-1.535000,38.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.400000,-1.535000,38.100000>}
box{<0,0,-0.203200><0.509902,0.035000,0.203200> rotate<0,11.309186,0> translate<8.900000,-1.535000,38.200000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<9.644000,0.000000,2.324000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<9.644000,0.000000,4.344000>}
box{<0,0,-0.508000><2.020000,0.035000,0.508000> rotate<0,90.000000,0> translate<9.644000,0.000000,4.344000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.900000,-1.535000,36.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.800000,-1.535000,36.900000>}
box{<0,0,-0.203200><0.900000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.900000,-1.535000,36.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.200000,-1.535000,17.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.900000,-1.535000,18.600000>}
box{<0,0,-0.203200><0.989949,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.200000,-1.535000,17.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.400000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.900000,-1.535000,38.100000>}
box{<0,0,-0.203200><0.500000,0.035000,0.203200> rotate<0,0.000000,0> translate<9.400000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.200000,0.000000,14.650000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.990000,0.000000,13.760000>}
box{<0,0,-0.203200><1.190042,0.035000,0.203200> rotate<0,48.403249,0> translate<9.200000,0.000000,14.650000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.000000,0.000000,16.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.000000,0.000000,14.900000>}
box{<0,0,-0.203200><2.000000,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.000000,0.000000,14.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.000000,0.000000,16.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.122000,0.000000,17.022000>}
box{<0,0,-0.203200><0.172534,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.000000,0.000000,16.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.910000,0.000000,13.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.130000,0.000000,12.880000>}
box{<0,0,-0.203200><0.897385,0.035000,0.203200> rotate<0,75.803900,0> translate<9.910000,0.000000,13.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.900000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.200000,-1.535000,37.800000>}
box{<0,0,-0.203200><0.424264,0.035000,0.203200> rotate<0,44.997030,0> translate<9.900000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.400000,-1.535000,36.300000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.400000,-1.535000,34.400000>}
box{<0,0,-0.203200><1.900000,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.400000,-1.535000,34.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.800000,-1.535000,36.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.400000,-1.535000,36.300000>}
box{<0,0,-0.203200><0.848528,0.035000,0.203200> rotate<0,44.997030,0> translate<9.800000,-1.535000,36.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.104000,0.000000,3.504000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.600000,0.000000,6.900000>}
box{<0,0,-0.203200><4.873893,0.035000,0.203200> rotate<0,-44.165806,0> translate<7.104000,0.000000,3.504000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.130000,0.000000,12.880000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.790000,0.000000,12.610000>}
box{<0,0,-0.203200><0.713092,0.035000,0.203200> rotate<0,22.247555,0> translate<10.130000,0.000000,12.880000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.400000,-1.535000,34.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.900000,-1.535000,33.900000>}
box{<0,0,-0.203200><0.707107,0.035000,0.203200> rotate<0,44.997030,0> translate<10.400000,-1.535000,34.400000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<9.644000,0.000000,4.344000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<11.200000,0.000000,5.900000>}
box{<0,0,-0.508000><2.200516,0.035000,0.508000> rotate<0,-44.997030,0> translate<9.644000,0.000000,4.344000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.000000,0.000000,14.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.242000,0.000000,13.658000>}
box{<0,0,-0.203200><1.756453,0.035000,0.203200> rotate<0,44.997030,0> translate<10.000000,0.000000,14.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.122000,0.000000,17.022000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.296000,0.000000,17.022000>}
box{<0,0,-0.203200><1.174000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.122000,0.000000,17.022000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.296000,0.000000,17.022000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.296000,0.000000,17.996000>}
box{<0,0,-0.203200><0.974000,0.035000,0.203200> rotate<0,90.000000,0> translate<11.296000,0.000000,17.996000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.986000,0.000000,8.772000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.608000,0.000000,9.394000>}
box{<0,0,-0.203200><0.879641,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.986000,0.000000,8.772000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.608000,0.000000,10.660000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.608000,0.000000,9.394000>}
box{<0,0,-0.203200><1.266000,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.608000,0.000000,9.394000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.860000,0.000000,11.960000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.608000,0.000000,11.960000>}
box{<0,0,-0.203200><2.748000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.860000,0.000000,11.960000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.790000,0.000000,12.610000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.608000,0.000000,12.610000>}
box{<0,0,-0.203200><0.818000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.790000,0.000000,12.610000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.500000,0.000000,0.600000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.900000,0.000000,0.600000>}
box{<0,0,-0.203200><9.400000,0.035000,0.203200> rotate<0,0.000000,0> translate<2.500000,0.000000,0.600000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.296000,0.000000,17.996000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.000000,0.000000,18.700000>}
box{<0,0,-0.203200><0.995606,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.296000,0.000000,17.996000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.000000,0.000000,18.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.000000,0.000000,20.115000>}
box{<0,0,-0.203200><1.415000,0.035000,0.203200> rotate<0,90.000000,0> translate<12.000000,0.000000,20.115000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.000000,0.000000,20.115000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.057000,0.000000,20.172000>}
box{<0,0,-0.203200><0.080610,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.000000,0.000000,20.115000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.057000,0.000000,20.172000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.057000,0.000000,27.257000>}
box{<0,0,-0.203200><7.085000,0.035000,0.203200> rotate<0,90.000000,0> translate<12.057000,0.000000,27.257000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.900000,0.000000,0.600000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.246000,0.000000,0.946000>}
box{<0,0,-0.203200><0.489318,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.900000,0.000000,0.600000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.246000,0.000000,1.946000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.246000,0.000000,0.946000>}
box{<0,0,-0.203200><1.000000,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.246000,0.000000,0.946000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.200000,0.000000,1.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.246000,0.000000,1.946000>}
box{<0,0,-0.203200><0.065054,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.200000,0.000000,1.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.246000,0.000000,4.558000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.246000,0.000000,1.946000>}
box{<0,0,-0.203200><2.612000,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.246000,0.000000,1.946000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.246000,0.000000,1.904000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.246000,0.000000,4.558000>}
box{<0,0,-0.304800><2.654000,0.035000,0.304800> rotate<0,90.000000,0> translate<12.246000,0.000000,4.558000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.400000,0.000000,7.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.300000,0.000000,7.800000>}
box{<0,0,-0.203200><2.900000,0.035000,0.203200> rotate<0,0.000000,0> translate<9.400000,0.000000,7.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.246000,0.000000,4.558000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.458000,0.000000,4.566000>}
box{<0,0,-0.203200><0.212151,0.035000,0.203200> rotate<0,-2.160937,0> translate<12.246000,0.000000,4.558000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.300000,0.000000,7.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.550000,0.000000,8.050000>}
box{<0,0,-0.203200><0.353553,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.300000,0.000000,7.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.500000,0.000000,7.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.550000,0.000000,8.050000>}
box{<0,0,-0.203200><0.158114,0.035000,0.203200> rotate<0,-71.560328,0> translate<12.500000,0.000000,7.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.550000,0.000000,8.050000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.658000,0.000000,8.158000>}
box{<0,0,-0.203200><0.152735,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.550000,0.000000,8.050000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.658000,0.000000,11.660000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.658000,0.000000,8.158000>}
box{<0,0,-0.203200><3.502000,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.658000,0.000000,8.158000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.057000,0.000000,27.257000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,27.900000>}
box{<0,0,-0.203200><0.909339,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.057000,0.000000,27.257000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,35.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,32.800000>}
box{<0,0,-0.203200><2.600000,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.700000,0.000000,32.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.200000,-1.535000,37.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,37.800000>}
box{<0,0,-0.203200><2.500000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.200000,-1.535000,37.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.242000,0.000000,13.658000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.800000,0.000000,13.658000>}
box{<0,0,-0.203200><1.558000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.242000,0.000000,13.658000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.800000,0.000000,15.322000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.800000,0.000000,15.300000>}
box{<0,0,-0.203200><0.022000,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.800000,0.000000,15.300000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.296000,0.000000,15.322000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.800000,0.000000,15.322000>}
box{<0,0,-0.406400><1.504000,0.035000,0.406400> rotate<0,0.000000,0> translate<11.296000,0.000000,15.322000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.658000,0.000000,11.660000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.958000,0.000000,11.960000>}
box{<0,0,-0.203200><0.424264,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.658000,0.000000,11.660000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.800000,0.000000,13.658000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.958000,0.000000,13.500000>}
box{<0,0,-0.203200><0.223446,0.035000,0.203200> rotate<0,44.997030,0> translate<12.800000,0.000000,13.658000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.958000,0.000000,11.960000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.958000,0.000000,13.500000>}
box{<0,0,-0.203200><1.540000,0.035000,0.203200> rotate<0,90.000000,0> translate<12.958000,0.000000,13.500000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.600000,0.000000,6.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.100000,0.000000,6.900000>}
box{<0,0,-0.203200><2.500000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.600000,0.000000,6.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,32.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.100000,0.000000,32.400000>}
box{<0,0,-0.203200><0.565685,0.035000,0.203200> rotate<0,44.997030,0> translate<12.700000,0.000000,32.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.900000,-1.535000,18.600000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.200000,-1.535000,18.600000>}
box{<0,0,-0.203200><3.300000,0.035000,0.203200> rotate<0,0.000000,0> translate<9.900000,-1.535000,18.600000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.200000,0.000000,18.600000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.327000,0.000000,18.727000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.200000,0.000000,18.600000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.327000,0.000000,20.172000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.327000,0.000000,18.727000>}
box{<0,0,-0.203200><1.445000,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.327000,0.000000,18.727000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.350000,0.000000,15.300000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.350000,0.000000,15.150000>}
box{<0,0,-0.203200><0.150000,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.350000,0.000000,15.150000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.800000,0.000000,15.300000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.350000,0.000000,15.300000>}
box{<0,0,-0.203200><0.550000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.800000,0.000000,15.300000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.350000,0.000000,17.050000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.400000,0.000000,17.100000>}
box{<0,0,-0.203200><0.070711,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.350000,0.000000,17.050000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.100000,0.000000,6.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.700000,0.000000,7.700000>}
box{<0,0,-0.203200><1.000000,0.035000,0.203200> rotate<0,-53.126596,0> translate<13.100000,0.000000,6.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.700000,0.000000,7.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.700000,0.000000,10.652000>}
box{<0,0,-0.203200><2.952000,0.035000,0.203200> rotate<0,90.000000,0> translate<13.700000,0.000000,10.652000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.700000,0.000000,10.652000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.708000,0.000000,10.660000>}
box{<0,0,-0.203200><0.011314,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.700000,0.000000,10.652000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.958000,0.000000,11.960000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.708000,0.000000,11.960000>}
box{<0,0,-0.203200><0.750000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.958000,0.000000,11.960000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.708000,0.000000,12.610000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.798000,0.000000,12.700000>}
box{<0,0,-0.203200><0.127279,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.708000,0.000000,12.610000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<11.200000,0.000000,5.900000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<13.900000,0.000000,5.900000>}
box{<0,0,-0.508000><2.700000,0.035000,0.508000> rotate<0,0.000000,0> translate<11.200000,0.000000,5.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.900000,-1.535000,33.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.900000,-1.535000,33.900000>}
box{<0,0,-0.203200><3.000000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.900000,-1.535000,33.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.500000,-1.535000,7.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.100000,-1.535000,6.400000>}
box{<0,0,-0.203200><2.193171,0.035000,0.203200> rotate<0,43.149542,0> translate<12.500000,-1.535000,7.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.100000,-1.535000,4.500000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.100000,-1.535000,6.400000>}
box{<0,0,-0.203200><1.900000,0.035000,0.203200> rotate<0,90.000000,0> translate<14.100000,-1.535000,6.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.100000,0.000000,4.500000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.158000,0.000000,4.842000>}
box{<0,0,-0.203200><0.346883,0.035000,0.203200> rotate<0,-80.369447,0> translate<14.100000,0.000000,4.500000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.158000,0.000000,4.566000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.158000,0.000000,4.842000>}
box{<0,0,-0.203200><0.276000,0.035000,0.203200> rotate<0,90.000000,0> translate<14.158000,0.000000,4.842000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.158000,0.000000,4.566000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.224000,0.000000,4.500000>}
box{<0,0,-0.203200><0.093338,0.035000,0.203200> rotate<0,44.997030,0> translate<14.158000,0.000000,4.566000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.350000,-1.535000,17.050000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.250000,-1.535000,17.050000>}
box{<0,0,-0.203200><0.900000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.350000,-1.535000,17.050000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.400000,0.000000,17.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.300000,0.000000,17.100000>}
box{<0,0,-0.203200><0.900000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.400000,0.000000,17.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.798000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.800000,0.000000,12.700000>}
box{<0,0,-0.203200><1.002000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.798000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.250000,-1.535000,17.050000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.800000,-1.535000,17.600000>}
box{<0,0,-0.203200><0.777817,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.250000,-1.535000,17.050000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.300000,0.000000,17.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.800000,0.000000,17.600000>}
box{<0,0,-0.203200><0.707107,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.300000,0.000000,17.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.800000,0.000000,18.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.800000,0.000000,17.600000>}
box{<0,0,-0.203200><0.600000,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.800000,0.000000,17.600000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.800000,-1.535000,17.600000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.800000,-1.535000,21.600000>}
box{<0,0,-0.203200><4.000000,0.035000,0.203200> rotate<0,90.000000,0> translate<14.800000,-1.535000,21.600000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.708000,0.000000,11.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.990000,0.000000,11.310000>}
box{<0,0,-0.203200><1.282000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.708000,0.000000,11.310000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<14.990000,0.000000,11.310000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<15.000000,0.000000,10.200000>}
box{<0,0,-0.508000><1.110045,0.035000,0.508000> rotate<0,89.477930,0> translate<14.990000,0.000000,11.310000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<13.900000,0.000000,5.900000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<15.100000,0.000000,7.300000>}
box{<0,0,-0.508000><1.843909,0.035000,0.508000> rotate<0,-49.395445,0> translate<13.900000,0.000000,5.900000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<15.100000,0.000000,7.300000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<15.100000,0.000000,10.100000>}
box{<0,0,-0.508000><2.800000,0.035000,0.508000> rotate<0,90.000000,0> translate<15.100000,0.000000,10.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.800000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.100000,-1.535000,12.400000>}
box{<0,0,-0.203200><0.424264,0.035000,0.203200> rotate<0,44.997030,0> translate<14.800000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.100000,-1.535000,8.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.100000,-1.535000,12.400000>}
box{<0,0,-0.203200><3.600000,0.035000,0.203200> rotate<0,90.000000,0> translate<15.100000,-1.535000,12.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.100000,-1.535000,8.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.200000,-1.535000,8.700000>}
box{<0,0,-0.203200><0.141421,0.035000,0.203200> rotate<0,44.997030,0> translate<15.100000,-1.535000,8.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.800000,-1.535000,21.600000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.200000,-1.535000,22.000000>}
box{<0,0,-0.203200><0.565685,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.800000,-1.535000,21.600000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.800000,0.000000,18.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.300000,0.000000,18.700000>}
box{<0,0,-0.203200><0.707107,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.800000,0.000000,18.200000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.000000,0.000000,10.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.400000,0.000000,10.400000>}
box{<0,0,-0.203200><0.447214,0.035000,0.203200> rotate<0,-26.563298,0> translate<15.000000,0.000000,10.200000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.100000,0.000000,10.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.400000,0.000000,10.400000>}
box{<0,0,-0.203200><0.424264,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.100000,0.000000,10.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,27.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.700000,0.000000,27.900000>}
box{<0,0,-0.203200><3.000000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.700000,0.000000,27.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.100000,0.000000,32.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.700000,0.000000,32.400000>}
box{<0,0,-0.203200><2.600000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.100000,0.000000,32.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.224000,0.000000,4.500000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.800000,0.000000,4.500000>}
box{<0,0,-0.203200><1.576000,0.035000,0.203200> rotate<0,0.000000,0> translate<14.224000,0.000000,4.500000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.800000,0.000000,4.500000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.246000,0.000000,4.054000>}
box{<0,0,-0.203200><0.630739,0.035000,0.203200> rotate<0,44.997030,0> translate<15.800000,0.000000,4.500000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.246000,0.000000,1.904000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.246000,0.000000,4.054000>}
box{<0,0,-0.203200><2.150000,0.035000,0.203200> rotate<0,90.000000,0> translate<16.246000,0.000000,4.054000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.400000,0.000000,10.400000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.408000,0.000000,10.400000>}
box{<0,0,-0.406400><1.008000,0.035000,0.406400> rotate<0,0.000000,0> translate<15.400000,0.000000,10.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.800000,0.000000,13.658000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.432000,0.000000,13.658000>}
box{<0,0,-0.203200><3.632000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.800000,0.000000,13.658000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.408000,0.000000,10.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.490000,0.000000,10.318000>}
box{<0,0,-0.203200><0.115966,0.035000,0.203200> rotate<0,44.997030,0> translate<16.408000,0.000000,10.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.490000,0.000000,10.152000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.490000,0.000000,10.318000>}
box{<0,0,-0.203200><0.166000,0.035000,0.203200> rotate<0,90.000000,0> translate<16.490000,0.000000,10.318000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.432000,0.000000,13.658000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.490000,0.000000,13.600000>}
box{<0,0,-0.203200><0.082024,0.035000,0.203200> rotate<0,44.997030,0> translate<16.432000,0.000000,13.658000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.490000,0.000000,12.018000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.490000,0.000000,13.600000>}
box{<0,0,-0.203200><1.582000,0.035000,0.203200> rotate<0,90.000000,0> translate<16.490000,0.000000,13.600000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.490000,0.000000,13.600000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.490000,0.000000,15.390000>}
box{<0,0,-0.203200><1.790000,0.035000,0.203200> rotate<0,90.000000,0> translate<16.490000,0.000000,15.390000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.900000,-1.535000,33.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.600000,-1.535000,36.600000>}
box{<0,0,-0.203200><3.818377,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.900000,-1.535000,33.900000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.490000,0.000000,10.318000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.608000,0.000000,10.200000>}
box{<0,0,-0.406400><0.166877,0.035000,0.406400> rotate<0,44.997030,0> translate<16.490000,0.000000,10.318000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.490000,0.000000,12.018000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.608000,0.000000,11.900000>}
box{<0,0,-0.203200><0.166877,0.035000,0.203200> rotate<0,44.997030,0> translate<16.490000,0.000000,12.018000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<16.490000,0.000000,10.318000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<16.682000,0.000000,10.318000>}
box{<0,0,-0.250000><0.192000,0.035000,0.250000> rotate<0,0.000000,0> translate<16.490000,0.000000,10.318000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<16.682000,0.000000,10.318000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<16.750000,0.000000,10.170000>}
box{<0,0,-0.250000><0.162874,0.035000,0.250000> rotate<0,65.318826,0> translate<16.682000,0.000000,10.318000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.490000,0.000000,15.390000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.800000,0.000000,15.700000>}
box{<0,0,-0.203200><0.438406,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.490000,0.000000,15.390000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.800000,0.000000,15.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.800000,0.000000,16.073000>}
box{<0,0,-0.203200><0.373000,0.035000,0.203200> rotate<0,90.000000,0> translate<16.800000,0.000000,16.073000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.800000,0.000000,16.073000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.927000,0.000000,16.200000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.800000,0.000000,16.073000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.608000,0.000000,11.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.100000,0.000000,11.900000>}
box{<0,0,-0.203200><0.492000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.608000,0.000000,11.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.100000,0.000000,11.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.349400,0.000000,11.650600>}
box{<0,0,-0.203200><0.352705,0.035000,0.203200> rotate<0,44.997030,0> translate<17.100000,0.000000,11.900000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.750000,0.000000,10.170000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.093100,0.000000,10.170000>}
box{<0,0,-0.304800><1.343100,0.035000,0.304800> rotate<0,0.000000,0> translate<16.750000,0.000000,10.170000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.191100,0.000000,8.653400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.191100,0.000000,6.966900>}
box{<0,0,-0.203200><1.686500,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.191100,0.000000,6.966900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.146600,0.000000,8.753400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.191100,0.000000,8.653400>}
box{<0,0,-0.203200><0.109454,0.035000,0.203200> rotate<0,66.006580,0> translate<18.146600,0.000000,8.753400> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<18.093100,0.000000,10.170000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<18.191100,0.000000,10.152000>}
box{<0,0,-0.250000><0.099639,0.035000,0.250000> rotate<0,10.407024,0> translate<18.093100,0.000000,10.170000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.349400,0.000000,11.650600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.191100,0.000000,11.650600>}
box{<0,0,-0.203200><0.841700,0.035000,0.203200> rotate<0,0.000000,0> translate<17.349400,0.000000,11.650600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.200000,0.000000,6.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.200000,0.000000,6.838000>}
box{<0,0,-0.203200><0.838000,0.035000,0.203200> rotate<0,90.000000,0> translate<18.200000,0.000000,6.838000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.191100,0.000000,8.653400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.200000,0.000000,8.553400>}
box{<0,0,-0.203200><0.100395,0.035000,0.203200> rotate<0,84.908472,0> translate<18.191100,0.000000,8.653400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.200000,-1.535000,8.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.200000,-1.535000,8.700000>}
box{<0,0,-0.203200><3.000000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.200000,-1.535000,8.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.146600,0.000000,8.753400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.200000,0.000000,8.700000>}
box{<0,0,-0.203200><0.075519,0.035000,0.203200> rotate<0,44.997030,0> translate<18.146600,0.000000,8.753400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.191100,0.000000,6.966900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.260000,0.000000,6.898000>}
box{<0,0,-0.203200><0.097439,0.035000,0.203200> rotate<0,44.997030,0> translate<18.191100,0.000000,6.966900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.200000,0.000000,6.838000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.260000,0.000000,6.898000>}
box{<0,0,-0.203200><0.084853,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.200000,0.000000,6.838000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.200000,0.000000,6.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.476000,0.000000,5.724000>}
box{<0,0,-0.203200><0.390323,0.035000,0.203200> rotate<0,44.997030,0> translate<18.200000,0.000000,6.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.476000,0.000000,5.500000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.476000,0.000000,5.724000>}
box{<0,0,-0.203200><0.224000,0.035000,0.203200> rotate<0,90.000000,0> translate<18.476000,0.000000,5.724000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.534000,0.000000,3.800000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.534000,0.000000,2.224000>}
box{<0,0,-0.406400><1.576000,0.035000,0.406400> rotate<0,-90.000000,0> translate<18.534000,0.000000,2.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.476000,0.000000,3.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.534000,0.000000,3.800000>}
box{<0,0,-0.203200><0.058000,0.035000,0.203200> rotate<0,0.000000,0> translate<18.476000,0.000000,3.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.476000,0.000000,5.500000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.676000,0.000000,5.300000>}
box{<0,0,-0.203200><0.282843,0.035000,0.203200> rotate<0,44.997030,0> translate<18.476000,0.000000,5.500000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.500000,0.000000,5.300000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.676000,0.000000,5.300000>}
box{<0,0,-0.203200><0.176000,0.035000,0.203200> rotate<0,0.000000,0> translate<18.500000,0.000000,5.300000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.600000,-1.535000,36.600000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.820000,-1.535000,36.600000>}
box{<0,0,-0.203200><2.220000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.600000,-1.535000,36.600000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.788000,-1.535000,36.568000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.820000,-1.535000,36.600000>}
box{<0,0,-0.203200><0.045255,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.788000,-1.535000,36.568000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.191100,0.000000,11.650600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.950600,0.000000,11.650600>}
box{<0,0,-0.203200><0.759500,0.035000,0.203200> rotate<0,0.000000,0> translate<18.191100,0.000000,11.650600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.500000,0.000000,12.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.500000,0.000000,14.074000>}
box{<0,0,-0.203200><1.174000,0.035000,0.203200> rotate<0,90.000000,0> translate<19.500000,0.000000,14.074000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.500000,0.000000,14.074000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.510000,0.000000,14.084000>}
box{<0,0,-0.203200><0.014142,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.500000,0.000000,14.074000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.950600,0.000000,11.650600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.850000,0.000000,12.550000>}
box{<0,0,-0.203200><1.271944,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.950600,0.000000,11.650600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.500000,0.000000,12.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.850000,0.000000,12.550000>}
box{<0,0,-0.203200><0.494975,0.035000,0.203200> rotate<0,44.997030,0> translate<19.500000,0.000000,12.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.850000,0.000000,12.550000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.100000,0.000000,12.300000>}
box{<0,0,-0.203200><0.353553,0.035000,0.203200> rotate<0,44.997030,0> translate<19.850000,0.000000,12.550000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.200000,0.000000,37.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.200000,0.000000,32.400000>}
box{<0,0,-0.203200><5.400000,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.200000,0.000000,32.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.200000,0.000000,37.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.572000,0.000000,38.172000>}
box{<0,0,-0.203200><0.526087,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.200000,0.000000,37.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.074000,0.000000,2.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.074000,0.000000,3.800000>}
box{<0,0,-0.203200><1.576000,0.035000,0.203200> rotate<0,90.000000,0> translate<21.074000,0.000000,3.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.074000,0.000000,3.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.074000,0.000000,4.874000>}
box{<0,0,-0.203200><1.074000,0.035000,0.203200> rotate<0,90.000000,0> translate<21.074000,0.000000,4.874000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.074000,0.000000,3.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.174000,0.000000,3.700000>}
box{<0,0,-0.203200><0.141421,0.035000,0.203200> rotate<0,44.997030,0> translate<21.074000,0.000000,3.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.300000,0.000000,18.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.200000,0.000000,18.700000>}
box{<0,0,-0.203200><5.900000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.300000,0.000000,18.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.074000,0.000000,4.874000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.500000,0.000000,5.300000>}
box{<0,0,-0.203200><0.602455,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.074000,0.000000,4.874000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.050000,0.000000,14.084000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.050000,0.000000,16.600000>}
box{<0,0,-0.203200><2.516000,0.035000,0.203200> rotate<0,90.000000,0> translate<22.050000,0.000000,16.600000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.200000,0.000000,18.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.050000,0.000000,17.850000>}
box{<0,0,-0.203200><1.202082,0.035000,0.203200> rotate<0,44.997030,0> translate<21.200000,0.000000,18.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.050000,0.000000,16.600000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.050000,0.000000,17.850000>}
box{<0,0,-0.203200><1.250000,0.035000,0.203200> rotate<0,90.000000,0> translate<22.050000,0.000000,17.850000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.200000,-1.535000,22.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.100000,-1.535000,22.000000>}
box{<0,0,-0.203200><6.900000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.200000,-1.535000,22.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.050000,0.000000,16.600000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.150000,0.000000,16.700000>}
box{<0,0,-0.203200><0.141421,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.050000,0.000000,16.600000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.500000,0.000000,5.300000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.398000,0.000000,5.300000>}
box{<0,0,-0.203200><0.898000,0.035000,0.203200> rotate<0,0.000000,0> translate<21.500000,0.000000,5.300000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.398000,0.000000,5.300000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.466000,0.000000,5.368000>}
box{<0,0,-0.203200><0.096167,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.398000,0.000000,5.300000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.820000,-1.535000,36.600000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.700000,-1.535000,36.600000>}
box{<0,0,-0.203200><3.880000,0.035000,0.203200> rotate<0,0.000000,0> translate<18.820000,-1.535000,36.600000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.100000,-1.535000,22.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.300000,-1.535000,23.100000>}
box{<0,0,-0.203200><1.627882,0.035000,0.203200> rotate<0,-42.507642,0> translate<22.100000,-1.535000,22.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.700000,-1.535000,36.600000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.300000,-1.535000,36.100000>}
box{<0,0,-0.203200><0.781025,0.035000,0.203200> rotate<0,39.802944,0> translate<22.700000,-1.535000,36.600000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.300000,-1.535000,23.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.300000,-1.535000,36.100000>}
box{<0,0,-0.203200><13.000000,0.035000,0.203200> rotate<0,90.000000,0> translate<23.300000,-1.535000,36.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.487000,0.000000,20.172000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.559000,0.000000,20.100000>}
box{<0,0,-0.203200><0.101823,0.035000,0.203200> rotate<0,44.997030,0> translate<23.487000,0.000000,20.172000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.968000,0.000000,5.368000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.166000,0.000000,5.368000>}
box{<0,0,-0.203200><0.198000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.968000,0.000000,5.368000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.500000,-1.535000,5.300000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.200000,-1.535000,5.300000>}
box{<0,0,-0.203200><5.700000,0.035000,0.203200> rotate<0,0.000000,0> translate<18.500000,-1.535000,5.300000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.968000,0.000000,5.368000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.200000,0.000000,5.300000>}
box{<0,0,-0.203200><0.241760,0.035000,0.203200> rotate<0,16.334965,0> translate<23.968000,0.000000,5.368000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.559000,0.000000,20.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.200000,0.000000,20.100000>}
box{<0,0,-0.203200><0.641000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.559000,0.000000,20.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.100000,0.000000,12.300000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.700000,0.000000,12.300000>}
box{<0,0,-0.203200><4.600000,0.035000,0.203200> rotate<0,0.000000,0> translate<20.100000,0.000000,12.300000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.700000,-1.535000,14.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.700000,-1.535000,18.100000>}
box{<0,0,-0.203200><3.200000,0.035000,0.203200> rotate<0,90.000000,0> translate<24.700000,-1.535000,18.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.200000,0.000000,20.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.700000,0.000000,19.600000>}
box{<0,0,-0.203200><0.707107,0.035000,0.203200> rotate<0,44.997030,0> translate<24.200000,0.000000,20.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.700000,0.000000,18.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.700000,0.000000,19.600000>}
box{<0,0,-0.203200><1.500000,0.035000,0.203200> rotate<0,90.000000,0> translate<24.700000,0.000000,19.600000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.900000,-1.535000,35.300000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.900000,-1.535000,21.700000>}
box{<0,0,-0.406400><13.600000,0.035000,0.406400> rotate<0,-90.000000,0> translate<24.900000,-1.535000,21.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.614000,-1.535000,2.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.938000,-1.535000,0.900000>}
box{<0,0,-0.203200><1.872419,0.035000,0.203200> rotate<0,44.997030,0> translate<23.614000,-1.535000,2.224000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.900000,-1.535000,35.300000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<25.200000,-1.535000,35.600000>}
box{<0,0,-0.406400><0.424264,0.035000,0.406400> rotate<0,-44.997030,0> translate<24.900000,-1.535000,35.300000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.700000,0.000000,12.300000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.500000,0.000000,13.100000>}
box{<0,0,-0.203200><1.131371,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.700000,0.000000,12.300000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.154000,0.000000,2.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.154000,0.000000,1.246000>}
box{<0,0,-0.203200><0.978000,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.154000,0.000000,1.246000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.500000,0.000000,13.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.274000,0.000000,13.100000>}
box{<0,0,-0.203200><0.774000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.500000,0.000000,13.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.150000,0.000000,16.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.346000,0.000000,16.700000>}
box{<0,0,-0.203200><4.196000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.150000,0.000000,16.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.346000,0.000000,16.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.382000,0.000000,16.664000>}
box{<0,0,-0.203200><0.050912,0.035000,0.203200> rotate<0,44.997030,0> translate<26.346000,0.000000,16.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.154000,0.000000,1.246000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.500000,0.000000,0.900000>}
box{<0,0,-0.203200><0.489318,0.035000,0.203200> rotate<0,44.997030,0> translate<26.154000,0.000000,1.246000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.608000,0.000000,10.200000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.700000,0.000000,10.200000>}
box{<0,0,-0.406400><10.092000,0.035000,0.406400> rotate<0,0.000000,0> translate<16.608000,0.000000,10.200000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.700000,0.000000,10.300000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.700000,0.000000,10.200000>}
box{<0,0,-0.406400><0.100000,0.035000,0.406400> rotate<0,-90.000000,0> translate<26.700000,0.000000,10.200000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.700000,-1.535000,19.900000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.700000,-1.535000,10.300000>}
box{<0,0,-0.406400><9.600000,0.035000,0.406400> rotate<0,-90.000000,0> translate<26.700000,-1.535000,10.300000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.900000,-1.535000,21.700000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.700000,-1.535000,19.900000>}
box{<0,0,-0.406400><2.545584,0.035000,0.406400> rotate<0,44.997030,0> translate<24.900000,-1.535000,21.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.772000,0.000000,21.662000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.772000,0.000000,19.128000>}
box{<0,0,-0.203200><2.534000,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.772000,0.000000,19.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.572000,0.000000,38.172000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.772000,0.000000,38.172000>}
box{<0,0,-0.203200><6.200000,0.035000,0.203200> rotate<0,0.000000,0> translate<20.572000,0.000000,38.172000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.772000,0.000000,33.092000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.780000,0.000000,33.100000>}
box{<0,0,-0.203200><0.011314,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.772000,0.000000,33.092000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.772000,0.000000,38.172000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.800000,0.000000,38.200000>}
box{<0,0,-0.203200><0.039598,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.772000,0.000000,38.172000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.772000,0.000000,34.362000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.834000,0.000000,34.300000>}
box{<0,0,-0.203200><0.087681,0.035000,0.203200> rotate<0,44.997030,0> translate<26.772000,0.000000,34.362000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.800000,0.000000,34.300000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.834000,0.000000,34.300000>}
box{<0,0,-0.203200><0.034000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.800000,0.000000,34.300000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.800000,0.000000,38.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.900000,0.000000,38.200000>}
box{<0,0,-0.203200><0.100000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.800000,0.000000,38.200000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.700000,0.000000,14.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.600000,0.000000,14.900000>}
box{<0,0,-0.203200><2.900000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.700000,0.000000,14.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.174000,0.000000,3.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.900000,0.000000,3.700000>}
box{<0,0,-0.203200><6.726000,0.035000,0.203200> rotate<0,0.000000,0> translate<21.174000,0.000000,3.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.600000,0.000000,14.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.974000,0.000000,14.526000>}
box{<0,0,-0.203200><0.528916,0.035000,0.203200> rotate<0,44.997030,0> translate<27.600000,0.000000,14.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.974000,0.000000,13.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.974000,0.000000,14.526000>}
box{<0,0,-0.203200><1.426000,0.035000,0.203200> rotate<0,90.000000,0> translate<27.974000,0.000000,14.526000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.082000,0.000000,16.664000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.100000,0.000000,16.646000>}
box{<0,0,-0.203200><0.025456,0.035000,0.203200> rotate<0,44.997030,0> translate<28.082000,0.000000,16.664000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.100000,0.000000,15.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.100000,0.000000,16.646000>}
box{<0,0,-0.203200><0.846000,0.035000,0.203200> rotate<0,90.000000,0> translate<28.100000,0.000000,16.646000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.082000,0.000000,16.664000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.200000,0.000000,16.782000>}
box{<0,0,-0.203200><0.166877,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.082000,0.000000,16.664000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.200000,0.000000,17.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.200000,0.000000,16.782000>}
box{<0,0,-0.203200><0.918000,0.035000,0.203200> rotate<0,-90.000000,0> translate<28.200000,0.000000,16.782000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.772000,0.000000,19.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.200000,0.000000,17.700000>}
box{<0,0,-0.203200><2.019497,0.035000,0.203200> rotate<0,44.997030,0> translate<26.772000,0.000000,19.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.900000,0.000000,3.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.540000,0.000000,3.060000>}
box{<0,0,-0.203200><0.905097,0.035000,0.203200> rotate<0,44.997030,0> translate<27.900000,0.000000,3.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.540000,0.000000,2.214000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.540000,0.000000,3.060000>}
box{<0,0,-0.203200><0.846000,0.035000,0.203200> rotate<0,90.000000,0> translate<28.540000,0.000000,3.060000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.780000,0.000000,33.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.700000,0.000000,33.100000>}
box{<0,0,-0.203200><1.920000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.780000,0.000000,33.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.800000,-1.535000,34.300000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.000000,-1.535000,34.300000>}
box{<0,0,-0.203200><2.200000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.800000,-1.535000,34.300000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.772000,0.000000,36.902000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.482000,0.000000,36.902000>}
box{<0,0,-0.203200><2.710000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.772000,0.000000,36.902000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.482000,0.000000,36.902000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.484000,0.000000,36.900000>}
box{<0,0,-0.203200><0.002828,0.035000,0.203200> rotate<0,44.997030,0> translate<29.482000,0.000000,36.902000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.100000,0.000000,15.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.400000,0.000000,13.500000>}
box{<0,0,-0.203200><3.252691,0.035000,0.203200> rotate<0,44.997030,0> translate<28.100000,0.000000,15.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.400000,0.000000,2.600000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.400000,0.000000,13.500000>}
box{<0,0,-0.203200><10.900000,0.035000,0.203200> rotate<0,90.000000,0> translate<30.400000,0.000000,13.500000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.700000,0.000000,33.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.700000,0.000000,31.100000>}
box{<0,0,-0.203200><2.828427,0.035000,0.203200> rotate<0,44.997030,0> translate<28.700000,0.000000,33.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.700000,0.000000,15.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.700000,0.000000,31.100000>}
box{<0,0,-0.203200><15.300000,0.035000,0.203200> rotate<0,90.000000,0> translate<30.700000,0.000000,31.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.000000,-1.535000,34.300000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.700000,-1.535000,32.600000>}
box{<0,0,-0.203200><2.404163,0.035000,0.203200> rotate<0,44.997030,0> translate<29.000000,-1.535000,34.300000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.700000,-1.535000,15.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.700000,-1.535000,32.600000>}
box{<0,0,-0.203200><16.800000,0.035000,0.203200> rotate<0,90.000000,0> translate<30.700000,-1.535000,32.600000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<25.200000,-1.535000,35.600000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.700000,-1.535000,35.600000>}
box{<0,0,-0.406400><5.500000,0.035000,0.406400> rotate<0,0.000000,0> translate<25.200000,-1.535000,35.600000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.400000,0.000000,2.600000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.786000,0.000000,2.214000>}
box{<0,0,-0.203200><0.545886,0.035000,0.203200> rotate<0,44.997030,0> translate<30.400000,0.000000,2.600000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.700000,-1.535000,35.600000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<31.700000,-1.535000,34.600000>}
box{<0,0,-0.406400><1.414214,0.035000,0.406400> rotate<0,44.997030,0> translate<30.700000,-1.535000,35.600000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<31.700000,-1.535000,21.500000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<31.700000,-1.535000,34.600000>}
box{<0,0,-0.406400><13.100000,0.035000,0.406400> rotate<0,90.000000,0> translate<31.700000,-1.535000,34.600000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<31.700000,-1.535000,21.500000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.100000,-1.535000,21.100000>}
box{<0,0,-0.406400><0.565685,0.035000,0.406400> rotate<0,44.997030,0> translate<31.700000,-1.535000,21.500000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.786000,0.000000,2.214000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.540000,0.000000,2.214000>}
box{<0,0,-0.203200><1.754000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.786000,0.000000,2.214000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.900000,-1.535000,38.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.600000,-1.535000,38.200000>}
box{<0,0,-0.203200><5.700000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.900000,-1.535000,38.200000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.030000,-1.535000,24.190000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.030000,-1.535000,26.030000>}
box{<0,0,-0.203200><1.840000,0.035000,0.203200> rotate<0,90.000000,0> translate<33.030000,-1.535000,26.030000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.600000,-1.535000,38.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.030000,-1.535000,37.770000>}
box{<0,0,-0.203200><0.608112,0.035000,0.203200> rotate<0,44.997030,0> translate<32.600000,-1.535000,38.200000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.030000,-1.535000,31.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.030000,-1.535000,37.770000>}
box{<0,0,-0.203200><5.960000,0.035000,0.203200> rotate<0,90.000000,0> translate<33.030000,-1.535000,37.770000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.030000,0.000000,31.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.100000,0.000000,31.740000>}
box{<0,0,-0.203200><0.098995,0.035000,0.203200> rotate<0,44.997030,0> translate<33.030000,0.000000,31.810000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.100000,0.000000,30.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.100000,0.000000,31.740000>}
box{<0,0,-0.203200><1.040000,0.035000,0.203200> rotate<0,90.000000,0> translate<33.100000,0.000000,31.740000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.100000,0.000000,30.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.400000,0.000000,30.400000>}
box{<0,0,-0.203200><0.424264,0.035000,0.203200> rotate<0,44.997030,0> translate<33.100000,0.000000,30.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.938000,-1.535000,0.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.600000,-1.535000,0.900000>}
box{<0,0,-0.203200><8.662000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.938000,-1.535000,0.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.500000,0.000000,0.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.600000,0.000000,0.900000>}
box{<0,0,-0.203200><7.100000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.500000,0.000000,0.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.030000,-1.535000,26.030000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.700000,-1.535000,26.700000>}
box{<0,0,-0.203200><0.947523,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.030000,-1.535000,26.030000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.600000,0.000000,0.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.400000,0.000000,1.700000>}
box{<0,0,-0.203200><1.131371,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.600000,0.000000,0.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.600000,-1.535000,0.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.400000,-1.535000,1.700000>}
box{<0,0,-0.203200><1.131371,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.600000,-1.535000,0.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.700000,0.000000,15.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.400000,0.000000,12.100000>}
box{<0,0,-0.203200><5.232590,0.035000,0.203200> rotate<0,44.997030,0> translate<30.700000,0.000000,15.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.700000,-1.535000,15.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.400000,-1.535000,12.100000>}
box{<0,0,-0.203200><5.232590,0.035000,0.203200> rotate<0,44.997030,0> translate<30.700000,-1.535000,15.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.400000,0.000000,1.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.400000,0.000000,12.100000>}
box{<0,0,-0.203200><10.400000,0.035000,0.203200> rotate<0,90.000000,0> translate<34.400000,0.000000,12.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.400000,-1.535000,1.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.400000,-1.535000,12.100000>}
box{<0,0,-0.203200><10.400000,0.035000,0.203200> rotate<0,90.000000,0> translate<34.400000,-1.535000,12.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.516000,0.000000,36.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.600000,0.000000,36.900000>}
box{<0,0,-0.203200><3.084000,0.035000,0.203200> rotate<0,0.000000,0> translate<31.516000,0.000000,36.900000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.100000,-1.535000,21.100000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.700000,-1.535000,21.100000>}
box{<0,0,-0.406400><2.600000,0.035000,0.406400> rotate<0,0.000000,0> translate<32.100000,-1.535000,21.100000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.570000,0.000000,24.190000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.570000,0.000000,21.730000>}
box{<0,0,-0.406400><2.460000,0.035000,0.406400> rotate<0,-90.000000,0> translate<35.570000,0.000000,21.730000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.700000,-1.535000,21.100000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.570000,-1.535000,21.970000>}
box{<0,0,-0.406400><1.230366,0.035000,0.406400> rotate<0,-44.997030,0> translate<34.700000,-1.535000,21.100000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.570000,-1.535000,24.190000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.570000,-1.535000,21.970000>}
box{<0,0,-0.406400><2.220000,0.035000,0.406400> rotate<0,-90.000000,0> translate<35.570000,-1.535000,21.970000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.600000,0.000000,36.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.570000,0.000000,35.930000>}
box{<0,0,-0.203200><1.371787,0.035000,0.203200> rotate<0,44.997030,0> translate<34.600000,0.000000,36.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.570000,0.000000,31.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.570000,0.000000,35.930000>}
box{<0,0,-0.203200><4.120000,0.035000,0.203200> rotate<0,90.000000,0> translate<35.570000,0.000000,35.930000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.570000,0.000000,21.730000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.200000,0.000000,21.100000>}
box{<0,0,-0.406400><0.890955,0.035000,0.406400> rotate<0,44.997030,0> translate<35.570000,0.000000,21.730000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.400000,0.000000,30.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.200000,0.000000,30.400000>}
box{<0,0,-0.203200><3.800000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.400000,0.000000,30.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.200000,0.000000,30.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.830000,0.000000,31.030000>}
box{<0,0,-0.203200><0.890955,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.200000,0.000000,30.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.830000,0.000000,34.530000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.830000,0.000000,31.030000>}
box{<0,0,-0.203200><3.500000,0.035000,0.203200> rotate<0,-90.000000,0> translate<37.830000,0.000000,31.030000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.700000,-1.535000,26.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.384000,-1.535000,26.700000>}
box{<0,0,-0.203200><4.684000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.700000,-1.535000,26.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.384000,-1.535000,26.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.400000,-1.535000,26.684000>}
box{<0,0,-0.203200><0.022627,0.035000,0.203200> rotate<0,44.997030,0> translate<38.384000,-1.535000,26.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.400000,-1.535000,28.716000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.400000,-1.535000,30.400000>}
box{<0,0,-0.203200><1.684000,0.035000,0.203200> rotate<0,90.000000,0> translate<38.400000,-1.535000,30.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.400000,-1.535000,30.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.370000,-1.535000,32.370000>}
box{<0,0,-0.203200><2.786001,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.400000,-1.535000,30.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.370000,-1.535000,34.530000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.370000,-1.535000,32.370000>}
box{<0,0,-0.203200><2.160000,0.035000,0.203200> rotate<0,-90.000000,0> translate<40.370000,-1.535000,32.370000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<40.905600,-1.535000,14.304000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<40.905600,-1.535000,6.849400>}
box{<0,0,-0.635000><7.454600,0.035000,0.635000> rotate<0,-90.000000,0> translate<40.905600,-1.535000,6.849400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.905600,0.000000,26.496000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.000000,0.000000,26.590400>}
box{<0,0,-0.406400><0.133502,0.035000,0.406400> rotate<0,-44.997030,0> translate<40.905600,0.000000,26.496000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.000000,0.000000,29.800000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.000000,0.000000,26.590400>}
box{<0,0,-0.406400><3.209600,0.035000,0.406400> rotate<0,-90.000000,0> translate<41.000000,0.000000,26.590400> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<40.905600,-1.535000,6.849400>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<41.820000,-1.535000,5.935000>}
box{<0,0,-0.635000><1.293157,0.035000,0.635000> rotate<0,44.997030,0> translate<40.905600,-1.535000,6.849400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.370000,0.000000,37.070000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.830000,0.000000,37.070000>}
box{<0,0,-0.203200><3.460000,0.035000,0.203200> rotate<0,0.000000,0> translate<40.370000,0.000000,37.070000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.000000,0.000000,29.800000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.475000,0.000000,33.275000>}
box{<0,0,-0.406400><4.914392,0.035000,0.406400> rotate<0,-44.997030,0> translate<41.000000,0.000000,29.800000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.475000,0.000000,33.900000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.475000,0.000000,33.275000>}
box{<0,0,-0.406400><0.625000,0.035000,0.406400> rotate<0,-90.000000,0> translate<44.475000,0.000000,33.275000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.475000,0.000000,33.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.500000,0.000000,33.925000>}
box{<0,0,-0.203200><0.035355,0.035000,0.203200> rotate<0,-44.997030,0> translate<44.475000,0.000000,33.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.500000,0.000000,36.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.500000,0.000000,33.925000>}
box{<0,0,-0.203200><2.475000,0.035000,0.203200> rotate<0,-90.000000,0> translate<44.500000,0.000000,33.925000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.830000,0.000000,37.070000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.500000,0.000000,36.400000>}
box{<0,0,-0.203200><0.947523,0.035000,0.203200> rotate<0,44.997030,0> translate<43.830000,0.000000,37.070000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<46.900000,-1.535000,28.604200>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<46.900000,-1.535000,5.935000>}
box{<0,0,-0.635000><22.669200,0.035000,0.635000> rotate<0,-90.000000,0> translate<46.900000,-1.535000,5.935000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.200000,0.000000,21.100000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<51.100000,0.000000,21.100000>}
box{<0,0,-0.406400><14.900000,0.035000,0.406400> rotate<0,0.000000,0> translate<36.200000,0.000000,21.100000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.725000,0.000000,33.900000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.500000,0.000000,33.900000>}
box{<0,0,-0.406400><2.775000,0.035000,0.406400> rotate<0,0.000000,0> translate<49.725000,0.000000,33.900000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<51.980000,-1.535000,5.935000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.894400,-1.535000,6.849400>}
box{<0,0,-0.635000><1.293157,0.035000,0.635000> rotate<0,-44.997030,0> translate<51.980000,-1.535000,5.935000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.894400,-1.535000,14.304000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.894400,-1.535000,6.849400>}
box{<0,0,-0.635000><7.454600,0.035000,0.635000> rotate<0,-90.000000,0> translate<52.894400,-1.535000,6.849400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<51.100000,0.000000,21.100000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.900000,0.000000,22.900000>}
box{<0,0,-0.406400><2.545584,0.035000,0.406400> rotate<0,-44.997030,0> translate<51.100000,0.000000,21.100000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.894400,0.000000,26.496000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.900000,0.000000,26.490400>}
box{<0,0,-0.406400><0.007920,0.035000,0.406400> rotate<0,44.997030,0> translate<52.894400,0.000000,26.496000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.900000,0.000000,22.900000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.900000,0.000000,26.490400>}
box{<0,0,-0.406400><3.590400,0.035000,0.406400> rotate<0,90.000000,0> translate<52.900000,0.000000,26.490400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.894400,0.000000,26.496000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.900000,0.000000,26.501600>}
box{<0,0,-0.406400><0.007920,0.035000,0.406400> rotate<0,-44.997030,0> translate<52.894400,0.000000,26.496000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.900000,0.000000,33.500000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.900000,0.000000,26.501600>}
box{<0,0,-0.406400><6.998400,0.035000,0.406400> rotate<0,-90.000000,0> translate<52.900000,0.000000,26.501600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.500000,0.000000,33.900000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.900000,0.000000,33.500000>}
box{<0,0,-0.406400><0.565685,0.035000,0.406400> rotate<0,44.997030,0> translate<52.500000,0.000000,33.900000> }
//Text
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,0.808797>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,38.500553>}
box{<0,0,-0.152400><37.691756,0.035000,0.152400> rotate<0,90.000000,0> translate<0.808797,-1.535000,38.500553> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,0.808797>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.951572,-1.535000,0.808797>}
box{<0,0,-0.152400><23.142775,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,0.808797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,0.914400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.001334,-1.535000,0.914400>}
box{<0,0,-0.152400><11.192538,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,0.914400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.693144,-1.535000,1.219200>}
box{<0,0,-0.152400><2.884347,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.388344,-1.535000,1.524000>}
box{<0,0,-0.152400><2.579547,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,1.828800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.257016,-1.535000,1.828800>}
box{<0,0,-0.152400><2.448219,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,1.828800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,2.133600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.167000,-1.535000,2.133600>}
box{<0,0,-0.152400><2.358203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,2.133600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.167000,-1.535000,2.438400>}
box{<0,0,-0.152400><2.358203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,2.743200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.225538,-1.535000,2.743200>}
box{<0,0,-0.152400><2.416741,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,2.743200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.351791,-1.535000,3.048000>}
box{<0,0,-0.152400><2.542994,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,3.352800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.617147,-1.535000,3.352800>}
box{<0,0,-0.152400><2.808350,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,3.352800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.133066,-1.535000,3.657600>}
box{<0,0,-0.152400><3.324269,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,3.962400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.254791,-1.535000,3.962400>}
box{<0,0,-0.152400><12.445994,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,3.962400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,4.267200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.128538,-1.535000,4.267200>}
box{<0,0,-0.152400><12.319741,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,4.267200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.113400,-1.535000,4.572000>}
box{<0,0,-0.152400><12.304603,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.188188,-1.535000,4.876800>}
box{<0,0,-0.152400><12.379391,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,5.181600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.864556,-1.535000,5.181600>}
box{<0,0,-0.152400><7.055759,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,5.181600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.611666,-1.535000,5.486400>}
box{<0,0,-0.152400><6.802869,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,5.791200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.513400,-1.535000,5.791200>}
box{<0,0,-0.152400><6.704603,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,5.791200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.521537,-1.535000,6.096000>}
box{<0,0,-0.152400><6.712741,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,6.400800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.647791,-1.535000,6.400800>}
box{<0,0,-0.152400><6.838994,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,6.400800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.028100,-1.535000,6.705600>}
box{<0,0,-0.152400><7.219303,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,7.010400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.432772,-1.535000,7.010400>}
box{<0,0,-0.152400><7.623975,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,7.010400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,7.315200>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,7.620000>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,7.924800>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,8.229600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,8.229600>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,8.229600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,8.534400>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,8.839200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,8.839200>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,8.839200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,9.144000>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,9.448800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,9.448800>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,9.448800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,9.753600>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,10.058400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,10.058400>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,10.058400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,10.363200>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,10.668000>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,10.972800>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,11.277600>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,11.582400>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,11.887200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,11.887200>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,11.887200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,12.192000>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,12.496800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,12.496800>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,12.496800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,12.801600>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,13.106400>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,13.411200>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,13.716000>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,14.020800>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,14.325600>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,14.630400>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,14.935200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,14.935200>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,14.935200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,15.240000>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,15.544800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,15.544800>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,15.544800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,15.849600>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,16.154400>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,16.459200>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,16.764000>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,17.068800>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,17.373600>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,17.678400>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,17.983200>}
box{<0,0,-0.152400><7.629203,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.535931,-1.535000,18.288000>}
box{<0,0,-0.152400><7.727134,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.556278,-1.535000,18.592800>}
box{<0,0,-0.152400><2.747481,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.251478,-1.535000,18.897600>}
box{<0,0,-0.152400><2.442681,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.946678,-1.535000,19.202400>}
box{<0,0,-0.152400><2.137881,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.791200,-1.535000,19.507200>}
box{<0,0,-0.152400><1.982403,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.791200,-1.535000,19.812000>}
box{<0,0,-0.152400><1.982403,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.791200,-1.535000,20.116800>}
box{<0,0,-0.152400><1.982403,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.791200,-1.535000,20.421600>}
box{<0,0,-0.152400><1.982403,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.075481,-1.535000,20.726400>}
box{<0,0,-0.152400><2.266684,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.380281,-1.535000,21.031200>}
box{<0,0,-0.152400><2.571484,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.006047,-1.535000,21.336000>}
box{<0,0,-0.152400><23.197250,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,21.640800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,21.640800>}
box{<0,0,-0.152400><23.126003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,21.640800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,21.945600>}
box{<0,0,-0.152400><23.126003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,22.250400>}
box{<0,0,-0.152400><23.126003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,22.555200>}
box{<0,0,-0.152400><23.126003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,22.860000>}
box{<0,0,-0.152400><23.126003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,23.164800>}
box{<0,0,-0.152400><23.126003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,23.469600>}
box{<0,0,-0.152400><23.126003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,23.774400>}
box{<0,0,-0.152400><23.126003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,24.079200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,24.079200>}
box{<0,0,-0.152400><23.126003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,24.079200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,24.384000>}
box{<0,0,-0.152400><23.126003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,24.688800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,24.688800>}
box{<0,0,-0.152400><23.126003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,24.688800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,24.993600>}
box{<0,0,-0.152400><23.126003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,25.298400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,25.298400>}
box{<0,0,-0.152400><23.126003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,25.298400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,25.603200>}
box{<0,0,-0.152400><23.126003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,25.908000>}
box{<0,0,-0.152400><23.126003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,26.212800>}
box{<0,0,-0.152400><23.126003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,26.517600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.476609,-1.535000,26.517600>}
box{<0,0,-0.152400><13.667813,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,26.517600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.303766,-1.535000,26.822400>}
box{<0,0,-0.152400><13.494969,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,27.127200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.288800,-1.535000,27.127200>}
box{<0,0,-0.152400><13.480003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,27.127200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.288800,-1.535000,27.432000>}
box{<0,0,-0.152400><13.480003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,27.736800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.288800,-1.535000,27.736800>}
box{<0,0,-0.152400><13.480003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,27.736800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.288800,-1.535000,28.041600>}
box{<0,0,-0.152400><13.480003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,28.346400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.288800,-1.535000,28.346400>}
box{<0,0,-0.152400><13.480003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,28.346400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.288800,-1.535000,28.651200>}
box{<0,0,-0.152400><13.480003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.288800,-1.535000,28.956000>}
box{<0,0,-0.152400><13.480003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.288800,-1.535000,29.260800>}
box{<0,0,-0.152400><13.480003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,29.565600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.288800,-1.535000,29.565600>}
box{<0,0,-0.152400><13.480003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,29.565600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.288800,-1.535000,29.870400>}
box{<0,0,-0.152400><13.480003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,30.175200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.288800,-1.535000,30.175200>}
box{<0,0,-0.152400><13.480003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,30.175200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.288800,-1.535000,30.480000>}
box{<0,0,-0.152400><13.480003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,30.784800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.288800,-1.535000,30.784800>}
box{<0,0,-0.152400><13.480003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,30.784800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,31.089600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.288800,-1.535000,31.089600>}
box{<0,0,-0.152400><13.480003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,31.089600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,31.394400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.288800,-1.535000,31.394400>}
box{<0,0,-0.152400><13.480003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,31.394400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.288800,-1.535000,31.699200>}
box{<0,0,-0.152400><13.480003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.288800,-1.535000,32.004000>}
box{<0,0,-0.152400><13.480003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,32.308800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.288800,-1.535000,32.308800>}
box{<0,0,-0.152400><13.480003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,32.613600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.288800,-1.535000,32.613600>}
box{<0,0,-0.152400><13.480003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,32.613600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.288800,-1.535000,32.918400>}
box{<0,0,-0.152400><13.480003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,33.223200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.288800,-1.535000,33.223200>}
box{<0,0,-0.152400><13.480003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,33.223200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.288800,-1.535000,33.528000>}
box{<0,0,-0.152400><13.480003,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,33.832800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.326634,-1.535000,33.832800>}
box{<0,0,-0.152400><13.517838,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,33.832800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.531813,-1.535000,34.137600>}
box{<0,0,-0.152400><13.723016,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,34.442400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.360334,-1.535000,34.442400>}
box{<0,0,-0.152400><10.551538,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,34.442400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,34.747200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.244200,-1.535000,34.747200>}
box{<0,0,-0.152400><10.435403,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,34.747200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.244200,-1.535000,35.052000>}
box{<0,0,-0.152400><10.435403,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.244200,-1.535000,35.356800>}
box{<0,0,-0.152400><10.435403,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,35.661600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.244200,-1.535000,35.661600>}
box{<0,0,-0.152400><10.435403,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,35.661600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,35.966400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.244200,-1.535000,35.966400>}
box{<0,0,-0.152400><10.435403,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,35.966400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,36.271200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.244200,-1.535000,36.271200>}
box{<0,0,-0.152400><10.435403,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,36.271200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.244200,-1.535000,36.576000>}
box{<0,0,-0.152400><10.435403,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,36.880800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.244200,-1.535000,36.880800>}
box{<0,0,-0.152400><10.435403,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,36.880800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,37.185600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.736766,-1.535000,37.185600>}
box{<0,0,-0.152400><8.927969,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,37.185600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,37.490400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.214334,-1.535000,37.490400>}
box{<0,0,-0.152400><7.405537,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,37.490400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.999781,-1.535000,37.795200>}
box{<0,0,-0.152400><7.190984,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.913400,-1.535000,38.100000>}
box{<0,0,-0.152400><7.104603,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,38.404800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.916944,-1.535000,38.404800>}
box{<0,0,-0.152400><7.108147,0.035000,0.152400> rotate<0,0.000000,0> translate<0.808797,-1.535000,38.404800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.808797,-1.535000,38.500553>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.961916,-1.535000,38.513372>}
box{<0,0,-0.152400><7.153130,0.035000,0.152400> rotate<0,-0.102670,0> translate<0.808797,-1.535000,38.500553> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,2.120841>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,34.616000>}
box{<0,0,-0.203200><32.495159,0.035000,0.203200> rotate<0,90.000000,0> translate<2.415997,0.000000,34.616000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,2.120841>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.920841,0.000000,1.615997>}
box{<0,0,-0.203200><0.713957,0.035000,0.203200> rotate<0,44.997030,0> translate<2.415997,0.000000,2.120841> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.453000,0.000000,2.438400>}
box{<0,0,-0.203200><3.037003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.532694,0.000000,2.844800>}
box{<0,0,-0.203200><3.116697,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.701031,0.000000,3.251200>}
box{<0,0,-0.203200><3.285034,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.189703,0.000000,3.657600>}
box{<0,0,-0.203200><1.773706,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.751131,0.000000,4.064000>}
box{<0,0,-0.203200><1.335134,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.535472,0.000000,4.470400>}
box{<0,0,-0.203200><1.119475,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.419000,0.000000,4.876800>}
box{<0,0,-0.203200><1.003003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.419000,0.000000,5.283200>}
box{<0,0,-0.203200><1.003003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.535478,0.000000,5.689600>}
box{<0,0,-0.203200><1.119481,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.751134,0.000000,6.096000>}
box{<0,0,-0.203200><1.335138,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.189713,0.000000,6.502400>}
box{<0,0,-0.203200><1.773716,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.837200,0.000000,6.908800>}
box{<0,0,-0.203200><2.421203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.837200,0.000000,7.315200>}
box{<0,0,-0.203200><2.421203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.837200,0.000000,7.721600>}
box{<0,0,-0.203200><2.421203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.020528,0.000000,8.128000>}
box{<0,0,-0.203200><2.604531,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.337200,0.000000,8.534400>}
box{<0,0,-0.203200><3.921203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.337200,0.000000,8.940800>}
box{<0,0,-0.203200><3.921203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.397481,0.000000,9.347200>}
box{<0,0,-0.203200><3.981484,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.748841,0.000000,9.753600>}
box{<0,0,-0.203200><4.332844,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.592000,0.000000,10.160000>}
box{<0,0,-0.203200><8.176003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.784125,0.000000,10.566400>}
box{<0,0,-0.203200><5.368128,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.543628,0.000000,10.972800>}
box{<0,0,-0.203200><5.127631,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.537200,0.000000,11.379200>}
box{<0,0,-0.203200><5.121203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.537200,0.000000,11.785600>}
box{<0,0,-0.203200><5.121203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.537200,0.000000,12.192000>}
box{<0,0,-0.203200><5.121203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.537200,0.000000,12.598400>}
box{<0,0,-0.203200><5.121203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.537200,0.000000,13.004800>}
box{<0,0,-0.203200><5.121203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.537200,0.000000,13.411200>}
box{<0,0,-0.203200><5.121203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.607916,0.000000,13.817600>}
box{<0,0,-0.203200><5.191919,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.537200,0.000000,14.224000>}
box{<0,0,-0.203200><5.121203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.537200,0.000000,14.630400>}
box{<0,0,-0.203200><5.121203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.537200,0.000000,15.036800>}
box{<0,0,-0.203200><5.121203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.591681,0.000000,15.443200>}
box{<0,0,-0.203200><5.175684,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.915041,0.000000,15.849600>}
box{<0,0,-0.203200><5.499044,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.075291,0.000000,16.256000>}
box{<0,0,-0.203200><7.659294,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.580253,0.000000,16.662400>}
box{<0,0,-0.203200><8.164256,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.435200,0.000000,17.068800>}
box{<0,0,-0.203200><9.019203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.435200,0.000000,17.475200>}
box{<0,0,-0.203200><9.019203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.435200,0.000000,17.881600>}
box{<0,0,-0.203200><9.019203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.586528,0.000000,18.288000>}
box{<0,0,-0.203200><9.170531,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.095466,0.000000,18.694400>}
box{<0,0,-0.203200><0.679469,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.689066,0.000000,19.100800>}
box{<0,0,-0.203200><0.273069,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.537200,0.000000,19.507200>}
box{<0,0,-0.203200><0.121203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.537200,0.000000,19.913600>}
box{<0,0,-0.203200><0.121203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.537200,0.000000,20.320000>}
box{<0,0,-0.203200><0.121203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.716269,0.000000,20.726400>}
box{<0,0,-0.203200><0.300272,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.122669,0.000000,21.132800>}
box{<0,0,-0.203200><0.706672,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,21.539200>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,21.945600>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,22.352000>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,22.758400>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,23.164800>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.217122,0.000000,23.571200>}
box{<0,0,-0.203200><4.801125,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,23.977600>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,24.384000>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,24.790400>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,25.196800>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,25.603200>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,26.009600>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,26.416000>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,26.822400>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,27.228800>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,27.635200>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,28.041600>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,28.448000>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,28.854400>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,29.260800>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,29.667200>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,30.073600>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,30.480000>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,30.886400>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,31.292800>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,31.699200>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,32.105600>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,32.512000>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,32.918400>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,33.324800>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.217122,0.000000,33.731200>}
box{<0,0,-0.203200><4.801125,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,34.137600>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,34.544000>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415997,0.000000,34.616000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,34.616000>}
box{<0,0,-0.203200><4.793203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415997,0.000000,34.616000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.504838,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.453000,0.000000,2.032000>}
box{<0,0,-0.203200><2.948163,0.035000,0.203200> rotate<0,0.000000,0> translate<2.504838,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.537200,0.000000,19.252666>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.452666,0.000000,18.337200>}
box{<0,0,-0.203200><1.294664,0.035000,0.203200> rotate<0,44.997030,0> translate<2.537200,0.000000,19.252666> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.537200,0.000000,20.547331>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.537200,0.000000,19.252666>}
box{<0,0,-0.203200><1.294666,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.537200,0.000000,19.252666> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.537200,0.000000,20.547331>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.452666,0.000000,21.462797>}
box{<0,0,-0.203200><1.294664,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.537200,0.000000,20.547331> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.791200,-1.535000,19.357878>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.557878,-1.535000,18.591200>}
box{<0,0,-0.152400><1.084247,0.035000,0.152400> rotate<0,44.997030,0> translate<2.791200,-1.535000,19.357878> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.791200,-1.535000,20.442119>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.791200,-1.535000,19.357878>}
box{<0,0,-0.152400><1.084241,0.035000,0.152400> rotate<0,-90.000000,0> translate<2.791200,-1.535000,19.357878> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.791200,-1.535000,20.442119>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.557878,-1.535000,21.208797>}
box{<0,0,-0.152400><1.084247,0.035000,0.152400> rotate<0,-44.997030,0> translate<2.791200,-1.535000,20.442119> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.911237,0.000000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.606259,0.000000,1.625600>}
box{<0,0,-0.203200><2.695022,0.035000,0.203200> rotate<0,0.000000,0> translate<2.911237,0.000000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.920841,0.000000,1.615997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.610238,0.000000,1.615997>}
box{<0,0,-0.203200><2.689397,0.035000,0.203200> rotate<0,0.000000,0> translate<2.920841,0.000000,1.615997> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.167000,-1.535000,2.046116>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.379681,-1.535000,1.532663>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,67.495355,0> translate<3.167000,-1.535000,2.046116> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.167000,-1.535000,2.601881>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.167000,-1.535000,2.046116>}
box{<0,0,-0.152400><0.555766,0.035000,0.152400> rotate<0,-90.000000,0> translate<3.167000,-1.535000,2.046116> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.167000,-1.535000,2.601881>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.379681,-1.535000,3.115334>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,-67.495355,0> translate<3.167000,-1.535000,2.601881> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.379681,-1.535000,1.532663>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.772663,-1.535000,1.139681>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,44.997030,0> translate<3.379681,-1.535000,1.532663> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.379681,-1.535000,3.115334>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.772663,-1.535000,3.508316>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,-44.997030,0> translate<3.379681,-1.535000,3.115334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.419000,0.000000,4.751594>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.670350,0.000000,4.144781>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,67.495543,0> translate<3.419000,0.000000,4.751594> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.419000,0.000000,5.408403>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.419000,0.000000,4.751594>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,-90.000000,0> translate<3.419000,0.000000,4.751594> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.419000,0.000000,5.408403>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.670350,0.000000,6.015216>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,-67.495543,0> translate<3.419000,0.000000,5.408403> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.452666,0.000000,18.337200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.747331,0.000000,18.337200>}
box{<0,0,-0.203200><1.294666,0.035000,0.203200> rotate<0,0.000000,0> translate<3.452666,0.000000,18.337200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.452666,0.000000,21.462797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.747331,0.000000,21.462797>}
box{<0,0,-0.203200><1.294666,0.035000,0.203200> rotate<0,0.000000,0> translate<3.452666,0.000000,21.462797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.557878,-1.535000,18.591200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.642119,-1.535000,18.591200>}
box{<0,0,-0.152400><1.084241,0.035000,0.152400> rotate<0,0.000000,0> translate<3.557878,-1.535000,18.591200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.557878,-1.535000,21.208797>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.642119,-1.535000,21.208797>}
box{<0,0,-0.152400><1.084241,0.035000,0.152400> rotate<0,0.000000,0> translate<3.557878,-1.535000,21.208797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.670350,0.000000,4.144781>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.134781,0.000000,3.680350>}
box{<0,0,-0.203200><0.656805,0.035000,0.203200> rotate<0,44.997030,0> translate<3.670350,0.000000,4.144781> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.670350,0.000000,6.015216>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.134781,0.000000,6.479647>}
box{<0,0,-0.203200><0.656805,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.670350,0.000000,6.015216> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.772663,-1.535000,1.139681>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.286116,-1.535000,0.927000>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,22.498706,0> translate<3.772663,-1.535000,1.139681> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.772663,-1.535000,3.508316>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.286116,-1.535000,3.720997>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,-22.498706,0> translate<3.772663,-1.535000,3.508316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.134781,0.000000,3.680350>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.741594,0.000000,3.429000>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,22.498518,0> translate<4.134781,0.000000,3.680350> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.134781,0.000000,6.479647>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.741594,0.000000,6.730997>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,-22.498518,0> translate<4.134781,0.000000,6.479647> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.286116,-1.535000,0.927000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.841881,-1.535000,0.927000>}
box{<0,0,-0.152400><0.555766,0.035000,0.152400> rotate<0,0.000000,0> translate<4.286116,-1.535000,0.927000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.286116,-1.535000,3.720997>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.841881,-1.535000,3.720997>}
box{<0,0,-0.152400><0.555766,0.035000,0.152400> rotate<0,0.000000,0> translate<4.286116,-1.535000,3.720997> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.642119,-1.535000,18.591200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.408797,-1.535000,19.357878>}
box{<0,0,-0.152400><1.084247,0.035000,0.152400> rotate<0,-44.997030,0> translate<4.642119,-1.535000,18.591200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.642119,-1.535000,21.208797>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.408797,-1.535000,20.442119>}
box{<0,0,-0.152400><1.084247,0.035000,0.152400> rotate<0,44.997030,0> translate<4.642119,-1.535000,21.208797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.643719,-1.535000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.815169,-1.535000,18.592800>}
box{<0,0,-0.152400><4.171450,0.035000,0.152400> rotate<0,0.000000,0> translate<4.643719,-1.535000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.741594,0.000000,3.429000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.398403,0.000000,3.429000>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,0.000000,0> translate<4.741594,0.000000,3.429000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.741594,0.000000,6.730997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.837200,0.000000,6.730997>}
box{<0,0,-0.203200><0.095606,0.035000,0.203200> rotate<0,0.000000,0> translate<4.741594,0.000000,6.730997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.747331,0.000000,18.337200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.662797,0.000000,19.252666>}
box{<0,0,-0.203200><1.294664,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.747331,0.000000,18.337200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.747331,0.000000,21.462797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.662797,0.000000,20.547331>}
box{<0,0,-0.203200><1.294664,0.035000,0.203200> rotate<0,44.997030,0> translate<4.747331,0.000000,21.462797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.819716,-1.535000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.203800,-1.535000,21.031200>}
box{<0,0,-0.152400><19.384084,0.035000,0.152400> rotate<0,0.000000,0> translate<4.819716,-1.535000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.837200,0.000000,7.769675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.837200,0.000000,6.730997>}
box{<0,0,-0.203200><1.038678,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.837200,0.000000,6.730997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.837200,0.000000,7.769675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.960941,0.000000,8.068413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<4.837200,0.000000,7.769675> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.841881,-1.535000,0.927000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.355334,-1.535000,1.139681>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,-22.498706,0> translate<4.841881,-1.535000,0.927000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.841881,-1.535000,3.720997>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.355334,-1.535000,3.508316>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,22.498706,0> translate<4.841881,-1.535000,3.720997> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.948519,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.119969,-1.535000,18.897600>}
box{<0,0,-0.152400><4.171450,0.035000,0.152400> rotate<0,0.000000,0> translate<4.948519,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.960941,0.000000,8.068413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.189584,0.000000,8.297056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.960941,0.000000,8.068413> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.994934,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.673066,-1.535000,3.657600>}
box{<0,0,-0.152400><1.678131,0.035000,0.152400> rotate<0,0.000000,0> translate<4.994934,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.015997,0.000000,38.020841>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.015997,0.000000,38.600000>}
box{<0,0,-0.203200><0.579159,0.035000,0.203200> rotate<0,90.000000,0> translate<5.015997,0.000000,38.600000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.015997,0.000000,38.020841>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.216041,0.000000,37.820797>}
box{<0,0,-0.203200><0.282905,0.035000,0.203200> rotate<0,44.997030,0> translate<5.015997,0.000000,38.020841> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.015997,0.000000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.538800,0.000000,38.201600>}
box{<0,0,-0.203200><0.522803,0.035000,0.203200> rotate<0,0.000000,0> translate<5.015997,0.000000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.015997,0.000000,38.600000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.549469,0.000000,38.600000>}
box{<0,0,-0.203200><0.533472,0.035000,0.203200> rotate<0,0.000000,0> translate<5.015997,0.000000,38.600000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.077328,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,21.132800>}
box{<0,0,-0.203200><2.131872,0.035000,0.203200> rotate<0,0.000000,0> translate<5.077328,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.104531,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.059400,0.000000,18.694400>}
box{<0,0,-0.203200><6.954869,0.035000,0.203200> rotate<0,0.000000,0> translate<5.104531,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.124516,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.508600,-1.535000,20.726400>}
box{<0,0,-0.152400><19.384084,0.035000,0.152400> rotate<0,0.000000,0> translate<5.124516,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.189584,0.000000,8.297056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.488322,0.000000,8.420797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<5.189584,0.000000,8.297056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.216041,0.000000,37.820797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.538800,0.000000,37.820797>}
box{<0,0,-0.203200><0.322759,0.035000,0.203200> rotate<0,0.000000,0> translate<5.216041,0.000000,37.820797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.253319,-1.535000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.424769,-1.535000,19.202400>}
box{<0,0,-0.152400><4.171450,0.035000,0.152400> rotate<0,0.000000,0> translate<5.253319,-1.535000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.355334,-1.535000,1.139681>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.748316,-1.535000,1.532663>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,-44.997030,0> translate<5.355334,-1.535000,1.139681> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.355334,-1.535000,3.508316>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.748316,-1.535000,3.115334>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,44.997030,0> translate<5.355334,-1.535000,3.508316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.398403,0.000000,3.429000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.005216,0.000000,3.680350>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,-22.498518,0> translate<5.398403,0.000000,3.429000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.408797,-1.535000,19.357878>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.408797,-1.535000,20.442119>}
box{<0,0,-0.152400><1.084241,0.035000,0.152400> rotate<0,90.000000,0> translate<5.408797,-1.535000,20.442119> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.408797,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.727800,-1.535000,19.507200>}
box{<0,0,-0.152400><20.319003,0.035000,0.152400> rotate<0,0.000000,0> translate<5.408797,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.408797,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.423000,-1.535000,19.812000>}
box{<0,0,-0.152400><20.014203,0.035000,0.152400> rotate<0,0.000000,0> translate<5.408797,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.408797,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.118200,-1.535000,20.116800>}
box{<0,0,-0.152400><19.709403,0.035000,0.152400> rotate<0,0.000000,0> translate<5.408797,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.408797,-1.535000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.813400,-1.535000,20.421600>}
box{<0,0,-0.152400><19.404603,0.035000,0.152400> rotate<0,0.000000,0> translate<5.408797,-1.535000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.434853,-1.535000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.233144,-1.535000,1.219200>}
box{<0,0,-0.152400><0.798291,0.035000,0.152400> rotate<0,0.000000,0> translate<5.434853,-1.535000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.453000,0.000000,1.995594>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.610238,0.000000,1.615997>}
box{<0,0,-0.203200><0.410874,0.035000,0.203200> rotate<0,67.495117,0> translate<5.453000,0.000000,1.995594> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.453000,0.000000,2.652403>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.453000,0.000000,1.995594>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.453000,0.000000,1.995594> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.453000,0.000000,2.652403>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.704350,0.000000,3.259216>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,-67.495543,0> translate<5.453000,0.000000,2.652403> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.483728,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.358125,0.000000,20.726400>}
box{<0,0,-0.203200><1.874397,0.035000,0.203200> rotate<0,0.000000,0> translate<5.483728,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.488322,0.000000,8.420797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.337200,0.000000,8.420797>}
box{<0,0,-0.203200><0.848878,0.035000,0.203200> rotate<0,0.000000,0> translate<5.488322,0.000000,8.420797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.510850,-1.535000,3.352800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.157147,-1.535000,3.352800>}
box{<0,0,-0.152400><0.646297,0.035000,0.152400> rotate<0,0.000000,0> translate<5.510850,-1.535000,3.352800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.510931,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.281619,0.000000,19.100800>}
box{<0,0,-0.203200><5.770687,0.035000,0.203200> rotate<0,0.000000,0> translate<5.510931,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.538800,0.000000,38.099981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.538800,0.000000,37.820797>}
box{<0,0,-0.203200><0.279184,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.538800,0.000000,37.820797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.538800,0.000000,38.099981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.595966,0.000000,38.099981>}
box{<0,0,-0.203200><1.057166,0.035000,0.203200> rotate<0,0.000000,0> translate<5.538800,0.000000,38.099981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.538800,0.000000,38.100012>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.595966,0.000000,38.100012>}
box{<0,0,-0.203200><1.057166,0.035000,0.203200> rotate<0,0.000000,0> translate<5.538800,0.000000,38.100012> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.538800,0.000000,38.560191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.538800,0.000000,38.100012>}
box{<0,0,-0.203200><0.460178,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.538800,0.000000,38.100012> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.538800,0.000000,38.560191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.549469,0.000000,38.600000>}
box{<0,0,-0.203200><0.041214,0.035000,0.203200> rotate<0,-74.992553,0> translate<5.538800,0.000000,38.560191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.662797,0.000000,19.252666>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.662797,0.000000,20.547331>}
box{<0,0,-0.203200><1.294666,0.035000,0.203200> rotate<0,90.000000,0> translate<5.662797,0.000000,20.547331> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.662797,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.149800,0.000000,19.507200>}
box{<0,0,-0.203200><5.487003,0.035000,0.203200> rotate<0,0.000000,0> translate<5.662797,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.662797,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.149800,0.000000,19.913600>}
box{<0,0,-0.203200><5.487003,0.035000,0.203200> rotate<0,0.000000,0> translate<5.662797,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.662797,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.149800,0.000000,20.320000>}
box{<0,0,-0.203200><5.487003,0.035000,0.203200> rotate<0,0.000000,0> translate<5.662797,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.704350,0.000000,3.259216>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.088000,0.000000,3.642863>}
box{<0,0,-0.203200><0.542561,0.035000,0.203200> rotate<0,-44.996797,0> translate<5.704350,0.000000,3.259216> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.739653,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.928344,-1.535000,1.524000>}
box{<0,0,-0.152400><0.188691,0.035000,0.152400> rotate<0,0.000000,0> translate<5.739653,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.748316,-1.535000,1.532663>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.834000,-1.535000,1.739522>}
box{<0,0,-0.152400><0.223903,0.035000,0.152400> rotate<0,-67.495447,0> translate<5.748316,-1.535000,1.532663> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.748316,-1.535000,3.115334>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.834000,-1.535000,2.908475>}
box{<0,0,-0.152400><0.223903,0.035000,0.152400> rotate<0,67.495447,0> translate<5.748316,-1.535000,3.115334> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.776209,-1.535000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.891794,-1.535000,3.048000>}
box{<0,0,-0.152400><0.115584,0.035000,0.152400> rotate<0,0.000000,0> translate<5.776209,-1.535000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.834000,-1.535000,1.739522>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.919681,-1.535000,1.532663>}
box{<0,0,-0.152400><0.223902,0.035000,0.152400> rotate<0,67.496186,0> translate<5.834000,-1.535000,1.739522> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.834000,-1.535000,2.908475>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.919681,-1.535000,3.115334>}
box{<0,0,-0.152400><0.223902,0.035000,0.152400> rotate<0,-67.496186,0> translate<5.834000,-1.535000,2.908475> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.919681,-1.535000,1.532663>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.312663,-1.535000,1.139681>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,44.997030,0> translate<5.919681,-1.535000,1.532663> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.919681,-1.535000,3.115334>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.312663,-1.535000,3.508316>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,-44.997030,0> translate<5.919681,-1.535000,3.115334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.950291,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.088000,0.000000,3.657600>}
box{<0,0,-0.203200><0.137709,0.035000,0.203200> rotate<0,0.000000,0> translate<5.950291,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.005216,0.000000,3.680350>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.125444,0.000000,3.800581>}
box{<0,0,-0.203200><0.170030,0.035000,0.203200> rotate<0,-44.997775,0> translate<6.005216,0.000000,3.680350> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.088000,0.000000,3.706094>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.088000,0.000000,3.642863>}
box{<0,0,-0.203200><0.063231,0.035000,0.203200> rotate<0,-90.000000,0> translate<6.088000,0.000000,3.642863> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.088000,0.000000,3.706094>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.090928,0.000000,3.713156>}
box{<0,0,-0.203200><0.007645,0.035000,0.203200> rotate<0,-67.476564,0> translate<6.088000,0.000000,3.706094> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.090928,0.000000,3.713156>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.091038,0.000000,3.720813>}
box{<0,0,-0.203200><0.007657,0.035000,0.203200> rotate<0,-89.175659,0> translate<6.090928,0.000000,3.713156> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.091038,0.000000,3.720813>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.125444,0.000000,3.800581>}
box{<0,0,-0.203200><0.086873,0.035000,0.203200> rotate<0,-66.663860,0> translate<6.091038,0.000000,3.720813> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.312663,-1.535000,1.139681>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.826116,-1.535000,0.927000>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,22.498706,0> translate<6.312663,-1.535000,1.139681> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.312663,-1.535000,3.508316>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.826116,-1.535000,3.720997>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,-22.498706,0> translate<6.312663,-1.535000,3.508316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.337200,0.000000,9.201675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.337200,0.000000,8.420797>}
box{<0,0,-0.203200><0.780878,0.035000,0.203200> rotate<0,-90.000000,0> translate<6.337200,0.000000,8.420797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.337200,0.000000,9.201675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.460941,0.000000,9.500413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<6.337200,0.000000,9.201675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.460941,0.000000,9.500413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.689584,0.000000,9.729056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.460941,0.000000,9.500413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.595966,0.000000,38.100012>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.595966,0.000000,38.099981>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,-90.000000,0> translate<6.595966,0.000000,38.099981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.689584,0.000000,9.729056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.988322,0.000000,9.852797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<6.689584,0.000000,9.729056> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.826116,-1.535000,0.927000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.381881,-1.535000,0.927000>}
box{<0,0,-0.152400><0.555766,0.035000,0.152400> rotate<0,0.000000,0> translate<6.826116,-1.535000,0.927000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.826116,-1.535000,3.720997>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.381881,-1.535000,3.720997>}
box{<0,0,-0.152400><0.555766,0.035000,0.152400> rotate<0,0.000000,0> translate<6.826116,-1.535000,3.720997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.988322,0.000000,9.852797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.311675,0.000000,9.852797>}
box{<0,0,-0.203200><1.323353,0.035000,0.203200> rotate<0,0.000000,0> translate<6.988322,0.000000,9.852797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,21.050322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.332941,0.000000,20.751584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<7.209200,0.000000,21.050322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,22.273675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,21.050322>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.209200,0.000000,21.050322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,22.273675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.218863,0.000000,22.297000>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,-67.493514,0> translate<7.209200,0.000000,22.273675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,22.320322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.218863,0.000000,22.297000>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,67.490800,0> translate<7.209200,0.000000,22.320322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,23.543675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,22.320322>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.209200,0.000000,22.320322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,23.543675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.218863,0.000000,23.567000>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,-67.493514,0> translate<7.209200,0.000000,23.543675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,23.590322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.218863,0.000000,23.567000>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,67.490800,0> translate<7.209200,0.000000,23.590322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,24.813675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,23.590322>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.209200,0.000000,23.590322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,24.813675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.218863,0.000000,24.837000>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,-67.493514,0> translate<7.209200,0.000000,24.813675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,24.860322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.218863,0.000000,24.837000>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,67.490800,0> translate<7.209200,0.000000,24.860322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,26.083675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,24.860322>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.209200,0.000000,24.860322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,26.083675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.218863,0.000000,26.107000>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,-67.493514,0> translate<7.209200,0.000000,26.083675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,26.130322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.218863,0.000000,26.107000>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,67.490800,0> translate<7.209200,0.000000,26.130322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,27.353675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,26.130322>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.209200,0.000000,26.130322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,27.353675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.218863,0.000000,27.377000>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,-67.493514,0> translate<7.209200,0.000000,27.353675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,27.400322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.218863,0.000000,27.377000>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,67.490800,0> translate<7.209200,0.000000,27.400322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,28.623675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,27.400322>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.209200,0.000000,27.400322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,28.623675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.218863,0.000000,28.647000>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,-67.493514,0> translate<7.209200,0.000000,28.623675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,28.670322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.218863,0.000000,28.647000>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,67.490800,0> translate<7.209200,0.000000,28.670322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,29.893675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,28.670322>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.209200,0.000000,28.670322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,29.893675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.218863,0.000000,29.917000>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,-67.493514,0> translate<7.209200,0.000000,29.893675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,29.940322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.218863,0.000000,29.917000>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,67.490800,0> translate<7.209200,0.000000,29.940322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,31.163675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,29.940322>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.209200,0.000000,29.940322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,31.163675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.218863,0.000000,31.187000>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,-67.493514,0> translate<7.209200,0.000000,31.163675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,31.210322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.218863,0.000000,31.187000>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,67.490800,0> translate<7.209200,0.000000,31.210322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,32.433675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,31.210322>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.209200,0.000000,31.210322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,32.433675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.218863,0.000000,32.457000>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,-67.493514,0> translate<7.209200,0.000000,32.433675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,32.480322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.218863,0.000000,32.457000>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,67.490800,0> translate<7.209200,0.000000,32.480322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,33.703675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,32.480322>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.209200,0.000000,32.480322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,33.703675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.218863,0.000000,33.727000>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,-67.493514,0> translate<7.209200,0.000000,33.703675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,33.750322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.218863,0.000000,33.727000>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,67.490800,0> translate<7.209200,0.000000,33.750322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,34.616000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.209200,0.000000,33.750322>}
box{<0,0,-0.203200><0.865678,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.209200,0.000000,33.750322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.332941,0.000000,20.751584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.561584,0.000000,20.522941>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<7.332941,0.000000,20.751584> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.381881,-1.535000,0.927000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.895334,-1.535000,1.139681>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,-22.498706,0> translate<7.381881,-1.535000,0.927000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.381881,-1.535000,3.720997>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.895334,-1.535000,3.508316>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,22.498706,0> translate<7.381881,-1.535000,3.720997> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.513400,-1.535000,5.723641>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.648375,-1.535000,5.397781>}
box{<0,0,-0.152400><0.352708,0.035000,0.152400> rotate<0,67.495601,0> translate<7.513400,-1.535000,5.723641> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.513400,-1.535000,6.076356>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.513400,-1.535000,5.723641>}
box{<0,0,-0.152400><0.352716,0.035000,0.152400> rotate<0,-90.000000,0> translate<7.513400,-1.535000,5.723641> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.513400,-1.535000,6.076356>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.648375,-1.535000,6.402216>}
box{<0,0,-0.152400><0.352708,0.035000,0.152400> rotate<0,-67.495601,0> translate<7.513400,-1.535000,6.076356> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.534934,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.213066,-1.535000,3.657600>}
box{<0,0,-0.152400><1.678131,0.035000,0.152400> rotate<0,0.000000,0> translate<7.534934,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.537200,0.000000,10.988322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.660941,0.000000,10.689584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<7.537200,0.000000,10.988322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.537200,0.000000,13.611675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.537200,0.000000,10.988322>}
box{<0,0,-0.203200><2.623353,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.537200,0.000000,10.988322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.537200,0.000000,13.611675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.615206,0.000000,13.800000>}
box{<0,0,-0.203200><0.203841,0.035000,0.203200> rotate<0,-67.495680,0> translate<7.537200,0.000000,13.611675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.537200,0.000000,13.988322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.615206,0.000000,13.800000>}
box{<0,0,-0.203200><0.203838,0.035000,0.203200> rotate<0,67.495344,0> translate<7.537200,0.000000,13.988322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.537200,0.000000,15.311675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.537200,0.000000,13.988322>}
box{<0,0,-0.203200><1.323353,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.537200,0.000000,13.988322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.537200,0.000000,15.311675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.660941,0.000000,15.610413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<7.537200,0.000000,15.311675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.561584,0.000000,20.522941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.860322,0.000000,20.399200>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<7.561584,0.000000,20.522941> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.648375,-1.535000,5.397781>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.897781,-1.535000,5.148375>}
box{<0,0,-0.152400><0.352714,0.035000,0.152400> rotate<0,44.997030,0> translate<7.648375,-1.535000,5.397781> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.648375,-1.535000,6.402216>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.897781,-1.535000,6.651622>}
box{<0,0,-0.152400><0.352714,0.035000,0.152400> rotate<0,-44.997030,0> translate<7.648375,-1.535000,6.402216> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.660941,0.000000,10.689584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.889584,0.000000,10.460941>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<7.660941,0.000000,10.689584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.660941,0.000000,15.610413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.889584,0.000000,15.839056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.660941,0.000000,15.610413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.860322,0.000000,20.399200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.683675,0.000000,20.399200>}
box{<0,0,-0.203200><1.823353,0.035000,0.203200> rotate<0,0.000000,0> translate<7.860322,0.000000,20.399200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.889584,0.000000,10.460941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.188322,0.000000,10.337200>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<7.889584,0.000000,10.460941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.889584,0.000000,15.839056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.188322,0.000000,15.962797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<7.889584,0.000000,15.839056> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.895334,-1.535000,1.139681>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.288316,-1.535000,1.532663>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,-44.997030,0> translate<7.895334,-1.535000,1.139681> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.895334,-1.535000,3.508316>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.288316,-1.535000,3.115334>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,44.997030,0> translate<7.895334,-1.535000,3.508316> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.897781,-1.535000,5.148375>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.223641,-1.535000,5.013400>}
box{<0,0,-0.152400><0.352708,0.035000,0.152400> rotate<0,22.498459,0> translate<7.897781,-1.535000,5.148375> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.897781,-1.535000,6.651622>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.198591,-1.535000,6.776219>}
box{<0,0,-0.152400><0.325593,0.035000,0.152400> rotate<0,-22.498117,0> translate<7.897781,-1.535000,6.651622> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.913400,-1.535000,38.003750>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.063600,-1.535000,37.641134>}
box{<0,0,-0.152400><0.392492,0.035000,0.152400> rotate<0,67.495587,0> translate<7.913400,-1.535000,38.003750> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.913400,-1.535000,38.396247>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.913400,-1.535000,38.003750>}
box{<0,0,-0.152400><0.392497,0.035000,0.152400> rotate<0,-90.000000,0> translate<7.913400,-1.535000,38.003750> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.913400,-1.535000,38.396247>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.961916,-1.535000,38.513372>}
box{<0,0,-0.152400><0.126776,0.035000,0.152400> rotate<0,-67.495186,0> translate<7.913400,-1.535000,38.396247> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.974853,-1.535000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.773144,-1.535000,1.219200>}
box{<0,0,-0.152400><0.798291,0.035000,0.152400> rotate<0,0.000000,0> translate<7.974853,-1.535000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.050850,-1.535000,3.352800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.697147,-1.535000,3.352800>}
box{<0,0,-0.152400><0.646297,0.035000,0.152400> rotate<0,0.000000,0> translate<8.050850,-1.535000,3.352800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.063600,-1.535000,37.641134>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.341134,-1.535000,37.363600>}
box{<0,0,-0.152400><0.392493,0.035000,0.152400> rotate<0,44.997030,0> translate<8.063600,-1.535000,37.641134> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.188322,0.000000,10.337200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.611675,0.000000,10.337200>}
box{<0,0,-0.203200><1.423353,0.035000,0.203200> rotate<0,0.000000,0> translate<8.188322,0.000000,10.337200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.188322,0.000000,15.962797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.611675,0.000000,15.962797>}
box{<0,0,-0.203200><1.423353,0.035000,0.203200> rotate<0,0.000000,0> translate<8.188322,0.000000,15.962797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.198591,-1.535000,6.776219>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,7.015631>}
box{<0,0,-0.152400><0.338578,0.035000,0.152400> rotate<0,-44.997404,0> translate<8.198591,-1.535000,6.776219> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.223641,-1.535000,5.013400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.576356,-1.535000,5.013400>}
box{<0,0,-0.152400><0.352716,0.035000,0.152400> rotate<0,0.000000,0> translate<8.223641,-1.535000,5.013400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.279653,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.468344,-1.535000,1.524000>}
box{<0,0,-0.152400><0.188691,0.035000,0.152400> rotate<0,0.000000,0> translate<8.279653,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.288316,-1.535000,1.532663>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.374000,-1.535000,1.739522>}
box{<0,0,-0.152400><0.223903,0.035000,0.152400> rotate<0,-67.495447,0> translate<8.288316,-1.535000,1.532663> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.288316,-1.535000,3.115334>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.374000,-1.535000,2.908475>}
box{<0,0,-0.152400><0.223903,0.035000,0.152400> rotate<0,67.495447,0> translate<8.288316,-1.535000,3.115334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.311675,0.000000,9.852797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.610413,0.000000,9.729056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<8.311675,0.000000,9.852797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.316209,-1.535000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.431794,-1.535000,3.048000>}
box{<0,0,-0.152400><0.115584,0.035000,0.152400> rotate<0,0.000000,0> translate<8.316209,-1.535000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.341134,-1.535000,37.363600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.703750,-1.535000,37.213400>}
box{<0,0,-0.152400><0.392492,0.035000,0.152400> rotate<0,22.498473,0> translate<8.341134,-1.535000,37.363600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.374000,-1.535000,1.739522>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.459681,-1.535000,1.532663>}
box{<0,0,-0.152400><0.223902,0.035000,0.152400> rotate<0,67.496186,0> translate<8.374000,-1.535000,1.739522> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.374000,-1.535000,2.908475>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.459681,-1.535000,3.115334>}
box{<0,0,-0.152400><0.223902,0.035000,0.152400> rotate<0,-67.496186,0> translate<8.374000,-1.535000,2.908475> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,18.051572>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,7.015631>}
box{<0,0,-0.152400><11.035941,0.035000,0.152400> rotate<0,-90.000000,0> translate<8.438000,-1.535000,7.015631> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.438000,-1.535000,18.051572>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.554006,-1.535000,18.331637>}
box{<0,0,-0.152400><0.303141,0.035000,0.152400> rotate<0,-67.495673,0> translate<8.438000,-1.535000,18.051572> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.459681,-1.535000,1.532663>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.852663,-1.535000,1.139681>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,44.997030,0> translate<8.459681,-1.535000,1.532663> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.459681,-1.535000,3.115334>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.852663,-1.535000,3.508316>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,-44.997030,0> translate<8.459681,-1.535000,3.115334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.551159,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.818128,0.000000,9.753600>}
box{<0,0,-0.203200><1.266969,0.035000,0.203200> rotate<0,0.000000,0> translate<8.551159,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.554006,-1.535000,18.331637>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.768359,-1.535000,18.545991>}
box{<0,0,-0.152400><0.303141,0.035000,0.152400> rotate<0,-44.997030,0> translate<8.554006,-1.535000,18.331637> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.576356,-1.535000,5.013400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.902216,-1.535000,5.148375>}
box{<0,0,-0.152400><0.352708,0.035000,0.152400> rotate<0,-22.498459,0> translate<8.576356,-1.535000,5.013400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.610413,0.000000,9.729056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.839056,0.000000,9.500413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<8.610413,0.000000,9.729056> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.703750,-1.535000,37.213400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.096247,-1.535000,37.213400>}
box{<0,0,-0.152400><0.392497,0.035000,0.152400> rotate<0,0.000000,0> translate<8.703750,-1.535000,37.213400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.768359,-1.535000,18.545991>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.468359,-1.535000,19.245991>}
box{<0,0,-0.152400><0.989949,0.035000,0.152400> rotate<0,-44.997030,0> translate<8.768359,-1.535000,18.545991> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.793819,0.000000,38.164797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.793819,0.000000,38.193800>}
box{<0,0,-0.203200><0.029003,0.035000,0.203200> rotate<0,90.000000,0> translate<8.793819,0.000000,38.193800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.793819,0.000000,38.164797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.683675,0.000000,38.164797>}
box{<0,0,-0.203200><0.889856,0.035000,0.203200> rotate<0,0.000000,0> translate<8.793819,0.000000,38.164797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.793819,0.000000,38.193800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.979197,0.000000,38.193800>}
box{<0,0,-0.203200><1.185378,0.035000,0.203200> rotate<0,0.000000,0> translate<8.793819,0.000000,38.193800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.839056,0.000000,9.500413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.962797,0.000000,9.201675>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<8.839056,0.000000,9.500413> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.852663,-1.535000,1.139681>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.366116,-1.535000,0.927000>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,22.498706,0> translate<8.852663,-1.535000,1.139681> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.852663,-1.535000,3.508316>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.366116,-1.535000,3.720997>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,-22.498706,0> translate<8.852663,-1.535000,3.508316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.862797,0.000000,6.942875>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.862797,0.000000,7.536900>}
box{<0,0,-0.203200><0.594025,0.035000,0.203200> rotate<0,90.000000,0> translate<8.862797,0.000000,7.536900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.862797,0.000000,6.942875>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.046097,0.000000,6.866950>}
box{<0,0,-0.203200><0.198402,0.035000,0.203200> rotate<0,22.498423,0> translate<8.862797,0.000000,6.942875> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.862797,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.569281,0.000000,7.315200>}
box{<0,0,-0.203200><0.706484,0.035000,0.203200> rotate<0,0.000000,0> translate<8.862797,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.862797,0.000000,7.536900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.962797,0.000000,7.778322>}
box{<0,0,-0.203200><0.261313,0.035000,0.203200> rotate<0,-67.495589,0> translate<8.862797,0.000000,7.536900> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.902216,-1.535000,5.148375>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.151622,-1.535000,5.397781>}
box{<0,0,-0.152400><0.352714,0.035000,0.152400> rotate<0,-44.997030,0> translate<8.902216,-1.535000,5.148375> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.902519,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.673200,0.000000,9.347200>}
box{<0,0,-0.203200><0.770681,0.035000,0.203200> rotate<0,0.000000,0> translate<8.902519,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.935441,-1.535000,5.181600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.338000,-1.535000,5.181600>}
box{<0,0,-0.152400><4.402559,0.035000,0.152400> rotate<0,0.000000,0> translate<8.935441,-1.535000,5.181600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.939300,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.886925,0.000000,7.721600>}
box{<0,0,-0.203200><0.947625,0.035000,0.203200> rotate<0,0.000000,0> translate<8.939300,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.945063,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.150916,0.000000,6.908800>}
box{<0,0,-0.203200><0.205853,0.035000,0.203200> rotate<0,0.000000,0> translate<8.945063,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.962797,0.000000,7.778322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.962797,0.000000,9.201675>}
box{<0,0,-0.203200><1.423353,0.035000,0.203200> rotate<0,90.000000,0> translate<8.962797,0.000000,9.201675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.962797,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.673200,0.000000,8.128000>}
box{<0,0,-0.203200><0.710403,0.035000,0.203200> rotate<0,0.000000,0> translate<8.962797,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.962797,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.673200,0.000000,8.534400>}
box{<0,0,-0.203200><0.710403,0.035000,0.203200> rotate<0,0.000000,0> translate<8.962797,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.962797,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.673200,0.000000,8.940800>}
box{<0,0,-0.203200><0.710403,0.035000,0.203200> rotate<0,0.000000,0> translate<8.962797,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.046097,0.000000,6.866950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.076516,0.000000,6.836528>}
box{<0,0,-0.203200><0.043021,0.035000,0.203200> rotate<0,44.999973,0> translate<9.046097,0.000000,6.866950> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.076516,0.000000,6.836528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.886709,0.000000,7.623550>}
box{<0,0,-0.203200><1.129521,0.035000,0.203200> rotate<0,-44.165915,0> translate<9.076516,0.000000,6.836528> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.096247,-1.535000,37.213400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.373447,-1.535000,37.328222>}
box{<0,0,-0.152400><0.300040,0.035000,0.152400> rotate<0,-22.498846,0> translate<9.096247,-1.535000,37.213400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.151622,-1.535000,5.397781>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.276219,-1.535000,5.698591>}
box{<0,0,-0.152400><0.325593,0.035000,0.152400> rotate<0,-67.495943,0> translate<9.151622,-1.535000,5.397781> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.188328,-1.535000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.338000,-1.535000,5.486400>}
box{<0,0,-0.152400><4.149672,0.035000,0.152400> rotate<0,0.000000,0> translate<9.188328,-1.535000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.276219,-1.535000,5.698591>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.845991,-1.535000,6.268359>}
box{<0,0,-0.152400><0.805777,0.035000,0.152400> rotate<0,-44.996873,0> translate<9.276219,-1.535000,5.698591> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.366116,-1.535000,0.927000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.921881,-1.535000,0.927000>}
box{<0,0,-0.152400><0.555766,0.035000,0.152400> rotate<0,0.000000,0> translate<9.366116,-1.535000,0.927000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.366116,-1.535000,3.720997>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.921881,-1.535000,3.720997>}
box{<0,0,-0.152400><0.555766,0.035000,0.152400> rotate<0,0.000000,0> translate<9.366116,-1.535000,3.720997> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.368828,-1.535000,5.791200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.338000,-1.535000,5.791200>}
box{<0,0,-0.152400><3.969172,0.035000,0.152400> rotate<0,0.000000,0> translate<9.368828,-1.535000,5.791200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.373447,-1.535000,37.328222>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.399184,-1.535000,37.323072>}
box{<0,0,-0.152400><0.026248,0.035000,0.152400> rotate<0,11.314537,0> translate<9.373447,-1.535000,37.328222> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.399184,-1.535000,37.323072>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.474647,-1.535000,37.338000>}
box{<0,0,-0.152400><0.076925,0.035000,0.152400> rotate<0,-11.189140,0> translate<9.399184,-1.535000,37.323072> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.468359,-1.535000,19.245991>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.748425,-1.535000,19.361997>}
box{<0,0,-0.152400><0.303141,0.035000,0.152400> rotate<0,-22.498388,0> translate<9.468359,-1.535000,19.245991> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.474647,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.584366,-1.535000,37.338000>}
box{<0,0,-0.152400><0.109719,0.035000,0.152400> rotate<0,0.000000,0> translate<9.474647,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.584366,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.768359,-1.535000,37.154006>}
box{<0,0,-0.152400><0.260206,0.035000,0.152400> rotate<0,44.997030,0> translate<9.584366,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.611675,0.000000,10.337200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.910412,0.000000,10.460941>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<9.611675,0.000000,10.337200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.611675,0.000000,15.962797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.910412,0.000000,15.839056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<9.611675,0.000000,15.962797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.673200,0.000000,8.110322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.796941,0.000000,7.811584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<9.673200,0.000000,8.110322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.673200,0.000000,9.433675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.673200,0.000000,8.110322>}
box{<0,0,-0.203200><1.323353,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.673200,0.000000,8.110322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.673200,0.000000,9.433675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.796941,0.000000,9.732413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<9.673200,0.000000,9.433675> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.673628,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.310131,-1.535000,6.096000>}
box{<0,0,-0.152400><3.636503,0.035000,0.152400> rotate<0,0.000000,0> translate<9.673628,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.683675,0.000000,20.399200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.982413,0.000000,20.522941>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<9.683675,0.000000,20.399200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.683675,0.000000,38.164797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.718928,0.000000,38.150194>}
box{<0,0,-0.203200><0.038158,0.035000,0.203200> rotate<0,22.499628,0> translate<9.683675,0.000000,38.164797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.718928,0.000000,38.150194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.979197,0.000000,38.150194>}
box{<0,0,-0.203200><0.260269,0.035000,0.203200> rotate<0,0.000000,0> translate<9.718928,0.000000,38.150194> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.748425,-1.535000,19.361997>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.722831,-1.535000,19.361997>}
box{<0,0,-0.152400><2.974406,0.035000,0.152400> rotate<0,0.000000,0> translate<9.748425,-1.535000,19.361997> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.768359,-1.535000,37.154006>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.048425,-1.535000,37.038000>}
box{<0,0,-0.152400><0.303141,0.035000,0.152400> rotate<0,22.498388,0> translate<9.768359,-1.535000,37.154006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.796941,0.000000,7.811584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.935844,0.000000,7.672684>}
box{<0,0,-0.203200><0.196436,0.035000,0.203200> rotate<0,44.996386,0> translate<9.796941,0.000000,7.811584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.796941,0.000000,9.732413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.025584,0.000000,9.961056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.796941,0.000000,9.732413> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.845991,-1.535000,6.268359>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,6.548425>}
box{<0,0,-0.152400><0.303141,0.035000,0.152400> rotate<0,-67.495673,0> translate<9.845991,-1.535000,6.268359> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.884959,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.983200,0.000000,15.849600>}
box{<0,0,-0.203200><0.098241,0.035000,0.203200> rotate<0,0.000000,0> translate<9.884959,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.886709,0.000000,7.623550>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.935844,0.000000,7.672684>}
box{<0,0,-0.203200><0.069486,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.886709,0.000000,7.623550> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.900847,-1.535000,6.400800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.985012,-1.535000,6.400800>}
box{<0,0,-0.152400><3.084166,0.035000,0.152400> rotate<0,0.000000,0> translate<9.900847,-1.535000,6.400800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.910412,0.000000,10.460941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.139056,0.000000,10.689584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.910412,0.000000,10.460941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.910412,0.000000,15.839056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.983200,0.000000,15.766266>}
box{<0,0,-0.203200><0.102939,0.035000,0.203200> rotate<0,44.998260,0> translate<9.910412,0.000000,15.839056> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.921881,-1.535000,0.927000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.435334,-1.535000,1.139681>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,-22.498706,0> translate<9.921881,-1.535000,0.927000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.921881,-1.535000,3.720997>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.435334,-1.535000,3.508316>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,22.498706,0> translate<9.921881,-1.535000,3.720997> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,6.548425>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,17.584366>}
box{<0,0,-0.152400><11.035941,0.035000,0.152400> rotate<0,90.000000,0> translate<9.961997,-1.535000,17.584366> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.659894,-1.535000,6.705600>}
box{<0,0,-0.152400><2.697897,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,7.010400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.334772,-1.535000,7.010400>}
box{<0,0,-0.152400><2.372775,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,7.010400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.830956,-1.535000,7.315200>}
box{<0,0,-0.152400><1.868959,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.656328,-1.535000,7.620000>}
box{<0,0,-0.152400><1.694331,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.613400,-1.535000,7.924800>}
box{<0,0,-0.152400><1.651403,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,8.229600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.676878,-1.535000,8.229600>}
box{<0,0,-0.152400><1.714881,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,8.229600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.880559,-1.535000,8.534400>}
box{<0,0,-0.152400><1.918563,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,8.839200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.738000,-1.535000,8.839200>}
box{<0,0,-0.152400><8.776003,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,8.839200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.738000,-1.535000,9.144000>}
box{<0,0,-0.152400><8.776003,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,9.448800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.738000,-1.535000,9.448800>}
box{<0,0,-0.152400><8.776003,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,9.448800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.738000,-1.535000,9.753600>}
box{<0,0,-0.152400><8.776003,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,10.058400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.738000,-1.535000,10.058400>}
box{<0,0,-0.152400><8.776003,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,10.058400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.738000,-1.535000,10.363200>}
box{<0,0,-0.152400><8.776003,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.738000,-1.535000,10.668000>}
box{<0,0,-0.152400><8.776003,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.738000,-1.535000,10.972800>}
box{<0,0,-0.152400><8.776003,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.738000,-1.535000,11.277600>}
box{<0,0,-0.152400><8.776003,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.738000,-1.535000,11.582400>}
box{<0,0,-0.152400><8.776003,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,11.887200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.738000,-1.535000,11.887200>}
box{<0,0,-0.152400><8.776003,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,11.887200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.754747,-1.535000,12.192000>}
box{<0,0,-0.152400><8.792750,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,12.496800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.919169,-1.535000,12.496800>}
box{<0,0,-0.152400><8.957172,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,12.496800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.955447,-1.535000,12.801600>}
box{<0,0,-0.152400><8.993450,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.511944,-1.535000,13.106400>}
box{<0,0,-0.152400><8.549947,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.276578,-1.535000,13.411200>}
box{<0,0,-0.152400><8.314581,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.150325,-1.535000,13.716000>}
box{<0,0,-0.152400><8.188328,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.113000,-1.535000,14.020800>}
box{<0,0,-0.152400><8.151003,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.113000,-1.535000,14.325600>}
box{<0,0,-0.152400><8.151003,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.224228,-1.535000,14.630400>}
box{<0,0,-0.152400><8.262231,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,14.935200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.385547,-1.535000,14.935200>}
box{<0,0,-0.152400><8.423550,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,14.935200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.690347,-1.535000,15.240000>}
box{<0,0,-0.152400><8.728350,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,15.544800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.938000,-1.535000,15.544800>}
box{<0,0,-0.152400><13.976003,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,15.544800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.938000,-1.535000,15.849600>}
box{<0,0,-0.152400><13.976003,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.938000,-1.535000,16.154400>}
box{<0,0,-0.152400><13.976003,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.938000,-1.535000,16.459200>}
box{<0,0,-0.152400><13.976003,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.938000,-1.535000,16.764000>}
box{<0,0,-0.152400><13.976003,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.938000,-1.535000,17.068800>}
box{<0,0,-0.152400><13.976003,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.938000,-1.535000,17.373600>}
box{<0,0,-0.152400><13.976003,0.035000,0.152400> rotate<0,0.000000,0> translate<9.961997,-1.535000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.961997,-1.535000,17.584366>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.215631,-1.535000,17.838000>}
box{<0,0,-0.152400><0.358693,0.035000,0.152400> rotate<0,-44.997030,0> translate<9.961997,-1.535000,17.584366> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.979197,0.000000,38.042388>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.979197,0.000000,38.150194>}
box{<0,0,-0.203200><0.107806,0.035000,0.203200> rotate<0,90.000000,0> translate<9.979197,0.000000,38.150194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.979197,0.000000,38.042388>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.982413,0.000000,38.041056>}
box{<0,0,-0.203200><0.003480,0.035000,0.203200> rotate<0,22.487786,0> translate<9.979197,0.000000,38.042388> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.979197,0.000000,38.193800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.979197,0.000000,38.211000>}
box{<0,0,-0.203200><0.017200,0.035000,0.203200> rotate<0,90.000000,0> translate<9.979197,0.000000,38.211000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.979197,0.000000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.564800,0.000000,38.201600>}
box{<0,0,-0.203200><15.585603,0.035000,0.203200> rotate<0,0.000000,0> translate<9.979197,0.000000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.979197,0.000000,38.211000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.564800,0.000000,38.211000>}
box{<0,0,-0.203200><15.585603,0.035000,0.203200> rotate<0,0.000000,0> translate<9.979197,0.000000,38.211000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.982413,0.000000,20.522941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.211056,0.000000,20.751584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.982413,0.000000,20.522941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.982413,0.000000,38.041056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.211056,0.000000,37.812413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<9.982413,0.000000,38.041056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.983200,0.000000,16.033675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.983200,0.000000,15.766266>}
box{<0,0,-0.203200><0.267409,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.983200,0.000000,15.766266> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.983200,0.000000,16.033675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.106941,0.000000,16.332413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<9.983200,0.000000,16.033675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.015872,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.545200,0.000000,10.566400>}
box{<0,0,-0.203200><0.529328,0.035000,0.203200> rotate<0,0.000000,0> translate<10.015872,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.025584,0.000000,9.961056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.324322,0.000000,10.084797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<10.025584,0.000000,9.961056> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.048425,-1.535000,37.038000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.244200,-1.535000,37.038000>}
box{<0,0,-0.152400><1.195775,0.035000,0.152400> rotate<0,0.000000,0> translate<10.048425,-1.535000,37.038000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.056031,-1.535000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.914981,-1.535000,17.678400>}
box{<0,0,-0.152400><13.858950,0.035000,0.152400> rotate<0,0.000000,0> translate<10.056031,-1.535000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.074934,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.555619,-1.535000,3.657600>}
box{<0,0,-0.152400><3.480684,0.035000,0.152400> rotate<0,0.000000,0> translate<10.074934,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.106941,0.000000,16.332413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.335584,0.000000,16.561056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.106941,0.000000,16.332413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.139056,0.000000,10.689584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.244438,0.000000,10.944000>}
box{<0,0,-0.203200><0.275377,0.035000,0.203200> rotate<0,-67.495767,0> translate<10.139056,0.000000,10.689584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.185872,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.149800,0.000000,20.726400>}
box{<0,0,-0.203200><0.963928,0.035000,0.203200> rotate<0,0.000000,0> translate<10.185872,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.211056,0.000000,20.751584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,21.050322>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<10.211056,0.000000,20.751584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.211056,0.000000,37.812413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,37.513675>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<10.211056,0.000000,37.812413> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.215631,-1.535000,17.838000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.722831,-1.535000,17.838000>}
box{<0,0,-0.152400><2.507200,0.035000,0.152400> rotate<0,0.000000,0> translate<10.215631,-1.535000,17.838000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.218188,0.000000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.325813,0.000000,37.795200>}
box{<0,0,-0.203200><15.107625,0.035000,0.203200> rotate<0,0.000000,0> translate<10.218188,0.000000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.244438,0.000000,10.944000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.545200,0.000000,10.944000>}
box{<0,0,-0.203200><0.300763,0.035000,0.203200> rotate<0,0.000000,0> translate<10.244438,0.000000,10.944000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.324322,0.000000,10.084797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.592000,0.000000,10.084797>}
box{<0,0,-0.203200><0.267678,0.035000,0.203200> rotate<0,0.000000,0> translate<10.324322,0.000000,10.084797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.325134,0.000000,22.297000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,22.273675>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,67.493514,0> translate<10.325134,0.000000,22.297000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.325134,0.000000,22.297000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,22.320322>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,-67.490800,0> translate<10.325134,0.000000,22.297000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.325134,0.000000,23.567000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,23.543675>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,67.493514,0> translate<10.325134,0.000000,23.567000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.325134,0.000000,23.567000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,23.590322>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,-67.490800,0> translate<10.325134,0.000000,23.567000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.325134,0.000000,24.837000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,24.813675>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,67.493514,0> translate<10.325134,0.000000,24.837000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.325134,0.000000,24.837000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,24.860322>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,-67.490800,0> translate<10.325134,0.000000,24.837000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.325134,0.000000,26.107000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,26.083675>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,67.493514,0> translate<10.325134,0.000000,26.107000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.325134,0.000000,26.107000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,26.130322>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,-67.490800,0> translate<10.325134,0.000000,26.107000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.325134,0.000000,27.377000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,27.353675>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,67.493514,0> translate<10.325134,0.000000,27.377000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.325134,0.000000,27.377000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,27.400322>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,-67.490800,0> translate<10.325134,0.000000,27.377000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.325134,0.000000,28.647000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,28.623675>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,67.493514,0> translate<10.325134,0.000000,28.647000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.325134,0.000000,28.647000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,28.670322>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,-67.490800,0> translate<10.325134,0.000000,28.647000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.325134,0.000000,29.917000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,29.893675>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,67.493514,0> translate<10.325134,0.000000,29.917000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.325134,0.000000,29.917000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,29.940322>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,-67.490800,0> translate<10.325134,0.000000,29.917000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.325134,0.000000,31.187000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,31.163675>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,67.493514,0> translate<10.325134,0.000000,31.187000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.325134,0.000000,31.187000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,31.210322>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,-67.490800,0> translate<10.325134,0.000000,31.187000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.325134,0.000000,32.457000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,32.433675>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,67.493514,0> translate<10.325134,0.000000,32.457000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.325134,0.000000,32.457000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,32.480322>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,-67.490800,0> translate<10.325134,0.000000,32.457000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.325134,0.000000,33.727000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,33.703675>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,67.493514,0> translate<10.325134,0.000000,33.727000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.325134,0.000000,33.727000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,33.750322>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,-67.490800,0> translate<10.325134,0.000000,33.727000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.325134,0.000000,34.997000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,34.973675>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,67.493514,0> translate<10.325134,0.000000,34.997000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.325134,0.000000,34.997000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,35.020322>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,-67.490800,0> translate<10.325134,0.000000,34.997000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.325134,0.000000,36.267000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,36.243675>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,67.493514,0> translate<10.325134,0.000000,36.267000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.325134,0.000000,36.267000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,36.290322>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,-67.490800,0> translate<10.325134,0.000000,36.267000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.326872,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.217119,0.000000,23.571200>}
box{<0,0,-0.203200><14.890247,0.035000,0.203200> rotate<0,0.000000,0> translate<10.326872,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.326872,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.217119,0.000000,33.731200>}
box{<0,0,-0.203200><14.890247,0.035000,0.203200> rotate<0,0.000000,0> translate<10.326872,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,21.050322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,22.273675>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,90.000000,0> translate<10.334797,0.000000,22.273675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.200778,0.000000,21.132800>}
box{<0,0,-0.203200><0.865981,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.344728,0.000000,21.539200>}
box{<0,0,-0.203200><2.009931,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,21.945600>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,22.320322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,23.543675>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,90.000000,0> translate<10.334797,0.000000,23.543675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,22.352000>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,22.758400>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,23.164800>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,23.590322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,24.813675>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,90.000000,0> translate<10.334797,0.000000,24.813675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,23.977600>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,24.384000>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,24.790400>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,24.860322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,26.083675>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,90.000000,0> translate<10.334797,0.000000,26.083675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,25.196800>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,25.603200>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,26.009600>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,26.130322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,27.353675>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,90.000000,0> translate<10.334797,0.000000,27.353675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,26.416000>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,26.822400>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,27.228800>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,27.400322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,28.623675>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,90.000000,0> translate<10.334797,0.000000,28.623675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,27.635200>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,28.041600>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,28.448000>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,28.670322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,29.893675>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,90.000000,0> translate<10.334797,0.000000,29.893675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,28.854400>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,29.260800>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,29.667200>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,29.940322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,31.163675>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,90.000000,0> translate<10.334797,0.000000,31.163675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,30.073600>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,30.480000>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,30.886400>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,31.210322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,32.433675>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,90.000000,0> translate<10.334797,0.000000,32.433675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,31.292800>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,31.699200>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,32.105600>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,32.480322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,33.703675>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,90.000000,0> translate<10.334797,0.000000,33.703675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,32.512000>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,32.918400>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,33.324800>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,33.750322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,34.973675>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,90.000000,0> translate<10.334797,0.000000,34.973675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,34.137600>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,34.544000>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,34.950400>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,35.020322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,36.243675>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,90.000000,0> translate<10.334797,0.000000,36.243675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,35.356800>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,35.763200>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,36.169600>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,36.290322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,37.513675>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,90.000000,0> translate<10.334797,0.000000,37.513675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,36.576000>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,36.982400>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334797,0.000000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,37.388800>}
box{<0,0,-0.203200><14.874403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334797,0.000000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.335584,0.000000,16.561056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.634322,0.000000,16.684797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<10.335584,0.000000,16.561056> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.435334,-1.535000,1.139681>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.828316,-1.535000,1.532663>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,-44.997030,0> translate<10.435334,-1.535000,1.139681> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.435334,-1.535000,3.508316>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.828316,-1.535000,3.115334>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,44.997030,0> translate<10.435334,-1.535000,3.508316> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.514853,-1.535000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.485534,-1.535000,1.219200>}
box{<0,0,-0.152400><0.970681,0.035000,0.152400> rotate<0,0.000000,0> translate<10.514853,-1.535000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.545200,0.000000,10.298322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.592000,0.000000,10.185341>}
box{<0,0,-0.203200><0.122291,0.035000,0.203200> rotate<0,67.494838,0> translate<10.545200,0.000000,10.298322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.545200,0.000000,10.944000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.545200,0.000000,10.298322>}
box{<0,0,-0.203200><0.645678,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.545200,0.000000,10.298322> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.590850,-1.535000,3.352800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.687147,-1.535000,3.352800>}
box{<0,0,-0.152400><7.096297,0.035000,0.152400> rotate<0,0.000000,0> translate<10.590850,-1.535000,3.352800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.592000,0.000000,10.185341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.592000,0.000000,10.084797>}
box{<0,0,-0.203200><0.100544,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.592000,0.000000,10.084797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.634322,0.000000,16.684797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.435200,0.000000,16.684797>}
box{<0,0,-0.203200><0.800878,0.035000,0.203200> rotate<0,0.000000,0> translate<10.634322,0.000000,16.684797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.819653,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.287853,-1.535000,1.524000>}
box{<0,0,-0.152400><0.468200,0.035000,0.152400> rotate<0,0.000000,0> translate<10.819653,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.828316,-1.535000,1.532663>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.040997,-1.535000,2.046116>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,-67.495355,0> translate<10.828316,-1.535000,1.532663> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.828316,-1.535000,3.115334>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.040997,-1.535000,2.601881>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,67.495355,0> translate<10.828316,-1.535000,3.115334> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.856209,-1.535000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.382347,-1.535000,3.048000>}
box{<0,0,-0.152400><6.526137,0.035000,0.152400> rotate<0,0.000000,0> translate<10.856209,-1.535000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.950978,-1.535000,1.828800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.213400,-1.535000,1.828800>}
box{<0,0,-0.152400><0.262422,0.035000,0.152400> rotate<0,0.000000,0> translate<10.950978,-1.535000,1.828800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.982463,-1.535000,2.743200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.657559,-1.535000,2.743200>}
box{<0,0,-0.152400><0.675097,0.035000,0.152400> rotate<0,0.000000,0> translate<10.982463,-1.535000,2.743200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.040997,-1.535000,2.046116>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.040997,-1.535000,2.601881>}
box{<0,0,-0.152400><0.555766,0.035000,0.152400> rotate<0,90.000000,0> translate<11.040997,-1.535000,2.601881> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.040997,-1.535000,2.133600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.228875,-1.535000,2.133600>}
box{<0,0,-0.152400><0.187878,0.035000,0.152400> rotate<0,0.000000,0> translate<11.040997,-1.535000,2.133600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.040997,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.355125,-1.535000,2.438400>}
box{<0,0,-0.152400><0.314128,0.035000,0.152400> rotate<0,0.000000,0> translate<11.040997,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.130597,0.000000,13.625997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.130597,0.000000,13.959200>}
box{<0,0,-0.203200><0.333203,0.035000,0.203200> rotate<0,90.000000,0> translate<11.130597,0.000000,13.959200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.130597,0.000000,13.625997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.810094,0.000000,13.625997>}
box{<0,0,-0.203200><0.679497,0.035000,0.203200> rotate<0,0.000000,0> translate<11.130597,0.000000,13.625997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.130597,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.012928,0.000000,13.817600>}
box{<0,0,-0.203200><0.882331,0.035000,0.203200> rotate<0,0.000000,0> translate<11.130597,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.130597,0.000000,13.959200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.739325,0.000000,13.959200>}
box{<0,0,-0.203200><0.608728,0.035000,0.203200> rotate<0,0.000000,0> translate<11.130597,0.000000,13.959200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.149797,0.000000,20.193800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.149800,0.000000,20.982191>}
box{<0,0,-0.203200><0.788391,0.035000,0.203200> rotate<0,-89.993833,0> translate<11.149797,0.000000,20.193800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.149797,0.000000,20.193800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.035178,0.000000,20.193800>}
box{<0,0,-0.203200><0.885381,0.035000,0.203200> rotate<0,0.000000,0> translate<11.149797,0.000000,20.193800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.149800,0.000000,19.361806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.180956,0.000000,19.245525>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,74.995610,0> translate<11.149800,0.000000,19.361806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.149800,0.000000,20.150194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.149800,0.000000,19.361806>}
box{<0,0,-0.203200><0.788387,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.149800,0.000000,19.361806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.149800,0.000000,20.150194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.035178,0.000000,20.150194>}
box{<0,0,-0.203200><0.885378,0.035000,0.203200> rotate<0,0.000000,0> translate<11.149800,0.000000,20.150194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.149800,0.000000,20.982191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.180956,0.000000,21.098472>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,-74.995610,0> translate<11.149800,0.000000,20.982191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.180956,0.000000,19.245525>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.241147,0.000000,19.141272>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,59.996017,0> translate<11.180956,0.000000,19.245525> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.180956,0.000000,21.098472>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.241147,0.000000,21.202725>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,-59.996017,0> translate<11.180956,0.000000,21.098472> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.213400,-1.535000,1.703750>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.363600,-1.535000,1.341134>}
box{<0,0,-0.152400><0.392492,0.035000,0.152400> rotate<0,67.495587,0> translate<11.213400,-1.535000,1.703750> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.213400,-1.535000,2.096247>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.213400,-1.535000,1.703750>}
box{<0,0,-0.152400><0.392497,0.035000,0.152400> rotate<0,-90.000000,0> translate<11.213400,-1.535000,1.703750> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.213400,-1.535000,2.096247>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.363600,-1.535000,2.458862>}
box{<0,0,-0.152400><0.392492,0.035000,0.152400> rotate<0,-67.495587,0> translate<11.213400,-1.535000,2.096247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.241147,0.000000,19.141272>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.326272,0.000000,19.056147>}
box{<0,0,-0.203200><0.120385,0.035000,0.203200> rotate<0,44.997030,0> translate<11.241147,0.000000,19.141272> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.241147,0.000000,21.202725>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.326272,0.000000,21.287850>}
box{<0,0,-0.203200><0.120385,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.241147,0.000000,21.202725> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.244200,-1.535000,34.558534>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.571534,-1.535000,34.231200>}
box{<0,0,-0.152400><0.462921,0.035000,0.152400> rotate<0,44.997030,0> translate<11.244200,-1.535000,34.558534> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.244200,-1.535000,37.038000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.244200,-1.535000,34.558534>}
box{<0,0,-0.152400><2.479466,0.035000,0.152400> rotate<0,-90.000000,0> translate<11.244200,-1.535000,34.558534> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.326272,0.000000,19.056147>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430525,0.000000,18.995956>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,29.998043,0> translate<11.326272,0.000000,19.056147> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.326272,0.000000,21.287850>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430525,0.000000,21.348041>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,-29.998043,0> translate<11.326272,0.000000,21.287850> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.363600,-1.535000,1.341134>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.641134,-1.535000,1.063600>}
box{<0,0,-0.152400><0.392493,0.035000,0.152400> rotate<0,44.997030,0> translate<11.363600,-1.535000,1.341134> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.363600,-1.535000,2.458862>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.641134,-1.535000,2.736397>}
box{<0,0,-0.152400><0.392493,0.035000,0.152400> rotate<0,-44.997030,0> translate<11.363600,-1.535000,2.458862> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430525,0.000000,18.995956>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.546806,0.000000,18.964800>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,14.998451,0> translate<11.430525,0.000000,18.995956> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430525,0.000000,21.348041>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.546806,0.000000,21.379197>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,-14.998451,0> translate<11.430525,0.000000,21.348041> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.435200,0.000000,17.961675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.435200,0.000000,16.684797>}
box{<0,0,-0.203200><1.276878,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.435200,0.000000,16.684797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.435200,0.000000,17.961675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.558941,0.000000,18.260413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<11.435200,0.000000,17.961675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.546806,0.000000,18.964800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.035194,0.000000,18.964800>}
box{<0,0,-0.203200><0.488387,0.035000,0.203200> rotate<0,0.000000,0> translate<11.546806,0.000000,18.964800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.546806,0.000000,21.379197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.035194,0.000000,21.379197>}
box{<0,0,-0.203200><0.488387,0.035000,0.203200> rotate<0,0.000000,0> translate<11.546806,0.000000,21.379197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.558941,0.000000,18.260413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.787584,0.000000,18.489056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.558941,0.000000,18.260413> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.571534,-1.535000,34.231200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.812463,-1.535000,34.231200>}
box{<0,0,-0.152400><2.240928,0.035000,0.152400> rotate<0,0.000000,0> translate<11.571534,-1.535000,34.231200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.613400,-1.535000,7.723641>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.748375,-1.535000,7.397781>}
box{<0,0,-0.152400><0.352708,0.035000,0.152400> rotate<0,67.495601,0> translate<11.613400,-1.535000,7.723641> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.613400,-1.535000,8.076356>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.613400,-1.535000,7.723641>}
box{<0,0,-0.152400><0.352716,0.035000,0.152400> rotate<0,-90.000000,0> translate<11.613400,-1.535000,7.723641> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.613400,-1.535000,8.076356>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.748375,-1.535000,8.402216>}
box{<0,0,-0.152400><0.352708,0.035000,0.152400> rotate<0,-67.495601,0> translate<11.613400,-1.535000,8.076356> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.641134,-1.535000,1.063600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.003750,-1.535000,0.913400>}
box{<0,0,-0.152400><0.392492,0.035000,0.152400> rotate<0,22.498473,0> translate<11.641134,-1.535000,1.063600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.641134,-1.535000,2.736397>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.003750,-1.535000,2.886597>}
box{<0,0,-0.152400><0.392492,0.035000,0.152400> rotate<0,-22.498473,0> translate<11.641134,-1.535000,2.736397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.739325,0.000000,13.959200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.787584,0.000000,13.910941>}
box{<0,0,-0.203200><0.068249,0.035000,0.203200> rotate<0,44.997030,0> translate<11.739325,0.000000,13.959200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.748375,-1.535000,7.397781>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.997781,-1.535000,7.148375>}
box{<0,0,-0.152400><0.352714,0.035000,0.152400> rotate<0,44.997030,0> translate<11.748375,-1.535000,7.397781> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.748375,-1.535000,8.402216>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.997781,-1.535000,8.651622>}
box{<0,0,-0.152400><0.352714,0.035000,0.152400> rotate<0,-44.997030,0> translate<11.748375,-1.535000,8.402216> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.787584,0.000000,13.910941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.086322,0.000000,13.787200>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<11.787584,0.000000,13.910941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.787584,0.000000,18.489056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.059400,0.000000,18.601644>}
box{<0,0,-0.203200><0.294210,0.035000,0.203200> rotate<0,-22.498116,0> translate<11.787584,0.000000,18.489056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.810094,0.000000,13.625997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.817816,0.000000,13.622797>}
box{<0,0,-0.203200><0.008359,0.035000,0.203200> rotate<0,22.507980,0> translate<11.810094,0.000000,13.625997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.817816,0.000000,13.622797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.019675,0.000000,13.622797>}
box{<0,0,-0.203200><0.201859,0.035000,0.203200> rotate<0,0.000000,0> translate<11.817816,0.000000,13.622797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.997781,-1.535000,7.148375>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.323641,-1.535000,7.013400>}
box{<0,0,-0.152400><0.352708,0.035000,0.152400> rotate<0,22.498459,0> translate<11.997781,-1.535000,7.148375> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.997781,-1.535000,8.651622>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.323641,-1.535000,8.786597>}
box{<0,0,-0.152400><0.352708,0.035000,0.152400> rotate<0,-22.498459,0> translate<11.997781,-1.535000,8.651622> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.003750,-1.535000,0.913400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.396247,-1.535000,0.913400>}
box{<0,0,-0.152400><0.392497,0.035000,0.152400> rotate<0,0.000000,0> translate<12.003750,-1.535000,0.913400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.003750,-1.535000,2.886597>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.396247,-1.535000,2.886597>}
box{<0,0,-0.152400><0.392497,0.035000,0.152400> rotate<0,0.000000,0> translate<12.003750,-1.535000,2.886597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.019675,0.000000,13.622797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.318413,0.000000,13.499056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<12.019675,0.000000,13.622797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.035178,0.000000,20.193800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.035178,0.000000,20.150194>}
box{<0,0,-0.203200><0.043606,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.035178,0.000000,20.150194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.035194,0.000000,18.964800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.035194,0.000000,20.150178>}
box{<0,0,-0.203200><1.185378,0.035000,0.203200> rotate<0,90.000000,0> translate<12.035194,0.000000,20.150178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.035194,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.078800,0.000000,19.100800>}
box{<0,0,-0.203200><0.043606,0.035000,0.203200> rotate<0,0.000000,0> translate<12.035194,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.035194,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.064200,0.000000,19.507200>}
box{<0,0,-0.203200><0.029006,0.035000,0.203200> rotate<0,0.000000,0> translate<12.035194,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.035194,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.064200,0.000000,19.913600>}
box{<0,0,-0.203200><0.029006,0.035000,0.203200> rotate<0,0.000000,0> translate<12.035194,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.035194,0.000000,20.150178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.064200,0.000000,20.150178>}
box{<0,0,-0.203200><0.029006,0.035000,0.203200> rotate<0,0.000000,0> translate<12.035194,0.000000,20.150178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.035194,0.000000,20.193819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.035194,0.000000,21.379197>}
box{<0,0,-0.203200><1.185378,0.035000,0.203200> rotate<0,90.000000,0> translate<12.035194,0.000000,21.379197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.035194,0.000000,20.193819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.064200,0.000000,20.193819>}
box{<0,0,-0.203200><0.029006,0.035000,0.203200> rotate<0,0.000000,0> translate<12.035194,0.000000,20.193819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.035194,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.064200,0.000000,20.320000>}
box{<0,0,-0.203200><0.029006,0.035000,0.203200> rotate<0,0.000000,0> translate<12.035194,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.035194,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.064200,0.000000,20.726400>}
box{<0,0,-0.203200><0.029006,0.035000,0.203200> rotate<0,0.000000,0> translate<12.035194,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.035194,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.078800,0.000000,21.132800>}
box{<0,0,-0.203200><0.043606,0.035000,0.203200> rotate<0,0.000000,0> translate<12.035194,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.059400,0.000000,18.826878>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.059400,0.000000,18.601644>}
box{<0,0,-0.203200><0.225234,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.059400,0.000000,18.601644> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.059400,0.000000,18.826878>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.116531,0.000000,18.964800>}
box{<0,0,-0.203200><0.149286,0.035000,0.203200> rotate<0,-67.494787,0> translate<12.059400,0.000000,18.826878> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.064200,0.000000,19.260322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.078800,0.000000,19.225075>}
box{<0,0,-0.203200><0.038151,0.035000,0.203200> rotate<0,67.495176,0> translate<12.064200,0.000000,19.260322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.064200,0.000000,20.150178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.064200,0.000000,19.260322>}
box{<0,0,-0.203200><0.889856,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.064200,0.000000,19.260322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.064200,0.000000,21.083675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.064200,0.000000,20.193819>}
box{<0,0,-0.203200><0.889856,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.064200,0.000000,20.193819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.064200,0.000000,21.083675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.078800,0.000000,21.118922>}
box{<0,0,-0.203200><0.038151,0.035000,0.203200> rotate<0,-67.495176,0> translate<12.064200,0.000000,21.083675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.078800,0.000000,18.964800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.116531,0.000000,18.964800>}
box{<0,0,-0.203200><0.037731,0.035000,0.203200> rotate<0,0.000000,0> translate<12.078800,0.000000,18.964800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.078800,0.000000,19.225075>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.078800,0.000000,18.964800>}
box{<0,0,-0.203200><0.260275,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.078800,0.000000,18.964800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.078800,0.000000,21.379197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.078800,0.000000,21.118922>}
box{<0,0,-0.203200><0.260275,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.078800,0.000000,21.118922> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.078800,0.000000,21.379197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.186609,0.000000,21.379197>}
box{<0,0,-0.203200><0.107809,0.035000,0.203200> rotate<0,0.000000,0> translate<12.078800,0.000000,21.379197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.086322,0.000000,13.787200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.059675,0.000000,13.787200>}
box{<0,0,-0.203200><1.973353,0.035000,0.203200> rotate<0,0.000000,0> translate<12.086322,0.000000,13.787200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.186609,0.000000,21.379197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.187941,0.000000,21.382413>}
box{<0,0,-0.203200><0.003480,0.035000,0.203200> rotate<0,-67.506275,0> translate<12.186609,0.000000,21.379197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.187941,0.000000,21.382413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.416584,0.000000,21.611056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.187941,0.000000,21.382413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.218303,0.000000,7.915997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.298797,0.000000,8.110322>}
box{<0,0,-0.203200><0.210337,0.035000,0.203200> rotate<0,-67.495118,0> translate<12.218303,0.000000,7.915997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.218303,0.000000,7.915997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.592000,0.000000,7.915997>}
box{<0,0,-0.203200><0.373697,0.035000,0.203200> rotate<0,0.000000,0> translate<12.218303,0.000000,7.915997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.298797,0.000000,8.110322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.298797,0.000000,8.647956>}
box{<0,0,-0.203200><0.537634,0.035000,0.203200> rotate<0,90.000000,0> translate<12.298797,0.000000,8.647956> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.298797,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.684000,0.000000,8.128000>}
box{<0,0,-0.203200><0.385203,0.035000,0.203200> rotate<0,0.000000,0> translate<12.298797,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.298797,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.684000,0.000000,8.534400>}
box{<0,0,-0.203200><0.385203,0.035000,0.203200> rotate<0,0.000000,0> translate<12.298797,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.298797,0.000000,8.647956>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.469322,0.000000,8.818481>}
box{<0,0,-0.203200><0.241159,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.298797,0.000000,8.647956> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.318413,0.000000,13.499056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.547056,0.000000,13.270413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<12.318413,0.000000,13.499056> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.323641,-1.535000,7.013400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.331575,-1.535000,7.013400>}
box{<0,0,-0.152400><0.007934,0.035000,0.152400> rotate<0,0.000000,0> translate<12.323641,-1.535000,7.013400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.323641,-1.535000,8.786597>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.676356,-1.535000,8.786597>}
box{<0,0,-0.152400><0.352716,0.035000,0.152400> rotate<0,0.000000,0> translate<12.323641,-1.535000,8.786597> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.331575,-1.535000,7.013400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.338000,-1.535000,6.069875>}
box{<0,0,-0.152400><1.379540,0.035000,0.152400> rotate<0,43.149589,0> translate<12.331575,-1.535000,7.013400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.396247,-1.535000,0.913400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.758863,-1.535000,1.063600>}
box{<0,0,-0.152400><0.392492,0.035000,0.152400> rotate<0,-22.498473,0> translate<12.396247,-1.535000,0.913400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.396247,-1.535000,2.886597>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.758863,-1.535000,2.736397>}
box{<0,0,-0.152400><0.392492,0.035000,0.152400> rotate<0,22.498473,0> translate<12.396247,-1.535000,2.886597> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.398659,-1.535000,0.914400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.045113,-1.535000,0.914400>}
box{<0,0,-0.152400><5.646453,0.035000,0.152400> rotate<0,0.000000,0> translate<12.398659,-1.535000,0.914400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.406269,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.909728,0.000000,13.411200>}
box{<0,0,-0.203200><0.503459,0.035000,0.203200> rotate<0,0.000000,0> translate<12.406269,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.416584,0.000000,21.611056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.715322,0.000000,21.734797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<12.416584,0.000000,21.611056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.469322,0.000000,8.818481>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.623997,0.000000,9.191903>}
box{<0,0,-0.203200><0.404188,0.035000,0.203200> rotate<0,-67.495729,0> translate<12.469322,0.000000,8.818481> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.519984,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.684000,0.000000,8.940800>}
box{<0,0,-0.203200><0.164016,0.035000,0.203200> rotate<0,0.000000,0> translate<12.519984,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.547056,0.000000,13.270413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.658000,0.000000,13.002572>}
box{<0,0,-0.203200><0.289909,0.035000,0.203200> rotate<0,67.495448,0> translate<12.547056,0.000000,13.270413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.592000,0.000000,7.915997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.684000,0.000000,8.038666>}
box{<0,0,-0.203200><0.153335,0.035000,0.203200> rotate<0,-53.127063,0> translate<12.592000,0.000000,7.915997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.623997,0.000000,9.191903>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.623997,0.000000,10.185341>}
box{<0,0,-0.203200><0.993438,0.035000,0.203200> rotate<0,90.000000,0> translate<12.623997,0.000000,10.185341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.623997,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.684000,0.000000,9.347200>}
box{<0,0,-0.203200><0.060003,0.035000,0.203200> rotate<0,0.000000,0> translate<12.623997,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.623997,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.684000,0.000000,9.753600>}
box{<0,0,-0.203200><0.060003,0.035000,0.203200> rotate<0,0.000000,0> translate<12.623997,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.623997,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.684000,0.000000,10.160000>}
box{<0,0,-0.203200><0.060003,0.035000,0.203200> rotate<0,0.000000,0> translate<12.623997,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.623997,0.000000,10.185341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.657997,0.000000,10.267428>}
box{<0,0,-0.203200><0.088850,0.035000,0.203200> rotate<0,-67.496591,0> translate<12.623997,0.000000,10.185341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.657078,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.658925,0.000000,13.004800>}
box{<0,0,-0.203200><0.001847,0.035000,0.203200> rotate<0,0.000000,0> translate<12.657078,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.657997,0.000000,10.267428>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.684000,0.000000,10.204650>}
box{<0,0,-0.203200><0.067950,0.035000,0.203200> rotate<0,67.495877,0> translate<12.657997,0.000000,10.267428> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.658000,0.000000,13.002572>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.768941,0.000000,13.270413>}
box{<0,0,-0.203200><0.289908,0.035000,0.203200> rotate<0,-67.496019,0> translate<12.658000,0.000000,13.002572> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.676356,-1.535000,8.786597>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.002216,-1.535000,8.651622>}
box{<0,0,-0.152400><0.352708,0.035000,0.152400> rotate<0,22.498459,0> translate<12.676356,-1.535000,8.786597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.684000,0.000000,10.204650>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.684000,0.000000,8.038666>}
box{<0,0,-0.203200><2.165984,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.684000,0.000000,8.038666> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.715322,0.000000,21.734797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.938675,0.000000,21.734797>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,0.000000,0> translate<12.715322,0.000000,21.734797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.722831,-1.535000,17.838000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.023641,-1.535000,17.713400>}
box{<0,0,-0.152400><0.325594,0.035000,0.152400> rotate<0,22.498625,0> translate<12.722831,-1.535000,17.838000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.722831,-1.535000,19.361997>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.023641,-1.535000,19.486597>}
box{<0,0,-0.152400><0.325594,0.035000,0.152400> rotate<0,-22.498625,0> translate<12.722831,-1.535000,19.361997> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.742441,-1.535000,2.743200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.236959,-1.535000,2.743200>}
box{<0,0,-0.152400><4.494519,0.035000,0.152400> rotate<0,0.000000,0> translate<12.742441,-1.535000,2.743200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.758863,-1.535000,1.063600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.036397,-1.535000,1.341134>}
box{<0,0,-0.152400><0.392493,0.035000,0.152400> rotate<0,-44.997030,0> translate<12.758863,-1.535000,1.063600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.758863,-1.535000,2.736397>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.036397,-1.535000,2.458862>}
box{<0,0,-0.152400><0.392493,0.035000,0.152400> rotate<0,44.997030,0> translate<12.758863,-1.535000,2.736397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.768941,0.000000,13.270413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.997584,0.000000,13.499056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.768941,0.000000,13.270413> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.914463,-1.535000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.563144,-1.535000,1.219200>}
box{<0,0,-0.152400><4.648681,0.035000,0.152400> rotate<0,0.000000,0> translate<12.914463,-1.535000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.997584,0.000000,13.499056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.296322,0.000000,13.622797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<12.997584,0.000000,13.499056> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.002216,-1.535000,8.651622>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.251622,-1.535000,8.402216>}
box{<0,0,-0.152400><0.352714,0.035000,0.152400> rotate<0,44.997030,0> translate<13.002216,-1.535000,8.651622> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.023641,-1.535000,17.713400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.376356,-1.535000,17.713400>}
box{<0,0,-0.152400><0.352716,0.035000,0.152400> rotate<0,0.000000,0> translate<13.023641,-1.535000,17.713400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.023641,-1.535000,19.486597>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.376356,-1.535000,19.486597>}
box{<0,0,-0.152400><0.352716,0.035000,0.152400> rotate<0,0.000000,0> translate<13.023641,-1.535000,19.486597> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.036397,-1.535000,1.341134>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.186597,-1.535000,1.703750>}
box{<0,0,-0.152400><0.392492,0.035000,0.152400> rotate<0,-67.495587,0> translate<13.036397,-1.535000,1.341134> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.036397,-1.535000,2.458862>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.186597,-1.535000,2.096247>}
box{<0,0,-0.152400><0.392492,0.035000,0.152400> rotate<0,67.495587,0> translate<13.036397,-1.535000,2.458862> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.044875,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.137000,-1.535000,2.438400>}
box{<0,0,-0.152400><4.092125,0.035000,0.152400> rotate<0,0.000000,0> translate<13.044875,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.112141,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.311847,-1.535000,1.524000>}
box{<0,0,-0.152400><4.199706,0.035000,0.152400> rotate<0,0.000000,0> translate<13.112141,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.113400,-1.535000,4.303750>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.263600,-1.535000,3.941134>}
box{<0,0,-0.152400><0.392492,0.035000,0.152400> rotate<0,67.495587,0> translate<13.113400,-1.535000,4.303750> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.113400,-1.535000,4.696247>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.113400,-1.535000,4.303750>}
box{<0,0,-0.152400><0.392497,0.035000,0.152400> rotate<0,-90.000000,0> translate<13.113400,-1.535000,4.303750> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.113400,-1.535000,4.696247>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.263600,-1.535000,5.058863>}
box{<0,0,-0.152400><0.392492,0.035000,0.152400> rotate<0,-67.495587,0> translate<13.113400,-1.535000,4.696247> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.119438,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.738000,-1.535000,8.534400>}
box{<0,0,-0.152400><5.618562,0.035000,0.152400> rotate<0,0.000000,0> translate<13.119438,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.171125,-1.535000,2.133600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.137000,-1.535000,2.133600>}
box{<0,0,-0.152400><3.965875,0.035000,0.152400> rotate<0,0.000000,0> translate<13.171125,-1.535000,2.133600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.186597,-1.535000,1.703750>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.186597,-1.535000,2.096247>}
box{<0,0,-0.152400><0.392497,0.035000,0.152400> rotate<0,90.000000,0> translate<13.186597,-1.535000,2.096247> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.186597,-1.535000,1.828800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.185594,-1.535000,1.828800>}
box{<0,0,-0.152400><3.998997,0.035000,0.152400> rotate<0,0.000000,0> translate<13.186597,-1.535000,1.828800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.251622,-1.535000,8.402216>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.361572,-1.535000,8.136769>}
box{<0,0,-0.152400><0.287317,0.035000,0.152400> rotate<0,67.495858,0> translate<13.251622,-1.535000,8.402216> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.263600,-1.535000,3.941134>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.541134,-1.535000,3.663600>}
box{<0,0,-0.152400><0.392493,0.035000,0.152400> rotate<0,44.997030,0> translate<13.263600,-1.535000,3.941134> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.263600,-1.535000,5.058863>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.338000,-1.535000,5.133262>}
box{<0,0,-0.152400><0.105217,0.035000,0.152400> rotate<0,-44.997030,0> translate<13.263600,-1.535000,5.058863> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.296322,0.000000,13.622797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.370897,0.000000,13.622797>}
box{<0,0,-0.203200><0.074575,0.035000,0.203200> rotate<0,0.000000,0> translate<13.296322,0.000000,13.622797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.323122,-1.535000,8.229600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.738000,-1.535000,8.229600>}
box{<0,0,-0.152400><5.414878,0.035000,0.152400> rotate<0,0.000000,0> translate<13.323122,-1.535000,8.229600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.338000,-1.535000,6.069875>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.338000,-1.535000,5.133262>}
box{<0,0,-0.152400><0.936613,0.035000,0.152400> rotate<0,-90.000000,0> translate<13.338000,-1.535000,5.133262> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.361572,-1.535000,8.136769>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.519872,-1.535000,7.050863>}
box{<0,0,-0.152400><1.587719,0.035000,0.152400> rotate<0,43.149542,0> translate<13.361572,-1.535000,8.136769> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.370897,0.000000,13.622797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.595903,0.000000,13.715997>}
box{<0,0,-0.203200><0.243545,0.035000,0.203200> rotate<0,-22.498376,0> translate<13.370897,0.000000,13.622797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.376356,-1.535000,17.713400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.702216,-1.535000,17.848375>}
box{<0,0,-0.152400><0.352708,0.035000,0.152400> rotate<0,-22.498459,0> translate<13.376356,-1.535000,17.713400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.376356,-1.535000,19.486597>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.702216,-1.535000,19.351622>}
box{<0,0,-0.152400><0.352708,0.035000,0.152400> rotate<0,22.498459,0> translate<13.376356,-1.535000,19.486597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.421506,0.000000,3.357513>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.456413,0.000000,3.343056>}
box{<0,0,-0.203200><0.037781,0.035000,0.203200> rotate<0,22.495164,0> translate<13.421506,0.000000,3.357513> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.421506,0.000000,3.357513>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.468413,0.000000,3.376941>}
box{<0,0,-0.203200><0.050771,0.035000,0.203200> rotate<0,-22.497389,0> translate<13.421506,0.000000,3.357513> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.456413,0.000000,3.343056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.685056,0.000000,3.114413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<13.456413,0.000000,3.343056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.468413,0.000000,3.376941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.697056,0.000000,3.605584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.468413,0.000000,3.376941> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.541134,-1.535000,3.663600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.903750,-1.535000,3.513400>}
box{<0,0,-0.152400><0.392492,0.035000,0.152400> rotate<0,22.498473,0> translate<13.541134,-1.535000,3.663600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.548269,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.113200,0.000000,3.251200>}
box{<0,0,-0.203200><3.564931,0.035000,0.203200> rotate<0,0.000000,0> translate<13.548269,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.587672,-1.535000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.738000,-1.535000,7.924800>}
box{<0,0,-0.152400><5.150328,0.035000,0.152400> rotate<0,0.000000,0> translate<13.587672,-1.535000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.595903,0.000000,13.715997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.272309,0.000000,13.715997>}
box{<0,0,-0.203200><0.676406,0.035000,0.203200> rotate<0,0.000000,0> translate<13.595903,0.000000,13.715997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.685056,0.000000,3.114413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.808797,0.000000,2.815675>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<13.685056,0.000000,3.114413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.697056,0.000000,3.605584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.820797,0.000000,3.904322>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<13.697056,0.000000,3.605584> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.702216,-1.535000,17.848375>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.951622,-1.535000,18.097781>}
box{<0,0,-0.152400><0.352714,0.035000,0.152400> rotate<0,-44.997030,0> translate<13.702216,-1.535000,17.848375> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.702216,-1.535000,19.351622>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.951622,-1.535000,19.102216>}
box{<0,0,-0.152400><0.352714,0.035000,0.152400> rotate<0,44.997030,0> translate<13.702216,-1.535000,19.351622> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.718600,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.113200,0.000000,3.657600>}
box{<0,0,-0.203200><3.394600,0.035000,0.203200> rotate<0,0.000000,0> translate<13.718600,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.796734,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.078231,0.000000,2.844800>}
box{<0,0,-0.203200><1.281497,0.035000,0.203200> rotate<0,0.000000,0> translate<13.796734,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.808797,0.000000,1.062797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.808797,0.000000,2.815675>}
box{<0,0,-0.203200><1.752878,0.035000,0.203200> rotate<0,90.000000,0> translate<13.808797,0.000000,2.815675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.808797,0.000000,1.062797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.047109,0.000000,1.062797>}
box{<0,0,-0.203200><1.238313,0.035000,0.203200> rotate<0,0.000000,0> translate<13.808797,0.000000,1.062797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.808797,0.000000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.038800,0.000000,1.219200>}
box{<0,0,-0.203200><1.230003,0.035000,0.203200> rotate<0,0.000000,0> translate<13.808797,0.000000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.808797,0.000000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.038800,0.000000,1.625600>}
box{<0,0,-0.203200><1.230003,0.035000,0.203200> rotate<0,0.000000,0> translate<13.808797,0.000000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.808797,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.074178,0.000000,2.032000>}
box{<0,0,-0.203200><2.265381,0.035000,0.203200> rotate<0,0.000000,0> translate<13.808797,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.808797,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.038800,0.000000,2.438400>}
box{<0,0,-0.203200><1.230003,0.035000,0.203200> rotate<0,0.000000,0> translate<13.808797,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.812463,-1.535000,34.231200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.139797,-1.535000,34.558534>}
box{<0,0,-0.152400><0.462921,0.035000,0.152400> rotate<0,-44.997030,0> translate<13.812463,-1.535000,34.231200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.820797,0.000000,3.904322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.820797,0.000000,4.569206>}
box{<0,0,-0.203200><0.664884,0.035000,0.203200> rotate<0,90.000000,0> translate<13.820797,0.000000,4.569206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.820797,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.113200,0.000000,4.064000>}
box{<0,0,-0.203200><3.292403,0.035000,0.203200> rotate<0,0.000000,0> translate<13.820797,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.820797,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.116816,0.000000,4.470400>}
box{<0,0,-0.203200><3.296019,0.035000,0.203200> rotate<0,0.000000,0> translate<13.820797,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.820797,0.000000,4.569206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.950722,0.000000,4.579200>}
box{<0,0,-0.203200><0.130309,0.035000,0.203200> rotate<0,-4.398204,0> translate<13.820797,0.000000,4.569206> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.837041,-1.535000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.813400,-1.535000,17.983200>}
box{<0,0,-0.152400><9.976359,0.035000,0.152400> rotate<0,0.000000,0> translate<13.837041,-1.535000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.851438,-1.535000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,19.202400>}
box{<0,0,-0.152400><11.883362,0.035000,0.152400> rotate<0,0.000000,0> translate<13.851438,-1.535000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.903750,-1.535000,3.513400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.296247,-1.535000,3.513400>}
box{<0,0,-0.152400><0.392497,0.035000,0.152400> rotate<0,0.000000,0> translate<13.903750,-1.535000,3.513400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.912794,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.832616,-1.535000,7.620000>}
box{<0,0,-0.152400><4.919822,0.035000,0.152400> rotate<0,0.000000,0> translate<13.912794,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.938675,0.000000,21.734797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.961997,0.000000,21.725134>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,22.503260,0> translate<13.938675,0.000000,21.734797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.950722,0.000000,4.579200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.162722,0.000000,4.579200>}
box{<0,0,-0.203200><0.212000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.950722,0.000000,4.579200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.951622,-1.535000,18.097781>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.086597,-1.535000,18.423641>}
box{<0,0,-0.152400><0.352708,0.035000,0.152400> rotate<0,-67.495601,0> translate<13.951622,-1.535000,18.097781> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.951622,-1.535000,19.102216>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.086597,-1.535000,18.776356>}
box{<0,0,-0.152400><0.352708,0.035000,0.152400> rotate<0,67.495601,0> translate<13.951622,-1.535000,19.102216> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.961997,0.000000,21.725134>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.985322,0.000000,21.734797>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,-22.500546,0> translate<13.961997,0.000000,21.725134> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.985322,0.000000,21.734797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.208675,0.000000,21.734797>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,0.000000,0> translate<13.985322,0.000000,21.734797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.023663,-1.535000,34.442400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.688256,-1.535000,34.442400>}
box{<0,0,-0.152400><3.664594,0.035000,0.152400> rotate<0,0.000000,0> translate<14.023663,-1.535000,34.442400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.030413,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.818225,-1.535000,18.288000>}
box{<0,0,-0.152400><9.787813,0.035000,0.152400> rotate<0,0.000000,0> translate<14.030413,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.036378,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.308784,-1.535000,18.897600>}
box{<0,0,-0.152400><10.272406,0.035000,0.152400> rotate<0,0.000000,0> translate<14.036378,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.059675,0.000000,13.787200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.358413,0.000000,13.910941>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<14.059675,0.000000,13.787200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.086597,-1.535000,18.423641>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.086597,-1.535000,18.776356>}
box{<0,0,-0.152400><0.352716,0.035000,0.152400> rotate<0,90.000000,0> translate<14.086597,-1.535000,18.776356> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.086597,-1.535000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.944475,-1.535000,18.592800>}
box{<0,0,-0.152400><9.857878,0.035000,0.152400> rotate<0,0.000000,0> translate<14.086597,-1.535000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.133066,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.517600,0.000000,13.817600>}
box{<0,0,-0.203200><0.384534,0.035000,0.203200> rotate<0,0.000000,0> translate<14.133066,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.139797,-1.535000,34.558534>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.139797,-1.535000,38.465000>}
box{<0,0,-0.152400><3.906466,0.035000,0.152400> rotate<0,90.000000,0> translate<14.139797,-1.535000,38.465000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.139797,-1.535000,34.747200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.492600,-1.535000,34.747200>}
box{<0,0,-0.152400><3.352803,0.035000,0.152400> rotate<0,0.000000,0> translate<14.139797,-1.535000,34.747200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.139797,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.492600,-1.535000,35.052000>}
box{<0,0,-0.152400><3.352803,0.035000,0.152400> rotate<0,0.000000,0> translate<14.139797,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.139797,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.492600,-1.535000,35.356800>}
box{<0,0,-0.152400><3.352803,0.035000,0.152400> rotate<0,0.000000,0> translate<14.139797,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.139797,-1.535000,35.661600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.492600,-1.535000,35.661600>}
box{<0,0,-0.152400><3.352803,0.035000,0.152400> rotate<0,0.000000,0> translate<14.139797,-1.535000,35.661600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.139797,-1.535000,35.966400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.492600,-1.535000,35.966400>}
box{<0,0,-0.152400><3.352803,0.035000,0.152400> rotate<0,0.000000,0> translate<14.139797,-1.535000,35.966400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.139797,-1.535000,36.271200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.492600,-1.535000,36.271200>}
box{<0,0,-0.152400><3.352803,0.035000,0.152400> rotate<0,0.000000,0> translate<14.139797,-1.535000,36.271200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.139797,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.635587,-1.535000,36.576000>}
box{<0,0,-0.152400><4.495791,0.035000,0.152400> rotate<0,0.000000,0> translate<14.139797,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.139797,-1.535000,36.880800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.492600,-1.535000,36.880800>}
box{<0,0,-0.152400><3.352803,0.035000,0.152400> rotate<0,0.000000,0> translate<14.139797,-1.535000,36.880800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.139797,-1.535000,37.185600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.492600,-1.535000,37.185600>}
box{<0,0,-0.152400><3.352803,0.035000,0.152400> rotate<0,0.000000,0> translate<14.139797,-1.535000,37.185600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.139797,-1.535000,37.490400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.492600,-1.535000,37.490400>}
box{<0,0,-0.152400><3.352803,0.035000,0.152400> rotate<0,0.000000,0> translate<14.139797,-1.535000,37.490400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.139797,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.492600,-1.535000,37.795200>}
box{<0,0,-0.152400><3.352803,0.035000,0.152400> rotate<0,0.000000,0> translate<14.139797,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.139797,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.492600,-1.535000,38.100000>}
box{<0,0,-0.152400><3.352803,0.035000,0.152400> rotate<0,0.000000,0> translate<14.139797,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.139797,-1.535000,38.404800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.494022,-1.535000,38.404800>}
box{<0,0,-0.152400><3.354225,0.035000,0.152400> rotate<0,0.000000,0> translate<14.139797,-1.535000,38.404800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.139797,-1.535000,38.465000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.510150,-1.535000,38.465000>}
box{<0,0,-0.152400><3.370353,0.035000,0.152400> rotate<0,0.000000,0> translate<14.139797,-1.535000,38.465000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.162722,0.000000,4.579200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.211069,0.000000,4.599228>}
box{<0,0,-0.203200><0.052331,0.035000,0.203200> rotate<0,-22.500734,0> translate<14.162722,0.000000,4.579200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.211069,0.000000,4.599228>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.263250,0.000000,4.603241>}
box{<0,0,-0.203200><0.052335,0.035000,0.203200> rotate<0,-4.396841,0> translate<14.211069,0.000000,4.599228> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.237913,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.162044,-1.535000,7.315200>}
box{<0,0,-0.152400><4.924131,0.035000,0.152400> rotate<0,0.000000,0> translate<14.237913,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.263250,0.000000,4.603241>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.452306,0.000000,4.699150>}
box{<0,0,-0.203200><0.211993,0.035000,0.203200> rotate<0,-26.897180,0> translate<14.263250,0.000000,4.603241> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.272309,0.000000,13.715997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.573119,0.000000,13.840597>}
box{<0,0,-0.203200><0.325594,0.035000,0.203200> rotate<0,-22.498625,0> translate<14.272309,0.000000,13.715997> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.288800,-1.535000,26.858531>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.397072,-1.535000,26.597138>}
box{<0,0,-0.152400><0.282930,0.035000,0.152400> rotate<0,67.495725,0> translate<14.288800,-1.535000,26.858531> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.288800,-1.535000,33.741466>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.288800,-1.535000,26.858531>}
box{<0,0,-0.152400><6.882934,0.035000,0.152400> rotate<0,-90.000000,0> translate<14.288800,-1.535000,26.858531> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.288800,-1.535000,33.741466>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.397072,-1.535000,34.002859>}
box{<0,0,-0.152400><0.282930,0.035000,0.152400> rotate<0,-67.495725,0> translate<14.288800,-1.535000,33.741466> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.296247,-1.535000,3.513400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.658863,-1.535000,3.663600>}
box{<0,0,-0.152400><0.392492,0.035000,0.152400> rotate<0,-22.498473,0> translate<14.296247,-1.535000,3.513400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.358413,0.000000,13.910941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.587056,0.000000,14.139584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.358413,0.000000,13.910941> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.397072,-1.535000,26.597138>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.597138,-1.535000,26.397072>}
box{<0,0,-0.152400><0.282936,0.035000,0.152400> rotate<0,44.997030,0> translate<14.397072,-1.535000,26.597138> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.397072,-1.535000,34.002859>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.597138,-1.535000,34.202925>}
box{<0,0,-0.152400><0.282936,0.035000,0.152400> rotate<0,-44.997030,0> translate<14.397072,-1.535000,34.002859> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.452306,0.000000,4.699150>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.648172,0.000000,4.780278>}
box{<0,0,-0.203200><0.212003,0.035000,0.203200> rotate<0,-22.497997,0> translate<14.452306,0.000000,4.699150> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.519872,-1.535000,7.050863>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.531638,-1.535000,7.045991>}
box{<0,0,-0.152400><0.012734,0.035000,0.152400> rotate<0,22.491838,0> translate<14.519872,-1.535000,7.050863> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.531638,-1.535000,7.045991>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.630134,-1.535000,6.947491>}
box{<0,0,-0.152400><0.139298,0.035000,0.152400> rotate<0,44.997939,0> translate<14.531638,-1.535000,7.045991> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.567228,-1.535000,7.010400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,7.010400>}
box{<0,0,-0.152400><19.070772,0.035000,0.152400> rotate<0,0.000000,0> translate<14.567228,-1.535000,7.010400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.573119,0.000000,13.840597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.026878,0.000000,13.840597>}
box{<0,0,-0.203200><0.453759,0.035000,0.203200> rotate<0,0.000000,0> translate<14.573119,0.000000,13.840597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.587056,0.000000,14.139584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.710797,0.000000,14.438322>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<14.587056,0.000000,14.139584> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.597138,-1.535000,26.397072>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.858531,-1.535000,26.288800>}
box{<0,0,-0.152400><0.282930,0.035000,0.152400> rotate<0,22.498335,0> translate<14.597138,-1.535000,26.397072> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.597138,-1.535000,34.202925>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.858531,-1.535000,34.311197>}
box{<0,0,-0.152400><0.282930,0.035000,0.152400> rotate<0,-22.498335,0> translate<14.597138,-1.535000,34.202925> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.622022,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.838844,0.000000,14.224000>}
box{<0,0,-0.203200><1.216822,0.035000,0.203200> rotate<0,0.000000,0> translate<14.622022,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.630134,-1.535000,6.947491>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.731738,-1.535000,6.852241>}
box{<0,0,-0.152400><0.139269,0.035000,0.152400> rotate<0,43.148663,0> translate<14.630134,-1.535000,6.947491> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.644375,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,3.657600>}
box{<0,0,-0.152400><18.993625,0.035000,0.152400> rotate<0,0.000000,0> translate<14.644375,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.648172,0.000000,4.780278>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.685178,0.000000,4.817284>}
box{<0,0,-0.203200><0.052335,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.648172,0.000000,4.780278> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.658863,-1.535000,3.663600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.936397,-1.535000,3.941134>}
box{<0,0,-0.152400><0.392493,0.035000,0.152400> rotate<0,-44.997030,0> translate<14.658863,-1.535000,3.663600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.685178,0.000000,4.817284>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.731847,0.000000,4.840959>}
box{<0,0,-0.203200><0.052330,0.035000,0.203200> rotate<0,-26.896850,0> translate<14.685178,0.000000,4.817284> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.710797,0.000000,14.438322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.710797,0.000000,16.170447>}
box{<0,0,-0.203200><1.732125,0.035000,0.203200> rotate<0,90.000000,0> translate<14.710797,0.000000,16.170447> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.710797,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.644800,0.000000,14.630400>}
box{<0,0,-0.203200><0.934003,0.035000,0.203200> rotate<0,0.000000,0> translate<14.710797,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.710797,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.644800,0.000000,15.036800>}
box{<0,0,-0.203200><0.934003,0.035000,0.203200> rotate<0,0.000000,0> translate<14.710797,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.710797,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.644800,0.000000,15.443200>}
box{<0,0,-0.203200><0.934003,0.035000,0.203200> rotate<0,0.000000,0> translate<14.710797,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.710797,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.644800,0.000000,15.849600>}
box{<0,0,-0.203200><0.934003,0.035000,0.203200> rotate<0,0.000000,0> translate<14.710797,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.710797,0.000000,16.170447>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.875516,0.000000,16.238675>}
box{<0,0,-0.203200><0.178290,0.035000,0.203200> rotate<0,-22.498332,0> translate<14.710797,0.000000,16.170447> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.731738,-1.535000,6.852241>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.736984,-1.535000,6.840641>}
box{<0,0,-0.152400><0.012731,0.035000,0.152400> rotate<0,65.657627,0> translate<14.731738,-1.535000,6.852241> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.731847,0.000000,4.840959>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.869806,0.000000,5.001916>}
box{<0,0,-0.203200><0.211990,0.035000,0.203200> rotate<0,-49.396086,0> translate<14.731847,0.000000,4.840959> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.736984,-1.535000,6.840641>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.745991,-1.535000,6.831638>}
box{<0,0,-0.152400><0.012735,0.035000,0.152400> rotate<0,44.987089,0> translate<14.736984,-1.535000,6.840641> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.745991,-1.535000,6.831638>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.799306,-1.535000,6.702916>}
box{<0,0,-0.152400><0.139327,0.035000,0.152400> rotate<0,67.496579,0> translate<14.745991,-1.535000,6.831638> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.762566,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.113200,0.000000,4.876800>}
box{<0,0,-0.203200><2.350634,0.035000,0.203200> rotate<0,0.000000,0> translate<14.762566,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.798197,-1.535000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,6.705600>}
box{<0,0,-0.152400><18.839803,0.035000,0.152400> rotate<0,0.000000,0> translate<14.798197,-1.535000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.799306,-1.535000,6.702916>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.856713,-1.535000,6.576059>}
box{<0,0,-0.152400><0.139241,0.035000,0.152400> rotate<0,65.647492,0> translate<14.799306,-1.535000,6.702916> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.856713,-1.535000,6.576059>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.857122,-1.535000,6.563338>}
box{<0,0,-0.152400><0.012728,0.035000,0.152400> rotate<0,88.151107,0> translate<14.856713,-1.535000,6.576059> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.857122,-1.535000,6.563338>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.861997,-1.535000,6.551572>}
box{<0,0,-0.152400><0.012736,0.035000,0.152400> rotate<0,67.489234,0> translate<14.857122,-1.535000,6.563338> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.858531,-1.535000,26.288800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.141466,-1.535000,26.288800>}
box{<0,0,-0.152400><0.282934,0.035000,0.152400> rotate<0,0.000000,0> translate<14.858531,-1.535000,26.288800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.858531,-1.535000,34.311197>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.141466,-1.535000,34.311197>}
box{<0,0,-0.152400><6.282934,0.035000,0.152400> rotate<0,0.000000,0> translate<14.858531,-1.535000,34.311197> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.861997,-1.535000,5.133262>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.861997,-1.535000,6.261159>}
box{<0,0,-0.152400><1.127897,0.035000,0.152400> rotate<0,90.000000,0> translate<14.861997,-1.535000,6.261159> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.861997,-1.535000,5.133262>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.936397,-1.535000,5.058863>}
box{<0,0,-0.152400><0.105217,0.035000,0.152400> rotate<0,44.997030,0> translate<14.861997,-1.535000,5.133262> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.861997,-1.535000,5.181600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,5.181600>}
box{<0,0,-0.152400><18.776003,0.035000,0.152400> rotate<0,0.000000,0> translate<14.861997,-1.535000,5.181600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.861997,-1.535000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,5.486400>}
box{<0,0,-0.152400><18.776003,0.035000,0.152400> rotate<0,0.000000,0> translate<14.861997,-1.535000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.861997,-1.535000,5.791200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,5.791200>}
box{<0,0,-0.152400><18.776003,0.035000,0.152400> rotate<0,0.000000,0> translate<14.861997,-1.535000,5.791200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.861997,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,6.096000>}
box{<0,0,-0.152400><18.776003,0.035000,0.152400> rotate<0,0.000000,0> translate<14.861997,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.861997,-1.535000,6.261159>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.866487,-1.535000,6.273072>}
box{<0,0,-0.152400><0.012731,0.035000,0.152400> rotate<0,-69.340612,0> translate<14.861997,-1.535000,6.261159> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.861997,-1.535000,6.412266>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.861997,-1.535000,6.551572>}
box{<0,0,-0.152400><0.139306,0.035000,0.152400> rotate<0,90.000000,0> translate<14.861997,-1.535000,6.551572> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.861997,-1.535000,6.412266>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.866487,-1.535000,6.273072>}
box{<0,0,-0.152400><0.139266,0.035000,0.152400> rotate<0,88.146365,0> translate<14.861997,-1.535000,6.412266> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.862369,-1.535000,6.400800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,6.400800>}
box{<0,0,-0.152400><18.775631,0.035000,0.152400> rotate<0,0.000000,0> translate<14.862369,-1.535000,6.400800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.869806,0.000000,5.001916>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.019719,0.000000,5.151825>}
box{<0,0,-0.203200><0.212006,0.035000,0.203200> rotate<0,-44.996433,0> translate<14.869806,0.000000,5.001916> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.875516,0.000000,16.238675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.161322,0.000000,16.524481>}
box{<0,0,-0.203200><0.404191,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.875516,0.000000,16.238675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.892841,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.723788,0.000000,16.256000>}
box{<0,0,-0.203200><1.830947,0.035000,0.203200> rotate<0,0.000000,0> translate<14.892841,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.936397,-1.535000,3.941134>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.086597,-1.535000,4.303750>}
box{<0,0,-0.152400><0.392492,0.035000,0.152400> rotate<0,-67.495587,0> translate<14.936397,-1.535000,3.941134> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.936397,-1.535000,5.058863>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.086597,-1.535000,4.696247>}
box{<0,0,-0.152400><0.392492,0.035000,0.152400> rotate<0,67.495587,0> translate<14.936397,-1.535000,5.058863> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.945203,-1.535000,3.962400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,3.962400>}
box{<0,0,-0.152400><18.692797,0.035000,0.152400> rotate<0,0.000000,0> translate<14.945203,-1.535000,3.962400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,27.000000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,33.000000>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,90.000000,0> translate<15.000000,-1.535000,33.000000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,27.000000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,27.000000>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,27.000000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,27.127200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,27.127200>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,27.127200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,27.432000>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,27.600000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,33.600000>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,90.000000,0> translate<15.000000,-1.535000,33.600000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,27.600000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,27.600000>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,27.600000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,27.736800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,27.736800>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,27.736800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,27.736800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,27.736800>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,27.736800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,28.041600>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,28.041600>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,28.346400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,28.346400>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,28.346400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,28.346400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,28.346400>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,28.346400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,28.651200>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,28.651200>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,28.956000>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,28.956000>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,29.260800>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,29.260800>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,29.565600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,29.565600>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,29.565600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,29.565600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,29.565600>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,29.565600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,29.870400>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,29.870400>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,30.175200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,30.175200>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,30.175200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,30.175200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,30.175200>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,30.175200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,30.480000>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,30.480000>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,30.784800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,30.784800>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,30.784800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,30.784800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,30.784800>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,30.784800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,31.089600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,31.089600>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,31.089600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,31.089600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,31.089600>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,31.089600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,31.394400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,31.394400>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,31.394400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,31.394400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,31.394400>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,31.394400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,31.699200>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,31.699200>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,32.004000>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,32.004000>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,32.308800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,32.308800>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,32.308800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,32.308800>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,32.613600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,32.613600>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,32.613600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,32.613600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,32.613600>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,32.613600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,32.918400>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,32.918400>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,33.000000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,33.000000>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,33.000000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,33.223200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,33.223200>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,33.223200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,33.528000>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.000000,-1.535000,33.600000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,33.600000>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.000000,-1.535000,33.600000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.011813,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,4.876800>}
box{<0,0,-0.152400><18.626187,0.035000,0.152400> rotate<0,0.000000,0> translate<15.011813,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.019719,0.000000,5.151825>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.039744,0.000000,5.200175>}
box{<0,0,-0.203200><0.052333,0.035000,0.203200> rotate<0,-67.497796,0> translate<15.019719,0.000000,5.151825> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.026878,0.000000,13.840597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.446097,0.000000,13.666950>}
box{<0,0,-0.203200><0.453759,0.035000,0.203200> rotate<0,22.498606,0> translate<15.026878,0.000000,13.840597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.038800,0.000000,1.093806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.047109,0.000000,1.062797>}
box{<0,0,-0.203200><0.032103,0.035000,0.203200> rotate<0,74.994295,0> translate<15.038800,0.000000,1.093806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.038800,0.000000,1.732194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.038800,0.000000,1.093806>}
box{<0,0,-0.203200><0.638387,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.038800,0.000000,1.093806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.038800,0.000000,1.732194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.074178,0.000000,1.732194>}
box{<0,0,-0.203200><1.035378,0.035000,0.203200> rotate<0,0.000000,0> translate<15.038800,0.000000,1.732194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.038800,0.000000,2.075800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.074178,0.000000,2.075800>}
box{<0,0,-0.203200><1.035378,0.035000,0.203200> rotate<0,0.000000,0> translate<15.038800,0.000000,2.075800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.038800,0.000000,2.714191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.038800,0.000000,2.075800>}
box{<0,0,-0.203200><0.638391,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.038800,0.000000,2.075800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.038800,0.000000,2.714191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.069956,0.000000,2.830472>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,-74.995610,0> translate<15.038800,0.000000,2.714191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.039744,0.000000,5.200175>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.069800,0.000000,6.401909>}
box{<0,0,-0.203200><1.582776,0.035000,0.203200> rotate<0,-49.395494,0> translate<15.039744,0.000000,5.200175> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.069956,0.000000,2.830472>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.130147,0.000000,2.934725>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,-59.996017,0> translate<15.069956,0.000000,2.830472> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.071456,-1.535000,4.267200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,4.267200>}
box{<0,0,-0.152400><18.566544,0.035000,0.152400> rotate<0,0.000000,0> translate<15.071456,-1.535000,4.267200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.082400,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.399000,0.000000,13.817600>}
box{<0,0,-0.203200><5.316600,0.035000,0.203200> rotate<0,0.000000,0> translate<15.082400,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.086597,-1.535000,4.303750>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.086597,-1.535000,4.696247>}
box{<0,0,-0.152400><0.392497,0.035000,0.152400> rotate<0,90.000000,0> translate<15.086597,-1.535000,4.696247> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.086597,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,4.572000>}
box{<0,0,-0.152400><18.551403,0.035000,0.152400> rotate<0,0.000000,0> translate<15.086597,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.110906,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.113200,0.000000,5.283200>}
box{<0,0,-0.203200><2.002294,0.035000,0.203200> rotate<0,0.000000,0> translate<15.110906,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.130147,0.000000,2.934725>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.215272,0.000000,3.019850>}
box{<0,0,-0.203200><0.120385,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.130147,0.000000,2.934725> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.141466,-1.535000,26.288800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.858531,-1.535000,26.288800>}
box{<0,0,-0.152400><5.717066,0.035000,0.152400> rotate<0,0.000000,0> translate<15.141466,-1.535000,26.288800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.161322,0.000000,16.524481>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.644800,0.000000,17.007963>}
box{<0,0,-0.203200><0.683744,0.035000,0.203200> rotate<0,-44.997215,0> translate<15.161322,0.000000,16.524481> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.208675,0.000000,21.734797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.231997,0.000000,21.725134>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,22.503260,0> translate<15.208675,0.000000,21.734797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.215272,0.000000,3.019850>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.319525,0.000000,3.080041>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,-29.998043,0> translate<15.215272,0.000000,3.019850> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.231997,0.000000,21.725134>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.255322,0.000000,21.734797>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,-22.500546,0> translate<15.231997,0.000000,21.725134> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.255322,0.000000,21.734797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.478675,0.000000,21.734797>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,0.000000,0> translate<15.255322,0.000000,21.734797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.299238,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.644800,0.000000,16.662400>}
box{<0,0,-0.203200><0.345562,0.035000,0.203200> rotate<0,0.000000,0> translate<15.299238,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.319525,0.000000,3.080041>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.435806,0.000000,3.111197>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,-14.998451,0> translate<15.319525,0.000000,3.080041> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.435806,0.000000,3.111197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.074194,0.000000,3.111197>}
box{<0,0,-0.203200><0.638387,0.035000,0.203200> rotate<0,0.000000,0> translate<15.435806,0.000000,3.111197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.446097,0.000000,13.666950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.766950,0.000000,13.346097>}
box{<0,0,-0.203200><0.453755,0.035000,0.203200> rotate<0,44.997030,0> translate<15.446097,0.000000,13.666950> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.459250,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.113200,0.000000,5.689600>}
box{<0,0,-0.203200><1.653950,0.035000,0.203200> rotate<0,0.000000,0> translate<15.459250,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.644800,0.000000,14.539806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.675956,0.000000,14.423525>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,74.995610,0> translate<15.644800,0.000000,14.539806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.644800,0.000000,15.996803>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.644800,0.000000,14.539806>}
box{<0,0,-0.203200><1.456997,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.644800,0.000000,14.539806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.644800,0.000000,15.996803>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.723788,0.000000,15.996803>}
box{<0,0,-0.203200><1.078988,0.035000,0.203200> rotate<0,0.000000,0> translate<15.644800,0.000000,15.996803> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.644800,0.000000,16.403191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.723788,0.000000,16.403191>}
box{<0,0,-0.203200><1.078988,0.035000,0.203200> rotate<0,0.000000,0> translate<15.644800,0.000000,16.403191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.644800,0.000000,17.007963>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.644800,0.000000,16.403191>}
box{<0,0,-0.203200><0.604772,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.644800,0.000000,16.403191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.675956,0.000000,14.423525>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.736147,0.000000,14.319272>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,59.996017,0> translate<15.675956,0.000000,14.423525> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.701847,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.541650,0.000000,13.411200>}
box{<0,0,-0.203200><4.839803,0.035000,0.203200> rotate<0,0.000000,0> translate<15.701847,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.736147,0.000000,14.319272>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.821272,0.000000,14.234147>}
box{<0,0,-0.203200><0.120385,0.035000,0.203200> rotate<0,44.997030,0> translate<15.736147,0.000000,14.319272> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.766950,0.000000,13.346097>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.940597,0.000000,12.926878>}
box{<0,0,-0.203200><0.453759,0.035000,0.203200> rotate<0,67.495454,0> translate<15.766950,0.000000,13.346097> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.807591,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.955322,0.000000,6.096000>}
box{<0,0,-0.203200><1.147731,0.035000,0.203200> rotate<0,0.000000,0> translate<15.807591,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.821272,0.000000,14.234147>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.925525,0.000000,14.173956>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,29.998043,0> translate<15.821272,0.000000,14.234147> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.868325,0.000000,12.298644>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.940597,0.000000,12.473119>}
box{<0,0,-0.203200><0.188851,0.035000,0.203200> rotate<0,-67.494995,0> translate<15.868325,0.000000,12.298644> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.868325,0.000000,12.298644>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.102931,0.000000,12.068228>}
box{<0,0,-0.203200><0.328833,0.035000,0.203200> rotate<0,44.480747,0> translate<15.868325,0.000000,12.298644> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.908322,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.794331,0.000000,13.004800>}
box{<0,0,-0.203200><4.886009,0.035000,0.203200> rotate<0,0.000000,0> translate<15.908322,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.925525,0.000000,14.173956>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.041806,0.000000,14.142800>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,14.998451,0> translate<15.925525,0.000000,14.173956> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.940597,0.000000,12.473119>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.940597,0.000000,12.926878>}
box{<0,0,-0.203200><0.453759,0.035000,0.203200> rotate<0,90.000000,0> translate<15.940597,0.000000,12.926878> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.940597,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.322281,0.000000,12.598400>}
box{<0,0,-0.203200><5.381684,0.035000,0.203200> rotate<0,0.000000,0> translate<15.940597,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.976909,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.742519,0.000000,12.192000>}
box{<0,0,-0.203200><10.765609,0.035000,0.203200> rotate<0,0.000000,0> translate<15.976909,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.041806,0.000000,14.142800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.723803,0.000000,14.142800>}
box{<0,0,-0.203200><0.681997,0.035000,0.203200> rotate<0,0.000000,0> translate<16.041806,0.000000,14.142800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.069800,0.000000,6.401909>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.219719,0.000000,6.551825>}
box{<0,0,-0.203200><0.212015,0.035000,0.203200> rotate<0,-44.996433,0> translate<16.069800,0.000000,6.401909> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.074178,0.000000,2.075800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.074178,0.000000,1.732194>}
box{<0,0,-0.203200><0.343606,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.074178,0.000000,1.732194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.074194,0.000000,2.075819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.074194,0.000000,3.111197>}
box{<0,0,-0.203200><1.035378,0.035000,0.203200> rotate<0,90.000000,0> translate<16.074194,0.000000,3.111197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.074194,0.000000,2.075819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.417800,0.000000,2.075819>}
box{<0,0,-0.203200><0.343606,0.035000,0.203200> rotate<0,0.000000,0> translate<16.074194,0.000000,2.075819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.074194,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.417800,0.000000,2.438400>}
box{<0,0,-0.203200><0.343606,0.035000,0.203200> rotate<0,0.000000,0> translate<16.074194,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.074194,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.417800,0.000000,2.844800>}
box{<0,0,-0.203200><0.343606,0.035000,0.203200> rotate<0,0.000000,0> translate<16.074194,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.102931,0.000000,12.068228>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.267513,0.000000,11.680797>}
box{<0,0,-0.203200><0.420939,0.035000,0.203200> rotate<0,66.979737,0> translate<16.102931,0.000000,12.068228> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.170291,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.897200,0.000000,6.502400>}
box{<0,0,-0.203200><0.726909,0.035000,0.203200> rotate<0,0.000000,0> translate<16.170291,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.219719,0.000000,6.551825>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.239747,0.000000,6.600178>}
box{<0,0,-0.203200><0.052337,0.035000,0.203200> rotate<0,-67.495945,0> translate<16.219719,0.000000,6.551825> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.222994,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.300141,0.000000,11.785600>}
box{<0,0,-0.203200><3.077147,0.035000,0.203200> rotate<0,0.000000,0> translate<16.222994,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.239747,0.000000,6.600178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.273800,0.000000,6.639906>}
box{<0,0,-0.203200><0.052325,0.035000,0.203200> rotate<0,-49.395074,0> translate<16.239747,0.000000,6.600178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.267513,0.000000,11.680797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.151675,0.000000,11.680797>}
box{<0,0,-0.203200><0.884162,0.035000,0.203200> rotate<0,0.000000,0> translate<16.267513,0.000000,11.680797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.273800,0.000000,6.639906>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.339666,0.000000,6.841406>}
box{<0,0,-0.203200><0.211992,0.035000,0.203200> rotate<0,-71.893900,0> translate<16.273800,0.000000,6.639906> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.339666,0.000000,6.841406>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.420797,0.000000,7.037275>}
box{<0,0,-0.203200><0.212007,0.035000,0.203200> rotate<0,-67.495606,0> translate<16.339666,0.000000,6.841406> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.367578,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.897200,0.000000,6.908800>}
box{<0,0,-0.203200><0.529622,0.035000,0.203200> rotate<0,0.000000,0> translate<16.367578,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.417800,0.000000,3.111197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.417800,0.000000,2.075819>}
box{<0,0,-0.203200><1.035378,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.417800,0.000000,2.075819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.417800,0.000000,3.111197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.056191,0.000000,3.111197>}
box{<0,0,-0.203200><0.638391,0.035000,0.203200> rotate<0,0.000000,0> translate<16.417800,0.000000,3.111197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.420797,0.000000,7.037275>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.420797,0.000000,7.089606>}
box{<0,0,-0.203200><0.052331,0.035000,0.203200> rotate<0,90.000000,0> translate<16.420797,0.000000,7.089606> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.420797,0.000000,7.089606>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.437056,0.000000,7.139347>}
box{<0,0,-0.203200><0.052331,0.035000,0.203200> rotate<0,-71.893556,0> translate<16.420797,0.000000,7.089606> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.420797,0.000000,7.350719>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.420797,0.000000,8.955200>}
box{<0,0,-0.203200><1.604481,0.035000,0.203200> rotate<0,90.000000,0> translate<16.420797,0.000000,8.955200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.420797,0.000000,7.350719>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.437056,0.000000,7.139347>}
box{<0,0,-0.203200><0.211996,0.035000,0.203200> rotate<0,85.595645,0> translate<16.420797,0.000000,7.350719> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.420797,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.964272,0.000000,7.721600>}
box{<0,0,-0.203200><0.543475,0.035000,0.203200> rotate<0,0.000000,0> translate<16.420797,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.420797,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.863609,0.000000,8.128000>}
box{<0,0,-0.203200><0.442812,0.035000,0.203200> rotate<0,0.000000,0> translate<16.420797,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.420797,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.781400,0.000000,8.534400>}
box{<0,0,-0.203200><0.360603,0.035000,0.203200> rotate<0,0.000000,0> translate<16.420797,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.420797,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.781400,0.000000,8.940800>}
box{<0,0,-0.203200><0.360603,0.035000,0.203200> rotate<0,0.000000,0> translate<16.420797,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.420797,0.000000,8.955200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.781400,0.000000,8.955200>}
box{<0,0,-0.203200><0.360603,0.035000,0.203200> rotate<0,0.000000,0> translate<16.420797,0.000000,8.955200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.423531,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.897200,0.000000,7.315200>}
box{<0,0,-0.203200><0.473669,0.035000,0.203200> rotate<0,0.000000,0> translate<16.423531,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.478675,0.000000,21.734797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.501997,0.000000,21.725134>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,22.503260,0> translate<16.478675,0.000000,21.734797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.501997,0.000000,21.725134>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.525322,0.000000,21.734797>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,-22.500546,0> translate<16.501997,0.000000,21.725134> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.525322,0.000000,21.734797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.748675,0.000000,21.734797>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,0.000000,0> translate<16.525322,0.000000,21.734797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.723788,0.000000,16.403191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.723788,0.000000,15.996803>}
box{<0,0,-0.203200><0.406387,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.723788,0.000000,15.996803> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.723803,0.000000,14.142800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.723803,0.000000,15.996787>}
box{<0,0,-0.203200><1.853987,0.035000,0.203200> rotate<0,90.000000,0> translate<16.723803,0.000000,15.996787> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.723803,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.130191,0.000000,14.224000>}
box{<0,0,-0.203200><0.406388,0.035000,0.203200> rotate<0,0.000000,0> translate<16.723803,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.723803,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.130191,0.000000,14.630400>}
box{<0,0,-0.203200><0.406388,0.035000,0.203200> rotate<0,0.000000,0> translate<16.723803,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.723803,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.130191,0.000000,15.036800>}
box{<0,0,-0.203200><0.406388,0.035000,0.203200> rotate<0,0.000000,0> translate<16.723803,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.723803,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.130191,0.000000,15.443200>}
box{<0,0,-0.203200><0.406388,0.035000,0.203200> rotate<0,0.000000,0> translate<16.723803,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.723803,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.130191,0.000000,15.849600>}
box{<0,0,-0.203200><0.406388,0.035000,0.203200> rotate<0,0.000000,0> translate<16.723803,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.723803,0.000000,15.996787>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.130191,0.000000,15.996787>}
box{<0,0,-0.203200><0.406388,0.035000,0.203200> rotate<0,0.000000,0> translate<16.723803,0.000000,15.996787> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.781400,0.000000,8.326472>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.926834,0.000000,7.975363>}
box{<0,0,-0.203200><0.380038,0.035000,0.203200> rotate<0,67.495530,0> translate<16.781400,0.000000,8.326472> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.781400,0.000000,8.955200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.781400,0.000000,8.326472>}
box{<0,0,-0.203200><0.628728,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.781400,0.000000,8.326472> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.897200,0.000000,6.236322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.020941,0.000000,5.937584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<16.897200,0.000000,6.236322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.897200,0.000000,7.559675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.897200,0.000000,6.236322>}
box{<0,0,-0.203200><1.323353,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.897200,0.000000,6.236322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.897200,0.000000,7.559675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.020941,0.000000,7.858413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<16.897200,0.000000,7.559675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.926834,0.000000,7.975363>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.032363,0.000000,7.869834>}
box{<0,0,-0.203200><0.149239,0.035000,0.203200> rotate<0,44.997030,0> translate<16.926834,0.000000,7.975363> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.020941,0.000000,5.937584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.113200,0.000000,5.845325>}
box{<0,0,-0.203200><0.130474,0.035000,0.203200> rotate<0,44.997030,0> translate<17.020941,0.000000,5.937584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.020941,0.000000,7.858413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.032363,0.000000,7.869834>}
box{<0,0,-0.203200><0.016153,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.020941,0.000000,7.858413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.056191,0.000000,3.111197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.108641,0.000000,3.097141>}
box{<0,0,-0.203200><0.054301,0.035000,0.203200> rotate<0,15.001369,0> translate<17.056191,0.000000,3.111197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.108641,0.000000,3.097141>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.119450,0.000000,3.123238>}
box{<0,0,-0.203200><0.028247,0.035000,0.203200> rotate<0,-67.496116,0> translate<17.108641,0.000000,3.097141> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.113200,0.000000,3.138322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.119450,0.000000,3.123238>}
box{<0,0,-0.203200><0.016328,0.035000,0.203200> rotate<0,67.489557,0> translate<17.113200,0.000000,3.138322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.113200,0.000000,4.461675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.113200,0.000000,3.138322>}
box{<0,0,-0.203200><1.323353,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.113200,0.000000,3.138322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.113200,0.000000,4.461675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.191206,0.000000,4.650000>}
box{<0,0,-0.203200><0.203841,0.035000,0.203200> rotate<0,-67.495680,0> translate<17.113200,0.000000,4.461675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.113200,0.000000,4.838322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.191206,0.000000,4.650000>}
box{<0,0,-0.203200><0.203838,0.035000,0.203200> rotate<0,67.495344,0> translate<17.113200,0.000000,4.838322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.113200,0.000000,5.845325>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.113200,0.000000,4.838322>}
box{<0,0,-0.203200><1.007003,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.113200,0.000000,4.838322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.130191,0.000000,14.142800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.812191,0.000000,14.142800>}
box{<0,0,-0.203200><0.682000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.130191,0.000000,14.142800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.130191,0.000000,15.996787>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.130191,0.000000,14.142800>}
box{<0,0,-0.203200><1.853987,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.130191,0.000000,14.142800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.130209,0.000000,15.996803>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.130209,0.000000,16.403191>}
box{<0,0,-0.203200><0.406387,0.035000,0.203200> rotate<0,90.000000,0> translate<17.130209,0.000000,16.403191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.130209,0.000000,15.996803>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.209194,0.000000,15.996803>}
box{<0,0,-0.203200><1.078984,0.035000,0.203200> rotate<0,0.000000,0> translate<17.130209,0.000000,15.996803> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.130209,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.034000,0.000000,16.256000>}
box{<0,0,-0.203200><3.903791,0.035000,0.203200> rotate<0,0.000000,0> translate<17.130209,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.130209,0.000000,16.403191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.209197,0.000000,16.403191>}
box{<0,0,-0.203200><1.078988,0.035000,0.203200> rotate<0,0.000000,0> translate<17.130209,0.000000,16.403191> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.137000,-1.535000,1.946116>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.349681,-1.535000,1.432663>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,67.495355,0> translate<17.137000,-1.535000,1.946116> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.137000,-1.535000,2.501881>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.137000,-1.535000,1.946116>}
box{<0,0,-0.152400><0.555766,0.035000,0.152400> rotate<0,-90.000000,0> translate<17.137000,-1.535000,1.946116> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.137000,-1.535000,2.501881>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.349681,-1.535000,3.015334>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,-67.495355,0> translate<17.137000,-1.535000,2.501881> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.151675,0.000000,11.680797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.450413,0.000000,11.557056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<17.151675,0.000000,11.680797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.349681,-1.535000,1.432663>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.742663,-1.535000,1.039681>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,44.997030,0> translate<17.349681,-1.535000,1.432663> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.349681,-1.535000,3.015334>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.742663,-1.535000,3.408316>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,-44.997030,0> translate<17.349681,-1.535000,3.015334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.450413,0.000000,11.557056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.588272,0.000000,11.419197>}
box{<0,0,-0.203200><0.194963,0.035000,0.203200> rotate<0,44.997030,0> translate<17.450413,0.000000,11.557056> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.492600,-1.535000,34.736494>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.520294,-1.535000,34.633134>}
box{<0,0,-0.152400><0.107005,0.035000,0.152400> rotate<0,74.995728,0> translate<17.492600,-1.535000,34.736494> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.492600,-1.535000,36.415603>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.492600,-1.535000,34.736494>}
box{<0,0,-0.152400><1.679109,0.035000,0.152400> rotate<0,-90.000000,0> translate<17.492600,-1.535000,34.736494> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.492600,-1.535000,36.415603>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.635587,-1.535000,36.415603>}
box{<0,0,-0.152400><1.142988,0.035000,0.152400> rotate<0,0.000000,0> translate<17.492600,-1.535000,36.415603> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.492600,-1.535000,36.720391>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.635587,-1.535000,36.720391>}
box{<0,0,-0.152400><1.142988,0.035000,0.152400> rotate<0,0.000000,0> translate<17.492600,-1.535000,36.720391> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.492600,-1.535000,38.399503>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.492600,-1.535000,36.720391>}
box{<0,0,-0.152400><1.679113,0.035000,0.152400> rotate<0,-90.000000,0> translate<17.492600,-1.535000,36.720391> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.492600,-1.535000,38.399503>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.510150,-1.535000,38.465000>}
box{<0,0,-0.152400><0.067807,0.035000,0.152400> rotate<0,-74.994915,0> translate<17.492600,-1.535000,38.399503> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.520294,-1.535000,34.633134>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.573800,-1.535000,34.540463>}
box{<0,0,-0.152400><0.107009,0.035000,0.152400> rotate<0,59.995058,0> translate<17.520294,-1.535000,34.633134> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.573800,-1.535000,34.540463>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.649463,-1.535000,34.464800>}
box{<0,0,-0.152400><0.107003,0.035000,0.152400> rotate<0,44.997030,0> translate<17.573800,-1.535000,34.540463> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.588272,0.000000,11.419197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.937638,0.000000,11.419197>}
box{<0,0,-0.203200><1.349366,0.035000,0.203200> rotate<0,0.000000,0> translate<17.588272,0.000000,11.419197> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.649463,-1.535000,34.464800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.742134,-1.535000,34.411294>}
box{<0,0,-0.152400><0.107009,0.035000,0.152400> rotate<0,29.999002,0> translate<17.649463,-1.535000,34.464800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.742134,-1.535000,34.411294>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.845494,-1.535000,34.383600>}
box{<0,0,-0.152400><0.107005,0.035000,0.152400> rotate<0,14.998332,0> translate<17.742134,-1.535000,34.411294> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.742663,-1.535000,1.039681>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.256116,-1.535000,0.827000>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,22.498706,0> translate<17.742663,-1.535000,1.039681> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.742663,-1.535000,3.408316>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.256116,-1.535000,3.620997>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,-22.498706,0> translate<17.742663,-1.535000,3.408316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.748675,0.000000,21.734797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.772000,0.000000,21.725134>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,22.500546,0> translate<17.748675,0.000000,21.734797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.772000,0.000000,21.725134>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.795322,0.000000,21.734797>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,-22.503260,0> translate<17.772000,0.000000,21.725134> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.795322,0.000000,21.734797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.018675,0.000000,21.734797>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,0.000000,0> translate<17.795322,0.000000,21.734797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.812191,0.000000,14.142800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.928472,0.000000,14.173956>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,-14.998451,0> translate<17.812191,0.000000,14.142800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.845494,-1.535000,34.383600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.635603,-1.535000,34.383597>}
box{<0,0,-0.152400><0.790109,0.035000,0.152400> rotate<0,0.000227,0> translate<17.845494,-1.535000,34.383600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.928472,0.000000,14.173956>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.032725,0.000000,14.234147>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,-29.998043,0> translate<17.928472,0.000000,14.173956> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.015150,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.399000,0.000000,14.224000>}
box{<0,0,-0.203200><2.383850,0.035000,0.203200> rotate<0,0.000000,0> translate<18.015150,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.032725,0.000000,14.234147>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.117850,0.000000,14.319272>}
box{<0,0,-0.203200><0.120385,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.032725,0.000000,14.234147> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.113000,-1.535000,13.806116>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.325681,-1.535000,13.292663>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,67.495355,0> translate<18.113000,-1.535000,13.806116> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.113000,-1.535000,14.361881>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.113000,-1.535000,13.806116>}
box{<0,0,-0.152400><0.555766,0.035000,0.152400> rotate<0,-90.000000,0> translate<18.113000,-1.535000,13.806116> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.113000,-1.535000,14.361881>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.325681,-1.535000,14.875334>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,-67.495355,0> translate<18.113000,-1.535000,14.361881> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.117850,0.000000,14.319272>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.178041,0.000000,14.423525>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,-59.996017,0> translate<18.117850,0.000000,14.319272> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.178041,0.000000,14.423525>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.209197,0.000000,14.539806>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,-74.995610,0> translate<18.178041,0.000000,14.423525> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.209194,0.000000,15.996803>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.209197,0.000000,14.539806>}
box{<0,0,-0.203200><1.456997,0.035000,0.203200> rotate<0,89.993937,0> translate<18.209194,0.000000,15.996803> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.209197,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.489300,0.000000,14.630400>}
box{<0,0,-0.203200><2.280103,0.035000,0.203200> rotate<0,0.000000,0> translate<18.209197,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.209197,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.667934,0.000000,15.036800>}
box{<0,0,-0.203200><2.458738,0.035000,0.203200> rotate<0,0.000000,0> translate<18.209197,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.209197,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.034000,0.000000,15.443200>}
box{<0,0,-0.203200><2.824803,0.035000,0.203200> rotate<0,0.000000,0> translate<18.209197,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.209197,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.034000,0.000000,15.849600>}
box{<0,0,-0.203200><2.824803,0.035000,0.203200> rotate<0,0.000000,0> translate<18.209197,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.209197,0.000000,16.403191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.209197,0.000000,17.684000>}
box{<0,0,-0.203200><1.280809,0.035000,0.203200> rotate<0,90.000000,0> translate<18.209197,0.000000,17.684000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.209197,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.034000,0.000000,16.662400>}
box{<0,0,-0.203200><2.824803,0.035000,0.203200> rotate<0,0.000000,0> translate<18.209197,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.209197,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.034000,0.000000,17.068800>}
box{<0,0,-0.203200><2.824803,0.035000,0.203200> rotate<0,0.000000,0> translate<18.209197,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.209197,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.987956,0.000000,17.475200>}
box{<0,0,-0.203200><2.778759,0.035000,0.203200> rotate<0,0.000000,0> translate<18.209197,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.209197,0.000000,17.684000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.779156,0.000000,17.684000>}
box{<0,0,-0.203200><2.569959,0.035000,0.203200> rotate<0,0.000000,0> translate<18.209197,0.000000,17.684000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.256116,-1.535000,0.827000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.811881,-1.535000,0.827000>}
box{<0,0,-0.152400><0.555766,0.035000,0.152400> rotate<0,0.000000,0> translate<18.256116,-1.535000,0.827000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.256116,-1.535000,3.620997>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.811881,-1.535000,3.620997>}
box{<0,0,-0.152400><0.555766,0.035000,0.152400> rotate<0,0.000000,0> translate<18.256116,-1.535000,3.620997> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.325681,-1.535000,13.292663>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.718663,-1.535000,12.899681>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,44.997030,0> translate<18.325681,-1.535000,13.292663> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.325681,-1.535000,14.875334>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.718663,-1.535000,15.268316>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,-44.997030,0> translate<18.325681,-1.535000,14.875334> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.635587,-1.535000,36.720391>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.635587,-1.535000,36.415603>}
box{<0,0,-0.152400><0.304787,0.035000,0.152400> rotate<0,-90.000000,0> translate<18.635587,-1.535000,36.415603> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.635603,-1.535000,34.383597>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.635603,-1.535000,36.415588>}
box{<0,0,-0.152400><2.031991,0.035000,0.152400> rotate<0,90.000000,0> translate<18.635603,-1.535000,36.415588> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.635603,-1.535000,34.442400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.940391,-1.535000,34.442400>}
box{<0,0,-0.152400><0.304787,0.035000,0.152400> rotate<0,0.000000,0> translate<18.635603,-1.535000,34.442400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.635603,-1.535000,34.747200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.940391,-1.535000,34.747200>}
box{<0,0,-0.152400><0.304787,0.035000,0.152400> rotate<0,0.000000,0> translate<18.635603,-1.535000,34.747200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.635603,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.940391,-1.535000,35.052000>}
box{<0,0,-0.152400><0.304787,0.035000,0.152400> rotate<0,0.000000,0> translate<18.635603,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.635603,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.940391,-1.535000,35.356800>}
box{<0,0,-0.152400><0.304787,0.035000,0.152400> rotate<0,0.000000,0> translate<18.635603,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.635603,-1.535000,35.661600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.940391,-1.535000,35.661600>}
box{<0,0,-0.152400><0.304787,0.035000,0.152400> rotate<0,0.000000,0> translate<18.635603,-1.535000,35.661600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.635603,-1.535000,35.966400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.940391,-1.535000,35.966400>}
box{<0,0,-0.152400><0.304787,0.035000,0.152400> rotate<0,0.000000,0> translate<18.635603,-1.535000,35.966400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.635603,-1.535000,36.271200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.940391,-1.535000,36.271200>}
box{<0,0,-0.152400><0.304787,0.035000,0.152400> rotate<0,0.000000,0> translate<18.635603,-1.535000,36.271200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.635603,-1.535000,36.415588>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.940391,-1.535000,36.415588>}
box{<0,0,-0.152400><0.304787,0.035000,0.152400> rotate<0,0.000000,0> translate<18.635603,-1.535000,36.415588> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.718663,-1.535000,12.899681>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.199744,-1.535000,12.700409>}
box{<0,0,-0.152400><0.520719,0.035000,0.152400> rotate<0,22.498667,0> translate<18.718663,-1.535000,12.899681> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.718663,-1.535000,15.268316>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.232116,-1.535000,15.480997>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,-22.498706,0> translate<18.718663,-1.535000,15.268316> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.738000,-1.535000,7.848425>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.854006,-1.535000,7.568359>}
box{<0,0,-0.152400><0.303141,0.035000,0.152400> rotate<0,67.495673,0> translate<18.738000,-1.535000,7.848425> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.738000,-1.535000,11.651572>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.738000,-1.535000,7.848425>}
box{<0,0,-0.152400><3.803147,0.035000,0.152400> rotate<0,-90.000000,0> translate<18.738000,-1.535000,7.848425> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.738000,-1.535000,12.151572>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.738000,-1.535000,11.651572>}
box{<0,0,-0.152400><0.500000,0.035000,0.152400> rotate<0,-90.000000,0> translate<18.738000,-1.535000,11.651572> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.738000,-1.535000,12.151572>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.854006,-1.535000,12.431638>}
box{<0,0,-0.152400><0.303141,0.035000,0.152400> rotate<0,-67.495673,0> translate<18.738000,-1.535000,12.151572> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.811881,-1.535000,0.827000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.325334,-1.535000,1.039681>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,-22.498706,0> translate<18.811881,-1.535000,0.827000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.811881,-1.535000,3.620997>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.325334,-1.535000,3.408316>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,22.498706,0> translate<18.811881,-1.535000,3.620997> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.854006,-1.535000,7.568359>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.068359,-1.535000,7.354006>}
box{<0,0,-0.152400><0.303141,0.035000,0.152400> rotate<0,44.997030,0> translate<18.854006,-1.535000,7.568359> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.854006,-1.535000,12.431638>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.068359,-1.535000,12.645991>}
box{<0,0,-0.152400><0.303141,0.035000,0.152400> rotate<0,-44.997030,0> translate<18.854006,-1.535000,12.431638> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.937638,0.000000,11.419197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.945837,0.000000,11.438994>}
box{<0,0,-0.203200><0.021428,0.035000,0.203200> rotate<0,-67.495877,0> translate<18.937638,0.000000,11.419197> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.940391,-1.535000,34.383600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.730503,-1.535000,34.383600>}
box{<0,0,-0.152400><0.790113,0.035000,0.152400> rotate<0,0.000000,0> translate<18.940391,-1.535000,34.383600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.940391,-1.535000,36.415588>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.940391,-1.535000,34.383600>}
box{<0,0,-0.152400><2.031987,0.035000,0.152400> rotate<0,-90.000000,0> translate<18.940391,-1.535000,34.383600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.940409,-1.535000,36.415603>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.940409,-1.535000,36.720391>}
box{<0,0,-0.152400><0.304787,0.035000,0.152400> rotate<0,90.000000,0> translate<18.940409,-1.535000,36.720391> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.940409,-1.535000,36.415603>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.083397,-1.535000,36.415603>}
box{<0,0,-0.152400><1.142988,0.035000,0.152400> rotate<0,0.000000,0> translate<18.940409,-1.535000,36.415603> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.940409,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.268000,-1.535000,36.576000>}
box{<0,0,-0.152400><13.327591,0.035000,0.152400> rotate<0,0.000000,0> translate<18.940409,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.940409,-1.535000,36.720391>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.083397,-1.535000,36.720391>}
box{<0,0,-0.152400><1.142988,0.035000,0.152400> rotate<0,0.000000,0> translate<18.940409,-1.535000,36.720391> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.945837,0.000000,11.438994>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.287003,0.000000,11.780159>}
box{<0,0,-0.203200><0.482481,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.945837,0.000000,11.438994> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.018675,0.000000,21.734797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.041997,0.000000,21.725134>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,22.503260,0> translate<19.018675,0.000000,21.734797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.022881,-1.535000,0.914400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.585113,-1.535000,0.914400>}
box{<0,0,-0.152400><1.562231,0.035000,0.152400> rotate<0,0.000000,0> translate<19.022881,-1.535000,0.914400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.041997,0.000000,21.725134>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.065322,0.000000,21.734797>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,-22.500546,0> translate<19.041997,0.000000,21.725134> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.065322,0.000000,21.734797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.288675,0.000000,21.734797>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,0.000000,0> translate<19.065322,0.000000,21.734797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.068359,-1.535000,7.354006>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.348425,-1.535000,7.238000>}
box{<0,0,-0.152400><0.303141,0.035000,0.152400> rotate<0,22.498388,0> translate<19.068359,-1.535000,7.354006> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.068359,-1.535000,12.645991>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.199744,-1.535000,12.700409>}
box{<0,0,-0.152400><0.142208,0.035000,0.152400> rotate<0,-22.497607,0> translate<19.068359,-1.535000,12.645991> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.232116,-1.535000,15.480997>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.787881,-1.535000,15.480997>}
box{<0,0,-0.152400><0.555766,0.035000,0.152400> rotate<0,0.000000,0> translate<19.232116,-1.535000,15.480997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.287003,0.000000,11.780159>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.732756,0.000000,11.964797>}
box{<0,0,-0.203200><0.482480,0.035000,0.203200> rotate<0,-22.498571,0> translate<19.287003,0.000000,11.780159> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.325334,-1.535000,1.039681>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.718316,-1.535000,1.432663>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,-44.997030,0> translate<19.325334,-1.535000,1.039681> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.325334,-1.535000,3.408316>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.718316,-1.535000,3.015334>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,44.997030,0> translate<19.325334,-1.535000,3.408316> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.348425,-1.535000,7.238000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.651572,-1.535000,7.238000>}
box{<0,0,-0.152400><4.303147,0.035000,0.152400> rotate<0,0.000000,0> translate<19.348425,-1.535000,7.238000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.380850,-1.535000,3.352800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.227147,-1.535000,3.352800>}
box{<0,0,-0.152400><0.846297,0.035000,0.152400> rotate<0,0.000000,0> translate<19.380850,-1.535000,3.352800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.418734,0.000000,7.938734>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.455362,0.000000,7.975363>}
box{<0,0,-0.203200><0.051800,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.418734,0.000000,7.938734> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.418734,0.000000,7.938734>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.499056,0.000000,7.858413>}
box{<0,0,-0.203200><0.113592,0.035000,0.203200> rotate<0,44.997030,0> translate<19.418734,0.000000,7.938734> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.455362,0.000000,7.975363>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.600797,0.000000,8.326472>}
box{<0,0,-0.203200><0.380038,0.035000,0.203200> rotate<0,-67.495530,0> translate<19.455362,0.000000,7.975363> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.499056,0.000000,7.858413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.622797,0.000000,7.559675>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<19.499056,0.000000,7.858413> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.504853,-1.535000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.103144,-1.535000,1.219200>}
box{<0,0,-0.152400><0.598291,0.035000,0.152400> rotate<0,0.000000,0> translate<19.504853,-1.535000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.518584,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,8.128000>}
box{<0,0,-0.203200><9.865416,0.035000,0.203200> rotate<0,0.000000,0> translate<19.518584,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.555728,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,7.721600>}
box{<0,0,-0.203200><9.828272,0.035000,0.203200> rotate<0,0.000000,0> translate<19.555728,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.600797,0.000000,8.326472>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.600797,0.000000,8.393859>}
box{<0,0,-0.203200><0.067387,0.035000,0.203200> rotate<0,90.000000,0> translate<19.600797,0.000000,8.393859> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.600797,0.000000,8.393859>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.732756,0.000000,8.339200>}
box{<0,0,-0.203200><0.142832,0.035000,0.203200> rotate<0,22.498520,0> translate<19.600797,0.000000,8.393859> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.622797,0.000000,6.552669>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.622797,0.000000,7.559675>}
box{<0,0,-0.203200><1.007006,0.035000,0.203200> rotate<0,90.000000,0> translate<19.622797,0.000000,7.559675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.622797,0.000000,6.552669>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.715056,0.000000,6.460413>}
box{<0,0,-0.203200><0.130472,0.035000,0.203200> rotate<0,44.996060,0> translate<19.622797,0.000000,6.552669> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.622797,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,6.908800>}
box{<0,0,-0.203200><9.761203,0.035000,0.203200> rotate<0,0.000000,0> translate<19.622797,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.622797,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,7.315200>}
box{<0,0,-0.203200><9.761203,0.035000,0.203200> rotate<0,0.000000,0> translate<19.622797,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.673069,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.100928,0.000000,6.502400>}
box{<0,0,-0.203200><3.427859,0.035000,0.203200> rotate<0,0.000000,0> translate<19.673069,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.685650,-1.535000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.922347,-1.535000,3.048000>}
box{<0,0,-0.152400><0.236697,0.035000,0.152400> rotate<0,0.000000,0> translate<19.685650,-1.535000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.707659,0.000000,1.062797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.933647,0.000000,1.288781>}
box{<0,0,-0.203200><0.319592,0.035000,0.203200> rotate<0,-44.996634,0> translate<19.707659,0.000000,1.062797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.707659,0.000000,1.062797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.440338,0.000000,1.062797>}
box{<0,0,-0.203200><2.732678,0.035000,0.203200> rotate<0,0.000000,0> translate<19.707659,0.000000,1.062797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.715056,0.000000,6.460413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.838797,0.000000,6.161675>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<19.715056,0.000000,6.460413> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.718316,-1.535000,1.432663>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.804000,-1.535000,1.639522>}
box{<0,0,-0.152400><0.223903,0.035000,0.152400> rotate<0,-67.495447,0> translate<19.718316,-1.535000,1.432663> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.718316,-1.535000,3.015334>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.804000,-1.535000,2.808475>}
box{<0,0,-0.152400><0.223903,0.035000,0.152400> rotate<0,67.495447,0> translate<19.718316,-1.535000,3.015334> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.730503,-1.535000,34.383600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.833863,-1.535000,34.411294>}
box{<0,0,-0.152400><0.107005,0.035000,0.152400> rotate<0,-14.998332,0> translate<19.730503,-1.535000,34.383600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.732756,0.000000,8.339200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.415241,0.000000,8.339200>}
box{<0,0,-0.203200><2.682484,0.035000,0.203200> rotate<0,0.000000,0> translate<19.732756,0.000000,8.339200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.732756,0.000000,11.964797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.415241,0.000000,11.964797>}
box{<0,0,-0.203200><2.682484,0.035000,0.203200> rotate<0,0.000000,0> translate<19.732756,0.000000,11.964797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.756147,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.851847,-1.535000,1.524000>}
box{<0,0,-0.152400><0.095700,0.035000,0.152400> rotate<0,0.000000,0> translate<19.756147,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.760791,0.000000,4.650000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.838797,0.000000,4.461675>}
box{<0,0,-0.203200><0.203841,0.035000,0.203200> rotate<0,67.495680,0> translate<19.760791,0.000000,4.650000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.760791,0.000000,4.650000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.838797,0.000000,4.838322>}
box{<0,0,-0.203200><0.203838,0.035000,0.203200> rotate<0,-67.495344,0> translate<19.760791,0.000000,4.650000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.787881,-1.535000,15.480997>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.301334,-1.535000,15.268316>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,22.498706,0> translate<19.787881,-1.535000,15.480997> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.804000,-1.535000,1.639522>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.889681,-1.535000,1.432663>}
box{<0,0,-0.152400><0.223902,0.035000,0.152400> rotate<0,67.496186,0> translate<19.804000,-1.535000,1.639522> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.804000,-1.535000,2.808475>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.889681,-1.535000,3.015334>}
box{<0,0,-0.152400><0.223902,0.035000,0.152400> rotate<0,-67.496186,0> translate<19.804000,-1.535000,2.808475> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.833863,-1.535000,34.411294>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.926534,-1.535000,34.464800>}
box{<0,0,-0.152400><0.107009,0.035000,0.152400> rotate<0,-29.999002,0> translate<19.833863,-1.535000,34.411294> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.835184,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.900919,0.000000,4.470400>}
box{<0,0,-0.203200><3.065734,0.035000,0.203200> rotate<0,0.000000,0> translate<19.835184,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.838797,0.000000,3.254063>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.838797,0.000000,4.461675>}
box{<0,0,-0.203200><1.207613,0.035000,0.203200> rotate<0,90.000000,0> translate<19.838797,0.000000,4.461675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.838797,0.000000,3.254063>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.933647,0.000000,3.159216>}
box{<0,0,-0.203200><0.134136,0.035000,0.203200> rotate<0,44.996086,0> translate<19.838797,0.000000,3.254063> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.838797,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.760753,0.000000,3.657600>}
box{<0,0,-0.203200><2.921956,0.035000,0.203200> rotate<0,0.000000,0> translate<19.838797,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.838797,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.433075,0.000000,4.064000>}
box{<0,0,-0.203200><3.594278,0.035000,0.203200> rotate<0,0.000000,0> translate<19.838797,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.838797,0.000000,4.838322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.838797,0.000000,6.161675>}
box{<0,0,-0.203200><1.323353,0.035000,0.203200> rotate<0,90.000000,0> translate<19.838797,0.000000,6.161675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.838797,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.803200,0.000000,4.876800>}
box{<0,0,-0.203200><2.964403,0.035000,0.203200> rotate<0,0.000000,0> translate<19.838797,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.838797,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.803200,0.000000,5.283200>}
box{<0,0,-0.203200><2.964403,0.035000,0.203200> rotate<0,0.000000,0> translate<19.838797,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.838797,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.803200,0.000000,5.689600>}
box{<0,0,-0.203200><2.964403,0.035000,0.203200> rotate<0,0.000000,0> translate<19.838797,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.838797,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.830675,0.000000,6.096000>}
box{<0,0,-0.203200><2.991878,0.035000,0.203200> rotate<0,0.000000,0> translate<19.838797,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.841663,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.306334,0.000000,3.251200>}
box{<0,0,-0.203200><2.464672,0.035000,0.203200> rotate<0,0.000000,0> translate<19.841663,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.864062,0.000000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.283931,0.000000,1.219200>}
box{<0,0,-0.203200><2.419869,0.035000,0.203200> rotate<0,0.000000,0> translate<19.864062,0.000000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.887738,-1.535000,34.442400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,34.442400>}
box{<0,0,-0.152400><4.047063,0.035000,0.152400> rotate<0,0.000000,0> translate<19.887738,-1.535000,34.442400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.889681,-1.535000,1.432663>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.282663,-1.535000,1.039681>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,44.997030,0> translate<19.889681,-1.535000,1.432663> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.889681,-1.535000,3.015334>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.282663,-1.535000,3.408316>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,-44.997030,0> translate<19.889681,-1.535000,3.015334> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.926534,-1.535000,34.464800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.002197,-1.535000,34.540463>}
box{<0,0,-0.152400><0.107003,0.035000,0.152400> rotate<0,-44.997030,0> translate<19.926534,-1.535000,34.464800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.933647,0.000000,1.288781>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.184997,0.000000,1.895594>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,-67.495543,0> translate<19.933647,0.000000,1.288781> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.933647,0.000000,3.159216>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.184997,0.000000,2.552403>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,67.495543,0> translate<19.933647,0.000000,3.159216> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.968931,-1.535000,12.761997>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.301334,-1.535000,12.899681>}
box{<0,0,-0.152400><0.359790,0.035000,0.152400> rotate<0,-22.498293,0> translate<19.968931,-1.535000,12.761997> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.968931,-1.535000,12.761997>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.651572,-1.535000,12.761997>}
box{<0,0,-0.152400><3.682641,0.035000,0.152400> rotate<0,0.000000,0> translate<19.968931,-1.535000,12.761997> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.002197,-1.535000,34.540463>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.055703,-1.535000,34.633134>}
box{<0,0,-0.152400><0.107009,0.035000,0.152400> rotate<0,-59.995058,0> translate<20.002197,-1.535000,34.540463> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.055703,-1.535000,34.633134>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.083397,-1.535000,34.736494>}
box{<0,0,-0.152400><0.107005,0.035000,0.152400> rotate<0,-74.995728,0> translate<20.055703,-1.535000,34.633134> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.063884,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.084116,0.000000,2.844800>}
box{<0,0,-0.203200><2.020231,0.035000,0.203200> rotate<0,0.000000,0> translate<20.063884,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.064541,-1.535000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,12.801600>}
box{<0,0,-0.152400><5.670259,0.035000,0.152400> rotate<0,0.000000,0> translate<20.064541,-1.535000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.065847,-1.535000,38.465000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.083397,-1.535000,38.399503>}
box{<0,0,-0.152400><0.067807,0.035000,0.152400> rotate<0,74.994915,0> translate<20.065847,-1.535000,38.465000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.065847,-1.535000,38.465000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.941881,-1.535000,38.465000>}
box{<0,0,-0.152400><5.876034,0.035000,0.152400> rotate<0,0.000000,0> translate<20.065847,-1.535000,38.465000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.073159,0.000000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.074834,0.000000,1.625600>}
box{<0,0,-0.203200><2.001675,0.035000,0.203200> rotate<0,0.000000,0> translate<20.073159,0.000000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.081978,-1.535000,38.404800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.916944,-1.535000,38.404800>}
box{<0,0,-0.152400><5.834966,0.035000,0.152400> rotate<0,0.000000,0> translate<20.081978,-1.535000,38.404800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.083397,-1.535000,34.736494>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.083397,-1.535000,36.415603>}
box{<0,0,-0.152400><1.679109,0.035000,0.152400> rotate<0,90.000000,0> translate<20.083397,-1.535000,36.415603> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.083397,-1.535000,34.747200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,34.747200>}
box{<0,0,-0.152400><3.851403,0.035000,0.152400> rotate<0,0.000000,0> translate<20.083397,-1.535000,34.747200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.083397,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,35.052000>}
box{<0,0,-0.152400><3.851403,0.035000,0.152400> rotate<0,0.000000,0> translate<20.083397,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.083397,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,35.356800>}
box{<0,0,-0.152400><3.851403,0.035000,0.152400> rotate<0,0.000000,0> translate<20.083397,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.083397,-1.535000,35.661600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.005056,-1.535000,35.661600>}
box{<0,0,-0.152400><3.921659,0.035000,0.152400> rotate<0,0.000000,0> translate<20.083397,-1.535000,35.661600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.083397,-1.535000,35.966400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.201403,-1.535000,35.966400>}
box{<0,0,-0.152400><4.118006,0.035000,0.152400> rotate<0,0.000000,0> translate<20.083397,-1.535000,35.966400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.083397,-1.535000,36.271200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.506203,-1.535000,36.271200>}
box{<0,0,-0.152400><4.422806,0.035000,0.152400> rotate<0,0.000000,0> translate<20.083397,-1.535000,36.271200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.083397,-1.535000,36.720391>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.083397,-1.535000,38.399503>}
box{<0,0,-0.152400><1.679113,0.035000,0.152400> rotate<0,90.000000,0> translate<20.083397,-1.535000,38.399503> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.083397,-1.535000,36.880800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.268000,-1.535000,36.880800>}
box{<0,0,-0.152400><12.184603,0.035000,0.152400> rotate<0,0.000000,0> translate<20.083397,-1.535000,36.880800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.083397,-1.535000,37.185600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.268000,-1.535000,37.185600>}
box{<0,0,-0.152400><12.184603,0.035000,0.152400> rotate<0,0.000000,0> translate<20.083397,-1.535000,37.185600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.083397,-1.535000,37.490400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.214334,-1.535000,37.490400>}
box{<0,0,-0.152400><6.130937,0.035000,0.152400> rotate<0,0.000000,0> translate<20.083397,-1.535000,37.490400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.083397,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.999781,-1.535000,37.795200>}
box{<0,0,-0.152400><5.916384,0.035000,0.152400> rotate<0,0.000000,0> translate<20.083397,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.083397,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.913400,-1.535000,38.100000>}
box{<0,0,-0.152400><5.830003,0.035000,0.152400> rotate<0,0.000000,0> translate<20.083397,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.184997,0.000000,1.895594>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.184997,0.000000,2.552403>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,90.000000,0> translate<20.184997,0.000000,2.552403> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.184997,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.963000,0.000000,2.032000>}
box{<0,0,-0.203200><1.778003,0.035000,0.203200> rotate<0,0.000000,0> translate<20.184997,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.184997,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.963000,0.000000,2.438400>}
box{<0,0,-0.203200><1.778003,0.035000,0.203200> rotate<0,0.000000,0> translate<20.184997,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.282663,-1.535000,1.039681>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.796116,-1.535000,0.827000>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,22.498706,0> translate<20.282663,-1.535000,1.039681> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.282663,-1.535000,3.408316>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.796116,-1.535000,3.620997>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,-22.498706,0> translate<20.282663,-1.535000,3.408316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.288675,0.000000,21.734797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.311997,0.000000,21.725134>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,22.503260,0> translate<20.288675,0.000000,21.734797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.301334,-1.535000,12.899681>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.694316,-1.535000,13.292663>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,-44.997030,0> translate<20.301334,-1.535000,12.899681> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.301334,-1.535000,15.268316>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.694316,-1.535000,14.875334>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,44.997030,0> translate<20.301334,-1.535000,15.268316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.311997,0.000000,21.725134>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.335322,0.000000,21.734797>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,-22.500546,0> translate<20.311997,0.000000,21.725134> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.329650,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.881184,-1.535000,15.240000>}
box{<0,0,-0.152400><3.551534,0.035000,0.152400> rotate<0,0.000000,0> translate<20.329650,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.335322,0.000000,21.734797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.558675,0.000000,21.734797>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,0.000000,0> translate<20.335322,0.000000,21.734797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.399000,0.000000,13.755594>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.650350,0.000000,13.148781>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,67.495543,0> translate<20.399000,0.000000,13.755594> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.399000,0.000000,14.412403>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.399000,0.000000,13.755594>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.399000,0.000000,13.755594> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.399000,0.000000,14.412403>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.650350,0.000000,15.019216>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,-67.495543,0> translate<20.399000,0.000000,14.412403> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.508053,-1.535000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,13.106400>}
box{<0,0,-0.152400><5.226747,0.035000,0.152400> rotate<0,0.000000,0> translate<20.508053,-1.535000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.634450,-1.535000,14.935200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.813400,-1.535000,14.935200>}
box{<0,0,-0.152400><3.178950,0.035000,0.152400> rotate<0,0.000000,0> translate<20.634450,-1.535000,14.935200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.650350,0.000000,13.148781>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.114781,0.000000,12.684350>}
box{<0,0,-0.203200><0.656805,0.035000,0.203200> rotate<0,44.997030,0> translate<20.650350,0.000000,13.148781> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.650350,0.000000,15.019216>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.034000,0.000000,15.402866>}
box{<0,0,-0.203200><0.542563,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.650350,0.000000,15.019216> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.694316,-1.535000,13.292663>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.906997,-1.535000,13.806116>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,-67.495355,0> translate<20.694316,-1.535000,13.292663> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.694316,-1.535000,14.875334>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.906997,-1.535000,14.361881>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,67.495355,0> translate<20.694316,-1.535000,14.875334> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.743416,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,13.411200>}
box{<0,0,-0.152400><4.991384,0.035000,0.152400> rotate<0,0.000000,0> translate<20.743416,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.779156,0.000000,17.684000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.034000,0.000000,17.429156>}
box{<0,0,-0.203200><0.360403,0.035000,0.203200> rotate<0,44.997030,0> translate<20.779156,0.000000,17.684000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.795772,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.852019,-1.535000,14.630400>}
box{<0,0,-0.152400><3.056247,0.035000,0.152400> rotate<0,0.000000,0> translate<20.795772,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.796116,-1.535000,0.827000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.351881,-1.535000,0.827000>}
box{<0,0,-0.152400><0.555766,0.035000,0.152400> rotate<0,0.000000,0> translate<20.796116,-1.535000,0.827000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.796116,-1.535000,3.620997>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.351881,-1.535000,3.620997>}
box{<0,0,-0.152400><0.555766,0.035000,0.152400> rotate<0,0.000000,0> translate<20.796116,-1.535000,3.620997> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.858531,-1.535000,26.288800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.141466,-1.535000,26.288800>}
box{<0,0,-0.152400><0.282934,0.035000,0.152400> rotate<0,0.000000,0> translate<20.858531,-1.535000,26.288800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.869669,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,13.716000>}
box{<0,0,-0.152400><4.865131,0.035000,0.152400> rotate<0,0.000000,0> translate<20.869669,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.906997,-1.535000,13.806116>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.906997,-1.535000,14.361881>}
box{<0,0,-0.152400><0.555766,0.035000,0.152400> rotate<0,90.000000,0> translate<20.906997,-1.535000,14.361881> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.906997,-1.535000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.505775,-1.535000,14.020800>}
box{<0,0,-0.152400><3.598778,0.035000,0.152400> rotate<0,0.000000,0> translate<20.906997,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.906997,-1.535000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.020556,-1.535000,14.325600>}
box{<0,0,-0.152400><3.113559,0.035000,0.152400> rotate<0,0.000000,0> translate<20.906997,-1.535000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,33.000000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,27.000000>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,-90.000000,0> translate<21.000000,-1.535000,27.000000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,33.600000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.000000,-1.535000,27.600000>}
box{<0,0,-0.152400><6.000000,0.035000,0.152400> rotate<0,-90.000000,0> translate<21.000000,-1.535000,27.600000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.034000,0.000000,17.429156>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.034000,0.000000,15.402866>}
box{<0,0,-0.203200><2.026291,0.035000,0.203200> rotate<0,-90.000000,0> translate<21.034000,0.000000,15.402866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.114781,0.000000,12.684350>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.721594,0.000000,12.433000>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,22.498518,0> translate<21.114781,0.000000,12.684350> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.141466,-1.535000,26.288800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.402859,-1.535000,26.397072>}
box{<0,0,-0.152400><0.282930,0.035000,0.152400> rotate<0,-22.498335,0> translate<21.141466,-1.535000,26.288800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.141466,-1.535000,34.311197>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.402859,-1.535000,34.202925>}
box{<0,0,-0.152400><0.282930,0.035000,0.152400> rotate<0,22.498335,0> translate<21.141466,-1.535000,34.311197> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.351881,-1.535000,0.827000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.865334,-1.535000,1.039681>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,-22.498706,0> translate<21.351881,-1.535000,0.827000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.351881,-1.535000,3.620997>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.865334,-1.535000,3.408316>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,22.498706,0> translate<21.351881,-1.535000,3.620997> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.402859,-1.535000,26.397072>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.602925,-1.535000,26.597138>}
box{<0,0,-0.152400><0.282936,0.035000,0.152400> rotate<0,-44.997030,0> translate<21.402859,-1.535000,26.397072> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.402859,-1.535000,34.202925>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.602925,-1.535000,34.002859>}
box{<0,0,-0.152400><0.282936,0.035000,0.152400> rotate<0,44.997030,0> translate<21.402859,-1.535000,34.202925> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.468184,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,34.137600>}
box{<0,0,-0.152400><2.466616,0.035000,0.152400> rotate<0,0.000000,0> translate<21.468184,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.523388,-1.535000,26.517600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,26.517600>}
box{<0,0,-0.152400><2.411413,0.035000,0.152400> rotate<0,0.000000,0> translate<21.523388,-1.535000,26.517600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.558675,0.000000,21.734797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.581997,0.000000,21.725134>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,22.503260,0> translate<21.558675,0.000000,21.734797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.562881,-1.535000,0.914400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.125113,-1.535000,0.914400>}
box{<0,0,-0.152400><1.562231,0.035000,0.152400> rotate<0,0.000000,0> translate<21.562881,-1.535000,0.914400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.581997,0.000000,21.725134>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.605322,0.000000,21.734797>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,-22.500546,0> translate<21.581997,0.000000,21.725134> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.602925,-1.535000,26.597138>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.711197,-1.535000,26.858531>}
box{<0,0,-0.152400><0.282930,0.035000,0.152400> rotate<0,-67.495725,0> translate<21.602925,-1.535000,26.597138> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.602925,-1.535000,34.002859>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.711197,-1.535000,33.741466>}
box{<0,0,-0.152400><0.282930,0.035000,0.152400> rotate<0,67.495725,0> translate<21.602925,-1.535000,34.002859> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.605322,0.000000,21.734797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.828675,0.000000,21.734797>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,0.000000,0> translate<21.605322,0.000000,21.734797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.673366,-1.535000,33.832800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,33.832800>}
box{<0,0,-0.152400><2.261434,0.035000,0.152400> rotate<0,0.000000,0> translate<21.673366,-1.535000,33.832800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.696228,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,26.822400>}
box{<0,0,-0.152400><2.238572,0.035000,0.152400> rotate<0,0.000000,0> translate<21.696228,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.711197,-1.535000,26.858531>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.711197,-1.535000,33.741466>}
box{<0,0,-0.152400><6.882934,0.035000,0.152400> rotate<0,90.000000,0> translate<21.711197,-1.535000,33.741466> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.711197,-1.535000,27.127200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,27.127200>}
box{<0,0,-0.152400><2.223603,0.035000,0.152400> rotate<0,0.000000,0> translate<21.711197,-1.535000,27.127200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.711197,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,27.432000>}
box{<0,0,-0.152400><2.223603,0.035000,0.152400> rotate<0,0.000000,0> translate<21.711197,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.711197,-1.535000,27.736800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,27.736800>}
box{<0,0,-0.152400><2.223603,0.035000,0.152400> rotate<0,0.000000,0> translate<21.711197,-1.535000,27.736800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.711197,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,28.041600>}
box{<0,0,-0.152400><2.223603,0.035000,0.152400> rotate<0,0.000000,0> translate<21.711197,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.711197,-1.535000,28.346400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,28.346400>}
box{<0,0,-0.152400><2.223603,0.035000,0.152400> rotate<0,0.000000,0> translate<21.711197,-1.535000,28.346400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.711197,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,28.651200>}
box{<0,0,-0.152400><2.223603,0.035000,0.152400> rotate<0,0.000000,0> translate<21.711197,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.711197,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,28.956000>}
box{<0,0,-0.152400><2.223603,0.035000,0.152400> rotate<0,0.000000,0> translate<21.711197,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.711197,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,29.260800>}
box{<0,0,-0.152400><2.223603,0.035000,0.152400> rotate<0,0.000000,0> translate<21.711197,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.711197,-1.535000,29.565600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,29.565600>}
box{<0,0,-0.152400><2.223603,0.035000,0.152400> rotate<0,0.000000,0> translate<21.711197,-1.535000,29.565600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.711197,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,29.870400>}
box{<0,0,-0.152400><2.223603,0.035000,0.152400> rotate<0,0.000000,0> translate<21.711197,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.711197,-1.535000,30.175200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,30.175200>}
box{<0,0,-0.152400><2.223603,0.035000,0.152400> rotate<0,0.000000,0> translate<21.711197,-1.535000,30.175200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.711197,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,30.480000>}
box{<0,0,-0.152400><2.223603,0.035000,0.152400> rotate<0,0.000000,0> translate<21.711197,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.711197,-1.535000,30.784800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,30.784800>}
box{<0,0,-0.152400><2.223603,0.035000,0.152400> rotate<0,0.000000,0> translate<21.711197,-1.535000,30.784800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.711197,-1.535000,31.089600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,31.089600>}
box{<0,0,-0.152400><2.223603,0.035000,0.152400> rotate<0,0.000000,0> translate<21.711197,-1.535000,31.089600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.711197,-1.535000,31.394400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,31.394400>}
box{<0,0,-0.152400><2.223603,0.035000,0.152400> rotate<0,0.000000,0> translate<21.711197,-1.535000,31.394400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.711197,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,31.699200>}
box{<0,0,-0.152400><2.223603,0.035000,0.152400> rotate<0,0.000000,0> translate<21.711197,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.711197,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,32.004000>}
box{<0,0,-0.152400><2.223603,0.035000,0.152400> rotate<0,0.000000,0> translate<21.711197,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.711197,-1.535000,32.308800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,32.308800>}
box{<0,0,-0.152400><2.223603,0.035000,0.152400> rotate<0,0.000000,0> translate<21.711197,-1.535000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.711197,-1.535000,32.613600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,32.613600>}
box{<0,0,-0.152400><2.223603,0.035000,0.152400> rotate<0,0.000000,0> translate<21.711197,-1.535000,32.613600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.711197,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,32.918400>}
box{<0,0,-0.152400><2.223603,0.035000,0.152400> rotate<0,0.000000,0> translate<21.711197,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.711197,-1.535000,33.223200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,33.223200>}
box{<0,0,-0.152400><2.223603,0.035000,0.152400> rotate<0,0.000000,0> translate<21.711197,-1.535000,33.223200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.711197,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,33.528000>}
box{<0,0,-0.152400><2.223603,0.035000,0.152400> rotate<0,0.000000,0> translate<21.711197,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.721594,0.000000,12.433000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.378403,0.000000,12.433000>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,0.000000,0> translate<21.721594,0.000000,12.433000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.865334,-1.535000,1.039681>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.258316,-1.535000,1.432663>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,-44.997030,0> translate<21.865334,-1.535000,1.039681> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.865334,-1.535000,3.408316>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.258316,-1.535000,3.015334>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,44.997030,0> translate<21.865334,-1.535000,3.408316> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.920850,-1.535000,3.352800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.767147,-1.535000,3.352800>}
box{<0,0,-0.152400><0.846297,0.035000,0.152400> rotate<0,0.000000,0> translate<21.920850,-1.535000,3.352800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.963000,0.000000,1.895594>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.214350,0.000000,1.288781>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,67.495543,0> translate<21.963000,0.000000,1.895594> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.963000,0.000000,2.552403>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.963000,0.000000,1.895594>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,-90.000000,0> translate<21.963000,0.000000,1.895594> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.963000,0.000000,2.552403>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.214350,0.000000,3.159216>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,-67.495543,0> translate<21.963000,0.000000,2.552403> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.044853,-1.535000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.643144,-1.535000,1.219200>}
box{<0,0,-0.152400><0.598291,0.035000,0.152400> rotate<0,0.000000,0> translate<22.044853,-1.535000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.214350,0.000000,1.288781>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.440338,0.000000,1.062797>}
box{<0,0,-0.203200><0.319592,0.035000,0.203200> rotate<0,44.996634,0> translate<22.214350,0.000000,1.288781> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.214350,0.000000,3.159216>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.678781,0.000000,3.623647>}
box{<0,0,-0.203200><0.656805,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.214350,0.000000,3.159216> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.225650,-1.535000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.462347,-1.535000,3.048000>}
box{<0,0,-0.152400><0.236697,0.035000,0.152400> rotate<0,0.000000,0> translate<22.225650,-1.535000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.258316,-1.535000,1.432663>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.344000,-1.535000,1.639522>}
box{<0,0,-0.152400><0.223903,0.035000,0.152400> rotate<0,-67.495447,0> translate<22.258316,-1.535000,1.432663> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.258316,-1.535000,3.015334>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.344000,-1.535000,2.808475>}
box{<0,0,-0.152400><0.223903,0.035000,0.152400> rotate<0,67.495447,0> translate<22.258316,-1.535000,3.015334> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.296147,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.391847,-1.535000,1.524000>}
box{<0,0,-0.152400><0.095700,0.035000,0.152400> rotate<0,0.000000,0> translate<22.296147,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.344000,-1.535000,1.639522>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.429681,-1.535000,1.432663>}
box{<0,0,-0.152400><0.223902,0.035000,0.152400> rotate<0,67.496186,0> translate<22.344000,-1.535000,1.639522> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.344000,-1.535000,2.808475>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.429681,-1.535000,3.015334>}
box{<0,0,-0.152400><0.223902,0.035000,0.152400> rotate<0,-67.496186,0> translate<22.344000,-1.535000,2.808475> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.378403,0.000000,12.433000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.985216,0.000000,12.684350>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,-22.498518,0> translate<22.378403,0.000000,12.433000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.415241,0.000000,8.339200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860994,0.000000,8.523838>}
box{<0,0,-0.203200><0.482480,0.035000,0.203200> rotate<0,-22.498571,0> translate<22.415241,0.000000,8.339200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.415241,0.000000,11.964797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860994,0.000000,11.780159>}
box{<0,0,-0.203200><0.482480,0.035000,0.203200> rotate<0,22.498571,0> translate<22.415241,0.000000,11.964797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.429681,-1.535000,1.432663>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.822662,-1.535000,1.039681>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,44.997030,0> translate<22.429681,-1.535000,1.432663> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.429681,-1.535000,3.015334>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.822662,-1.535000,3.408316>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,-44.997030,0> translate<22.429681,-1.535000,3.015334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.678781,0.000000,3.623647>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.285594,0.000000,3.874997>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,-22.498518,0> translate<22.678781,0.000000,3.623647> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.777712,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.661200,0.000000,12.598400>}
box{<0,0,-0.203200><3.883488,0.035000,0.203200> rotate<0,0.000000,0> translate<22.777712,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.803200,0.000000,4.706322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.926941,0.000000,4.407584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<22.803200,0.000000,4.706322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.803200,0.000000,6.029675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.803200,0.000000,4.706322>}
box{<0,0,-0.203200><1.323353,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.803200,0.000000,4.706322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.803200,0.000000,6.029675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.926941,0.000000,6.328413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<22.803200,0.000000,6.029675> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.822662,-1.535000,1.039681>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.336116,-1.535000,0.827000>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,22.498706,0> translate<22.822662,-1.535000,1.039681> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.822662,-1.535000,3.408316>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.336116,-1.535000,3.620997>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,-22.498706,0> translate<22.822662,-1.535000,3.408316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.828675,0.000000,21.734797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.851997,0.000000,21.725134>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,22.503260,0> translate<22.828675,0.000000,21.734797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.847859,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.195472,0.000000,11.785600>}
box{<0,0,-0.203200><4.347613,0.035000,0.203200> rotate<0,0.000000,0> translate<22.847859,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.851997,0.000000,21.725134>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.875322,0.000000,21.734797>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,-22.500546,0> translate<22.851997,0.000000,21.725134> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860994,0.000000,8.523838>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.202159,0.000000,8.865003>}
box{<0,0,-0.203200><0.482481,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.860994,0.000000,8.523838> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860994,0.000000,11.780159>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.202159,0.000000,11.438994>}
box{<0,0,-0.203200><0.482481,0.035000,0.203200> rotate<0,44.997030,0> translate<22.860994,0.000000,11.780159> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.871556,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,8.534400>}
box{<0,0,-0.203200><6.512444,0.035000,0.203200> rotate<0,0.000000,0> translate<22.871556,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.875322,0.000000,21.734797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.098675,0.000000,21.734797>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,0.000000,0> translate<22.875322,0.000000,21.734797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.926941,0.000000,4.407584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.155584,0.000000,4.178941>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<22.926941,0.000000,4.407584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.926941,0.000000,6.328413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.155584,0.000000,6.557056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.926941,0.000000,6.328413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.985216,0.000000,12.684350>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.449647,0.000000,13.148781>}
box{<0,0,-0.203200><0.656805,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.985216,0.000000,12.684350> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.155584,0.000000,4.178941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.454322,0.000000,4.055200>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<23.155584,0.000000,4.178941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.155584,0.000000,6.557056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.454322,0.000000,6.680797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<23.155584,0.000000,6.557056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.202159,0.000000,8.865003>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.250122,0.000000,8.980800>}
box{<0,0,-0.203200><0.125337,0.035000,0.203200> rotate<0,-67.496447,0> translate<23.202159,0.000000,8.865003> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.202159,0.000000,11.438994>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.210359,0.000000,11.419197>}
box{<0,0,-0.203200><0.021428,0.035000,0.203200> rotate<0,67.495877,0> translate<23.202159,0.000000,11.438994> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.210359,0.000000,11.419197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.160144,0.000000,11.419197>}
box{<0,0,-0.203200><2.949784,0.035000,0.203200> rotate<0,0.000000,0> translate<23.210359,0.000000,11.419197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.233553,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,8.940800>}
box{<0,0,-0.203200><6.150447,0.035000,0.203200> rotate<0,0.000000,0> translate<23.233553,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.250122,0.000000,8.980800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.942513,0.000000,8.980800>}
box{<0,0,-0.203200><3.692391,0.035000,0.203200> rotate<0,0.000000,0> translate<23.250122,0.000000,8.980800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.285594,0.000000,3.874997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.942403,0.000000,3.874997>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,0.000000,0> translate<23.285594,0.000000,3.874997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.305666,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.661200,0.000000,13.004800>}
box{<0,0,-0.203200><3.355534,0.035000,0.203200> rotate<0,0.000000,0> translate<23.305666,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.336116,-1.535000,0.827000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.891881,-1.535000,0.827000>}
box{<0,0,-0.152400><0.555766,0.035000,0.152400> rotate<0,0.000000,0> translate<23.336116,-1.535000,0.827000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.336116,-1.535000,3.620997>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.891881,-1.535000,3.620997>}
box{<0,0,-0.152400><0.555766,0.035000,0.152400> rotate<0,0.000000,0> translate<23.336116,-1.535000,3.620997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.449647,0.000000,13.148781>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.700997,0.000000,13.755594>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,-67.495543,0> translate<23.449647,0.000000,13.148781> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.454322,0.000000,4.055200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.877675,0.000000,4.055200>}
box{<0,0,-0.203200><1.423353,0.035000,0.203200> rotate<0,0.000000,0> translate<23.454322,0.000000,4.055200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.454322,0.000000,6.680797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.877675,0.000000,6.680797>}
box{<0,0,-0.203200><1.423353,0.035000,0.203200> rotate<0,0.000000,0> translate<23.454322,0.000000,6.680797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.558344,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.661200,0.000000,13.411200>}
box{<0,0,-0.203200><3.102856,0.035000,0.203200> rotate<0,0.000000,0> translate<23.558344,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.651572,-1.535000,7.238000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.931638,-1.535000,7.354006>}
box{<0,0,-0.152400><0.303141,0.035000,0.152400> rotate<0,-22.498388,0> translate<23.651572,-1.535000,7.238000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.651572,-1.535000,12.761997>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.931638,-1.535000,12.645991>}
box{<0,0,-0.152400><0.303141,0.035000,0.152400> rotate<0,22.498388,0> translate<23.651572,-1.535000,12.761997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.700997,0.000000,13.755594>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.700997,0.000000,14.331281>}
box{<0,0,-0.203200><0.575687,0.035000,0.203200> rotate<0,90.000000,0> translate<23.700997,0.000000,14.331281> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.700997,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.332609,0.000000,13.817600>}
box{<0,0,-0.203200><0.631612,0.035000,0.203200> rotate<0,0.000000,0> translate<23.700997,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.700997,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.762947,0.000000,14.224000>}
box{<0,0,-0.203200><0.061950,0.035000,0.203200> rotate<0,0.000000,0> translate<23.700997,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.700997,0.000000,14.331281>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.733047,0.000000,14.253900>}
box{<0,0,-0.203200><0.083756,0.035000,0.203200> rotate<0,67.497039,0> translate<23.700997,0.000000,14.331281> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.733047,0.000000,14.253900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.053900,0.000000,13.933047>}
box{<0,0,-0.203200><0.453755,0.035000,0.203200> rotate<0,44.997030,0> translate<23.733047,0.000000,14.253900> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.813400,-1.535000,14.723641>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.948375,-1.535000,14.397781>}
box{<0,0,-0.152400><0.352708,0.035000,0.152400> rotate<0,67.495601,0> translate<23.813400,-1.535000,14.723641> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.813400,-1.535000,15.076356>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.813400,-1.535000,14.723641>}
box{<0,0,-0.152400><0.352716,0.035000,0.152400> rotate<0,-90.000000,0> translate<23.813400,-1.535000,14.723641> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.813400,-1.535000,15.076356>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.938000,-1.535000,15.377166>}
box{<0,0,-0.152400><0.325594,0.035000,0.152400> rotate<0,-67.495435,0> translate<23.813400,-1.535000,15.076356> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.813400,-1.535000,17.923641>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.938000,-1.535000,17.622831>}
box{<0,0,-0.152400><0.325594,0.035000,0.152400> rotate<0,67.495435,0> translate<23.813400,-1.535000,17.923641> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.813400,-1.535000,18.276356>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.813400,-1.535000,17.923641>}
box{<0,0,-0.152400><0.352716,0.035000,0.152400> rotate<0,-90.000000,0> translate<23.813400,-1.535000,17.923641> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.813400,-1.535000,18.276356>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.948375,-1.535000,18.602216>}
box{<0,0,-0.152400><0.352708,0.035000,0.152400> rotate<0,-67.495601,0> translate<23.813400,-1.535000,18.276356> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.837950,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,7.315200>}
box{<0,0,-0.152400><9.800050,0.035000,0.152400> rotate<0,0.000000,0> translate<23.837950,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.891881,-1.535000,0.827000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.921216,-1.535000,0.839153>}
box{<0,0,-0.152400><0.031752,0.035000,0.152400> rotate<0,-22.502564,0> translate<23.891881,-1.535000,0.827000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.891881,-1.535000,3.620997>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.405334,-1.535000,3.408316>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,22.498706,0> translate<23.891881,-1.535000,3.620997> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.921216,-1.535000,0.839153>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.951572,-1.535000,0.808797>}
box{<0,0,-0.152400><0.042930,0.035000,0.152400> rotate<0,44.997030,0> translate<23.921216,-1.535000,0.839153> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.931638,-1.535000,7.354006>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.145991,-1.535000,7.568359>}
box{<0,0,-0.152400><0.303141,0.035000,0.152400> rotate<0,-44.997030,0> translate<23.931638,-1.535000,7.354006> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.931638,-1.535000,12.645991>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.145991,-1.535000,12.431638>}
box{<0,0,-0.152400><0.303141,0.035000,0.152400> rotate<0,44.997030,0> translate<23.931638,-1.535000,12.645991> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,21.508006>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.081744,-1.535000,21.153256>}
box{<0,0,-0.152400><0.383979,0.035000,0.152400> rotate<0,67.495340,0> translate<23.934800,-1.535000,21.508006> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,35.491991>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,21.508006>}
box{<0,0,-0.152400><13.983984,0.035000,0.152400> rotate<0,-90.000000,0> translate<23.934800,-1.535000,21.508006> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.934800,-1.535000,35.491991>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.081744,-1.535000,35.846741>}
box{<0,0,-0.152400><0.383979,0.035000,0.152400> rotate<0,-67.495340,0> translate<23.934800,-1.535000,35.491991> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.938000,-1.535000,17.622831>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.938000,-1.535000,15.377166>}
box{<0,0,-0.152400><2.245666,0.035000,0.152400> rotate<0,-90.000000,0> translate<23.938000,-1.535000,15.377166> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.942403,0.000000,3.874997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.549216,0.000000,3.623647>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,22.498518,0> translate<23.942403,0.000000,3.874997> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.948375,-1.535000,14.397781>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.197781,-1.535000,14.148375>}
box{<0,0,-0.152400><0.352714,0.035000,0.152400> rotate<0,44.997030,0> translate<23.948375,-1.535000,14.397781> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.948375,-1.535000,18.602216>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.197781,-1.535000,18.851622>}
box{<0,0,-0.152400><0.352714,0.035000,0.152400> rotate<0,-44.997030,0> translate<23.948375,-1.535000,18.602216> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.053900,0.000000,13.933047>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.473119,0.000000,13.759400>}
box{<0,0,-0.203200><0.453759,0.035000,0.203200> rotate<0,22.498606,0> translate<24.053900,0.000000,13.933047> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.080828,-1.535000,12.496800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,12.496800>}
box{<0,0,-0.152400><1.653972,0.035000,0.152400> rotate<0,0.000000,0> translate<24.080828,-1.535000,12.496800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.081744,-1.535000,21.153256>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,19.500200>}
box{<0,0,-0.152400><2.337775,0.035000,0.152400> rotate<0,44.997030,0> translate<24.081744,-1.535000,21.153256> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.081744,-1.535000,35.846741>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.353256,-1.535000,36.118253>}
box{<0,0,-0.152400><0.383977,0.035000,0.152400> rotate<0,-44.997030,0> translate<24.081744,-1.535000,35.846741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.098675,0.000000,21.734797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.397413,0.000000,21.611056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<24.098675,0.000000,21.734797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.145991,-1.535000,7.568359>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.261997,-1.535000,7.848425>}
box{<0,0,-0.152400><0.303141,0.035000,0.152400> rotate<0,-67.495673,0> translate<24.145991,-1.535000,7.568359> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.145991,-1.535000,12.431638>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.261997,-1.535000,12.151572>}
box{<0,0,-0.152400><0.303141,0.035000,0.152400> rotate<0,67.495673,0> translate<24.145991,-1.535000,12.431638> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.167378,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,7.620000>}
box{<0,0,-0.152400><9.470622,0.035000,0.152400> rotate<0,0.000000,0> translate<24.167378,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.197781,-1.535000,14.148375>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.523641,-1.535000,14.013400>}
box{<0,0,-0.152400><0.352708,0.035000,0.152400> rotate<0,22.498459,0> translate<24.197781,-1.535000,14.148375> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.197781,-1.535000,18.851622>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.523641,-1.535000,18.986597>}
box{<0,0,-0.152400><0.352708,0.035000,0.152400> rotate<0,-22.498459,0> translate<24.197781,-1.535000,18.851622> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.245253,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,12.192000>}
box{<0,0,-0.152400><1.489547,0.035000,0.152400> rotate<0,0.000000,0> translate<24.245253,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.261997,-1.535000,7.848425>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.261997,-1.535000,12.151572>}
box{<0,0,-0.152400><4.303147,0.035000,0.152400> rotate<0,90.000000,0> translate<24.261997,-1.535000,12.151572> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.261997,-1.535000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,7.924800>}
box{<0,0,-0.152400><9.376003,0.035000,0.152400> rotate<0,0.000000,0> translate<24.261997,-1.535000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.261997,-1.535000,8.229600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,8.229600>}
box{<0,0,-0.152400><9.376003,0.035000,0.152400> rotate<0,0.000000,0> translate<24.261997,-1.535000,8.229600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.261997,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,8.534400>}
box{<0,0,-0.152400><9.376003,0.035000,0.152400> rotate<0,0.000000,0> translate<24.261997,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.261997,-1.535000,8.839200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,8.839200>}
box{<0,0,-0.152400><9.376003,0.035000,0.152400> rotate<0,0.000000,0> translate<24.261997,-1.535000,8.839200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.261997,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,9.144000>}
box{<0,0,-0.152400><9.376003,0.035000,0.152400> rotate<0,0.000000,0> translate<24.261997,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.261997,-1.535000,9.448800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.176863,-1.535000,9.448800>}
box{<0,0,-0.152400><1.914866,0.035000,0.152400> rotate<0,0.000000,0> translate<24.261997,-1.535000,9.448800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.261997,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.858434,-1.535000,9.753600>}
box{<0,0,-0.152400><1.596438,0.035000,0.152400> rotate<0,0.000000,0> translate<24.261997,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.261997,-1.535000,10.058400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.732184,-1.535000,10.058400>}
box{<0,0,-0.152400><1.470188,0.035000,0.152400> rotate<0,0.000000,0> translate<24.261997,-1.535000,10.058400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.261997,-1.535000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.713400,-1.535000,10.363200>}
box{<0,0,-0.152400><1.451403,0.035000,0.152400> rotate<0,0.000000,0> translate<24.261997,-1.535000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.261997,-1.535000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,10.668000>}
box{<0,0,-0.152400><1.472803,0.035000,0.152400> rotate<0,0.000000,0> translate<24.261997,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.261997,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,10.972800>}
box{<0,0,-0.152400><1.472803,0.035000,0.152400> rotate<0,0.000000,0> translate<24.261997,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.261997,-1.535000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,11.277600>}
box{<0,0,-0.152400><1.472803,0.035000,0.152400> rotate<0,0.000000,0> translate<24.261997,-1.535000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.261997,-1.535000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,11.582400>}
box{<0,0,-0.152400><1.472803,0.035000,0.152400> rotate<0,0.000000,0> translate<24.261997,-1.535000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.261997,-1.535000,11.887200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,11.887200>}
box{<0,0,-0.152400><1.472803,0.035000,0.152400> rotate<0,0.000000,0> translate<24.261997,-1.535000,11.887200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.353256,-1.535000,36.118253>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.653256,-1.535000,36.418253>}
box{<0,0,-0.152400><0.424264,0.035000,0.152400> rotate<0,-44.997030,0> translate<24.353256,-1.535000,36.118253> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.397413,0.000000,21.611056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.626056,0.000000,21.382413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<24.397413,0.000000,21.611056> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.405334,-1.535000,3.408316>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.798316,-1.535000,3.015334>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,44.997030,0> translate<24.405334,-1.535000,3.408316> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.460850,-1.535000,3.352800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.307147,-1.535000,3.352800>}
box{<0,0,-0.152400><0.846297,0.035000,0.152400> rotate<0,0.000000,0> translate<24.460850,-1.535000,3.352800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.467247,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.300753,0.000000,3.657600>}
box{<0,0,-0.203200><0.833506,0.035000,0.203200> rotate<0,0.000000,0> translate<24.467247,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.469269,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,21.539200>}
box{<0,0,-0.203200><0.739931,0.035000,0.203200> rotate<0,0.000000,0> translate<24.469269,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.473119,0.000000,13.759400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.926878,0.000000,13.759400>}
box{<0,0,-0.203200><0.453759,0.035000,0.203200> rotate<0,0.000000,0> translate<24.473119,0.000000,13.759400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.523641,-1.535000,14.013400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.876356,-1.535000,14.013400>}
box{<0,0,-0.152400><0.352716,0.035000,0.152400> rotate<0,0.000000,0> translate<24.523641,-1.535000,14.013400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.523641,-1.535000,18.986597>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.876356,-1.535000,18.986597>}
box{<0,0,-0.152400><0.352716,0.035000,0.152400> rotate<0,0.000000,0> translate<24.523641,-1.535000,18.986597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.549216,0.000000,3.623647>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.884000,0.000000,3.288863>}
box{<0,0,-0.203200><0.473457,0.035000,0.203200> rotate<0,44.997030,0> translate<24.549216,0.000000,3.623647> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.626056,0.000000,21.382413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.749797,0.000000,21.083675>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<24.626056,0.000000,21.382413> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.653256,-1.535000,36.418253>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.008006,-1.535000,36.565197>}
box{<0,0,-0.152400><0.383979,0.035000,0.152400> rotate<0,-22.498720,0> translate<24.653256,-1.535000,36.418253> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.729450,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,21.132800>}
box{<0,0,-0.203200><0.479750,0.035000,0.203200> rotate<0,0.000000,0> translate<24.729450,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.749797,0.000000,20.971975>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.749797,0.000000,21.083675>}
box{<0,0,-0.203200><0.111700,0.035000,0.203200> rotate<0,90.000000,0> translate<24.749797,0.000000,21.083675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.749797,0.000000,20.971975>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.775516,0.000000,20.961322>}
box{<0,0,-0.203200><0.027838,0.035000,0.203200> rotate<0,22.498648,0> translate<24.749797,0.000000,20.971975> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.765650,-1.535000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.002347,-1.535000,3.048000>}
box{<0,0,-0.152400><0.236697,0.035000,0.152400> rotate<0,0.000000,0> translate<24.765650,-1.535000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.775516,0.000000,20.961322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.061322,0.000000,20.675516>}
box{<0,0,-0.203200><0.404191,0.035000,0.203200> rotate<0,44.997030,0> translate<24.775516,0.000000,20.961322> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.798316,-1.535000,3.015334>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.884000,-1.535000,2.808475>}
box{<0,0,-0.152400><0.223903,0.035000,0.152400> rotate<0,67.495447,0> translate<24.798316,-1.535000,3.015334> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.876356,-1.535000,14.013400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.202216,-1.535000,14.148375>}
box{<0,0,-0.152400><0.352708,0.035000,0.152400> rotate<0,-22.498459,0> translate<24.876356,-1.535000,14.013400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.876356,-1.535000,18.986597>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.202216,-1.535000,18.851622>}
box{<0,0,-0.152400><0.352708,0.035000,0.152400> rotate<0,22.498459,0> translate<24.876356,-1.535000,18.986597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.877675,0.000000,4.055200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.176413,0.000000,4.178941>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<24.877675,0.000000,4.055200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.877675,0.000000,6.680797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.176413,0.000000,6.557056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<24.877675,0.000000,6.680797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.884000,-1.535000,2.808475>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.969681,-1.535000,3.015334>}
box{<0,0,-0.152400><0.223902,0.035000,0.152400> rotate<0,-67.496186,0> translate<24.884000,-1.535000,2.808475> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.884000,0.000000,3.288863>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218781,0.000000,3.623647>}
box{<0,0,-0.203200><0.473454,0.035000,0.203200> rotate<0,-44.997298,0> translate<24.884000,0.000000,3.288863> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.894219,-1.535000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,14.020800>}
box{<0,0,-0.152400><0.840581,0.035000,0.152400> rotate<0,0.000000,0> translate<24.894219,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.898919,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,4.064000>}
box{<0,0,-0.203200><4.485081,0.035000,0.203200> rotate<0,0.000000,0> translate<24.898919,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.926878,0.000000,13.759400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.227688,0.000000,13.884000>}
box{<0,0,-0.203200><0.325594,0.035000,0.203200> rotate<0,-22.498625,0> translate<24.926878,0.000000,13.759400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.969681,-1.535000,3.015334>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.362663,-1.535000,3.408316>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,-44.997030,0> translate<24.969681,-1.535000,3.015334> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.008006,-1.535000,36.565197>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.891991,-1.535000,36.565197>}
box{<0,0,-0.152400><5.883984,0.035000,0.152400> rotate<0,0.000000,0> translate<25.008006,-1.535000,36.565197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.010438,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.358125,0.000000,20.726400>}
box{<0,0,-0.203200><0.347687,0.035000,0.203200> rotate<0,0.000000,0> translate<25.010438,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.061322,0.000000,20.675516>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.561322,0.000000,20.175516>}
box{<0,0,-0.203200><0.707107,0.035000,0.203200> rotate<0,44.997030,0> translate<25.061322,0.000000,20.675516> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.067384,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.663656,0.000000,13.817600>}
box{<0,0,-0.203200><1.596272,0.035000,0.203200> rotate<0,0.000000,0> translate<25.067384,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.091216,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,18.897600>}
box{<0,0,-0.152400><0.643584,0.035000,0.152400> rotate<0,0.000000,0> translate<25.091216,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.176413,0.000000,4.178941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.405056,0.000000,4.407584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.176413,0.000000,4.178941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.176413,0.000000,6.557056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.405056,0.000000,6.328413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<25.176413,0.000000,6.557056> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.202216,-1.535000,14.148375>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.451622,-1.535000,14.397781>}
box{<0,0,-0.152400><0.352714,0.035000,0.152400> rotate<0,-44.997030,0> translate<25.202216,-1.535000,14.148375> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.202216,-1.535000,18.851622>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.451622,-1.535000,18.602216>}
box{<0,0,-0.152400><0.352714,0.035000,0.152400> rotate<0,44.997030,0> translate<25.202216,-1.535000,18.851622> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,21.050322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.332941,0.000000,20.751584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<25.209200,0.000000,21.050322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,22.273675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,21.050322>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.209200,0.000000,21.050322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,22.273675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218863,0.000000,22.296997>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,-67.490800,0> translate<25.209200,0.000000,22.273675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,22.320322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218863,0.000000,22.296997>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,67.493514,0> translate<25.209200,0.000000,22.320322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,23.543675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,22.320322>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.209200,0.000000,22.320322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,23.543675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218863,0.000000,23.566997>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,-67.490800,0> translate<25.209200,0.000000,23.543675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,23.590322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218863,0.000000,23.566997>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,67.493514,0> translate<25.209200,0.000000,23.590322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,24.813675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,23.590322>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.209200,0.000000,23.590322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,24.813675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218863,0.000000,24.836997>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,-67.490800,0> translate<25.209200,0.000000,24.813675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,24.860322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218863,0.000000,24.836997>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,67.493514,0> translate<25.209200,0.000000,24.860322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,26.083675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,24.860322>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.209200,0.000000,24.860322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,26.083675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218863,0.000000,26.106997>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,-67.490800,0> translate<25.209200,0.000000,26.083675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,26.130322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218863,0.000000,26.106997>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,67.493514,0> translate<25.209200,0.000000,26.130322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,27.353675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,26.130322>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.209200,0.000000,26.130322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,27.353675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218863,0.000000,27.376997>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,-67.490800,0> translate<25.209200,0.000000,27.353675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,27.400322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218863,0.000000,27.376997>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,67.493514,0> translate<25.209200,0.000000,27.400322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,28.623675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,27.400322>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.209200,0.000000,27.400322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,28.623675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218863,0.000000,28.646997>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,-67.490800,0> translate<25.209200,0.000000,28.623675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,28.670322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218863,0.000000,28.646997>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,67.493514,0> translate<25.209200,0.000000,28.670322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,29.893675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,28.670322>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.209200,0.000000,28.670322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,29.893675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218863,0.000000,29.916997>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,-67.490800,0> translate<25.209200,0.000000,29.893675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,29.940322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218863,0.000000,29.916997>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,67.493514,0> translate<25.209200,0.000000,29.940322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,31.163675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,29.940322>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.209200,0.000000,29.940322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,31.163675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218863,0.000000,31.186997>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,-67.490800,0> translate<25.209200,0.000000,31.163675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,31.210322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218863,0.000000,31.186997>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,67.493514,0> translate<25.209200,0.000000,31.210322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,32.433675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,31.210322>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.209200,0.000000,31.210322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,32.433675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218863,0.000000,32.456997>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,-67.490800,0> translate<25.209200,0.000000,32.433675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,32.480322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218863,0.000000,32.456997>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,67.493514,0> translate<25.209200,0.000000,32.480322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,33.703675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,32.480322>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.209200,0.000000,32.480322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,33.703675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218863,0.000000,33.726997>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,-67.490800,0> translate<25.209200,0.000000,33.703675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,33.750322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218863,0.000000,33.726997>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,67.493514,0> translate<25.209200,0.000000,33.750322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,34.973675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,33.750322>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.209200,0.000000,33.750322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,34.973675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218863,0.000000,34.996997>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,-67.490800,0> translate<25.209200,0.000000,34.973675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,35.020322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218863,0.000000,34.996997>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,67.493514,0> translate<25.209200,0.000000,35.020322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,36.243675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,35.020322>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.209200,0.000000,35.020322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,36.243675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218863,0.000000,36.266997>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,-67.490800,0> translate<25.209200,0.000000,36.243675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,36.290322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218863,0.000000,36.266997>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,67.493514,0> translate<25.209200,0.000000,36.290322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,37.513675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,36.290322>}
box{<0,0,-0.203200><1.223353,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.209200,0.000000,36.290322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.209200,0.000000,37.513675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.332941,0.000000,37.812413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<25.209200,0.000000,37.513675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218781,0.000000,3.623647>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.825594,0.000000,3.874997>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,-22.498518,0> translate<25.218781,0.000000,3.623647> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.227688,0.000000,13.884000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.691159,0.000000,13.884000>}
box{<0,0,-0.203200><1.463472,0.035000,0.203200> rotate<0,0.000000,0> translate<25.227688,0.000000,13.884000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.231069,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,6.502400>}
box{<0,0,-0.203200><4.152931,0.035000,0.203200> rotate<0,0.000000,0> translate<25.231069,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.332941,0.000000,20.751584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.561584,0.000000,20.522941>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<25.332941,0.000000,20.751584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.332941,0.000000,37.812413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.561584,0.000000,38.041056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.332941,0.000000,37.812413> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.362663,-1.535000,3.408316>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.876116,-1.535000,3.620997>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,-22.498706,0> translate<25.362663,-1.535000,3.408316> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.379441,-1.535000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,14.325600>}
box{<0,0,-0.152400><0.355359,0.035000,0.152400> rotate<0,0.000000,0> translate<25.379441,-1.535000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.405056,0.000000,4.407584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.528797,0.000000,4.706322>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<25.405056,0.000000,4.407584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.405056,0.000000,6.328413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.528797,0.000000,6.029675>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<25.405056,0.000000,6.328413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.416837,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.756000,0.000000,20.320000>}
box{<0,0,-0.203200><0.339163,0.035000,0.203200> rotate<0,0.000000,0> translate<25.416837,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.431075,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,4.470400>}
box{<0,0,-0.203200><3.952925,0.035000,0.203200> rotate<0,0.000000,0> translate<25.431075,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.451622,-1.535000,14.397781>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.586597,-1.535000,14.723641>}
box{<0,0,-0.152400><0.352708,0.035000,0.152400> rotate<0,-67.495601,0> translate<25.451622,-1.535000,14.397781> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.451622,-1.535000,18.602216>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.586597,-1.535000,18.276356>}
box{<0,0,-0.152400><0.352708,0.035000,0.152400> rotate<0,67.495601,0> translate<25.451622,-1.535000,18.602216> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.455525,-1.535000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,18.592800>}
box{<0,0,-0.152400><0.279275,0.035000,0.152400> rotate<0,0.000000,0> translate<25.455525,-1.535000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.461997,-1.535000,15.377166>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.461997,-1.535000,17.622831>}
box{<0,0,-0.152400><2.245666,0.035000,0.152400> rotate<0,90.000000,0> translate<25.461997,-1.535000,17.622831> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.461997,-1.535000,15.377166>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.586597,-1.535000,15.076356>}
box{<0,0,-0.152400><0.325594,0.035000,0.152400> rotate<0,67.495435,0> translate<25.461997,-1.535000,15.377166> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.461997,-1.535000,15.544800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,15.544800>}
box{<0,0,-0.152400><0.272803,0.035000,0.152400> rotate<0,0.000000,0> translate<25.461997,-1.535000,15.544800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.461997,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,15.849600>}
box{<0,0,-0.152400><0.272803,0.035000,0.152400> rotate<0,0.000000,0> translate<25.461997,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.461997,-1.535000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,16.154400>}
box{<0,0,-0.152400><0.272803,0.035000,0.152400> rotate<0,0.000000,0> translate<25.461997,-1.535000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.461997,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,16.459200>}
box{<0,0,-0.152400><0.272803,0.035000,0.152400> rotate<0,0.000000,0> translate<25.461997,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.461997,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,16.764000>}
box{<0,0,-0.152400><0.272803,0.035000,0.152400> rotate<0,0.000000,0> translate<25.461997,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.461997,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,17.068800>}
box{<0,0,-0.152400><0.272803,0.035000,0.152400> rotate<0,0.000000,0> translate<25.461997,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.461997,-1.535000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,17.373600>}
box{<0,0,-0.152400><0.272803,0.035000,0.152400> rotate<0,0.000000,0> translate<25.461997,-1.535000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.461997,-1.535000,17.622831>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.586597,-1.535000,17.923641>}
box{<0,0,-0.152400><0.325594,0.035000,0.152400> rotate<0,-67.495435,0> translate<25.461997,-1.535000,17.622831> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.485012,-1.535000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,17.678400>}
box{<0,0,-0.152400><0.249788,0.035000,0.152400> rotate<0,0.000000,0> translate<25.485012,-1.535000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.501325,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,6.096000>}
box{<0,0,-0.203200><3.882675,0.035000,0.203200> rotate<0,0.000000,0> translate<25.501325,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.518816,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,15.240000>}
box{<0,0,-0.152400><0.215984,0.035000,0.152400> rotate<0,0.000000,0> translate<25.518816,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.528797,0.000000,4.706322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.528797,0.000000,6.029675>}
box{<0,0,-0.203200><1.323353,0.035000,0.203200> rotate<0,90.000000,0> translate<25.528797,0.000000,6.029675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.528797,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,4.876800>}
box{<0,0,-0.203200><3.855203,0.035000,0.203200> rotate<0,0.000000,0> translate<25.528797,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.528797,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,5.283200>}
box{<0,0,-0.203200><3.855203,0.035000,0.203200> rotate<0,0.000000,0> translate<25.528797,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.528797,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,5.689600>}
box{<0,0,-0.203200><3.855203,0.035000,0.203200> rotate<0,0.000000,0> translate<25.528797,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.547975,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,14.630400>}
box{<0,0,-0.152400><0.186825,0.035000,0.152400> rotate<0,0.000000,0> translate<25.547975,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.561322,0.000000,20.175516>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.715997,0.000000,19.802094>}
box{<0,0,-0.203200><0.404188,0.035000,0.203200> rotate<0,67.495729,0> translate<25.561322,0.000000,20.175516> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.561584,0.000000,20.522941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.756000,0.000000,20.442412>}
box{<0,0,-0.203200><0.210433,0.035000,0.203200> rotate<0,22.498147,0> translate<25.561584,0.000000,20.522941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.561584,0.000000,38.041056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.564800,0.000000,38.042388>}
box{<0,0,-0.203200><0.003480,0.035000,0.203200> rotate<0,-22.487786,0> translate<25.561584,0.000000,38.041056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.564800,0.000000,38.150194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.564800,0.000000,38.042388>}
box{<0,0,-0.203200><0.107806,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.564800,0.000000,38.042388> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.564800,0.000000,38.150194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.825069,0.000000,38.150194>}
box{<0,0,-0.203200><0.260269,0.035000,0.203200> rotate<0,0.000000,0> translate<25.564800,0.000000,38.150194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.564800,0.000000,38.193800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.750178,0.000000,38.193800>}
box{<0,0,-0.203200><1.185378,0.035000,0.203200> rotate<0,0.000000,0> translate<25.564800,0.000000,38.193800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.564800,0.000000,38.211000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.564800,0.000000,38.193800>}
box{<0,0,-0.203200><0.017200,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.564800,0.000000,38.193800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.581775,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,18.288000>}
box{<0,0,-0.152400><0.153025,0.035000,0.152400> rotate<0,0.000000,0> translate<25.581775,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.586597,-1.535000,14.723641>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.586597,-1.535000,15.076356>}
box{<0,0,-0.152400><0.352716,0.035000,0.152400> rotate<0,90.000000,0> translate<25.586597,-1.535000,15.076356> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.586597,-1.535000,14.935200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,14.935200>}
box{<0,0,-0.152400><0.148203,0.035000,0.152400> rotate<0,0.000000,0> translate<25.586597,-1.535000,14.935200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.586597,-1.535000,17.923641>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.586597,-1.535000,18.276356>}
box{<0,0,-0.152400><0.352716,0.035000,0.152400> rotate<0,90.000000,0> translate<25.586597,-1.535000,18.276356> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.586597,-1.535000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,17.983200>}
box{<0,0,-0.152400><0.148203,0.035000,0.152400> rotate<0,0.000000,0> translate<25.586597,-1.535000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.669813,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.756000,0.000000,19.913600>}
box{<0,0,-0.203200><0.086187,0.035000,0.203200> rotate<0,0.000000,0> translate<25.669813,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.713400,-1.535000,10.103750>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.863600,-1.535000,9.741134>}
box{<0,0,-0.152400><0.392492,0.035000,0.152400> rotate<0,67.495587,0> translate<25.713400,-1.535000,10.103750> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.713400,-1.535000,10.496247>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.713400,-1.535000,10.103750>}
box{<0,0,-0.152400><0.392497,0.035000,0.152400> rotate<0,-90.000000,0> translate<25.713400,-1.535000,10.103750> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.713400,-1.535000,10.496247>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,10.547909>}
box{<0,0,-0.152400><0.055919,0.035000,0.152400> rotate<0,-67.494890,0> translate<25.713400,-1.535000,10.496247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.715997,0.000000,18.627688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.715997,0.000000,19.802094>}
box{<0,0,-0.203200><1.174406,0.035000,0.203200> rotate<0,90.000000,0> translate<25.715997,0.000000,19.802094> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.715997,0.000000,18.627688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.840597,0.000000,18.326878>}
box{<0,0,-0.203200><0.325594,0.035000,0.203200> rotate<0,67.495435,0> translate<25.715997,0.000000,18.627688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.715997,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.851891,0.000000,18.694400>}
box{<0,0,-0.203200><0.135894,0.035000,0.203200> rotate<0,0.000000,0> translate<25.715997,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.715997,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.756000,0.000000,19.100800>}
box{<0,0,-0.203200><0.040003,0.035000,0.203200> rotate<0,0.000000,0> translate<25.715997,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.715997,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.756000,0.000000,19.507200>}
box{<0,0,-0.203200><0.040003,0.035000,0.203200> rotate<0,0.000000,0> translate<25.715997,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,19.500200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.734800,-1.535000,10.547909>}
box{<0,0,-0.152400><8.952291,0.035000,0.152400> rotate<0,-90.000000,0> translate<25.734800,-1.535000,10.547909> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.756000,0.000000,18.925903>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.910675,0.000000,18.552481>}
box{<0,0,-0.203200><0.404188,0.035000,0.203200> rotate<0,67.495729,0> translate<25.756000,0.000000,18.925903> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.756000,0.000000,20.442412>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.756000,0.000000,18.925903>}
box{<0,0,-0.203200><1.516509,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.756000,0.000000,18.925903> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.825069,0.000000,38.150194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.860322,0.000000,38.164797>}
box{<0,0,-0.203200><0.038158,0.035000,0.203200> rotate<0,-22.499628,0> translate<25.825069,0.000000,38.150194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.825594,0.000000,3.874997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.482403,0.000000,3.874997>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,0.000000,0> translate<25.825594,0.000000,3.874997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.840597,0.000000,18.026797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.840597,0.000000,18.326878>}
box{<0,0,-0.203200><0.300081,0.035000,0.203200> rotate<0,90.000000,0> translate<25.840597,0.000000,18.326878> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.840597,0.000000,18.026797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.436363,0.000000,18.026797>}
box{<0,0,-0.203200><0.595766,0.035000,0.203200> rotate<0,0.000000,0> translate<25.840597,0.000000,18.026797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.840597,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.175156,0.000000,18.288000>}
box{<0,0,-0.203200><0.334559,0.035000,0.203200> rotate<0,0.000000,0> translate<25.840597,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.860322,0.000000,38.164797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.750178,0.000000,38.164797>}
box{<0,0,-0.203200><0.889856,0.035000,0.203200> rotate<0,0.000000,0> translate<25.860322,0.000000,38.164797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.863600,-1.535000,9.741134>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.141134,-1.535000,9.463600>}
box{<0,0,-0.152400><0.392493,0.035000,0.152400> rotate<0,44.997030,0> translate<25.863600,-1.535000,9.741134> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.876116,-1.535000,3.620997>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.431881,-1.535000,3.620997>}
box{<0,0,-0.152400><0.555766,0.035000,0.152400> rotate<0,0.000000,0> translate<25.876116,-1.535000,3.620997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.910675,0.000000,18.552481>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.436363,0.000000,18.026797>}
box{<0,0,-0.203200><0.743432,0.035000,0.203200> rotate<0,44.996860,0> translate<25.910675,0.000000,18.552481> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.913400,-1.535000,38.003750>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.063600,-1.535000,37.641134>}
box{<0,0,-0.152400><0.392492,0.035000,0.152400> rotate<0,67.495587,0> translate<25.913400,-1.535000,38.003750> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.913400,-1.535000,38.396247>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.913400,-1.535000,38.003750>}
box{<0,0,-0.152400><0.392497,0.035000,0.152400> rotate<0,-90.000000,0> translate<25.913400,-1.535000,38.003750> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.913400,-1.535000,38.396247>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.941881,-1.535000,38.465000>}
box{<0,0,-0.152400><0.074419,0.035000,0.152400> rotate<0,-67.493573,0> translate<25.913400,-1.535000,38.396247> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.063600,-1.535000,37.641134>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.341134,-1.535000,37.363600>}
box{<0,0,-0.152400><0.392493,0.035000,0.152400> rotate<0,44.997030,0> translate<26.063600,-1.535000,37.641134> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.141134,-1.535000,9.463600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.503750,-1.535000,9.313400>}
box{<0,0,-0.152400><0.392492,0.035000,0.152400> rotate<0,22.498473,0> translate<26.141134,-1.535000,9.463600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.160144,0.000000,11.419197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.453228,0.000000,11.540597>}
box{<0,0,-0.203200><0.317232,0.035000,0.203200> rotate<0,-22.498595,0> translate<26.160144,0.000000,11.419197> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.341134,-1.535000,37.363600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.703750,-1.535000,37.213400>}
box{<0,0,-0.152400><0.392492,0.035000,0.152400> rotate<0,22.498473,0> translate<26.341134,-1.535000,37.363600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.431881,-1.535000,3.620997>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.945334,-1.535000,3.408316>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,22.498706,0> translate<26.431881,-1.535000,3.620997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.453228,0.000000,11.540597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.946769,0.000000,11.540597>}
box{<0,0,-0.203200><0.493541,0.035000,0.203200> rotate<0,0.000000,0> translate<26.453228,0.000000,11.540597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.482403,0.000000,3.874997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.089216,0.000000,3.623647>}
box{<0,0,-0.203200><0.656809,0.035000,0.203200> rotate<0,22.498518,0> translate<26.482403,0.000000,3.874997> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.503750,-1.535000,9.313400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.896247,-1.535000,9.313400>}
box{<0,0,-0.152400><0.392497,0.035000,0.152400> rotate<0,0.000000,0> translate<26.503750,-1.535000,9.313400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.661200,0.000000,12.388322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.784941,0.000000,12.089584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<26.661200,0.000000,12.388322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.661200,0.000000,13.811675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.661200,0.000000,12.388322>}
box{<0,0,-0.203200><1.423353,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.661200,0.000000,12.388322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.661200,0.000000,13.811675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.691159,0.000000,13.884000>}
box{<0,0,-0.203200><0.078285,0.035000,0.203200> rotate<0,-67.494613,0> translate<26.661200,0.000000,13.811675> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.703750,-1.535000,37.213400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.096247,-1.535000,37.213400>}
box{<0,0,-0.152400><0.392497,0.035000,0.152400> rotate<0,0.000000,0> translate<26.703750,-1.535000,37.213400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.750178,0.000000,38.193800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.750178,0.000000,38.164797>}
box{<0,0,-0.203200><0.029003,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.750178,0.000000,38.164797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.784941,0.000000,12.089584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.013584,0.000000,11.860941>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<26.784941,0.000000,12.089584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.793819,0.000000,38.164797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.793819,0.000000,38.193800>}
box{<0,0,-0.203200><0.029003,0.035000,0.203200> rotate<0,90.000000,0> translate<26.793819,0.000000,38.193800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.793819,0.000000,38.164797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.683675,0.000000,38.164797>}
box{<0,0,-0.203200><0.889856,0.035000,0.203200> rotate<0,0.000000,0> translate<26.793819,0.000000,38.164797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.793819,0.000000,38.193800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.979197,0.000000,38.193800>}
box{<0,0,-0.203200><1.185378,0.035000,0.203200> rotate<0,0.000000,0> translate<26.793819,0.000000,38.193800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.896247,-1.535000,9.313400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.258863,-1.535000,9.463600>}
box{<0,0,-0.152400><0.392492,0.035000,0.152400> rotate<0,-22.498473,0> translate<26.896247,-1.535000,9.313400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.942513,0.000000,8.980800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.390619,0.000000,9.166412>}
box{<0,0,-0.203200><0.485027,0.035000,0.203200> rotate<0,-22.498604,0> translate<26.942513,0.000000,8.980800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.945334,-1.535000,3.408316>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.338316,-1.535000,3.015334>}
box{<0,0,-0.152400><0.555759,0.035000,0.152400> rotate<0,44.997030,0> translate<26.945334,-1.535000,3.408316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.946769,0.000000,11.540597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.402741,0.000000,11.351728>}
box{<0,0,-0.203200><0.493540,0.035000,0.203200> rotate<0,22.498409,0> translate<26.946769,0.000000,11.540597> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.000850,-1.535000,3.352800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,3.352800>}
box{<0,0,-0.152400><6.637150,0.035000,0.152400> rotate<0,0.000000,0> translate<27.000850,-1.535000,3.352800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.007247,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,3.657600>}
box{<0,0,-0.203200><2.376753,0.035000,0.203200> rotate<0,0.000000,0> translate<27.007247,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.013584,0.000000,11.860941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.312322,0.000000,11.737200>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<27.013584,0.000000,11.860941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.089216,0.000000,3.623647>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.446144,0.000000,3.266719>}
box{<0,0,-0.203200><0.504773,0.035000,0.203200> rotate<0,44.997030,0> translate<27.089216,0.000000,3.623647> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.096247,-1.535000,37.213400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.458863,-1.535000,37.363600>}
box{<0,0,-0.152400><0.392492,0.035000,0.152400> rotate<0,-22.498473,0> translate<27.096247,-1.535000,37.213400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.223131,-1.535000,9.448800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,9.448800>}
box{<0,0,-0.152400><6.414869,0.035000,0.152400> rotate<0,0.000000,0> translate<27.223131,-1.535000,9.448800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.258863,-1.535000,9.463600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.536397,-1.535000,9.741134>}
box{<0,0,-0.152400><0.392493,0.035000,0.152400> rotate<0,-44.997030,0> translate<27.258863,-1.535000,9.463600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.305650,-1.535000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,3.048000>}
box{<0,0,-0.152400><6.332350,0.035000,0.152400> rotate<0,0.000000,0> translate<27.305650,-1.535000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.312322,0.000000,11.737200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.635675,0.000000,11.737200>}
box{<0,0,-0.203200><1.323353,0.035000,0.203200> rotate<0,0.000000,0> translate<27.312322,0.000000,11.737200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.336419,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,11.379200>}
box{<0,0,-0.203200><2.047581,0.035000,0.203200> rotate<0,0.000000,0> translate<27.336419,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.338316,-1.535000,3.015334>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.550997,-1.535000,2.501881>}
box{<0,0,-0.152400><0.555758,0.035000,0.152400> rotate<0,67.495355,0> translate<27.338316,-1.535000,3.015334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.390619,0.000000,9.166412>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.733584,0.000000,9.509378>}
box{<0,0,-0.203200><0.485027,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.390619,0.000000,9.166412> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.402741,0.000000,11.351728>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.751728,0.000000,11.002741>}
box{<0,0,-0.203200><0.493543,0.035000,0.203200> rotate<0,44.997030,0> translate<27.402741,0.000000,11.351728> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.433309,-1.535000,1.661997>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.550997,-1.535000,1.946116>}
box{<0,0,-0.152400><0.307529,0.035000,0.152400> rotate<0,-67.495259,0> translate<27.433309,-1.535000,1.661997> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.433309,-1.535000,1.661997>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.284366,-1.535000,1.661997>}
box{<0,0,-0.152400><5.851056,0.035000,0.152400> rotate<0,0.000000,0> translate<27.433309,-1.535000,1.661997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.446144,0.000000,3.266719>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.509272,0.000000,3.329850>}
box{<0,0,-0.203200><0.089279,0.035000,0.203200> rotate<0,-44.998448,0> translate<27.446144,0.000000,3.266719> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.451041,-1.535000,2.743200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,2.743200>}
box{<0,0,-0.152400><6.186959,0.035000,0.152400> rotate<0,0.000000,0> translate<27.451041,-1.535000,2.743200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.458863,-1.535000,37.363600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.533263,-1.535000,37.438000>}
box{<0,0,-0.152400><0.105217,0.035000,0.152400> rotate<0,-44.997030,0> translate<27.458863,-1.535000,37.363600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.502400,-1.535000,1.828800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.451169,-1.535000,1.828800>}
box{<0,0,-0.152400><5.948769,0.035000,0.152400> rotate<0,0.000000,0> translate<27.502400,-1.535000,1.828800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.509272,0.000000,3.329850>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.613525,0.000000,3.390041>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,-29.998043,0> translate<27.509272,0.000000,3.329850> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.533263,-1.535000,37.438000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.268000,-1.535000,37.438000>}
box{<0,0,-0.152400><4.734737,0.035000,0.152400> rotate<0,0.000000,0> translate<27.533263,-1.535000,37.438000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.536397,-1.535000,9.741134>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.686597,-1.535000,10.103750>}
box{<0,0,-0.152400><0.392492,0.035000,0.152400> rotate<0,-67.495587,0> translate<27.536397,-1.535000,9.741134> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.541559,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,9.753600>}
box{<0,0,-0.152400><6.096441,0.035000,0.152400> rotate<0,0.000000,0> translate<27.541559,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.550997,-1.535000,1.946116>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.550997,-1.535000,2.501881>}
box{<0,0,-0.152400><0.555766,0.035000,0.152400> rotate<0,90.000000,0> translate<27.550997,-1.535000,2.501881> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.550997,-1.535000,2.133600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,2.133600>}
box{<0,0,-0.152400><6.087003,0.035000,0.152400> rotate<0,0.000000,0> translate<27.550997,-1.535000,2.133600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.550997,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,2.438400>}
box{<0,0,-0.152400><6.087003,0.035000,0.152400> rotate<0,0.000000,0> translate<27.550997,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.571406,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,9.347200>}
box{<0,0,-0.203200><1.812594,0.035000,0.203200> rotate<0,0.000000,0> translate<27.571406,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.613525,0.000000,3.390041>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.729806,0.000000,3.421197>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,-14.998451,0> translate<27.613525,0.000000,3.390041> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,10.547909>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,19.283884>}
box{<0,0,-0.152400><8.735975,0.035000,0.152400> rotate<0,90.000000,0> translate<27.665197,-1.535000,19.283884> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,10.547909>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.686597,-1.535000,10.496247>}
box{<0,0,-0.152400><0.055919,0.035000,0.152400> rotate<0,67.494890,0> translate<27.665197,-1.535000,10.547909> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,10.668000>}
box{<0,0,-0.152400><5.972803,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,10.972800>}
box{<0,0,-0.152400><5.972803,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,11.277600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,11.277600>}
box{<0,0,-0.152400><5.972803,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,11.277600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,11.582400>}
box{<0,0,-0.152400><5.972803,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,11.887200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.535166,-1.535000,11.887200>}
box{<0,0,-0.152400><5.869969,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,11.887200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.230366,-1.535000,12.192000>}
box{<0,0,-0.152400><5.565169,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,12.496800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.925566,-1.535000,12.496800>}
box{<0,0,-0.152400><5.260369,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,12.496800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.620766,-1.535000,12.801600>}
box{<0,0,-0.152400><4.955569,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,13.106400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.315966,-1.535000,13.106400>}
box{<0,0,-0.152400><4.650769,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,13.106400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.011166,-1.535000,13.411200>}
box{<0,0,-0.152400><4.345969,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.706366,-1.535000,13.716000>}
box{<0,0,-0.152400><4.041169,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.401566,-1.535000,14.020800>}
box{<0,0,-0.152400><3.736369,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.096766,-1.535000,14.325600>}
box{<0,0,-0.152400><3.431569,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.791966,-1.535000,14.630400>}
box{<0,0,-0.152400><3.126769,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,14.935200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.487166,-1.535000,14.935200>}
box{<0,0,-0.152400><2.821969,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,14.935200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.182366,-1.535000,15.240000>}
box{<0,0,-0.152400><2.517169,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,15.544800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.980922,-1.535000,15.544800>}
box{<0,0,-0.152400><2.315725,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,15.544800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.938000,-1.535000,15.849600>}
box{<0,0,-0.152400><2.272803,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,16.154400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.938000,-1.535000,16.154400>}
box{<0,0,-0.152400><2.272803,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,16.154400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.938000,-1.535000,16.459200>}
box{<0,0,-0.152400><2.272803,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.938000,-1.535000,16.764000>}
box{<0,0,-0.152400><2.272803,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.938000,-1.535000,17.068800>}
box{<0,0,-0.152400><2.272803,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,17.373600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.938000,-1.535000,17.373600>}
box{<0,0,-0.152400><2.272803,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,17.373600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.938000,-1.535000,17.678400>}
box{<0,0,-0.152400><2.272803,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,17.983200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.938000,-1.535000,17.983200>}
box{<0,0,-0.152400><2.272803,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,17.983200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.938000,-1.535000,18.288000>}
box{<0,0,-0.152400><2.272803,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.356278,-1.535000,18.592800>}
box{<0,0,-0.152400><0.691081,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.051478,-1.535000,18.897600>}
box{<0,0,-0.152400><0.386281,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.746678,-1.535000,19.202400>}
box{<0,0,-0.152400><0.081481,0.035000,0.152400> rotate<0,0.000000,0> translate<27.665197,-1.535000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.665197,-1.535000,19.283884>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.357878,-1.535000,18.591200>}
box{<0,0,-0.152400><0.979601,0.035000,0.152400> rotate<0,44.997159,0> translate<27.665197,-1.535000,19.283884> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.667809,-1.535000,10.058400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,10.058400>}
box{<0,0,-0.152400><5.970191,0.035000,0.152400> rotate<0,0.000000,0> translate<27.667809,-1.535000,10.058400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.683675,0.000000,38.164797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.718928,0.000000,38.150194>}
box{<0,0,-0.203200><0.038158,0.035000,0.203200> rotate<0,22.499628,0> translate<27.683675,0.000000,38.164797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.686597,-1.535000,10.103750>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.686597,-1.535000,10.496247>}
box{<0,0,-0.152400><0.392497,0.035000,0.152400> rotate<0,90.000000,0> translate<27.686597,-1.535000,10.496247> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.686597,-1.535000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,10.363200>}
box{<0,0,-0.152400><5.951403,0.035000,0.152400> rotate<0,0.000000,0> translate<27.686597,-1.535000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.718928,0.000000,38.150194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.979197,0.000000,38.150194>}
box{<0,0,-0.203200><0.260269,0.035000,0.203200> rotate<0,0.000000,0> translate<27.718928,0.000000,38.150194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.729806,0.000000,3.421197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.368194,0.000000,3.421197>}
box{<0,0,-0.203200><0.638387,0.035000,0.203200> rotate<0,0.000000,0> translate<27.729806,0.000000,3.421197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.733584,0.000000,9.509378>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.919197,0.000000,9.957484>}
box{<0,0,-0.203200><0.485027,0.035000,0.203200> rotate<0,-67.495456,0> translate<27.733584,0.000000,9.509378> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.751728,0.000000,11.002741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940597,0.000000,10.546769>}
box{<0,0,-0.203200><0.493540,0.035000,0.203200> rotate<0,67.495651,0> translate<27.751728,0.000000,11.002741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.764131,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,10.972800>}
box{<0,0,-0.203200><1.619869,0.035000,0.203200> rotate<0,0.000000,0> translate<27.764131,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.834744,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,9.753600>}
box{<0,0,-0.203200><1.549256,0.035000,0.203200> rotate<0,0.000000,0> translate<27.834744,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.919197,0.000000,9.957484>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.919197,0.000000,10.001566>}
box{<0,0,-0.203200><0.044081,0.035000,0.203200> rotate<0,90.000000,0> translate<27.919197,0.000000,10.001566> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.919197,0.000000,10.001566>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940597,0.000000,10.053228>}
box{<0,0,-0.203200><0.055919,0.035000,0.203200> rotate<0,-67.494890,0> translate<27.919197,0.000000,10.001566> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.932466,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,10.566400>}
box{<0,0,-0.203200><1.451534,0.035000,0.203200> rotate<0,0.000000,0> translate<27.932466,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940597,0.000000,10.053228>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940597,0.000000,10.546769>}
box{<0,0,-0.203200><0.493541,0.035000,0.203200> rotate<0,90.000000,0> translate<27.940597,0.000000,10.546769> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940597,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,10.160000>}
box{<0,0,-0.203200><1.443403,0.035000,0.203200> rotate<0,0.000000,0> translate<27.940597,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.979197,0.000000,38.042388>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.979197,0.000000,38.150194>}
box{<0,0,-0.203200><0.107806,0.035000,0.203200> rotate<0,90.000000,0> translate<27.979197,0.000000,38.150194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.979197,0.000000,38.042388>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.982413,0.000000,38.041056>}
box{<0,0,-0.203200><0.003480,0.035000,0.203200> rotate<0,22.487786,0> translate<27.979197,0.000000,38.042388> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.979197,0.000000,38.193800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.979197,0.000000,38.485700>}
box{<0,0,-0.203200><0.291900,0.035000,0.203200> rotate<0,90.000000,0> translate<27.979197,0.000000,38.485700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.979197,0.000000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.386128,0.000000,38.201600>}
box{<0,0,-0.203200><0.406931,0.035000,0.203200> rotate<0,0.000000,0> translate<27.979197,0.000000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.979197,0.000000,38.485700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.376306,0.000000,38.485700>}
box{<0,0,-0.203200><1.397109,0.035000,0.203200> rotate<0,0.000000,0> translate<27.979197,0.000000,38.485700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.982413,0.000000,38.041056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.105469,0.000000,37.917997>}
box{<0,0,-0.203200><0.174030,0.035000,0.203200> rotate<0,44.997758,0> translate<27.982413,0.000000,38.041056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.105469,0.000000,37.917997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.156663,0.000000,37.917997>}
box{<0,0,-0.203200><0.051194,0.035000,0.203200> rotate<0,0.000000,0> translate<28.105469,0.000000,37.917997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.156663,0.000000,37.917997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.194941,0.000000,38.010413>}
box{<0,0,-0.203200><0.100029,0.035000,0.203200> rotate<0,-67.496434,0> translate<28.156663,0.000000,37.917997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.194941,0.000000,38.010413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.423584,0.000000,38.239056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.194941,0.000000,38.010413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.325134,0.000000,34.996997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.334797,0.000000,34.973675>}
box{<0,0,-0.203200><0.025244,0.035000,0.203200> rotate<0,67.490800,0> translate<28.325134,0.000000,34.996997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.325134,0.000000,34.996997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.334797,0.000000,35.020322>}
box{<0,0,-0.203200><0.025247,0.035000,0.203200> rotate<0,-67.493514,0> translate<28.325134,0.000000,34.996997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.334797,0.000000,34.115997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.334797,0.000000,34.973675>}
box{<0,0,-0.203200><0.857678,0.035000,0.203200> rotate<0,90.000000,0> translate<28.334797,0.000000,34.973675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.334797,0.000000,34.115997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.902094,0.000000,34.115997>}
box{<0,0,-0.203200><0.567297,0.035000,0.203200> rotate<0,0.000000,0> translate<28.334797,0.000000,34.115997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.334797,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.554000,0.000000,34.137600>}
box{<0,0,-0.203200><6.219203,0.035000,0.203200> rotate<0,0.000000,0> translate<28.334797,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.334797,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.554000,0.000000,34.544000>}
box{<0,0,-0.203200><6.219203,0.035000,0.203200> rotate<0,0.000000,0> translate<28.334797,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.334797,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.554000,0.000000,34.950400>}
box{<0,0,-0.203200><6.219203,0.035000,0.203200> rotate<0,0.000000,0> translate<28.334797,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.334797,0.000000,35.020322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.334797,0.000000,35.649731>}
box{<0,0,-0.203200><0.629409,0.035000,0.203200> rotate<0,90.000000,0> translate<28.334797,0.000000,35.649731> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.334797,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.554000,0.000000,35.356800>}
box{<0,0,-0.203200><6.219203,0.035000,0.203200> rotate<0,0.000000,0> translate<28.334797,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.334797,0.000000,35.649731>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.423584,0.000000,35.560941>}
box{<0,0,-0.203200><0.125567,0.035000,0.203200> rotate<0,44.998038,0> translate<28.334797,0.000000,35.649731> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.357878,-1.535000,18.591200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.442119,-1.535000,18.591200>}
box{<0,0,-0.152400><1.084241,0.035000,0.152400> rotate<0,0.000000,0> translate<28.357878,-1.535000,18.591200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.368194,0.000000,2.385819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.368194,0.000000,3.421197>}
box{<0,0,-0.203200><1.035378,0.035000,0.203200> rotate<0,90.000000,0> translate<28.368194,0.000000,3.421197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.368194,0.000000,2.385819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.711800,0.000000,2.385819>}
box{<0,0,-0.203200><0.343606,0.035000,0.203200> rotate<0,0.000000,0> translate<28.368194,0.000000,2.385819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.368194,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.711800,0.000000,2.438400>}
box{<0,0,-0.203200><0.343606,0.035000,0.203200> rotate<0,0.000000,0> translate<28.368194,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.368194,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.711800,0.000000,2.844800>}
box{<0,0,-0.203200><0.343606,0.035000,0.203200> rotate<0,0.000000,0> translate<28.368194,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.368194,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.711800,0.000000,3.251200>}
box{<0,0,-0.203200><0.343606,0.035000,0.203200> rotate<0,0.000000,0> translate<28.368194,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.423584,0.000000,35.560941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.722322,0.000000,35.437200>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<28.423584,0.000000,35.560941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.423584,0.000000,38.239056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.722322,0.000000,38.362797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<28.423584,0.000000,38.239056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.635675,0.000000,11.737200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.934413,0.000000,11.860941>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<28.635675,0.000000,11.737200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.711800,0.000000,3.421197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.711800,0.000000,2.385819>}
box{<0,0,-0.203200><1.035378,0.035000,0.203200> rotate<0,-90.000000,0> translate<28.711800,0.000000,2.385819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.711800,0.000000,3.421197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.350191,0.000000,3.421197>}
box{<0,0,-0.203200><0.638391,0.035000,0.203200> rotate<0,0.000000,0> translate<28.711800,0.000000,3.421197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.722322,0.000000,35.437200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.245675,0.000000,35.437200>}
box{<0,0,-0.203200><1.523353,0.035000,0.203200> rotate<0,0.000000,0> translate<28.722322,0.000000,35.437200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.722322,0.000000,38.362797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.245675,0.000000,38.362797>}
box{<0,0,-0.203200><1.523353,0.035000,0.203200> rotate<0,0.000000,0> translate<28.722322,0.000000,38.362797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.752522,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,11.785600>}
box{<0,0,-0.203200><0.631478,0.035000,0.203200> rotate<0,0.000000,0> translate<28.752522,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.902094,0.000000,34.115997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.275516,0.000000,33.961322>}
box{<0,0,-0.203200><0.404188,0.035000,0.203200> rotate<0,22.498331,0> translate<28.902094,0.000000,34.115997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.934413,0.000000,11.860941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.163056,0.000000,12.089584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.934413,0.000000,11.860941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.163056,0.000000,12.089584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.286797,0.000000,12.388322>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<29.163056,0.000000,12.089584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.205475,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,12.192000>}
box{<0,0,-0.203200><0.178525,0.035000,0.203200> rotate<0,0.000000,0> translate<29.205475,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.275516,0.000000,33.961322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.561322,0.000000,33.675516>}
box{<0,0,-0.203200><0.404191,0.035000,0.203200> rotate<0,44.997030,0> translate<29.275516,0.000000,33.961322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.286797,0.000000,12.388322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.286797,0.000000,13.176362>}
box{<0,0,-0.203200><0.788041,0.035000,0.203200> rotate<0,90.000000,0> translate<29.286797,0.000000,13.176362> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.286797,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,12.598400>}
box{<0,0,-0.203200><0.097203,0.035000,0.203200> rotate<0,0.000000,0> translate<29.286797,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.286797,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,13.004800>}
box{<0,0,-0.203200><0.097203,0.035000,0.203200> rotate<0,0.000000,0> translate<29.286797,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.286797,0.000000,13.176362>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,13.079156>}
box{<0,0,-0.203200><0.137468,0.035000,0.203200> rotate<0,44.997951,0> translate<29.286797,0.000000,13.176362> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.350191,0.000000,3.421197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,3.412138>}
box{<0,0,-0.203200><0.035002,0.035000,0.203200> rotate<0,14.999295,0> translate<29.350191,0.000000,3.421197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.376306,0.000000,38.485700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.652241,0.000000,38.600000>}
box{<0,0,-0.203200><0.298671,0.035000,0.203200> rotate<0,-22.499266,0> translate<29.376306,0.000000,38.485700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,13.079156>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.384000,0.000000,3.412138>}
box{<0,0,-0.203200><9.667019,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.384000,0.000000,3.412138> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.442119,-1.535000,18.591200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.938000,-1.535000,19.087084>}
box{<0,0,-0.152400><0.701284,0.035000,0.152400> rotate<0,-44.997211,0> translate<29.442119,-1.535000,18.591200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.443716,-1.535000,18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.938000,-1.535000,18.592800>}
box{<0,0,-0.152400><0.494284,0.035000,0.152400> rotate<0,0.000000,0> translate<29.443716,-1.535000,18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.505638,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.223319,0.000000,33.731200>}
box{<0,0,-0.203200><2.717681,0.035000,0.203200> rotate<0,0.000000,0> translate<29.505638,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.561322,0.000000,33.675516>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.561322,0.000000,31.675516>}
box{<0,0,-0.203200><2.828427,0.035000,0.203200> rotate<0,44.997030,0> translate<29.561322,0.000000,33.675516> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.652241,0.000000,38.600000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,38.600000>}
box{<0,0,-0.203200><26.484959,0.035000,0.203200> rotate<0,0.000000,0> translate<29.652241,0.000000,38.600000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.748516,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.938000,-1.535000,18.897600>}
box{<0,0,-0.152400><0.189484,0.035000,0.152400> rotate<0,0.000000,0> translate<29.748516,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.912038,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004347,0.000000,33.324800>}
box{<0,0,-0.203200><2.092309,0.035000,0.203200> rotate<0,0.000000,0> translate<29.912038,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.938000,-1.535000,15.648425>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.054006,-1.535000,15.368359>}
box{<0,0,-0.152400><0.303141,0.035000,0.152400> rotate<0,67.495673,0> translate<29.938000,-1.535000,15.648425> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.938000,-1.535000,19.087084>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.938000,-1.535000,15.648425>}
box{<0,0,-0.152400><3.438659,0.035000,0.152400> rotate<0,-90.000000,0> translate<29.938000,-1.535000,15.648425> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.054006,-1.535000,15.368359>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.268359,-1.535000,15.154006>}
box{<0,0,-0.152400><0.303141,0.035000,0.152400> rotate<0,44.997030,0> translate<30.054006,-1.535000,15.368359> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.245675,0.000000,35.437200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.499997,0.000000,35.542544>}
box{<0,0,-0.203200><0.275276,0.035000,0.203200> rotate<0,-22.498550,0> translate<30.245675,0.000000,35.437200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.245675,0.000000,38.362797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.499997,0.000000,38.257453>}
box{<0,0,-0.203200><0.275276,0.035000,0.203200> rotate<0,22.498550,0> translate<30.245675,0.000000,38.362797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.268359,-1.535000,15.154006>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,11.784366>}
box{<0,0,-0.152400><4.765391,0.035000,0.152400> rotate<0,44.997030,0> translate<30.268359,-1.535000,15.154006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.318438,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.963200,0.000000,32.918400>}
box{<0,0,-0.203200><1.644762,0.035000,0.203200> rotate<0,0.000000,0> translate<30.318438,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.499997,0.000000,35.542544>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.754322,0.000000,35.437200>}
box{<0,0,-0.203200><0.275279,0.035000,0.203200> rotate<0,22.498301,0> translate<30.499997,0.000000,35.542544> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.499997,0.000000,38.257453>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.754322,0.000000,38.362797>}
box{<0,0,-0.203200><0.275279,0.035000,0.203200> rotate<0,-22.498301,0> translate<30.499997,0.000000,38.257453> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.724838,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.963200,0.000000,32.512000>}
box{<0,0,-0.203200><1.238362,0.035000,0.203200> rotate<0,0.000000,0> translate<30.724838,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.754322,0.000000,35.437200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.277675,0.000000,35.437200>}
box{<0,0,-0.203200><1.523353,0.035000,0.203200> rotate<0,0.000000,0> translate<30.754322,0.000000,35.437200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.754322,0.000000,38.362797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.277675,0.000000,38.362797>}
box{<0,0,-0.203200><1.523353,0.035000,0.203200> rotate<0,0.000000,0> translate<30.754322,0.000000,38.362797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.891991,-1.535000,36.565197>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.246741,-1.535000,36.418253>}
box{<0,0,-0.152400><0.383979,0.035000,0.152400> rotate<0,22.498720,0> translate<30.891991,-1.535000,36.565197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.131238,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.963200,0.000000,32.105600>}
box{<0,0,-0.203200><0.831962,0.035000,0.203200> rotate<0,0.000000,0> translate<31.131238,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.246741,-1.535000,36.418253>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.518253,-1.535000,36.146741>}
box{<0,0,-0.152400><0.383977,0.035000,0.152400> rotate<0,44.997030,0> translate<31.246741,-1.535000,36.418253> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.393794,-1.535000,36.271200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.268000,-1.535000,36.271200>}
box{<0,0,-0.152400><0.874206,0.035000,0.152400> rotate<0,0.000000,0> translate<31.393794,-1.535000,36.271200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.518253,-1.535000,36.146741>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.268000,-1.535000,35.396991>}
box{<0,0,-0.152400><1.060304,0.035000,0.152400> rotate<0,44.997150,0> translate<31.518253,-1.535000,36.146741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.537638,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.967450,0.000000,31.699200>}
box{<0,0,-0.203200><0.429813,0.035000,0.203200> rotate<0,0.000000,0> translate<31.537638,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.561322,0.000000,31.675516>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,31.302094>}
box{<0,0,-0.203200><0.404188,0.035000,0.203200> rotate<0,67.495729,0> translate<31.561322,0.000000,31.675516> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.698594,-1.535000,35.966400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.268000,-1.535000,35.966400>}
box{<0,0,-0.152400><0.569406,0.035000,0.152400> rotate<0,0.000000,0> translate<31.698594,-1.535000,35.966400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,16.220841>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,22.426178>}
box{<0,0,-0.203200><6.205337,0.035000,0.203200> rotate<0,90.000000,0> translate<31.715997,0.000000,22.426178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,16.220841>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.261322,0.000000,12.675516>}
box{<0,0,-0.203200><5.013847,0.035000,0.203200> rotate<0,44.997030,0> translate<31.715997,0.000000,16.220841> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.351841,0.000000,16.256000>}
box{<0,0,-0.203200><7.635844,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.723006,0.000000,16.662400>}
box{<0,0,-0.203200><8.007009,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.476391,0.000000,17.068800>}
box{<0,0,-0.203200><8.760394,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,17.475200>}
box{<0,0,-0.203200><24.421203,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,17.881600>}
box{<0,0,-0.203200><24.421203,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,18.288000>}
box{<0,0,-0.203200><24.421203,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,18.694400>}
box{<0,0,-0.203200><24.421203,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,19.100800>}
box{<0,0,-0.203200><24.421203,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,19.507200>}
box{<0,0,-0.203200><24.421203,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.878297,0.000000,19.913600>}
box{<0,0,-0.203200><4.162300,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255791,0.000000,20.320000>}
box{<0,0,-0.203200><3.539794,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.849391,0.000000,20.726400>}
box{<0,0,-0.203200><3.133394,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.497716,0.000000,21.132800>}
box{<0,0,-0.203200><2.781719,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.350800,0.000000,21.539200>}
box{<0,0,-0.203200><2.634803,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.043622,0.000000,21.945600>}
box{<0,0,-0.203200><0.327625,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.746719,0.000000,22.352000>}
box{<0,0,-0.203200><0.030722,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,22.426178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.824147,0.000000,22.165075>}
box{<0,0,-0.203200><0.282615,0.035000,0.203200> rotate<0,67.496005,0> translate<31.715997,0.000000,22.426178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,24.734619>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,31.302094>}
box{<0,0,-0.203200><6.567475,0.035000,0.203200> rotate<0,90.000000,0> translate<31.715997,0.000000,31.302094> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,24.734619>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.824147,0.000000,24.995722>}
box{<0,0,-0.203200><0.282615,0.035000,0.203200> rotate<0,-67.496005,0> translate<31.715997,0.000000,24.734619> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.739103,0.000000,24.790400>}
box{<0,0,-0.203200><0.023106,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.025225,0.000000,25.196800>}
box{<0,0,-0.203200><0.309228,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.724863,0.000000,25.603200>}
box{<0,0,-0.203200><1.008866,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.102200,0.000000,26.009600>}
box{<0,0,-0.203200><7.386203,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.102200,0.000000,26.416000>}
box{<0,0,-0.203200><7.386203,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.102200,0.000000,26.822400>}
box{<0,0,-0.203200><7.386203,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.102200,0.000000,27.228800>}
box{<0,0,-0.203200><7.386203,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.102200,0.000000,27.635200>}
box{<0,0,-0.203200><7.386203,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.183503,0.000000,28.041600>}
box{<0,0,-0.203200><7.467506,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.351841,0.000000,28.448000>}
box{<0,0,-0.203200><7.635844,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.723006,0.000000,28.854400>}
box{<0,0,-0.203200><8.007009,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.780800,0.000000,29.260800>}
box{<0,0,-0.203200><8.064803,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.780800,0.000000,29.667200>}
box{<0,0,-0.203200><8.064803,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.793678,0.000000,30.073600>}
box{<0,0,-0.203200><8.077681,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.063991,0.000000,30.480000>}
box{<0,0,-0.203200><3.347994,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.492834,0.000000,30.886400>}
box{<0,0,-0.203200><0.776837,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.715997,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.096225,0.000000,31.292800>}
box{<0,0,-0.203200><0.380228,0.035000,0.203200> rotate<0,0.000000,0> translate<31.715997,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.824147,0.000000,22.165075>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.224275,0.000000,21.764947>}
box{<0,0,-0.203200><0.565867,0.035000,0.203200> rotate<0,44.997030,0> translate<31.824147,0.000000,22.165075> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.824147,0.000000,24.995722>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.224275,0.000000,25.395850>}
box{<0,0,-0.203200><0.565867,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.824147,0.000000,24.995722> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.963200,0.000000,31.726038>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.989469,0.000000,31.560188>}
box{<0,0,-0.203200><0.167917,0.035000,0.203200> rotate<0,80.994422,0> translate<31.963200,0.000000,31.726038> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.963200,0.000000,31.809981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.963200,0.000000,31.726038>}
box{<0,0,-0.203200><0.083944,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.963200,0.000000,31.726038> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.963200,0.000000,31.809981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.029966,0.000000,31.809981>}
box{<0,0,-0.203200><1.066766,0.035000,0.203200> rotate<0,0.000000,0> translate<31.963200,0.000000,31.809981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.963200,0.000000,31.810013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.029966,0.000000,31.810013>}
box{<0,0,-0.203200><1.066766,0.035000,0.203200> rotate<0,0.000000,0> translate<31.963200,0.000000,31.810013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.963200,0.000000,33.113159>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.963200,0.000000,31.810013>}
box{<0,0,-0.203200><1.303147,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.963200,0.000000,31.810013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.963200,0.000000,33.113159>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.989469,0.000000,33.279009>}
box{<0,0,-0.203200><0.167917,0.035000,0.203200> rotate<0,-80.994422,0> translate<31.963200,0.000000,33.113159> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.989469,0.000000,31.560188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.041356,0.000000,31.400488>}
box{<0,0,-0.203200><0.167918,0.035000,0.203200> rotate<0,71.995954,0> translate<31.989469,0.000000,31.560188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.989469,0.000000,33.279009>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.041356,0.000000,33.438709>}
box{<0,0,-0.203200><0.167918,0.035000,0.203200> rotate<0,-71.995954,0> translate<31.989469,0.000000,33.279009> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.003394,-1.535000,35.661600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.268000,-1.535000,35.661600>}
box{<0,0,-0.152400><0.264606,0.035000,0.152400> rotate<0,0.000000,0> translate<32.003394,-1.535000,35.661600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.041356,0.000000,31.400488>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.117591,0.000000,31.250875>}
box{<0,0,-0.203200><0.167915,0.035000,0.203200> rotate<0,62.994931,0> translate<32.041356,0.000000,31.400488> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.041356,0.000000,33.438709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.117591,0.000000,33.588322>}
box{<0,0,-0.203200><0.167915,0.035000,0.203200> rotate<0,-62.994931,0> translate<32.041356,0.000000,33.438709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.087238,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.183503,0.000000,15.849600>}
box{<0,0,-0.203200><7.096266,0.035000,0.203200> rotate<0,0.000000,0> translate<32.087238,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.117591,0.000000,31.250875>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.216291,0.000000,31.115025>}
box{<0,0,-0.203200><0.167919,0.035000,0.203200> rotate<0,53.996658,0> translate<32.117591,0.000000,31.250875> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.117591,0.000000,33.588322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.216291,0.000000,33.724172>}
box{<0,0,-0.203200><0.167919,0.035000,0.203200> rotate<0,-53.996658,0> translate<32.117591,0.000000,33.588322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.216291,0.000000,31.115025>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.335025,0.000000,30.996291>}
box{<0,0,-0.203200><0.167916,0.035000,0.203200> rotate<0,44.997030,0> translate<32.216291,0.000000,31.115025> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.216291,0.000000,33.724172>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.335025,0.000000,33.842906>}
box{<0,0,-0.203200><0.167916,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.216291,0.000000,33.724172> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.224275,0.000000,21.764947>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.747066,0.000000,21.548400>}
box{<0,0,-0.203200><0.565864,0.035000,0.203200> rotate<0,22.498506,0> translate<32.224275,0.000000,21.764947> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.224275,0.000000,25.395850>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.747066,0.000000,25.612397>}
box{<0,0,-0.203200><0.565864,0.035000,0.203200> rotate<0,-22.498506,0> translate<32.224275,0.000000,25.395850> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.268000,-1.535000,37.438000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.268000,-1.535000,35.396991>}
box{<0,0,-0.152400><2.041009,0.035000,0.152400> rotate<0,-90.000000,0> translate<32.268000,-1.535000,35.396991> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.277675,0.000000,35.437200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.576413,0.000000,35.560941>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<32.277675,0.000000,35.437200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.277675,0.000000,38.362797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.576413,0.000000,38.239056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<32.277675,0.000000,38.362797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.335025,0.000000,30.996291>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.470875,0.000000,30.897591>}
box{<0,0,-0.203200><0.167919,0.035000,0.203200> rotate<0,35.997403,0> translate<32.335025,0.000000,30.996291> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.335025,0.000000,33.842906>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.470875,0.000000,33.941606>}
box{<0,0,-0.203200><0.167919,0.035000,0.203200> rotate<0,-35.997403,0> translate<32.335025,0.000000,33.842906> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.470875,0.000000,30.897591>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.620488,0.000000,30.821356>}
box{<0,0,-0.203200><0.167915,0.035000,0.203200> rotate<0,26.999130,0> translate<32.470875,0.000000,30.897591> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.470875,0.000000,33.941606>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.620488,0.000000,34.017841>}
box{<0,0,-0.203200><0.167915,0.035000,0.203200> rotate<0,-26.999130,0> translate<32.470875,0.000000,33.941606> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.493637,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.102200,0.000000,15.443200>}
box{<0,0,-0.203200><6.608563,0.035000,0.203200> rotate<0,0.000000,0> translate<32.493637,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.576413,0.000000,35.560941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.805056,0.000000,35.789584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.576413,0.000000,35.560941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.576413,0.000000,38.239056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.805056,0.000000,38.010413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<32.576413,0.000000,38.239056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.613869,0.000000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.490025,0.000000,38.201600>}
box{<0,0,-0.203200><6.876156,0.035000,0.203200> rotate<0,0.000000,0> translate<32.613869,0.000000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.620488,0.000000,30.821356>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.780188,0.000000,30.769469>}
box{<0,0,-0.203200><0.167918,0.035000,0.203200> rotate<0,17.998106,0> translate<32.620488,0.000000,30.821356> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.620488,0.000000,34.017841>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.780188,0.000000,34.069728>}
box{<0,0,-0.203200><0.167918,0.035000,0.203200> rotate<0,-17.998106,0> translate<32.620488,0.000000,34.017841> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.747066,0.000000,21.548400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.312931,0.000000,21.548400>}
box{<0,0,-0.203200><0.565866,0.035000,0.203200> rotate<0,0.000000,0> translate<32.747066,0.000000,21.548400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.747066,0.000000,25.612397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.312931,0.000000,25.612397>}
box{<0,0,-0.203200><0.565866,0.035000,0.203200> rotate<0,0.000000,0> translate<32.747066,0.000000,25.612397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778672,0.000000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.299956,0.000000,35.763200>}
box{<0,0,-0.203200><1.521284,0.035000,0.203200> rotate<0,0.000000,0> translate<32.778672,0.000000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.780188,0.000000,30.769469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.946038,0.000000,30.743200>}
box{<0,0,-0.203200><0.167917,0.035000,0.203200> rotate<0,8.999639,0> translate<32.780188,0.000000,30.769469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.780188,0.000000,34.069728>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.946038,0.000000,34.095997>}
box{<0,0,-0.203200><0.167917,0.035000,0.203200> rotate<0,-8.999639,0> translate<32.780188,0.000000,34.069728> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.805056,0.000000,35.789584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.844163,0.000000,35.884000>}
box{<0,0,-0.203200><0.102194,0.035000,0.203200> rotate<0,-67.496572,0> translate<32.805056,0.000000,35.789584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.805056,0.000000,38.010413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.844163,0.000000,37.915997>}
box{<0,0,-0.203200><0.102194,0.035000,0.203200> rotate<0,67.496572,0> translate<32.805056,0.000000,38.010413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.844163,0.000000,35.884000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.179156,0.000000,35.884000>}
box{<0,0,-0.203200><1.334994,0.035000,0.203200> rotate<0,0.000000,0> translate<32.844163,0.000000,35.884000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.844163,0.000000,37.915997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.802094,0.000000,37.915997>}
box{<0,0,-0.203200><1.957931,0.035000,0.203200> rotate<0,0.000000,0> translate<32.844163,0.000000,37.915997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.900038,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.102200,0.000000,15.036800>}
box{<0,0,-0.203200><6.202163,0.035000,0.203200> rotate<0,0.000000,0> translate<32.900038,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.946038,0.000000,30.743200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.029981,0.000000,30.743197>}
box{<0,0,-0.203200><0.083944,0.035000,0.203200> rotate<0,0.002133,0> translate<32.946038,0.000000,30.743200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.946038,0.000000,34.095997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.029981,0.000000,34.095997>}
box{<0,0,-0.203200><0.083944,0.035000,0.203200> rotate<0,0.000000,0> translate<32.946038,0.000000,34.095997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.029966,0.000000,31.810013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.029966,0.000000,31.809981>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.029966,0.000000,31.809981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.029981,0.000000,30.743197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.029981,0.000000,31.809966>}
box{<0,0,-0.203200><1.066769,0.035000,0.203200> rotate<0,90.000000,0> translate<33.029981,0.000000,31.809966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.029981,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.030013,0.000000,30.886400>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<33.029981,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.029981,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.030013,0.000000,31.292800>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<33.029981,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.029981,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.030013,0.000000,31.699200>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<33.029981,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.029981,0.000000,31.809966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.030013,0.000000,31.809966>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<33.029981,0.000000,31.809966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.029981,0.000000,31.810031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.029981,0.000000,34.095997>}
box{<0,0,-0.203200><2.285966,0.035000,0.203200> rotate<0,90.000000,0> translate<33.029981,0.000000,34.095997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.029981,0.000000,31.810031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.030013,0.000000,31.810031>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<33.029981,0.000000,31.810031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.029981,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.030013,0.000000,32.105600>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<33.029981,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.029981,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.030013,0.000000,32.512000>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<33.029981,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.029981,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.030013,0.000000,32.918400>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<33.029981,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.029981,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.030013,0.000000,33.324800>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<33.029981,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.029981,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.030013,0.000000,33.731200>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<33.029981,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.030013,0.000000,30.743200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.113959,0.000000,30.743200>}
box{<0,0,-0.203200><0.083947,0.035000,0.203200> rotate<0,0.000000,0> translate<33.030013,0.000000,30.743200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.030013,0.000000,31.809966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.030013,0.000000,30.743200>}
box{<0,0,-0.203200><1.066766,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.030013,0.000000,30.743200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.030013,0.000000,34.095997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.030013,0.000000,31.810031>}
box{<0,0,-0.203200><2.285966,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.030013,0.000000,31.810031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.030013,0.000000,34.095997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.113959,0.000000,34.095997>}
box{<0,0,-0.203200><0.083947,0.035000,0.203200> rotate<0,0.000000,0> translate<33.030013,0.000000,34.095997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.030031,0.000000,31.809981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.030031,0.000000,31.810013>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,90.000000,0> translate<33.030031,0.000000,31.810013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.030031,0.000000,31.809981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.096794,0.000000,31.809981>}
box{<0,0,-0.203200><1.066763,0.035000,0.203200> rotate<0,0.000000,0> translate<33.030031,0.000000,31.809981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.030031,0.000000,31.810013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.096797,0.000000,31.810013>}
box{<0,0,-0.203200><1.066766,0.035000,0.203200> rotate<0,0.000000,0> translate<33.030031,0.000000,31.810013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.113959,0.000000,30.743200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.279809,0.000000,30.769469>}
box{<0,0,-0.203200><0.167917,0.035000,0.203200> rotate<0,-8.999639,0> translate<33.113959,0.000000,30.743200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.113959,0.000000,34.095997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.279809,0.000000,34.069728>}
box{<0,0,-0.203200><0.167917,0.035000,0.203200> rotate<0,8.999639,0> translate<33.113959,0.000000,34.095997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.279809,0.000000,30.769469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.439509,0.000000,30.821356>}
box{<0,0,-0.203200><0.167918,0.035000,0.203200> rotate<0,-17.998106,0> translate<33.279809,0.000000,30.769469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.279809,0.000000,34.069728>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.439509,0.000000,34.017841>}
box{<0,0,-0.203200><0.167918,0.035000,0.203200> rotate<0,17.998106,0> translate<33.279809,0.000000,34.069728> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.284366,-1.535000,1.661997>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,2.015631>}
box{<0,0,-0.152400><0.500115,0.035000,0.152400> rotate<0,-44.997030,0> translate<33.284366,-1.535000,1.661997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.306438,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.102200,0.000000,14.630400>}
box{<0,0,-0.203200><5.795763,0.035000,0.203200> rotate<0,0.000000,0> translate<33.306438,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.312931,0.000000,21.548400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.835722,0.000000,21.764947>}
box{<0,0,-0.203200><0.565864,0.035000,0.203200> rotate<0,-22.498506,0> translate<33.312931,0.000000,21.548400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.312931,0.000000,25.612397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.835722,0.000000,25.395850>}
box{<0,0,-0.203200><0.565864,0.035000,0.203200> rotate<0,22.498506,0> translate<33.312931,0.000000,25.612397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.335138,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.264862,0.000000,25.603200>}
box{<0,0,-0.203200><1.929725,0.035000,0.203200> rotate<0,0.000000,0> translate<33.335138,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.439509,0.000000,30.821356>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.589122,0.000000,30.897591>}
box{<0,0,-0.203200><0.167915,0.035000,0.203200> rotate<0,-26.999130,0> translate<33.439509,0.000000,30.821356> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.439509,0.000000,34.017841>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.589122,0.000000,33.941606>}
box{<0,0,-0.203200><0.167915,0.035000,0.203200> rotate<0,26.999130,0> translate<33.439509,0.000000,34.017841> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.567159,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.482022,0.000000,30.886400>}
box{<0,0,-0.203200><0.914862,0.035000,0.203200> rotate<0,0.000000,0> translate<33.567159,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.589122,0.000000,30.897591>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.724972,0.000000,30.996291>}
box{<0,0,-0.203200><0.167919,0.035000,0.203200> rotate<0,-35.997403,0> translate<33.589122,0.000000,30.897591> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.589122,0.000000,33.941606>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.724972,0.000000,33.842906>}
box{<0,0,-0.203200><0.167919,0.035000,0.203200> rotate<0,35.997403,0> translate<33.589122,0.000000,33.941606> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,11.784366>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.638000,-1.535000,2.015631>}
box{<0,0,-0.152400><9.768734,0.035000,0.152400> rotate<0,-90.000000,0> translate<33.638000,-1.535000,2.015631> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.712837,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.102200,0.000000,14.224000>}
box{<0,0,-0.203200><5.389363,0.035000,0.203200> rotate<0,0.000000,0> translate<33.712837,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.724972,0.000000,30.996291>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.843706,0.000000,31.115025>}
box{<0,0,-0.203200><0.167916,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.724972,0.000000,30.996291> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.724972,0.000000,33.842906>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.843706,0.000000,33.724172>}
box{<0,0,-0.203200><0.167916,0.035000,0.203200> rotate<0,44.997030,0> translate<33.724972,0.000000,33.842906> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.835722,0.000000,21.764947>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.235850,0.000000,22.165075>}
box{<0,0,-0.203200><0.565867,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.835722,0.000000,21.764947> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.835722,0.000000,25.395850>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.235850,0.000000,24.995722>}
box{<0,0,-0.203200><0.565867,0.035000,0.203200> rotate<0,44.997030,0> translate<33.835722,0.000000,25.395850> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.836678,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.321184,0.000000,33.731200>}
box{<0,0,-0.203200><0.484506,0.035000,0.203200> rotate<0,0.000000,0> translate<33.836678,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.843706,0.000000,31.115025>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.942406,0.000000,31.250875>}
box{<0,0,-0.203200><0.167919,0.035000,0.203200> rotate<0,-53.996658,0> translate<33.843706,0.000000,31.115025> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.843706,0.000000,33.724172>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.942406,0.000000,33.588322>}
box{<0,0,-0.203200><0.167919,0.035000,0.203200> rotate<0,53.996658,0> translate<33.843706,0.000000,33.724172> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.942406,0.000000,31.250875>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.018641,0.000000,31.400488>}
box{<0,0,-0.203200><0.167915,0.035000,0.203200> rotate<0,-62.994931,0> translate<33.942406,0.000000,31.250875> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.942406,0.000000,33.588322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.018641,0.000000,33.438709>}
box{<0,0,-0.203200><0.167915,0.035000,0.203200> rotate<0,62.994931,0> translate<33.942406,0.000000,33.588322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.963769,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.244634,0.000000,31.292800>}
box{<0,0,-0.203200><0.280866,0.035000,0.203200> rotate<0,0.000000,0> translate<33.963769,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.016375,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.350800,0.000000,21.945600>}
box{<0,0,-0.203200><0.334425,0.035000,0.203200> rotate<0,0.000000,0> translate<34.016375,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.018641,0.000000,31.400488>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.070528,0.000000,31.560188>}
box{<0,0,-0.203200><0.167918,0.035000,0.203200> rotate<0,-71.995954,0> translate<34.018641,0.000000,31.400488> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.018641,0.000000,33.438709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.070528,0.000000,33.279009>}
box{<0,0,-0.203200><0.167918,0.035000,0.203200> rotate<0,71.995954,0> translate<34.018641,0.000000,33.438709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.034772,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.565225,0.000000,25.196800>}
box{<0,0,-0.203200><0.530453,0.035000,0.203200> rotate<0,0.000000,0> translate<34.034772,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.055653,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.152850,0.000000,33.324800>}
box{<0,0,-0.203200><0.097197,0.035000,0.203200> rotate<0,0.000000,0> translate<34.055653,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.070528,0.000000,31.560188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.096797,0.000000,31.726038>}
box{<0,0,-0.203200><0.167917,0.035000,0.203200> rotate<0,-80.994422,0> translate<34.070528,0.000000,31.560188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.070528,0.000000,33.279009>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.096797,0.000000,33.113159>}
box{<0,0,-0.203200><0.167917,0.035000,0.203200> rotate<0,80.994422,0> translate<34.070528,0.000000,33.279009> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.092544,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.147600,0.000000,31.699200>}
box{<0,0,-0.203200><0.055056,0.035000,0.203200> rotate<0,0.000000,0> translate<34.092544,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.096794,0.000000,31.809981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.096797,0.000000,31.726038>}
box{<0,0,-0.203200><0.083944,0.035000,0.203200> rotate<0,89.991928,0> translate<34.096794,0.000000,31.809981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.096797,0.000000,31.810013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.096797,0.000000,33.113159>}
box{<0,0,-0.203200><1.303147,0.035000,0.203200> rotate<0,90.000000,0> translate<34.096797,0.000000,33.113159> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.096797,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.147600,0.000000,32.105600>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<34.096797,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.096797,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.147600,0.000000,32.512000>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<34.096797,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.096797,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.147600,0.000000,32.918400>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<34.096797,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.119238,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.102200,0.000000,13.817600>}
box{<0,0,-0.203200><4.982962,0.035000,0.203200> rotate<0,0.000000,0> translate<34.119238,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.147600,0.000000,31.527066>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.364147,0.000000,31.004275>}
box{<0,0,-0.203200><0.565864,0.035000,0.203200> rotate<0,67.495554,0> translate<34.147600,0.000000,31.527066> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.147600,0.000000,33.312131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.147600,0.000000,31.527066>}
box{<0,0,-0.203200><1.785066,0.035000,0.203200> rotate<0,-90.000000,0> translate<34.147600,0.000000,31.527066> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.147600,0.000000,33.312131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.364147,0.000000,33.834922>}
box{<0,0,-0.203200><0.565864,0.035000,0.203200> rotate<0,-67.495554,0> translate<34.147600,0.000000,33.312131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.179156,0.000000,35.884000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.554000,0.000000,35.509156>}
box{<0,0,-0.203200><0.530109,0.035000,0.203200> rotate<0,44.997030,0> translate<34.179156,0.000000,35.884000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.235850,0.000000,22.165075>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.299997,0.000000,22.319947>}
box{<0,0,-0.203200><0.167631,0.035000,0.203200> rotate<0,-67.496542,0> translate<34.235850,0.000000,22.165075> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.235850,0.000000,24.995722>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.299997,0.000000,24.840850>}
box{<0,0,-0.203200><0.167631,0.035000,0.203200> rotate<0,67.496542,0> translate<34.235850,0.000000,24.995722> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.299997,0.000000,22.319947>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.350800,0.000000,22.197300>}
box{<0,0,-0.203200><0.132752,0.035000,0.203200> rotate<0,67.495096,0> translate<34.299997,0.000000,22.319947> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.299997,0.000000,24.840850>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.364147,0.000000,24.995722>}
box{<0,0,-0.203200><0.167632,0.035000,0.203200> rotate<0,-67.495555,0> translate<34.299997,0.000000,24.840850> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.350800,0.000000,21.487484>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.536413,0.000000,21.039378>}
box{<0,0,-0.203200><0.485027,0.035000,0.203200> rotate<0,67.495456,0> translate<34.350800,0.000000,21.487484> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.350800,0.000000,22.197300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.350800,0.000000,21.487484>}
box{<0,0,-0.203200><0.709816,0.035000,0.203200> rotate<0,-90.000000,0> translate<34.350800,0.000000,21.487484> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.364147,0.000000,24.995722>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.764275,0.000000,25.395850>}
box{<0,0,-0.203200><0.565867,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.364147,0.000000,24.995722> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.364147,0.000000,31.004275>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.764275,0.000000,30.604147>}
box{<0,0,-0.203200><0.565867,0.035000,0.203200> rotate<0,44.997030,0> translate<34.364147,0.000000,31.004275> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.364147,0.000000,33.834922>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.554000,0.000000,34.024772>}
box{<0,0,-0.203200><0.268491,0.035000,0.203200> rotate<0,-44.996559,0> translate<34.364147,0.000000,33.834922> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.525638,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.102200,0.000000,13.411200>}
box{<0,0,-0.203200><4.576563,0.035000,0.203200> rotate<0,0.000000,0> translate<34.525638,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.536413,0.000000,21.039378>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.166412,0.000000,20.409378>}
box{<0,0,-0.203200><0.890955,0.035000,0.203200> rotate<0,44.997030,0> translate<34.536413,0.000000,21.039378> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.554000,0.000000,35.509156>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.554000,0.000000,34.024772>}
box{<0,0,-0.203200><1.484384,0.035000,0.203200> rotate<0,-90.000000,0> translate<34.554000,0.000000,34.024772> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.764275,0.000000,25.395850>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.287066,0.000000,25.612397>}
box{<0,0,-0.203200><0.565864,0.035000,0.203200> rotate<0,-22.498506,0> translate<34.764275,0.000000,25.395850> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.764275,0.000000,30.604147>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.287066,0.000000,30.387600>}
box{<0,0,-0.203200><0.565864,0.035000,0.203200> rotate<0,22.498506,0> translate<34.764275,0.000000,30.604147> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.802094,0.000000,37.915997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.175516,0.000000,37.761322>}
box{<0,0,-0.203200><0.404188,0.035000,0.203200> rotate<0,22.498331,0> translate<34.802094,0.000000,37.915997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.932037,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.102200,0.000000,13.004800>}
box{<0,0,-0.203200><4.170163,0.035000,0.203200> rotate<0,0.000000,0> translate<34.932037,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.093728,0.000000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.083625,0.000000,37.795200>}
box{<0,0,-0.203200><3.989897,0.035000,0.203200> rotate<0,0.000000,0> translate<35.093728,0.000000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.166412,0.000000,20.409378>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.509378,0.000000,20.066413>}
box{<0,0,-0.203200><0.485027,0.035000,0.203200> rotate<0,44.997030,0> translate<35.166412,0.000000,20.409378> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.175516,0.000000,37.761322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.461322,0.000000,37.475516>}
box{<0,0,-0.203200><0.404191,0.035000,0.203200> rotate<0,44.997030,0> translate<35.175516,0.000000,37.761322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.199634,0.000000,1.062797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.261322,0.000000,1.124481>}
box{<0,0,-0.203200><0.087237,0.035000,0.203200> rotate<0,-44.995579,0> translate<35.199634,0.000000,1.062797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.199634,0.000000,1.062797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,1.062797>}
box{<0,0,-0.203200><20.937566,0.035000,0.203200> rotate<0,0.000000,0> translate<35.199634,0.000000,1.062797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.261322,0.000000,1.124481>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,1.497903>}
box{<0,0,-0.203200><0.404188,0.035000,0.203200> rotate<0,-67.495729,0> translate<35.261322,0.000000,1.124481> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.261322,0.000000,12.675516>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,12.302094>}
box{<0,0,-0.203200><0.404188,0.035000,0.203200> rotate<0,67.495729,0> translate<35.261322,0.000000,12.675516> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.287066,0.000000,25.612397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.852931,0.000000,25.612397>}
box{<0,0,-0.203200><0.565866,0.035000,0.203200> rotate<0,0.000000,0> translate<35.287066,0.000000,25.612397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.287066,0.000000,30.387600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.852931,0.000000,30.387600>}
box{<0,0,-0.203200><0.565866,0.035000,0.203200> rotate<0,0.000000,0> translate<35.287066,0.000000,30.387600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.293266,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.249772,0.000000,12.598400>}
box{<0,0,-0.203200><3.956506,0.035000,0.203200> rotate<0,0.000000,0> translate<35.293266,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.300553,0.000000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,1.219200>}
box{<0,0,-0.203200><20.836647,0.035000,0.203200> rotate<0,0.000000,0> translate<35.300553,0.000000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,1.497903>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,12.302094>}
box{<0,0,-0.203200><10.804191,0.035000,0.203200> rotate<0,90.000000,0> translate<35.415997,0.000000,12.302094> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,1.625600>}
box{<0,0,-0.203200><20.721203,0.035000,0.203200> rotate<0,0.000000,0> translate<35.415997,0.000000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,2.032000>}
box{<0,0,-0.203200><20.721203,0.035000,0.203200> rotate<0,0.000000,0> translate<35.415997,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,2.438400>}
box{<0,0,-0.203200><20.721203,0.035000,0.203200> rotate<0,0.000000,0> translate<35.415997,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,2.844800>}
box{<0,0,-0.203200><20.721203,0.035000,0.203200> rotate<0,0.000000,0> translate<35.415997,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.195228,0.000000,3.251200>}
box{<0,0,-0.203200><5.779231,0.035000,0.203200> rotate<0,0.000000,0> translate<35.415997,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.556403,0.000000,3.657600>}
box{<0,0,-0.203200><5.140406,0.035000,0.203200> rotate<0,0.000000,0> translate<35.415997,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.232684,0.000000,4.064000>}
box{<0,0,-0.203200><4.816688,0.035000,0.203200> rotate<0,0.000000,0> translate<35.415997,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.064347,0.000000,4.470400>}
box{<0,0,-0.203200><4.648350,0.035000,0.203200> rotate<0,0.000000,0> translate<35.415997,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.016600,0.000000,4.876800>}
box{<0,0,-0.203200><4.600603,0.035000,0.203200> rotate<0,0.000000,0> translate<35.415997,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.016600,0.000000,5.283200>}
box{<0,0,-0.203200><4.600603,0.035000,0.203200> rotate<0,0.000000,0> translate<35.415997,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.016600,0.000000,5.689600>}
box{<0,0,-0.203200><4.600603,0.035000,0.203200> rotate<0,0.000000,0> translate<35.415997,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.016600,0.000000,6.096000>}
box{<0,0,-0.203200><4.600603,0.035000,0.203200> rotate<0,0.000000,0> translate<35.415997,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.016600,0.000000,6.502400>}
box{<0,0,-0.203200><4.600603,0.035000,0.203200> rotate<0,0.000000,0> translate<35.415997,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.016600,0.000000,6.908800>}
box{<0,0,-0.203200><4.600603,0.035000,0.203200> rotate<0,0.000000,0> translate<35.415997,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.029394,0.000000,7.315200>}
box{<0,0,-0.203200><4.613397,0.035000,0.203200> rotate<0,0.000000,0> translate<35.415997,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.197728,0.000000,7.721600>}
box{<0,0,-0.203200><4.781731,0.035000,0.203200> rotate<0,0.000000,0> translate<35.415997,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.472006,0.000000,8.128000>}
box{<0,0,-0.203200><5.056009,0.035000,0.203200> rotate<0,0.000000,0> translate<35.415997,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.991478,0.000000,8.534400>}
box{<0,0,-0.203200><5.575481,0.035000,0.203200> rotate<0,0.000000,0> translate<35.415997,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,8.940800>}
box{<0,0,-0.203200><20.721203,0.035000,0.203200> rotate<0,0.000000,0> translate<35.415997,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,9.347200>}
box{<0,0,-0.203200><20.721203,0.035000,0.203200> rotate<0,0.000000,0> translate<35.415997,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,9.753600>}
box{<0,0,-0.203200><20.721203,0.035000,0.203200> rotate<0,0.000000,0> translate<35.415997,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,10.160000>}
box{<0,0,-0.203200><20.721203,0.035000,0.203200> rotate<0,0.000000,0> translate<35.415997,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,10.566400>}
box{<0,0,-0.203200><20.721203,0.035000,0.203200> rotate<0,0.000000,0> translate<35.415997,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,10.972800>}
box{<0,0,-0.203200><20.721203,0.035000,0.203200> rotate<0,0.000000,0> translate<35.415997,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,11.379200>}
box{<0,0,-0.203200><20.721203,0.035000,0.203200> rotate<0,0.000000,0> translate<35.415997,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.883003,0.000000,11.785600>}
box{<0,0,-0.203200><4.467006,0.035000,0.203200> rotate<0,0.000000,0> translate<35.415997,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.415997,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.476603,0.000000,12.192000>}
box{<0,0,-0.203200><4.060606,0.035000,0.203200> rotate<0,0.000000,0> translate<35.415997,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.461322,0.000000,37.475516>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.431322,0.000000,36.505516>}
box{<0,0,-0.203200><1.371787,0.035000,0.203200> rotate<0,44.997030,0> translate<35.461322,0.000000,37.475516> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.509378,0.000000,20.066413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.957484,0.000000,19.880800>}
box{<0,0,-0.203200><0.485027,0.035000,0.203200> rotate<0,22.498604,0> translate<35.509378,0.000000,20.066413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.548037,0.000000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.947600,0.000000,37.388800>}
box{<0,0,-0.203200><3.399563,0.035000,0.203200> rotate<0,0.000000,0> translate<35.548037,0.000000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.852931,0.000000,25.612397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.375722,0.000000,25.395850>}
box{<0,0,-0.203200><0.565864,0.035000,0.203200> rotate<0,22.498506,0> translate<35.852931,0.000000,25.612397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.852931,0.000000,30.387600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.375722,0.000000,30.604147>}
box{<0,0,-0.203200><0.565864,0.035000,0.203200> rotate<0,-22.498506,0> translate<35.852931,0.000000,30.387600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.875138,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.102200,0.000000,25.603200>}
box{<0,0,-0.203200><3.227063,0.035000,0.203200> rotate<0,0.000000,0> translate<35.875138,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.954438,0.000000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.947600,0.000000,36.982400>}
box{<0,0,-0.203200><2.993162,0.035000,0.203200> rotate<0,0.000000,0> translate<35.954438,0.000000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.957484,0.000000,19.880800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.342513,0.000000,19.880800>}
box{<0,0,-0.203200><15.385028,0.035000,0.203200> rotate<0,0.000000,0> translate<35.957484,0.000000,19.880800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.076003,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.962016,0.000000,30.480000>}
box{<0,0,-0.203200><3.886012,0.035000,0.203200> rotate<0,0.000000,0> translate<36.076003,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.360838,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.947600,0.000000,36.576000>}
box{<0,0,-0.203200><2.586762,0.035000,0.203200> rotate<0,0.000000,0> translate<36.360838,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.375722,0.000000,25.395850>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.775850,0.000000,24.995722>}
box{<0,0,-0.203200><0.565867,0.035000,0.203200> rotate<0,44.997030,0> translate<36.375722,0.000000,25.395850> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.375722,0.000000,30.604147>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.775850,0.000000,31.004275>}
box{<0,0,-0.203200><0.565867,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.375722,0.000000,30.604147> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.431322,0.000000,36.505516>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.585997,0.000000,36.132094>}
box{<0,0,-0.203200><0.404188,0.035000,0.203200> rotate<0,67.495729,0> translate<36.431322,0.000000,36.505516> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.570463,0.000000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.258822,0.000000,36.169600>}
box{<0,0,-0.203200><2.688359,0.035000,0.203200> rotate<0,0.000000,0> translate<36.570463,0.000000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.574772,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.102200,0.000000,25.196800>}
box{<0,0,-0.203200><2.527428,0.035000,0.203200> rotate<0,0.000000,0> translate<36.574772,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.585997,0.000000,34.024772>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.585997,0.000000,36.132094>}
box{<0,0,-0.203200><2.107322,0.035000,0.203200> rotate<0,90.000000,0> translate<36.585997,0.000000,36.132094> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.585997,0.000000,34.024772>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.775850,0.000000,33.834922>}
box{<0,0,-0.203200><0.268491,0.035000,0.203200> rotate<0,44.996559,0> translate<36.585997,0.000000,34.024772> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.585997,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.763197,0.000000,34.137600>}
box{<0,0,-0.203200><0.177200,0.035000,0.203200> rotate<0,0.000000,0> translate<36.585997,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.585997,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.763200,0.000000,34.544000>}
box{<0,0,-0.203200><0.177203,0.035000,0.203200> rotate<0,0.000000,0> translate<36.585997,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.585997,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.763200,0.000000,34.950400>}
box{<0,0,-0.203200><0.177203,0.035000,0.203200> rotate<0,0.000000,0> translate<36.585997,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.585997,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.148119,0.000000,35.356800>}
box{<0,0,-0.203200><0.562122,0.035000,0.203200> rotate<0,0.000000,0> translate<36.585997,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.585997,0.000000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.591628,0.000000,35.763200>}
box{<0,0,-0.203200><3.005631,0.035000,0.203200> rotate<0,0.000000,0> translate<36.585997,0.000000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.657975,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.362194,0.000000,30.886400>}
box{<0,0,-0.203200><3.704219,0.035000,0.203200> rotate<0,0.000000,0> translate<36.657975,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.763197,0.000000,34.529981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.763200,0.000000,34.088116>}
box{<0,0,-0.203200><0.441866,0.035000,0.203200> rotate<0,89.993655,0> translate<36.763197,0.000000,34.529981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.763197,0.000000,34.529981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.829966,0.000000,34.529981>}
box{<0,0,-0.203200><1.066769,0.035000,0.203200> rotate<0,0.000000,0> translate<36.763197,0.000000,34.529981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.763197,0.000000,34.530013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.763200,0.000000,34.971881>}
box{<0,0,-0.203200><0.441869,0.035000,0.203200> rotate<0,-89.993655,0> translate<36.763197,0.000000,34.530013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.763197,0.000000,34.530013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.829966,0.000000,34.530013>}
box{<0,0,-0.203200><1.066769,0.035000,0.203200> rotate<0,0.000000,0> translate<36.763197,0.000000,34.530013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.763200,0.000000,34.088116>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.388116,0.000000,33.463200>}
box{<0,0,-0.203200><0.883764,0.035000,0.203200> rotate<0,44.997030,0> translate<36.763200,0.000000,34.088116> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.763200,0.000000,34.971881>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.388116,0.000000,35.596797>}
box{<0,0,-0.203200><0.883764,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.763200,0.000000,34.971881> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.775850,0.000000,24.995722>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.992397,0.000000,24.472931>}
box{<0,0,-0.203200><0.565864,0.035000,0.203200> rotate<0,67.495554,0> translate<36.775850,0.000000,24.995722> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.775850,0.000000,31.004275>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.992397,0.000000,31.527066>}
box{<0,0,-0.203200><0.565864,0.035000,0.203200> rotate<0,-67.495554,0> translate<36.775850,0.000000,31.004275> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.775850,0.000000,33.834922>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.992397,0.000000,33.312131>}
box{<0,0,-0.203200><0.565864,0.035000,0.203200> rotate<0,67.495554,0> translate<36.775850,0.000000,33.834922> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.818816,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.120116,0.000000,33.731200>}
box{<0,0,-0.203200><0.301300,0.035000,0.203200> rotate<0,0.000000,0> translate<36.818816,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.839688,0.000000,22.319197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.992397,0.000000,22.687866>}
box{<0,0,-0.203200><0.399045,0.035000,0.203200> rotate<0,-67.495309,0> translate<36.839688,0.000000,22.319197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.839688,0.000000,22.319197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.594994,0.000000,22.319197>}
box{<0,0,-0.203200><13.755306,0.035000,0.203200> rotate<0,0.000000,0> translate<36.839688,0.000000,22.319197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.853275,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.627797,0.000000,22.352000>}
box{<0,0,-0.203200><13.774522,0.035000,0.203200> rotate<0,0.000000,0> translate<36.853275,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.860900,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.249772,0.000000,24.790400>}
box{<0,0,-0.203200><2.388872,0.035000,0.203200> rotate<0,0.000000,0> translate<36.860900,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.895359,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.768594,0.000000,31.292800>}
box{<0,0,-0.203200><3.873234,0.035000,0.203200> rotate<0,0.000000,0> translate<36.895359,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.987150,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.563622,0.000000,33.324800>}
box{<0,0,-0.203200><2.576472,0.035000,0.203200> rotate<0,0.000000,0> translate<36.987150,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.992397,0.000000,22.687866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.992397,0.000000,24.472931>}
box{<0,0,-0.203200><1.785066,0.035000,0.203200> rotate<0,90.000000,0> translate<36.992397,0.000000,24.472931> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.992397,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.034197,0.000000,22.758400>}
box{<0,0,-0.203200><14.041800,0.035000,0.203200> rotate<0,0.000000,0> translate<36.992397,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.992397,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.440597,0.000000,23.164800>}
box{<0,0,-0.203200><14.448200,0.035000,0.203200> rotate<0,0.000000,0> translate<36.992397,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.992397,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.680800,0.000000,23.571200>}
box{<0,0,-0.203200><14.688403,0.035000,0.203200> rotate<0,0.000000,0> translate<36.992397,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.992397,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.883003,0.000000,23.977600>}
box{<0,0,-0.203200><2.890606,0.035000,0.203200> rotate<0,0.000000,0> translate<36.992397,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.992397,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.476603,0.000000,24.384000>}
box{<0,0,-0.203200><2.484206,0.035000,0.203200> rotate<0,0.000000,0> translate<36.992397,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.992397,0.000000,31.527066>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.992397,0.000000,33.312131>}
box{<0,0,-0.203200><1.785066,0.035000,0.203200> rotate<0,90.000000,0> translate<36.992397,0.000000,33.312131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.992397,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.174994,0.000000,31.699200>}
box{<0,0,-0.203200><4.182597,0.035000,0.203200> rotate<0,0.000000,0> translate<36.992397,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.992397,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.581394,0.000000,32.105600>}
box{<0,0,-0.203200><4.588997,0.035000,0.203200> rotate<0,0.000000,0> translate<36.992397,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.992397,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.987794,0.000000,32.512000>}
box{<0,0,-0.203200><4.995397,0.035000,0.203200> rotate<0,0.000000,0> translate<36.992397,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.992397,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.394194,0.000000,32.918400>}
box{<0,0,-0.203200><5.401797,0.035000,0.203200> rotate<0,0.000000,0> translate<36.992397,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.388116,0.000000,33.463200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.829981,0.000000,33.463200>}
box{<0,0,-0.203200><0.441866,0.035000,0.203200> rotate<0,0.000000,0> translate<37.388116,0.000000,33.463200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.388116,0.000000,35.596797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.829981,0.000000,35.596797>}
box{<0,0,-0.203200><0.441866,0.035000,0.203200> rotate<0,0.000000,0> translate<37.388116,0.000000,35.596797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.829966,0.000000,34.530013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.829966,0.000000,34.529981>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,-90.000000,0> translate<37.829966,0.000000,34.529981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.829981,0.000000,33.463200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.829981,0.000000,34.529966>}
box{<0,0,-0.203200><1.066766,0.035000,0.203200> rotate<0,90.000000,0> translate<37.829981,0.000000,34.529966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.829981,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.830013,0.000000,33.731200>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<37.829981,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.829981,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.830013,0.000000,34.137600>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<37.829981,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.829981,0.000000,34.529966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.830013,0.000000,34.529966>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<37.829981,0.000000,34.529966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.829981,0.000000,34.530031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.829981,0.000000,35.596797>}
box{<0,0,-0.203200><1.066766,0.035000,0.203200> rotate<0,90.000000,0> translate<37.829981,0.000000,35.596797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.829981,0.000000,34.530031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.830013,0.000000,34.530031>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<37.829981,0.000000,34.530031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.829981,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.830013,0.000000,34.544000>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<37.829981,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.829981,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.830013,0.000000,34.950400>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<37.829981,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.829981,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.830013,0.000000,35.356800>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<37.829981,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.830013,0.000000,33.463200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.271881,0.000000,33.463200>}
box{<0,0,-0.203200><0.441869,0.035000,0.203200> rotate<0,0.000000,0> translate<37.830013,0.000000,33.463200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.830013,0.000000,34.529966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.830013,0.000000,33.463200>}
box{<0,0,-0.203200><1.066766,0.035000,0.203200> rotate<0,-90.000000,0> translate<37.830013,0.000000,33.463200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.830013,0.000000,35.596794>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.830013,0.000000,34.530031>}
box{<0,0,-0.203200><1.066763,0.035000,0.203200> rotate<0,-90.000000,0> translate<37.830013,0.000000,34.530031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.830013,0.000000,35.596794>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.271881,0.000000,35.596797>}
box{<0,0,-0.203200><0.441869,0.035000,0.203200> rotate<0,-0.000405,0> translate<37.830013,0.000000,35.596794> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.830031,0.000000,34.529981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.830031,0.000000,34.530013>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,90.000000,0> translate<37.830031,0.000000,34.530013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.830031,0.000000,34.529981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.896797,0.000000,34.529981>}
box{<0,0,-0.203200><1.066766,0.035000,0.203200> rotate<0,0.000000,0> translate<37.830031,0.000000,34.529981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.830031,0.000000,34.530013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.896797,0.000000,34.530013>}
box{<0,0,-0.203200><1.066766,0.035000,0.203200> rotate<0,0.000000,0> translate<37.830031,0.000000,34.530013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.271881,0.000000,33.463200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.896797,0.000000,34.088116>}
box{<0,0,-0.203200><0.883764,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.271881,0.000000,33.463200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.271881,0.000000,35.596797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.896797,0.000000,34.971881>}
box{<0,0,-0.203200><0.883764,0.035000,0.203200> rotate<0,44.997030,0> translate<38.271881,0.000000,35.596797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.511878,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.185228,0.000000,35.356800>}
box{<0,0,-0.203200><0.673350,0.035000,0.203200> rotate<0,0.000000,0> translate<38.511878,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.539881,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.157222,0.000000,33.731200>}
box{<0,0,-0.203200><0.617341,0.035000,0.203200> rotate<0,0.000000,0> translate<38.539881,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.896797,0.000000,34.088116>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.896797,0.000000,34.529981>}
box{<0,0,-0.203200><0.441866,0.035000,0.203200> rotate<0,90.000000,0> translate<38.896797,0.000000,34.529981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.896797,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.947600,0.000000,34.137600>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<38.896797,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.896797,0.000000,34.530013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.896797,0.000000,34.971881>}
box{<0,0,-0.203200><0.441869,0.035000,0.203200> rotate<0,90.000000,0> translate<38.896797,0.000000,34.971881> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.896797,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.947600,0.000000,34.544000>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<38.896797,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.896797,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.947600,0.000000,34.950400>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<38.896797,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.947600,0.000000,33.940822>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.780822,0.000000,33.107600>}
box{<0,0,-0.203200><1.178354,0.035000,0.203200> rotate<0,44.997030,0> translate<38.947600,0.000000,33.940822> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.947600,0.000000,35.119175>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.947600,0.000000,33.940822>}
box{<0,0,-0.203200><1.178353,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.947600,0.000000,33.940822> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.947600,0.000000,35.119175>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.628425,0.000000,35.799997>}
box{<0,0,-0.203200><0.962830,0.035000,0.203200> rotate<0,-44.996899,0> translate<38.947600,0.000000,35.119175> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.947600,0.000000,36.480822>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.628425,0.000000,35.799997>}
box{<0,0,-0.203200><0.962832,0.035000,0.203200> rotate<0,44.997030,0> translate<38.947600,0.000000,36.480822> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.947600,0.000000,37.659175>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.947600,0.000000,36.480822>}
box{<0,0,-0.203200><1.178353,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.947600,0.000000,36.480822> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.947600,0.000000,37.659175>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.780822,0.000000,38.492397>}
box{<0,0,-0.203200><1.178354,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.947600,0.000000,37.659175> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.102200,0.000000,12.954678>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.376750,0.000000,12.291853>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,67.495627,0> translate<39.102200,0.000000,12.954678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.102200,0.000000,15.653319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.102200,0.000000,12.954678>}
box{<0,0,-0.203200><2.698641,0.035000,0.203200> rotate<0,-90.000000,0> translate<39.102200,0.000000,12.954678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.102200,0.000000,15.653319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.376750,0.000000,16.316144>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,-67.495627,0> translate<39.102200,0.000000,15.653319> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.102200,0.000000,25.146678>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.376750,0.000000,24.483853>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,67.495627,0> translate<39.102200,0.000000,25.146678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.102200,0.000000,27.845319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.102200,0.000000,25.146678>}
box{<0,0,-0.203200><2.698641,0.035000,0.203200> rotate<0,-90.000000,0> translate<39.102200,0.000000,25.146678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.102200,0.000000,27.845319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.376750,0.000000,28.508144>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,-67.495627,0> translate<39.102200,0.000000,27.845319> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.376750,0.000000,12.291853>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.884053,0.000000,11.784550>}
box{<0,0,-0.203200><0.717435,0.035000,0.203200> rotate<0,44.997030,0> translate<39.376750,0.000000,12.291853> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.376750,0.000000,16.316144>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.884053,0.000000,16.823447>}
box{<0,0,-0.203200><0.717435,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.376750,0.000000,16.316144> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.376750,0.000000,24.483853>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.884053,0.000000,23.976550>}
box{<0,0,-0.203200><0.717435,0.035000,0.203200> rotate<0,44.997030,0> translate<39.376750,0.000000,24.483853> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.376750,0.000000,28.508144>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.780800,0.000000,28.912194>}
box{<0,0,-0.203200><0.571413,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.376750,0.000000,28.508144> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.780800,0.000000,30.042513>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.780800,0.000000,28.912194>}
box{<0,0,-0.203200><1.130319,0.035000,0.203200> rotate<0,-90.000000,0> translate<39.780800,0.000000,28.912194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.780800,0.000000,30.042513>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.966413,0.000000,30.490619>}
box{<0,0,-0.203200><0.485027,0.035000,0.203200> rotate<0,-67.495456,0> translate<39.780800,0.000000,30.042513> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.780822,0.000000,33.107600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.959175,0.000000,33.107600>}
box{<0,0,-0.203200><1.178353,0.035000,0.203200> rotate<0,0.000000,0> translate<39.780822,0.000000,33.107600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.780822,0.000000,38.492397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.959175,0.000000,38.492397>}
box{<0,0,-0.203200><1.178353,0.035000,0.203200> rotate<0,0.000000,0> translate<39.780822,0.000000,38.492397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.884053,0.000000,11.784550>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.546878,0.000000,11.510000>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,22.498434,0> translate<39.884053,0.000000,11.784550> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.884053,0.000000,16.823447>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.546878,0.000000,17.097997>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,-22.498434,0> translate<39.884053,0.000000,16.823447> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.884053,0.000000,23.976550>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.546878,0.000000,23.702000>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,22.498434,0> translate<39.884053,0.000000,23.976550> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.966413,0.000000,30.490619>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.412200,0.000000,32.936406>}
box{<0,0,-0.203200><3.458866,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.966413,0.000000,30.490619> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.016600,0.000000,4.585678>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.291150,0.000000,3.922853>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,67.495627,0> translate<40.016600,0.000000,4.585678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.016600,0.000000,7.284319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.016600,0.000000,4.585678>}
box{<0,0,-0.203200><2.698641,0.035000,0.203200> rotate<0,-90.000000,0> translate<40.016600,0.000000,4.585678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.016600,0.000000,7.284319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.291150,0.000000,7.947144>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,-67.495627,0> translate<40.016600,0.000000,7.284319> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.291150,0.000000,3.922853>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.798453,0.000000,3.415550>}
box{<0,0,-0.203200><0.717435,0.035000,0.203200> rotate<0,44.997030,0> translate<40.291150,0.000000,3.922853> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.291150,0.000000,7.947144>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.798453,0.000000,8.454447>}
box{<0,0,-0.203200><0.717435,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.291150,0.000000,7.947144> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.546878,0.000000,11.510000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.264319,0.000000,11.510000>}
box{<0,0,-0.203200><0.717441,0.035000,0.203200> rotate<0,0.000000,0> translate<40.546878,0.000000,11.510000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.546878,0.000000,17.097997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.264319,0.000000,17.097997>}
box{<0,0,-0.203200><0.717441,0.035000,0.203200> rotate<0,0.000000,0> translate<40.546878,0.000000,17.097997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.546878,0.000000,23.702000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.264319,0.000000,23.702000>}
box{<0,0,-0.203200><0.717441,0.035000,0.203200> rotate<0,0.000000,0> translate<40.546878,0.000000,23.702000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.798453,0.000000,3.415550>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.461278,0.000000,3.141000>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,22.498434,0> translate<40.798453,0.000000,3.415550> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.798453,0.000000,8.454447>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.461278,0.000000,8.728997>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,-22.498434,0> translate<40.798453,0.000000,8.454447> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.959175,0.000000,33.107600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.792397,0.000000,33.940822>}
box{<0,0,-0.203200><1.178354,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.959175,0.000000,33.107600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.959175,0.000000,38.492397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.365575,0.000000,38.085997>}
box{<0,0,-0.203200><0.574736,0.035000,0.203200> rotate<0,44.997030,0> translate<40.959175,0.000000,38.492397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.111572,0.000000,35.799997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.365575,0.000000,36.054000>}
box{<0,0,-0.203200><0.359215,0.035000,0.203200> rotate<0,-44.997030,0> translate<41.111572,0.000000,35.799997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.111572,0.000000,35.799997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.792397,0.000000,35.119175>}
box{<0,0,-0.203200><0.962830,0.035000,0.203200> rotate<0,44.996899,0> translate<41.111572,0.000000,35.799997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.148372,0.000000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.495675,0.000000,35.763200>}
box{<0,0,-0.203200><1.347303,0.035000,0.203200> rotate<0,0.000000,0> translate<41.148372,0.000000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.176375,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.412200,0.000000,33.324800>}
box{<0,0,-0.203200><1.235825,0.035000,0.203200> rotate<0,0.000000,0> translate<41.176375,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.249972,0.000000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,38.201600>}
box{<0,0,-0.203200><14.887228,0.035000,0.203200> rotate<0,0.000000,0> translate<41.249972,0.000000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.264319,0.000000,11.510000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.927144,0.000000,11.784550>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,-22.498434,0> translate<41.264319,0.000000,11.510000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.264319,0.000000,17.097997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.927144,0.000000,16.823447>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,22.498434,0> translate<41.264319,0.000000,17.097997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.264319,0.000000,23.702000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.927144,0.000000,23.976550>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,-22.498434,0> translate<41.264319,0.000000,23.702000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.334809,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.465191,0.000000,17.068800>}
box{<0,0,-0.203200><11.130381,0.035000,0.203200> rotate<0,0.000000,0> translate<41.334809,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.365575,0.000000,36.054000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.729531,0.000000,36.054000>}
box{<0,0,-0.203200><1.363956,0.035000,0.203200> rotate<0,0.000000,0> translate<41.365575,0.000000,36.054000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.365575,0.000000,38.085997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.032094,0.000000,38.085997>}
box{<0,0,-0.203200><2.666519,0.035000,0.203200> rotate<0,0.000000,0> translate<41.365575,0.000000,38.085997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.461278,0.000000,3.141000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.178719,0.000000,3.141000>}
box{<0,0,-0.203200><0.717441,0.035000,0.203200> rotate<0,0.000000,0> translate<41.461278,0.000000,3.141000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.461278,0.000000,8.728997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.178719,0.000000,8.728997>}
box{<0,0,-0.203200><0.717441,0.035000,0.203200> rotate<0,0.000000,0> translate<41.461278,0.000000,8.728997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.554772,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.412200,0.000000,35.356800>}
box{<0,0,-0.203200><0.857428,0.035000,0.203200> rotate<0,0.000000,0> translate<41.554772,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.582775,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.412200,0.000000,33.731200>}
box{<0,0,-0.203200><0.829425,0.035000,0.203200> rotate<0,0.000000,0> translate<41.582775,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.792397,0.000000,33.940822>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.792397,0.000000,35.119175>}
box{<0,0,-0.203200><1.178353,0.035000,0.203200> rotate<0,90.000000,0> translate<41.792397,0.000000,35.119175> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.792397,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.412200,0.000000,34.137600>}
box{<0,0,-0.203200><0.619803,0.035000,0.203200> rotate<0,0.000000,0> translate<41.792397,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.792397,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.412200,0.000000,34.544000>}
box{<0,0,-0.203200><0.619803,0.035000,0.203200> rotate<0,0.000000,0> translate<41.792397,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.792397,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.412200,0.000000,34.950400>}
box{<0,0,-0.203200><0.619803,0.035000,0.203200> rotate<0,0.000000,0> translate<41.792397,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.927144,0.000000,11.784550>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.434447,0.000000,12.291853>}
box{<0,0,-0.203200><0.717435,0.035000,0.203200> rotate<0,-44.997030,0> translate<41.927144,0.000000,11.784550> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.927144,0.000000,16.823447>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.434447,0.000000,16.316144>}
box{<0,0,-0.203200><0.717435,0.035000,0.203200> rotate<0,44.997030,0> translate<41.927144,0.000000,16.823447> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.927144,0.000000,23.976550>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.434447,0.000000,24.483853>}
box{<0,0,-0.203200><0.717435,0.035000,0.203200> rotate<0,-44.997030,0> translate<41.927144,0.000000,23.976550> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.928194,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.871803,0.000000,11.785600>}
box{<0,0,-0.203200><9.943609,0.035000,0.203200> rotate<0,0.000000,0> translate<41.928194,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.928194,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.680800,0.000000,23.977600>}
box{<0,0,-0.203200><9.752606,0.035000,0.203200> rotate<0,0.000000,0> translate<41.928194,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.088191,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.711806,0.000000,16.662400>}
box{<0,0,-0.203200><9.623616,0.035000,0.203200> rotate<0,0.000000,0> translate<42.088191,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.178719,0.000000,3.141000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.841544,0.000000,3.415550>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,-22.498434,0> translate<42.178719,0.000000,3.141000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.178719,0.000000,8.728997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.841544,0.000000,8.454447>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,22.498434,0> translate<42.178719,0.000000,8.728997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.219197,0.000000,28.723394>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.219197,0.000000,29.294991>}
box{<0,0,-0.203200><0.571597,0.035000,0.203200> rotate<0,90.000000,0> translate<42.219197,0.000000,29.294991> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.219197,0.000000,28.723394>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.434447,0.000000,28.508144>}
box{<0,0,-0.203200><0.304409,0.035000,0.203200> rotate<0,44.997030,0> translate<42.219197,0.000000,28.723394> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.219197,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.734650,0.000000,28.854400>}
box{<0,0,-0.203200><2.515453,0.035000,0.203200> rotate<0,0.000000,0> translate<42.219197,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.219197,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.734650,0.000000,29.260800>}
box{<0,0,-0.203200><2.515453,0.035000,0.203200> rotate<0,0.000000,0> translate<42.219197,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.219197,0.000000,29.294991>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.511406,0.000000,31.587200>}
box{<0,0,-0.203200><3.241674,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.219197,0.000000,29.294991> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.334594,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.465403,0.000000,12.192000>}
box{<0,0,-0.203200><9.130809,0.035000,0.203200> rotate<0,0.000000,0> translate<42.334594,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.334594,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.465403,0.000000,24.384000>}
box{<0,0,-0.203200><9.130809,0.035000,0.203200> rotate<0,0.000000,0> translate<42.334594,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.412200,0.000000,35.561675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.412200,0.000000,32.936406>}
box{<0,0,-0.203200><2.625269,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.412200,0.000000,32.936406> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.412200,0.000000,35.561675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.535941,0.000000,35.860413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<42.412200,0.000000,35.561675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.434447,0.000000,12.291853>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.708997,0.000000,12.954678>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,-67.495627,0> translate<42.434447,0.000000,12.291853> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.434447,0.000000,16.316144>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.708997,0.000000,15.653319>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,67.495627,0> translate<42.434447,0.000000,16.316144> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.434447,0.000000,24.483853>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.708997,0.000000,25.146678>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,-67.495627,0> translate<42.434447,0.000000,24.483853> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.434447,0.000000,28.508144>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.708997,0.000000,27.845319>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,67.495627,0> translate<42.434447,0.000000,28.508144> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.444766,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.275228,0.000000,3.251200>}
box{<0,0,-0.203200><3.830463,0.035000,0.203200> rotate<0,0.000000,0> translate<42.444766,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.459359,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.340641,0.000000,16.256000>}
box{<0,0,-0.203200><8.881281,0.035000,0.203200> rotate<0,0.000000,0> translate<42.459359,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.459359,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.734650,0.000000,28.448000>}
box{<0,0,-0.203200><2.275291,0.035000,0.203200> rotate<0,0.000000,0> translate<42.459359,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.535941,0.000000,35.860413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.729531,0.000000,36.054000>}
box{<0,0,-0.203200><0.273776,0.035000,0.203200> rotate<0,-44.996568,0> translate<42.535941,0.000000,35.860413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.561422,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.238572,0.000000,12.598400>}
box{<0,0,-0.203200><8.677150,0.035000,0.203200> rotate<0,0.000000,0> translate<42.561422,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.561422,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.238572,0.000000,24.790400>}
box{<0,0,-0.203200><8.677150,0.035000,0.203200> rotate<0,0.000000,0> translate<42.561422,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.591406,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.734650,0.000000,29.667200>}
box{<0,0,-0.203200><2.143244,0.035000,0.203200> rotate<0,0.000000,0> translate<42.591406,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.627697,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.172303,0.000000,15.849600>}
box{<0,0,-0.203200><8.544606,0.035000,0.203200> rotate<0,0.000000,0> translate<42.627697,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.627697,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.734650,0.000000,28.041600>}
box{<0,0,-0.203200><2.106953,0.035000,0.203200> rotate<0,0.000000,0> translate<42.627697,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.648522,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.071478,0.000000,8.534400>}
box{<0,0,-0.203200><3.422956,0.035000,0.203200> rotate<0,0.000000,0> translate<42.648522,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.708997,0.000000,12.954678>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.708997,0.000000,15.653319>}
box{<0,0,-0.203200><2.698641,0.035000,0.203200> rotate<0,90.000000,0> translate<42.708997,0.000000,15.653319> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.708997,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.091000,0.000000,13.004800>}
box{<0,0,-0.203200><8.382003,0.035000,0.203200> rotate<0,0.000000,0> translate<42.708997,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.708997,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.091000,0.000000,13.411200>}
box{<0,0,-0.203200><8.382003,0.035000,0.203200> rotate<0,0.000000,0> translate<42.708997,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.708997,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.091000,0.000000,13.817600>}
box{<0,0,-0.203200><8.382003,0.035000,0.203200> rotate<0,0.000000,0> translate<42.708997,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.708997,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.091000,0.000000,14.224000>}
box{<0,0,-0.203200><8.382003,0.035000,0.203200> rotate<0,0.000000,0> translate<42.708997,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.708997,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.091000,0.000000,14.630400>}
box{<0,0,-0.203200><8.382003,0.035000,0.203200> rotate<0,0.000000,0> translate<42.708997,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.708997,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.091000,0.000000,15.036800>}
box{<0,0,-0.203200><8.382003,0.035000,0.203200> rotate<0,0.000000,0> translate<42.708997,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.708997,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.091000,0.000000,15.443200>}
box{<0,0,-0.203200><8.382003,0.035000,0.203200> rotate<0,0.000000,0> translate<42.708997,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.708997,0.000000,25.146678>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.708997,0.000000,27.845319>}
box{<0,0,-0.203200><2.698641,0.035000,0.203200> rotate<0,90.000000,0> translate<42.708997,0.000000,27.845319> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.708997,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.202509,0.000000,25.196800>}
box{<0,0,-0.203200><3.493513,0.035000,0.203200> rotate<0,0.000000,0> translate<42.708997,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.708997,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.486178,0.000000,25.603200>}
box{<0,0,-0.203200><2.777181,0.035000,0.203200> rotate<0,0.000000,0> translate<42.708997,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.708997,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.079778,0.000000,26.009600>}
box{<0,0,-0.203200><2.370781,0.035000,0.203200> rotate<0,0.000000,0> translate<42.708997,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.708997,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.902375,0.000000,26.416000>}
box{<0,0,-0.203200><2.193378,0.035000,0.203200> rotate<0,0.000000,0> translate<42.708997,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.708997,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.734650,0.000000,26.822400>}
box{<0,0,-0.203200><2.025653,0.035000,0.203200> rotate<0,0.000000,0> translate<42.708997,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.708997,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.734650,0.000000,27.228800>}
box{<0,0,-0.203200><2.025653,0.035000,0.203200> rotate<0,0.000000,0> translate<42.708997,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.708997,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.734650,0.000000,27.635200>}
box{<0,0,-0.203200><2.025653,0.035000,0.203200> rotate<0,0.000000,0> translate<42.708997,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.841544,0.000000,3.415550>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.348847,0.000000,3.922853>}
box{<0,0,-0.203200><0.717435,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.841544,0.000000,3.415550> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.841544,0.000000,8.454447>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.348847,0.000000,7.947144>}
box{<0,0,-0.203200><0.717435,0.035000,0.203200> rotate<0,44.997030,0> translate<42.841544,0.000000,8.454447> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.997806,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.734650,0.000000,30.073600>}
box{<0,0,-0.203200><1.736844,0.035000,0.203200> rotate<0,0.000000,0> translate<42.997806,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.083594,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.636403,0.000000,3.657600>}
box{<0,0,-0.203200><2.552809,0.035000,0.203200> rotate<0,0.000000,0> translate<43.083594,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.167991,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.552006,0.000000,8.128000>}
box{<0,0,-0.203200><2.384016,0.035000,0.203200> rotate<0,0.000000,0> translate<43.167991,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.348847,0.000000,3.922853>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.623397,0.000000,4.585678>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,-67.495627,0> translate<43.348847,0.000000,3.922853> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.348847,0.000000,7.947144>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.623397,0.000000,7.284319>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,67.495627,0> translate<43.348847,0.000000,7.947144> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.404206,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.772981,0.000000,30.480000>}
box{<0,0,-0.203200><1.368775,0.035000,0.203200> rotate<0,0.000000,0> translate<43.404206,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.407309,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.312684,0.000000,4.064000>}
box{<0,0,-0.203200><1.905375,0.035000,0.203200> rotate<0,0.000000,0> translate<43.407309,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.442272,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.277728,0.000000,7.721600>}
box{<0,0,-0.203200><1.835456,0.035000,0.203200> rotate<0,0.000000,0> translate<43.442272,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.575647,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.144347,0.000000,4.470400>}
box{<0,0,-0.203200><1.568700,0.035000,0.203200> rotate<0,0.000000,0> translate<43.575647,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.610606,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.109394,0.000000,7.315200>}
box{<0,0,-0.203200><1.498787,0.035000,0.203200> rotate<0,0.000000,0> translate<43.610606,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.623397,0.000000,4.585678>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.623397,0.000000,7.284319>}
box{<0,0,-0.203200><2.698641,0.035000,0.203200> rotate<0,90.000000,0> translate<43.623397,0.000000,7.284319> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.623397,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.096600,0.000000,4.876800>}
box{<0,0,-0.203200><1.473203,0.035000,0.203200> rotate<0,0.000000,0> translate<43.623397,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.623397,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.096600,0.000000,5.283200>}
box{<0,0,-0.203200><1.473203,0.035000,0.203200> rotate<0,0.000000,0> translate<43.623397,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.623397,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.096600,0.000000,5.689600>}
box{<0,0,-0.203200><1.473203,0.035000,0.203200> rotate<0,0.000000,0> translate<43.623397,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.623397,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.096600,0.000000,6.096000>}
box{<0,0,-0.203200><1.473203,0.035000,0.203200> rotate<0,0.000000,0> translate<43.623397,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.623397,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.096600,0.000000,6.502400>}
box{<0,0,-0.203200><1.473203,0.035000,0.203200> rotate<0,0.000000,0> translate<43.623397,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.623397,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.096600,0.000000,6.908800>}
box{<0,0,-0.203200><1.473203,0.035000,0.203200> rotate<0,0.000000,0> translate<43.623397,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.810606,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.941316,0.000000,30.886400>}
box{<0,0,-0.203200><1.130709,0.035000,0.203200> rotate<0,0.000000,0> translate<43.810606,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.032094,0.000000,38.085997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.405516,0.000000,37.931322>}
box{<0,0,-0.203200><0.404188,0.035000,0.203200> rotate<0,22.498331,0> translate<44.032094,0.000000,38.085997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.217006,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.173784,0.000000,31.292800>}
box{<0,0,-0.203200><0.956778,0.035000,0.203200> rotate<0,0.000000,0> translate<44.217006,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.405516,0.000000,37.931322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.075516,0.000000,37.261322>}
box{<0,0,-0.203200><0.947523,0.035000,0.203200> rotate<0,44.997030,0> translate<44.405516,0.000000,37.931322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.511406,0.000000,31.587200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.468184,0.000000,31.587200>}
box{<0,0,-0.203200><0.956778,0.035000,0.203200> rotate<0,0.000000,0> translate<44.511406,0.000000,31.587200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.541638,0.000000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,37.795200>}
box{<0,0,-0.203200><11.595562,0.035000,0.203200> rotate<0,0.000000,0> translate<44.541638,0.000000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.734650,0.000000,26.820931>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.064303,0.000000,26.025075>}
box{<0,0,-0.203200><0.861428,0.035000,0.203200> rotate<0,67.495627,0> translate<44.734650,0.000000,26.820931> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.734650,0.000000,30.387466>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.734650,0.000000,26.820931>}
box{<0,0,-0.203200><3.566534,0.035000,0.203200> rotate<0,-90.000000,0> translate<44.734650,0.000000,26.820931> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.734650,0.000000,30.387466>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.064303,0.000000,31.183322>}
box{<0,0,-0.203200><0.861428,0.035000,0.203200> rotate<0,-67.495627,0> translate<44.734650,0.000000,30.387466> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.948038,0.000000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,37.388800>}
box{<0,0,-0.203200><11.189162,0.035000,0.203200> rotate<0,0.000000,0> translate<44.948038,0.000000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.064303,0.000000,26.025075>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.673425,0.000000,25.415953>}
box{<0,0,-0.203200><0.861428,0.035000,0.203200> rotate<0,44.997030,0> translate<45.064303,0.000000,26.025075> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.064303,0.000000,31.183322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.468184,0.000000,31.587200>}
box{<0,0,-0.203200><0.571172,0.035000,0.203200> rotate<0,-44.996809,0> translate<45.064303,0.000000,31.183322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.075516,0.000000,37.261322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.361322,0.000000,36.975516>}
box{<0,0,-0.203200><0.404191,0.035000,0.203200> rotate<0,44.997030,0> translate<45.075516,0.000000,37.261322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.096600,0.000000,4.585678>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.371150,0.000000,3.922853>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,67.495627,0> translate<45.096600,0.000000,4.585678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.096600,0.000000,7.284319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.096600,0.000000,4.585678>}
box{<0,0,-0.203200><2.698641,0.035000,0.203200> rotate<0,-90.000000,0> translate<45.096600,0.000000,4.585678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.096600,0.000000,7.284319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.371150,0.000000,7.947144>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,-67.495627,0> translate<45.096600,0.000000,7.284319> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.354438,0.000000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,36.982400>}
box{<0,0,-0.203200><10.782762,0.035000,0.203200> rotate<0,0.000000,0> translate<45.354438,0.000000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.361322,0.000000,36.975516>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.515997,0.000000,36.602094>}
box{<0,0,-0.203200><0.404188,0.035000,0.203200> rotate<0,67.495729,0> translate<45.361322,0.000000,36.975516> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.371150,0.000000,3.922853>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.878453,0.000000,3.415550>}
box{<0,0,-0.203200><0.717435,0.035000,0.203200> rotate<0,44.997030,0> translate<45.371150,0.000000,3.922853> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.371150,0.000000,7.947144>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.878453,0.000000,8.454447>}
box{<0,0,-0.203200><0.717435,0.035000,0.203200> rotate<0,-44.997030,0> translate<45.371150,0.000000,7.947144> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.515997,0.000000,36.212797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.515997,0.000000,36.602094>}
box{<0,0,-0.203200><0.389297,0.035000,0.203200> rotate<0,90.000000,0> translate<45.515997,0.000000,36.602094> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.515997,0.000000,36.212797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.886675,0.000000,36.212797>}
box{<0,0,-0.203200><0.370678,0.035000,0.203200> rotate<0,0.000000,0> translate<45.515997,0.000000,36.212797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.515997,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,36.576000>}
box{<0,0,-0.203200><10.621203,0.035000,0.203200> rotate<0,0.000000,0> translate<45.515997,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.673425,0.000000,25.415953>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.469281,0.000000,25.086300>}
box{<0,0,-0.203200><0.861428,0.035000,0.203200> rotate<0,22.498434,0> translate<45.673425,0.000000,25.415953> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.878453,0.000000,3.415550>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.541278,0.000000,3.141000>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,22.498434,0> translate<45.878453,0.000000,3.415550> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.878453,0.000000,8.454447>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.541278,0.000000,8.728997>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,-22.498434,0> translate<45.878453,0.000000,8.454447> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.886675,0.000000,36.212797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.185413,0.000000,36.089056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<45.886675,0.000000,36.212797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.990963,0.000000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.209038,0.000000,36.169600>}
box{<0,0,-0.203200><2.218075,0.035000,0.203200> rotate<0,0.000000,0> translate<45.990963,0.000000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.185413,0.000000,36.089056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.414056,0.000000,35.860413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<46.185413,0.000000,36.089056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.414056,0.000000,35.860413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.537797,0.000000,35.561675>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<46.414056,0.000000,35.860413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.454325,0.000000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.745675,0.000000,35.763200>}
box{<0,0,-0.203200><1.291350,0.035000,0.203200> rotate<0,0.000000,0> translate<46.454325,0.000000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.469281,0.000000,25.086300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.330716,0.000000,25.086300>}
box{<0,0,-0.203200><0.861434,0.035000,0.203200> rotate<0,0.000000,0> translate<46.469281,0.000000,25.086300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.489653,0.000000,32.122097>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.537797,0.000000,32.238322>}
box{<0,0,-0.203200><0.125802,0.035000,0.203200> rotate<0,-67.494797,0> translate<46.489653,0.000000,32.122097> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.489653,0.000000,32.122097>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.330716,0.000000,32.122097>}
box{<0,0,-0.203200><0.841062,0.035000,0.203200> rotate<0,0.000000,0> translate<46.489653,0.000000,32.122097> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.537797,0.000000,32.238322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.537797,0.000000,35.561675>}
box{<0,0,-0.203200><3.323353,0.035000,0.203200> rotate<0,90.000000,0> translate<46.537797,0.000000,35.561675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.537797,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.662200,0.000000,32.512000>}
box{<0,0,-0.203200><1.124403,0.035000,0.203200> rotate<0,0.000000,0> translate<46.537797,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.537797,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.662200,0.000000,32.918400>}
box{<0,0,-0.203200><1.124403,0.035000,0.203200> rotate<0,0.000000,0> translate<46.537797,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.537797,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.662200,0.000000,33.324800>}
box{<0,0,-0.203200><1.124403,0.035000,0.203200> rotate<0,0.000000,0> translate<46.537797,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.537797,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.662200,0.000000,33.731200>}
box{<0,0,-0.203200><1.124403,0.035000,0.203200> rotate<0,0.000000,0> translate<46.537797,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.537797,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.662200,0.000000,34.137600>}
box{<0,0,-0.203200><1.124403,0.035000,0.203200> rotate<0,0.000000,0> translate<46.537797,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.537797,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.662200,0.000000,34.544000>}
box{<0,0,-0.203200><1.124403,0.035000,0.203200> rotate<0,0.000000,0> translate<46.537797,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.537797,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.662200,0.000000,34.950400>}
box{<0,0,-0.203200><1.124403,0.035000,0.203200> rotate<0,0.000000,0> translate<46.537797,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.537797,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.662200,0.000000,35.356800>}
box{<0,0,-0.203200><1.124403,0.035000,0.203200> rotate<0,0.000000,0> translate<46.537797,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.541278,0.000000,3.141000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.258719,0.000000,3.141000>}
box{<0,0,-0.203200><0.717441,0.035000,0.203200> rotate<0,0.000000,0> translate<46.541278,0.000000,3.141000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.541278,0.000000,8.728997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.258719,0.000000,8.728997>}
box{<0,0,-0.203200><0.717441,0.035000,0.203200> rotate<0,0.000000,0> translate<46.541278,0.000000,8.728997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.258719,0.000000,3.141000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.921544,0.000000,3.415550>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,-22.498434,0> translate<47.258719,0.000000,3.141000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.258719,0.000000,8.728997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.921544,0.000000,8.454447>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,22.498434,0> translate<47.258719,0.000000,8.728997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.330716,0.000000,25.086300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.126572,0.000000,25.415953>}
box{<0,0,-0.203200><0.861428,0.035000,0.203200> rotate<0,-22.498434,0> translate<47.330716,0.000000,25.086300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.330716,0.000000,32.122097>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.796269,0.000000,31.929259>}
box{<0,0,-0.203200><0.503911,0.035000,0.203200> rotate<0,22.498419,0> translate<47.330716,0.000000,32.122097> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.370544,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.717172,0.000000,32.105600>}
box{<0,0,-0.203200><0.346628,0.035000,0.203200> rotate<0,0.000000,0> translate<47.370544,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.524766,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.355228,0.000000,3.251200>}
box{<0,0,-0.203200><3.830463,0.035000,0.203200> rotate<0,0.000000,0> translate<47.524766,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.597484,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.091000,0.000000,25.196800>}
box{<0,0,-0.203200><3.493516,0.035000,0.203200> rotate<0,0.000000,0> translate<47.597484,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.662200,0.000000,32.238322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.785941,0.000000,31.939584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<47.662200,0.000000,32.238322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.662200,0.000000,35.561675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.662200,0.000000,32.238322>}
box{<0,0,-0.203200><3.323353,0.035000,0.203200> rotate<0,-90.000000,0> translate<47.662200,0.000000,32.238322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.662200,0.000000,35.561675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.785941,0.000000,35.860413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<47.662200,0.000000,35.561675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.728522,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.151478,0.000000,8.534400>}
box{<0,0,-0.203200><3.422956,0.035000,0.203200> rotate<0,0.000000,0> translate<47.728522,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.785941,0.000000,31.939584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.796269,0.000000,31.929259>}
box{<0,0,-0.203200><0.014604,0.035000,0.203200> rotate<0,44.988361,0> translate<47.785941,0.000000,31.939584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.785941,0.000000,35.860413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.014584,0.000000,36.089056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<47.785941,0.000000,35.860413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.921544,0.000000,3.415550>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.428847,0.000000,3.922853>}
box{<0,0,-0.203200><0.717435,0.035000,0.203200> rotate<0,-44.997030,0> translate<47.921544,0.000000,3.415550> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.921544,0.000000,8.454447>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.428847,0.000000,7.947144>}
box{<0,0,-0.203200><0.717435,0.035000,0.203200> rotate<0,44.997030,0> translate<47.921544,0.000000,8.454447> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.014584,0.000000,36.089056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.313322,0.000000,36.212797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<48.014584,0.000000,36.089056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.126572,0.000000,25.415953>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.735694,0.000000,26.025075>}
box{<0,0,-0.203200><0.861428,0.035000,0.203200> rotate<0,-44.997030,0> translate<48.126572,0.000000,25.415953> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.163594,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.716403,0.000000,3.657600>}
box{<0,0,-0.203200><2.552809,0.035000,0.203200> rotate<0,0.000000,0> translate<48.163594,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.247991,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.632006,0.000000,8.128000>}
box{<0,0,-0.203200><2.384016,0.035000,0.203200> rotate<0,0.000000,0> translate<48.247991,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.313322,0.000000,36.212797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.136675,0.000000,36.212797>}
box{<0,0,-0.203200><2.823353,0.035000,0.203200> rotate<0,0.000000,0> translate<48.313322,0.000000,36.212797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.313819,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.091000,0.000000,25.603200>}
box{<0,0,-0.203200><2.777181,0.035000,0.203200> rotate<0,0.000000,0> translate<48.313819,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.331813,0.000000,31.587200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.735694,0.000000,31.183322>}
box{<0,0,-0.203200><0.571172,0.035000,0.203200> rotate<0,44.996809,0> translate<48.331813,0.000000,31.587200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.331813,0.000000,31.587200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.136675,0.000000,31.587200>}
box{<0,0,-0.203200><2.804862,0.035000,0.203200> rotate<0,0.000000,0> translate<48.331813,0.000000,31.587200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.428847,0.000000,3.922853>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.703397,0.000000,4.585678>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,-67.495627,0> translate<48.428847,0.000000,3.922853> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.428847,0.000000,7.947144>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.703397,0.000000,7.284319>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,67.495627,0> translate<48.428847,0.000000,7.947144> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.487309,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.392684,0.000000,4.064000>}
box{<0,0,-0.203200><1.905375,0.035000,0.203200> rotate<0,0.000000,0> translate<48.487309,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.522272,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.357728,0.000000,7.721600>}
box{<0,0,-0.203200><1.835456,0.035000,0.203200> rotate<0,0.000000,0> translate<48.522272,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.626216,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.680800,0.000000,31.292800>}
box{<0,0,-0.203200><3.054584,0.035000,0.203200> rotate<0,0.000000,0> translate<48.626216,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.655647,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.224347,0.000000,4.470400>}
box{<0,0,-0.203200><1.568700,0.035000,0.203200> rotate<0,0.000000,0> translate<48.655647,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.690606,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.189394,0.000000,7.315200>}
box{<0,0,-0.203200><1.498787,0.035000,0.203200> rotate<0,0.000000,0> translate<48.690606,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.703397,0.000000,4.585678>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.703397,0.000000,7.284319>}
box{<0,0,-0.203200><2.698641,0.035000,0.203200> rotate<0,90.000000,0> translate<48.703397,0.000000,7.284319> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.703397,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.176600,0.000000,4.876800>}
box{<0,0,-0.203200><1.473203,0.035000,0.203200> rotate<0,0.000000,0> translate<48.703397,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.703397,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.176600,0.000000,5.283200>}
box{<0,0,-0.203200><1.473203,0.035000,0.203200> rotate<0,0.000000,0> translate<48.703397,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.703397,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.176600,0.000000,5.689600>}
box{<0,0,-0.203200><1.473203,0.035000,0.203200> rotate<0,0.000000,0> translate<48.703397,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.703397,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.176600,0.000000,6.096000>}
box{<0,0,-0.203200><1.473203,0.035000,0.203200> rotate<0,0.000000,0> translate<48.703397,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.703397,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.176600,0.000000,6.502400>}
box{<0,0,-0.203200><1.473203,0.035000,0.203200> rotate<0,0.000000,0> translate<48.703397,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.703397,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.176600,0.000000,6.908800>}
box{<0,0,-0.203200><1.473203,0.035000,0.203200> rotate<0,0.000000,0> translate<48.703397,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.720219,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.091000,0.000000,26.009600>}
box{<0,0,-0.203200><2.370781,0.035000,0.203200> rotate<0,0.000000,0> translate<48.720219,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.735694,0.000000,26.025075>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.065347,0.000000,26.820931>}
box{<0,0,-0.203200><0.861428,0.035000,0.203200> rotate<0,-67.495627,0> translate<48.735694,0.000000,26.025075> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.735694,0.000000,31.183322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.065347,0.000000,30.387466>}
box{<0,0,-0.203200><0.861428,0.035000,0.203200> rotate<0,67.495627,0> translate<48.735694,0.000000,31.183322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.858684,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.680800,0.000000,30.886400>}
box{<0,0,-0.203200><2.822116,0.035000,0.203200> rotate<0,0.000000,0> translate<48.858684,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.897619,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.091000,0.000000,26.416000>}
box{<0,0,-0.203200><2.193381,0.035000,0.203200> rotate<0,0.000000,0> translate<48.897619,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.027019,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.680800,0.000000,30.480000>}
box{<0,0,-0.203200><2.653781,0.035000,0.203200> rotate<0,0.000000,0> translate<49.027019,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.065347,0.000000,26.820931>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.065347,0.000000,30.387466>}
box{<0,0,-0.203200><3.566534,0.035000,0.203200> rotate<0,90.000000,0> translate<49.065347,0.000000,30.387466> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.065347,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.091000,0.000000,26.822400>}
box{<0,0,-0.203200><2.025653,0.035000,0.203200> rotate<0,0.000000,0> translate<49.065347,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.065347,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.091000,0.000000,27.228800>}
box{<0,0,-0.203200><2.025653,0.035000,0.203200> rotate<0,0.000000,0> translate<49.065347,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.065347,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.091000,0.000000,27.635200>}
box{<0,0,-0.203200><2.025653,0.035000,0.203200> rotate<0,0.000000,0> translate<49.065347,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.065347,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.172303,0.000000,28.041600>}
box{<0,0,-0.203200><2.106956,0.035000,0.203200> rotate<0,0.000000,0> translate<49.065347,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.065347,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.340641,0.000000,28.448000>}
box{<0,0,-0.203200><2.275294,0.035000,0.203200> rotate<0,0.000000,0> translate<49.065347,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.065347,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.680800,0.000000,28.854400>}
box{<0,0,-0.203200><2.615453,0.035000,0.203200> rotate<0,0.000000,0> translate<49.065347,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.065347,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.680800,0.000000,29.260800>}
box{<0,0,-0.203200><2.615453,0.035000,0.203200> rotate<0,0.000000,0> translate<49.065347,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.065347,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.680800,0.000000,29.667200>}
box{<0,0,-0.203200><2.615453,0.035000,0.203200> rotate<0,0.000000,0> translate<49.065347,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.065347,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.680800,0.000000,30.073600>}
box{<0,0,-0.203200><2.615453,0.035000,0.203200> rotate<0,0.000000,0> translate<49.065347,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.176600,0.000000,4.585678>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.451150,0.000000,3.922853>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,67.495627,0> translate<50.176600,0.000000,4.585678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.176600,0.000000,7.284319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.176600,0.000000,4.585678>}
box{<0,0,-0.203200><2.698641,0.035000,0.203200> rotate<0,-90.000000,0> translate<50.176600,0.000000,4.585678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.176600,0.000000,7.284319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.451150,0.000000,7.947144>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,-67.495627,0> translate<50.176600,0.000000,7.284319> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.451150,0.000000,3.922853>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.958453,0.000000,3.415550>}
box{<0,0,-0.203200><0.717435,0.035000,0.203200> rotate<0,44.997030,0> translate<50.451150,0.000000,3.922853> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.451150,0.000000,7.947144>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.958453,0.000000,8.454447>}
box{<0,0,-0.203200><0.717435,0.035000,0.203200> rotate<0,-44.997030,0> translate<50.451150,0.000000,7.947144> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.594994,0.000000,22.319197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.680800,0.000000,23.405003>}
box{<0,0,-0.203200><1.535562,0.035000,0.203200> rotate<0,-44.997030,0> translate<50.594994,0.000000,22.319197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.958453,0.000000,3.415550>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.621278,0.000000,3.141000>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,22.498434,0> translate<50.958453,0.000000,3.415550> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.958453,0.000000,8.454447>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.621278,0.000000,8.728997>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,-22.498434,0> translate<50.958453,0.000000,8.454447> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.091000,0.000000,12.954678>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.365550,0.000000,12.291853>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,67.495627,0> translate<51.091000,0.000000,12.954678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.091000,0.000000,15.653319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.091000,0.000000,12.954678>}
box{<0,0,-0.203200><2.698641,0.035000,0.203200> rotate<0,-90.000000,0> translate<51.091000,0.000000,12.954678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.091000,0.000000,15.653319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.365550,0.000000,16.316144>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,-67.495627,0> translate<51.091000,0.000000,15.653319> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.091000,0.000000,25.146678>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.365550,0.000000,24.483853>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,67.495627,0> translate<51.091000,0.000000,25.146678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.091000,0.000000,27.845319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.091000,0.000000,25.146678>}
box{<0,0,-0.203200><2.698641,0.035000,0.203200> rotate<0,-90.000000,0> translate<51.091000,0.000000,25.146678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.091000,0.000000,27.845319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.365550,0.000000,28.508144>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,-67.495627,0> translate<51.091000,0.000000,27.845319> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.136675,0.000000,31.587200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.435413,0.000000,31.710941>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<51.136675,0.000000,31.587200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.136675,0.000000,36.212797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.435413,0.000000,36.089056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<51.136675,0.000000,36.212797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.240963,0.000000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,36.169600>}
box{<0,0,-0.203200><4.896237,0.035000,0.203200> rotate<0,0.000000,0> translate<51.240963,0.000000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.342513,0.000000,19.880800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.790619,0.000000,20.066413>}
box{<0,0,-0.203200><0.485027,0.035000,0.203200> rotate<0,-22.498604,0> translate<51.342513,0.000000,19.880800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.365550,0.000000,12.291853>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.872853,0.000000,11.784550>}
box{<0,0,-0.203200><0.717435,0.035000,0.203200> rotate<0,44.997030,0> translate<51.365550,0.000000,12.291853> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.365550,0.000000,16.316144>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.872853,0.000000,16.823447>}
box{<0,0,-0.203200><0.717435,0.035000,0.203200> rotate<0,-44.997030,0> translate<51.365550,0.000000,16.316144> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.365550,0.000000,24.483853>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.680800,0.000000,24.168603>}
box{<0,0,-0.203200><0.445831,0.035000,0.203200> rotate<0,44.997030,0> translate<51.365550,0.000000,24.483853> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.365550,0.000000,28.508144>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.680800,0.000000,28.823394>}
box{<0,0,-0.203200><0.445831,0.035000,0.203200> rotate<0,-44.997030,0> translate<51.365550,0.000000,28.508144> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.407066,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.680800,0.000000,31.699200>}
box{<0,0,-0.203200><0.273734,0.035000,0.203200> rotate<0,0.000000,0> translate<51.407066,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.421697,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,19.913600>}
box{<0,0,-0.203200><4.715503,0.035000,0.203200> rotate<0,0.000000,0> translate<51.421697,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.435413,0.000000,31.710941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.664056,0.000000,31.939584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<51.435413,0.000000,31.710941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.435413,0.000000,36.089056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.664056,0.000000,35.860413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<51.435413,0.000000,36.089056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.621278,0.000000,3.141000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.338719,0.000000,3.141000>}
box{<0,0,-0.203200><0.717441,0.035000,0.203200> rotate<0,0.000000,0> translate<51.621278,0.000000,3.141000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.621278,0.000000,8.728997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.338719,0.000000,8.728997>}
box{<0,0,-0.203200><0.717441,0.035000,0.203200> rotate<0,0.000000,0> translate<51.621278,0.000000,8.728997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.664056,0.000000,31.939584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.680800,0.000000,31.980013>}
box{<0,0,-0.203200><0.043758,0.035000,0.203200> rotate<0,-67.498119,0> translate<51.664056,0.000000,31.939584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.664056,0.000000,35.860413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.787797,0.000000,35.561675>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<51.664056,0.000000,35.860413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.680800,0.000000,24.168603>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.680800,0.000000,23.405003>}
box{<0,0,-0.203200><0.763600,0.035000,0.203200> rotate<0,-90.000000,0> translate<51.680800,0.000000,23.405003> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.680800,0.000000,31.980013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.680800,0.000000,28.823394>}
box{<0,0,-0.203200><3.156619,0.035000,0.203200> rotate<0,-90.000000,0> translate<51.680800,0.000000,28.823394> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.704325,0.000000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,35.763200>}
box{<0,0,-0.203200><4.432875,0.035000,0.203200> rotate<0,0.000000,0> translate<51.704325,0.000000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.787797,0.000000,35.119197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.787797,0.000000,35.561675>}
box{<0,0,-0.203200><0.442478,0.035000,0.203200> rotate<0,90.000000,0> translate<51.787797,0.000000,35.561675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.787797,0.000000,35.119197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.742513,0.000000,35.119197>}
box{<0,0,-0.203200><0.954716,0.035000,0.203200> rotate<0,0.000000,0> translate<51.787797,0.000000,35.119197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.787797,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,35.356800>}
box{<0,0,-0.203200><4.349403,0.035000,0.203200> rotate<0,0.000000,0> translate<51.787797,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.790619,0.000000,20.066413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.133584,0.000000,20.409378>}
box{<0,0,-0.203200><0.485027,0.035000,0.203200> rotate<0,-44.997030,0> translate<51.790619,0.000000,20.066413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.872853,0.000000,11.784550>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.535678,0.000000,11.510000>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,22.498434,0> translate<51.872853,0.000000,11.784550> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.872853,0.000000,16.823447>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.535678,0.000000,17.097997>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,-22.498434,0> translate<51.872853,0.000000,16.823447> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.044206,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,20.320000>}
box{<0,0,-0.203200><4.092994,0.035000,0.203200> rotate<0,0.000000,0> translate<52.044206,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.133584,0.000000,20.409378>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.133584,0.000000,20.409381>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,90.000000,0> translate<52.133584,0.000000,20.409381> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.133584,0.000000,20.409381>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.590616,0.000000,21.866413>}
box{<0,0,-0.203200><2.060553,0.035000,0.203200> rotate<0,-44.997030,0> translate<52.133584,0.000000,20.409381> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.338719,0.000000,3.141000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.001544,0.000000,3.415550>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,-22.498434,0> translate<52.338719,0.000000,3.141000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.338719,0.000000,8.728997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.001544,0.000000,8.454447>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,22.498434,0> translate<52.338719,0.000000,8.728997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.450603,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,20.726400>}
box{<0,0,-0.203200><3.686597,0.035000,0.203200> rotate<0,0.000000,0> translate<52.450603,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.535678,0.000000,11.510000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.253119,0.000000,11.510000>}
box{<0,0,-0.203200><0.717441,0.035000,0.203200> rotate<0,0.000000,0> translate<52.535678,0.000000,11.510000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.535678,0.000000,17.097997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.253119,0.000000,17.097997>}
box{<0,0,-0.203200><0.717441,0.035000,0.203200> rotate<0,0.000000,0> translate<52.535678,0.000000,17.097997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.604766,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,3.251200>}
box{<0,0,-0.203200><3.532434,0.035000,0.203200> rotate<0,0.000000,0> translate<52.604766,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.742513,0.000000,35.119197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.190619,0.000000,34.933584>}
box{<0,0,-0.203200><0.485027,0.035000,0.203200> rotate<0,22.498604,0> translate<52.742513,0.000000,35.119197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.808522,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,8.534400>}
box{<0,0,-0.203200><3.328678,0.035000,0.203200> rotate<0,0.000000,0> translate<52.808522,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.857003,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,21.132800>}
box{<0,0,-0.203200><3.280197,0.035000,0.203200> rotate<0,0.000000,0> translate<52.857003,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.001544,0.000000,3.415550>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.508847,0.000000,3.922853>}
box{<0,0,-0.203200><0.717435,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.001544,0.000000,3.415550> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.001544,0.000000,8.454447>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.508847,0.000000,7.947144>}
box{<0,0,-0.203200><0.717435,0.035000,0.203200> rotate<0,44.997030,0> translate<53.001544,0.000000,8.454447> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.150025,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,34.950400>}
box{<0,0,-0.203200><2.987175,0.035000,0.203200> rotate<0,0.000000,0> translate<53.150025,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.190619,0.000000,34.933584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.590619,0.000000,34.533584>}
box{<0,0,-0.203200><0.565685,0.035000,0.203200> rotate<0,44.997030,0> translate<53.190619,0.000000,34.933584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.243594,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,3.657600>}
box{<0,0,-0.203200><2.893606,0.035000,0.203200> rotate<0,0.000000,0> translate<53.243594,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.253119,0.000000,11.510000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.915944,0.000000,11.784550>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,-22.498434,0> translate<53.253119,0.000000,11.510000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.253119,0.000000,17.097997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.915944,0.000000,16.823447>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,22.498434,0> translate<53.253119,0.000000,17.097997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.263403,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,21.539200>}
box{<0,0,-0.203200><2.873797,0.035000,0.203200> rotate<0,0.000000,0> translate<53.263403,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.323609,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,17.068800>}
box{<0,0,-0.203200><2.813591,0.035000,0.203200> rotate<0,0.000000,0> translate<53.323609,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.327991,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,8.128000>}
box{<0,0,-0.203200><2.809209,0.035000,0.203200> rotate<0,0.000000,0> translate<53.327991,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.508847,0.000000,3.922853>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.783397,0.000000,4.585678>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,-67.495627,0> translate<53.508847,0.000000,3.922853> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.508847,0.000000,7.947144>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.783397,0.000000,7.284319>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,67.495627,0> translate<53.508847,0.000000,7.947144> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.567309,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,4.064000>}
box{<0,0,-0.203200><2.569891,0.035000,0.203200> rotate<0,0.000000,0> translate<53.567309,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.580203,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,34.544000>}
box{<0,0,-0.203200><2.556997,0.035000,0.203200> rotate<0,0.000000,0> translate<53.580203,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.590616,0.000000,21.866413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.590619,0.000000,21.866413>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<53.590616,0.000000,21.866413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.590619,0.000000,21.866413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.933584,0.000000,22.209378>}
box{<0,0,-0.203200><0.485027,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.590619,0.000000,21.866413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.590619,0.000000,34.533584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.933584,0.000000,34.190619>}
box{<0,0,-0.203200><0.485027,0.035000,0.203200> rotate<0,44.997030,0> translate<53.590619,0.000000,34.533584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.602272,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,7.721600>}
box{<0,0,-0.203200><2.534928,0.035000,0.203200> rotate<0,0.000000,0> translate<53.602272,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.669806,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,21.945600>}
box{<0,0,-0.203200><2.467394,0.035000,0.203200> rotate<0,0.000000,0> translate<53.669806,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.735647,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,4.470400>}
box{<0,0,-0.203200><2.401553,0.035000,0.203200> rotate<0,0.000000,0> translate<53.735647,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.770606,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,7.315200>}
box{<0,0,-0.203200><2.366594,0.035000,0.203200> rotate<0,0.000000,0> translate<53.770606,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.783397,0.000000,4.585678>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.783397,0.000000,7.284319>}
box{<0,0,-0.203200><2.698641,0.035000,0.203200> rotate<0,90.000000,0> translate<53.783397,0.000000,7.284319> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.783397,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,4.876800>}
box{<0,0,-0.203200><2.353803,0.035000,0.203200> rotate<0,0.000000,0> translate<53.783397,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.783397,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,5.283200>}
box{<0,0,-0.203200><2.353803,0.035000,0.203200> rotate<0,0.000000,0> translate<53.783397,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.783397,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,5.689600>}
box{<0,0,-0.203200><2.353803,0.035000,0.203200> rotate<0,0.000000,0> translate<53.783397,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.783397,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,6.096000>}
box{<0,0,-0.203200><2.353803,0.035000,0.203200> rotate<0,0.000000,0> translate<53.783397,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.783397,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,6.502400>}
box{<0,0,-0.203200><2.353803,0.035000,0.203200> rotate<0,0.000000,0> translate<53.783397,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.783397,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,6.908800>}
box{<0,0,-0.203200><2.353803,0.035000,0.203200> rotate<0,0.000000,0> translate<53.783397,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.915944,0.000000,11.784550>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.423247,0.000000,12.291853>}
box{<0,0,-0.203200><0.717435,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.915944,0.000000,11.784550> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.915944,0.000000,16.823447>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.423247,0.000000,16.316144>}
box{<0,0,-0.203200><0.717435,0.035000,0.203200> rotate<0,44.997030,0> translate<53.915944,0.000000,16.823447> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.916994,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,11.785600>}
box{<0,0,-0.203200><2.220206,0.035000,0.203200> rotate<0,0.000000,0> translate<53.916994,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.933584,0.000000,22.209378>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.119197,0.000000,22.657484>}
box{<0,0,-0.203200><0.485027,0.035000,0.203200> rotate<0,-67.495456,0> translate<53.933584,0.000000,22.209378> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.933584,0.000000,34.190619>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.119197,0.000000,33.742513>}
box{<0,0,-0.203200><0.485027,0.035000,0.203200> rotate<0,67.495456,0> translate<53.933584,0.000000,34.190619> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.955547,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,34.137600>}
box{<0,0,-0.203200><2.181653,0.035000,0.203200> rotate<0,0.000000,0> translate<53.955547,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.992659,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,22.352000>}
box{<0,0,-0.203200><2.144541,0.035000,0.203200> rotate<0,0.000000,0> translate<53.992659,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.076991,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,16.662400>}
box{<0,0,-0.203200><2.060209,0.035000,0.203200> rotate<0,0.000000,0> translate<54.076991,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.119197,0.000000,22.657484>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.119197,0.000000,24.179803>}
box{<0,0,-0.203200><1.522319,0.035000,0.203200> rotate<0,90.000000,0> translate<54.119197,0.000000,24.179803> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.119197,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,22.758400>}
box{<0,0,-0.203200><2.018003,0.035000,0.203200> rotate<0,0.000000,0> translate<54.119197,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.119197,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,23.164800>}
box{<0,0,-0.203200><2.018003,0.035000,0.203200> rotate<0,0.000000,0> translate<54.119197,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.119197,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,23.571200>}
box{<0,0,-0.203200><2.018003,0.035000,0.203200> rotate<0,0.000000,0> translate<54.119197,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.119197,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,23.977600>}
box{<0,0,-0.203200><2.018003,0.035000,0.203200> rotate<0,0.000000,0> translate<54.119197,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.119197,0.000000,24.179803>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.423247,0.000000,24.483853>}
box{<0,0,-0.203200><0.429992,0.035000,0.203200> rotate<0,-44.997030,0> translate<54.119197,0.000000,24.179803> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.119197,0.000000,28.812194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.119197,0.000000,33.742513>}
box{<0,0,-0.203200><4.930319,0.035000,0.203200> rotate<0,90.000000,0> translate<54.119197,0.000000,33.742513> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.119197,0.000000,28.812194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.423247,0.000000,28.508144>}
box{<0,0,-0.203200><0.429992,0.035000,0.203200> rotate<0,44.997030,0> translate<54.119197,0.000000,28.812194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.119197,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,28.854400>}
box{<0,0,-0.203200><2.018003,0.035000,0.203200> rotate<0,0.000000,0> translate<54.119197,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.119197,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,29.260800>}
box{<0,0,-0.203200><2.018003,0.035000,0.203200> rotate<0,0.000000,0> translate<54.119197,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.119197,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,29.667200>}
box{<0,0,-0.203200><2.018003,0.035000,0.203200> rotate<0,0.000000,0> translate<54.119197,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.119197,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,30.073600>}
box{<0,0,-0.203200><2.018003,0.035000,0.203200> rotate<0,0.000000,0> translate<54.119197,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.119197,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,30.480000>}
box{<0,0,-0.203200><2.018003,0.035000,0.203200> rotate<0,0.000000,0> translate<54.119197,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.119197,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,30.886400>}
box{<0,0,-0.203200><2.018003,0.035000,0.203200> rotate<0,0.000000,0> translate<54.119197,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.119197,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,31.292800>}
box{<0,0,-0.203200><2.018003,0.035000,0.203200> rotate<0,0.000000,0> translate<54.119197,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.119197,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,31.699200>}
box{<0,0,-0.203200><2.018003,0.035000,0.203200> rotate<0,0.000000,0> translate<54.119197,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.119197,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,32.105600>}
box{<0,0,-0.203200><2.018003,0.035000,0.203200> rotate<0,0.000000,0> translate<54.119197,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.119197,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,32.512000>}
box{<0,0,-0.203200><2.018003,0.035000,0.203200> rotate<0,0.000000,0> translate<54.119197,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.119197,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,32.918400>}
box{<0,0,-0.203200><2.018003,0.035000,0.203200> rotate<0,0.000000,0> translate<54.119197,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.119197,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,33.324800>}
box{<0,0,-0.203200><2.018003,0.035000,0.203200> rotate<0,0.000000,0> translate<54.119197,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.119197,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,33.731200>}
box{<0,0,-0.203200><2.018003,0.035000,0.203200> rotate<0,0.000000,0> translate<54.119197,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.323394,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,12.192000>}
box{<0,0,-0.203200><1.813806,0.035000,0.203200> rotate<0,0.000000,0> translate<54.323394,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.323394,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,24.384000>}
box{<0,0,-0.203200><1.813806,0.035000,0.203200> rotate<0,0.000000,0> translate<54.323394,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.423247,0.000000,12.291853>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.697797,0.000000,12.954678>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,-67.495627,0> translate<54.423247,0.000000,12.291853> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.423247,0.000000,16.316144>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.697797,0.000000,15.653319>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,67.495627,0> translate<54.423247,0.000000,16.316144> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.423247,0.000000,24.483853>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.697797,0.000000,25.146678>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,-67.495627,0> translate<54.423247,0.000000,24.483853> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.423247,0.000000,28.508144>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.697797,0.000000,27.845319>}
box{<0,0,-0.203200><0.717436,0.035000,0.203200> rotate<0,67.495627,0> translate<54.423247,0.000000,28.508144> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.448159,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,16.256000>}
box{<0,0,-0.203200><1.689041,0.035000,0.203200> rotate<0,0.000000,0> translate<54.448159,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.448159,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,28.448000>}
box{<0,0,-0.203200><1.689041,0.035000,0.203200> rotate<0,0.000000,0> translate<54.448159,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.550222,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,12.598400>}
box{<0,0,-0.203200><1.586978,0.035000,0.203200> rotate<0,0.000000,0> translate<54.550222,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.550222,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,24.790400>}
box{<0,0,-0.203200><1.586978,0.035000,0.203200> rotate<0,0.000000,0> translate<54.550222,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.616497,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,15.849600>}
box{<0,0,-0.203200><1.520703,0.035000,0.203200> rotate<0,0.000000,0> translate<54.616497,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.616497,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,28.041600>}
box{<0,0,-0.203200><1.520703,0.035000,0.203200> rotate<0,0.000000,0> translate<54.616497,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.697797,0.000000,12.954678>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.697797,0.000000,15.653319>}
box{<0,0,-0.203200><2.698641,0.035000,0.203200> rotate<0,90.000000,0> translate<54.697797,0.000000,15.653319> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.697797,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,13.004800>}
box{<0,0,-0.203200><1.439403,0.035000,0.203200> rotate<0,0.000000,0> translate<54.697797,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.697797,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,13.411200>}
box{<0,0,-0.203200><1.439403,0.035000,0.203200> rotate<0,0.000000,0> translate<54.697797,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.697797,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,13.817600>}
box{<0,0,-0.203200><1.439403,0.035000,0.203200> rotate<0,0.000000,0> translate<54.697797,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.697797,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,14.224000>}
box{<0,0,-0.203200><1.439403,0.035000,0.203200> rotate<0,0.000000,0> translate<54.697797,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.697797,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,14.630400>}
box{<0,0,-0.203200><1.439403,0.035000,0.203200> rotate<0,0.000000,0> translate<54.697797,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.697797,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,15.036800>}
box{<0,0,-0.203200><1.439403,0.035000,0.203200> rotate<0,0.000000,0> translate<54.697797,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.697797,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,15.443200>}
box{<0,0,-0.203200><1.439403,0.035000,0.203200> rotate<0,0.000000,0> translate<54.697797,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.697797,0.000000,25.146678>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.697797,0.000000,27.845319>}
box{<0,0,-0.203200><2.698641,0.035000,0.203200> rotate<0,90.000000,0> translate<54.697797,0.000000,27.845319> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.697797,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,25.196800>}
box{<0,0,-0.203200><1.439403,0.035000,0.203200> rotate<0,0.000000,0> translate<54.697797,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.697797,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,25.603200>}
box{<0,0,-0.203200><1.439403,0.035000,0.203200> rotate<0,0.000000,0> translate<54.697797,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.697797,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,26.009600>}
box{<0,0,-0.203200><1.439403,0.035000,0.203200> rotate<0,0.000000,0> translate<54.697797,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.697797,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,26.416000>}
box{<0,0,-0.203200><1.439403,0.035000,0.203200> rotate<0,0.000000,0> translate<54.697797,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.697797,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,26.822400>}
box{<0,0,-0.203200><1.439403,0.035000,0.203200> rotate<0,0.000000,0> translate<54.697797,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.697797,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,27.228800>}
box{<0,0,-0.203200><1.439403,0.035000,0.203200> rotate<0,0.000000,0> translate<54.697797,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.697797,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,27.635200>}
box{<0,0,-0.203200><1.439403,0.035000,0.203200> rotate<0,0.000000,0> translate<54.697797,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,38.600000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.137200,0.000000,1.062797>}
box{<0,0,-0.203200><37.537203,0.035000,0.203200> rotate<0,-90.000000,0> translate<56.137200,0.000000,1.062797> }
texture{col_pol}
}
#end
union{
cylinder{<22.050000,0.038000,14.084000><22.050000,-1.538000,14.084000>0.500000}
cylinder{<19.510000,0.038000,14.084000><19.510000,-1.538000,14.084000>0.500000}
cylinder{<5.070000,0.038000,5.080000><5.070000,-1.538000,5.080000>0.500000}
cylinder{<9.644000,0.038000,2.324000><9.644000,-1.538000,2.324000>0.500000}
cylinder{<7.104000,0.038000,2.324000><7.104000,-1.538000,2.324000>0.500000}
cylinder{<4.564000,0.038000,2.324000><4.564000,-1.538000,2.324000>0.500000}
cylinder{<52.894400,0.038000,26.496000><52.894400,-1.538000,26.496000>0.660400}
cylinder{<40.905600,0.038000,26.496000><40.905600,-1.538000,26.496000>0.660400}
cylinder{<52.894400,0.038000,14.304000><52.894400,-1.538000,14.304000>0.660400}
cylinder{<46.900000,0.038000,28.604200><46.900000,-1.538000,28.604200>0.901700}
cylinder{<40.905600,0.038000,14.304000><40.905600,-1.538000,14.304000>0.660400}
cylinder{<35.570000,0.038000,31.810000><35.570000,-1.538000,31.810000>0.406400}
cylinder{<33.030000,0.038000,31.810000><33.030000,-1.538000,31.810000>0.406400}
cylinder{<33.030000,0.038000,24.190000><33.030000,-1.538000,24.190000>0.406400}
cylinder{<35.570000,0.038000,24.190000><35.570000,-1.538000,24.190000>0.406400}
cylinder{<26.154000,0.038000,2.224000><26.154000,-1.538000,2.224000>0.500000}
cylinder{<23.614000,0.038000,2.224000><23.614000,-1.538000,2.224000>0.500000}
cylinder{<21.074000,0.038000,2.224000><21.074000,-1.538000,2.224000>0.500000}
cylinder{<18.534000,0.038000,2.224000><18.534000,-1.538000,2.224000>0.500000}
cylinder{<37.830000,0.038000,34.530000><37.830000,-1.538000,34.530000>0.406400}
cylinder{<40.370000,0.038000,34.530000><40.370000,-1.538000,34.530000>0.406400}
cylinder{<40.370000,0.038000,37.070000><40.370000,-1.538000,37.070000>0.406400}
cylinder{<51.980000,0.038000,5.935000><51.980000,-1.538000,5.935000>0.660400}
cylinder{<46.900000,0.038000,5.935000><46.900000,-1.538000,5.935000>0.660400}
cylinder{<41.820000,0.038000,5.935000><41.820000,-1.538000,5.935000>0.660400}
//Holes(fast)/Vias
cylinder{<12.200000,0.038000,1.900000><12.200000,-1.538000,1.900000>0.250000 }
cylinder{<12.700000,0.038000,35.400000><12.700000,-1.538000,35.400000>0.250000 }
cylinder{<12.700000,0.038000,37.800000><12.700000,-1.538000,37.800000>0.250000 }
cylinder{<12.700000,0.038000,36.700000><12.700000,-1.538000,36.700000>0.250000 }
cylinder{<15.700000,0.038000,32.400000><15.700000,-1.538000,32.400000>0.250000 }
cylinder{<17.200000,0.038000,32.400000><17.200000,-1.538000,32.400000>0.250000 }
cylinder{<18.700000,0.038000,32.400000><18.700000,-1.538000,32.400000>0.250000 }
cylinder{<15.700000,0.038000,30.900000><15.700000,-1.538000,30.900000>0.250000 }
cylinder{<17.200000,0.038000,30.900000><17.200000,-1.538000,30.900000>0.250000 }
cylinder{<18.700000,0.038000,30.900000><18.700000,-1.538000,30.900000>0.250000 }
cylinder{<15.700000,0.038000,29.400000><15.700000,-1.538000,29.400000>0.250000 }
cylinder{<17.200000,0.038000,29.400000><17.200000,-1.538000,29.400000>0.250000 }
cylinder{<18.700000,0.038000,29.400000><18.700000,-1.538000,29.400000>0.250000 }
cylinder{<15.700000,0.038000,27.900000><15.700000,-1.538000,27.900000>0.250000 }
cylinder{<17.200000,0.038000,27.900000><17.200000,-1.538000,27.900000>0.250000 }
cylinder{<18.700000,0.038000,27.900000><18.700000,-1.538000,27.900000>0.250000 }
cylinder{<20.200000,0.038000,32.400000><20.200000,-1.538000,32.400000>0.250000 }
cylinder{<20.200000,0.038000,30.900000><20.200000,-1.538000,30.900000>0.250000 }
cylinder{<20.200000,0.038000,29.400000><20.200000,-1.538000,29.400000>0.250000 }
cylinder{<20.200000,0.038000,27.900000><20.200000,-1.538000,27.900000>0.250000 }
cylinder{<18.000000,0.038000,31.600000><18.000000,-1.538000,31.600000>0.250000 }
cylinder{<19.400000,0.038000,31.600000><19.400000,-1.538000,31.600000>0.250000 }
cylinder{<16.500000,0.038000,31.600000><16.500000,-1.538000,31.600000>0.250000 }
cylinder{<16.500000,0.038000,30.200000><16.500000,-1.538000,30.200000>0.250000 }
cylinder{<18.000000,0.038000,30.100000><18.000000,-1.538000,30.100000>0.250000 }
cylinder{<19.400000,0.038000,30.200000><19.400000,-1.538000,30.200000>0.250000 }
cylinder{<16.500000,0.038000,28.700000><16.500000,-1.538000,28.700000>0.250000 }
cylinder{<17.900000,0.038000,28.700000><17.900000,-1.538000,28.700000>0.250000 }
cylinder{<19.400000,0.038000,28.700000><19.400000,-1.538000,28.700000>0.250000 }
cylinder{<8.900000,0.038000,38.200000><8.900000,-1.538000,38.200000>0.250000 }
cylinder{<14.100000,0.038000,4.500000><14.100000,-1.538000,4.500000>0.250000 }
cylinder{<12.500000,0.038000,7.900000><12.500000,-1.538000,7.900000>0.150000 }
cylinder{<26.900000,0.038000,38.200000><26.900000,-1.538000,38.200000>0.250000 }
cylinder{<24.700000,0.038000,14.900000><24.700000,-1.538000,14.900000>0.150000 }
cylinder{<24.700000,0.038000,18.100000><24.700000,-1.538000,18.100000>0.150000 }
cylinder{<13.200000,0.038000,18.600000><13.200000,-1.538000,18.600000>0.150000 }
cylinder{<8.400000,0.038000,5.900000><8.400000,-1.538000,5.900000>0.150000 }
cylinder{<2.100000,0.038000,44.200000><2.100000,-1.538000,44.200000>0.500000 }
cylinder{<55.000000,0.038000,44.000000><55.000000,-1.538000,44.000000>0.500000 }
cylinder{<28.900000,0.038000,19.900000><28.900000,-1.538000,19.900000>0.500000 }
cylinder{<4.100000,0.038000,19.900000><4.100000,-1.538000,19.900000>0.500000 }
cylinder{<26.800000,0.038000,34.300000><26.800000,-1.538000,34.300000>0.250000 }
cylinder{<8.900000,0.038000,36.900000><8.900000,-1.538000,36.900000>0.250000 }
cylinder{<11.180000,0.038000,15.290000><11.180000,-1.538000,15.290000>0.250000 }
cylinder{<10.130000,0.038000,12.880000><10.130000,-1.538000,12.880000>0.150000 }
cylinder{<9.990000,0.038000,13.760000><9.990000,-1.538000,13.760000>0.150000 }
cylinder{<13.350000,0.038000,17.050000><13.350000,-1.538000,17.050000>0.250000 }
cylinder{<6.700000,0.038000,36.300000><6.700000,-1.538000,36.300000>0.250000 }
cylinder{<5.100000,0.038000,36.500000><5.100000,-1.538000,36.500000>0.250000 }
cylinder{<13.350000,0.038000,16.150000><13.350000,-1.538000,16.150000>0.250000 }
cylinder{<13.350000,0.038000,15.150000><13.350000,-1.538000,15.150000>0.250000 }
cylinder{<24.200000,0.038000,5.300000><24.200000,-1.538000,5.300000>0.150000 }
cylinder{<18.500000,0.038000,5.300000><18.500000,-1.538000,5.300000>0.150000 }
cylinder{<18.200000,0.038000,8.700000><18.200000,-1.538000,8.700000>0.150000 }
cylinder{<14.800000,0.038000,12.700000><14.800000,-1.538000,12.700000>0.150000 }
cylinder{<26.700000,0.038000,10.300000><26.700000,-1.538000,10.300000>0.250000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.983634,0.000000,1.170966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.835341,0.000000,1.319259>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<20.835341,0.000000,1.319259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.835341,0.000000,1.319259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.538753,0.000000,1.319259>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<20.538753,0.000000,1.319259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.538753,0.000000,1.319259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.390463,0.000000,1.170966>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.997634,0> translate<20.390463,0.000000,1.170966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.390463,0.000000,1.170966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.390463,0.000000,0.577791>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,-90.000000,0> translate<20.390463,0.000000,0.577791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.390463,0.000000,0.577791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.538753,0.000000,0.429500>}
box{<0,0,-0.063500><0.209715,0.036000,0.063500> rotate<0,44.997030,0> translate<20.390463,0.000000,0.577791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.538753,0.000000,0.429500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.835341,0.000000,0.429500>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<20.538753,0.000000,0.429500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.835341,0.000000,0.429500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.983634,0.000000,0.577791>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.996427,0> translate<20.835341,0.000000,0.429500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.983634,0.000000,0.577791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.983634,0.000000,0.874378>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,90.000000,0> translate<20.983634,0.000000,0.874378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.983634,0.000000,0.874378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.687047,0.000000,0.874378>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<20.687047,0.000000,0.874378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.325981,0.000000,1.319259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.325981,0.000000,0.429500>}
box{<0,0,-0.063500><0.889759,0.036000,0.063500> rotate<0,-90.000000,0> translate<21.325981,0.000000,0.429500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.325981,0.000000,0.429500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.770859,0.000000,0.429500>}
box{<0,0,-0.063500><0.444878,0.036000,0.063500> rotate<0,0.000000,0> translate<21.325981,0.000000,0.429500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.770859,0.000000,0.429500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.919153,0.000000,0.577791>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.996427,0> translate<21.770859,0.000000,0.429500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.919153,0.000000,0.577791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.919153,0.000000,1.170966>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,90.000000,0> translate<21.919153,0.000000,1.170966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.919153,0.000000,1.170966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.770859,0.000000,1.319259>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<21.770859,0.000000,1.319259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.770859,0.000000,1.319259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.325981,0.000000,1.319259>}
box{<0,0,-0.063500><0.444878,0.036000,0.063500> rotate<0,0.000000,0> translate<21.325981,0.000000,1.319259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.674781,0.000000,1.327259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.674781,0.000000,0.734084>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,-90.000000,0> translate<8.674781,0.000000,0.734084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.674781,0.000000,0.734084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.971366,0.000000,0.437500>}
box{<0,0,-0.063500><0.419434,0.036000,0.063500> rotate<0,44.997030,0> translate<8.674781,0.000000,0.734084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.971366,0.000000,0.437500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.267953,0.000000,0.734084>}
box{<0,0,-0.063500><0.419436,0.036000,0.063500> rotate<0,-44.996728,0> translate<8.971366,0.000000,0.437500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.267953,0.000000,0.734084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.267953,0.000000,1.327259>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,90.000000,0> translate<9.267953,0.000000,1.327259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.610300,0.000000,0.437500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.906884,0.000000,0.437500>}
box{<0,0,-0.063500><0.296584,0.036000,0.063500> rotate<0,0.000000,0> translate<9.610300,0.000000,0.437500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.758591,0.000000,0.437500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.758591,0.000000,1.327259>}
box{<0,0,-0.063500><0.889759,0.036000,0.063500> rotate<0,90.000000,0> translate<9.758591,0.000000,1.327259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.610300,0.000000,1.327259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.906884,0.000000,1.327259>}
box{<0,0,-0.063500><0.296584,0.036000,0.063500> rotate<0,0.000000,0> translate<9.610300,0.000000,1.327259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.233978,0.000000,0.437500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.233978,0.000000,1.327259>}
box{<0,0,-0.063500><0.889759,0.036000,0.063500> rotate<0,90.000000,0> translate<10.233978,0.000000,1.327259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.233978,0.000000,1.327259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.827150,0.000000,0.437500>}
box{<0,0,-0.063500><1.069357,0.036000,0.063500> rotate<0,56.306263,0> translate<10.233978,0.000000,1.327259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.827150,0.000000,0.437500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.827150,0.000000,1.327259>}
box{<0,0,-0.063500><0.889759,0.036000,0.063500> rotate<0,90.000000,0> translate<10.827150,0.000000,1.327259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.390463,0.000000,0.409500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.390463,0.000000,1.299259>}
box{<0,0,-0.063500><0.889759,0.036000,0.063500> rotate<0,90.000000,0> translate<25.390463,0.000000,1.299259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.390463,0.000000,1.299259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.835341,0.000000,1.299259>}
box{<0,0,-0.063500><0.444878,0.036000,0.063500> rotate<0,0.000000,0> translate<25.390463,0.000000,1.299259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.835341,0.000000,1.299259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.983634,0.000000,1.150966>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<25.835341,0.000000,1.299259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.983634,0.000000,1.150966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.983634,0.000000,0.854378>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.983634,0.000000,0.854378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.983634,0.000000,0.854378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.835341,0.000000,0.706084>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.835341,0.000000,0.706084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.835341,0.000000,0.706084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.390463,0.000000,0.706084>}
box{<0,0,-0.063500><0.444878,0.036000,0.063500> rotate<0,0.000000,0> translate<25.390463,0.000000,0.706084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.687047,0.000000,0.706084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.983634,0.000000,0.409500>}
box{<0,0,-0.063500><0.419436,0.036000,0.063500> rotate<0,44.996728,0> translate<25.687047,0.000000,0.706084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.325981,0.000000,1.299259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.919153,0.000000,0.409500>}
box{<0,0,-0.063500><1.069357,0.036000,0.063500> rotate<0,56.306263,0> translate<26.325981,0.000000,1.299259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.919153,0.000000,1.299259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.325981,0.000000,0.409500>}
box{<0,0,-0.063500><1.069357,0.036000,0.063500> rotate<0,-56.306263,0> translate<26.325981,0.000000,0.409500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.987047,0.000000,0.369500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.987047,0.000000,1.259259>}
box{<0,0,-0.063500><0.889759,0.036000,0.063500> rotate<0,90.000000,0> translate<22.987047,0.000000,1.259259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.690463,0.000000,1.259259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.283634,0.000000,1.259259>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,0.000000,0> translate<22.690463,0.000000,1.259259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.625981,0.000000,1.259259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.219153,0.000000,0.369500>}
box{<0,0,-0.063500><1.069357,0.036000,0.063500> rotate<0,56.306263,0> translate<23.625981,0.000000,1.259259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.219153,0.000000,1.259259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.625981,0.000000,0.369500>}
box{<0,0,-0.063500><1.069357,0.036000,0.063500> rotate<0,-56.306263,0> translate<23.625981,0.000000,0.369500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.330741,0.000000,38.026672>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.330741,0.000000,37.433500>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,-90.000000,0> translate<0.330741,0.000000,37.433500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.330741,0.000000,37.433500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.220500,0.000000,37.433500>}
box{<0,0,-0.063500><0.889759,0.036000,0.063500> rotate<0,0.000000,0> translate<0.330741,0.000000,37.433500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.220500,0.000000,37.433500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.220500,0.000000,38.026672>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,90.000000,0> translate<1.220500,0.000000,38.026672> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.775622,0.000000,37.433500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.775622,0.000000,37.730084>}
box{<0,0,-0.063500><0.296584,0.036000,0.063500> rotate<0,90.000000,0> translate<0.775622,0.000000,37.730084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.220500,0.000000,38.369019>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.330741,0.000000,38.369019>}
box{<0,0,-0.063500><0.889759,0.036000,0.063500> rotate<0,0.000000,0> translate<0.330741,0.000000,38.369019> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.330741,0.000000,38.369019>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.220500,0.000000,38.962191>}
box{<0,0,-0.063500><1.069357,0.036000,0.063500> rotate<0,-33.687798,0> translate<0.330741,0.000000,38.369019> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.220500,0.000000,38.962191>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.330741,0.000000,38.962191>}
box{<0,0,-0.063500><0.889759,0.036000,0.063500> rotate<0,0.000000,0> translate<0.330741,0.000000,38.962191> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.035634,0.000000,3.222966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.887341,0.000000,3.371259>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<1.887341,0.000000,3.371259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.887341,0.000000,3.371259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.590753,0.000000,3.371259>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<1.590753,0.000000,3.371259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.590753,0.000000,3.371259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.442462,0.000000,3.222966>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.997634,0> translate<1.442462,0.000000,3.222966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.442462,0.000000,3.222966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.442462,0.000000,2.629791>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,-90.000000,0> translate<1.442462,0.000000,2.629791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.442462,0.000000,2.629791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.590753,0.000000,2.481500>}
box{<0,0,-0.063500><0.209715,0.036000,0.063500> rotate<0,44.997030,0> translate<1.442462,0.000000,2.629791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.590753,0.000000,2.481500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.887341,0.000000,2.481500>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<1.590753,0.000000,2.481500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.887341,0.000000,2.481500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.035634,0.000000,2.629791>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.996427,0> translate<1.887341,0.000000,2.481500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.035634,0.000000,2.629791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.035634,0.000000,2.926378>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,90.000000,0> translate<2.035634,0.000000,2.926378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.035634,0.000000,2.926378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.739047,0.000000,2.926378>}
box{<0,0,-0.063500><0.296587,0.036000,0.063500> rotate<0,0.000000,0> translate<1.739047,0.000000,2.926378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.377981,0.000000,3.371259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.377981,0.000000,2.481500>}
box{<0,0,-0.063500><0.889759,0.036000,0.063500> rotate<0,-90.000000,0> translate<2.377981,0.000000,2.481500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.377981,0.000000,2.481500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.822859,0.000000,2.481500>}
box{<0,0,-0.063500><0.444878,0.036000,0.063500> rotate<0,0.000000,0> translate<2.377981,0.000000,2.481500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.822859,0.000000,2.481500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.971153,0.000000,2.629791>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.996427,0> translate<2.822859,0.000000,2.481500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.971153,0.000000,2.629791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.971153,0.000000,3.222966>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,90.000000,0> translate<2.971153,0.000000,3.222966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.971153,0.000000,3.222966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.822859,0.000000,3.371259>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<2.822859,0.000000,3.371259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.822859,0.000000,3.371259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.377981,0.000000,3.371259>}
box{<0,0,-0.063500><0.444878,0.036000,0.063500> rotate<0,0.000000,0> translate<2.377981,0.000000,3.371259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.311634,0.000000,1.198966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.163341,0.000000,1.347259>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<4.163341,0.000000,1.347259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.163341,0.000000,1.347259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.866753,0.000000,1.347259>}
box{<0,0,-0.063500><0.296587,0.036000,0.063500> rotate<0,0.000000,0> translate<3.866753,0.000000,1.347259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.866753,0.000000,1.347259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.718463,0.000000,1.198966>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.997634,0> translate<3.718463,0.000000,1.198966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.718463,0.000000,1.198966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.718463,0.000000,0.605791>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,-90.000000,0> translate<3.718463,0.000000,0.605791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.718463,0.000000,0.605791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.866753,0.000000,0.457500>}
box{<0,0,-0.063500><0.209715,0.036000,0.063500> rotate<0,44.997030,0> translate<3.718463,0.000000,0.605791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.866753,0.000000,0.457500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.163341,0.000000,0.457500>}
box{<0,0,-0.063500><0.296587,0.036000,0.063500> rotate<0,0.000000,0> translate<3.866753,0.000000,0.457500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.163341,0.000000,0.457500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.311634,0.000000,0.605791>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.996427,0> translate<4.163341,0.000000,0.457500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.311634,0.000000,0.605791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.311634,0.000000,0.902378>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,90.000000,0> translate<4.311634,0.000000,0.902378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.311634,0.000000,0.902378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.015047,0.000000,0.902378>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<4.015047,0.000000,0.902378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.653981,0.000000,1.347259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.653981,0.000000,0.457500>}
box{<0,0,-0.063500><0.889759,0.036000,0.063500> rotate<0,-90.000000,0> translate<4.653981,0.000000,0.457500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.653981,0.000000,0.457500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.098859,0.000000,0.457500>}
box{<0,0,-0.063500><0.444878,0.036000,0.063500> rotate<0,0.000000,0> translate<4.653981,0.000000,0.457500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.098859,0.000000,0.457500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.247153,0.000000,0.605791>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.996427,0> translate<5.098859,0.000000,0.457500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.247153,0.000000,0.605791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.247153,0.000000,1.198966>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,90.000000,0> translate<5.247153,0.000000,1.198966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.247153,0.000000,1.198966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.098859,0.000000,1.347259>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<5.098859,0.000000,1.347259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.098859,0.000000,1.347259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.653981,0.000000,1.347259>}
box{<0,0,-0.063500><0.444878,0.036000,0.063500> rotate<0,0.000000,0> translate<4.653981,0.000000,1.347259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.254944,0.000000,1.130966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.403234,0.000000,1.279259>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.997634,0> translate<17.254944,0.000000,1.130966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.403234,0.000000,1.279259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.699822,0.000000,1.279259>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<17.403234,0.000000,1.279259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.699822,0.000000,1.279259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.848116,0.000000,1.130966>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<17.699822,0.000000,1.279259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.848116,0.000000,1.130966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.848116,0.000000,0.982672>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,-90.000000,0> translate<17.848116,0.000000,0.982672> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.848116,0.000000,0.982672>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.699822,0.000000,0.834378>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,-44.997030,0> translate<17.699822,0.000000,0.834378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.699822,0.000000,0.834378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.551528,0.000000,0.834378>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,0.000000,0> translate<17.551528,0.000000,0.834378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.699822,0.000000,0.834378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.848116,0.000000,0.686084>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<17.699822,0.000000,0.834378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.848116,0.000000,0.686084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.848116,0.000000,0.537791>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,-90.000000,0> translate<17.848116,0.000000,0.537791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.848116,0.000000,0.537791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.699822,0.000000,0.389500>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.996427,0> translate<17.699822,0.000000,0.389500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.699822,0.000000,0.389500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.403234,0.000000,0.389500>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<17.403234,0.000000,0.389500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.403234,0.000000,0.389500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.254944,0.000000,0.537791>}
box{<0,0,-0.063500><0.209715,0.036000,0.063500> rotate<0,44.997030,0> translate<17.254944,0.000000,0.537791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.190463,0.000000,1.279259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.190463,0.000000,0.686084>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,-90.000000,0> translate<18.190463,0.000000,0.686084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.190463,0.000000,0.686084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.487047,0.000000,0.389500>}
box{<0,0,-0.063500><0.419434,0.036000,0.063500> rotate<0,44.997030,0> translate<18.190463,0.000000,0.686084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.487047,0.000000,0.389500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.783634,0.000000,0.686084>}
box{<0,0,-0.063500><0.419436,0.036000,0.063500> rotate<0,-44.996728,0> translate<18.487047,0.000000,0.389500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.783634,0.000000,0.686084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.783634,0.000000,1.279259>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,90.000000,0> translate<18.783634,0.000000,1.279259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.125981,0.000000,1.130966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.274272,0.000000,1.279259>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.997634,0> translate<19.125981,0.000000,1.130966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.274272,0.000000,1.279259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.570859,0.000000,1.279259>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<19.274272,0.000000,1.279259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.570859,0.000000,1.279259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.719153,0.000000,1.130966>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<19.570859,0.000000,1.279259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.719153,0.000000,1.130966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.719153,0.000000,0.982672>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,-90.000000,0> translate<19.719153,0.000000,0.982672> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.719153,0.000000,0.982672>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.570859,0.000000,0.834378>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,-44.997030,0> translate<19.570859,0.000000,0.834378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.570859,0.000000,0.834378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.422566,0.000000,0.834378>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,0.000000,0> translate<19.422566,0.000000,0.834378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.570859,0.000000,0.834378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.719153,0.000000,0.686084>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<19.570859,0.000000,0.834378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.719153,0.000000,0.686084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.719153,0.000000,0.537791>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,-90.000000,0> translate<19.719153,0.000000,0.537791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.719153,0.000000,0.537791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.570859,0.000000,0.389500>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.996427,0> translate<19.570859,0.000000,0.389500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.570859,0.000000,0.389500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.274272,0.000000,0.389500>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<19.274272,0.000000,0.389500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.274272,0.000000,0.389500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.125981,0.000000,0.537791>}
box{<0,0,-0.063500><0.209715,0.036000,0.063500> rotate<0,44.997030,0> translate<19.125981,0.000000,0.537791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.040944,0.000000,16.476966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.189234,0.000000,16.625259>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.997634,0> translate<21.040944,0.000000,16.476966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.189234,0.000000,16.625259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.485822,0.000000,16.625259>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<21.189234,0.000000,16.625259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.485822,0.000000,16.625259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.634116,0.000000,16.476966>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<21.485822,0.000000,16.625259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.634116,0.000000,16.476966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.634116,0.000000,16.328672>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,-90.000000,0> translate<21.634116,0.000000,16.328672> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.634116,0.000000,16.328672>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.485822,0.000000,16.180378>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,-44.997030,0> translate<21.485822,0.000000,16.180378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.485822,0.000000,16.180378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.337528,0.000000,16.180378>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,0.000000,0> translate<21.337528,0.000000,16.180378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.485822,0.000000,16.180378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.634116,0.000000,16.032084>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<21.485822,0.000000,16.180378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.634116,0.000000,16.032084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.634116,0.000000,15.883791>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,-90.000000,0> translate<21.634116,0.000000,15.883791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.634116,0.000000,15.883791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.485822,0.000000,15.735500>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.996427,0> translate<21.485822,0.000000,15.735500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.485822,0.000000,15.735500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.189234,0.000000,15.735500>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<21.189234,0.000000,15.735500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.189234,0.000000,15.735500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.040944,0.000000,15.883791>}
box{<0,0,-0.063500><0.209715,0.036000,0.063500> rotate<0,44.997030,0> translate<21.040944,0.000000,15.883791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.976463,0.000000,16.625259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.976463,0.000000,16.032084>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,-90.000000,0> translate<21.976463,0.000000,16.032084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.976463,0.000000,16.032084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.273047,0.000000,15.735500>}
box{<0,0,-0.063500><0.419434,0.036000,0.063500> rotate<0,44.997030,0> translate<21.976463,0.000000,16.032084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.273047,0.000000,15.735500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.569634,0.000000,16.032084>}
box{<0,0,-0.063500><0.419436,0.036000,0.063500> rotate<0,-44.996728,0> translate<22.273047,0.000000,15.735500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.569634,0.000000,16.032084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.569634,0.000000,16.625259>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,90.000000,0> translate<22.569634,0.000000,16.625259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.911981,0.000000,16.476966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.060272,0.000000,16.625259>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.997634,0> translate<22.911981,0.000000,16.476966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.060272,0.000000,16.625259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.356859,0.000000,16.625259>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<23.060272,0.000000,16.625259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.356859,0.000000,16.625259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.505153,0.000000,16.476966>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<23.356859,0.000000,16.625259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.505153,0.000000,16.476966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.505153,0.000000,16.328672>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,-90.000000,0> translate<23.505153,0.000000,16.328672> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.505153,0.000000,16.328672>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.356859,0.000000,16.180378>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,-44.997030,0> translate<23.356859,0.000000,16.180378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.356859,0.000000,16.180378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.208566,0.000000,16.180378>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,0.000000,0> translate<23.208566,0.000000,16.180378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.356859,0.000000,16.180378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.505153,0.000000,16.032084>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<23.356859,0.000000,16.180378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.505153,0.000000,16.032084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.505153,0.000000,15.883791>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,-90.000000,0> translate<23.505153,0.000000,15.883791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.505153,0.000000,15.883791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.356859,0.000000,15.735500>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.996427,0> translate<23.356859,0.000000,15.735500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.356859,0.000000,15.735500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.060272,0.000000,15.735500>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<23.060272,0.000000,15.735500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.060272,0.000000,15.735500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.911981,0.000000,15.883791>}
box{<0,0,-0.063500><0.209715,0.036000,0.063500> rotate<0,44.997030,0> translate<22.911981,0.000000,15.883791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.149634,0.000000,16.486966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.001341,0.000000,16.635259>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<19.001341,0.000000,16.635259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.001341,0.000000,16.635259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.704753,0.000000,16.635259>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<18.704753,0.000000,16.635259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.704753,0.000000,16.635259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.556463,0.000000,16.486966>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.997634,0> translate<18.556463,0.000000,16.486966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.556463,0.000000,16.486966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.556463,0.000000,15.893791>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,-90.000000,0> translate<18.556463,0.000000,15.893791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.556463,0.000000,15.893791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.704753,0.000000,15.745500>}
box{<0,0,-0.063500><0.209715,0.036000,0.063500> rotate<0,44.997030,0> translate<18.556463,0.000000,15.893791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.704753,0.000000,15.745500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.001341,0.000000,15.745500>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<18.704753,0.000000,15.745500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.001341,0.000000,15.745500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.149634,0.000000,15.893791>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.996427,0> translate<19.001341,0.000000,15.745500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.149634,0.000000,15.893791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.149634,0.000000,16.190378>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,90.000000,0> translate<19.149634,0.000000,16.190378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.149634,0.000000,16.190378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.853047,0.000000,16.190378>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<18.853047,0.000000,16.190378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.491981,0.000000,16.635259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.491981,0.000000,15.745500>}
box{<0,0,-0.063500><0.889759,0.036000,0.063500> rotate<0,-90.000000,0> translate<19.491981,0.000000,15.745500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.491981,0.000000,15.745500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.936859,0.000000,15.745500>}
box{<0,0,-0.063500><0.444878,0.036000,0.063500> rotate<0,0.000000,0> translate<19.491981,0.000000,15.745500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.936859,0.000000,15.745500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.085153,0.000000,15.893791>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.996427,0> translate<19.936859,0.000000,15.745500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.085153,0.000000,15.893791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.085153,0.000000,16.486966>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,90.000000,0> translate<20.085153,0.000000,16.486966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.085153,0.000000,16.486966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.936859,0.000000,16.635259>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<19.936859,0.000000,16.635259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.936859,0.000000,16.635259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.491981,0.000000,16.635259>}
box{<0,0,-0.063500><0.444878,0.036000,0.063500> rotate<0,0.000000,0> translate<19.491981,0.000000,16.635259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.051634,0.000000,1.347259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.458463,0.000000,1.347259>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,0.000000,0> translate<6.458463,0.000000,1.347259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.458463,0.000000,1.347259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.458463,0.000000,0.457500>}
box{<0,0,-0.063500><0.889759,0.036000,0.063500> rotate<0,-90.000000,0> translate<6.458463,0.000000,0.457500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.458463,0.000000,0.457500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.051634,0.000000,0.457500>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,0.000000,0> translate<6.458463,0.000000,0.457500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.458463,0.000000,0.902378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.755047,0.000000,0.902378>}
box{<0,0,-0.063500><0.296584,0.036000,0.063500> rotate<0,0.000000,0> translate<6.458463,0.000000,0.902378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.393981,0.000000,0.457500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.393981,0.000000,1.050672>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,90.000000,0> translate<7.393981,0.000000,1.050672> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.393981,0.000000,1.050672>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.838859,0.000000,1.050672>}
box{<0,0,-0.063500><0.444878,0.036000,0.063500> rotate<0,0.000000,0> translate<7.393981,0.000000,1.050672> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.838859,0.000000,1.050672>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.987153,0.000000,0.902378>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<7.838859,0.000000,1.050672> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.987153,0.000000,0.902378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.987153,0.000000,0.457500>}
box{<0,0,-0.063500><0.444878,0.036000,0.063500> rotate<0,-90.000000,0> translate<7.987153,0.000000,0.457500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.190944,0.000000,5.366966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.339234,0.000000,5.515259>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.997634,0> translate<6.190944,0.000000,5.366966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.339234,0.000000,5.515259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.635822,0.000000,5.515259>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<6.339234,0.000000,5.515259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.635822,0.000000,5.515259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.784116,0.000000,5.366966>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<6.635822,0.000000,5.515259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.784116,0.000000,5.366966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.784116,0.000000,5.218672>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,-90.000000,0> translate<6.784116,0.000000,5.218672> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.784116,0.000000,5.218672>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.635822,0.000000,5.070378>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,-44.997030,0> translate<6.635822,0.000000,5.070378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.635822,0.000000,5.070378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.487528,0.000000,5.070378>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,0.000000,0> translate<6.487528,0.000000,5.070378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.635822,0.000000,5.070378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.784116,0.000000,4.922084>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<6.635822,0.000000,5.070378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.784116,0.000000,4.922084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.784116,0.000000,4.773791>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,-90.000000,0> translate<6.784116,0.000000,4.773791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.784116,0.000000,4.773791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.635822,0.000000,4.625500>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.996427,0> translate<6.635822,0.000000,4.625500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.635822,0.000000,4.625500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.339234,0.000000,4.625500>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<6.339234,0.000000,4.625500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.339234,0.000000,4.625500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.190944,0.000000,4.773791>}
box{<0,0,-0.063500><0.209715,0.036000,0.063500> rotate<0,44.997030,0> translate<6.190944,0.000000,4.773791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.126463,0.000000,5.515259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.126463,0.000000,4.922084>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,-90.000000,0> translate<7.126463,0.000000,4.922084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.126463,0.000000,4.922084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.423047,0.000000,4.625500>}
box{<0,0,-0.063500><0.419434,0.036000,0.063500> rotate<0,44.997030,0> translate<7.126463,0.000000,4.922084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.423047,0.000000,4.625500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.719634,0.000000,4.922084>}
box{<0,0,-0.063500><0.419436,0.036000,0.063500> rotate<0,-44.996728,0> translate<7.423047,0.000000,4.625500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.719634,0.000000,4.922084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.719634,0.000000,5.515259>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,90.000000,0> translate<7.719634,0.000000,5.515259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.061981,0.000000,5.366966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.210272,0.000000,5.515259>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.997634,0> translate<8.061981,0.000000,5.366966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.210272,0.000000,5.515259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.506859,0.000000,5.515259>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<8.210272,0.000000,5.515259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.506859,0.000000,5.515259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.655153,0.000000,5.366966>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<8.506859,0.000000,5.515259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.655153,0.000000,5.366966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.655153,0.000000,5.218672>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,-90.000000,0> translate<8.655153,0.000000,5.218672> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.655153,0.000000,5.218672>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.506859,0.000000,5.070378>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,-44.997030,0> translate<8.506859,0.000000,5.070378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.506859,0.000000,5.070378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.358566,0.000000,5.070378>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,0.000000,0> translate<8.358566,0.000000,5.070378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.506859,0.000000,5.070378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.655153,0.000000,4.922084>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<8.506859,0.000000,5.070378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.655153,0.000000,4.922084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.655153,0.000000,4.773791>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,-90.000000,0> translate<8.655153,0.000000,4.773791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.655153,0.000000,4.773791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.506859,0.000000,4.625500>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.996427,0> translate<8.506859,0.000000,4.625500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.506859,0.000000,4.625500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.210272,0.000000,4.625500>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<8.210272,0.000000,4.625500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.210272,0.000000,4.625500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.061981,0.000000,4.773791>}
box{<0,0,-0.063500><0.209715,0.036000,0.063500> rotate<0,44.997030,0> translate<8.061981,0.000000,4.773791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.144366,-1.536000,38.521259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.737538,-1.536000,38.521259>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,0.000000,0> translate<5.144366,-1.536000,38.521259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.737538,-1.536000,38.521259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.737538,-1.536000,37.631500>}
box{<0,0,-0.063500><0.889759,0.036000,0.063500> rotate<0,-90.000000,0> translate<5.737538,-1.536000,37.631500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.737538,-1.536000,37.631500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.144366,-1.536000,37.631500>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,0.000000,0> translate<5.144366,-1.536000,37.631500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.737538,-1.536000,38.076378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.440953,-1.536000,38.076378>}
box{<0,0,-0.063500><0.296584,0.036000,0.063500> rotate<0,0.000000,0> translate<5.440953,-1.536000,38.076378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.802019,-1.536000,37.631500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.802019,-1.536000,38.521259>}
box{<0,0,-0.063500><0.889759,0.036000,0.063500> rotate<0,90.000000,0> translate<4.802019,-1.536000,38.521259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.802019,-1.536000,38.521259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.208847,-1.536000,37.631500>}
box{<0,0,-0.063500><1.069357,0.036000,0.063500> rotate<0,-56.306263,0> translate<4.208847,-1.536000,37.631500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.208847,-1.536000,37.631500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.208847,-1.536000,38.521259>}
box{<0,0,-0.063500><0.889759,0.036000,0.063500> rotate<0,90.000000,0> translate<4.208847,-1.536000,38.521259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.464366,-1.536000,3.222966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.612659,-1.536000,3.371259>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,-44.997030,0> translate<2.464366,-1.536000,3.222966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.612659,-1.536000,3.371259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.909247,-1.536000,3.371259>}
box{<0,0,-0.063500><0.296587,0.036000,0.063500> rotate<0,0.000000,0> translate<2.612659,-1.536000,3.371259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.909247,-1.536000,3.371259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.057538,-1.536000,3.222966>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,44.997634,0> translate<2.909247,-1.536000,3.371259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.057538,-1.536000,3.222966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.057538,-1.536000,2.629791>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,-90.000000,0> translate<3.057538,-1.536000,2.629791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.057538,-1.536000,2.629791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.909247,-1.536000,2.481500>}
box{<0,0,-0.063500><0.209715,0.036000,0.063500> rotate<0,-44.997030,0> translate<2.909247,-1.536000,2.481500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.909247,-1.536000,2.481500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.612659,-1.536000,2.481500>}
box{<0,0,-0.063500><0.296587,0.036000,0.063500> rotate<0,0.000000,0> translate<2.612659,-1.536000,2.481500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.612659,-1.536000,2.481500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.464366,-1.536000,2.629791>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,44.996427,0> translate<2.464366,-1.536000,2.629791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.464366,-1.536000,2.629791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.464366,-1.536000,2.926378>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,90.000000,0> translate<2.464366,-1.536000,2.926378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.464366,-1.536000,2.926378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.760953,-1.536000,2.926378>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<2.464366,-1.536000,2.926378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.122019,-1.536000,3.371259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.122019,-1.536000,2.481500>}
box{<0,0,-0.063500><0.889759,0.036000,0.063500> rotate<0,-90.000000,0> translate<2.122019,-1.536000,2.481500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.122019,-1.536000,2.481500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.677141,-1.536000,2.481500>}
box{<0,0,-0.063500><0.444878,0.036000,0.063500> rotate<0,0.000000,0> translate<1.677141,-1.536000,2.481500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.677141,-1.536000,2.481500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.528847,-1.536000,2.629791>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,44.996427,0> translate<1.528847,-1.536000,2.629791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.528847,-1.536000,2.629791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.528847,-1.536000,3.222966>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,90.000000,0> translate<1.528847,-1.536000,3.222966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.528847,-1.536000,3.222966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.677141,-1.536000,3.371259>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,-44.997030,0> translate<1.528847,-1.536000,3.222966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.677141,-1.536000,3.371259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.122019,-1.536000,3.371259>}
box{<0,0,-0.063500><0.444878,0.036000,0.063500> rotate<0,0.000000,0> translate<1.677141,-1.536000,3.371259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.677056,-1.536000,5.366966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.528766,-1.536000,5.515259>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,44.997634,0> translate<8.528766,-1.536000,5.515259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.528766,-1.536000,5.515259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.232178,-1.536000,5.515259>}
box{<0,0,-0.063500><0.296587,0.036000,0.063500> rotate<0,0.000000,0> translate<8.232178,-1.536000,5.515259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.232178,-1.536000,5.515259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.083884,-1.536000,5.366966>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,-44.997030,0> translate<8.083884,-1.536000,5.366966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.083884,-1.536000,5.366966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.083884,-1.536000,5.218672>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,-90.000000,0> translate<8.083884,-1.536000,5.218672> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.083884,-1.536000,5.218672>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.232178,-1.536000,5.070378>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<8.083884,-1.536000,5.218672> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.232178,-1.536000,5.070378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.380472,-1.536000,5.070378>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,0.000000,0> translate<8.232178,-1.536000,5.070378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.232178,-1.536000,5.070378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.083884,-1.536000,4.922084>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,-44.997030,0> translate<8.083884,-1.536000,4.922084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.083884,-1.536000,4.922084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.083884,-1.536000,4.773791>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,-90.000000,0> translate<8.083884,-1.536000,4.773791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.083884,-1.536000,4.773791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.232178,-1.536000,4.625500>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,44.996427,0> translate<8.083884,-1.536000,4.773791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.232178,-1.536000,4.625500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.528766,-1.536000,4.625500>}
box{<0,0,-0.063500><0.296587,0.036000,0.063500> rotate<0,0.000000,0> translate<8.232178,-1.536000,4.625500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.528766,-1.536000,4.625500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.677056,-1.536000,4.773791>}
box{<0,0,-0.063500><0.209715,0.036000,0.063500> rotate<0,-44.997030,0> translate<8.528766,-1.536000,4.625500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.741538,-1.536000,5.515259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.741538,-1.536000,4.922084>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,-90.000000,0> translate<7.741538,-1.536000,4.922084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.741538,-1.536000,4.922084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.444953,-1.536000,4.625500>}
box{<0,0,-0.063500><0.419434,0.036000,0.063500> rotate<0,-44.997030,0> translate<7.444953,-1.536000,4.625500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.444953,-1.536000,4.625500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.148366,-1.536000,4.922084>}
box{<0,0,-0.063500><0.419436,0.036000,0.063500> rotate<0,44.996728,0> translate<7.148366,-1.536000,4.922084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.148366,-1.536000,4.922084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.148366,-1.536000,5.515259>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,90.000000,0> translate<7.148366,-1.536000,5.515259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.806019,-1.536000,5.366966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.657728,-1.536000,5.515259>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,44.997634,0> translate<6.657728,-1.536000,5.515259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.657728,-1.536000,5.515259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.361141,-1.536000,5.515259>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<6.361141,-1.536000,5.515259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.361141,-1.536000,5.515259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.212847,-1.536000,5.366966>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,-44.997030,0> translate<6.212847,-1.536000,5.366966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.212847,-1.536000,5.366966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.212847,-1.536000,5.218672>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,-90.000000,0> translate<6.212847,-1.536000,5.218672> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.212847,-1.536000,5.218672>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.361141,-1.536000,5.070378>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<6.212847,-1.536000,5.218672> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.361141,-1.536000,5.070378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.509434,-1.536000,5.070378>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,0.000000,0> translate<6.361141,-1.536000,5.070378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.361141,-1.536000,5.070378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.212847,-1.536000,4.922084>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,-44.997030,0> translate<6.212847,-1.536000,4.922084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.212847,-1.536000,4.922084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.212847,-1.536000,4.773791>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,-90.000000,0> translate<6.212847,-1.536000,4.773791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.212847,-1.536000,4.773791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.361141,-1.536000,4.625500>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,44.996427,0> translate<6.212847,-1.536000,4.773791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.361141,-1.536000,4.625500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.657728,-1.536000,4.625500>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<6.361141,-1.536000,4.625500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.657728,-1.536000,4.625500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.806019,-1.536000,4.773791>}
box{<0,0,-0.063500><0.209715,0.036000,0.063500> rotate<0,-44.997030,0> translate<6.657728,-1.536000,4.625500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.640366,-1.536000,1.198966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.788659,-1.536000,1.347259>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,-44.997030,0> translate<4.640366,-1.536000,1.198966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.788659,-1.536000,1.347259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.085247,-1.536000,1.347259>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<4.788659,-1.536000,1.347259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.085247,-1.536000,1.347259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.233538,-1.536000,1.198966>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,44.997634,0> translate<5.085247,-1.536000,1.347259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.233538,-1.536000,1.198966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.233538,-1.536000,0.605791>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,-90.000000,0> translate<5.233538,-1.536000,0.605791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.233538,-1.536000,0.605791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.085247,-1.536000,0.457500>}
box{<0,0,-0.063500><0.209715,0.036000,0.063500> rotate<0,-44.997030,0> translate<5.085247,-1.536000,0.457500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.085247,-1.536000,0.457500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.788659,-1.536000,0.457500>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<4.788659,-1.536000,0.457500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.788659,-1.536000,0.457500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.640366,-1.536000,0.605791>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,44.996427,0> translate<4.640366,-1.536000,0.605791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.640366,-1.536000,0.605791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.640366,-1.536000,0.902378>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,90.000000,0> translate<4.640366,-1.536000,0.902378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.640366,-1.536000,0.902378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.936953,-1.536000,0.902378>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<4.640366,-1.536000,0.902378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.298019,-1.536000,1.347259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.298019,-1.536000,0.457500>}
box{<0,0,-0.063500><0.889759,0.036000,0.063500> rotate<0,-90.000000,0> translate<4.298019,-1.536000,0.457500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.298019,-1.536000,0.457500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.853141,-1.536000,0.457500>}
box{<0,0,-0.063500><0.444878,0.036000,0.063500> rotate<0,0.000000,0> translate<3.853141,-1.536000,0.457500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.853141,-1.536000,0.457500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.704847,-1.536000,0.605791>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,44.996427,0> translate<3.704847,-1.536000,0.605791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.704847,-1.536000,0.605791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.704847,-1.536000,1.198966>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,90.000000,0> translate<3.704847,-1.536000,1.198966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.704847,-1.536000,1.198966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.853141,-1.536000,1.347259>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,-44.997030,0> translate<3.704847,-1.536000,1.198966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.853141,-1.536000,1.347259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.298019,-1.536000,1.347259>}
box{<0,0,-0.063500><0.444878,0.036000,0.063500> rotate<0,0.000000,0> translate<3.853141,-1.536000,1.347259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.280366,-1.536000,1.347259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.873538,-1.536000,1.347259>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,0.000000,0> translate<7.280366,-1.536000,1.347259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.873538,-1.536000,1.347259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.873538,-1.536000,0.457500>}
box{<0,0,-0.063500><0.889759,0.036000,0.063500> rotate<0,-90.000000,0> translate<7.873538,-1.536000,0.457500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.873538,-1.536000,0.457500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.280366,-1.536000,0.457500>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,0.000000,0> translate<7.280366,-1.536000,0.457500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.873538,-1.536000,0.902378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.576953,-1.536000,0.902378>}
box{<0,0,-0.063500><0.296584,0.036000,0.063500> rotate<0,0.000000,0> translate<7.576953,-1.536000,0.902378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.938019,-1.536000,0.457500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.938019,-1.536000,1.050672>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,90.000000,0> translate<6.938019,-1.536000,1.050672> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.938019,-1.536000,1.050672>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.493141,-1.536000,1.050672>}
box{<0,0,-0.063500><0.444878,0.036000,0.063500> rotate<0,0.000000,0> translate<6.493141,-1.536000,1.050672> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.493141,-1.536000,1.050672>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.344847,-1.536000,0.902378>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,-44.997030,0> translate<6.344847,-1.536000,0.902378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.344847,-1.536000,0.902378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.344847,-1.536000,0.457500>}
box{<0,0,-0.063500><0.444878,0.036000,0.063500> rotate<0,-90.000000,0> translate<6.344847,-1.536000,0.457500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.937219,-1.536000,1.327259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.937219,-1.536000,0.734084>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,-90.000000,0> translate<10.937219,-1.536000,0.734084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.937219,-1.536000,0.734084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.640634,-1.536000,0.437500>}
box{<0,0,-0.063500><0.419434,0.036000,0.063500> rotate<0,-44.997030,0> translate<10.640634,-1.536000,0.437500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.640634,-1.536000,0.437500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.344047,-1.536000,0.734084>}
box{<0,0,-0.063500><0.419436,0.036000,0.063500> rotate<0,44.996728,0> translate<10.344047,-1.536000,0.734084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.344047,-1.536000,0.734084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.344047,-1.536000,1.327259>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,90.000000,0> translate<10.344047,-1.536000,1.327259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.001700,-1.536000,0.437500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.705116,-1.536000,0.437500>}
box{<0,0,-0.063500><0.296584,0.036000,0.063500> rotate<0,0.000000,0> translate<9.705116,-1.536000,0.437500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.853409,-1.536000,0.437500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.853409,-1.536000,1.327259>}
box{<0,0,-0.063500><0.889759,0.036000,0.063500> rotate<0,90.000000,0> translate<9.853409,-1.536000,1.327259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.001700,-1.536000,1.327259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.705116,-1.536000,1.327259>}
box{<0,0,-0.063500><0.296584,0.036000,0.063500> rotate<0,0.000000,0> translate<9.705116,-1.536000,1.327259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.378022,-1.536000,0.437500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.378022,-1.536000,1.327259>}
box{<0,0,-0.063500><0.889759,0.036000,0.063500> rotate<0,90.000000,0> translate<9.378022,-1.536000,1.327259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.378022,-1.536000,1.327259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.784850,-1.536000,0.437500>}
box{<0,0,-0.063500><1.069357,0.036000,0.063500> rotate<0,-56.306263,0> translate<8.784850,-1.536000,0.437500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.784850,-1.536000,0.437500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.784850,-1.536000,1.327259>}
box{<0,0,-0.063500><0.889759,0.036000,0.063500> rotate<0,90.000000,0> translate<8.784850,-1.536000,1.327259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.741056,-1.536000,1.130966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.592766,-1.536000,1.279259>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,44.997634,0> translate<19.592766,-1.536000,1.279259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.592766,-1.536000,1.279259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.296178,-1.536000,1.279259>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<19.296178,-1.536000,1.279259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.296178,-1.536000,1.279259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.147884,-1.536000,1.130966>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,-44.997030,0> translate<19.147884,-1.536000,1.130966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.147884,-1.536000,1.130966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.147884,-1.536000,0.982672>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,-90.000000,0> translate<19.147884,-1.536000,0.982672> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.147884,-1.536000,0.982672>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.296178,-1.536000,0.834378>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<19.147884,-1.536000,0.982672> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.296178,-1.536000,0.834378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.444472,-1.536000,0.834378>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,0.000000,0> translate<19.296178,-1.536000,0.834378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.296178,-1.536000,0.834378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.147884,-1.536000,0.686084>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,-44.997030,0> translate<19.147884,-1.536000,0.686084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.147884,-1.536000,0.686084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.147884,-1.536000,0.537791>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,-90.000000,0> translate<19.147884,-1.536000,0.537791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.147884,-1.536000,0.537791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.296178,-1.536000,0.389500>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,44.996427,0> translate<19.147884,-1.536000,0.537791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.296178,-1.536000,0.389500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.592766,-1.536000,0.389500>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<19.296178,-1.536000,0.389500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.592766,-1.536000,0.389500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.741056,-1.536000,0.537791>}
box{<0,0,-0.063500><0.209715,0.036000,0.063500> rotate<0,-44.997030,0> translate<19.592766,-1.536000,0.389500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.805537,-1.536000,1.279259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.805537,-1.536000,0.686084>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,-90.000000,0> translate<18.805537,-1.536000,0.686084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.805537,-1.536000,0.686084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.508953,-1.536000,0.389500>}
box{<0,0,-0.063500><0.419434,0.036000,0.063500> rotate<0,-44.997030,0> translate<18.508953,-1.536000,0.389500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.508953,-1.536000,0.389500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.212366,-1.536000,0.686084>}
box{<0,0,-0.063500><0.419436,0.036000,0.063500> rotate<0,44.996728,0> translate<18.212366,-1.536000,0.686084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.212366,-1.536000,0.686084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.212366,-1.536000,1.279259>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,90.000000,0> translate<18.212366,-1.536000,1.279259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.870019,-1.536000,1.130966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.721728,-1.536000,1.279259>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,44.997634,0> translate<17.721728,-1.536000,1.279259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.721728,-1.536000,1.279259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.425141,-1.536000,1.279259>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<17.425141,-1.536000,1.279259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.425141,-1.536000,1.279259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.276847,-1.536000,1.130966>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,-44.997030,0> translate<17.276847,-1.536000,1.130966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.276847,-1.536000,1.130966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.276847,-1.536000,0.982672>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,-90.000000,0> translate<17.276847,-1.536000,0.982672> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.276847,-1.536000,0.982672>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.425141,-1.536000,0.834378>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<17.276847,-1.536000,0.982672> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.425141,-1.536000,0.834378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.573434,-1.536000,0.834378>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,0.000000,0> translate<17.425141,-1.536000,0.834378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.425141,-1.536000,0.834378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.276847,-1.536000,0.686084>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,-44.997030,0> translate<17.276847,-1.536000,0.686084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.276847,-1.536000,0.686084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.276847,-1.536000,0.537791>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,-90.000000,0> translate<17.276847,-1.536000,0.537791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.276847,-1.536000,0.537791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.425141,-1.536000,0.389500>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,44.996427,0> translate<17.276847,-1.536000,0.537791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.425141,-1.536000,0.389500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.721728,-1.536000,0.389500>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<17.425141,-1.536000,0.389500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.721728,-1.536000,0.389500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.870019,-1.536000,0.537791>}
box{<0,0,-0.063500><0.209715,0.036000,0.063500> rotate<0,-44.997030,0> translate<17.721728,-1.536000,0.389500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.312366,-1.536000,1.170966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.460659,-1.536000,1.319259>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,-44.997030,0> translate<21.312366,-1.536000,1.170966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.460659,-1.536000,1.319259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.757247,-1.536000,1.319259>}
box{<0,0,-0.063500><0.296587,0.036000,0.063500> rotate<0,0.000000,0> translate<21.460659,-1.536000,1.319259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.757247,-1.536000,1.319259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.905538,-1.536000,1.170966>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,44.997634,0> translate<21.757247,-1.536000,1.319259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.905538,-1.536000,1.170966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.905538,-1.536000,0.577791>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,-90.000000,0> translate<21.905538,-1.536000,0.577791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.905538,-1.536000,0.577791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.757247,-1.536000,0.429500>}
box{<0,0,-0.063500><0.209715,0.036000,0.063500> rotate<0,-44.997030,0> translate<21.757247,-1.536000,0.429500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.757247,-1.536000,0.429500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.460659,-1.536000,0.429500>}
box{<0,0,-0.063500><0.296587,0.036000,0.063500> rotate<0,0.000000,0> translate<21.460659,-1.536000,0.429500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.460659,-1.536000,0.429500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.312366,-1.536000,0.577791>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,44.996427,0> translate<21.312366,-1.536000,0.577791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.312366,-1.536000,0.577791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.312366,-1.536000,0.874378>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,90.000000,0> translate<21.312366,-1.536000,0.874378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.312366,-1.536000,0.874378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.608953,-1.536000,0.874378>}
box{<0,0,-0.063500><0.296587,0.036000,0.063500> rotate<0,0.000000,0> translate<21.312366,-1.536000,0.874378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.970019,-1.536000,1.319259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.970019,-1.536000,0.429500>}
box{<0,0,-0.063500><0.889759,0.036000,0.063500> rotate<0,-90.000000,0> translate<20.970019,-1.536000,0.429500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.970019,-1.536000,0.429500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.525141,-1.536000,0.429500>}
box{<0,0,-0.063500><0.444878,0.036000,0.063500> rotate<0,0.000000,0> translate<20.525141,-1.536000,0.429500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.525141,-1.536000,0.429500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.376847,-1.536000,0.577791>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,44.996427,0> translate<20.376847,-1.536000,0.577791> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.376847,-1.536000,0.577791>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.376847,-1.536000,1.170966>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,90.000000,0> translate<20.376847,-1.536000,1.170966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.376847,-1.536000,1.170966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.525141,-1.536000,1.319259>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,-44.997030,0> translate<20.376847,-1.536000,1.170966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.525141,-1.536000,1.319259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.970019,-1.536000,1.319259>}
box{<0,0,-0.063500><0.444878,0.036000,0.063500> rotate<0,0.000000,0> translate<20.525141,-1.536000,1.319259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.008953,-1.536000,0.369500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.008953,-1.536000,1.259259>}
box{<0,0,-0.063500><0.889759,0.036000,0.063500> rotate<0,90.000000,0> translate<24.008953,-1.536000,1.259259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.305537,-1.536000,1.259259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.712366,-1.536000,1.259259>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,0.000000,0> translate<23.712366,-1.536000,1.259259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.370019,-1.536000,1.259259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.776847,-1.536000,0.369500>}
box{<0,0,-0.063500><1.069357,0.036000,0.063500> rotate<0,-56.306263,0> translate<22.776847,-1.536000,0.369500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.776847,-1.536000,1.259259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.370019,-1.536000,0.369500>}
box{<0,0,-0.063500><1.069357,0.036000,0.063500> rotate<0,56.306263,0> translate<22.776847,-1.536000,1.259259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.905538,-1.536000,0.409500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.905538,-1.536000,1.299259>}
box{<0,0,-0.063500><0.889759,0.036000,0.063500> rotate<0,90.000000,0> translate<26.905538,-1.536000,1.299259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.905538,-1.536000,1.299259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.460659,-1.536000,1.299259>}
box{<0,0,-0.063500><0.444878,0.036000,0.063500> rotate<0,0.000000,0> translate<26.460659,-1.536000,1.299259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.460659,-1.536000,1.299259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.312366,-1.536000,1.150966>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,-44.997030,0> translate<26.312366,-1.536000,1.150966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.312366,-1.536000,1.150966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.312366,-1.536000,0.854378>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,-90.000000,0> translate<26.312366,-1.536000,0.854378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.312366,-1.536000,0.854378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.460659,-1.536000,0.706084>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<26.312366,-1.536000,0.854378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.460659,-1.536000,0.706084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.905538,-1.536000,0.706084>}
box{<0,0,-0.063500><0.444878,0.036000,0.063500> rotate<0,0.000000,0> translate<26.460659,-1.536000,0.706084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.608953,-1.536000,0.706084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.312366,-1.536000,0.409500>}
box{<0,0,-0.063500><0.419436,0.036000,0.063500> rotate<0,-44.996728,0> translate<26.312366,-1.536000,0.409500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.970019,-1.536000,1.299259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.376847,-1.536000,0.409500>}
box{<0,0,-0.063500><1.069357,0.036000,0.063500> rotate<0,-56.306263,0> translate<25.376847,-1.536000,0.409500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.376847,-1.536000,1.299259>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.970019,-1.536000,0.409500>}
box{<0,0,-0.063500><1.069357,0.036000,0.063500> rotate<0,56.306263,0> translate<25.376847,-1.536000,1.299259> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.761981,0.000000,18.570378>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.355153,0.000000,18.570378>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,0.000000,0> translate<12.761981,0.000000,18.570378> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.058566,0.000000,18.866966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.058566,0.000000,18.273791>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,-90.000000,0> translate<13.058566,0.000000,18.273791> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.038100,0.000000,45.374703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.038100,0.000000,44.434100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.038100,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.038100,0.000000,44.747634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.665169,0.000000,45.374703>}
box{<0,0,-0.038100><0.886809,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.038100,0.000000,44.747634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.194866,0.000000,44.904400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.665169,0.000000,44.434100>}
box{<0,0,-0.038100><0.665107,0.036000,0.038100> rotate<0,44.996840,0> translate<30.194866,0.000000,44.904400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.443919,0.000000,44.434100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.130384,0.000000,44.434100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<31.130384,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.130384,0.000000,44.434100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.973619,0.000000,44.590866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<30.973619,0.000000,44.590866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.973619,0.000000,44.590866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.973619,0.000000,44.904400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<30.973619,0.000000,44.904400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.973619,0.000000,44.904400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.130384,0.000000,45.061169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<30.973619,0.000000,44.904400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.130384,0.000000,45.061169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.443919,0.000000,45.061169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<31.130384,0.000000,45.061169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.443919,0.000000,45.061169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.600688,0.000000,44.904400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<31.443919,0.000000,45.061169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.600688,0.000000,44.904400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.600688,0.000000,44.747634>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.600688,0.000000,44.747634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.600688,0.000000,44.747634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.973619,0.000000,44.747634>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<30.973619,0.000000,44.747634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.909137,0.000000,45.061169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.909137,0.000000,44.590866>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.909137,0.000000,44.590866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.909137,0.000000,44.590866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.065903,0.000000,44.434100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<31.909137,0.000000,44.590866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.065903,0.000000,44.434100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.536206,0.000000,44.434100>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<32.065903,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.536206,0.000000,45.061169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.536206,0.000000,44.277334>}
box{<0,0,-0.038100><0.783834,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.536206,0.000000,44.277334> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.536206,0.000000,44.277334>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.379438,0.000000,44.120566>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<32.379438,0.000000,44.120566> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.379438,0.000000,44.120566>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.222672,0.000000,44.120566>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<32.222672,0.000000,44.120566> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.844656,0.000000,45.374703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.001422,0.000000,45.374703>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<32.844656,0.000000,45.374703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.001422,0.000000,45.374703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.001422,0.000000,44.434100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.001422,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.844656,0.000000,44.434100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.158191,0.000000,44.434100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<32.844656,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.938634,0.000000,44.434100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.625100,0.000000,44.434100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<33.625100,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.625100,0.000000,44.434100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.468334,0.000000,44.590866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<33.468334,0.000000,44.590866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.468334,0.000000,44.590866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.468334,0.000000,44.904400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<33.468334,0.000000,44.904400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.468334,0.000000,44.904400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.625100,0.000000,45.061169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<33.468334,0.000000,44.904400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.625100,0.000000,45.061169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.938634,0.000000,45.061169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<33.625100,0.000000,45.061169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.938634,0.000000,45.061169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.095403,0.000000,44.904400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<33.938634,0.000000,45.061169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.095403,0.000000,44.904400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.095403,0.000000,44.747634>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.095403,0.000000,44.747634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.095403,0.000000,44.747634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.468334,0.000000,44.747634>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<33.468334,0.000000,44.747634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.403853,0.000000,44.434100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.874153,0.000000,44.434100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<34.403853,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.874153,0.000000,44.434100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.030922,0.000000,44.590866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<34.874153,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.030922,0.000000,44.590866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.874153,0.000000,44.747634>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<34.874153,0.000000,44.747634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.874153,0.000000,44.747634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.560619,0.000000,44.747634>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<34.560619,0.000000,44.747634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.560619,0.000000,44.747634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.403853,0.000000,44.904400>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<34.403853,0.000000,44.904400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.403853,0.000000,44.904400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.560619,0.000000,45.061169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<34.403853,0.000000,44.904400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.560619,0.000000,45.061169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.030922,0.000000,45.061169>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<34.560619,0.000000,45.061169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.274891,0.000000,44.434100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.274891,0.000000,45.374703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<36.274891,0.000000,45.374703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.274891,0.000000,45.374703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.745191,0.000000,45.374703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<36.274891,0.000000,45.374703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.745191,0.000000,45.374703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.901959,0.000000,45.217934>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<36.745191,0.000000,45.374703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.901959,0.000000,45.217934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.901959,0.000000,45.061169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.901959,0.000000,45.061169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.901959,0.000000,45.061169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.745191,0.000000,44.904400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.745191,0.000000,44.904400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.745191,0.000000,44.904400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.901959,0.000000,44.747634>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<36.745191,0.000000,44.904400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.901959,0.000000,44.747634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.901959,0.000000,44.590866>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.901959,0.000000,44.590866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.901959,0.000000,44.590866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.745191,0.000000,44.434100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<36.745191,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.745191,0.000000,44.434100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.274891,0.000000,44.434100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<36.274891,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.274891,0.000000,44.904400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.745191,0.000000,44.904400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<36.274891,0.000000,44.904400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.210409,0.000000,45.374703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.367175,0.000000,45.374703>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<37.210409,0.000000,45.374703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.367175,0.000000,45.374703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.367175,0.000000,44.434100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.367175,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.210409,0.000000,44.434100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.523944,0.000000,44.434100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<37.210409,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.834088,0.000000,45.061169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.834088,0.000000,44.590866>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.834088,0.000000,44.590866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.834088,0.000000,44.590866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.990853,0.000000,44.434100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<37.834088,0.000000,44.590866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.990853,0.000000,44.434100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.461156,0.000000,44.434100>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<37.990853,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.461156,0.000000,44.434100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.461156,0.000000,45.061169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<38.461156,0.000000,45.061169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.239906,0.000000,44.434100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.926372,0.000000,44.434100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<38.926372,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.926372,0.000000,44.434100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.769606,0.000000,44.590866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<38.769606,0.000000,44.590866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.769606,0.000000,44.590866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.769606,0.000000,44.904400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<38.769606,0.000000,44.904400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.769606,0.000000,44.904400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.926372,0.000000,45.061169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<38.769606,0.000000,44.904400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.926372,0.000000,45.061169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.239906,0.000000,45.061169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<38.926372,0.000000,45.061169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.239906,0.000000,45.061169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.396675,0.000000,44.904400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<39.239906,0.000000,45.061169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.396675,0.000000,44.904400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.396675,0.000000,44.747634>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.396675,0.000000,44.747634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.396675,0.000000,44.747634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.769606,0.000000,44.747634>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<38.769606,0.000000,44.747634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.861891,0.000000,45.217934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.861891,0.000000,44.590866>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.861891,0.000000,44.590866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.861891,0.000000,44.590866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.018659,0.000000,44.434100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<39.861891,0.000000,44.590866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.705125,0.000000,45.061169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.018659,0.000000,45.061169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<39.705125,0.000000,45.061169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.485569,0.000000,44.434100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.799103,0.000000,44.434100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<40.485569,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.799103,0.000000,44.434100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.955872,0.000000,44.590866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<40.799103,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.955872,0.000000,44.590866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.955872,0.000000,44.904400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<40.955872,0.000000,44.904400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.955872,0.000000,44.904400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.799103,0.000000,45.061169>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<40.799103,0.000000,45.061169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.799103,0.000000,45.061169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.485569,0.000000,45.061169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<40.485569,0.000000,45.061169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.485569,0.000000,45.061169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.328803,0.000000,44.904400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<40.328803,0.000000,44.904400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.328803,0.000000,44.904400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.328803,0.000000,44.590866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.328803,0.000000,44.590866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.328803,0.000000,44.590866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.485569,0.000000,44.434100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<40.328803,0.000000,44.590866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.421087,0.000000,44.434100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.734622,0.000000,44.434100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<41.421087,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.734622,0.000000,44.434100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.891391,0.000000,44.590866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<41.734622,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.891391,0.000000,44.590866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.891391,0.000000,44.904400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<41.891391,0.000000,44.904400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.891391,0.000000,44.904400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.734622,0.000000,45.061169>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<41.734622,0.000000,45.061169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.734622,0.000000,45.061169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.421087,0.000000,45.061169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<41.421087,0.000000,45.061169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.421087,0.000000,45.061169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.264322,0.000000,44.904400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<41.264322,0.000000,44.904400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.264322,0.000000,44.904400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.264322,0.000000,44.590866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<41.264322,0.000000,44.590866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.264322,0.000000,44.590866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.421087,0.000000,44.434100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<41.264322,0.000000,44.590866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.356606,0.000000,45.217934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.356606,0.000000,44.590866>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.356606,0.000000,44.590866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.356606,0.000000,44.590866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.513375,0.000000,44.434100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<42.356606,0.000000,44.590866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.199841,0.000000,45.061169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.513375,0.000000,45.061169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<42.199841,0.000000,45.061169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.823519,0.000000,45.374703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.823519,0.000000,44.434100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.823519,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.823519,0.000000,44.904400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.980284,0.000000,45.061169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<42.823519,0.000000,44.904400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.980284,0.000000,45.061169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.293819,0.000000,45.061169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<42.980284,0.000000,45.061169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.293819,0.000000,45.061169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.450588,0.000000,44.904400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<43.293819,0.000000,45.061169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.450588,0.000000,44.904400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.450588,0.000000,44.434100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.450588,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.321625,0.000000,45.374703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.694556,0.000000,45.374703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<44.694556,0.000000,45.374703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.694556,0.000000,45.374703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.694556,0.000000,44.434100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<44.694556,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.694556,0.000000,44.434100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.321625,0.000000,44.434100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<44.694556,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.694556,0.000000,44.904400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.008091,0.000000,44.904400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<44.694556,0.000000,44.904400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.257144,0.000000,45.217934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.100375,0.000000,45.374703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<46.100375,0.000000,45.374703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.100375,0.000000,45.374703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.786841,0.000000,45.374703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<45.786841,0.000000,45.374703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.786841,0.000000,45.374703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.630075,0.000000,45.217934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<45.630075,0.000000,45.217934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.630075,0.000000,45.217934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.630075,0.000000,45.061169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<45.630075,0.000000,45.061169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.630075,0.000000,45.061169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.786841,0.000000,44.904400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<45.630075,0.000000,45.061169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.786841,0.000000,44.904400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.100375,0.000000,44.904400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<45.786841,0.000000,44.904400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.100375,0.000000,44.904400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.257144,0.000000,44.747634>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<46.100375,0.000000,44.904400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.257144,0.000000,44.747634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.257144,0.000000,44.590866>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,-90.000000,0> translate<46.257144,0.000000,44.590866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.257144,0.000000,44.590866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.100375,0.000000,44.434100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<46.100375,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.100375,0.000000,44.434100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.786841,0.000000,44.434100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<45.786841,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.786841,0.000000,44.434100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.630075,0.000000,44.590866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<45.630075,0.000000,44.590866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.565594,0.000000,44.434100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.565594,0.000000,45.374703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<46.565594,0.000000,45.374703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.565594,0.000000,45.374703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.035894,0.000000,45.374703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<46.565594,0.000000,45.374703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.035894,0.000000,45.374703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.192663,0.000000,45.217934>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<47.035894,0.000000,45.374703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.192663,0.000000,45.217934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.192663,0.000000,44.904400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<47.192663,0.000000,44.904400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.192663,0.000000,44.904400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.035894,0.000000,44.747634>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<47.035894,0.000000,44.747634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.035894,0.000000,44.747634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.565594,0.000000,44.747634>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<46.565594,0.000000,44.747634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.501113,0.000000,44.904400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.128181,0.000000,44.904400>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<47.501113,0.000000,44.904400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.436631,0.000000,45.217934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.593397,0.000000,45.374703>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<48.436631,0.000000,45.217934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.593397,0.000000,45.374703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.906931,0.000000,45.374703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<48.593397,0.000000,45.374703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.906931,0.000000,45.374703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.063700,0.000000,45.217934>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<48.906931,0.000000,45.374703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.063700,0.000000,45.217934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.063700,0.000000,45.061169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<49.063700,0.000000,45.061169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.063700,0.000000,45.061169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.906931,0.000000,44.904400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<48.906931,0.000000,44.904400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.906931,0.000000,44.904400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.750166,0.000000,44.904400>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<48.750166,0.000000,44.904400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.906931,0.000000,44.904400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.063700,0.000000,44.747634>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<48.906931,0.000000,44.904400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.063700,0.000000,44.747634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.063700,0.000000,44.590866>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,-90.000000,0> translate<49.063700,0.000000,44.590866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.063700,0.000000,44.590866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.906931,0.000000,44.434100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<48.906931,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.906931,0.000000,44.434100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.593397,0.000000,44.434100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<48.593397,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.593397,0.000000,44.434100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.436631,0.000000,44.590866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<48.436631,0.000000,44.590866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.999219,0.000000,44.434100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.372150,0.000000,44.434100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<49.372150,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.372150,0.000000,44.434100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.999219,0.000000,45.061169>}
box{<0,0,-0.038100><0.886809,0.036000,0.038100> rotate<0,-44.997030,0> translate<49.372150,0.000000,44.434100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.999219,0.000000,45.061169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.999219,0.000000,45.217934>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,90.000000,0> translate<49.999219,0.000000,45.217934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.999219,0.000000,45.217934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.842450,0.000000,45.374703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<49.842450,0.000000,45.374703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.842450,0.000000,45.374703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.528916,0.000000,45.374703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<49.528916,0.000000,45.374703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.528916,0.000000,45.374703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.372150,0.000000,45.217934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<49.372150,0.000000,45.217934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.038100,0.000000,43.850703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.038100,0.000000,43.223634>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.038100,0.000000,43.223634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.038100,0.000000,43.223634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.351634,0.000000,42.910100>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<30.038100,0.000000,43.223634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.351634,0.000000,42.910100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.665169,0.000000,43.223634>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.351634,0.000000,42.910100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.665169,0.000000,43.223634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.665169,0.000000,43.850703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<30.665169,0.000000,43.850703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.443919,0.000000,42.910100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.130384,0.000000,42.910100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<31.130384,0.000000,42.910100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.130384,0.000000,42.910100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.973619,0.000000,43.066866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<30.973619,0.000000,43.066866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.973619,0.000000,43.066866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.973619,0.000000,43.380400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<30.973619,0.000000,43.380400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.973619,0.000000,43.380400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.130384,0.000000,43.537169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<30.973619,0.000000,43.380400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.130384,0.000000,43.537169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.443919,0.000000,43.537169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<31.130384,0.000000,43.537169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.443919,0.000000,43.537169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.600688,0.000000,43.380400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<31.443919,0.000000,43.537169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.600688,0.000000,43.380400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.600688,0.000000,43.223634>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.600688,0.000000,43.223634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.600688,0.000000,43.223634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.973619,0.000000,43.223634>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<30.973619,0.000000,43.223634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.909137,0.000000,42.910100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.909137,0.000000,43.537169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<31.909137,0.000000,43.537169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.909137,0.000000,43.223634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.222672,0.000000,43.537169>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.909137,0.000000,43.223634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.222672,0.000000,43.537169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.379438,0.000000,43.537169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<32.222672,0.000000,43.537169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.624253,0.000000,43.537169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.937787,0.000000,43.850703>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.624253,0.000000,43.537169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.937787,0.000000,43.850703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.937787,0.000000,42.910100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.937787,0.000000,42.910100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.624253,0.000000,42.910100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.251322,0.000000,42.910100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<33.624253,0.000000,42.910100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.559772,0.000000,42.910100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.559772,0.000000,43.066866>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,90.000000,0> translate<34.559772,0.000000,43.066866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.559772,0.000000,43.066866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.716538,0.000000,43.066866>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<34.559772,0.000000,43.066866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.716538,0.000000,43.066866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.716538,0.000000,42.910100>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.716538,0.000000,42.910100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.716538,0.000000,42.910100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.559772,0.000000,42.910100>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<34.559772,0.000000,42.910100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.027531,0.000000,43.066866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.027531,0.000000,43.693934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<35.027531,0.000000,43.693934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.027531,0.000000,43.693934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.184297,0.000000,43.850703>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<35.027531,0.000000,43.693934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.184297,0.000000,43.850703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.497831,0.000000,43.850703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<35.184297,0.000000,43.850703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.497831,0.000000,43.850703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.654600,0.000000,43.693934>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<35.497831,0.000000,43.850703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.654600,0.000000,43.693934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.654600,0.000000,43.066866>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.654600,0.000000,43.066866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.654600,0.000000,43.066866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.497831,0.000000,42.910100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<35.497831,0.000000,42.910100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.497831,0.000000,42.910100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.184297,0.000000,42.910100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<35.184297,0.000000,42.910100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.184297,0.000000,42.910100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.027531,0.000000,43.066866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<35.027531,0.000000,43.066866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.027531,0.000000,43.066866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.654600,0.000000,43.693934>}
box{<0,0,-0.038100><0.886809,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.027531,0.000000,43.066866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.038100,0.000000,39.862100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.038100,0.000000,40.802703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<30.038100,0.000000,40.802703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.038100,0.000000,40.802703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.351634,0.000000,40.489169>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<30.038100,0.000000,40.802703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.351634,0.000000,40.489169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.665169,0.000000,40.802703>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.351634,0.000000,40.489169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.665169,0.000000,40.802703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.665169,0.000000,39.862100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.665169,0.000000,39.862100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.130384,0.000000,40.489169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.443919,0.000000,40.489169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<31.130384,0.000000,40.489169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.443919,0.000000,40.489169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.600688,0.000000,40.332400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<31.443919,0.000000,40.489169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.600688,0.000000,40.332400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.600688,0.000000,39.862100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.600688,0.000000,39.862100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.600688,0.000000,39.862100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.130384,0.000000,39.862100>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<31.130384,0.000000,39.862100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.130384,0.000000,39.862100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.973619,0.000000,40.018866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<30.973619,0.000000,40.018866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.973619,0.000000,40.018866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.130384,0.000000,40.175634>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<30.973619,0.000000,40.018866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.130384,0.000000,40.175634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.600688,0.000000,40.175634>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<31.130384,0.000000,40.175634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.536206,0.000000,40.802703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.536206,0.000000,39.862100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.536206,0.000000,39.862100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.536206,0.000000,39.862100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.065903,0.000000,39.862100>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<32.065903,0.000000,39.862100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.065903,0.000000,39.862100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.909137,0.000000,40.018866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<31.909137,0.000000,40.018866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.909137,0.000000,40.018866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.909137,0.000000,40.332400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<31.909137,0.000000,40.332400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.909137,0.000000,40.332400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.065903,0.000000,40.489169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<31.909137,0.000000,40.332400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.065903,0.000000,40.489169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.536206,0.000000,40.489169>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<32.065903,0.000000,40.489169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.314956,0.000000,39.862100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.001422,0.000000,39.862100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<33.001422,0.000000,39.862100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.001422,0.000000,39.862100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.844656,0.000000,40.018866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<32.844656,0.000000,40.018866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.844656,0.000000,40.018866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.844656,0.000000,40.332400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<32.844656,0.000000,40.332400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.844656,0.000000,40.332400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.001422,0.000000,40.489169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<32.844656,0.000000,40.332400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.001422,0.000000,40.489169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.314956,0.000000,40.489169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<33.001422,0.000000,40.489169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.314956,0.000000,40.489169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.471725,0.000000,40.332400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<33.314956,0.000000,40.489169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.471725,0.000000,40.332400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.471725,0.000000,40.175634>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.471725,0.000000,40.175634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.471725,0.000000,40.175634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.844656,0.000000,40.175634>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<32.844656,0.000000,40.175634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.715694,0.000000,39.862100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.029228,0.000000,39.862100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<34.715694,0.000000,39.862100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.872459,0.000000,39.862100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.872459,0.000000,40.802703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<34.872459,0.000000,40.802703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.715694,0.000000,40.802703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.029228,0.000000,40.802703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<34.715694,0.000000,40.802703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.339372,0.000000,39.862100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.339372,0.000000,40.489169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<35.339372,0.000000,40.489169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.339372,0.000000,40.489169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.809672,0.000000,40.489169>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<35.339372,0.000000,40.489169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.809672,0.000000,40.489169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.966441,0.000000,40.332400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<35.809672,0.000000,40.489169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.966441,0.000000,40.332400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.966441,0.000000,39.862100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.966441,0.000000,39.862100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.210409,0.000000,39.862100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.523944,0.000000,39.862100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<37.210409,0.000000,39.862100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.367175,0.000000,39.862100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.367175,0.000000,40.802703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<37.367175,0.000000,40.802703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.210409,0.000000,40.802703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.523944,0.000000,40.802703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<37.210409,0.000000,40.802703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.834088,0.000000,39.862100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.834088,0.000000,40.489169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<37.834088,0.000000,40.489169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.834088,0.000000,40.489169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.304388,0.000000,40.489169>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<37.834088,0.000000,40.489169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.304388,0.000000,40.489169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.461156,0.000000,40.332400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<38.304388,0.000000,40.489169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.461156,0.000000,40.332400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.461156,0.000000,39.862100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.461156,0.000000,39.862100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.396675,0.000000,40.802703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.396675,0.000000,39.862100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.396675,0.000000,39.862100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.396675,0.000000,39.862100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.926372,0.000000,39.862100>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<38.926372,0.000000,39.862100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.926372,0.000000,39.862100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.769606,0.000000,40.018866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<38.769606,0.000000,40.018866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.769606,0.000000,40.018866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.769606,0.000000,40.332400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<38.769606,0.000000,40.332400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.769606,0.000000,40.332400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.926372,0.000000,40.489169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<38.769606,0.000000,40.332400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.926372,0.000000,40.489169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.396675,0.000000,40.489169>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<38.926372,0.000000,40.489169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.861891,0.000000,39.862100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.175425,0.000000,39.862100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<39.861891,0.000000,39.862100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.175425,0.000000,39.862100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.332194,0.000000,40.018866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<40.175425,0.000000,39.862100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.332194,0.000000,40.018866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.332194,0.000000,40.332400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<40.332194,0.000000,40.332400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.332194,0.000000,40.332400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.175425,0.000000,40.489169>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<40.175425,0.000000,40.489169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.175425,0.000000,40.489169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.861891,0.000000,40.489169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<39.861891,0.000000,40.489169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.861891,0.000000,40.489169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.705125,0.000000,40.332400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<39.705125,0.000000,40.332400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.705125,0.000000,40.332400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.705125,0.000000,40.018866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.705125,0.000000,40.018866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.705125,0.000000,40.018866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.861891,0.000000,39.862100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<39.705125,0.000000,40.018866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.640644,0.000000,39.862100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.640644,0.000000,40.489169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<40.640644,0.000000,40.489169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.640644,0.000000,40.489169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.110944,0.000000,40.489169>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<40.640644,0.000000,40.489169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.110944,0.000000,40.489169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.267713,0.000000,40.332400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<41.110944,0.000000,40.489169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.267713,0.000000,40.332400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.267713,0.000000,39.862100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<41.267713,0.000000,39.862100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.046463,0.000000,39.862100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.732928,0.000000,39.862100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<41.732928,0.000000,39.862100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.732928,0.000000,39.862100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.576163,0.000000,40.018866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<41.576163,0.000000,40.018866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.576163,0.000000,40.018866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.576163,0.000000,40.332400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<41.576163,0.000000,40.332400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.576163,0.000000,40.332400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.732928,0.000000,40.489169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<41.576163,0.000000,40.332400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.732928,0.000000,40.489169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.046463,0.000000,40.489169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<41.732928,0.000000,40.489169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.046463,0.000000,40.489169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.203231,0.000000,40.332400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<42.046463,0.000000,40.489169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.203231,0.000000,40.332400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.203231,0.000000,40.175634>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.203231,0.000000,40.175634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.203231,0.000000,40.175634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.576163,0.000000,40.175634>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<41.576163,0.000000,40.175634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.511681,0.000000,39.862100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.981981,0.000000,39.862100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<42.511681,0.000000,39.862100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.981981,0.000000,39.862100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.138750,0.000000,40.018866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<42.981981,0.000000,39.862100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.138750,0.000000,40.018866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.981981,0.000000,40.175634>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<42.981981,0.000000,40.175634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.981981,0.000000,40.175634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.668447,0.000000,40.175634>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<42.668447,0.000000,40.175634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.668447,0.000000,40.175634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.511681,0.000000,40.332400>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<42.511681,0.000000,40.332400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.511681,0.000000,40.332400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.668447,0.000000,40.489169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<42.511681,0.000000,40.332400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.668447,0.000000,40.489169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.138750,0.000000,40.489169>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<42.668447,0.000000,40.489169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.447200,0.000000,40.489169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.603966,0.000000,40.489169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<43.447200,0.000000,40.489169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.603966,0.000000,40.489169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.603966,0.000000,39.862100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.603966,0.000000,39.862100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.447200,0.000000,39.862100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.760734,0.000000,39.862100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<43.447200,0.000000,39.862100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.603966,0.000000,40.959469>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.603966,0.000000,40.802703>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.603966,0.000000,40.802703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.227644,0.000000,40.489169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.541178,0.000000,40.489169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<44.227644,0.000000,40.489169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.541178,0.000000,40.489169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.697947,0.000000,40.332400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<44.541178,0.000000,40.489169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.697947,0.000000,40.332400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.697947,0.000000,39.862100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<44.697947,0.000000,39.862100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.697947,0.000000,39.862100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.227644,0.000000,39.862100>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<44.227644,0.000000,39.862100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.227644,0.000000,39.862100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.070878,0.000000,40.018866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<44.070878,0.000000,40.018866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.070878,0.000000,40.018866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.227644,0.000000,40.175634>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<44.070878,0.000000,40.018866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.227644,0.000000,40.175634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.697947,0.000000,40.175634>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<44.227644,0.000000,40.175634> }
//C1 silk screen
box{<-0.200000,0,-0.500000><0.200000,0.036000,0.500000> rotate<0,-0.000000,0> translate<19.110000,0.000000,6.898000>}
//C2 silk screen
box{<-0.200000,0,-0.500000><0.200000,0.036000,0.500000> rotate<0,-90.000000,0> translate<16.490000,0.000000,11.168000>}
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.996000,0.000000,36.900000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.996000,0.000000,37.500000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<5.996000,0.000000,37.500000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.196000,0.000000,36.900000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.196000,0.000000,37.500000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<7.196000,0.000000,37.500000> }
//C4 silk screen
box{<-0.200000,0,-0.500000><0.200000,0.036000,0.500000> rotate<0,-90.000000,0> translate<11.296000,0.000000,16.172000>}
//C5 silk screen
box{<-0.200000,0,-0.500000><0.200000,0.036000,0.500000> rotate<0,-0.000000,0> translate<13.308000,0.000000,4.566000>}
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.032600,-1.536000,34.510600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.447400,-1.536000,34.510600>}
box{<0,0,-0.063500><8.585200,0.036000,0.063500> rotate<0,0.000000,0> translate<11.447400,-1.536000,34.510600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.447400,-1.536000,34.510600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.447400,-1.536000,38.625400>}
box{<0,0,-0.063500><4.114800,0.036000,0.063500> rotate<0,90.000000,0> translate<11.447400,-1.536000,38.625400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.447400,-1.536000,38.625400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.032600,-1.536000,38.625400>}
box{<0,0,-0.063500><8.585200,0.036000,0.063500> rotate<0,0.000000,0> translate<11.447400,-1.536000,38.625400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.032600,-1.536000,38.625400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.032600,-1.536000,34.510600>}
box{<0,0,-0.063500><4.114800,0.036000,0.063500> rotate<0,-90.000000,0> translate<20.032600,-1.536000,34.510600> }
//C7 silk screen
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-180.000000,0> translate<10.124150,0.000000,8.766900>}
//C8 silk screen
box{<-0.200000,0,-0.500000><0.200000,0.036000,0.500000> rotate<0,-90.000000,0> translate<5.172000,0.000000,37.308000>}
//C9 silk screen
box{<-0.200000,0,-0.500000><0.200000,0.036000,0.500000> rotate<0,-180.000000,0> translate<23.316000,0.000000,5.368000>}
//C11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.750000,0.000000,14.600000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.900000,0.000000,14.600000>}
box{<0,0,-0.063500><1.150000,0.036000,0.063500> rotate<0,0.000000,0> translate<12.750000,0.000000,14.600000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.900000,0.000000,14.600000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.100000,0.000000,14.600000>}
box{<0,0,-0.063500><2.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<13.900000,0.000000,14.600000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.100000,0.000000,14.600000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.250000,0.000000,14.600000>}
box{<0,0,-0.063500><1.150000,0.036000,0.063500> rotate<0,0.000000,0> translate<16.100000,0.000000,14.600000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.250000,0.000000,14.600000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.250000,0.000000,17.800000>}
box{<0,0,-0.063500><3.200000,0.036000,0.063500> rotate<0,90.000000,0> translate<17.250000,0.000000,17.800000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.250000,0.000000,17.800000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.100000,0.000000,17.800000>}
box{<0,0,-0.063500><1.150000,0.036000,0.063500> rotate<0,0.000000,0> translate<16.100000,0.000000,17.800000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.100000,0.000000,17.800000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.900000,0.000000,17.800000>}
box{<0,0,-0.063500><2.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<13.900000,0.000000,17.800000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.900000,0.000000,17.800000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.750000,0.000000,17.800000>}
box{<0,0,-0.063500><1.150000,0.036000,0.063500> rotate<0,0.000000,0> translate<12.750000,0.000000,17.800000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.750000,0.000000,17.800000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.750000,0.000000,14.600000>}
box{<0,0,-0.063500><3.200000,0.036000,0.063500> rotate<0,-90.000000,0> translate<12.750000,0.000000,14.600000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.900000,0.000000,14.600000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.900000,0.000000,17.800000>}
box{<0,0,-0.063500><3.200000,0.036000,0.063500> rotate<0,90.000000,0> translate<13.900000,0.000000,17.800000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.100000,0.000000,14.600000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.100000,0.000000,17.800000>}
box{<0,0,-0.063500><3.200000,0.036000,0.063500> rotate<0,90.000000,0> translate<16.100000,0.000000,17.800000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.300000,0.000000,14.400000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.700000,0.000000,14.400000>}
box{<0,0,-0.063500><4.600000,0.036000,0.063500> rotate<0,0.000000,0> translate<12.700000,0.000000,14.400000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.300000,0.000000,18.000000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.700000,0.000000,18.000000>}
box{<0,0,-0.063500><4.600000,0.036000,0.063500> rotate<0,0.000000,0> translate<12.700000,0.000000,18.000000> }
box{<-0.550000,0,-1.600000><0.550000,0.036000,1.600000> rotate<0,-180.000000,0> translate<16.650000,0.000000,16.200000>}
box{<-0.550000,0,-1.600000><0.550000,0.036000,1.600000> rotate<0,-180.000000,0> translate<13.350000,0.000000,16.200000>}
//D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.017200,0.000000,32.706200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.259000,0.000000,32.706200>}
box{<0,0,-0.076200><4.241800,0.036000,0.076200> rotate<0,0.000000,0> translate<45.017200,0.000000,32.706200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.017200,0.000000,35.093800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.233600,0.000000,35.093800>}
box{<0,0,-0.076200><4.216400,0.036000,0.076200> rotate<0,0.000000,0> translate<45.017200,0.000000,35.093800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.473000,0.000000,32.900000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.846000,0.000000,33.900000>}
box{<0,0,-0.101600><1.698567,0.036000,0.101600> rotate<0,-36.064673,0> translate<46.473000,0.000000,32.900000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.846000,0.000000,33.900000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.473000,0.000000,34.900000>}
box{<0,0,-0.101600><1.698567,0.036000,0.101600> rotate<0,36.064673,0> translate<46.473000,0.000000,34.900000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.473000,0.000000,34.900000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.473000,0.000000,32.900000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<46.473000,0.000000,32.900000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.979200,0.000000,32.706200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.197000,0.000000,32.706200>}
box{<0,0,-0.076200><2.217800,0.036000,0.076200> rotate<0,0.000000,0> translate<45.979200,0.000000,32.706200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.979200,0.000000,35.093800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.171600,0.000000,35.093800>}
box{<0,0,-0.076200><2.192400,0.036000,0.076200> rotate<0,0.000000,0> translate<45.979200,0.000000,35.093800> }
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-180.000000,0> translate<44.788600,0.000000,33.900000>}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-180.000000,0> translate<49.462200,0.000000,33.900000>}
box{<-0.444500,0,-1.193800><0.444500,0.036000,1.193800> rotate<0,-180.000000,0> translate<48.103300,0.000000,33.900000>}
//JP3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.320000,0.000000,13.449000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.320000,0.000000,14.719000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<23.320000,0.000000,14.719000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<22.050000,0.000000,14.084000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<19.510000,0.000000,14.084000>}
//JP4 silk screen
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<5.070000,0.000000,5.080000>}
//JP5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.914000,0.000000,1.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.914000,0.000000,2.959000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.914000,0.000000,2.959000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<7.104000,0.000000,2.324000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<9.644000,0.000000,2.324000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<4.564000,0.000000,2.324000>}
//K1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.155000,0.000000,10.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.155000,0.000000,30.687000>}
box{<0,0,-0.076200><20.574000,0.036000,0.076200> rotate<0,90.000000,0> translate<55.155000,0.000000,30.687000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.645000,0.000000,30.687000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.155000,0.000000,30.687000>}
box{<0,0,-0.076200><16.510000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.645000,0.000000,30.687000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.645000,0.000000,30.687000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.645000,0.000000,10.113000>}
box{<0,0,-0.076200><20.574000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.645000,0.000000,10.113000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.155000,0.000000,10.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.645000,0.000000,10.113000>}
box{<0,0,-0.076200><16.510000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.645000,0.000000,10.113000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.615000,0.000000,24.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.615000,0.000000,22.940000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.615000,0.000000,22.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.185000,0.000000,22.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.185000,0.000000,24.845000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,90.000000,0> translate<41.185000,0.000000,24.845000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<48.170000,0.000000,25.480000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.630000,0.000000,25.480000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,0.000000,0> translate<45.630000,0.000000,25.480000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.630000,0.000000,20.400000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<48.170000,0.000000,20.400000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,0.000000,0> translate<45.630000,0.000000,20.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.185000,0.000000,22.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.630000,0.000000,22.940000>}
box{<0,0,-0.076200><4.445000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.185000,0.000000,22.940000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.630000,0.000000,22.940000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.630000,0.000000,20.400000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,-90.000000,0> translate<45.630000,0.000000,20.400000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<48.170000,0.000000,22.940000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<48.170000,0.000000,25.480000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,90.000000,0> translate<48.170000,0.000000,25.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.170000,0.000000,22.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.615000,0.000000,22.940000>}
box{<0,0,-0.076200><4.445000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.170000,0.000000,22.940000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<48.170000,0.000000,20.400000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<48.170000,0.000000,22.305000>}
box{<0,0,-0.127000><1.905000,0.036000,0.127000> rotate<0,90.000000,0> translate<48.170000,0.000000,22.305000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<48.170000,0.000000,22.305000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<48.170000,0.000000,22.940000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<48.170000,0.000000,22.940000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.630000,0.000000,25.480000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.630000,0.000000,23.575000>}
box{<0,0,-0.127000><1.905000,0.036000,0.127000> rotate<0,-90.000000,0> translate<45.630000,0.000000,23.575000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.630000,0.000000,23.575000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.630000,0.000000,22.940000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<45.630000,0.000000,22.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.630000,0.000000,23.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.170000,0.000000,22.305000>}
box{<0,0,-0.076200><2.839806,0.036000,0.076200> rotate<0,26.563298,0> translate<45.630000,0.000000,23.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.900000,0.000000,18.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.900000,0.000000,15.955000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.900000,0.000000,15.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.995000,0.000000,14.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.455000,0.000000,14.050000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.455000,0.000000,14.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.805000,0.000000,14.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.345000,0.000000,14.050000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.805000,0.000000,14.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.440000,0.000000,13.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.900000,0.000000,15.955000>}
box{<0,0,-0.076200><3.592102,0.036000,0.076200> rotate<0,44.997030,0> translate<46.900000,0.000000,15.955000> }
//LED1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.100000,0.000000,7.100000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.600000,0.000000,7.500000>}
box{<0,0,-0.063500><0.640312,0.036000,0.063500> rotate<0,38.657257,0> translate<6.600000,0.000000,7.500000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.600000,0.000000,7.500000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.600000,0.000000,6.700000>}
box{<0,0,-0.063500><0.800000,0.036000,0.063500> rotate<0,-90.000000,0> translate<6.600000,0.000000,6.700000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.600000,0.000000,6.700000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.100000,0.000000,7.100000>}
box{<0,0,-0.063500><0.640312,0.036000,0.063500> rotate<0,-38.657257,0> translate<6.600000,0.000000,6.700000> }
//OK1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.760000,0.000000,25.079000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.840000,0.000000,25.079000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.760000,0.000000,25.079000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.840000,0.000000,30.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.760000,0.000000,30.921000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.760000,0.000000,30.921000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.760000,0.000000,25.079000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.760000,0.000000,30.921000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,90.000000,0> translate<31.760000,0.000000,30.921000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.840000,0.000000,25.079000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.840000,0.000000,26.984000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,90.000000,0> translate<36.840000,0.000000,26.984000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.840000,0.000000,30.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.840000,0.000000,29.016000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.840000,0.000000,29.016000> }
object{ARC(1.016000,0.152400,90.000000,270.000000,0.036000) translate<36.840000,0.000000,28.000000>}
//P1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.424000,0.000000,1.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.424000,0.000000,2.859000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<27.424000,0.000000,2.859000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<21.074000,0.000000,2.224000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<23.614000,0.000000,2.224000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<26.154000,0.000000,2.224000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<18.534000,0.000000,2.224000>}
//PGM silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.040000,0.000000,2.964000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.040000,0.000000,2.964000>}
box{<0,0,-0.101600><3.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<29.040000,0.000000,2.964000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.040000,0.000000,2.964000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.040000,0.000000,1.464000>}
box{<0,0,-0.101600><1.500000,0.036000,0.101600> rotate<0,-90.000000,0> translate<32.040000,0.000000,1.464000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.040000,0.000000,1.464000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.040000,0.000000,1.464000>}
box{<0,0,-0.101600><3.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<29.040000,0.000000,1.464000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.040000,0.000000,1.464000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.040000,0.000000,2.964000>}
box{<0,0,-0.101600><1.500000,0.036000,0.101600> rotate<0,90.000000,0> translate<29.040000,0.000000,2.964000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.290000,0.000000,2.964000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.790000,0.000000,2.964000>}
box{<0,0,-0.101600><2.500000,0.036000,0.101600> rotate<0,0.000000,0> translate<29.290000,0.000000,2.964000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.290000,0.000000,1.464000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.740000,0.000000,1.464000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,0.000000,0> translate<29.290000,0.000000,1.464000> }
difference{
cylinder{<30.540000,0,2.214000><30.540000,0.036000,2.214000>0.827000 translate<0,0.000000,0>}
cylinder{<30.540000,-0.1,2.214000><30.540000,0.135000,2.214000>0.573000 translate<0,0.000000,0>}}
//R1 silk screen
box{<-0.300000,0,-0.500000><0.300000,0.036000,0.500000> rotate<0,-180.000000,0> translate<27.232000,0.000000,16.664000>}
//R2 silk screen
box{<-0.300000,0,-0.500000><0.300000,0.036000,0.500000> rotate<0,-0.000000,0> translate<2.240000,0.000000,40.648000>}
//R3 silk screen
box{<-0.300000,0,-0.500000><0.300000,0.036000,0.500000> rotate<0,-90.000000,0> translate<18.476000,0.000000,4.650000>}
//R4 silk screen
box{<-0.300000,0,-0.500000><0.300000,0.036000,0.500000> rotate<0,-0.000000,0> translate<27.124000,0.000000,13.100000>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.990000,0.000000,37.435000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.010000,0.000000,37.435000>}
box{<0,0,-0.050800><1.020000,0.036000,0.050800> rotate<0,0.000000,0> translate<29.990000,0.000000,37.435000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.990000,0.000000,36.365000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.010000,0.000000,36.365000>}
box{<0,0,-0.050800><1.020000,0.036000,0.050800> rotate<0,0.000000,0> translate<29.990000,0.000000,36.365000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.645800,0.000000,37.789000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.354200,0.000000,37.789000>}
box{<0,0,-0.101600><3.708400,0.036000,0.101600> rotate<0,0.000000,0> translate<28.645800,0.000000,37.789000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.354200,0.000000,37.789000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.354200,0.000000,36.011000>}
box{<0,0,-0.101600><1.778000,0.036000,0.101600> rotate<0,-90.000000,0> translate<32.354200,0.000000,36.011000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.354200,0.000000,36.011000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.645800,0.000000,36.011000>}
box{<0,0,-0.101600><3.708400,0.036000,0.101600> rotate<0,0.000000,0> translate<28.645800,0.000000,36.011000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.645800,0.000000,36.011000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.645800,0.000000,37.789000>}
box{<0,0,-0.101600><1.778000,0.036000,0.101600> rotate<0,90.000000,0> translate<28.645800,0.000000,37.789000> }
box{<-0.296800,0,-0.650000><0.296800,0.036000,0.650000> rotate<0,-0.000000,0> translate<31.203200,0.000000,36.900000>}
box{<-0.291600,0,-0.650000><0.291600,0.036000,0.650000> rotate<0,-0.000000,0> translate<29.791600,0.000000,36.900000>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.935000,-1.536000,27.190000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.935000,-1.536000,28.210000>}
box{<0,0,-0.050800><1.020000,0.036000,0.050800> rotate<0,90.000000,0> translate<38.935000,-1.536000,28.210000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.865000,-1.536000,27.190000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.865000,-1.536000,28.210000>}
box{<0,0,-0.050800><1.020000,0.036000,0.050800> rotate<0,90.000000,0> translate<37.865000,-1.536000,28.210000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.289000,-1.536000,25.845800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.289000,-1.536000,29.554200>}
box{<0,0,-0.101600><3.708400,0.036000,0.101600> rotate<0,90.000000,0> translate<39.289000,-1.536000,29.554200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.289000,-1.536000,29.554200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.511000,-1.536000,29.554200>}
box{<0,0,-0.101600><1.778000,0.036000,0.101600> rotate<0,0.000000,0> translate<37.511000,-1.536000,29.554200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.511000,-1.536000,29.554200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.511000,-1.536000,25.845800>}
box{<0,0,-0.101600><3.708400,0.036000,0.101600> rotate<0,-90.000000,0> translate<37.511000,-1.536000,25.845800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.511000,-1.536000,25.845800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.289000,-1.536000,25.845800>}
box{<0,0,-0.101600><1.778000,0.036000,0.101600> rotate<0,0.000000,0> translate<37.511000,-1.536000,25.845800> }
box{<-0.296800,0,-0.650000><0.296800,0.036000,0.650000> rotate<0,-90.000000,0> translate<38.400000,-1.536000,28.403200>}
box{<-0.291600,0,-0.650000><0.291600,0.036000,0.650000> rotate<0,-90.000000,0> translate<38.400000,-1.536000,26.991600>}
//R7 silk screen
box{<-0.300000,0,-0.500000><0.300000,0.036000,0.500000> rotate<0,-0.000000,0> translate<6.800000,0.000000,8.490000>}
//R8 silk screen
box{<-0.300000,0,-0.500000><0.300000,0.036000,0.500000> rotate<0,-270.000000,0> translate<8.900000,0.000000,13.800000>}
//R9 silk screen
box{<-0.300000,0,-0.500000><0.300000,0.036000,0.500000> rotate<0,-90.000000,0> translate<8.900000,0.000000,10.800000>}
//RST silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.746000,0.000000,1.154000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.746000,0.000000,1.154000>}
box{<0,0,-0.101600><3.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<12.746000,0.000000,1.154000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.746000,0.000000,1.154000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.746000,0.000000,2.654000>}
box{<0,0,-0.101600><1.500000,0.036000,0.101600> rotate<0,90.000000,0> translate<12.746000,0.000000,2.654000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.746000,0.000000,2.654000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.746000,0.000000,2.654000>}
box{<0,0,-0.101600><3.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<12.746000,0.000000,2.654000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.746000,0.000000,2.654000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.746000,0.000000,1.154000>}
box{<0,0,-0.101600><1.500000,0.036000,0.101600> rotate<0,-90.000000,0> translate<15.746000,0.000000,1.154000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.496000,0.000000,1.154000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.996000,0.000000,1.154000>}
box{<0,0,-0.101600><2.500000,0.036000,0.101600> rotate<0,0.000000,0> translate<12.996000,0.000000,1.154000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.496000,0.000000,2.654000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.046000,0.000000,2.654000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,0.000000,0> translate<13.046000,0.000000,2.654000> }
difference{
cylinder{<14.246000,0,1.904000><14.246000,0.036000,1.904000>0.827000 translate<0,0.000000,0>}
cylinder{<14.246000,-0.1,1.904000><14.246000,0.135000,1.904000>0.573000 translate<0,0.000000,0>}}
//T1 silk screen
object{ARC(2.412959,0.050800,22.641400,67.358600,0.036000) translate<39.100000,0.000000,35.800000>}
object{ARC(2.412959,0.050800,292.641400,337.358600,0.036000) translate<39.100000,0.000000,35.800000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.163000,0.000000,35.292000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.163000,0.000000,36.308000>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<35.163000,0.000000,36.308000> }
object{ARC(2.413053,0.050800,67.359500,202.640500,0.036000) translate<39.100100,0.000000,35.800000>}
object{ARC(2.412959,0.050800,202.641400,247.358600,0.036000) translate<39.100000,0.000000,35.800000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.163000,0.000000,35.292000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.223500,0.000000,35.292000>}
box{<0,0,-0.063500><1.060500,0.036000,0.063500> rotate<0,0.000000,0> translate<35.163000,0.000000,35.292000> }
object{ARC(2.412962,0.050800,247.358600,292.641400,0.036000) translate<39.100000,0.000000,35.800003>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.163000,0.000000,36.308000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.223500,0.000000,36.308000>}
box{<0,0,-0.063500><1.060500,0.036000,0.063500> rotate<0,0.000000,0> translate<35.163000,0.000000,36.308000> }
object{ARC(2.412962,0.050800,337.358600,382.641400,0.036000) translate<39.099997,0.000000,35.800000>}
difference{
cylinder{<39.100000,0,35.800000><39.100000,0.036000,35.800000>2.984500 translate<0,0.000000,0>}
cylinder{<39.100000,-0.1,35.800000><39.100000,0.135000,35.800000>2.857500 translate<0,0.000000,0>}}
//U$1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.788000,0.000000,12.450700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.788000,0.000000,7.853300>}
box{<0,0,-0.063500><4.597400,0.036000,0.063500> rotate<0,-90.000000,0> translate<18.788000,0.000000,7.853300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.788000,0.000000,12.450700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.078800,0.000000,12.450700>}
box{<0,0,-0.063500><2.290800,0.036000,0.063500> rotate<0,0.000000,0> translate<18.788000,0.000000,12.450700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.788000,0.000000,7.853300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.078800,0.000000,7.853300>}
box{<0,0,-0.063500><2.290800,0.036000,0.063500> rotate<0,0.000000,0> translate<18.788000,0.000000,7.853300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.078800,0.000000,12.450700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.078800,0.000000,7.853300>}
box{<0,0,-0.063500><4.597400,0.036000,0.063500> rotate<0,-90.000000,0> translate<21.078800,0.000000,7.853300> }
//U$2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.158000,0.000000,10.010000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.158000,0.000000,10.010000>}
box{<0,0,-0.127000><3.000000,0.036000,0.127000> rotate<0,0.000000,0> translate<11.158000,0.000000,10.010000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.158000,0.000000,10.010000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.158000,0.000000,13.210000>}
box{<0,0,-0.127000><3.200000,0.036000,0.127000> rotate<0,90.000000,0> translate<11.158000,0.000000,13.210000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.158000,0.000000,13.210000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.158000,0.000000,13.210000>}
box{<0,0,-0.127000><3.000000,0.036000,0.127000> rotate<0,0.000000,0> translate<11.158000,0.000000,13.210000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.158000,0.000000,13.210000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.158000,0.000000,10.010000>}
box{<0,0,-0.127000><3.200000,0.036000,0.127000> rotate<0,-90.000000,0> translate<14.158000,0.000000,10.010000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.758000,0.000000,9.460000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.758000,0.000000,9.760000>}
box{<0,0,-0.127000><0.300000,0.036000,0.127000> rotate<0,90.000000,0> translate<14.758000,0.000000,9.760000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.758000,0.000000,9.760000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.408000,0.000000,9.760000>}
box{<0,0,-0.127000><0.350000,0.036000,0.127000> rotate<0,0.000000,0> translate<14.408000,0.000000,9.760000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.408000,0.000000,9.760000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.408000,0.000000,9.460000>}
box{<0,0,-0.127000><0.300000,0.036000,0.127000> rotate<0,-90.000000,0> translate<14.408000,0.000000,9.460000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.408000,0.000000,9.460000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.758000,0.000000,9.460000>}
box{<0,0,-0.127000><0.350000,0.036000,0.127000> rotate<0,0.000000,0> translate<14.408000,0.000000,9.460000> }
//U3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.422000,0.000000,20.045000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.645000,0.000000,20.045000>}
box{<0,0,-0.101600><2.777000,0.036000,0.101600> rotate<0,0.000000,0> translate<8.645000,0.000000,20.045000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.645000,0.000000,20.045000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.645000,0.000000,21.072000>}
box{<0,0,-0.101600><1.027000,0.036000,0.101600> rotate<0,90.000000,0> translate<8.645000,0.000000,21.072000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.122000,0.000000,20.045000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.899000,0.000000,20.045000>}
box{<0,0,-0.101600><2.777000,0.036000,0.101600> rotate<0,0.000000,0> translate<24.122000,0.000000,20.045000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.899000,0.000000,20.045000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.899000,0.000000,21.072000>}
box{<0,0,-0.101600><1.027000,0.036000,0.101600> rotate<0,90.000000,0> translate<26.899000,0.000000,21.072000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.645000,0.000000,38.783000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.645000,0.000000,45.799000>}
box{<0,0,-0.101600><7.016000,0.036000,0.101600> rotate<0,90.000000,0> translate<8.645000,0.000000,45.799000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.899000,0.000000,38.783000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.899000,0.000000,45.799000>}
box{<0,0,-0.101600><7.016000,0.036000,0.101600> rotate<0,90.000000,0> translate<26.899000,0.000000,45.799000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.645000,0.000000,45.799000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.899000,0.000000,45.799000>}
box{<0,0,-0.101600><18.254000,0.036000,0.101600> rotate<0,0.000000,0> translate<8.645000,0.000000,45.799000> }
//X1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.772000,0.000000,8.983000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.028000,0.000000,8.983000>}
box{<0,0,-0.076200><16.256000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.772000,0.000000,8.983000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.028000,0.000000,8.983000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.028000,0.000000,3.649000>}
box{<0,0,-0.076200><5.334000,0.036000,0.076200> rotate<0,-90.000000,0> translate<55.028000,0.000000,3.649000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.028000,0.000000,3.649000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.520000,0.000000,3.649000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<54.520000,0.000000,3.649000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.520000,0.000000,3.649000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.520000,0.000000,3.268000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<54.520000,0.000000,3.268000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.772000,0.000000,8.983000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.772000,0.000000,6.443000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.772000,0.000000,6.443000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.772000,0.000000,3.776000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.280000,0.000000,3.776000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.772000,0.000000,3.776000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.280000,0.000000,3.776000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.280000,0.000000,3.268000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.280000,0.000000,3.268000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.614000,0.000000,3.776000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.106000,0.000000,3.776000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.106000,0.000000,3.776000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.106000,0.000000,3.776000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.106000,0.000000,3.268000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.106000,0.000000,3.268000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.106000,0.000000,3.268000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.344000,0.000000,3.268000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.344000,0.000000,3.268000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.614000,0.000000,3.776000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.614000,0.000000,3.268000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.614000,0.000000,3.268000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.614000,0.000000,3.268000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.376000,0.000000,3.268000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.614000,0.000000,3.268000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.772000,0.000000,5.427000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.661000,0.000000,5.427000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.772000,0.000000,5.427000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.772000,0.000000,5.427000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.772000,0.000000,3.776000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.772000,0.000000,3.776000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.661000,0.000000,5.427000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.661000,0.000000,6.443000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<39.661000,0.000000,6.443000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.661000,0.000000,6.443000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.772000,0.000000,6.443000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.772000,0.000000,6.443000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.010000,0.000000,9.745000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.010000,0.000000,2.125000>}
box{<0,0,-0.076200><7.620000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.010000,0.000000,2.125000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.010000,0.000000,9.745000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.790000,0.000000,9.745000>}
box{<0,0,-0.076200><17.780000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.010000,0.000000,9.745000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.790000,0.000000,2.125000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.790000,0.000000,9.745000>}
box{<0,0,-0.076200><7.620000,0.036000,0.076200> rotate<0,90.000000,0> translate<55.790000,0.000000,9.745000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.790000,0.000000,2.125000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.010000,0.000000,2.125000>}
box{<0,0,-0.076200><17.780000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.010000,0.000000,2.125000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.296000,0.000000,3.268000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.280000,0.000000,3.268000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.280000,0.000000,3.268000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.520000,0.000000,3.268000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.504000,0.000000,3.268000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.504000,0.000000,3.268000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.694000,0.000000,3.776000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.694000,0.000000,3.268000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.694000,0.000000,3.268000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.694000,0.000000,3.776000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.186000,0.000000,3.776000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.186000,0.000000,3.776000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.186000,0.000000,3.776000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.186000,0.000000,3.268000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.186000,0.000000,3.268000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.186000,0.000000,3.268000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.424000,0.000000,3.268000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.424000,0.000000,3.268000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.694000,0.000000,3.268000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.456000,0.000000,3.268000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.694000,0.000000,3.268000> }
object{ARC(2.303438,0.152400,228.877861,311.423805,0.036000) translate<46.899994,0.000000,4.995200>}
object{ARC(2.303366,0.152400,228.876095,311.421810,0.036000) translate<41.820100,0.000000,4.995200>}
object{ARC(2.303578,0.152400,228.881393,311.427794,0.036000) translate<51.979778,0.000000,4.995200>}
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  ESP_WROOM_32_BREAKOUT(-28.600000,0,-23.090000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//C6	330u	VISHAY_C
//C11		GRM43D
//JP3		1X02_ROUND
//JP4		1X01_ROUND
//JP5		1X03_ROUND
//P1		1X04_ROUND
//PGM	DTSM-3	DTSM-3
//RST	DTSM-3	DTSM-3
//U$1	HT7833	SOT89
//U$2	TPS82140	TPS82140
//U3	ESP-WROOM-32	ESP-WROOM-32
//X1	socket Contact	W232-3
