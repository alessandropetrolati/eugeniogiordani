<CsoundSynthesizer>



<CsOptions>
;Studio Audigy
-+P -m0 -d -+O 


</CsOptions>

<CsInstruments>



	sr     = 44100
	kr     = 441
	ksmps  = 100
	nchnls = 2


giUpsliders	init	12	;Sliders graphic update
gkinstrLoad 	init 	107	;Strumento chiamato dal bottone Load snap...
gitems		init 	64	;n. potenza di 2 delle tabelle che contengonogli snaps
giNumSlid 	init 	6	;n. di parametri effett. salvati/recuperati



#define  X0 #10#
#define  dX #40#

#define  Y0 #30#
#define  dY #25#
#define  xf #80#
#define  yf #10#




#define SCALEFACTOR # 1400 #
#define DEFAULT # 0 #
gisna0 	ftgen 200, 0, gitems, -2, $DEFAULT
gisna1 	ftgen 201, 0, gitems, -2, $DEFAULT
gisna2 	ftgen 202, 0, gitems, -2, $DEFAULT
gisna3 	ftgen 203, 0, gitems, -2, $DEFAULT
gisna4 	ftgen 204, 0, gitems, -2, $DEFAULT
gisna5 	ftgen 205, 0, gitems, -2, $DEFAULT
gisna6 	ftgen 206, 0, gitems, -2, $DEFAULT
gisna7 	ftgen 207, 0, gitems, -2, $DEFAULT
gisna8 	ftgen 208, 0, gitems, -2, $DEFAULT
gisna9 	ftgen 209, 0, gitems, -2, $DEFAULT
gisna10 ftgen 210, 0, gitems, -2, $DEFAULT
gisna11 ftgen 211, 0, gitems, -2, $DEFAULT
gisna12 ftgen 212, 0, gitems, -2, $DEFAULT
gisna13 ftgen 213, 0, gitems, -2, $DEFAULT
gisna14 ftgen 214, 0, gitems, -2, $DEFAULT
gisna15 ftgen 215, 0, gitems, -2, $DEFAULT
gisna16 ftgen 216, 0, gitems, -2, $DEFAULT
gisna17 ftgen 217, 0, gitems, -2, $DEFAULT
gisna18 ftgen 218, 0, gitems, -2, $DEFAULT
gisna19 ftgen 219, 0, gitems, -2, $DEFAULT
gisna20 ftgen 220, 0, gitems, -2, $DEFAULT
gisna21 ftgen 221, 0, gitems, -2, $DEFAULT
gisna22 ftgen 222, 0, gitems, -2, $DEFAULT
gisna23 ftgen 223, 0, gitems, -2, $DEFAULT
gisna24 ftgen 224, 0, gitems, -2, $DEFAULT
gisna25 ftgen 225, 0, gitems, -2, $DEFAULT
gisna26 ftgen 226, 0, gitems, -2, $DEFAULT
gisna27 ftgen 227, 0, gitems, -2, $DEFAULT
gisna28 ftgen 228, 0, gitems, -2, $DEFAULT
gisna29 ftgen 229, 0, gitems, -2, $DEFAULT
gisna30 ftgen 230, 0, gitems, -2, $DEFAULT
gisna31 ftgen 231, 0, gitems, -2, $DEFAULT
gisna32 ftgen 232, 0, gitems, -2, $DEFAULT
gisna33 ftgen 233, 0, gitems, -2, $DEFAULT
gisna34 ftgen 234, 0, gitems, -2, $DEFAULT
gisna35 ftgen 235, 0, gitems, -2, $DEFAULT
gisna36 ftgen 236, 0, gitems, -2, $DEFAULT
gisna37 ftgen 237, 0, gitems, -2, $DEFAULT
gisna38 ftgen 238, 0, gitems, -2, $DEFAULT
gisna39 ftgen 239, 0, gitems, -2, $DEFAULT
gisna40 ftgen 240, 0, gitems, -2, $DEFAULT
gisna41 ftgen 241, 0, gitems, -2, $DEFAULT
gisna42 ftgen 242, 0, gitems, -2, $DEFAULT
gisna43 ftgen 243, 0, gitems, -2, $DEFAULT
gisna44 ftgen 244, 0, gitems, -2, $DEFAULT
gisna45 ftgen 245, 0, gitems, -2, $DEFAULT
gisna46 ftgen 246, 0, gitems, -2, $DEFAULT
gisna47 ftgen 247, 0, gitems, -2, $DEFAULT





giTrfuns ftgen 198,0,2,      -2,gisna0,gisna1 ;Temporized Transition
giTrans ftgen  199,0,gitems,-2,0             ;contents of f199 don't matter
giTEMP  ftgen  260,0,gitems,-2,0



gkband init 0.001
gkmute init 1

gifn1	ftgen   20, 0 , 8192, 20 , 2,  1



gifn1	ftgen	1,0,16384,10,1,0,0,0.125,0.25, 0.7, 1, 0.7, 0.25,  0, 0, 0, 0, 0.2, 0.5, 0.7, 0.5, 0.1
gifn2	ftgen	2,0,16384,10,1,0,0,0,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,1,0,1
gifn3	ftgen	3,0,16384,10,1,0,1,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,1
gifn4	ftgen	4,0,16384,10,1,0,0,0.5,0,0.3,0.2,0,0,0,0,0,0,0,0.1
gifn5	ftgen	5,0,16384,10,1,0







FLcolor		110,170,197
FLpanel "Additive FM Extended Synthesizer", 1000, 700, 0, 0
FLcolor2	250,100, 150
FLtextSize 11



	FLtabs  1000,700, 0,0
;        FLgroup "Group1", 1000,700,0,15
;	FLgroup_end

	FLgroup "Sound Gen", 1000,700,0,15


gk_quit, ihquit		FLbutton "Exit" ,1, 0, 2, 60, 28, 930,20, +105,100, 0, 0.1
			FLsetColor 100,50,250,ihquit	


;gk_fadeout, gihfadeout	FLbutton "FadeOut" ,1, 0, 2, 60, 28, 590,20,-1; +105,100, 0, 0.1


gkcall1,ihcall1		FLbutton "On/Off#1", 1,0,2,100,30, 10,200,+105,21,0,36000
gkcall2,ihcall2		FLbutton "On/Off#2", 1,0,2,100,30,110,200,+105,22,0,36000
gkcall3,ihcall3		FLbutton "On/Off#3", 1,0,2,100,30,210,200,+105,23,0,36000
gkcall4,ihcall4		FLbutton "On/Off#4", 1,0,2,100,30,310,200,+105,24,0,36000
gkcall5,ihcall5		FLbutton "On/Off#5", 1,0,2,100,30,410,200,+105,25,0,36000
gkcall6,ihcall6		FLbutton "On/Off#6", 1,0,2,100,30,510,200,+105,26,0,36000
gkcall7,ihcall7		FLbutton "On/Off#7", 1,0,2,100,30,610,200,+105,27,0,36000
gkcall8,ihcall8		FLbutton "On/Off#8", 1,0,2,100,30,710,200,+105,28,0,36000


gkGet,ihInd		FLbutBank  12,6,8,190,140, 800,372,    -105
			FLsetVal_i 1,ihInd
			FLsetTextSize 9,ihInd

gkBank,ihBank		FLcount "Bank no.#" , 1,4,1,2,1,100,14,800,515,    -105
			FLsetTextSize 9,ihBank			
			FLsetColor 0,255,0,ihBank	
	
gk9,ihS			FLbutton "WriteSNAP", 3,0,2,74,25, 810,540,+105,102,0,0
gkTrans,gihOn		FLbutton "ReadSNAP",  0,1,2,74,25, 886,540,+105,gkinstrLoad,0,36000
			FLsetColor 0,255,0,ihS	
			FLsetColor 255,0,0,gihOn
gk9,ihLo		FLbutton "SaveBank", 1,0,2,74,25, 810,570,+105,105,0,0
gk9,ihSa		FLbutton "LoadBank", 1,0,2,74,25, 886,570,+105,106,0,0
			FLsetColor 155,50,50,ihSa
			FLsetColor 50,155,50s,ihLo	
			
;gk9,ihSF		FLbutton "LoadFreq", 1,0,2,80,30, 900, 130,+105,110,0,3600


ihdisp1			FLvalue	" ", 40,14,959,600
ihdisp2			FLvalue	" ", 40,14,959,630
gkTIME,gihT		FLslider	"Time transition [sec]", 0.1,60,0,5, ihdisp1,   150,13, 808,600			
gkType,gihType		FLslider	"log ---- Trans curve ---- exp", -5,5,0,5, ihdisp2, 150,13, 808,630
			FLsetVal_i 0,gihType
			FLsetVal_i 1,gihT



					


gkran1_sw,ihran1sw	FLbutton "Rand_1", 1,0,2,100,30,  10,170,+105, 2,0,3600
			FLsetColor 0,200,0,ihran1sw

gkran2_sw,ihran2sw	FLbutton "Rand_2", 1,0,2,100,30, 110,170,+105,3,0,3600
			FLsetColor 0,200,0,ihran2sw


gkran3_sw,ihran3sw	FLbutton "Rand_3", 1,0,2,100,30, 210,170,+105,4,0,3600
			FLsetColor 0,200,0,ihran3sw

gkran4_sw,ihran4sw	FLbutton "Rand_4", 1,0,2,100,30, 310,170,+105,5,0,3600
			FLsetColor 0,200,0,ihran4sw

gkran5_sw,ihran5sw	FLbutton "Rand_5", 1,0,2,100,30, 410,170,+105, 6,0,3600
			FLsetColor 0,200,0,ihran5sw

gkran6_sw,ihran6sw	FLbutton "Rand_6", 1,0,2,100,30, 510,170,+105,7,0,3600
			FLsetColor 0,200,0,ihran6sw


gkran7_sw,ihran7sw	FLbutton "Rand_7", 1,0,2,100,30, 610,170,+105,8,0,3600
			FLsetColor 0,200,0,ihran7sw

gkran8_sw,ihran8sw	FLbutton "Rand_8", 1,0,2,100,30, 710,170,+105,9,0,3600
			FLsetColor 0,200,0,ihran8sw





gkran1_amp,gihran1amp	FLslider "amp1",0.01,0.1,0,15,-1,100,15, 10,110
gkran2_amp,gihran2amp	FLslider "amp2",0.01,0.1,0,15,-1,100,15,110,110
gkran3_amp,gihran3amp	FLslider "amp3",0.01,0.1,0,15,-1,100,15,210,110
gkran4_amp,gihran4amp	FLslider "amp4",0.01,0.1,0,15,-1,100,15,310,110
gkran5_amp,gihran5amp	FLslider "amp5",0.01,0.1,0,15,-1,100,15,410,110
gkran6_amp,gihran6amp	FLslider "amp6",0.01,0.1,0,15,-1,100,15,510,110
gkran7_amp,gihran7amp	FLslider "amp7",0.01,0.1,0,15,-1,100,15,610,110
gkran8_amp,gihran8amp	FLslider "amp8",0.01,0.1,0,15,-1,100,15,710,110





gkran1_vel,gihran1vel	FLslider "vel1",0.1,2,0,15,-1,100,15, 10,140
gkran2_vel,gihran2vel	FLslider "vel2",0.1,2,0,15,-1,100,15,110,140
gkran3_vel,gihran3vel	FLslider "vel3",0.1,2,0,15,-1,100,15,210,140
gkran4_vel,gihran4vel	FLslider "vel4",0.1,2,0,15,-1,100,15,310,140
gkran5_vel,gihran5vel	FLslider "vel5",0.1,2,0,15,-1,100,15,410,140
gkran6_vel,gihran6vel	FLslider "vel6",0.1,2,0,15,-1,100,15,510,140
gkran7_vel,gihran7vel	FLslider "vel7",0.1,2,0,15,-1,100,15,610,140
gkran8_vel,gihran8vel	FLslider "vel8",0.1,2,0,15,-1,100,15,710,140



    	gkband, gihband FLslider "Focused <----------------> Diffuse", 0.001, 0.5, -1, 5, -1, 400, 15, 10, 25
	gkdur,  gihdur 	FLslider "Long <----------------> Short ", 0.2, 3, 0, 5, -1, 400, 15, 10, 53
	gkrate, gihrate FLslider "Fast <----------------> Slow ", 0.1, 0.5, 0, 5, -1, 400, 15, 10,82
			FLsetVal_i 0.1, gihrate
	gkover, gihover	FLslider "Overall", 0,1,0,15,-1,380,16,420,50
			FLsetVal_i 1, gihover
	gkTr,gihTr	FLslider "Transitions Progress",0,1,0,1,-1,190,16,800,340
			FLsetVal_i 0,gihTr
			
	


ih1x			FLvalue	"Hz",		55,15, 20,360
ih1y			FLvalue	"DHz",		55,15, 20,400
ih2x			FLvalue	"Hz",		55,15,120,360
ih2y			FLvalue	"DHz",		55,15,120,400
ih3x			FLvalue	"Hz",		55,15,220,360
ih3y			FLvalue	"DHz",		55,15,220,400
ih4x			FLvalue	"Hz",		55,15,320,360
ih4y			FLvalue	"DHz",		55,15,320,400
ih5x			FLvalue	"Hz",		55,15,420,360
ih5y			FLvalue	"DHz",		55,15,420,400
ih6x			FLvalue	"Hz",		55,15,520,360
ih6y			FLvalue	"DHz",		55,15,520,400
ih7x			FLvalue	"Hz",		55,15,620,360
ih7y			FLvalue	"DHz",		55,15,620,400
ih8x			FLvalue	"Hz",		55,15,720,360
ih8y			FLvalue	"DHz",		55,15,720,400



gkfreq_ref1, gkrand_dev1, gihjo_x1, gihjo_y1 FLjoy "Freq/MaxDf", 20, 100, 0, 500, 0, 0, ih1x, ih1y, 100, 100,  10, 230
gkfreq_ref2, gkrand_dev2, gihjo_x2, gihjo_y2 FLjoy "Freq/MaxDf", 20, 200, 0, 500, 0, 0, ih2x, ih2y, 100, 100, 110, 230
gkfreq_ref3, gkrand_dev3, gihjo_x3, gihjo_y3 FLjoy "Freq/MaxDf", 0, 1600, 0, 500, 0, 0, ih3x, ih3y, 100, 100, 210, 230
gkfreq_ref4, gkrand_dev4, gihjo_x4, gihjo_y4 FLjoy "Freq/MaxDf", 0, 3200, 0, 500, 0, 0, ih4x, ih4y, 100, 100, 310, 230

gkfreq_ref5, gkrand_dev5, gihjo_x5, gihjo_y5 FLjoy "Freq/MaxDf", 20, 100, 0, 500, 0, 0, ih5x, ih5y, 100, 100, 410, 230
gkfreq_ref6, gkrand_dev6, gihjo_x6, gihjo_y6 FLjoy "Freq/MaxDf", 20, 200, 0, 500, 0, 0, ih6x, ih6y, 100, 100, 510, 230
gkfreq_ref7, gkrand_dev7, gihjo_x7, gihjo_y7 FLjoy "Freq/MaxDf", 0, 1600, 0, 500, 0, 0, ih7x, ih7y, 100, 100, 610, 230
gkfreq_ref8, gkrand_dev8, gihjo_x8, gihjo_y8 FLjoy "Freq/MaxDf", 0, 3200, 0, 500, 0, 0, ih8x, ih8y, 100, 100, 710, 230


			FLsetVal_i 		20,gihjo_x1
			FLsetVal_i 		0, gihjo_y1
			FLsetVal_i 		20, gihjo_x2
			FLsetVal_i 		0, gihjo_y2
			FLsetVal_i 		0, gihjo_x3
			FLsetVal_i 		0, gihjo_y3
			FLsetVal_i		0, gihjo_x4
			FLsetVal_i 		0, gihjo_y4
			FLsetVal_i 		0, gihjo_x5
			FLsetVal_i 		0, gihjo_y5
			FLsetVal_i 		0, gihjo_x6
			FLsetVal_i 		0, gihjo_y6
			FLsetVal_i 		0, gihjo_x7
			FLsetVal_i 		0, gihjo_y7
			FLsetVal_i 		0, gihjo_x8
			FLsetVal_i 		0, gihjo_y8


ihval1			FLvalue	" ",		38,15, 6,580
ihval2			FLvalue	" ",		38,15,106,580
ihval3			FLvalue	" ",		38,15,206,580
ihval4			FLvalue	" ",		38,15,306,580
ihval5			FLvalue	" ",		38,15,406,580
ihval6			FLvalue	" ",		38,15,506,580
ihval7			FLvalue	" ",		38,15,606,580
ihval8			FLvalue	" ",		38,15,706,580

ihvalx1			FLvalue	" ",		38,15, 20+42,580
ihvalx2			FLvalue	" ",		38,15,120+42,580
ihvalx3			FLvalue	" ",		38,15,220+42,580
ihvalx4			FLvalue	" ",		38,15,320+42,580
ihvalx5			FLvalue	" ",		38,15,420+42,580
ihvalx6			FLvalue	" ",		38,15,520+42,580
ihvalx7			FLvalue	" ",		38,15,620+42,580
ihvalx8			FLvalue	" ",		38,15,720+42,580

gkfun1, ihfun1 		FLslider "F1", 1, 5, 0, 6, ihval1, 14, 100,  20, 450
			FLsetVal_i 5,ihfun1 
gkfun2, ihfun2 		FLslider "F2", 1, 5, 0, 6, ihval2, 14, 100, 120, 450
			FLsetVal_i 5,ihfun2 
gkfun3, ihfun3 		FLslider "F3", 1, 5, 0, 6, ihval3, 14, 100, 220, 450
			FLsetVal_i 5,ihfun3 
gkfun4, ihfun4 		FLslider "F4", 1, 5, 0, 6, ihval4, 14, 100, 320, 450
			FLsetVal_i 5,ihfun4
gkfun5, ihfun5 		FLslider "F5", 1, 5, 0, 6, ihval5, 14, 100, 420, 450
			FLsetVal_i 5,ihfun5 
gkfun6, ihfun6 		FLslider "F6", 1, 5, 0, 6, ihval6, 14, 100, 520, 450
			FLsetVal_i 5,ihfun6 
gkfun7, ihfun7 		FLslider "F7", 1, 5, 0, 6, ihval7, 14, 100, 620, 450
			FLsetVal_i 5,ihfun7 
gkfun8, ihfun8 		FLslider "F8", 1, 5, 0, 6, ihval8, 14, 100, 720, 450
			FLsetVal_i 5,ihfun8



gkindx1, gihindx1 	FLslider "Idx1", 0, 2, 0, 6, ihvalx1, 14, 100,  30+40, 450 
			FLsetColor 200,60,120,gihindx1
gkindx2, gihindx2 	FLslider "Idx2", 0, 2, 0, 6, ihvalx2, 14, 100, 130+40, 450
			FLsetVal_i 0,gihindx2  
gkindx3, gihindx3 	FLslider "Idx3", 0, 2, 0, 6, ihvalx3, 14, 100, 230+40, 450
			FLsetVal_i 0,gihindx3  
gkindx4, gihindx4 	FLslider "Idx4", 0, 2, 0, 6, ihvalx4, 14, 100, 330+40, 450
			FLsetVal_i 0,gihindx4 
gkindx5, gihindx5 	FLslider "Idx5", 0, 2, 0, 6, ihvalx5, 14, 100, 430+40, 450
			FLsetVal_i 0,gihindx5  
gkindx6, gihindx6 	FLslider "Idx6", 0, 2, 0, 6, ihvalx6, 14, 100, 530+40, 450
			FLsetVal_i 0,gihindx6 
gkindx7, gihindx7 	FLslider "Idx7", 0, 2, 0, 6, ihvalx7, 14, 100, 630+40, 450
			FLsetVal_i 0,gihindx7  
gkindx8, gihindx8 	FLslider "Idx8", 0, 2, 0, 6, ihvalx8, 14, 100, 730+40, 450
			FLsetVal_i 0,gihindx8 

FLsetColor 200,60,120,gihindx1
FLsetColor 200,60,120,gihindx2
FLsetColor 200,60,120,gihindx3
FLsetColor 200,60,120,gihindx4
FLsetColor 200,60,120,gihindx5
FLsetColor 200,60,120,gihindx6
FLsetColor 200,60,120,gihindx7
FLsetColor 200,60,120,gihindx8


gih1			FLvalue	" ",		55,14,  25,684
gih2			FLvalue	" ",		55,14, 125,684
gih3			FLvalue	" ",		55,14, 225,684
gih4			FLvalue	" ",		55,14, 325,684
gih5			FLvalue	" ",		55,14, 425,684
gih6			FLvalue	" ",		55,14, 525,684
gih7			FLvalue	" ",		55,14, 625,684
gih8			FLvalue	" ",		55,14, 725,684


gklev_1, gihlev_1		FLslider "Lev1",  0, 1, 0, 6, gih1, 15,220,  45,450
				FLsetVal_i 0,gihlev_1 
gklev_2, gihlev_2		FLslider "Lev2",  0 ,1, 0, 6, gih2, 15,220, 145,450
				FLsetVal_i 0,gihlev_2
gklev_3, gihlev_3		FLslider "Lev3",  0 ,1, 0, 6, gih3, 15,220, 245,450
				FLsetVal_i 0,gihlev_3
gklev_4, gihlev_4		FLslider "Lev4",  0 ,1, 0, 6, gih4, 15,220, 345,450
				FLsetVal_i 0,gihlev_4
gklev_5, gihlev_5		FLslider "Lev5",  0 ,1, 0, 6, gih5, 15,220, 445,450
				FLsetVal_i 0,gihlev_5 
gklev_6, gihlev_6		FLslider "Lev6",  0 ,1, 0, 6, gih6, 15,220, 545,450
				FLsetVal_i 0,gihlev_6
gklev_7, gihlev_7		FLslider "Lev7",  0 ,1, 0, 6, gih7, 15,220, 645,450
				FLsetVal_i 0,gihlev_7
gklev_8, gihlev_8		FLslider "Lev8",  0 ,1, 0, 6, gih8, 15,220, 745,450
				FLsetVal_i 0,gihlev_8


FLsetColor 100,100,100,gihlev_1
FLsetColor 100,100,100,gihlev_2
FLsetColor 100,100,100,gihlev_3
FLsetColor 100,100,100,gihlev_4
FLsetColor 100,100,100,gihlev_5
FLsetColor 100,100,100,gihlev_6
FLsetColor 100,100,100,gihlev_7
FLsetColor 100,100,100,gihlev_8



gk_CAR_min,gih_CAR_min		FLslider "CARmin", 1,14,0,15,-1,170,20,820,180  ;6,14
				FLsetVal_i 6,gih_CAR_min
gk_CAR_max,gih_CAR_max		FLslider "CARmax", 1,14,0,15,-1,170,20,820,220
				FLsetVal_i 14,gih_CAR_max

gk_MOD_min,gih_MOD_min		FLslider "MODmin", 1,13,0,15,-1,170,20,820,260
				FLsetVal_i 5,gih_MOD_min
gk_MOD_max,gih_MOD_max		FLslider "MODmax", 1,13,0,15,-1,170,20,820,300
				FLsetVal_i 13,gih_MOD_max

gk_cm,ih_cm			FLbutton "c:m int/float", 1,0,2,78,30, 820, 130,-1
				FLsetColor 200,100,0,ih_cm

gk_rnd_cm,ih_rnd_cm		FLbutton "Random c:m", 1,0,2,78,30, 910, 130,-1;+105,10,0,3600
				FLsetColor 200,100,0,ih_rnd_cm

FLgroup_end
FLgroup "Sequence", 1000,700,0,15


FLcolor 150,150,50,130,30,30

gksnap_x0y0,ihsnap_x0y0		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 0 * $dX, $Y0
gksnap_x1y0,ihsnap_x1y0		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 1 * $dX, $Y0
gksnap_x2y0,ihsnap_x2y0		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 2 * $dX, $Y0
gksnap_x3y0,ihsnap_x3y0		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 3 * $dX, $Y0
gksnap_x4y0,ihsnap_x4y0		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 4 * $dX, $Y0
gksnap_x5y0,ihsnap_x5y0		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 5 * $dX, $Y0
gksnap_x6y0,ihsnap_x6y0		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 6 * $dX, $Y0
gksnap_x7y0,ihsnap_x7y0		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 7 * $dX, $Y0
gksnap_x8y0,ihsnap_x8y0		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 8 * $dX, $Y0
gksnap_x9y0,ihsnap_x9y0		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 9 * $dX, $Y0
gksnap_x10y0,ihsnap_x10y0	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 10 * $dX, $Y0
gksnap_x11y0,ihsnap_x11y0	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 11 * $dX, $Y0
gksnap_x12y0,ihsnap_x12y0	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 12 * $dX, $Y0
gksnap_x13y0,ihsnap_x13y0	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 13 * $dX, $Y0
gksnap_x14y0,ihsnap_x14y0	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 14 * $dX, $Y0
gksnap_x15y0,ihsnap_x15y0	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 15 * $dX, $Y0
gksnap_x16y0,ihsnap_x16y0	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 16 * $dX, $Y0
gksnap_x17y0,ihsnap_x17y0	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 17 * $dX, $Y0
gksnap_x18y0,ihsnap_x18y0	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 18 * $dX, $Y0
gksnap_x19y0,ihsnap_x19y0	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 19 * $dX, $Y0

FLcolor 50,50,50,30,30,30

gk_x0y1,ih_x0y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 0 * $dX, $Y0 + $dY
gk_x1y1,ih_x1y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 1 * $dX, $Y0 + $dY
gk_x2y1,ih_x2y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 2 * $dX, $Y0 + $dY
gk_x3y1,ih_x3y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 3 * $dX, $Y0 + $dY
gk_x4y1,ih_x4y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 4 * $dX, $Y0 + $dY
gk_x5y1,ih_x5y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 5 * $dX, $Y0 + $dY
gk_x6y1,ih_x6y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 6 * $dX, $Y0 + $dY
gk_x7y1,ih_x7y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 7 * $dX, $Y0 + $dY
gk_x8y1,ih_x8y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 8 * $dX, $Y0 + $dY
gk_x9y1,ih_x9y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 9 * $dX, $Y0 + $dY
gk_x10y1,ih_x10y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 10 * $dX, $Y0 + $dY
gk_x11y1,ih_x11y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 11 * $dX, $Y0 + $dY
gk_x12y1,ih_x12y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 12 * $dX, $Y0 + $dY
gk_x13y1,ih_x13y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 13 * $dX, $Y0 + $dY
gk_x14y1,ih_x14y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 14 * $dX, $Y0 + $dY
gk_x15y1,ih_x15y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 15 * $dX, $Y0 + $dY
gk_x16y1,ih_x16y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 16 * $dX, $Y0 + $dY
gk_x17y1,ih_x17y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 17 * $dX, $Y0 + $dY
gk_x18y1,ih_x18y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 18 * $dX, $Y0 + $dY
gk_x19y1,ih_x19y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 19 * $dX, $Y0 + $dY

FLcolor 050,50,250,030,30,230

gk_x0y2,ih_x0y2		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 0 * $dX, $Y0 + 2*$dY
gk_x1y2,ih_x1y2		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 1 * $dX, $Y0 + 2*$dY
gk_x2y2,ih_x2y2		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 2 * $dX, $Y0 + 2*$dY
gk_x3y2,ih_x3y2		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 3 * $dX, $Y0 + 2*$dY
gk_x4y2,ih_x4y2		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 4 * $dX, $Y0 + 2*$dY
gk_x5y2,ih_x5y2		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 5 * $dX, $Y0 + 2*$dY
gk_x6y2,ih_x6y2		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 6 * $dX, $Y0 + 2*$dY
gk_x7y2,ih_x7y2		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 7 * $dX, $Y0 + 2*$dY
gk_x8y2,ih_x8y2		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 8 * $dX, $Y0 + 2*$dY
gk_x9y2,ih_x9y2		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 9 * $dX, $Y0 + 2*$dY
gk_x10y2,ih_x10y2	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 10 * $dX, $Y0 + 2*$dY
gk_x11y2,ih_x11y2	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 11 * $dX, $Y0 + 2*$dY
gk_x12y2,ih_x12y2	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 12 * $dX, $Y0 + 2*$dY
gk_x13y2,ih_x13y2	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 13 * $dX, $Y0 + 2*$dY
gk_x14y2,ih_x14y2	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 14 * $dX, $Y0 + 2*$dY
gk_x15y2,ih_x15y2	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 15 * $dX, $Y0 + 2*$dY
gk_x16y2,ih_x16y2	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 16 * $dX, $Y0 + 2*$dY
gk_x17y2,ih_x17y2	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 17 * $dX, $Y0 + 2*$dY
gk_x18y2,ih_x18y2	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 18 * $dX, $Y0 + 2*$dY
gk_x19y2,ih_x19y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 19 * $dX, $Y0 + 2*$dY

; Seconda tripletta
FLcolor 150,150,50,130,30,30

gksnap_x0y0,ihsnap_x0y0		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 0 * $dX, 4*$Y0
gksnap_x1y0,ihsnap_x1y0		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 1 * $dX, 4*$Y0
gksnap_x2y0,ihsnap_x2y0		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 2 * $dX, 4*$Y0
gksnap_x3y0,ihsnap_x3y0		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 3 * $dX, 4*$Y0
gksnap_x4y0,ihsnap_x4y0		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 4 * $dX, 4*$Y0
gksnap_x5y0,ihsnap_x5y0		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 5 * $dX, 4*$Y0
gksnap_x6y0,ihsnap_x6y0		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 6 * $dX, 4*$Y0
gksnap_x7y0,ihsnap_x7y0		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 7 * $dX, 4*$Y0
gksnap_x8y0,ihsnap_x8y0		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 8 * $dX, 4*$Y0
gksnap_x9y0,ihsnap_x9y0		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 9 * $dX, 4*$Y0
gksnap_x10y0,ihsnap_x10y0	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 10 * $dX, 4*$Y0
gksnap_x11y0,ihsnap_x11y0	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 11 * $dX, 4*$Y0
gksnap_x12y0,ihsnap_x12y0	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 12 * $dX, 4*$Y0
gksnap_x13y0,ihsnap_x13y0	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 13 * $dX, 4*$Y0
gksnap_x14y0,ihsnap_x14y0	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 14 * $dX, 4*$Y0
gksnap_x15y0,ihsnap_x15y0	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 15 * $dX, 4*$Y0
gksnap_x16y0,ihsnap_x16y0	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 16 * $dX, 4*$Y0
gksnap_x17y0,ihsnap_x17y0	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 17 * $dX, 4*$Y0
gksnap_x18y0,ihsnap_x18y0	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 18 * $dX, 4*$Y0
gksnap_x19y0,ihsnap_x19y0	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 19 * $dX, 4*$Y0


FLcolor 50,50,50,30,30,30

gk_x0y2,ih_x0y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 0 * $dX, 4*$Y0 + $dY
gk_x1y2,ih_x1y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 1 * $dX, 4*$Y0 + $dY
gk_x2y2,ih_x2y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 2 * $dX, 4*$Y0 + $dY
gk_x3y2,ih_x3y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 3 * $dX, 4*$Y0 + $dY
gk_x4y2,ih_x4y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 4 * $dX, 4*$Y0 + $dY
gk_x5y2,ih_x5y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 5 * $dX, 4*$Y0 + $dY
gk_x6y2,ih_x6y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 6 * $dX, 4*$Y0 + $dY
gk_x7y2,ih_x7y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 7 * $dX, 4*$Y0 + $dY
gk_x8y2,ih_x8y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 8 * $dX, 4*$Y0 + $dY
gk_x9y2,ih_x9y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 9 * $dX, 4*$Y0 + $dY
gk_x10y2,ih_x10y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 10 * $dX, 4*$Y0 + $dY
gk_x11y2,ih_x11y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 11 * $dX, 4*$Y0 + $dY
gk_x12y2,ih_x12y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 12 * $dX, 4*$Y0 + $dY
gk_x13y2,ih_x13y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 13 * $dX, 4*$Y0 + $dY
gk_x14y2,ih_x14y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 14 * $dX, 4*$Y0 + $dY
gk_x15y2,ih_x15y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 15 * $dX, 4*$Y0 + $dY
gk_x16y2,ih_x16y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 16 * $dX, 4*$Y0 + $dY
gk_x17y2,ih_x17y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 17 * $dX, 4*$Y0 + $dY
gk_x18y2,ih_x18y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 18 * $dX, 4*$Y0 + $dY
gk_x19y2,ih_x19y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 19 * $dX, 4*$Y0 + $dY

FLcolor 050,50,250,030,30,230

gk_x0y2,ih_x0y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 0 * $dX, $Y0 + 2*$dY
gk_x1y2,ih_x1y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 1 * $dX, $Y0 + 2*$dY
gk_x2y2,ih_x2y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 2 * $dX, $Y0 + 2*$dY
gk_x3y2,ih_x3y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 3 * $dX, $Y0 + 2*$dY
gk_x4y2,ih_x4y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 4 * $dX, $Y0 + 2*$dY
gk_x5y2,ih_x5y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 5 * $dX, $Y0 + 2*$dY
gk_x6y2,ih_x6y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 6 * $dX, $Y0 + 2*$dY
gk_x7y2,ih_x7y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 7 * $dX, $Y0 + 2*$dY
gk_x8y2,ih_x8y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 8 * $dX, $Y0 + 2*$dY
gk_x9y2,ih_x9y1		FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 9 * $dX, $Y0 + 2*$dY
gk_x10y2,ih_x10y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 10 * $dX, $Y0 + 2*$dY
gk_x11y2,ih_x11y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 11 * $dX, $Y0 + 2*$dY
gk_x12y2,ih_x12y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 12 * $dX, $Y0 + 2*$dY
gk_x13y2,ih_x13y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 13 * $dX, $Y0 + 2*$dY
gk_x14y2,ih_x14y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 14 * $dX, $Y0 + 2*$dY
gk_x15y2,ih_x15y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 15 * $dX, $Y0 + 2*$dY
gk_x16y2,ih_x16y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 16 * $dX, $Y0 + 2*$dY
gk_x17y2,ih_x17y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 17 * $dX, $Y0 + 2*$dY
gk_x18y2,ih_x18y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 18 * $dX, $Y0 + 2*$dY
gk_x19y2,ih_x19y1	FLtext	" ", 0, 5000,.01,1  , 40, 25, $X0 + 19 * $dX, $Y0 + 2*$dY





	FLgroup_end


FLcolor 200,200,250,30,30,130
FLgroup "Pitch System", 1000,700,0,15



kout, gihandle	FLtext	"label", 0, 100000, 0.1, 1, 80, 30, 140, 140
	

gk_quit, ihquit		FLbutton "Exit" ,1, 0, 2, 60, 28, 930,20, +105,100, 0, 0.1

gk_num,ih_num	FLtext	"Num ", 1, 32,0.1,1  , 60, 25, $X0 + 10 , $Y0 + 10 
gk_den,ih_den	FLtext	"Den ", 1, 32,0.1,1  , 60, 25, $X0 + 10 , 3 * $Y0 

gk_pchgen, gih_pchgen	FLbutton "Compile!" ,1, 0, 2, 80, 28, 590,20, +105,11, 0, 3600

FLgroup_end
; End of panel contents
;FLpanel_end
; Run the widget thread!
FLrun


;

instr 2
kran1_sw = gkran1_sw
if gkran1_sw = 1 goto ran
gkfauto1 = 0
turnoff
ran:

gkfauto1 randh gkfreq_ref1 * gkran1_amp, gkran1_vel

endin

instr 3
kran2_sw = gkran2_sw
if gkran2_sw = 1 goto ran
gkfauto2 = 0
turnoff
ran:

gkfauto2 randh gkfreq_ref2 * gkran2_amp, gkran2_vel

endin

instr 4
kran3_sw = gkran3_sw
if gkran3_sw = 1 goto ran
gkfauto3 = 0
turnoff
ran:

gkfauto3 randh gkfreq_ref3 * gkran3_amp, gkran3_vel

endin

instr 5
kran4_sw = gkran4_sw
if gkran4_sw = 1 goto ran
gkfauto4 = 0
turnoff
ran:

gkfauto4 randh gkfreq_ref4 * gkran4_amp, gkran4_vel

endin

instr 6
kran5_sw = gkran5_sw
if gkran5_sw = 1 goto ran
gkfauto5 = 0
turnoff
ran:

gkfauto5 randh gkfreq_ref5 * gkran5_amp, gkran5_vel

endin


instr 7
kran6_sw = gkran6_sw
if gkran6_sw = 1 goto ran
gkfauto6 = 0
turnoff
ran:

gkfauto6 randh gkfreq_ref6 * gkran6_amp, gkran6_vel

endin


instr 8
kran7_sw = gkran7_sw
if gkran7_sw = 1 goto ran
gkfauto7 = 0
turnoff
ran:

gkfauto7 randh gkfreq_ref7 * gkran7_amp, gkran7_vel

endin


instr 9
kran8_sw = gkran8_sw
if gkran8_sw = 1 goto ran
gkfauto8 = 0
turnoff
ran:

gkfauto8 randh gkfreq_ref8 * gkran8_amp, gkran8_vel

endin



instr 10

kc = gih_CAR_min
if gk_rnd_cm = 1 kgoto go
turnoff
go:
kenv linseg 0,1,1,1000,1
gk_crand_m oscil (kenv*0.2),6,5
kc = gk_crand_m + 7
FLsetVal 1, kc,gih_CAR_min	

;printk 0.1,kenv
printk 0.1, kc
;gk_crand_M = rnd(3)

endin


instr 11
ind init 0
iratio =  i(gk_num)/ i(gk_den)
ifreq init 50
print iratio

do:

print  ifreq
FLsetVal_i ifreq, gihandle
if ifreq > 12000 igoto stop
ifreq = ifreq * iratio
ind = ind + 1



igoto do

stop:



turnoff

;FLprintk 0.05, kfreq, giheval_f
;print ind, ifreq
;printk 0.05, kfreq

endin

















;====================================================
instr 21	;STRUMENTO CHIAMANTE 1

ifreq_ref = p4
irand_dev = p5


;itime = 0.05	; 100 millisec   

	
reset:

itime = i(gkrate)
gifun1 = int(i(gkfun1))
gidur = i(gkdur)

ifreq_ref1 = i(gkfreq_ref1)+ i(gkfauto1)
irand_dev1 = i(gkrand_dev1)
ilev_1 tab_i i(gklev_1)*0.5,20,1
klev_1 = ilev_1
FLprintk2 klev_1, gih1
;print ilev_1
ilev_1 = i(gklev_1)
;print ilev
timout 0,itime,cont	;schedulatore degli START TIME
reinit reset
		
cont:
if gkcall1 = 1 goto go

turnoff
go:
call 51,0,(4.1-gidur),ifreq_ref1,irand_dev1,ilev_1

endin


instr 22		;STRUMENTO CHIAMANTE 2

ifreq_ref = p4
irand_dev = p5


;itime = 0.15	; 100 millisec   

 
		
reset:


itime = i(gkrate)
gifun2 = int(i(gkfun2))
gidur = i(gkdur)
ifreq_ref2 = i(gkfreq_ref2)+ i(gkfauto2)
irand_dev2 = i(gkrand_dev2)
ilev_2 tab_i i(gklev_2)*0.5,20,1
timout 0,itime,cont	;schedulatore degli START TIME
reinit reset		


cont:
if gkcall2 = 1 goto go

turnoff
go:
call 52,0,(4.1-gidur),ifreq_ref2,irand_dev2,ilev_2



endin



instr 23		;STRUMENTO CHIAMANTE

ifreq_ref = p4
irand_dev = p5


;itime = 0.15	; 100 millisec   

 
		
reset:
itime = i(gkrate)
gifun3 = int(i(gkfun3))
idur = i(gkdur)

ifreq_ref3 = i(gkfreq_ref3)+ i(gkfauto3)
irand_dev3 = i(gkrand_dev3)
ilev_3 tab_i i(gklev_3)*0.5,20,1
timout 0,itime,cont	;schedulatore degli START TIME
reinit reset		


cont:
if gkcall3 = 1 goto go

turnoff
go:
call 53,0,(4.1-idur),ifreq_ref3,irand_dev3,ilev_3



endin






instr 24		;STRUMENTO CHIAMANTE 4

ifreq_ref = p4
irand_dev = p5
ifun = p6

;itime = 0.15	; 100 millisec   

 		
reset:
itime = i(gkrate)
gifun4 = int(i(gkfun4))
idur = i(gkdur)

ifreq_ref4 = i(gkfreq_ref4)+  i(gkfauto4)
irand_dev4 = i(gkrand_dev4)
ilev_4 tab_i i(gklev_4)*0.5,20,1
timout 0,itime,cont	;schedulatore degli START TIME
reinit reset		


cont:
if gkcall4 = 1 goto go

turnoff
go:
call 54,0,(4.1-idur),ifreq_ref4,irand_dev4,ilev_4



endin


instr 25		;STRUMENTO CHIAMANTE 5

ifreq_ref = p4
irand_dev = p5
ifun = p6

;itime = 0.15	; 100 millisec   

 
		
reset:
itime = i(gkrate)
gifun5 = int(i(gkfun5))
idur = i(gkdur)

ifreq_ref5 = i(gkfreq_ref5) +  i(gkfauto5)
irand_dev5 = i(gkrand_dev5)
ilev_5 tab_i i(gklev_5)*0.5,20,1
timout 0,itime,cont	;schedulatore degli START TIME
reinit reset		


cont:
if gkcall5 = 1 goto go

turnoff
go:
call 55,0,(4.1-idur),ifreq_ref5,irand_dev5,ilev_5


endin

instr 26		;STRUMENTO CHIAMANTE 6

ifreq_ref = p4
irand_dev = p5
ifun = p6

;itime = 0.15	; 100 millisec   

 
		
reset:
itime = i(gkrate)
gifun6 = int(i(gkfun6))
idur = i(gkdur)

ifreq_ref6 = i(gkfreq_ref6) +  i(gkfauto6)
irand_dev6 = i(gkrand_dev6)
ilev_6 tab_i i(gklev_6)*0.5,20,1
timout 0,itime,cont	;schedulatore degli START TIME
reinit reset		


cont:
if gkcall6 = 1 goto go

turnoff
go:
call 56,0,(4.1-idur),ifreq_ref6,irand_dev6,ilev_6


endin


instr 27		;STRUMENTO CHIAMANTE 7

ifreq_ref = p4
irand_dev = p5
ifun = p6

;itime = 0.15	; 100 millisec   

 
		
reset:
itime = i(gkrate)
gifun7 = int(i(gkfun7))
idur = i(gkdur)

ifreq_ref7 = i(gkfreq_ref7) +  i(gkfauto7)
irand_dev7 = i(gkrand_dev7)
ilev_7 tab_i i(gklev_7)*0.5,20,1
timout 0,itime,cont	;schedulatore degli START TIME
reinit reset		


cont:
if gkcall7 = 1 goto go

turnoff
go:
call 57,0,(4.1-idur),ifreq_ref7,irand_dev7,ilev_7


endin



instr 28		;STRUMENTO CHIAMANTE 8

ifreq_ref = p4
irand_dev = p5
ifun = p6

;itime = 0.15	; 100 millisec   

 
		
reset:
itime = i(gkrate)
gifun8 = int(i(gkfun8))
idur = i(gkdur)

ifreq_ref8 = i(gkfreq_ref8) +  i(gkfauto8)
irand_dev8 = i(gkrand_dev8)
ilev_8 tab_i i(gklev_8)*0.5,20,1
timout 0,itime,cont	;schedulatore degli START TIME
reinit reset		


cont:
if gkcall8 = 1 goto go

turnoff
go:
call 58,0,(4.1-idur),ifreq_ref8,irand_dev8,ilev_8


endin

;*********************************************************************************************

instr   51       ;STRUMENTO CHIAMATO 1
reset:
timout 0,p3,cont
reinit reset
cont:
ilev = p6

irandfreq   = birnd (p5)			;genera un numero casuale per la frequenza
ichan = birnd (1)
ileft = (ichan <= 0 ? 1 : 0)
iright = (ichan > 0 ? 1 : 0)

icar  random	i(gk_CAR_min), i(gk_CAR_max);6,14
imod  random  	i(gk_MOD_min), i(gk_MOD_max) ;5,13

 
icar = ( i(gk_cm) = 0?  int(icar) : icar)
imod = ( i(gk_cm) = 0?  int(imod) : imod) 

iindex random 0,i(gkindx1)

k1	linseg   0,p3/2,ilev,p3/2,0



;a1	oscili	k1,p4+irandfreq*gkband,gifun1		;genera l'oscillazione e modula la frequenza base (4000 hz) con irandfreq
kindex  linseg 0,p3/2,iindex,p3/2,0
a1	foscili k1,p4+irandfreq*gkband, icar,imod, kindex, gifun1
	outs	gkmute*gkover*a1 * $SCALEFACTOR * ileft, gkmute*gkover*a1 * $SCALEFACTOR * iright


	endin



instr   52       ;STRUMENTO CHIAMATO 2
reset:
timout 0,p3,cont
reinit reset
cont:
ilev = p6

irandfreq   = birnd (p5)			;genera un numero casuale
ichan = birnd (1)
ileft = (ichan <= 0 ? 1 : 0)
iright = (ichan > 0 ? 1 : 0)

icar  random	i(gk_CAR_min), i(gk_CAR_max);6,14
imod  random  	i(gk_MOD_min), i(gk_MOD_max) ;5,13

 
icar = ( i(gk_cm) = 0?  int(icar) : icar)
imod = ( i(gk_cm) = 0?  int(imod) : imod) 

iindex random 0,i(gkindx2)

k1	linseg   0,p3/2,ilev,p3/2,0



;a1	oscili	k1,p4+irandfreq*gkband,gifun1		;genera l'oscillazione e modula la frequenza base (4000 hz) con irandfreq
kindex  linseg 0,p3/2,iindex,p3/2,0
a1	foscili k1,p4+irandfreq*gkband, icar,imod, kindex, gifun2
	outs	gkover * a1 * $SCALEFACTOR * ileft, gkover*a1 * $SCALEFACTOR * iright



	endin



instr   53       ;STRUMENTO CHIAMATO 3
reset:
timout 0,p3,cont
reinit reset
cont:
ilev = p6

irandfreq   = birnd (p5)			;genera un numero casuale
ichan = birnd (1)
ileft = (ichan <= 0 ? 1 : 0)
iright = (ichan > 0 ? 1 : 0)

icar  random	i(gk_CAR_min), i(gk_CAR_max);6,14
imod  random  	i(gk_MOD_min), i(gk_MOD_max) ;5,13

 
icar = ( i(gk_cm) = 0?  int(icar) : icar)
imod = ( i(gk_cm) = 0?  int(imod) : imod) 

iindex random 0,i(gkindx3)

k1	linseg   0,p3/2,ilev,p3/2,0



;a1	oscili	k1,p4+irandfreq*gkband,gifun1		;genera l'oscillazione e modula la frequenza base (4000 hz) con irandfreq
kindex  linseg 0,p3/2,iindex,p3/2,0
a1	foscili k1,p4+irandfreq*gkband, icar,imod, kindex, gifun3
	outs	gkover*a1 * $SCALEFACTOR * ileft, gkover*a1 * $SCALEFACTOR * iright




	endin


instr   54       ;STRUMENTO CHIAMATO 4
reset:
timout 0,p3,cont
reinit reset
cont:
ilev = p6

irandfreq   = birnd (p5)			;genera un numero casuale
ichan = birnd (1)
ileft = (ichan <= 0 ? 1 : 0)
iright = (ichan > 0 ? 1 : 0)

icar  random	i(gk_CAR_min), i(gk_CAR_max);6,14
imod  random  	i(gk_MOD_min), i(gk_MOD_max) ;5,13

 
icar = ( i(gk_cm) = 0?  int(icar) : icar)
imod = ( i(gk_cm) = 0?  int(imod) : imod) 

iindex random 0,i(gkindx4)

k1	linseg   0,p3/2,ilev,p3/2,0



;a1	oscili	k1,p4+irandfreq*gkband,gifun1		;genera l'oscillazione e modula la frequenza base (4000 hz) con irandfreq
kindex  linseg 0,p3/2,iindex,p3/2,0
a1	foscili k1,p4+irandfreq*gkband, icar,imod, kindex, gifun4
	outs	gkover*a1 * $SCALEFACTOR * ileft, gkover*a1 * $SCALEFACTOR * iright



	endin


instr   55       ;STRUMENTO CHIAMATO 5
reset:
timout 0,p3,cont
reinit reset
cont:
ilev = p6

irandfreq   = birnd (p5)			;genera un numero casuale
ichan = birnd (1)
ileft = (ichan <= 0 ? 1 : 0)
iright = (ichan > 0 ? 1 : 0)

icar  random	i(gk_CAR_min), i(gk_CAR_max);6,14
imod  random  	i(gk_MOD_min), i(gk_MOD_max) ;5,13

 
icar = ( i(gk_cm) = 0?  int(icar) : icar)
imod = ( i(gk_cm) = 0?  int(imod) : imod) 

iindex random 0,i(gkindx5)

k1	linseg   0,p3/2,ilev,p3/2,0



;a1	oscili	k1,p4+irandfreq*gkband,gifun1		;genera l'oscillazione e modula la frequenza base (4000 hz) con irandfreq
kindex  linseg 0,p3/2,iindex,p3/2,0
a1	foscili k1,p4+irandfreq*gkband, icar,imod, kindex, gifun5
	outs	gkover*a1 * $SCALEFACTOR * ileft, gkover*a1 * $SCALEFACTOR * iright


	endin


instr   56       ;STRUMENTO CHIAMATO 6
reset:
timout 0,p3,cont
reinit reset
cont:
ilev = p6

irandfreq   = birnd (p5)			;genera un numero casuale
ichan = birnd (1)
ileft = (ichan <= 0 ? 1 : 0)
iright = (ichan > 0 ? 1 : 0)

icar  random	i(gk_CAR_min), i(gk_CAR_max);6,14
imod  random  	i(gk_MOD_min), i(gk_MOD_max) ;5,13

 
icar = ( i(gk_cm) = 0?  int(icar) : icar)
imod = ( i(gk_cm) = 0?  int(imod) : imod) 

iindex random 0,i(gkindx6)

k1	linseg   0,p3/2,ilev,p3/2,0



;a1	oscili	k1,p4+irandfreq*gkband,gifun1		;genera l'oscillazione e modula la frequenza base (4000 hz) con irandfreq
kindex  linseg 0,p3/2,iindex,p3/2,0
a1	foscili k1,p4+irandfreq*gkband, icar,imod, kindex, gifun6
	outs	gkover*a1 * $SCALEFACTOR * ileft, gkover*a1 * $SCALEFACTOR * iright

	endin


instr   57       ;STRUMENTO CHIAMATO 7
reset:
timout 0,p3,cont
reinit reset
cont:
ilev = p6

irandfreq   = birnd (p5)			;genera un numero casuale
ichan = birnd (1)
ileft = (ichan <= 0 ? 1 : 0)
iright = (ichan > 0 ? 1 : 0)

icar  random	i(gk_CAR_min), i(gk_CAR_max);6,14
imod  random  	i(gk_MOD_min), i(gk_MOD_max) ;5,13

 
icar = ( i(gk_cm) = 0?  int(icar) : icar)
imod = ( i(gk_cm) = 0?  int(imod) : imod) 

iindex random 0,i(gkindx7)

k1	linseg   0,p3/2,ilev,p3/2,0



;a1	oscili	k1,p4+irandfreq*gkband,gifun1		;genera l'oscillazione e modula la frequenza base (4000 hz) con irandfreq
kindex  linseg 0,p3/2,iindex,p3/2,0
a1	foscili k1,p4+irandfreq*gkband, icar,imod, kindex, gifun7
	outs	gkover*a1 * $SCALEFACTOR * ileft, gkover*a1 * $SCALEFACTOR * iright



	endin

instr   58       ;STRUMENTO CHIAMATO 8
reset:
timout 0,p3,cont
reinit reset
cont:
ilev = p6

irandfreq   = birnd (p5)			;genera un numero casuale
ichan = birnd (1)
ileft = (ichan <= 0 ? 1 : 0)
iright = (ichan > 0 ? 1 : 0)

icar  random	i(gk_CAR_min), i(gk_CAR_max);6,14
imod  random  	i(gk_MOD_min), i(gk_MOD_max) ;5,13

 
icar = ( i(gk_cm) = 0?  int(icar) : icar)
imod = ( i(gk_cm) = 0?  int(imod) : imod) 

iindex random 0,i(gkindx8)

k1	linseg   0,p3/2,ilev,p3/2,0



;a1	oscili	k1,p4+irandfreq*gkband,gifun1		;genera l'oscillazione e modula la frequenza base (4000 hz) con irandfreq
kindex  linseg 0,p3/2,iindex,p3/2,0
a1	foscili k1,p4+irandfreq*gkband, icar,imod, kindex, gifun8
	outs	gkover*a1 * $SCALEFACTOR * ileft, gkover*a1 * $SCALEFACTOR * iright

	endin

instr 100
exitnow
endin







instr 102 ; Save Snaps


tabw_i i(gkover),  	 0, 	200+i(gkGet)
tabw_i i(gkband),  	 1, 	200+i(gkGet)
tabw_i i(gkrate),  	 2, 	200+i(gkGet)
tabw_i i(gkdur) ,   	 3, 	200+i(gkGet)
tabw_i i(gk_CAR_min),  	 4, 	200+i(gkGet)
tabw_i i(gk_CAR_max),  	 5, 	200+i(gkGet)
tabw_i i(gk_MOD_min),  	 6, 	200+i(gkGet)
tabw_i i(gk_MOD_max),  	 7, 	200+i(gkGet)
tabw_i i(gkindx1),	 8,	200+i(gkGet)
tabw_i i(gkindx2),	 9,	200+i(gkGet)
tabw_i i(gkindx3),	10,	200+i(gkGet)
tabw_i i(gkindx4),	11,	200+i(gkGet)
tabw_i i(gkindx5),	12,	200+i(gkGet)
tabw_i i(gkindx6),	13,	200+i(gkGet)
tabw_i i(gkindx7),	14,	200+i(gkGet)
tabw_i i(gkindx8),	15,	200+i(gkGet)
tabw_i i(gklev_1),	16,	200+i(gkGet)
tabw_i i(gklev_2),	17,	200+i(gkGet)
tabw_i i(gklev_3),	18,	200+i(gkGet)
tabw_i i(gklev_4),	19,	200+i(gkGet)
tabw_i i(gklev_5),	20,	200+i(gkGet)
tabw_i i(gklev_6),	21,	200+i(gkGet)
tabw_i i(gklev_7),	22,	200+i(gkGet)
tabw_i i(gklev_8),	23,	200+i(gkGet)
tabw_i i(gkran1_amp),	24,	200+i(gkGet)
tabw_i i(gkran2_amp),	25,	200+i(gkGet)
tabw_i i(gkran3_amp),	26,	200+i(gkGet)
tabw_i i(gkran4_amp),	27,	200+i(gkGet)
tabw_i i(gkran5_amp),	28,	200+i(gkGet)
tabw_i i(gkran6_amp),	29,	200+i(gkGet)
tabw_i i(gkran7_amp),	30,	200+i(gkGet)
tabw_i i(gkran8_amp),	31,	200+i(gkGet)
tabw_i i(gkran1_vel),	32,	200+i(gkGet)
tabw_i i(gkran2_vel),	33,	200+i(gkGet)
tabw_i i(gkran3_vel),	34,	200+i(gkGet)
tabw_i i(gkran4_vel),	35,	200+i(gkGet)
tabw_i i(gkran5_vel),	36,	200+i(gkGet)
tabw_i i(gkran6_vel),	37,	200+i(gkGet)
tabw_i i(gkran7_vel),	38,	200+i(gkGet)
tabw_i i(gkran8_vel),	39,	200+i(gkGet)


tabw_i i(gkfreq_ref1),	40,	200+i(gkGet)
tabw_i i(gkrand_dev1),	41,	200+i(gkGet)
tabw_i i(gkfreq_ref2),	42,	200+i(gkGet)
tabw_i i(gkrand_dev2),	43,	200+i(gkGet)
tabw_i i(gkfreq_ref3),	44,	200+i(gkGet)
tabw_i i(gkrand_dev3),	45,	200+i(gkGet)
tabw_i i(gkfreq_ref4),	46,	200+i(gkGet)
tabw_i i(gkrand_dev4),	47,	200+i(gkGet)
tabw_i i(gkfreq_ref5),	48,	200+i(gkGet)
tabw_i i(gkrand_dev5),	49,	200+i(gkGet)
tabw_i i(gkfreq_ref6),	50,	200+i(gkGet)
tabw_i i(gkrand_dev6),	51,	200+i(gkGet)
tabw_i i(gkfreq_ref7),	52,	200+i(gkGet)
tabw_i i(gkrand_dev7),	53,	200+i(gkGet)
tabw_i i(gkfreq_ref8),	54,	200+i(gkGet)
tabw_i i(gkrand_dev8),	55,	200+i(gkGet)



endin



instr 105 ; Save Snap Bank


ftsave "BROWSE_FILE", 1,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,\
			216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,\
			232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247

endin


instr 106   ; Load Snap Bank


ftload "BROWSE_FILE", 1,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,\
			216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,\
			232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247

endin



instr 107	; Load Snap with transition
call 110,0,1
gkistrLoad = 108
iType	init i(gkType)
;print iType
	vtabwi 0,giTEMP,i(gkover),i(gkband),i(gkrate),i(gkdur),i(gk_CAR_min),i(gk_CAR_max), i(gk_MOD_min), i(gk_MOD_max),\
	i(gkindx1),i(gkindx2),i(gkindx3),i(gkindx4),i(gkindx5),i(gkindx6),i(gkindx7),i(gkindx8),\
	i(gklev_1),i(gklev_2),i(gklev_3),i(gklev_4),i(gklev_5),i(gklev_6),i(gklev_7),i(gklev_8),\
	i(gkran1_amp),i(gkran2_amp),i(gkran3_amp),i(gkran4_amp),i(gkran5_amp),i(gkran6_amp),i(gkran7_amp),i(gkran8_amp),\
	i(gkran1_vel),i(gkran2_vel),i(gkran3_vel),i(gkran4_vel),i(gkran5_vel),i(gkran6_vel),i(gkran7_vel),i(gkran8_vel)
	turnoffk gkTrans
	timout 0, i(gkTIME),contin
	igoto contin
	reinit reset
reset:
	FLsetVal_i 1, gihOn
	turnoff
	rigoto end
contin:
	tabw_i giTEMP, 0,giTrfuns
	tabw_i gisna0+i(gkGet), 1,giTrfuns
kTr 	transeg 0, i(gkTIME), iType, 1
gkTr = kTr

;printk2 kTr
ktrig	metro giUpsliders

	ftmorf kTr, giTrfuns, giTrans
	vtabk 0,giTrans,gkover,gkband,gkrate,gkdur,gk_CAR_min,gk_CAR_max,gk_MOD_min,gk_MOD_max,\ 
        gkindx1,gkindx2,gkindx3,gkindx4,gkindx5,gkindx6,gkindx7,gkindx8,\
	gklev_1,gklev_2,gklev_3,gklev_4,gklev_5,gklev_6,gklev_7,gklev_8,\
	gkran1_amp,gkran2_amp,gkran3_amp,gkran4_amp,gkran5_amp,gkran6_amp,gkran7_amp,gkran8_amp,\
	gkran1_vel,gkran2_vel,gkran3_vel,gkran4_vel,gkran5_vel,gkran6_vel,gkran7_vel,gkran8_vel

	FLsetVal ktrig, gkTr,gihTr

	FLsetVal ktrig,gkover,gihover
	FLsetVal ktrig,gkband,gihband
	FLsetVal ktrig,gkrate,gihrate
	FLsetVal ktrig,gkdur,gihdur

	FLsetVal ktrig,gk_CAR_min,gih_CAR_min
	FLsetVal ktrig,gk_CAR_max,gih_CAR_max
	FLsetVal ktrig,gk_MOD_min,gih_MOD_min
	FLsetVal ktrig,gk_MOD_max,gih_MOD_max

	FLsetVal ktrig,gkindx1,gihindx1
	FLsetVal ktrig,gkindx2,gihindx2
	FLsetVal ktrig,gkindx3,gihindx3
	FLsetVal ktrig,gkindx4,gihindx4
	FLsetVal ktrig,gkindx5,gihindx5
	FLsetVal ktrig,gkindx6,gihindx6
	FLsetVal ktrig,gkindx7,gihindx7
	FLsetVal ktrig,gkindx8,gihindx8

	FLsetVal ktrig,gklev_1,gihlev_1
	FLsetVal ktrig,gklev_2,gihlev_2
	FLsetVal ktrig,gklev_3,gihlev_3
	FLsetVal ktrig,gklev_4,gihlev_4
	FLsetVal ktrig,gklev_5,gihlev_5
	FLsetVal ktrig,gklev_6,gihlev_6
	FLsetVal ktrig,gklev_7,gihlev_7
	FLsetVal ktrig,gklev_8,gihlev_8

	FLsetVal ktrig,gkran1_amp,gihran1amp
	FLsetVal ktrig,gkran2_amp,gihran2amp
	FLsetVal ktrig,gkran3_amp,gihran3amp
	FLsetVal ktrig,gkran4_amp,gihran4amp
	FLsetVal ktrig,gkran5_amp,gihran5amp
	FLsetVal ktrig,gkran6_amp,gihran6amp
	FLsetVal ktrig,gkran7_amp,gihran7amp
	FLsetVal ktrig,gkran8_amp,gihran8amp

	FLsetVal ktrig,gkran1_vel,gihran1vel
	FLsetVal ktrig,gkran2_vel,gihran2vel
	FLsetVal ktrig,gkran3_vel,gihran3vel
	FLsetVal ktrig,gkran4_vel,gihran4vel
	FLsetVal ktrig,gkran5_vel,gihran5vel
	FLsetVal ktrig,gkran6_vel,gihran6vel
	FLsetVal ktrig,gkran7_vel,gihran7vel
	FLsetVal ktrig,gkran8_vel,gihran8vel
end:

endin



instr 108	; Init Instr. number set for transition

gkinstrLoad init 107
turnoff
endin



instr 110 ;load freq only  (no transitions)




iref1	tab_i	40, i(gkGet) + 200 
idev1	tab_i	41, i(gkGet) + 200 
iref2	tab_i	42, i(gkGet) + 200 
idev2	tab_i	43, i(gkGet) + 200 
iref3	tab_i	44, i(gkGet) + 200 
idev3	tab_i	45, i(gkGet) + 200
iref4	tab_i	46, i(gkGet) + 200 
idev4	tab_i	47, i(gkGet) + 200 
iref5	tab_i	48, i(gkGet) + 200 
idev5	tab_i	49, i(gkGet) + 200 
iref6	tab_i	50, i(gkGet) + 200 
idev6	tab_i	51, i(gkGet) + 200
iref7	tab_i	52, i(gkGet) + 200 
idev7	tab_i	53, i(gkGet) + 200 
iref8	tab_i	54, i(gkGet) + 200 
idev8	tab_i	55, i(gkGet) + 200


FLsetVal_i iref1, gihjo_x1
FLsetVal_i idev1, gihjo_y1
FLsetVal_i iref2, gihjo_x2
FLsetVal_i idev2, gihjo_y2
FLsetVal_i iref3, gihjo_x3
FLsetVal_i idev3, gihjo_y3
FLsetVal_i iref4, gihjo_x4
FLsetVal_i idev4, gihjo_y4
FLsetVal_i iref5, gihjo_x5
FLsetVal_i idev5, gihjo_y5
FLsetVal_i iref6, gihjo_x6
FLsetVal_i idev6, gihjo_y6
FLsetVal_i iref7, gihjo_x7
FLsetVal_i idev7, gihjo_y7
FLsetVal_i iref8, gihjo_x8
FLsetVal_i idev8, gihjo_y8



turnoff
endin



/*-------------------------------------------------------*/



</CsInstruments>

<CsScore>

f0 36000

/*          
i1 0  10    500  5000 	2
i1 12  10    130   .	1
i1 14  5     90   .	2
i1 21  20    60   .	1
i1 32  23   150   .	1
i1 45  10   370   .	2
i1 38  60   220   .	2
i1 48  50   110   .	2
e
*/
</CsScore>

</CsoundSynthesizer>

