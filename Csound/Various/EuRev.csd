<CsoundSynthesizer>

<CsOptions>
-+P  -m0 -+O -d
;-+I31 -+P31  -m0 -d -+O

</CsOptions>

<CsInstruments>


	sr     = 44100
	kr     = 441
	ksmps  = 100
	nchnls = 2




;===================================================================

#define MILLI #0.001#
#define PULSE_AMP #20000#
#define  PI #3.141592#

#define DEL_CMB1  #54.5501#	; DELAY COMB  (Set Base di EUVERB)
#define DEL_CMB2  #58.3473#
#define DEL_CMB3  #62.4089#
#define DEL_CMB4  #66.7532#
#define DEL_CMB5  #71.4001#
#define DEL_CMB6  #77.3317#



#define DEL_AP1 #17.65#		;DELAY ALL PASS (Set Base di EUVERB)
#define DEL_AP2 #13.91#
#define DEL_AP3 #10.97#
#define DEL_AP4 #8.61#
#define DEL_AP5 #6.83#
#define DEL_AP6 #5.31#


/*
#define DEL_AP1 #19.868437170265#		;DELAY ALL PASS (Set 2 di EUVERB)
#define DEL_AP2 #15.1667459315#
#define DEL_AP3 #11.57766865#
#define DEL_AP4 #8.837915#
#define DEL_AP5 #6.7465#
#define DEL_AP6 #5.15#


/*
#define DEL_AP1 #35.568890924809#		;DELAY ALL PASS (set 3 di Euverb)
#define DEL_AP2 #25.9626941057#
#define DEL_AP3 #18.95087161#
#define DEL_AP4 #13.832753#
#define DEL_AP5 #10.0969#
#define DEL_AP6 #7.37#

*/





#define DEL_AP1_ER #11.5#	; DELAY ALLPASS SEZIONE EARLY REFLECTION
#define DEL_AP2_ER #15.7#	; Vengono usati gli stessi tempi x LEFT e RIGHT
#define DEL_AP3_ER #21.3#	;
#define DEL_AP4_ER #37.7#	;


#define ALLPASS_MAX_DEL #0.3#
#define COMB_MAX_DEL #0.5#
#define SOURCE_ATTENUATION #0.5#;   !!!!!!!!!!!!!!!!  ATTENUAZIONE PER FILE IN CON SOUNDIN O TABELLA
;#define SOURCE_ATTENUATION #0.001#       ;!!!!!!!!!!!!!! ATTENUAZIONE PER LIVE IN !!!!!!!!!!!!!!!!!!!!

#define ED1L #0.007#
#define EG1L #0.5#
#define ED2L #0.027#
#define EG2L #0.8#
#define ED3L #0.033#
#define EG3L #0.9#
#define ED4L #0.055#
#define EG4L #0.7#
#define ED5L #0.059#
#define EG5L #0.5#
#define ED6L #0.061#
#define EG6L #0.3#


#define ED1R #0.008#
#define EG1R #0.5#
#define ED2R #0.039#
#define EG2R #0.8#
#define ED3R #0.051#
#define EG3R #0.9#
#define ED4R #0.063#
#define EG4R #0.7#
#define ED5R #0.065#
#define EG5R #0.5#
#define ED6R #0.071#
#define EG6R #0.3#

#define MAX_REV_PREDELAY #200#
#define FILECOEF #"BROWSE_FILE"#


#define FCUT_MIN_PEAK #20#
#define FCUT_MAX_PEAK #2000#
#define dB_MIN_PEAK #-18#
#define dB_MAX_PEAK #18#

#define FCUT_MIN_LSH #20#
#define FCUT_MAX_LSH #1000#
#define dB_MIN_LSH #-18#
#define dB_MAX_LSH #18#


#define FCUT_MIN_HSH #1000#
#define FCUT_MAX_HSH #12000#
#define dB_MIN_HSH #-18#
#define dB_MAX_HSH #18#


;==================== STEREO DELAY DEFINITIONS ==================

#define DEL_LEFT 	#200#		; 200 ms
#define DEL_RIGHT 	#200#

;================================================================



FLcolor 255, 255, 255
FLpanel "Multi Effect Design Tool", 700, 600,0,0, 1   ; 900,800

FLtabs 610, 560, 5, 5
FLlabel 12, 1, 0, 255, 255, 255
FLcolor 90, 132, 165


FLgroup "About", 900, 800, 0, 30, 1
FLlabel 12, 1, 0, 100, 30,130
ib1_i FLbox "EUVERB", 19, 5, 14, 500, 20, 60, 84
FLsetTextType 5, ib1_i
FLsetTextSize 24, ib1_i
ib2_i FLbox "Multi Effector Design Tool", 19, 5, 12, 400, 20, 110, 130
FLsetTextType 3, ib2_i
FLsetTextSize 24, ib2_i
ib3_i FLbox "Audio Research Studio", 19, 5, 11, 300, 20, 160, 170
FLsetTextType 3, ib3_i
FLsetTextSize 18, ib3_i
ib4_i FLbox "Ver. 3.00", 19, 5, 11, 300, 20, 160, 270
FLsetTextType 3, ib4_i
FLsetTextSize 18, ib4_i

gk_quit, ihquit		FLbutton "Exit" ,1, 0, 2, 60, 35,20, 50, 0, 1, 0, 1


FLgroup_end


FLcolor 20, 160,225

FLgroup "Echo/Delay", 900, 800, 0, 30, 1
ic1x FLbox "Stereo DELAY", 19, 5, 14, 300, 20, 460, 44
FLsetTextType 3, ic1x
FLsetTextSize 20, ic1x
FLcolor 100, 142, 165



gk1but_stdl, ih1but_stdl		FLbutton "@> / ¤" ,0, 1, 2, 80, 35,150, 60, 0, 11, 0, 36000

gksli_stdl_DELL, gisli_stdl_DELL 	FLslider "DELAY L [ms]", 10, 500, 0, 15, -1, 300, 14, 30, 140
		   			FLsetVal_i 	$DEL_LEFT, gisli_stdl_DELL
gksli_stdl_DELR, gisli_stdl_DELR 	FLslider "DELAY_R [ms]", 10, 500, 0, 15, -1, 300, 14, 30, 240
		   			FLsetVal_i 	$DEL_RIGHT, gisli_stdl_DELR

ihval_stdl_FEEDL			FLvalue	" ",		55,15,350,190
gkpot_stdl_FEEDL,gipot_stdl_FEEDL	FLknob "Feed L", 	 	0, 0.99, 0, 1, ihval_stdl_FEEDL,55, 350, 120
					FLsetVal_i 		0.5, gipot_stdl_FEEDL


ihval_stdl_FEEDR			FLvalue	" ",		55,15,350,290
gkpot_stdl_FEEDR,gipot_stdl_FEEDR	FLknob "Feed R", 	0, 0.99, 0, 1, ihval_stdl_FEEDR,55, 350, 220
					FLsetVal_i 		0.5, gipot_stdl_FEEDR

ihval_stdl_INGAIN			FLvalue " ",		55,15,50,340
gkingain_stdl,gipot_stdl_gain		FLknob "Input Gain", 	0, 1, 0, 1, ihval_stdl_INGAIN, 55, 50, 380	
					FLsetVal_i 0.5, gipot_stdl_gain

ihval_stdl_DELAYLEV			FLvalue " ",		55,15,150,340
gkoutlev_stdl,gipot_stdl_outlev		FLknob "Delay Level", 	0, 1, 0, 1, ihval_stdl_DELAYLEV,55, 150, 380
					FLsetVal_i 0.5, gipot_stdl_outlev

ihval_stdl_DIRECTLEV			FLvalue " ",		55,15,250,340
gkdirectlev_stdl,gipot_stdl_directlev	FLknob "Direct Level", 	0, 1, 0, 1, ihval_stdl_DIRECTLEV,55, 250, 380
					FLsetVal_i 0.5, gipot_stdl_directlev


gk_onoff_stdl, gihb1_stdl		FLbutton "Play/Mute" ,1, 0, 2, 120, 35, 30, 60, -1

gksw_source_stdl,gihb2_stdl 		FLbutton "Pulse/Wave" ,1, 0, 2, 120, 35, 30, 100, -1

gksw_stdl, gih_wav_stdl			FLcount	"Source Selector", 0, 4, 1, 2, 1, 150, 16, 300, 60, -1

gk_over_lev_stdl, ih_over_stdl		FLslider "Master Volume", 0, 1, 0, 5, -1, 280, 16, 34,480
					FLsetVal_i 0.7, ih_over_stdl

gk_save_stdl, gih_save		FLbutton "Save"  , 1, 0, 1, 80, 17, 150, 100,-1; 105, 99, 0, 3
gk_load_stdl, gih_load		FLbutton "Load"  , 1, 0, 1, 80, 17, 150, 118,-1; 105,100, 0, 3


FLgroup_end



FLgroup "PSA", 700, 600, 8, 30, 1


gk1but_stps, ih1but_stps		FLbutton "@> / ¤" ,0, 1, 2, 80, 35,150, 60, 0, 12, 0, 36000


gksli_stps_AZIMUT, gisli_stps_AZIMUT 	FLslider "Azimut [degrees]", -90, 90, 0, 15, -1, 300, 14, 30, 140
		   			FLsetVal_i 	0, gisli_stps_AZIMUT
FLgroup_end

;gih_coefs	fiopen	"f:/csorcsco/revmodels/prova.txt",0 
;=============================================
;
;		INSTRUMENT PANELS		
;
;=============================================

FLgroup "Reverb", 700, 600, 0, 30, 1 ;    900, 800
FLlabel 12, 5, 0, 255, 255, 255
ib1x FLbox "EU_Verb 03", 19, 5, 14, 300, 20, 460, 44
FLsetTextType 3, ib1x
FLsetTextSize 20, ib1x
;ib1x1 FLbox "6 Combs 6 AP 10 ER", 19, 5, 10, 300, 20, 160, 84
;FLsetTextType 5, ib1x1	

gk_x, ih111		FLbutton "@> / ¤" ,1, 0, 2, 80, 35,150, 60, 0, 10, 0, 36000

gkdel_CMB1, gih1x1 	FLslider "COMB_1 [ms]", 1, 80, 0, 15, -1, 200, 14, 30, 140
		   	FLsetVal_i 	$DEL_CMB1, gih1x1
gkdel_CMB2, gih1x2 	FLslider "COMB_2 [ms]", 1, 80, 0, 15, -1, 200, 14, 30, 180
		   	FLsetVal_i 	$DEL_CMB2, gih1x2
gkdel_CMB3, gih1x3 	FLslider "COMB_3 [ms]", 1, 80, 0, 15, -1, 200, 14, 30, 220
		   	FLsetVal_i 	$DEL_CMB3, gih1x3
gkdel_CMB4, gih1x4 	FLslider "COMB_4 [ms]", 1, 80, 0, 15, -1, 200, 14, 30, 260
		   	FLsetVal_i 	$DEL_CMB4, gih1x4
gkdel_CMB5, gih1x5 	FLslider "COMB_5 [ms]", 1, 80, 0, 15, -1, 200, 14, 30, 300
		   	FLsetVal_i 	$DEL_CMB5, gih1x5
gkdel_CMB6, gih1x6 	FLslider "COMB_6 [ms]", 1, 80, 0, 15, -1, 200, 14, 30, 340
		   	FLsetVal_i 	$DEL_CMB6, gih1x6


gkeq_ER_F, gih1x7  	FLslider "PEAK ERfreq [hz]", $FCUT_MIN_PEAK, $FCUT_MAX_PEAK, 0, 11, -1,170, 14, 400,310
		   	FLsetVal_i 	$FCUT_MIN_PEAK, gih1x7

gkeq_ER_PEAK, gih1x8 	FLslider "PEAK ERgain [dB]", $dB_MIN_PEAK, $dB_MAX_PEAK, 0, 11, -1, 170, 14, 400,350
		    	FLsetVal_i 	0, gih1x8


gkeq_REV_F, gih1x9  	FLslider "LOSH REV freq [hz]", $FCUT_MIN_LSH, $FCUT_MAX_LSH, 0, 11, -1,170, 14, 400,390 
		    	FLsetVal_i 	$FCUT_MIN_LSH, gih1x9


gkeq_REV_LSH, gih1x10 	FLslider "LOSH REV gain [dB]", $dB_MIN_LSH, $dB_MAX_LSH, 0, 11, -1, 170, 14, 400,430     
		      	FLsetVal_i 0, gih1x10


gkeq_REV_F_HS, gih1x11  FLslider "HISH REV freq [hz]", $FCUT_MIN_HSH, $FCUT_MAX_HSH, 0, 11, -1,170, 14, 400,470  
		    	FLsetVal_i 	$FCUT_MIN_HSH, gih1x11


gkeq_REV_HSH, gih1x12 	FLslider "HISH REV gain [dB]", $dB_MIN_HSH, $dB_MAX_HSH, 0, 11, -1, 170, 14, 400,510 
		      	FLsetVal_i 0, gih1x12



	
ih13			FLvalue	" ",		55,15,40,480
gk_gain_AP, gih3x7 	FLknob "APgain", 	0.1, 0.9, 	0, 1, ih13,    	55,  40, 400
			FLsetVal_i 		0.5, gih3x7

ih20			FLvalue	" ",		55,15,120,480
gkpulse_freq, gih3x9 	FLknob "PLStme", 	0.1, 2,   	0, 1, ih20,     55, 120, 400
			FLsetVal_i 		1.0, gih3x9

ih21			FLvalue	" ",		55,15,200,480
gkap_scale, gih3x10 	FLknob "AP_DLYscl", 	0.2, 4,   	0, 1, ih21,      55, 200, 400
			FLsetVal_i 		1.5, gih3x10

ih22			FLvalue	" ",		55,15,280,480
gkcmb_scale, gih3x11 	FLknob "CMB_DLYscl", 	0.5, 2,   	0, 1, ih22,      55, 280, 400
			FLsetVal_i 		1.5, gih3x11

ih90			FLvalue	" ",		55,15,300,180
gkear_level,gih3x90	FLknob "EARlev", 	0, 1, 		0, 1, ih90,	55, 300, 100
			FLsetVal_i 		0, gih3x90


ih18			FLvalue	" ",		55,15,400,180
gk_T60, gih3x8 		FLknob "T60 s", 	0.1, 5,   	0, 1, ih18,      55, 400, 100
			FLsetVal_i 		1.2, gih3x8

ih19			FLvalue	" ",		55,15,500,180
gkhf,gih3x12		FLknob "HFhz", 	 	4000, 16000, 	0, 1, ih19,	55, 500, 100
			FLsetVal_i 		12000, gih3x12


ih16			FLvalue	" ",		55,15,500,280		
gkrev_lev,gih3x13	FLknob "REVlev", 	0, 1, 	0, 1, ih16,	55, 500, 200
			FLsetVal_i 		0.15, gih3x13

ih17			FLvalue	" ",		55,15,400,280
gkdir_lev,gih3x14	FLknob "DIRlev", 	0, 1, 	0, 1, ih17,	55, 400, 200
			FLsetVal_i 		0.81, gih3x14

ih14			FLvalue	" ",		55,15,300,280
gk_predelay,gih3x15	FLknob "PREms", 	0, 199, 0, 1, ih14, 55, 300, 200
			FLsetVal_i 		0, gih3x15

ih23			FLvalue	" ",		55,15,300,380
gk_eartap_scale,gih3x17	FLknob "EARTscl", 	0.35, 4, 0, 1, ih23, 55, 300,300
			FLsetVal_i 		1, gih3x17

/*
ih26			FLvalue	" ",		55,15,400,380
gkap_ER_scale,gih3x20	FLknob "DIFscl", 	0.5, 2, 0, 1, ih26, 55, 400,300
			FLsetVal_i 		1, gih3x20

ih27			FLvalue	" ",		55,15,500,380
gk_gain_AP_ER,gih3x27	FLknob "DIFgain", 	0, 0.8, 0, 1, ih27, 55, 500,300
			FLsetVal_i 		0.66, gih3x27
*/

gk_onoff, gihb1			FLbutton "Play/Mute" ,1, 0, 2, 120, 35, 30, 60, -1
gksw_source,gihb2 		FLbutton "Pulse/Wave" ,1, 0, 2, 120, 35, 30, 100, -1

gk_save, gih_save		FLbutton "Save"  , 1, 0, 1, 80, 17, 150, 100, 105, 99, 0, 3
gk_load, gih_load		FLbutton "Load"  , 1, 0, 1, 80, 17, 150, 118, 105,100, 0, 3
gk_bypss,gih_bypss		FLbutton "REVby", 1, 0,  2, 60, 20, 564, 218, -1
gk_bypss_er,gih_bypss_er	FLbutton "EARby", 1, 0,  2, 60, 20, 564, 198, -1
gk_bypass_dir,gih_bypass_dir	FLbutton "DIRby", 1, 0,  2, 60, 20, 564, 238, -1


gk_over_lev, ih_over		FLslider "Master Volume", 0, 1, 0, 5, -1, 350, 16, 34,555
				FLsetVal_i 0.7, ih_over


ihgains1				FLvalue	" ",50,15,34,535
ihgains2				FLvalue	" ",50,15,94,535
ihgains3				FLvalue	" ",50,15,154,535
ihgains4				FLvalue	" ",50,15,214,535
ihgains5				FLvalue	" ",50,15,274,535
ihgains6				FLvalue	" ",50,15,334,535



gkscap1, gihscap1		FLslider "AP1s", 0,1,0,5,ihgains1,50,10,34,510
				FLsetVal_i 1.0, gihscap1
gkscap2, gihscap2		FLslider "AP2s", 0,1,0,5,ihgains2,50,10,94,510
				FLsetVal_i 1.0, gihscap2
gkscap3, gihscap3		FLslider "AP3s", 0,1,0,5,ihgains3,50,10,154,510
				FLsetVal_i 1.0, gihscap3
gkscap4, gihscap4		FLslider "AP4s", 0,1,0,5,ihgains4,50,10,214,510
				FLsetVal_i 1.0, gihscap4
gkscap5, gihscap5		FLslider "AP5s", 0,1,0,5,ihgains5,50,10,274,510
				FLsetVal_i 1.0, gihscap5
gkscap6, gihscap6		FLslider "AP6s", 0,1,0,5,ihgains6,50,10,334,510
				FLsetVal_i 1.0, gihscap6

FLsetColor   0, 100, 40, gihscap1
FLsetColor  50, 100, 40, gihscap2
FLsetColor 120, 100, 40, gihscap3
FLsetColor 180, 100, 40, gihscap4
FLsetColor 240, 100, 40, gihscap5
FLsetColor 150, 100, 40, gihscap6

gksw, gih_wav	FLcount	"Source Selector", 0, 5, 1, 2, 1, 150, 16, 300, 60, -1; 105,9,0,3000

FLsetTextSize 12, gihb1

FLsetColor 200, 150, 0, gih3x7 ; colore APgain
FLsetColor 128, 40,  80, gih3x8 ; colore T60
FLsetColor 200, 150, 0, gih3x9
FLsetColor 200, 150, 0, gih3x10
FLsetColor 200, 150, 0, gih3x11
FLsetColor 128, 40,  80, gih3x12
FLsetColor 128, 40,  80, gih3x13
FLsetColor 128, 40,  80, gih3x14
FLsetColor 20, 50, 90, gih3x15

FLgroup_end

FLrun





;==================================================   DSP ==============================================  

instr 1

exitnow		; when called stop and exit Csound
endin

instr 5
;CALCOLO COEFFICIENTI FILTRI DI EQUALIZZAZIONE  (NON ATTIVO MA FUNZIONANTE)
if0 init 100
iQ init 0.707
idB = 10


iw0 = 2 * $PI * if0 / sr
i_COS = cos(iw0)
i_SIN = sin (iw0)
ialpha = i_SIN / 2 * iQ
iA = 10^ (idB /40) 

gib0 = 1 + (ialpha * iA)
gib1 = -2 * i_COS
gib2 = 1 - ialpha * iA

gia0 = 1 + ialpha /iA
gia1 = -2 * i_COS
gia2 = 1 - ialpha / iA
turnoff
endin



;=========================================IMPULSE GEN AND READ SAMPLES FROM DISK==========================

instr 10
if gk_x = 1 goto on
turnoff
on:
/*
ifn1 ftgen 1, 0,  0, -1, "f:/csorcsco/revmodels/stim/mozart.wav",  0, 4, 0
ifn2 ftgen 2, 0,  0, -1, "f:/csorcsco/revmodels/stim/voice.wav",   0, 4, 0
ifn3 ftgen 3, 0,  0, -1, "f:/csorcsco/revmodels/stim/Drum130.wav", 0, 4, 0  
ifn4 ftgen 4, 0,  0, -1, "f:/csorcsco/revmodels/stim/glinka.wav",   0, 4, 0
ifn5 ftgen 5, 0,  0, -1, "f:/csorcsco/revmodels/stim/snare.wav",   0, 4, 0

*/
anoise randi 0.1,10
;a_pulse	mpulse	$PULSE_AMP, gkpulse_freq

;a_pulse line 1,1/kr,0
a_pulse_1	mpulse	$PULSE_AMP, gkpulse_freq
a_pulse = a_pulse_1 + anoise

;a_sound_0 lposcil  $SOURCE_ATTENUATION, 1, 0,ftlen(1)-1,1  ; legge il file dalla tabella
;a_sound_1 lposcil  $SOURCE_ATTENUATION, 1, 0,ftlen(2)-1,2  ; legge il file dalla tabella
;a_sound_2 lposcil  $SOURCE_ATTENUATION, 1, 0,ftlen(3)-1,3  ; legge il file dalla tabella
;a_sound_3 lposcil  $SOURCE_ATTENUATION, 1, 0,ftlen(4)-1,4  ; legge il file dalla tabella
;a_sound_4 lposcil  $SOURCE_ATTENUATION, 1, 0,ftlen(5)-1,5  ; legge il file dalla tabella
;a_sound_5 lposcil  $SOURCE_ATTENUATION, 1, 0,ftlen(6)-1,6  ; legge il file dalla tabella

;"Z:/alessandropetrolati On My Mac/Documents/Suoni/10Intervallo.wav"
a_sound_0 diskin "Z:/alessandropetrolati On My Mac/Desktop/001 No.1 in A major.BWV806%005C207TPrelude.wav",2,0,1
a_sound_1 diskin "Z:/alessandropetrolati On My Mac/Desktop/001 No.1 in A major.BWV806%005C207TPrelude.wav",2,0,1
a_sound_2 diskin "Z:/alessandropetrolati On My Mac/Desktop/001 No.1 in A major.BWV806%005C207TPrelude.wav",2,0,1
a_sound_3 diskin "Z:/alessandropetrolati On My Mac/Desktop/001 No.1 in A major.BWV806%005C207TPrelude.wav",2,0,1
a_sound_4 diskin "Z:/alessandropetrolati On My Mac/Desktop/001 No.1 in A major.BWV806%005C207TPrelude.wav",2,0,1
a_sound_5 diskin "Z:/alessandropetrolati On My Mac/Desktop/001 No.1 in A major.BWV806%005C207TPrelude.wav",2,0,1

;printk2 gksw 
if gksw = 0 goto 0
if gksw = 1 goto 1
if gksw = 2 goto 2
if gksw = 3 goto 3
if gksw = 4 goto 4
if gksw = 5 goto 5

0:
ksw0 = 1
ksw1 = 0
ksw2 = 0
ksw3 = 0
ksw4 = 0
ksw5 = 0

goto somma
1:
ksw0 = 0
ksw1 = 1
ksw2 = 0
ksw3 = 0
ksw4 = 0
ksw5 = 0

goto somma
2:
ksw0 = 0
ksw1 = 0
ksw2 = 1
ksw3 = 0
ksw4 = 0
ksw5 = 0

goto somma
3:
ksw0 = 0
ksw1 = 0
ksw2 = 0
ksw3 = 1
ksw4 = 0
ksw5 = 0

goto somma
4:
ksw0 = 0
ksw1 = 0
ksw2 = 0
ksw3 = 0
ksw4 = 1
ksw5 = 0

goto somma
5:
ksw0 = 0
ksw1 = 0
ksw2 = 0
ksw3 = 0
ksw4 = 0
ksw5 = 1

somma:


a_sound = a_sound_0 * ksw0 + a_sound_1 * ksw1 +  a_sound_2 * ksw2 + a_sound_3 * ksw3 + a_sound_4 * ksw4 + a_sound_5 * ksw5


k2 rand 0.01  ; Genera uno sputo di rumore da sommare al segnale in modo da rendere ga_in sempre != 0 ( per il filtro pareq)



if gksw_source = 0 goto a1
ga_in = a_sound * gk_onoff + k2
goto next
a1:
;k2 rand 0.01  !!!!!!!!!!!!!!!!!! inietta un po' di rumore in modo da rendere ga_in != 0 ( per il filtro pareq)
ga_in = a_pulse * gk_onoff + k2  

next:
;======================================= EUVERB ================================================



;iT60 = 2
gk_F60 = 1/(0.1+ gk_T60)
	


gkdel_CMB1_A = gkdel_CMB1 * $MILLI * gkcmb_scale 	;conversione da sec a msec e riscalatura
gkdel_CMB2_A = gkdel_CMB2 * $MILLI * gkcmb_scale	;
gkdel_CMB3_A = gkdel_CMB3 * $MILLI * gkcmb_scale
gkdel_CMB4_A = gkdel_CMB4 * $MILLI * gkcmb_scale
gkdel_CMB5_A = gkdel_CMB5 * $MILLI * gkcmb_scale
gkdel_CMB6_A = gkdel_CMB6 * $MILLI * gkcmb_scale

gk_gain_CMB1_A	pow	10, (-gkdel_CMB1_A * 3 * gk_F60) ; calcolo del gain per ogni comb dato il T60 ( o F60)
gk_gain_CMB2_A	pow	10, (-gkdel_CMB2_A * 3 * gk_F60) 	
gk_gain_CMB3_A	pow	10, (-gkdel_CMB3_A * 3 * gk_F60)
gk_gain_CMB4_A	pow	10, (-gkdel_CMB4_A * 3 * gk_F60)
gk_gain_CMB5_A	pow	10, (-gkdel_CMB5_A * 3 * gk_F60)
gk_gain_CMB6_A	pow	10, (-gkdel_CMB6_A * 3 * gk_F60)
	




gkdel_CMB1_B = gkdel_CMB1_A*(1 - 0.213)			;calcolo della seconda tappa del comb (valori a caso)
gkdel_CMB2_B = gkdel_CMB2_A*(1 - 0.317)
gkdel_CMB3_B = gkdel_CMB3_A*(1 - 0.271)
gkdel_CMB4_B = gkdel_CMB4_A*(1 - 0.177)
gkdel_CMB5_B = gkdel_CMB5_A*(1 - 0.263)
gkdel_CMB6_B = gkdel_CMB6_A*(1 - 0.299)
;
;



ain_ap = ga_in 
ain_er = ga_in 

ain_EQ_HS pareq	ga_in,     gkeq_REV_F, ampdb(gkeq_REV_LSH), 0.707, 1 ; EQUALIZZA SEGNALE INGRESSO  LOW SHELF
ain_ap_EQ pareq ain_EQ_HS, gkeq_REV_F_HS, ampdb(gkeq_REV_HSH), 0.707, 2; EQUALIZZA SEGNALE INGRESSO  HI SHELF

ain_er_EQ pareq	ain_ap_EQ, gkeq_ER_F, ampdb(gkeq_ER_PEAK), 0.707	; EQUALIZZA ER 

;ain_ap_EQ pareq	ain_ap, gkeq_REV_F, ampdb(gkeq_REV_LSH), 0.707, 1 ; EQUALIZZA REV
;ain_er_EQ pareq	ain_er, gkeq_ER_F, ampdb(gkeq_ER_PEAK), 0.707	; EQUALIZZA ER 



;========================================== EARLY REFLECTION SECTION =====================================

;ain_er_EQ biquad ain_er,gib0,gib1,gib2, gia0, gia1, gia2

aerdummy_L delayr 1					;LEFT ER

	aer_tap1_L  deltapi $ED1L * gk_eartap_scale
	aer_tap2_L  deltapi $ED2L * gk_eartap_scale	
	aer_tap3_L  deltapi $ED3L * gk_eartap_scale	
	aer_tap4_L  deltapi $ED4L * gk_eartap_scale
	aer_tap5_L  deltapi $ED5L * gk_eartap_scale
	

delayw ain_er_EQ


	
aerdummy_R delayr 1					;RIGHT ER

	aer_tap1_R  deltapi $ED1R * gk_eartap_scale
	aer_tap2_R  deltapi $ED2R * gk_eartap_scale	
	aer_tap3_R  deltapi $ED3R * gk_eartap_scale	
	aer_tap4_R  deltapi $ED4R * gk_eartap_scale
	aer_tap5_R  deltapi $ED5R * gk_eartap_scale
	
delayw ain_er_EQ




aer_L = $EG1L * aer_tap1_L + $EG2L * aer_tap2_L + $EG3L * aer_tap3_L + $EG4L * aer_tap4_L + $EG5L * aer_tap5_L 	; SOMMA DEI TAPS DI ER  (LEFT)
aer_R = $EG1R * aer_tap1_R + $EG2R * aer_tap2_R + $EG3R * aer_tap3_R + $EG4R * aer_tap4_R + $EG5R * aer_tap5_R 	;  			(RIGHT)




;========================================== ALL PASS SECTION =====================================


ain_ap_predelay	vdelay ain_ap_EQ, gk_predelay,$MAX_REV_PREDELAY ;   !!!!! TEMPI IN MSEC

;******* ALLPASS 1
adummy_AP1 	delayr $ALLPASS_MAX_DEL
a1 		deltap $DEL_AP1*$MILLI * gkap_scale
ap1 = a1 + (-gk_gain_AP * gkscap1 * ain_ap_predelay) 
	   	delayw ain_ap_predelay + (gk_gain_AP * gkscap1* ap1 ) 

;******* ALLPASS 2
adummy_AP2 	delayr $ALLPASS_MAX_DEL
a2 		deltap $DEL_AP2*$MILLI * gkap_scale
ap2 = a2 + (-gk_gain_AP * gkscap2 * ap1) 
	   	delayw ap1 + (gk_gain_AP * gkscap2 * ap2) 

;******* ALLPASS 3
adummy_AP3 	delayr $ALLPASS_MAX_DEL
a3 		deltap $DEL_AP3*$MILLI * gkap_scale
ap3 = a3 + (-gk_gain_AP * gkscap3 * ap2) 
	   	delayw ap2 + (gk_gain_AP * gkscap3 * ap3)

;******* ALLPASS 4
adummy_AP4 	delayr $ALLPASS_MAX_DEL;
a4 		deltap $DEL_AP4*$MILLI * gkap_scale
ap4 = a4 + (-gk_gain_AP * gkscap4 * ap3) 
	   	delayw ap3 + (gk_gain_AP * gkscap4 * ap4)

;******* ALLPASS 5
adummy_AP5 	delayr $ALLPASS_MAX_DEL
a5 		deltap $DEL_AP5*$MILLI * gkap_scale
ap5 = a5 + (-gk_gain_AP * gkscap5 * ap4) 
	   	delayw ap4 + (gk_gain_AP * gkscap5 * ap5)

;******* ALLPASS 6
adummy_AP6 	delayr $ALLPASS_MAX_DEL
a6 		deltap $DEL_AP6*$MILLI * gkap_scale
ap6 = a6 + (-gk_gain_AP * gkscap6 * ap5) 
	   	delayw ap5 + (gk_gain_AP * gkscap6 * ap6)


ain = ap6

;========================================== COMB SECTION =====================================



;******* COMB 1
adummy_CMB1 	delayr $COMB_MAX_DEL
aout_CMB1_A	deltapi gkdel_CMB1_A
aout_CMB1_B	deltapi gkdel_CMB1_B
afil_CMB1 	tone aout_CMB1_A * gk_gain_CMB1_A, gkhf
		delayw ain + afil_CMB1 		

;******** COMB 2
adummy_CMB2 	delayr $COMB_MAX_DEL
aout_CMB2_A	deltapi gkdel_CMB2_A
aout_CMB2_B	deltapi gkdel_CMB2_B
afil_CMB2 	tone aout_CMB2_A * gk_gain_CMB2_A, gkhf
		delayw ain + afil_CMB2 		

;******** COMB 3
adummy_CMB3 	delayr $COMB_MAX_DEL
aout_CMB3_A	deltapi gkdel_CMB3_A
aout_CMB3_B	deltapi gkdel_CMB3_B
afil_CMB3 	tone aout_CMB3_A * gk_gain_CMB3_A, gkhf
		delayw ain + afil_CMB3

;******** COMB 4
adummy_CMB4 	delayr $COMB_MAX_DEL
aout_CMB4_A	deltapi gkdel_CMB4_A
aout_CMB4_B	deltapi gkdel_CMB4_B
afil_CMB4 	tone aout_CMB4_A * gk_gain_CMB4_A, gkhf
		delayw ain + afil_CMB4

;******** COMB 5
adummy_CMB5 	delayr $COMB_MAX_DEL
aout_CMB5_A	deltapi gkdel_CMB5_A
aout_CMB5_B	deltapi gkdel_CMB5_B
afil_CMB5 	tone aout_CMB5_A * gk_gain_CMB5_A, gkhf
		delayw ain + afil_CMB5


;******** COMB 6
adummy_CMB6 	delayr $COMB_MAX_DEL
aout_CMB6_A	deltapi gkdel_CMB6_A
aout_CMB6_B	deltapi gkdel_CMB6_B
afil_CMB6 	tone aout_CMB6_A * gk_gain_CMB6_A, gkhf
		delayw ain + afil_CMB6
 	
acomb_LEFT  = (aout_CMB1_A + aout_CMB2_A  + aout_CMB3_A + aout_CMB4_A + aout_CMB5_A + aout_CMB6_A)* (1-gk_bypss)
acomb_RIGHT = (aout_CMB1_B + aout_CMB2_B  + aout_CMB3_B + aout_CMB4_B + aout_CMB5_B + aout_CMB6_B)* (1-gk_bypss)


outs1 (((1-gk_bypss_er)*gkear_level*aer_L + gkdir_lev * ga_in * (1-gk_bypass_dir) + gkrev_lev * acomb_LEFT ))* gk_over_lev
outs2 (((1-gk_bypss_er)*gkear_level*aer_R + gkdir_lev * ga_in * (1-gk_bypass_dir) + gkrev_lev * acomb_RIGHT))* gk_over_lev 


endin

;================================================================
;
;			STEREO DELAY EFFECT
;
;================================================================
instr 11

;if gk1but_stdl = 1 goto on
;turnoff
;on:
turnoffk gk1but_stdl

anoise randi 0.1,10
;a_pulse	mpulse	$PULSE_AMP, gkpulse_freq

;a_pulse line 1,1/kr,0
a_pulse_1	mpulse	$PULSE_AMP, gkpulse_freq
a_pulse = a_pulse_1 + anoise

;a_sound_0 lposcil  $SOURCE_ATTENUATION, 1, 0,ftlen(1)-1,1  ; legge il file dalla tabella
;a_sound_1 lposcil  $SOURCE_ATTENUATION, 1, 0,ftlen(2)-1,2  ; legge il file dalla tabella
;a_sound_2 lposcil  $SOURCE_ATTENUATION, 1, 0,ftlen(3)-1,3  ; legge il file dalla tabella
;a_sound_3 lposcil  $SOURCE_ATTENUATION, 1, 0,ftlen(4)-1,4  ; legge il file dalla tabella
;a_sound_4 lposcil  $SOURCE_ATTENUATION, 1, 0,ftlen(7)-1,7  ; legge il file dalla tabella
;Z:/alessandropetrolati On My Mac/Documents/Suoni/10Intervallo.wav
a_sound_0 diskin "Z:/alessandropetrolati On My Mac/Desktop2_15_BachFuga.wav",2,0,1
a_sound_1 diskin "Z:/alessandropetrolati On My Mac/Desktop2_15_BachFuga.wav",2,0,1
a_sound_2 diskin "Z:/alessandropetrolati On My Mac/Desktop2_15_BachFuga.wav",2,0,1
a_sound_3 diskin "Z:/alessandropetrolati On My Mac/Desktop2_15_BachFuga.wav",2,0,1
a_sound_4 diskin "Z:/alessandropetrolati On My Mac/Desktop2_15_BachFuga.wav",2,0,1

;printk2 gksw 
if gksw_stdl = 0 goto 0
if gksw_stdl = 1 goto 1
if gksw_stdl = 2 goto 2
if gksw_stdl = 3 goto 3
if gksw_stdl = 4 goto 4

0:
ksw0 = 1
ksw1 = 0
ksw2 = 0
ksw3 = 0
ksw4 = 0


goto somma
1:
ksw0 = 0
ksw1 = 1
ksw2 = 0
ksw3 = 0
ksw4 = 0


goto somma
2:
ksw0 = 0
ksw1 = 0
ksw2 = 1
ksw3 = 0
ksw4 = 0

goto somma
3:
ksw0 = 0
ksw1 = 0
ksw2 = 0
ksw3 = 1
ksw4 = 0
goto somma
4:
ksw0 = 0
ksw1 = 0
ksw2 = 0
ksw3 = 0
ksw4 = 1


somma:


a_sound = a_sound_0 * ksw0 + a_sound_1 * ksw1 +  a_sound_2 * ksw2 + a_sound_3 * ksw3 + a_sound_4 * ksw4




if gksw_source_stdl= 0 goto a1
ga_in_stdl = a_sound * gk_onoff_stdl 
goto next
a1:
k2 rand 0.01  ; !!!!!!!!!!!!!!!!!! inietta un po' di rumore in modo da rendere ga_in != 0 ( per il filtro pareq)
ga_in_stdl = a_pulse * gk_onoff_stdl + k2  

next:



ain = ga_in_stdl * gkingain_stdl

;----------------   COMB  DELAY LEFT

adummy_L 	delayr 1
adelay_L	deltapi gksli_stdl_DELL * $MILLI

afeed_L = adelay_L * gkpot_stdl_FEEDL
		delayw ain + afeed_L 	

;----------------   COMB  DELAY RIGHT

adummy_R 	delayr 1
adelay_R	deltapi gksli_stdl_DELR * $MILLI

afeed_R = adelay_R * gkpot_stdl_FEEDR
		delayw ain + afeed_R

aout_L = (adelay_L * gkoutlev_stdl + ga_in_stdl * gkdirectlev_stdl )* gk_over_lev_stdl

aout_R = (adelay_R * gkoutlev_stdl + ga_in_stdl * gkdirectlev_stdl )* gk_over_lev_stdl
	
outs aout_L, aout_R
;outs ga_in_stdl, ga_in_stdl
;outs afeed_L, ain
endin






;================================================================
;
;			PSEUDO STEREO EFFECT
;
;================================================================
instr 12

turnoffk gk1but_stps


endin




instr 99
;============================= SAVE DATA  INTO A ASCII DATA  ======================================

;gih_coefs	fiopen	$FILECOEF,0 


ifn1 ftgen	100, 0, 128, -2, 0
icmb_scale = i (gkcmb_scale)			        ; congela fattore scalatura attuale dei comb


idel_CMB1_A 	= i(gkdel_CMB1_A)* 1000
idel_CMB2_A 	= i(gkdel_CMB2_A)* 1000
idel_CMB3_A 	= i(gkdel_CMB3_A)* 1000
idel_CMB4_A 	= i(gkdel_CMB4_A)* 1000
idel_CMB5_A 	= i(gkdel_CMB5_A)* 1000
idel_CMB6_A 	= i(gkdel_CMB6_A)* 1000

idel_CMB1_B 	= i(gkdel_CMB1_B)* 1000
idel_CMB2_B 	= i(gkdel_CMB2_B)* 1000
idel_CMB3_B 	= i(gkdel_CMB3_B)* 1000
idel_CMB4_B 	= i(gkdel_CMB4_B)* 1000
idel_CMB5_B 	= i(gkdel_CMB5_B)* 1000
idel_CMB6_B 	= i(gkdel_CMB6_B)* 1000


idelta_CMB1	= idel_CMB1_A - idel_CMB1_B
idelta_CMB2	= idel_CMB2_A - idel_CMB2_B
idelta_CMB3	= idel_CMB3_A - idel_CMB3_B
idelta_CMB4	= idel_CMB4_A - idel_CMB4_B
idelta_CMB5	= idel_CMB5_A - idel_CMB5_B
idelta_CMB6	= idel_CMB6_A - idel_CMB6_B

ibase_del_CMB1  = idel_CMB1_A / icmb_scale	; trova valore base attuale dei delay comb  (msec) 
ibase_del_CMB2  = idel_CMB2_A / icmb_scale
ibase_del_CMB3  = idel_CMB3_A / icmb_scale
ibase_del_CMB4  = idel_CMB4_A / icmb_scale
ibase_del_CMB5  = idel_CMB5_A / icmb_scale
ibase_del_CMB6  = idel_CMB6_A / icmb_scale


iap_scale = i(gkap_scale)

idef_del_AP1   = $DEL_AP1
idef_del_AP2   = $DEL_AP2
idef_del_AP3   = $DEL_AP3
idef_del_AP4   = $DEL_AP4
idef_del_AP5   = $DEL_AP5
idef_del_AP6   = $DEL_AP6




	
idel_AP1 = idef_del_AP1 * iap_scale
idel_AP2 = idef_del_AP2 * iap_scale
idel_AP3 = idef_del_AP3 * iap_scale
idel_AP4 = idef_del_AP4 * iap_scale
idel_AP5 = idef_del_AP5 * iap_scale
idel_AP6 = idef_del_AP6 * iap_scale


igain_AP = i (gk_gain_AP)

iscap1 = i(gkscap1)
iscap2 = i(gkscap2)
iscap3 = i(gkscap3)
iscap4 = i(gkscap4)
iscap5 = i(gkscap5)
iscap6 = i(gkscap6)

ieartap_1L = $ED1L * i(gk_eartap_scale) * 1000
ieartap_2L = $ED2L * i(gk_eartap_scale) * 1000
ieartap_3L = $ED3L * i(gk_eartap_scale) * 1000
ieartap_4L = $ED4L * i(gk_eartap_scale) * 1000
ieartap_5L = $ED5L * i(gk_eartap_scale) * 1000





ieartap_1R = $ED1R * i(gk_eartap_scale) * 1000
ieartap_2R = $ED2R * i(gk_eartap_scale) * 1000
ieartap_3R = $ED3R * i(gk_eartap_scale) * 1000
ieartap_4R = $ED4R * i(gk_eartap_scale) * 1000
ieartap_5R = $ED5R * i(gk_eartap_scale) * 1000


ier_tapgain_1L = $EG1L
ier_tapgain_2L = $EG2L
ier_tapgain_3L = $EG3L
ier_tapgain_4L = $EG4L
ier_tapgain_5L = $EG5L


ier_tapgain_1R = $EG1R
ier_tapgain_2R = $EG2R
ier_tapgain_3R = $EG3R
ier_tapgain_4R = $EG4R
ier_tapgain_5R = $EG5R


iear_lev   = i(gkear_level)
iear_scale = i(gk_eartap_scale)


idef_del_AP1_ER = $DEL_AP1_ER
idef_del_AP2_ER = $DEL_AP2_ER
idef_del_AP3_ER = $DEL_AP3_ER
idef_del_AP4_ER = $DEL_AP4_ER


irev_lev 	= i(gkrev_lev)
idir_lev	= i(gkdir_lev)
ifcut_EQ_ER 	= i(gkeq_ER_F)
idB_EQ_ER 	= i(gkeq_ER_PEAK)

iRT60		= i(gk_T60)
iHF		= i(gkhf)
ipred		= i(gk_predelay)

ifcut_EQ_REV	= i(gkeq_REV_F)
idB_EQ_REV	= i(gkeq_REV_LSH)

ifcut_EQ_REV_HS	= i(gkeq_REV_F_HS)
idB_EQ_REV_HSH  = i(gkeq_REV_HSH)

ix = 0
ieof = 9.999999
tabw_i	iRT60,			ix + 0,	100
tabw_i	iHF,   			ix + 1,	100
tabw_i	ipred, 			ix + 2,	100
tabw_i	irev_lev,		ix + 3,	100
tabw_i	idir_lev,		ix + 4,	100
;-----------------------------------
tabw_i	ibase_del_CMB1,		ix + 5,	100
tabw_i	ibase_del_CMB2,		ix + 6,	100
tabw_i	ibase_del_CMB3,		ix + 7,	100
tabw_i	ibase_del_CMB4,		ix + 8,	100
tabw_i	ibase_del_CMB5,		ix + 9,	100
tabw_i	ibase_del_CMB6,		ix + 10,100
;-----------------------------------
tabw_i	icmb_scale,		ix + 11,100
;-----------------------------------
tabw_i	idel_CMB1_A,		ix + 12,100
tabw_i	idel_CMB2_A,		ix + 13,100
tabw_i	idel_CMB3_A,		ix + 14,100
tabw_i	idel_CMB4_A,		ix + 15,100
tabw_i	idel_CMB5_A,		ix + 16,100
tabw_i	idel_CMB6_A,		ix + 17,100
;-----------------------------------
tabw_i	idelta_CMB1,		ix + 18,100
tabw_i	idelta_CMB2,		ix + 19,100
tabw_i	idelta_CMB3,		ix + 20,100
tabw_i	idelta_CMB4,		ix + 21,100
tabw_i	idelta_CMB5,		ix + 22,100
tabw_i	idelta_CMB6,		ix + 23,100
;-----------------------------------
tabw_i	idel_AP1,		ix + 24,100
tabw_i	idel_AP2,		ix + 25,100
tabw_i	idel_AP3,		ix + 26,100
tabw_i	idel_AP4,		ix + 27,100
tabw_i	idel_AP5,		ix + 28,100
tabw_i	idel_AP6,		ix + 29,100
;-----------------------------------
tabw_i	iap_scale,		ix + 30,100
tabw_i	igain_AP,		ix + 31,100
;-----------------------------------
tabw_i	iscap1	,		ix + 32,100
tabw_i	iscap2	,		ix + 33,100
tabw_i	iscap3	,		ix + 34,100
tabw_i	iscap4	,		ix + 35,100
tabw_i	iscap5	,		ix + 36,100
tabw_i	iscap6	,		ix + 37,100
;-------------------------------------------
tabw_i	iscap1*igain_AP	,	ix + 38,100
tabw_i	iscap2*igain_AP	,	ix + 39,100
tabw_i	iscap3*igain_AP	,	ix + 40,100
tabw_i	iscap4*igain_AP	,	ix + 41,100
tabw_i	iscap5*igain_AP	,	ix + 42,100
tabw_i	iscap6*igain_AP	,	ix + 43,100
;-------------------------------------------
tabw_i	ieartap_1L	,	ix + 44,100
tabw_i	ieartap_2L	,	ix + 45,100
tabw_i	ieartap_3L	,	ix + 46,100
tabw_i	ieartap_4L	,	ix + 47,100
tabw_i	ieartap_5L	,	ix + 48,100
;-------------------------------------------
tabw_i	ieartap_1R	,	ix + 49,100
tabw_i	ieartap_2R	,	ix + 50,100
tabw_i	ieartap_3R	,	ix + 51,100
tabw_i	ieartap_4R	,	ix + 52,100
tabw_i	ieartap_5R	,	ix + 53,100
;-------------------------------------------
tabw_i	ier_tapgain_1L	,	ix + 54,100
tabw_i	ier_tapgain_2L	,	ix + 55,100
tabw_i	ier_tapgain_3L	,	ix + 56,100
tabw_i	ier_tapgain_4L	,	ix + 57,100
tabw_i	ier_tapgain_5L	,	ix + 58,100
;-------------------------------------------
tabw_i	ier_tapgain_1R	,	ix + 59,100
tabw_i	ier_tapgain_2R	,	ix + 60,100
tabw_i	ier_tapgain_3R	,	ix + 61,100
tabw_i	ier_tapgain_4R	,	ix + 62,100
tabw_i	ier_tapgain_5R	,	ix + 63,100
;-------------------------------------------
tabw_i	iear_lev	,	ix + 64,100
tabw_i	iear_scale	,	ix + 65,100
;-------------------------------------------
tabw_i	ifcut_EQ_ER	,	ix + 66,100
tabw_i	idB_EQ_ER	,	ix + 67,100
;-------------------------------------------
tabw_i	ifcut_EQ_REV	,	ix + 68,100
tabw_i	idB_EQ_REV	,	ix + 69,100
;-------------------------------------------
tabw_i	ifcut_EQ_REV_HS	,	ix + 70,100
tabw_i	idB_EQ_REV_HSH	,	ix + 71,100
;-------------------------------------------
tabw_i  ieof		,	ix + 72,100


ftsave $FILECOEF, 1, 100 

turnoff
	
endin



;======================= LOAD COEFS FILE ===================
instr 100

ifn2 ftgen	101, 0, 128, -2, 0



ftload $FILECOEF, 1, 101

	


iRT60			tab_i	0, 101
iHF			tab_i	1, 101
ipred			tab_i	2, 101
irevlev			tab_i	3, 101
idirlev			tab_i	4, 101

FLsetVal 1,iRT60,gih3x8
FLsetVal 1,iHF,gih3x12
FLsetVal 1,ipred,gih3x15
FLsetVal 1,irevlev,gih3x13
FLsetVal 1,idirlev,gih3x14

;Read Default Combs Delay

idef_del_CMB1		tab_i	 5, 101
idef_del_CMB2		tab_i	 6, 101
idef_del_CMB3		tab_i	 7, 101
idef_del_CMB4		tab_i	 8, 101
idef_del_CMB5		tab_i	 9, 101
idef_del_CMB6		tab_i	10, 101


FLsetVal 1,idef_del_CMB1, gih1x1	; Upgrade Combs Delay Slider and value	COMB1
FLsetVal 1,idef_del_CMB2, gih1x2;	;					COMB2
FLsetVal 1,idef_del_CMB3, gih1x3	;					COMB3
FLsetVal 1,idef_del_CMB4, gih1x4	;					COMB4
FLsetVal 1,idef_del_CMB5, gih1x5	;					COMB5
FLsetVal 1,idef_del_CMB6, gih1x6	;					COMB6

;Read Comb Delay Scale Factor

icomb_scale		tab_i	11, 101

FLsetVal 1,icomb_scale, gih3x11		; Upgrade Slider

;Read Comb Delay Effective + 2nd tap difference (letture ridondanti)


;fini gih_coefs_read, 0, idummy, idel_CMB1_A,idel_CMB2_A,idel_CMB3_A,idel_CMB4_A,idel_CMB5_A,idel_CMB6_A
;fini gih_coefs_read, 0, idummy, idelta_CMB1,idelta_CMB2,idelta_CMB3,idelta_CMB4,idelta_CMB5,idelta_CMB6


;Read Actual ALLPASS Delay

idel_AP1		tab_i	24, 101
idel_AP2		tab_i	25, 101
idel_AP3		tab_i	26, 101
idel_AP4		tab_i	27, 101
idel_AP5		tab_i	28, 101
idel_AP6		tab_i	29, 101

;Read ALLPASS Scale and Gain
iap_scale		tab_i	30, 101
igain_AP		tab_i	31, 101




FLsetVal 1,iap_scale, gih3x10
FLsetVal_i igain_AP, gih3x7 

;Read ALLPASS individual scale gain

iscap1			tab_i	32, 101
iscap2			tab_i	33, 101
iscap3			tab_i	34, 101
iscap4			tab_i	35, 101
iscap5			tab_i	36, 101
iscap6			tab_i	37, 101

FLsetVal 1,iscap1,gihscap1
FLsetVal 1,iscap2,gihscap2
FLsetVal 1,iscap3,gihscap3
FLsetVal 1,iscap4,gihscap4
FLsetVal 1,iscap5,gihscap5
FLsetVal 1,iscap6,gihscap6

;Reead ALLPASS Effective individual gain (redundant)
;fini gih_coefs_read, 0, idummy,is1,is2,is3,is4,is5,is6




; Read EARLY REF LEFT (ridondante)
;fini gih_coefs_read, 0, idummy, ieartap_1L,ieartap_2L,ieartap_3L,ieartap_4L, ieartap_5L 
;fini gih_coefs_read, 0, idummy, ieartap_1R,ieartap_2R,ieartap_3R,ieartap_4R, ieartap_5R

;fini gih_coefs_read, 0, idummy, ieargain_1L,ieargain_2L,ieargain_3L,ieargain_4L,ieargain_5L 
;fini gih_coefs_read, 0, idummy, ieargain_1R,ieargain_2R,ieargain_3R,ieargain_4R,ieargain_5R 

; Read EARLY REFL. Level


iear_lev 		tab_i	64, 101
FLsetVal 1,iear_lev, gih3x90

;Read EARLy REFL. delay scale

iear_scale 		tab_i	65, 101
FLsetVal 1, iear_scale, gih3x17

;Read Fcut EQ Early Refl.

iear_fcut_EQ 		tab_i	66, 101
iear_dB_EQ 		tab_i	67, 101

FLsetVal 1, iear_fcut_EQ, gih1x7
FLsetVal 1, iear_dB_EQ, gih1x8


ifcut_EQ_REV		tab_i	68, 101
idB_EQ_REV 		tab_i	69, 101


FLsetVal 1, ifcut_EQ_REV, gih1x9
FLsetVal 1, idB_EQ_REV, gih1x10


ifcut_EQ_REV_HS		tab_i	70, 101
idB_EQ_REV_HSH		tab_i	71, 101


FLsetVal 1, ifcut_EQ_REV_HS, gih1x11
FLsetVal 1, idB_EQ_REV_HSH, gih1x12

ieof_read		tab_i	72,101

if ieof_read !=  9.999999 goto error
turnoff
error:
print ieof_read
turnoff
endin








</CsInstruments>

<CsScore>


f1  0  131072 -1 "Z:/alessandropetrolati On My Mac/Documents/Suoni/aurora.wav"	0 4 0
f2  0  131072 -1 "Z:/alessandropetrolati On My Mac/Documents/Suoni/aurora.wav"	0 4 0
f3  0  131072 -1 "Z:/alessandropetrolati On My Mac/Documents/Suoni/aurora.wav"	0 4 0
f4  0  131072 -1 "Z:/alessandropetrolati On My Mac/Documents/Suoni/aurora.wav"	0 4 0
f5  0  131072 -1 "Z:/alessandropetrolati On My Mac/Documents/Suoni/aurora.wav"	0 4 0
f6  0  131072 -1 "Z:/alessandropetrolati On My Mac/Documents/Suoni/aurora.wav"	0 4 0
f7  0  131072 -1 "Z:/alessandropetrolati On My Mac/Documents/Suoni/aurora.wav"	0 4 0

f0 36000

e
</CsScore>

</CsoundSynthesizer>
