<Cabbage>

form caption("EUMOOG_2017_vst015 - by e.giordani") size(1420, 690), colour(150,150,150), pluginID("m015"), 
image bounds(9, 643, 1405, 42),  colour(160, 100, 30, 255), 
;VERSION 0.15 - 15/04/2017

;!!!!!  UPGRADES!!!!!:
;1) New Triangle and Square waveforms (slight asymmetry introduced to fatten the spectrum and reduce oddity in TRI and SQUARE)
;2) Introduced a macro definition for max VCF  cutoff frequency
;3) Retrimmed the individual peak amplitude of the waveform (see instr 10)
;3) Enhanced  resonance amount to  0.992  (see the knob  ralated range )
;4)  <<<<< VERY IMPORTANT >>>>> :  the multiplication by AmpEnvelope is now <AFTER>  the filter to prevent boom resonance with fast env 
;5) Keyboard tracking completely rewritten using no longer a table but a close up formula (three different coefficients)
;6) Added Auxiliary Phantom Resonance Osc+Noise to VCF (similar to iVCS3) weighted by a high order curve amount driven by VCF_RES
;7) Added port action on gkRES_VCF (see instr 2)

;==========================================
;OSCILLATORS BANK
;==========================================

image bounds(192, 5, 329, 402), colour("black"), plant("GUIabst_14"){

rslider bounds(17, 30, 62, 62), channel("RANGE_OSC_1"), range(0, 5,  2, 1, 1),  colour("Grey"), trackercolour(255, 255, 255, 255),
rslider bounds(17, 151, 62, 62),channel("RANGE_OSC_2"), range(0, 5,  2, 1, 1),  colour("Grey"), trackercolour(255, 255, 255, 255),
rslider bounds(17, 270, 62, 62),channel("RANGE_OSC_3"), range(0, 5,  2, 1, 1),  colour("Grey"), trackercolour(255, 255, 255, 255),

;button bounds(22, 340, 48, 12),channel("MONO_OSC_3_SW"),text("MONO","MONO"),colour:0(20,70,40), colour:1("Aquamarine"), fontcolour:0("grey"),fontcolour:1("maroon")

gentable bounds(233, 90, 8, 8), tablenumber(2001), zoom(-1), amprange(2000,-1,1),
gentable bounds(218, 56, 8, 8), tablenumber(2002), zoom(-1), amprange(2000,-1,1),
gentable bounds(233, 25, 8, 8), tablenumber(2003), zoom(-1), amprange(2000,-1,1),
gentable bounds(274, 25, 12, 8), tablenumber(2004), zoom(-1), amprange(2000,-1,1),
gentable bounds(294, 56, 12, 8), tablenumber(2005), zoom(-1), amprange(2000,-1,1),
gentable bounds(276, 90, 12, 8), tablenumber(2006), zoom(-1), amprange(2000,-1,1),

gentable bounds(233, 210, 8, 8), tablenumber(2001), zoom(-1), amprange(2000,-1,1),
gentable bounds(218, 176, 8, 8), tablenumber(2002), zoom(-1), amprange(2000,-1,1),
gentable bounds(233, 145, 8, 8), tablenumber(2003), zoom(-1), amprange(2000,-1,1),
gentable bounds(274, 145, 12, 8), tablenumber(2004), zoom(-1), amprange(2000,-1,1),
gentable bounds(294, 176, 12, 8), tablenumber(2005), zoom(-1), amprange(2000,-1,1),
gentable bounds(276, 210, 12, 8), tablenumber(2006), zoom(-1), amprange(2000,-1,1),

gentable bounds(233, 330, 8, 8), tablenumber(2001), zoom(-1), amprange(2000,-1,1),
gentable bounds(218, 296, 8, 8), tablenumber(2007), zoom(-1), amprange(2000,-1,1),
gentable bounds(233, 265, 8, 8), tablenumber(2003), zoom(-1), amprange(2000,-1,1),
gentable bounds(274, 265, 12, 8), tablenumber(2004), zoom(-1), amprange(2000,-1,1),
gentable bounds(294, 296, 12, 8), tablenumber(2005), zoom(-1), amprange(2000,-1,1),
gentable bounds(276, 330, 12, 8), tablenumber(2006), zoom(-1), amprange(2000,-1,1),


label bounds(10, 87, 16, 12), text("LO"),fontstyle("style"),colour("black"), 
label bounds(0, 57, 16, 12), text("32'"),fontstyle("style"),colour("black"),  
label bounds(12, 27, 16, 12), text("16'"),fontstyle("style"),colour("black"),
label bounds(65, 27, 16, 12), text("8'"),fontstyle("style"),colour("black"),
label bounds(77, 57, 16, 12), text("4'"),fontstyle("style"),colour("black"),
label bounds(61, 87, 16, 12), text("2'"),fontstyle("style"),colour("black"),
label bounds(220, 1, 88, 12), text("WAVEFORM"),fontstyle("style"),
label bounds(4, 0, 88, 12), text("RANGE"),fontstyle("style"),
label bounds(115, 16, 88, 12), text("FREQUENCY"),fontstyle("style"), 
label bounds(11, 203, 16, 12), text("LO"),fontstyle("style"),colour("black"), 
label bounds(1, 173, 16, 12), text("32'"),fontstyle("style"),colour("black"),  
label bounds(13, 143, 16, 12), text("16'"),fontstyle("style"),colour("black"),
label bounds(65, 143, 16, 12), text("8'"),fontstyle("style"),colour("black"),
label bounds(78, 173, 16, 12), text("4'"),fontstyle("style"),colour("black"),
label bounds(62, 203, 16, 12), text("2'"),fontstyle("style"),colour("black"),
label bounds(10, 326, 16, 12), text("LO"),fontstyle("style"),colour("black"), 
label bounds(0, 296, 16, 12), text("32'"),fontstyle("style"),colour("black"),  
label bounds(12, 266, 16, 12), text("16'"),fontstyle("style"),colour("black"),
label bounds(65, 266, 16, 12), text("8'"),fontstyle("style"),colour("black"),
label bounds(77, 296, 16, 12), text("4'"),fontstyle("style"),colour("black"),
label bounds(61, 326, 16, 12), text("2'"),fontstyle("style"),colour("black"),

label bounds(101, 0, 116, 14), text("OSCILLATOR - 1"), fontstyle(0),
label bounds(103, 116, 116, 14), text("OSCILLATOR - 2"), fontstyle(0),
label bounds(102, 240, 116, 14), text("OSCILLATOR - 3"), fontstyle(0),
label bounds(28, 370, 253, 22), text("OSCILLATOR  BANK"), fontstyle(0),

rslider bounds(118, 138, 80, 80), channel("F2"), range(-1, 1,  0,1,0.01),  colour("Grey"), trackercolour(255, 255, 255, 255), 
rslider bounds(117, 263, 80, 80), channel("F3"), range(-1, 1,  0,1,0.01),  colour("Grey"), trackercolour(255, 255, 255, 255), 
button bounds(128, 56, 64, 20), channel("COARSE_FINE"), text("COARSE","FINE"), colour:0(20,70,40), colour:1("Aquamarine"),fontcolour:0("grey"),fontcolour:1("maroon") 
checkbox bounds(148, 35, 12, 12), channel("COARSE_FINE"), shape("circle"), colour:1("red"),

rslider bounds(229, 30, 62, 62), channel("Wave"), range(0, 5,  2, 1, 1),  colour("Grey"), trackercolour(255, 255, 255, 255),
rslider bounds(227, 150, 62, 62), channel("Wave2"), range(0, 5,  2, 1, 1),  colour("Grey"), trackercolour(255, 255, 255, 255),
rslider bounds(228, 270, 62, 62), channel("Wave3"), range(0, 5,  2, 1, 1),  colour("Grey"), trackercolour(255, 255, 255, 255),


label bounds(120, 207, 16, 12), text("-7"), fontstyle(0),  colour(0, 0, 0, 255), 
label bounds(179, 208, 16, 12), text(" 7"), fontstyle(0),  colour(0, 0, 0, 255),
label bounds(179, 331, 16, 12), text(" 7"), fontstyle(0),  colour(0, 0, 0, 255),
label bounds(120, 329, 16, 12), text(" -7"), fontstyle(0),  colour(0, 0, 0, 255),
label bounds(150, 129, 16, 12), text("|"), fontstyle(0),  colour(0, 0, 0, 255), 
label bounds(149, 253, 16, 12), text("|"), fontstyle(0),  colour(0, 0, 0, 255), 
}
;=====================================
;MIXER SECTION
;=====================================

image bounds(523, 5, 330, 402), colour("BLACK"), plant("MIXER_PLANT"){


label bounds(-4, 14, 94, 12), text("VOLUME"),fontstyle(0),fontstyle(0),  
label bounds(32, 372, 253, 22), text("MIXER"), fontstyle("10"),

label bounds(212, 48, 89, 13), text("EXTERNAL"),fontstyle(0), 
label bounds(200, 64, 113, 12), text("INPUT VOLUME"), fontstyle(0), 
label bounds(212, 190, 89, 13), text("NOISE VOLUME"),fontstyle(0),


checkbox bounds(72, 60, 48, 3), channel("SWMIX"), value(1), colour:1("red"), colour:0("dimgrey"),
checkbox bounds(72, 178, 48, 3), channel("SWMIX2"), colour:1("red"), colour:0("dimgrey")
checkbox bounds(72, 308, 48, 3), channel("SWMIX3"), colour:1("red"), colour:0("dimgrey")

checkbox bounds(172, 118, 52, 3), channel("INPUT_SW"), colour:1("red"), colour:0("dimgrey")
checkbox bounds(172, 246, 52, 3), channel("SWNOISE_ON"), colour:1("red"), colour:0("dimgrey")


rslider bounds(10, 30, 62, 62), channel("VOL_OSC_1"), range(0, 1, 0.5, 0.7, 0.01), colour("Grey"), trackercolour(255, 255, 255, 255),
rslider bounds(10, 150, 62, 62), channel("VOL_OSC_2"), range(0, 1,0.5 , 0.7, 0.01),  colour("Grey"), trackercolour(255, 255, 255, 255), 
rslider bounds(10, 270, 62, 62), channel("VOL_OSC_3"), range(0, 1,0.5 , 0.7, 0.01),  colour("Grey"), trackercolour(255, 255, 255, 255), 
rslider bounds(222, 86, 62, 62), channel("INVOL"), range(0, 1,0.0, 0.7, 0.01),  colour("Grey"), trackercolour(255, 255, 255, 255), 
rslider bounds(222, 216, 62, 62), channel("NOISE_VOL"), range(0, 1,0.5 , 0.7, 0.01),  colour("Grey"), trackercolour(255, 255, 255, 255),


button bounds(118, 52, 58, 18),  value(1), channel("SWMIX"), text(""), colour:0(84,126,178), colour:1(90,200,255),
button bounds(118, 170, 58, 18), channel("SWMIX2"), text(""), colour:0(84,126,178), colour:1(90,200,255),
button bounds(118, 300, 58, 18), channel("SWMIX3"), text(""), colour:0(84,126,178), colour:1(90,200,255),
button bounds(118, 238, 58, 18), channel("SWNOISE_ON"), text(""), colour:0(84,126,178), colour:1(90,200,255),
button bounds(118, 110, 58, 18), channel("INPUT_SW"), text(""), colour:0(84,126,178), colour:1(90,200,255),

rslider bounds(200, 300, 43, 43), channel("NOISE_ATK"), range(0.001,1,0.1,1,0.01),trackercolour("white"),colour("gold"),text("A")
rslider bounds(240, 300, 43, 43), channel("NOISE_DCY"), range(0.005,1,0.1,1,0.01),trackercolour("white"),colour("gold"),text("D")
rslider bounds(280, 300, 43, 43), channel("NOISE_SUS"), range(0,1,0.5,1,0.01),trackercolour("white"),colour("gold"),text("S")
label bounds(214, 285, 102, 12), text("--NOISE Envelope--"),fontstyle(0)
button bounds(238, 354, 54, 16),colour:0(84,126,178), colour:0("grey"),colour:1("aquamarine"),text("ON/OFF"),channel("NOISE_ENV_SW"),



label bounds(84, 72, 89, 13), text("ON"),fontstyle(0),
label bounds(118, 130, 89, 13), text("OUT ON"),fontstyle(0),
label bounds(84, 190, 89, 13), text("ON"),fontstyle(0),
label bounds(128, 260, 89, 13), text("ON"),fontstyle(0),
label bounds(84, 320, 89, 13), text("ON"),fontstyle(0),
}

;=====================================
;FILTER SECTION
;=====================================

image bounds(855, 5, 337, 222), colour("Black"), plant("GUIabst_73"){

label bounds(114, 0, 89, 17), text("FILTER"), fontstyle(0),
label bounds(-20, 12, 89, 12), text("CUTOFF"),fontstyle(0),
label bounds(38, 12, 89, 12), text("FREQUENCY"),fontstyle(0),
label bounds(114, 14, 89, 12), text("EMPHASIS"),fontstyle(0),
label bounds(218, 4, 120, 12), text("AMOUNT"),fontstyle(0),
label bounds(218, 14, 120, 12), text("OF CONTOUR"),fontstyle(0),
label bounds(118, 124, 89, 12), text("DECAY TIME"),fontstyle(0),
label bounds(18, 124, 89, 12), text("ATTACK TIME"),fontstyle(0),
label bounds(238, 124, 89, 12), text("SUSTAIN LEVEL"),fontstyle(0),


rslider bounds(23, 30, 62, 62), channel("FBASE_VCF"), range(0.0, 1.0,0.5,1,0.0001),  colour("Grey"), trackercolour(255, 255, 255, 255), 
rslider bounds(134, 30, 62, 62), channel("RES_VCF"), range(0, 0.992,  0.5),  colour("Grey"), trackercolour(255, 255, 255, 255), 
rslider bounds(246, 30, 62, 62), channel("AMOUNT_VCF"), range(0, 1,  0.5,1,0.01),  colour("Grey"), trackercolour(255, 255, 255, 255),
rslider bounds(23, 146, 62, 62), channel("FiltAttTim"), range(0.001, 4,  0.5,0.5,0.0001),  colour("Grey"), trackercolour(255, 255, 255, 255), 
rslider bounds(134, 146, 62, 62), channel("FiltRelTim"), range(0.005, 4, 0.5,0.5,0.0001),  colour("Grey"), trackercolour(255, 255, 255, 255), 
rslider bounds(246, 146, 62, 62), channel("FiltLev"), range(0, 1,  0.51),  colour("Grey"), trackercolour(255, 255, 255, 255), 
}


;===================================
;LOUDNESS SECTION
;===================================


image bounds(855, 229, 337, 178), colour("black"), plant("GUIabst_77"){


label bounds(84, 0, 166, 17), text("LOUDNESS CONTOUR"),
label bounds(118, 26, 89, 12), text("DECAY TIME"),fontstyle(0),
label bounds(12, 26, 89, 12), text("ATTACK TIME"),fontstyle(0),
label bounds(236, 26, 89, 12), text("SUSTAIN LEVEL"),fontstyle(0),
label bounds(40, 148, 253, 22), text("MODIFIERS"), fontstyle(0), 


rslider bounds(22, 50, 62, 62), channel("AmpAttTim"), range(0.001, 4,  0.5,0.5,0.0001),  colour("Grey"), trackercolour(255, 255, 255, 255), 
rslider bounds(134, 50, 62, 62), channel("AmpRelTim"), range(0.001, 4,  0.5,0.5,0.0001),  colour("Grey"), trackercolour(255, 255, 255, 255), 
rslider bounds(244, 50, 62, 62), channel("AmpLev"), range(0, 1,0.9,1,0.01),  colour("Grey"), trackercolour(255, 255, 255, 255), 
}


;Three red switches (MIXER -> FILTER)
button bounds(829, 58, 50, 18), channel("FILT_MOD_SW"), text(""),colour:0("IndianRed"), colour:1("Red"),
label bounds(813, 44, 80, 12), text("FILT  MOD"),fontstyle(2)
button bounds(829, 116, 50, 18), channel("KEYTRK_SW1"), text(""), colour:0("IndianRed"), colour:1("Red"),
label bounds(810, 141, 80, 12), text("KEYBOARD"),fontstyle(2)
label bounds(810, 153, 80, 12), text("CONTROL"),fontstyle(2)
button bounds(829, 172, 50, 18), channel("KEYTRK_SW2"), text(""), colour:0("IndianRed"), colour:1("Red"),

;White Noise/ Pink Noise Selector (button and label)
button bounds(848, 224, 54, 21), channel("SW_NOISE"), text(""),colour:0(74,120,178), colour:1(90,200,255),rotate(1.57,0,0)
label bounds(825, 279, 25, 13), text("W/P"), fontstyle(0),




;=============
;CONTROLLERS
;============= 

image bounds(9, 4, 181, 402), colour("Black"), plant("GUIabst_83"){

label bounds(0, 370, 180, 22), text("CONTROLLERS"), fontstyle(0),

label bounds(16, 0, 26, 15), text(""), ;Serves to put left/right plant extension
label bounds(80, 392, 26, 15), text(""),; "
label bounds(156, 45, 26, 13), text(""), ;"

label bounds(20, 178, 40, 13), text("GLIDE"),
label bounds(57, 177, 148, 13), text("MODULATION"),
label bounds(55, 187, 148, 13), text("MIX"),

label bounds(60, 262, 148, 11), text("OSC3       NOISE"),

label bounds(74, 58, 40, 13), text("TUNE"),



rslider bounds(65, 85, 62, 62), channel("MTUNE"), range(-2, 2, 0.0),colour("Grey"), trackercolour(255, 255, 255, 255),
rslider bounds(14, 205, 62, 62), channel("porttime"), range(0, 2000, 3,0.4,0.01),colour("Grey"), trackercolour(255, 255, 255, 255),
rslider bounds(102, 206, 62, 62), channel("MOD_MIX"), range(0, 1, 0),colour("Grey"), trackercolour(255, 255, 255, 255),


}


button bounds(168, 119, 50, 18), channel("OSC_MOD_SW"), text(""), colour:0("IndianRed"), colour:1("red") ;Not yet used
label bounds(157, 106, 70, 12), text("OSC  MOD"),
label bounds(156, 360, 70, 12), text("OSC3  CTRL"),
button bounds(198, 312, 50, 18), channel("OSC3_CTRL"), text(""), colour:0("IndianRed"), colour:1("red"),rotate(1.57,0,0);NYU
button bounds(28, 289, 50, 18), channel("GLIDE_ON"), text(""), colour:0(120,120,120), colour:1("white") ;Glide On/Off Switch
label bounds(17, 309, 70, 12), text("GLIDE  ON"),
button bounds(114, 289, 50, 18), channel("DECAY_ON"), text(""), colour:0(120,120,120), colour:1("white") ;Glide On/Off Switch
label bounds(103, 309, 70, 12), text("DECAY  ON"),
button bounds(80, 148, 50, 18), channel("RESET_PITCH"), text("Reset"), colour:0("green"), colour:1("green")


;====== KEYBOARD ==============
keyboard bounds(533, 540, 308, 75)



;======= 
;REVERB
;======

image bounds(9, 412, 180, 112), colour("darkcyan") plant("GUIabst_99"){

button bounds(56, 89, 54, 14), channel("REVSW"), text("REVERB", "REVERB"), colour:0("black"), colour:1("Aquamarine"),fontcolour("white"),  
label bounds(66, 104, 46, 11), text("")
rslider bounds(23, 29, 42, 42), channel("REVSEND"), colour("black"),range(0, 1, 0.7), trackercolour("Orange")
rslider bounds(74, 29, 42, 42), channel("ROOM"), colour("black"),range(0, 0.9, 0.8), trackercolour("Orange")
rslider bounds(124, 29, 42, 42), channel("DAMP"), colour("black"),range(0, 1, 0.9), trackercolour("Orange")


label bounds(3, 20, 82, 8), text("MIX"),fontcolour("white"), fontstyle(0),
label bounds(53, 20, 82, 8), text("DECAY"),fontcolour("white"), fontstyle(0),
label bounds(103, 20, 82, 8), text("DAMP"),fontcolour("white"), fontstyle(0),

label bounds(0, 69, 82, 8), text("DRY     WET"),fontcolour("white"), fontstyle(0),
label bounds(50, 69, 82, 8), text("SHORT    LONG"),fontcolour("white"), fontstyle(0),
label bounds(100, 69, 82, 8), text("LO      HI"),fontcolour("white"), fontstyle(0),
button bounds(125, 89, 30, 14), channel("REVSW_TYPE"), text("Old", "New"), colour:0("darkcyan"), colour:1("indianred")
label bounds(70, 0, 46, 16), text("")
}

;========= 
;   XLFO
;=========


image bounds(192, 412, 328, 112), colour("darkcyan"), plant("GUIabst_101"){

gentable bounds(273, 78, 50, 30), tablenumber(2010), zoom(-1), amprange(2010,-1,1),identchannel("Waveform_LFO_ID")
label bounds(52, 68, 95, 8), text("SLOW   FAST"),fontcolour("white"), fontstyle(0),
label bounds(106, 68, 95, 8), text("SHORT   LONG"),fontcolour("white"), fontstyle(0),
label bounds(167, 68, 95, 8), text("FAST    SLOW"),fontcolour("white"), fontstyle(0),
label bounds(0, 68, 95, 8), text("MIN     MAX"),fontcolour("white"), fontstyle(0),

label bounds(-1, 18, 95, 8), text("DEPTH"),fontcolour("white"), fontstyle(0),
label bounds(49, 18, 95, 8), text("RATE"),fontcolour("white"), fontstyle(0),
label bounds(105, 18, 95, 8), text("DELAY"),fontcolour("white"), fontstyle(0),
label bounds(163, 18, 95, 8), text("ATCK"),fontcolour("white"), fontstyle(0),

rslider bounds(24, 29, 42, 42), channel("LFO_AMP"), colour("black"),range(0, 0.24, 0.03, 0.8,0.001), trackercolour("Orange")
rslider bounds(78, 29, 42, 42), channel("LFO_FRQ"), colour("black"),range(0, 7, 4,1,0.1), trackercolour("Orange")
rslider bounds(133, 29, 42, 42), channel("LFO_DLY"), colour("black"),range(0, 4, 0.5), trackercolour("Orange")
rslider bounds(192, 29, 42, 42), channel("LFO_ATK"), colour("black"),range(0, 4, 0.5), trackercolour("Orange")
combobox bounds(273, 52, 51, 16), channel("LFO_WAVE"), items("SIN", "SQR", "TRI","RMP+","RMP-","HSUM","ARP","S/H"),

checkbox bounds(245, 26, 21, 12),channel("LFO1"),
checkbox bounds(245, 54, 21, 12), channel("LFO2"),
checkbox bounds(245, 80, 21, 12), channel("LFO3"),
label bounds(265, 68, 67, 8), text("WAVEFORM"),fontcolour("white"), fontstyle(0),

checkbox bounds(288, 26, 21, 12),channel("FVIB_FC"),colour("cyan")


checkbox bounds(1, 44, 21, 12), channel("EXT"),
label bounds(-21, 60, 67, 8), text("EXT"),fontcolour("white"), fontstyle(0),

label bounds(221, 40, 67, 8), text("OSC1"),fontcolour("white"), fontstyle(0),
label bounds(221, 68, 67, 8), text("OSC2"),fontcolour("white"), fontstyle(0),
label bounds(221, 94, 67, 8), text("OSC3"),fontcolour("white"), fontstyle(0),

label bounds(264, 40, 67, 8), text("VCF_FC"),fontcolour("white"), fontstyle(0),


checkbox bounds(251, 10, 7, 8), channel("LFO_LED"),colour("red"),shape("circle")

button bounds(90, 90, 54, 14), channel("LFO_SW"), text("XLFO", "XLFO"), colour:0("black"), colour:1("Aquamarine"),fontcolour("white"),


label bounds(102, 0, 62, 18), text("")
label bounds(272, 42, 52, 12), text("")
label bounds(165, 93, 52, 18), text("")
}
;=======================================
;======= GEN17 Arp Builder =============
;=======================================
 
image bounds(854, 412, 337, 228), colour("darkcyan"), plant("GUIabst_116"){
gentable bounds(22, 5, 258, 97), identchannel("table1"), tablenumber(5), tablecolour("yellow"), amprange(0,72,5,3), zoom(-1) 
rslider bounds(56, 107, 30, 30), channel("loc1"), colour("black"),range(1, 512, 64,1,1), trackercolour("white")
rslider bounds(90, 107, 30, 30), channel("loc2"), colour("black"),range(1, 512, 64,1,1), trackercolour("white")
rslider bounds(122, 107, 30, 30), channel("loc3"), colour("black"),range(1, 512, 64,1,1), trackercolour("white")
rslider bounds(152, 107, 30, 30), channel("loc4"), colour("black"),range(1, 512, 64,1,1), trackercolour("white")
rslider bounds(183, 107, 30, 30), channel("loc5"), colour("black"),range(1, 512, 64,1,1), trackercolour("white")
rslider bounds(214, 107, 30, 30), channel("loc6"), colour("black"),range(1, 512, 64,1,1), trackercolour("white")
rslider bounds(248, 107, 30, 30), channel("loc7"), colour("black"),range(1, 512, 64,1,1), trackercolour("white")

rslider bounds(26, 145, 30, 30), channel("val0"), colour("black"),range(0, 72, 6,1,6), trackercolour("white")
rslider bounds(57, 145, 30, 30), channel("val1"), colour("black"),range(0, 72, 6,1,6), trackercolour("white")
rslider bounds(88, 145, 30, 30), channel("val2"), colour("black"),range(0, 72, 6,1,6), trackercolour("white")
rslider bounds(122, 145, 30, 30), channel("val3"), colour("black"),range(0, 72, 6,1,6), trackercolour("white")
rslider bounds(154, 145, 30, 30),channel("val4"), colour("black"),range(0, 72, 6,1,6), trackercolour("white")
rslider bounds(183, 145, 30, 30),channel("val5"), colour("black"),range(0, 72, 6,1,6), trackercolour("white")
rslider bounds(215, 145, 30, 30),channel("val6"), colour("black"),range(0, 72, 6,1,6), trackercolour("white")
rslider bounds(246, 145, 30, 30),channel("val7"), colour("black"),range(0, 72, 6,1,6), trackercolour("white")

label bounds(71, 190, 49, 14), text(""), fontstyle("0"),  fontcolour(255, 255, 255, 255), 
label bounds(278, 125, 49, 14), text("Time"), fontstyle("0"),  fontcolour(255, 255, 255, 255), 
label bounds(280, 157, 49, 14), text("Lev", ""), fontstyle(0),  fontcolour(255, 255, 255, 255), 
label bounds(120, 183, 97, 14), text("Arp Controls", ""), fontstyle(0),  fontcolour(255, 255, 255, 255), 
label bounds(0, 0, 49, 14), text(""), fontstyle("0"),  fontcolour(255, 255, 255, 255), 
}

 

image bounds(1194, 5, 219, 402),  colour(0, 0, 0, 255), 
rslider bounds(1217, 37, 62, 62), channel("MAIN_VOLUME"), range(0, 1,  0.5, 0.5, 0.001),  colour("grey"), trackercolour(255, 255, 255, 255),
label bounds(1223, 19, 49, 14), text("VOLUME"), fontstyle("0"),  fontcolour("lightgrey"),
label bounds(1294, 19, 90, 14), text("MAIN OUTPUT"), fontstyle("0"),  fontcolour("lightgrey"),

label bounds(1251, 378, 104, 21), text("OUTPUT"), fontstyle(0), 
button bounds(1309, 60, 65, 21), channel("VOL_ON"), text("MUTED", "ON"), colour:0(20,70,40), colour:1("Aquamarine"),fontcolour:0("red"),fontcolour:1("maroon")
label bounds(1333, 85, 49, 14), text("ON"), fontstyle("0"),  fontcolour("lightgrey"),

label bounds(1234, 321, 133, 23), text("euMOOD"), fontstyle("0"),  fontcolour("teal"),
button bounds(1214, 168, 65, 21), channel("TUNER"), text("A-440", "A-440"), colour:0("grey"), colour:1("Aquamarine"),fontcolour("white"),

gentable   bounds(1210, 225, 190, 94),tablenumber(501), tablecolour("teal"), identchannel("ampFFT"), fill(0),amprange(0,1,-1), outlinethickness(2), samplerange(0, 512) 
rslider bounds(1358, 228, 40, 40), channel("gain"), text("Gain"),range(1,99.00,10,0.5,0.01),  colour("gold"), 

;================================
;========== RModulator===========
;================================

image bounds(523, 412, 328, 112), colour("darkcyan")
gentable bounds(652, 457, 50, 30), tablenumber(2010), zoom(-1), amprange(2010,-1,1),identchannel("Waveform_RM_ID")
button bounds(649, 499, 54, 14), channel("RMSW"), text("RM", "RM"), colour:0("black"), colour:1("Aquamarine"),
rslider bounds(538, 439, 42, 42), channel("MODF"), colour("black"),range(1, 500, 10, 0.2,0.01), trackercolour("Orange")
rslider bounds(598, 439, 42, 42), channel("MODX"), colour("black"),range(0, 1, 0.5, 1,0.01), trackercolour("Orange")
combobox bounds(652, 439, 51, 16), channel("MODW"), items("SIN", "SQR", "TRI","RAMP"),

label bounds(544, 429, 26, 8), text("FREQ"),fontcolour("white"), fontstyle(0),
label bounds(604, 429, 26, 8), text("MIX"),fontcolour("white"), fontstyle(0),
label bounds(664, 429, 26, 8), text("WAVE"),fontcolour("white"), fontstyle(0),


rslider bounds(730, 439, 43, 43), channel("RM_ATK"), range(0.005,1,0.1,1,0.01),trackercolour("white"),colour("gold"),text("A"),textcolour("white")
rslider bounds(766, 439, 43, 43), channel("RM_DCY"), range(0.005,1,0.1,1,0.01),trackercolour("white"),colour("gold"),text("D"),textcolour("white")
rslider bounds(802, 439, 43, 43), channel("RM_SUS"), range(0.005,1,0.1,1,0.01),trackercolour("white"),colour("gold"),text("S"),textcolour("white")

button bounds(763, 497, 54, 16),colour:0(120,180,255), colour:0("grey"),colour:1("aquamarine"),text("ON/OFF"),channel("RM_ENV_SW"),
label bounds(742, 421, 100, 12), text("--RM Envelope--"),fontstyle(0),fontcolour("white")



;=============================
;======= STEREO DELAY ========
;=============================
image bounds(192, 526, 328, 114), colour("darkcyan")


button bounds(320, 615, 54, 14),colour:0(120,180,255), colour:0("black"),colour:1("aquamarine"),text("DELAY"),channel("DELAY_SW"),

rslider bounds(218, 549, 42, 42), channel("del_time"),colour("black"),range(0.001, 10, 0.4,0.5), trackercolour("orange")
rslider bounds(273, 549, 42, 42), channel("del_cut"),colour("black"),range(20, 20000, 20000,0.5), trackercolour("orange")
rslider bounds(327, 549, 42, 42), channel("del_feed"),colour("black"),range(0, 1.0,0.5), trackercolour("orange")
rslider bounds(383, 549, 42, 42), channel("del_mix"),colour("black"),range(0, 1.0,0.5), trackercolour("orange")
rslider bounds(441, 549, 42, 42), channel("del_lev"),colour("black"),range(0, 1.0,0.7), trackercolour("orange")

label bounds(192, 537, 95, 8), text("TIME"),fontcolour("white"), fontstyle(0),
label bounds(246, 537, 95, 8), text("CUTOFF"),fontcolour("white"), fontstyle(0),
label bounds(298, 537, 95, 8), text("FEED"),fontcolour("white"), fontstyle(0),
label bounds(353, 537, 95, 8), text("MIX"),fontcolour("white"), fontstyle(0),
label bounds(414, 537, 95, 8), text("LEV"),fontcolour("white"), fontstyle(0),

;DISPLAYS (extra add)
checkbox bounds(95, 44, 12, 12),shape("circle"),channel("MTUNE_LED"), 
numberbox bounds(882, 103, 50, 12), channel("dispVCF_CUT"), range(0, 20000, , 1, 0.1), 


;============================
;=== KEY VELOCITY MANAGER ===
;============================

image bounds(9, 526, 180, 114), colour("darkcyan")
button bounds(64, 618, 54, 13),colour:0(120,180,255), colour:0("black"),colour:1("aquamarine"),text("KEYVEL"),channel("VEL_SW"),
checkbox bounds(21, 536, 21, 12),channel("VEL_TO_OSC1")
checkbox bounds(21, 566, 21, 12),channel("VEL_TO_OSC2")
checkbox bounds(21, 596, 21, 12),channel("VEL_TO_OSC3")
checkbox bounds(61, 536, 21, 12),channel("VEL_TO_VCF"),colour("cyan")
checkbox bounds(61, 566, 21, 12),channel("VEL_TO_NOISE"),colour("orange")

label bounds(10, 550, 36, 9),text("->OSC1"),fontcolour("white"),fontstyle(0)
label bounds(10, 580, 36, 9),text("->OSC2"),fontcolour("white"),fontstyle(0)
label bounds(10, 610, 36, 9),text("->OSC3"),fontcolour("white"),fontstyle(0)
label bounds(50, 550, 36, 9),text("->VCF"),fontcolour("white"),fontstyle(0)
label bounds(50, 580, 36, 9),text("->NOISE"),fontcolour("white"),fontstyle(0)

combobox bounds(130, 534, 50, 16), channel("VEL_CURVE_TYPE"), items("LIN","HARD","SOFT"),
gentable bounds(130, 551, 50, 45), tablenumber(1500), zoom(-1), amprange(1500,-1,1),identchannel("Waveform_MIDIVEL_ID")
label bounds(124, 597, 60, 10),text("VEL. CURVE"),fontcolour("white"),fontstyle(0)

;===================
;===   FM     ======
;=================== 
image bounds(1193, 412, 220, 228), colour("darkcyan")
button bounds(1285, 617, 54, 14), channel("FMSW"), text("FM", "FM"), colour:0("black"), colour:1("Aquamarine"),

rslider bounds(1204, 436, 42, 42), channel("FM_MOD_FIX"), colour("black"),range(1, 1000, 10, 0.2,0.01), trackercolour("Orange")
rslider bounds(1254, 436, 42, 42), channel("FM_MOD_RATIO"), colour("black"),range(0.1, 16, 1, 1,0.1), trackercolour("Orange")
rslider bounds(1304, 436, 42, 42), channel("FM_INDEX"), colour("black"),range(0, 10, 1, 1,0.1), trackercolour("Orange")
rslider bounds(1354, 436, 42, 42), channel("FM_VOL"), colour("black"),range(0, 1, 0.5, 0.5,0.01), trackercolour("Orange")

label bounds(1206, 426, 36, 9),text("FIXED"),fontcolour("white"),fontstyle(0)
label bounds(1256, 426, 36, 9),text("RATIO"),fontcolour("white"),fontstyle(0)
label bounds(1306, 426, 36, 9),text("INDEX"),fontcolour("white"),fontstyle(0)
label bounds(1359, 426, 36, 9),text("FM_VOL"),fontcolour("white"),fontstyle(0)
hslider bounds(1229, 478, 36, 10),channel("FM_MODE"),range(0, 1, 1, 1,1)

label bounds(1220, 486, 140, 12),text("____  AMP   Contour ____"),fontcolour("white"),fontstyle(0)
rslider bounds(1210, 496, 43, 43), channel("FM_ATK"), range(0.005,1,0.1,1,0.01),trackercolour("white"),colour("gold"),text("A"),textcolour("white")
rslider bounds(1270, 496, 43, 43), channel("FM_DCY"), range(0.005,1,0.1,1,0.01),trackercolour("white"),colour("gold"),text("D"),textcolour("white")
rslider bounds(1330, 496, 43, 43), channel("FM_SUS"), range(0.000,1,0.1,1,0.01),trackercolour("white"),colour("gold"),text("S"),textcolour("white")

label bounds(1220, 540, 150, 12),text("____  INDX Contour ____"),fontcolour("white"),fontstyle(0)
rslider bounds(1210, 552, 43, 43), channel("FM_ATK_INDEX"), range(0.005,1,0.1,1,0.01),trackercolour("white"),colour("gold"),text("A"),textcolour("white")
rslider bounds(1270, 552, 43, 43), channel("FM_DCY_INDEX"), range(0.005,1,0.1,1,0.01),trackercolour("white"),colour("gold"),text("D"),textcolour("white")
rslider bounds(1330, 552, 43, 43), channel("FM_SUS_INDEX"), range(0.000,1,0.1,1,0.01),trackercolour("white"),colour("gold"),text("S"),textcolour("white")

checkbox bounds(1381, 505, 21, 12),channel("VEL_TO_FMAMP")
checkbox bounds(1381, 561, 21, 12),channel("VEL_TO_FMINDEX")
label bounds(1360, 536, 64, 10),text("KEY VEL"),fontcolour("white"),fontstyle(0)
label bounds(1360, 522, 64, 14),text("|"),fontcolour("white"),fontstyle(0)
label bounds(1360, 542, 64, 14),text("|"),fontcolour("white"),fontstyle(0)
;===============================================================================
;===============================================================================

</Cabbage>

;button bounds(554, 651, 79, 27), channel("SAVE"),text("SAVE")

;====== CSOUND CODE ==================
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d --midi-velocity-amp=5
</CsOptions>

<CsInstruments>
;==========================
sr			= 	44100
ksmps		= 	64
nchnls		= 	2
0dbfs		=	1	;Max Amp  (Any BIT DEPTH)

#define MAX_FREQ #20000#
#define MULT_TRK1 #1.019440643702146#  ; 2^(1/36) : key track coefficient for SW1 On / SW2 Off  (1 octave/36 half-steps)
#define MULT_TRK2 #1.037155044446193#  ; 2^(1/19) : key track coefficient for SW2 Off / SW2 On  (1 octave/19 half-steps)
#define MULT_TRK12 #1.059463094359293# ; 2^(1/12) : key track coefficient for SW2 On / SW2 On   (1 octave/12 half-steps)

;====== UDO OPCODE =======
;Pink Noise Generator

opcode PINK_NOISE, a, i
irange xin
	awhite unirand irange		; Pink Noise generator
	awhite = awhite - 1.0  		; Normalize 
    a1  pinkish awhite, 1, 0, 0, 1
xout a1                 		; write output

        endop
        
;=========================                       
opcode AMP_ON, k,iiiii  		;Envelope (Attack / Decay  to Sustain -  No Release )
ia,irise,itype,idec, isus xin
setksmps 1

kAmpEnv	transeg	ia,irise,itype,1,idec,itype,isus

xout kAmpEnv
endop   

;==========================
opcode AMP_OFF, k,iiii  		;Envelope (Release only)
ia,irel,itype,ib xin
setksmps 1
kAmpEnv	transeg	ia,irel,itype,ib 
xout kAmpEnv
endop 
  	   
;=========================
opcode FILT_ON, k,iiiii  
ia,irise,itype,idec, isus xin
setksmps 1

kFiltEnv	transeg	ia,irise,itype,1,idec,itype,isus

xout kFiltEnv
endop  

;========================
opcode FILT_OFF, k,iiii  
ia,irel,itype,ib xin
setksmps 1

kFiltEnv	transeg	ia,irel,itype,ib

xout kFiltEnv
endop  


;=========================
;WAVE SHAPER2
;========================
;This UDO implements the waveform 2 of OSC1 and OSC2. It is a sum of a Triangle and a  Sawtooth


opcode Moog_Wshaper_2, a,k
kfreq xin

a01 vco2 0.5,kfreq, 4,0.580  	;Generate Triangle [amp = 0.5 / freq = kfreq /pw = 0.58] 	
a02 vco2 -0.12,kfreq,0,0		;Generate inverted sawtooth  [amp = 0.12 / freq = kfreq / pw = 0 		
asum = -(a01+a02)				;Sum (negative) 

xout asum
endop


opcode VCO2_AudioRate, a,k
kfreq xin
setksmps 1
aout 	vco2 0.4, kfreq, 12 		;Triangle
xout aout
endop

;===========================
;TABLE CREATION 
;===========================


;Create table to map freq. filter knob

giTable_FIL ftgen 0, 0,1024, -8, 20, 184, 125, 328, 1000, 256, 4800, 256, 20000

;========================================
;====  MAIN AUDIO WAVETABLES  (waveforms)
;========================================

;gitable1 ftgen 0, 0, 16384, 7, 0, 4096, 1 , 8192, -1, 4096, 0;      Ideal Triangle
gitable1 ftgen 0, 0, 16384, 7, 0, 4096-128, 1 , 8192+128, -1, 4096, 0 ;!!!! Slightly asymmetric triangle
gi_nextfree vco2init -gitable1, gitable1+1, 1.05, 128, 2^16, gitable1
gitable_b1 = -gitable1


gitable2 ftgen 0, 0, 16384, 7, 0.65, 8192,-0.5,8182,0.35			; Peaked Triangle
gi_nextfree vco2init -gitable2, gitable2+1, 1.05, 128, 2^16, gitable2
gitable_b2 = -gitable2


gitable3 ftgen 0, 0, 16384, 7, 0,8192,1,0,-1, 8192,0				;Ramp
gi_nextfree vco2init -gitable3, gitable3+1, 1.05, 128, 2^16, gitable3
gitable_b3 = -gitable3



gitable4 ftgen 0, 0, 16384, 7, 1, 8192-256,1,0,-1,8192+256,-1		;Square (slightly asym)
gi_nextfree vco2init -gitable4, gitable4+1, 1.05, 128, 2^16, gitable4
gitable_b4 = -gitable4


gitable5 ftgen 0, 0, 16384, 7, 1, 4772,1,0,-1,11612,-1				;PW1
gi_nextfree vco2init -gitable5, gitable5+1, 1.05, 128, 2^16, gitable5
gitable_b5 = -gitable5


gitable6 ftgen 0, 0, 16384, 7, 1, 2810,1,0,-1,13574,-1				;PW2
gi_nextfree vco2init -gitable6, gitable6+1, 1.05, 128, 2^16, gitable6
gitable_b6 = -gitable6

;------ Quasi Sine Table for Auxiliary Phantom Resonance Oscillator -------- 

giTableAUX ftgen 0,0,16384, 7, 0, 15824, 0, 219, 0.176413, 134, 0.478558, 27, 0.702729, 180, 0.707602

;=============================================
;DEFINITION AND GLOBAL VARIABLES INITIALIZATION 
;==============================================
maxalloc	10,1		;Instr 10 is allocated for one time max
gkZERO init 0			;Init useful k-variable (0)
gkUNO init 1			;Init   "        "      (1) 

gaREVSEND 	init 0		;Init AUX global send audiovar. (send to REV)
gaRMSEND  	init 0		;Init AUX  global send audiovar.(send to RM)
gaDELAYSEND	init 0		;Init AUX global send audiovar. (send to DELAY)
gaDRYSEND	init 0		;Init AUX global send audiovar. (send to MIX)
gaFFTSEND	init 0		;Init AUX global send audiovar. (send to FFT)

gaAmpEnv init 0			;Init global amp. evelope

gi12hs init 1.059463094359293		;define temperated interval

gkcps		init 0      ;Init global cps (seems no essential)
gkwave 		init 0		;id
gkF2 		init 0		;id


giMIDIvel	init 0
                              
gihist	ftgen	5,0, 512, -17, 0, 48 ; Initialize ftable 5 (used by Arpeggiator)

gkvib_ctrl	init 1
gkRMEnv 	init 0
giNoteNum	init 0

giampFFT	ftgen	501,0,1024,2,0

gkVEL_TO_OSC1 		init 0
gkVEL_TO_OSC2 		init 0
gkVEL_TO_OSC3 		init 0
gkVEL_TO_NOISE 		init 0
gkVEL_TO_VCF 		init 0
gkVEL_SW			init 0
gkVEL_CURVE_TYPE 	init 1
gkVEL_TO_FMAMP 		init 0
gkVEL_TO_FMINDEX 	init 0

gasig3_mod 			init 0

gainput_L			init 0
gainput_R			init 0


 ;===========================================================
 ;===========================================================
 ;======              INSTR 1                      ==========
 ;===========================================================
 ;===========================================================
;
instr	1	;===== NOTE ON/OFF Scheduler (Triggered by MIDI)


giMIDIvel veloc 0.15, 1.0						;Read MIDI velocity and scale to 0. - 1

giMIDIvel = (i(gkVEL_SW) == 1? giMIDIvel : 1)	;Select between constant velocity /127) or variable


giVEL_OSC1 = (i(gkVEL_TO_OSC1) == 1?  giMIDIvel : 1)	;Assign (or not) MIDI vel. to OSC1
giVEL_OSC2 = (i(gkVEL_TO_OSC2) == 1?  giMIDIvel : 1)	;							  OSC2
giVEL_OSC3 = (i(gkVEL_TO_OSC3) == 1?  giMIDIvel : 1)	;							  OSC3


giVEL_VCF = (i(gkVEL_TO_VCF) == 1?  giMIDIvel : 1)			;Assign (or not) MIDI vel. to VCF
giVEL_NOISE = (i(gkVEL_TO_NOISE) == 1?  giMIDIvel : 1)		;Assign (or not) MIDI vel. to NOISE Gen.
giVEL_FM_AMP = (i(gkVEL_TO_FMAMP) == 1? giMIDIvel : 1)		;Assign (or not) MIDI vel. to FM generator (carrier amplitude)
giVEL_FM_INDEX = (i(gkVEL_TO_FMINDEX) ==1? giMIDIvel : 1)	;Assign (or not) MIDI vel. to FM generator (mod. index)

;Select the MIDI velocity to some curve map depending on related combobox(function table 1501 / 1502) 
if i(gkVEL_CURVE_TYPE) == 2 then					;Select a EXP curve (HARD on combobox)-
giMIDIvel table3 giMIDIvel,1501,1					
elseif  i(gkVEL_CURVE_TYPE) == 3 then				;Select a LOG curve (SOFT on combobox)
giMIDIvel table3 giMIDIvel,1502,1
endif

	
	iNN notnum			; Get the MIDI note number value from keyboard  (es:  C4 = 261.,.Hz ==> NN= 60). It is used in key tracking
 
	
	gktrack_del = k(iNN-41)		;Compute number of half steps difference in respect to F2 (41), the track ref. note
	
	
	gkcps cpsmidib				;Read in the pitch from MIDI keyb (icps in Hz or cps) + pitch bender
	
	
	gkNoteOn	init	1		;Set this flag to 1 . It will be cleared at bottom of instr 2	
		 														
schedule 10,0,-1				;Invoke INSTR 10 

endin


instr 2 ;=========Read widgets output and assign to internal k-variables

gkdata2 init 1;		Init MIDI CC1  to 1  

gkEXT			chnget	"EXT"
gkstatus, gkchan, gkdata1, gkdata2     midiin ; Read incoming MIDI message

if gkdata1 == 1 then				;Intercepts the MOD WHEEL (cc = 1)

gkvib_ctrl = gkdata2				;Assign MOD WHEEL to global vibrato variable

endif


gkGLIDE_ON		chnget "GLIDE_ON"			;Get switch for GLIDE On/Off
gkDECAY_ON		chnget "DECAY_ON"			;Get switch for DECAY On/Off
gkMTUNE 		chnget "MTUNE"				;Get rslider master tune
gkVOL_ON		chnget "VOL_ON"				;Get switch general mute

gkOSC3_CTRL		chnget "OSC3_CTRL"			;Get switch for OSC3 (when in LO mode)
gkVEL_SW		chnget "VEL_SW"				;Get switch for MIDI velocity active or not
gkVEL_CURVE_TYPE chnget "VEL_CURVE_TYPE"	;Get combo for type of key MIDIvelocity  mapping  (Lin or Exp)

gkOSC_MOD_SW	chnget "OSC_MOD_SW"			;Get switch state for LFO On/Off from OSC3 to oscillators
gkMOD_MIX		chnget "MOD_MIX"			;Get slider for mix between  LFO from OSC3 or from Noise source
gkFILT_MOD_SW	chnget "FILT_MOD_SW"		;Get switch state for LFO On/Off from OSC3 to VCF

gkINPUT_SW		chnget "INPUT_SW"			;Get switch state for external input (stereo)
gkINVOL			chnget "INVOL"				;Get rslider for external source level control
gkporttime_0 	chnget "porttime"			;Get port time (glide o portamento)

gkporttime_0 = (gkGLIDE_ON == 1? gkporttime_0 : 0)	;Test on GLIDE on/off

ktrig metro 40 ;							;Reduce widget reading rate to 40/sec
if ktrig == 1 then


gkCOARSE_FINE	chnget	"COARSE_FINE"		;Get FINE/COARSE switch state

gkswnoise_on	chnget	"SWNOISE_ON"		;Get Noise generator ON/OFF
gksw_noise 		chnget	"SW_NOISE"			;Get Noise selection (White / Pink)
gkNOISE_ENV_SW	chnget  "NOISE_ENV_SW"		;Get Noise Envelope switch 

;========== RM ===============
gkRMSW			chnget	"RMSW"				;Get Ring Mod. ON/OFF  switch
gkRM_ENV_SW		chnget  "RM_ENV_SW"			;Get Ring Mod. Envelope ON/OFF switch
gkMODF			chnget  "MODF"				;Get Ring Mod. modulating freq 
gkMODX			chnget  "MODX"				;Get Ring Mod. mix
gkMODW			chnget  "MODW"				;Get Ring Mod. waveform

gkRM_ATK		chnget "RM_ATK"				;Get Ring Mod.ATK envelope
gkRM_DCY		chnget "RM_DCY"				;Get Ring Mod.DCY/REL envelope
gkRM_SUS		chnget "RM_SUS"				;Get Ring Mod.SUS envelope
gkRM_ENV_SW		chnget "RM_ENV_SW"			;Get Ring Mod.SWITCH on/off
									
;======== TUNER  ============
gkTUNER			chnget "TUNER"				;Get tuner switch on/off

;======== REVERB ======
gkREVSW			chnget	"REVSW"				;Get rev. switch (on/off)
gkREVSEND 		chnget	"REVSEND"			;Get revsend
gkROOM			chnget 	"ROOM"				;Get rev. len.
gkDAMP			chnget	"DAMP"				;Get HF damp
gkREVSW_TYPE	chnget	"REVSW_TYPE"		;Get revtype switch (old school:freeverb/modern:reverbsc)

;===== XLFO=====
gkLFO_SW		chnget "LFO_SW"				;Get XLFO switch (on/off)
gkLFO_WAVE		chnget "LFO_WAVE"			;Get XLFO waveform
			

gkFVIB_FC		chnget "FVIB_FC"			;Get check sw. to send XLFO to filter

gkLFO1			chnget "LFO1"				;Get check sw. to send XLFO to OSC1
gkLFO2			chnget "LFO2"				;Get check sw. to send XLFO to OSC2
gkLFO3			chnget "LFO3"				;Get check sw. to send XLFO to OSC3

;Knobs
gkLFO_AMP		chnget "LFO_AMP"			;Get XLFO amount
gkLFO_FRQ		chnget "LFO_FRQ"			;Get XLFO freq
gkLFO_DLY		chnget "LFO_DLY"			;Get XLFO delay
gkLFO_ATK		chnget "LFO_ATK"			;Get XLFO env. attack



gkLFO_AMP = (gkEXT == 1? gkLFO_AMP * gkvib_ctrl/127.0 : gkLFO_AMP) ; Check if XLFO is controlled by ext. modulation wheel


;==== MIXER SWITCHES
gkSWMIX			chnget	"SWMIX"			;Get osc1. switch ON/OFF
gkSWMIX2		chnget	"SWMIX2"		;Get osc2. switch ON/OFF
gkSWMIX3		chnget	"SWMIX3"		;Get osc3. switch ON/OFF

;==== NOISE & EXT. SOURCE =================
;Volume
gknoise_vol		chnget	"NOISE_VOL"		;Get Noise (White/Pink) volume
gkINVOL 		chnget 	"INVOL"			;Get external source volume


gkNOISE_ATK 	chnget  "NOISE_ATK"		;Get Noise env. attack
gkNOISE_DCY 	chnget  "NOISE_DCY"		;Get Noise env. decay/rel
gkNOISE_SUS 	chnget  "NOISE_SUS"		;Get Noise env. sus


;==== OSCILLATORS ===========

;Range
gkRANGE_OSC_1	chnget	"RANGE_OSC_1"	;Get OSC.1 freq. range [0=LO,1=32',2=16',3=8',4=4',5=2'] 
gkRANGE_OSC_2	chnget	"RANGE_OSC_2"	;Get OSC.2 freq. range    "
gkRANGE_OSC_3	chnget	"RANGE_OSC_3"	;Get OSC.3 freq. range    "


;Waveform 
gkwave 			chnget	"Wave"			;Get waveform osc.1 [0=Ramp , 1=Square, 2=Tri ] 
gkwave2 		chnget	"Wave2"			;Get waveform osc.2     "  
gkwave3 		chnget	"Wave3"			;Get waveform osc.3     "

;Base Oscillator Frequency
gkFD2 			chnget	"F2"			;Get freq. dial osc. 2 (detuning OSC2)
gkFD3 			chnget	"F3"			;Get freq. dial osc. 3 (detuning OSC3)



;====== MODIFIERS ================
;Loudness Contour (VCA or amplitude envelope param.)
gkAmpAttTim		chnget 	"AmpAttTim"		;Get Loudness Envelope Attack Time in [secs]
gkAmpRelTim		chnget 	"AmpRelTim"		;Get Loudness Envelope Decay Time in [secs]
gkAmpLev		chnget	"AmpLev"		;Get Loudness Envelope Sustain Lev
				
;Filter Basic Parameters
;gkFBASE_VCF_0	chnget	"FBASE_VCF" 	;Get the base CUT-OFF freq. [0 = 20hz : 0.99 = 20Khz]
;gkRES_VCF		chnget	"RES_VCF"		;Get emphasis (resonance) [0 : 0.99]
 

;Filter Contour (VCF envelope param.)
gkFiltAttTim	chnget	"FiltAttTim"	;Get Filter Envelope Attack Time in [secs]
gkFiltRelTim	chnget	"FiltRelTim"	;Get Filter Envelope Decay Time in [secs]
gkFiltLev		chnget	"FiltLev"		;Get Filter Envelope Sustain Level

gkFSCALE_1 = 0.125 * 2^gkRANGE_OSC_1	;compute actual osc. 1 base freq  	(range OSC1 selector)
gkFSCALE_2 = 0.125 * 2^gkRANGE_OSC_2	;compute actual osc. 2 base freq 	(range OSC2 selector)
gkFSCALE_3 = 0.125 * 2^gkRANGE_OSC_3	;compute actual osc. 3 base freq	(range OSC3 selector)

if gkRANGE_OSC_1 == 0 then							;if OSC1  range  is in the LO position then freq. is 5 octaves lower
gkFSCALE_1 =gkFSCALE_1*0.0625
endif

if gkRANGE_OSC_2 == 0 then							;if OSC2  range  is in the LO position then freq. is 5 octaves lower
gkFSCALE_2 =gkFSCALE_2*0.0625
endif

if gkRANGE_OSC_3 == 0 && gkOSC3_CTRL == 1 then		;if OSC3  range  is in the LO position then freq. is 5 octaves lower
gkFSCALE_3 =gkFSCALE_3*0.0625
endif


gkFD2 = (gkCOARSE_FINE==1? gkFD2 : gkFD2*7.0)	;COARSE/FINE detuning manager OSC. 2
gkFD3 = (gkCOARSE_FINE==1? gkFD3 : gkFD3*7.0)	;COARSE/FINE detuning manager OSC. 3
gkFD2 = gi12hs^gkFD2							;compute transpose for OSC2
gkFD3 = gi12hs^gkFD3							;compute transpose for OSC3


;======DELAY======

gkDELAY_SW		    chnget  "DELAY_SW"			;Get delay switch (on/off)
gkdel_time 			chnget	"del_time"			;Get delay time in sec.
gkdel_cut 			chnget	"del_cut"			;Get delay lopass cut (Hz)
gkdel_feed 			chnget	"del_feed"			;Get delay feedback
gkdel_mix 			chnget	"del_mix"			;Get delay mix 
gkdel_lev 			chnget	"del_lev"			;Get delay level


;=======  MIDI KEY VELOCITY =======

gkVEL_TO_OSC1		chnget  "VEL_TO_OSC1"		;Get checkbox (as a switch/led) for assign key vel. to OSC1
gkVEL_TO_OSC2		chnget  "VEL_TO_OSC2"		;Get checkbox (as a switch/led) for assign key vel. to OSC2
gkVEL_TO_OSC3		chnget  "VEL_TO_OSC3"		;Get checkbox (as a switch/led) for assign key vel. to OSC3
gkVEL_TO_NOISE		chnget  "VEL_TO_NOISE"		;Get checkbox (as a switch/led) for assign key vel. to NOISE
gkVEL_TO_VCF		chnget  "VEL_TO_VCF"		;Get checkbox (as a switch/led) for assign key vel. to VCF

;====== FM ======
gkFMSW				chnget "FMSW"
gkFM_MOD_FIX		chnget "FM_MOD_FIX"
gkFM_MOD_RATIO		chnget "FM_MOD_RATIO"
gkFM_INDEX			chnget "FM_INDEX"
gkFM_VOL			chnget "FM_VOL"

gkFM_MODE			chnget "FM_MODE"

gkFM_ATK			chnget "FM_ATK"
gkFM_DCY			chnget "FM_DCY"
gkFM_SUS			chnget "FM_SUS"

gkFM_ATK_INDEX		chnget "FM_ATK_INDEX"
gkFM_DCY_INDEX		chnget "FM_DCY_INDEX"
gkFM_SUS_INDEX		chnget "FM_SUS_INDEX"

gkVEL_TO_FMAMP		chnget "VEL_TO_FMAMP"
gkVEL_TO_FMINDEX	chnget "VEL_TO_FMINDEX"

endif			;End of widget scan at low rate

;-------------------------------------------------

gkFBASE_VCF_0	chnget	"FBASE_VCF" 	;Get the base CUT-OFF freq. [0 = 20hz : 0.99 = 20Khz]
gkRES_VCF		chnget	"RES_VCF"		;Get emphasis (resonance) [0 : 0.99]
gkRES_VCF  		port gkRES_VCF,0.01

gkAMOUNT_VCF	chnget	"AMOUNT_VCF"	;Get amount of filter contour
gkAMOUNT_VCF    port gkAMOUNT_VCF, 0.08

gkKEYTRK_SW1	chnget "KEYTRK_SW1"		;Get keytrack 1 switch (on/off)
gkKEYTRK_SW2	chnget "KEYTRK_SW2"		;Get keytrack 2 switch (on/off)

gkRESET_PITCH chnget "RESET_PITCH"		;Get the pitch  reset 

gkMAIN_VOLUME_0	chnget "MAIN_VOLUME"	;Get Main Volume
gkMAIN_VOLUME port gkMAIN_VOLUME_0,0.05	;Smooth it

gkVOL_OSC_1_0 	chnget	"VOL_OSC_1"		;Get OSC.1 volume [0 : 1]
gkVOL_OSC_2_0 	chnget	"VOL_OSC_2"		;Get OSC.2 volume [0 : 1]
gkVOL_OSC_3_0 	chnget	"VOL_OSC_3"		;Get OSC.3 volume [0 : 1]

gkVOL_OSC_1 port gkVOL_OSC_1_0, 0.05	;Smooth individual OSC1 level
gkVOL_OSC_2 port gkVOL_OSC_2_0, 0.05	;Smooth individual OSC2 level
gkVOL_OSC_3 port gkVOL_OSC_3_0, 0.05	;Smooth individual OSC3 level



gkfil tablei gkFBASE_VCF_0, giTable_FIL,1		;Map filt. frequency to non linear table
chnset gkfil, "dispVCF_CUT"
gkfil port gkfil,0.01							;Smooth control..


 
if gkMTUNE > -0.02 && gkMTUNE < 0.02  then		;If tune knob is in the interval lit on green LED
chnset gkUNO,"MTUNE_LED"
else
chnset gkZERO,"MTUNE_LED"						;.. else lit off
endif

ktrig_reset_pitch changed gkRESET_PITCH			;trigger a dedicated instr (instr 8) to reset pitch
if ktrig_reset_pitch !=0 then
schedkwhen ktrig_reset_pitch,0,1, 8,0,0.1			;call instr 8
endif

;ksave_trig changed gkSAVE
;if ksave_trig == 1 then
;schedkwhen ksave_trig,0,1,7,0,0.1
;endif

  

ain_L,ain_R ins								;Input external audio source (stereo)
;ain_L,ain_R diskin "audio.wav",1,0,1
gainput_L = ain_L * gkINVOL * gkINPUT_SW	;Make global and scale LEFT with a gain
gainput_R = ain_R * gkINVOL * gkINPUT_SW 	;Make global and scale RIGHT with a gain


endin


instr 3 ;=========== ARPEGGIATOR FUNCTION DISPLAY =======

chnset  6,"val0"
chnset 12,"val1"
chnset 18,"val2"
chnset 24,"val3"
chnset 30,"val4"
chnset 36,"val5"
chnset 42,"val6"
chnset 48,"val7"

	
	; read in widgets
	gkval0	chnget	"val0"
	gkval1	chnget	"val1"
	gkval2	chnget	"val2"
	gkval3	chnget	"val3"
	gkval4	chnget	"val4"
	gkval5	chnget	"val5"
	gkval6	chnget	"val6"
	gkval7	chnget	"val7"



	gkloc1	chnget	"loc1"	
	gkloc2	chnget	"loc2"
	gkloc3	chnget	"loc3"
	gkloc4	chnget	"loc4"
	gkloc5	chnget	"loc5"
	gkloc6	chnget	"loc6"
	gkloc7	chnget	"loc7"



	gkloc1	init	64
	gkloc2	init	64
	gkloc3	init	64
	gkloc4	init	64
	gkloc5	init	64
	gkloc6	init	64
	gkloc7	init	64

		
ktrig	changed		gkval0,gkval1,gkval2,gkval3,gkval4,gkval5,gkval6,gkval7, gkloc1,gkloc2,gkloc3,gkloc4,gkloc5,gkloc6,gkloc7
	if ktrig==1 then	
	 reinit	UPDATE
	endif
	UPDATE:

	
gihist	ftgen	5,0, 512, -17, 0, i(gkval0), i(gkloc1),\ 
	                                     i(gkval1), i(gkloc1)+i(gkloc2), \
	                                     i(gkval2), i(gkloc1)+i(gkloc2)+i(gkloc3), \
	                                     i(gkval3), i(gkloc1)+i(gkloc2)+i(gkloc3)+i(gkloc4), \
	                                     i(gkval4), i(gkloc1)+i(gkloc2)+i(gkloc3)+i(gkloc4)+i(gkloc5), \
	                                     i(gkval5), i(gkloc1)+i(gkloc2)+i(gkloc3)+i(gkloc4)+i(gkloc5)+i(gkloc6), \
	                                     i(gkval6), i(gkloc1)+i(gkloc2)+i(gkloc3)+i(gkloc4)+i(gkloc5)+i(gkloc6)+i(gkloc7), \
	                                     i(gkval7)
	rireturn

	if ktrig==1 then			 
	 chnset	"tablenumber(5)", "table1"	; update table display	
	endif


endin



instr 4;====== LFO SYNC LED
  
 kfreq = (gkLFO_WAVE==5? gkLFO_FRQ/4 : gkLFO_FRQ)

kled oscil gkLFO_SW,kfreq,6
chnset kled, "LFO_LED" 

endin


instr 5;===== TUNER  (CALLER) Works in combination with instr 6 ====
;Instr 5 & 6 used to activate "click free" tuner note 
ktrig changed gkTUNER		    ;sense TUNER button on/off (1/0)

if  gkTUNER == 1 then			;if TUNER ON (1)

schedkwhen ktrig, 0,1,6,0,-1 	;call instr 6 indefinitely (1 istance)
endif
endin

instr 6;===== TUNER (CALLED) =====
kgate tonek 0.4*gkTUNER, 20		;smooth (lowpass) the Tuner switch value
agate interp kgate				;upsample k to a (better smoothing)

a1 oscili agate*gkMAIN_VOLUME, cpspch(8.09) ; create note at 440 Hz (8.09) using "agate" as an envelope 
gaFFTSEND=gaFFTSEND+a1
outs a1*gkVOL_ON, a1*gkVOL_ON

endin


;instr 7; ==== SAVE
;
;
;
;endin

instr 8 ; === Reset Master Pitch ===

chnset 0,"MTUNE"
chnset 1,"MTUNE_LED"
endin


;========================================
;========================================
;========================================


instr 10 ;========= MAIN SOUND ENGINE ====

irand_range init 2.0	;Init parameter for UDO pink noise gen.


gkporttime = gkporttime_0 * 0.001			;Scale port in sec

kvib init 0

kactive1	active	1						;Counts instances of instr 1 (the MIDI activated instr)

kNoteNum = octcps(gkcps)					;Get the notenum



kporttime	linseg	0.0,0.01,1				;Portamento Time rises quickly to a held value of '1'
kporttime	=	kporttime*gkporttime		;Portamento Time function scaled by value output by widget (knob)
kcps		portk	gkcps, kporttime		;Apply portamento to pitch changes


kvibfreq = gkLFO_FRQ						;Assign variable




;===== OSCILLATORS ============

kcps2 = kcps; 
kcps3 = kcps;


kfOSC_1 = gkFSCALE_1*kcps*gi12hs^gkMTUNE				;OSC1 freq. (range osc.1 * kcps * main tune)
kfOSC_2 = gkFSCALE_2*kcps2*gkFD2*gi12hs^gkMTUNE			;OSC2 freq. (range osc 2 * kcps * detune * main tune)
kfOSC_3 = gkFSCALE_3*kcps3*gkFD3*gi12hs^gkMTUNE			;OSC3 freq. (range osc.3 * kcps * detune * main tune)
	

if gkRANGE_OSC_3 == 0 && gkOSC3_CTRL == 0  then					;if OSC3  range  is in the LO position then freq. is 5 octaves lower
kfOSC_3 =2.0439497289109 ;that is  130.81278265029737 Hz /64	;fixed freq of six octaves belove C3
endif

	
agauss gauss 1						;White noise gnerator
     
apink PINK_NOISE irand_range		;Call UDO Pink Noise generator  (UDO)


	anoiseW = agauss * (1-gksw_noise)	;Associate mute on/off to white noise
	anoiseP = apink  * gksw_noise		;Associate mute on/off (complementary) to pink noise
		
	anoise = gknoise_vol * (anoiseW+anoiseP)*gkswnoise_on * giVEL_NOISE  ;Sum, scale the combined noises and MIDI vel scale
	


	anoise_OSC3 random -1,1						;Alias Noise generator for LFO associated to OSC3
	anoise_OSC3 = anoise_OSC3 * gkOSC_MOD_SW	;Switch on the noise using button

kvibenv = 1										;Set vibenv flag to 1


if	gkNoteOn=1 then							;Restart vibrato on new note
	  reinit	RestartVibEnv						
		endif											
	
	
	
	RestartVibEnv:	

kvibenv		transeg	0,i(gkLFO_DLY)+0.01,0,0,i(gkLFO_ATK),2,1   ; Vibrato envelope	
	
	rireturn

kLFO_AMP_norm = gkLFO_AMP/0.24	;Normalized amount of vibrato		
if gkLFO_WAVE == 7 then			;Check if vibrato is transformed into Arpeggiator

kvib		oscilikt	kvibenv*0.01*gkLFO_SW, 0.1+kvibfreq/4, gihist,0		;case of arpeggiator
kvibVCF		oscilikt	kvibenv,  kvibfreq/4, gihist, 0
else

kvib		oscilikt	kvibenv*gkLFO_AMP*gkLFO_SW, kvibfreq, gkLFO_WAVE+10,0	;all others cases
kvibVCF		oscilikt	kvibenv,  kvibfreq, gkLFO_WAVE+10, 0

endif



if gkLFO_WAVE == 8 && gkLFO_SW == 1 then									;special case of sample & hold funtion
  kran randomh -.24*kLFO_AMP_norm,.24*kLFO_AMP_norm,gkLFO_FRQ*2 
  kvib = kran
			;
endif

kvib_norm = kvib/0.24			;Normalized vibrato wave (rescaled to maximum value on the widget : 0.24)



	gkvib1		=	1 + kvib*gkLFO1				;Set amount of vibrato from XLFO to OSC1
	gkvib2		=	1 + kvib*gkLFO2				;								    OSC2
	gkvib3		=	1 + kvib*gkLFO3				;								    OSC3
	
	gkVIB_O3     =   1 + gasig3_mod 			;Set amount of vibrato coming from OSC 3 (the same for all oscillators)
	gaVIB_O3     =   1 + gasig3_mod				;a- version of the previous variable
	 	
 

kAmpEnv			init	0				;Init amp env. to zero	
kFiltEnv		init	0				;Init filt. env. to zero
kNoiseEnv		init 	0				;Init Noise env. to zero
kRMEnv			init 	0				;Init RM env. to zero
kFMEnv			init 	0				;Init FM amp. env to zero
kFM_IndexEnv	init	0				;Init FM index env to zero



kvib_ctrl = gkvib_ctrl/127.0		;Normalize to 1 the external MOD WHEEL (0-127 -->  0 - 1)


;=======================
;===== OSCILLATOR 1 ====
;=======================
kfreq_OSC1 = kfOSC_1*gkvib1*gkVIB_O3			;Set the composite freq. for OSC1 
afreq_OSC1 = kfOSC_1*gkvib1*gaVIB_O3			;a-version


if gkwave == 0 then

kfn     vco2ft kfreq_OSC1, gitable_b1				;Triangle (with defined table using vco2ft)- (new)
asig1   oscilikt 0.4, afreq_OSC1, kfn
	
			
elseif 	gkwave == 1 then
		
kfn     vco2ft kfreq_OSC1, gitable_b2				;Peaked Triangle (new)
asig1   oscilikt 0.5, afreq_OSC1, kfn						
								
	
elseif gkwave == 2 then
		
kfn     vco2ft kfreq_OSC1, gitable_b3				;Ramp (new)
asig1   oscilikt 0.5, afreq_OSC1, kfn



elseif gkwave == 3 then

kfn     vco2ft kfreq_OSC1, gitable_b4				;Square  (new) 
asig1   oscilikt 0.5, afreq_OSC1, kfn


elseif gkwave == 4 then

kfn     vco2ft kfreq_OSC1, gitable_b5				;PW1 Rect (new) 
asig1   oscilikt 0.5, afreq_OSC1, kfn


elseif gkwave == 5 then

kfn     vco2ft kfreq_OSC1, gitable_b6				;PW2 Rect  (new) 
asig1   oscilikt 0.5, afreq_OSC1, kfn


endif



;=======================
;==== OSCILLATOR 2 =====
;=======================
kfreq_OSC2 = kfOSC_2*gkvib2*gkVIB_O3
afreq_OSC2 = kfOSC_2*gkvib2*gaVIB_O3


if gkwave2 == 0 then

kfn2    vco2ft kfreq_OSC2, gitable_b1				;Triangle (with defined table using vco2ft)- (new)
asig2   oscilikt 0.4, afreq_OSC2, kfn2	


elseif gkwave2 == 1 then

kfn2    vco2ft kfreq_OSC2, gitable_b2				;Peaked Triangle ( (new)
asig2   oscilikt 0.5, afreq_OSC2, kfn2	


elseif gkwave2 == 2 then

kfn2    vco2ft kfreq_OSC2, gitable_b3				;Ramp (new)
asig2   oscilikt 0.5, afreq_OSC2, kfn2	


elseif gkwave2 == 3 then

kfn2    vco2ft kfreq_OSC2, gitable_b4				;Square (new)
asig2   oscilikt 0.5, afreq_OSC2, kfn2


elseif gkwave2 == 4 then

kfn2    vco2ft kfreq_OSC2, gitable_b5				 ;PW1 Rect (new)
asig2   oscilikt 0.5, afreq_OSC2, kfn2

elseif gkwave2 == 5 then

kfn2    vco2ft kfreq_OSC2, gitable_b6				 ;PW2 Rect (new)
asig2   oscilikt 0.5, afreq_OSC2, kfn2

endif


;===============================================================
;========= OSCILLATOR 3 (With LFO source functionality) ========
;===============================================================
kfreq_OSC3 = kfOSC_3*gkvib3*gkVIB_O3
afreq_OSC3 = kfOSC_3*gkvib3*gaVIB_O3

if gkwave3 == 0 then

kfn3    vco2ft kfreq_OSC3, gitable_b1				;Triangle (with defined table using vco2ft)- (new)
asig3   oscilikt 0.4, afreq_OSC3, kfn3

asig3_mod oscili 1,kfOSC_3,20		;!!!! ALIAS oscillator for LFO action (using raw triangle function : f20)
gasig3_mod = (gkOSC_MOD_SW*(gkMOD_MIX*anoise_OSC3 + (1-gkMOD_MIX)*asig3_mod))*kvib_ctrl	;Mix the OSC3 / NOISE source of modulation
gasig3_mod_VCF = (gkFILT_MOD_SW*(gkMOD_MIX*anoise_OSC3 + (1-gkMOD_MIX)*asig3_mod))*kvib_ctrl;Mix the OSC3 /NOISE source of modulation for VCF

elseif gkwave3 == 1 then
		

kfn3    vco2ft kfreq_OSC3, gitable_b3				;Descending Ramp (with defined table using vco2ft)- (new)
asig3   oscilikt -0.5, afreq_OSC3, kfn3

asig3_mod oscili 1,kfOSC_3*gkvib3,21		;!!!! ALIAS oscillator for LFO action (using raw negative function : f21)
gasig3_mod = (gkOSC_MOD_SW*(gkMOD_MIX*anoise_OSC3 + (1-gkMOD_MIX)*asig3_mod))*kvib_ctrl	;Mix the OSC3 / NOISE source of modulation for Oscillators
gasig3_mod_VCF = (gkFILT_MOD_SW*(gkMOD_MIX*anoise_OSC3 + (1-gkMOD_MIX)*asig3_mod))*kvib_ctrl;Mix the OSC3 /NOISE source of modulation for VCF



elseif gkwave3 == 2 then


kfn3    vco2ft kfreq_OSC3, gitable_b3				;Ascending Ramp (with defined table using vco2ft)- (new)
asig3   oscilikt 0.5, afreq_OSC3, kfn3

asig3_mod oscili 1,kfOSC_3,22		;!!!! ALIAS oscillator for LFO action (using raw positive function : f22)
gasig3_mod = (gkOSC_MOD_SW*(gkMOD_MIX*anoise_OSC3 + (1-gkMOD_MIX)*asig3_mod))*kvib_ctrl	;Mix the OSC3 / NOISE source of modulation
gasig3_mod_VCF = (gkFILT_MOD_SW*(gkMOD_MIX*anoise_OSC3 + (1-gkMOD_MIX)*asig3_mod))*kvib_ctrl;Mix the OSC3 /NOISE source of modulation for VCF


elseif gkwave3 == 3 then


kfn3    vco2ft kfreq_OSC3, gitable_b4					;Square(new)
asig3   oscilikt 0.5, afreq_OSC3, kfn3

asig3_mod oscili 1,kfOSC_3,23		;!!!! ALIAS oscillator for LFO action (using positive raw square function : f23)
gasig3_mod = (gkOSC_MOD_SW*(gkMOD_MIX*anoise_OSC3 + (1-gkMOD_MIX)*asig3_mod))*kvib_ctrl	;Mix the OSC3 / NOISE source of modulation
gasig3_mod_VCF = (gkFILT_MOD_SW*(gkMOD_MIX*anoise_OSC3 + (1-gkMOD_MIX)*asig3_mod))*kvib_ctrl

elseif gkwave3 == 4 then


kfn3    vco2ft kfreq_OSC3, gitable_b5					;PW1 Rect (new)
asig3   oscilikt 0.5, afreq_OSC3, kfn3

asig3_mod oscili 1,kfOSC_3,24	;!!!! ALIAS oscillator for LFO action (using positive raw PWM1 rect function : f24)
gasig3_mod = (gkOSC_MOD_SW*(gkMOD_MIX*anoise_OSC3 + (1-gkMOD_MIX)*asig3_mod))*kvib_ctrl	;Mix the OSC3 / NOISE source of modulation
gasig3_mod_VCF = (gkFILT_MOD_SW*(gkMOD_MIX*anoise_OSC3 + (1-gkMOD_MIX)*asig3_mod))*kvib_ctrl

elseif gkwave3 == 5 then


kfn3    vco2ft kfreq_OSC3, gitable_b6					;PW2 Rect (new)
asig3   oscilikt 0.5, afreq_OSC3, kfn3

asig3_mod oscili 1,kfOSC_3,25	;!!!! ALIAS oscillator for LFO action (using positive raw PWM1 rect function : f25)
gasig3_mod = (gkOSC_MOD_SW*(gkMOD_MIX*anoise_OSC3 + (1-gkMOD_MIX)*asig3_mod))*kvib_ctrl	;Mix the OSC3 / NOISE source of modulation
gasig3_mod_VCF = (gkFILT_MOD_SW*(gkMOD_MIX*anoise_OSC3 + (1-gkMOD_MIX)*asig3_mod))*kvib_ctrl
endif


;============================================================
;     ENVELOPES
;============================================================
if gkNoteOn=1&&kactive1=1 then		;If a new legato phrase has begun (A NEW NOTE pressed and no older are held ...
	  reinit	RestartLegEnvs		;...Restart the 'legato phrase' envelopes (AMPLITUDE AND FILTER)
	endif	

	
			
RestartLegEnvs:					;A label: start a reinit pass to restart the legato phrase ENVELOPES
	
	
if	kactive1 >0 then			;If almost one note is existing ...

kAmpEnv AMP_ON i(kAmpEnv),i(gkAmpAttTim),-2,i(gkAmpRelTim),i(gkAmpLev)	;Move AMPLITUDE Env. (Attack & Decay to Sustain) 	
kAmpSus	=	kAmpEnv 													;Save current amp


kFiltEnv FILT_ON i(kFiltEnv),i(gkFiltAttTim),-2, i(gkFiltRelTim),i(gkFiltLev) 	;Move FILTER Env. (Attack & Decay to Sustain)
kFiltSus =	kFiltEnv															;Save current Filter envelope value


kNoiseEnv	AMP_ON i(kNoiseEnv),i(gkNOISE_ATK),-2,i(gkNOISE_DCY),i(gkNOISE_SUS) 	;Move NOISE Env. (Attack & Decay to Sustain)
kNoiseSus = kNoiseEnv																;Save current NOISE envelope value

gkRMEnv	AMP_ON i(gkRMEnv), i(gkRM_ATK),-2,i(gkRM_DCY),i(gkRM_SUS)					;Move RM Env. (Attack & Decay to Sustain)
kRmSus = gkRMEnv																	;Save current NOISE envelope value


kFMEnv AMP_ON i(kFMEnv), i(gkFM_ATK), -2, i(gkFM_DCY),i(gkFM_SUS)					;Move FM carrier Env. (Attack & Decay to Sustain)
kFMSus = kFMEnv																		;Save current FM carrier envelope value

kFM_IndexEnv AMP_ON i(kFM_IndexEnv), i(gkFM_ATK_INDEX), -2, i(gkFM_DCY_INDEX),i(gkFM_SUS_INDEX) ;Move FM Index Env. (Attack & Decay to Sustain)
kFM_IndexSus = kFM_IndexEnv																		;Save current FM Index envelope value																								



elseif kactive1 = 0 then
		
kAmpEnv  AMP_OFF    1,i(gkAmpRelTim)*i(gkDECAY_ON)+0.01,-2,0		;Move normalized Amplitude Env. to release 
kAmpEnv	   =	kAmpEnv*kAmpSus								;Scale to actual sus value

kFiltEnv  FILT_OFF    1,i(gkFiltRelTim)*i(gkDECAY_ON)+0.01,-2,0	;Move normalized FILTER Env. to release 
kFiltEnv	=	kFiltEnv*kFiltSus							;Scale to actual sus value



kNoiseEnv	AMP_OFF 1,i(gkNOISE_DCY),-2,0 					;Move normalized NOISE Amplitude Env. to release 
kNoiseEnv = kNoiseEnv*kNoiseSus								;Scale to actual sus value

gkRMEnv	AMP_OFF 1,i(gkRM_DCY),-2,0							;Move normalized RM Amplitude Env. to release
gkRMEnv = gkRMEnv * kRmSus									;Scale to actual sus value

kFMEnv AMP_OFF 1,i(gkFM_DCY),-2,0							;Move normalized FM Amplitude Env. to release
kFMEnv=kFMEnv * kFMSus										;Scale to actual sus value

kFM_IndexEnv AMP_OFF 1,i(gkFM_DCY_INDEX),-2,0				;Move normalized FM Index Env. to release
kFM_IndexEnv=kFM_IndexEnv * kFM_IndexSus					;Scale to actual sus value
      


	endif									;End of test
rireturn
	

kNoiseEnv = (gkNOISE_ENV_SW==1? kNoiseEnv : 1)				;Check the local noise envelope switch (in the MIXER panel)
 

	aAmpEnv		interp	kAmpEnv				;Smoother amp.env - (useful for fast changing envelope segments)	
	
;==========================
;    FM section 
;==========================	
if gkFMSW == 1 then				;Check the FM switch 
			
	if gkFM_MODE == 0 then				;Check the small slider to select FM mode : Fixed or Ratio. If in position 0 ...
	 kFMmodfreq = gkFM_MOD_FIX			;.... get mod. freq directly from FIXED knob
	else								;else...
	kFMmodfreq = kcps*gkFM_MOD_RATIO	;...get mod. freq directly from keyb. pitch (kcps) scaled to values from RATIO knob
	endif								;end of test
	
aFM_IndexEnv interp kFM_IndexEnv
kFM_delta = giVEL_FM_INDEX*gkFM_INDEX * kFMmodfreq *aFM_IndexEnv		;Compute the appropriate freq. deviation (Fdev = Index * mod.freq)...
																		;.... also scaled to MIDI velocity when active
aFM_mod oscili kFM_delta, kFMmodfreq, 1 								;Generate modulatin wave
acps interp kcps
aFMEnv interp kFMEnv														;Interpolate to a-rate signal !!!
aFM		oscili	giVEL_FM_AMP*gkFM_VOL*aFMEnv,acps+aFM_mod,1				;Modualted carrier (FM signal) also scaled to MIDI velocity when active


else																	;else FM signal = 0
aFM = 0
endif																	;end check

;================== MIXER, FILTER and VCA SECTION  ==============
	aOSC1 = (asig1 * gkSWMIX  * gkVOL_OSC_1) * giVEL_OSC1	;OSC1 signal (controlled by  SWITCH/VOLUME and scaled to MIDI vel)
	aOSC2 = (asig2 * gkSWMIX2 * gkVOL_OSC_2) * giVEL_OSC2	;OSC2 ...
	aOSC3 = (asig3 * gkSWMIX3 * gkVOL_OSC_3) * giVEL_OSC3	;OSC3 ...
	
	aOSC_MIX sum aOSC1 , aOSC2, aOSC3						;OSC1 + OSC2 + OSC3  (Oscillator Mix) 
	
	asig = (kNoiseEnv*anoise*0.7 + aOSC_MIX) ;* aAmpEnv  	;Add enveloped/scaled  Noise to Oscillators Mix
	
	kfilt_delta = $MAX_FREQ - gkfil										;Compute Delta Freq. (difference from cutoff to NY freq.)
	kffilt_var = (kfilt_delta * kFiltEnv * gkAMOUNT_VCF)* giVEL_VCF		;Envelope/scale Delta Freq. and  scale to MIDI vel
	kfilt_freq = gkfil + 0.9*gkfil * kvib_norm*kLFO_AMP_norm*gkFVIB_FC  ;Modulate this freq 

	
	kfreq_VCF = kfilt_freq*(1+ gasig3_mod_VCF) + kffilt_var					;Sum static (and LFO it) and variable component of cutoff filter

;---KEY TRACKING SECTION -------------
		
if gkKEYTRK_SW1== 1 && gkKEYTRK_SW2 == 0 then 
kfreq_VCF = kfreq_VCF*$MULT_TRK1^gktrack_del

elseif  gkKEYTRK_SW1== 0 && gkKEYTRK_SW2 == 1 then 
kfreq_VCF = kfreq_VCF*$MULT_TRK2^gktrack_del

elseif gkKEYTRK_SW1== 1 && gkKEYTRK_SW2 == 1 then 
kfreq_VCF = kfreq_VCF*$MULT_TRK12^gktrack_del

endif
	
	
	kfreq_VCF = (kfreq_VCF <= $MAX_FREQ? kfreq_VCF : $MAX_FREQ)						;Limit upper freq to 22 Khz
	afreq_VCF interp kfreq_VCF

    aext =  aAmpEnv*gainput_L
    
    
    
 												 
	aRES_VCF interp gkRES_VCF			;k --> a  (filter RESONANCE control)
	
	amp_aux = aRES_VCF^64				;Create an iper-exponential control to scale ad aux oscillator for artificial resonance
	
	ares_aux oscili 0.3*amp_aux, afreq_VCF,30 						;Auxiliary phantom oscillator
	ares_aux= (ares_aux + apink * 0.0025*amp_aux)*aAmpEnv			;Create a complex sig = pink noise + aux and envelope it
	asigf		moogladder	asig+aext,afreq_VCF,gkRES_VCF			;MOOGLADDER filter
	asigf = (asigf * aAmpEnv) + ares_aux							;Composite VCF out : standard out + auxiliary resonance
	
	aout atone asigf,16												;Hi-pass  to remove some DC doing proper wave shape too (r

;----SEND SECTION -----				
			gaREVSEND 	= 2.5*aout*gkMAIN_VOLUME + gaREVSEND 		;Send signal to Reverb 
			gaREVSEND 	= aFM*gkMAIN_VOLUME + gaREVSEND				;Send FM signal to Reverb 
			gaRMSEND  	= 2.5*aout*gkMAIN_VOLUME + gaRMSEND			;Send signal to Ring Modulator 
			gaDELAYSEND = 2.5*aout*gkMAIN_VOLUME + gaDELAYSEND		;Send signal to Ring Modulator 
			gaDELAYSEND = aFM*gkMAIN_VOLUME + gaDELAYSEND			;Send FM signal to Delay 		
			gaDRYSEND = 2.5*aout*gkMAIN_VOLUME + gaDRYSEND			;Send dry signal to CS Mixer
;			
;----- OUPUT SECTION ----------			
aSYNTH_L = 	aout*2.5*gkMAIN_VOLUME									;MAIN LEFT SYNTH Out (controlled by Volume)
aSYNTH_R = 	aSYNTH_L												;MAIN RIGHT SYNTH OUT
					
	outs	aSYNTH_L*gkVOL_ON+aFM,aSYNTH_L*gkVOL_ON+aFM*gkVOL_ON	;SEND SYNTH TO OUT

gkNoteOn = 0														;Clear the NoteOn flag
endin
;===========================================================================================
;===========================================================================================
;===========================================================================================


instr 96;======= DELAY ==========

asigL = gaDELAYSEND   ; Receive audio input from Synth
asigR = asigL
if gkDELAY_SW == 1 then

	kporttime	linseg	0,0.01,0.03							;Base ramp fpr portamento
	ktime		portk	gkdel_time,kporttime				;Smooth
	atime		interp	ktime								;Trasform to a-variable
	aL_OS		vdelay	asigL,(atime*1000)/2,(10*1000)/2	;Delayed Offset of Left CH. (FIRST 'PING')
	;LEFT 
	abuf		delayr	10									;Set max delay Left lenght
	aDelL		deltapi	atime								;Tap delay
	aDelL		tone	aDelL,gkdel_cut						;LP Filtered version of tap
				delayw	aL_OS+(aDelL*gkdel_feed)			;Write signal into delay line
	;RIGHT 
	abuf		delayr	10									;Set max delay Right lenght
	aDelR		deltapi	atime					 			;Tap delay
	aDelR		tone	aDelR,gkdel_cut						;LP Filtered version of tap
				delayw	asigR+(aDelR*gkdel_feed)				;Write signal into delay line
			
	amixL		ntrpol	asigL,aDelL+aL_OS,gkdel_mix			;Mix dry/wet (LEFT)
	amixR		ntrpol	asigR,aDelR,gkdel_mix				;Mix dry/wet (RIGHT)
			outs	amixL*gkdel_lev*gkVOL_ON, amixR*gkdel_lev*gkVOL_ON		;Send DELAY to outbus
			endif
			
clear gaDELAYSEND							;Clear DELAY send variable
endin



instr 97 ;======== RING MODULATOR===========
ain = gaRMSEND   ; Receive audio input from Synth

if gkRMSW == 1 then	; Check general RM ON/OFF switch

gkRMEnv = (gkRM_ENV_SW == 1?  gkRMEnv : 1)	;Check if RM is controlled or not by own envelope
a1 oscilikt 1,gkMODF,10 + gkMODW			;Carrier
aRM = ain * a1 * gkMODX * gkRMEnv			;Ring Modulation
outs aRM*gkVOL_ON, aRM*gkVOL_ON				;Send RM to outbus
endif


clear gaRMSEND					;Clear RM send variable
endin


instr 98;====== SET INIT VALUES  ======
;Init Main Volume
chnset 0.5,"MAIN_VOLUME"
;Init Oscillators Mix Switches
chnset	1,"SWMIX"
chnset	0,"SWMIX2"
;Init Oscillators Individual Level & freq
chnset 1.0,"VOL_OSC_1" 
chnset 1.0,"VOL_OSC_2" 
chnset 1.0,"VOL_OSC_3" 

;Init Filter Parameters
chnset 1.00,"FBASE_VCF"
chnset 0.00,"RES_VCF"
chnset 0.44,"AMOUNT_VCF"

chnset 0.002,"FiltAttTim"
chnset 0.56,"FiltRelTim"
chnset 0.06,"FiltLev"

;Init Amp Envelope
chnset 0.011,"AmpAttTim"
chnset 0.032,"AmpRelTim"
chnset 1.0,"AmpLev"

;Init Reverb
chnset 0.0,"REVSW"
chnset 1.0,"REVSW_TYPE"
chnset 0.4,"REVSEND"
chnset 0.8,"ROOM"
chnset 0.9,"DAMP"

;Init Delay
chnset 0, "DELAY_SW"


;Init Waveshaper (not yet in use)
chnset 0.1, "pre"
chnset 0.5, "post"
chnset 0.1, "positive"
chnset -0.105, "negative"
chnset 0.5, "distin"

;Init Rev
chnset 0,"REVSW"


;Init Master Tune
chnset 0,"MTUNE"
chnset 1,"MTUNE_LED"
chnset 1,"GLIDE_ON"
chnset 1,"DECAY_ON"


;Init Main Out Switch
chnset 1,"VOL_ON"

;Init FFT gain
chnset 2,"gain"

endin


instr 99 ;====== REVERB INSTRUMENT =====

ain_L = gaREVSEND*gkREVSEND


ain_R = ain_L

if gkREVSW_TYPE == 0 then
denorm ain_L,ain_R
aREV_L,aREV_R freeverb ain_L,ain_R, gkROOM,gkDAMP

else

aREV_L,aREV_R reverbsc ain_L,ain_R, gkROOM,gkDAMP*sr/2

endif

gaREV_L= aREV_L*0.8*gkREVSW
gaREV_R= aREV_R*0.8*gkREVSW

outs gaREV_L*gkVOL_ON, gaREV_R*gkVOL_ON
clear gaREVSEND

endin



instr 100;====== TABLE DISPLAY ========

 if changed(gkLFO_WAVE)==1 then
  reinit SEND_SHAPE_LFO_VIEW
SEND_SHAPE_LFO_VIEW:
  		tableicopy	2010,2010+i(gkLFO_WAVE)
  		chnset		"tablenumber(2010)","Waveform_LFO_ID"
 rireturn
 endif
 
 if changed(gkMODW)==1 then
  reinit SEND_SHAPE_RM_VIEW
SEND_SHAPE_RM_VIEW:
 		tableicopy	2010,2010+i(gkMODW) 
 		chnset		"tablenumber(2010)","Waveform_RM_ID"
 rireturn
 endif
 
if changed(gkVEL_CURVE_TYPE)==1 then 
  reinit SEND_SHAPE_MIDIVEL_VIEW 
SEND_SHAPE_MIDIVEL_VIEW:
		tableicopy	1500,1500+i(gkVEL_CURVE_TYPE)
		
		chnset		"tablenumber(1500)","Waveform_MIDIVEL_ID"
		rireturn
	endif
endin



instr 101 ;===== CS MIXER =====


ain = gaDRYSEND

amix = ain + gaREV_L 

 gaFFTSEND = amix  + gaFFTSEND

 clear gaDRYSEND 

endin

instr 110; ====== SPECTRUM DISPLAY =====

 ifftsize	=	2048
 ioverlap	=	ifftsize/4
 iwinsize	=	ifftsize
 iwintype	=	1
	kgain	chnget	"gain" 
ain = gaFFTSEND
fsig	pvsanal	ain*kgain, ifftsize, ioverlap, iwinsize, iwintype 
if	metro(20)==1 then
  kflag	pvsftw fsig, giampFFT
  
 endif
 
 if kflag==1 then
 	 chnset	"tablenumber(501)", "ampFFT"
 endif
 clear gaFFTSEND
endin

</CsInstruments>

<CsScore>

f1 0 1024 10 1						;Sine wave
f2 0 1024  -7 1 512 1 0 0 512 0 	;Positive pulse (50% )
f3 0 1024 7 0 256 1 512 -1 256 0 	;Descending Saw

f6 0 128 7  1 64 1 0 0 64 0 ; compensation curve for distor (non yet used)

; ===== LFO STANDARD WAVEFORM
f11 0 1024 10 1						;Sine
f12 0 1024 7 1 512 1 0 -1 512 -1	;Square
f13 0 1024 7 0 256 1 512 -1 256 0	;Triangle
f14 0 1024 7  1 1024 -1				;Ramp (+/-)
f15 0 1024 7 -1 1024  1				;Ramp (-/+)
f16 0 1024 10  1 0 0 0 0 1			;Hsum
f18 0 1024 10 0						;Dummy table

;======== ALIAS WAVES FOR OSC3 USED AS LFO 
f20 0 1024  7 0 256 1 512 -1 256 0	;Triangle
f21 0 1024  7  1  1024 -1			;Neg - Ramp
f22 0 1024  7  -1  1024 1			;Pos + Ramp
f23 0 1024  7 1 512 1 0 0 512 0     ;Square
f24 0 1024  7 1 308 1 0 0 716 0		;Square PW :0.33
f25 0 1024  7 1 170 1 0 0 854 0		;Square PW :0.165

f30  0 16384 10 1 0.01122 0.01778  	;AUX VCF resonance effect (quasi sine wave)



;===== MIDI VELOCITY MAP CURVES ========
f1500 0 513	-7 0 512 1		;Function to display the next tables (tableicopy 1501 or 1502 or 1503) depending on related combobox 
f1501 0 513	-7 0 512 1		;Linear (LIN) Curve for MIDI Vel.
f1502 0 513 -5 0.0001 513 1	;Harder (EXP) Curve for MIDI Vel.
f1503 0 513 -7 0 32 0.1 32 0.2 64 0.38 128 0.67  128 0.87 64 0.94 64 1 ; Softer (LOG) Curve for MIDI Vel.


;===== WAVE SHAPES FOR OSCILLATOR BANK DISPLAY SELECTOR ===========
f2000 0 64 7 0 16 1 32 -1 16 0  	; Function to display the next tables (f2001 or f2002 or f2003) depending on related combobox
f2001 0 64 7 0 32 1 32  0			; TRIANGLE SHAPE 
f2002 0 64 7 0 40 0.5 0 1 24  0		; TRIANGLE/PEAK SHAPE
f2003 0 64 7 0  64 1 0  0			; RAMP SHAPE

f2004 0 64 7 0 1 1 40 1 0 -1   		;SHAPE SQUARE
f2005 0 64 7 0 1 1 30 1 0 -1 		;SHAPE SQUARE
f2006 0 64 7 0 1 1 18 1 0 -1 		;SHAPE SQUARE

f2007 0 64 7 0 1 1  64 0 0  0
;
;

;===== DUMMY WAVE SHAPES FOR LFO WAVEFORM DISPLAY SELECTOR ===========
f2010 0 64 10 1						;Function to display the next tables   

f2011 0 64 10 1
f2012 0 64 7 0 1 1 31 1 1 -1 29 -1 1 0 
f2013 0 64 7 0 16 1 32 -1 16 0 
f2014 0 64 7 0 1 1  61 -1 1 0 
f2015 0 64 7 0 1 -1  61 1 1 0 
f2016 0 64 10 1 0 0 0 0 1
f2017 0 64 -7 -0.8 8 -0.8  0 -0.6 8 -0.6 0  -0.4  8 -0.4  0 -0.2 8 -0.2 0 0 8 0 0 0.2 8 0.2 0 0.4 8 0.4 0 0.6 8 0.6  
f2018 0 64 -7 -0.1 16  -0.1 0 0.5 16 0.5 0 -0.4 16 -0.4 0 0.7 16 0.7


;==============================================================================================
i 2  0.0  [3600*24*365]	;Activate GUI instr. for  1 year
i 3  0.0  [3600*24*365]	;Activate Arpeggiator graphic interface instr.
i 4  0.0  [3600*24*365]	;Activate LFO blinking led instr.
i 5  0.0  [3600*24*365]	;Acrivate TUNER instr.

i 96 0.0  [3600*24*365] ;Activate Delay instr.
i 97 0.0  [3600*24*365]	;Activate RingMod instr.

i 99   0.0 [3600*24*365];Activate REV instr.  
i 100  0.0 [3600*24*365];Activate table display instr.
i 101  0.0 [3600*24*365];Activate the CS Mixer instr.
i 110  0.0 [3600*24*365];Activate Spectrum (FFT) display  instr.

i 98 0 0.01      	;Temporary activate initial parameter set
</CsScore>

</CsoundSynthesizer>
