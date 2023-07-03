<Cabbage>
form size(1100, 780), caption("STRIA_26_VST"), pluginID("st26"), colour(130,170,210),fontcolour("white");,svgpath(".");colour("lightgrey")

;csoundoutput bounds(768, 439, 295, 279)

;======= Micro Event Controls
groupbox bounds(36, 5, 179, 109), text("Micro Event Setting"), colour("blue"),

hslider bounds(45, 69, 161, 16), channel("dur"), text("Dur"), range(0.2, 3., 0.4), colour("cornflowerblue")
hslider bounds(46, 91, 161, 16), channel("rate"), text("Rate"), range(0.17, 0.5, 0.18), colour("cornflowerblue")


xypad bounds(39, 438, 175, 175), channel("pad_X1", "pad_Y1"),rangex(0,1,0.1),rangey(0,1,0.1), text("x:Frq y:Spread"),textcolour("white"),fontcolour("black")
hslider bounds(44, 430, 162, 7),channel("pad_X1"),range(0,1,0.1),;visible(0)
vslider bounds(32, 444, 7, 126),channel("pad_Y1"),range(0,1,0.1),;visible(0)


;======= Mixture Load Display
groupbox bounds(35, 116, 180, 86), text("Mixtur Contour"), colour("blue")
combobox bounds(82, 137, 88, 17), channel("SHAPE"), items("1->1 Flat","1->0 Ramp","0-->1 Ramp","1-->0 Log","0-->1 Log","1-->0 Exp","0-->1 Exp","V-Shape","Inv.V-Shape","DESIGN")
gentable bounds(82, 156, 87, 44), active(1), fill(0), tablenumber(510),zoom(-1), tablecolour("cyan"), tablegridcolour(10,40,10),tablebackgroundcolour(0,60,60),outlinethickness(2)
checkbox channel("DESIGN_LED"), bounds(177, 168, 9, 9), value(0), shape("circle"), colour("red")

;======= Switches On/Off Pads1&2 and Xfade 

;

groupbox bounds(217, 311, 109, 302),colour(80,110,160), text("START"),fontcolour("white")
button bounds(220, 342, 74, 32), channel("ON1"), value(0), text("ON/OFF G1"),shape("square"), colour:0("black"),colour:1("cyan") 
button bounds(220, 392, 74, 32), channel("ON2"), value(0), text("ON/OFF G2"),shape("square"), colour:0("black"),colour:1("gold") 

label bounds(238, 534, 70, 15), text("Xfade"), 
label bounds(240, 497, 70, 15), text("Volume"),
label bounds(236, 585, 82, 11), text("MIDI Keyb. On"), 
;====== Random Generators Controls
groupbox bounds(35, 204, 180, 105), text("Random Gen"), colour("blue"), caption("groupbBox"),
button  bounds(44, 229, 57, 24), text("Ran 1"), channel("RON1"), value(0), shape("square"), colour("lightgreen")
button  bounds(45, 272, 57, 24), text("Ran 2"), channel("RON2"), value(0), shape("square"), colour("lightgreen")
numberbox bounds(45, 252, 55, 13), channel("disp_ran1"), range(-10000, 10000,0,1,0.001),colour("grey")
numberbox bounds(45, 292, 55, 13), channel("disp_ran2"), range(-10000, 10000,0,1,0.001),colour("grey")
rslider bounds(135, 226, 44, 44), channel("ran1amp"), text("Amt1"),colour("gold"), range(0.001, 2.0, 0.11)
rslider bounds(174, 226, 44, 44), channel("ran1vel"), text("Vel1"),colour("gold"), range(0.01, 4.0, 0.3)
rslider bounds(135, 264, 44, 44), channel("ran2amp"), text("Amt2"),colour("gold"), range(0.001, 2.0, 1.0)
rslider bounds(173, 265, 44, 44), channel("ran2vel"), text("Vel2"),colour("gold"), range(0.01, 4.0, 2.0)



;======= Pad1 Voice 1 Params
groupbox bounds(36, 311, 178, 117), text("Voices Param - Pad 1"), colour("blue"), caption("groupbBox"),
vslider bounds(52, 333, 28, 92), channel("vox"),text("#Vx"), range(1, 8, 5), colour("cornflowerblue")
vslider bounds(83, 333, 25, 92), channel("STEP"),text("Stp"), range(1, 9, 1), colour("cornflowerblue")
vslider bounds(113, 333, 26, 91), channel("AT1"),text("At1"), range(0.05, 0.9, 0.9), colour("cornflowerblue")
vslider bounds(141, 333, 24, 92), channel("RE1"),text("Rl1"), range(0.05, 0.9, 0.9), colour("cornflowerblue")
vslider bounds(168, 333, 26, 93), channel("REVSEND1"), text("Rs1"),range(0.0, 1.0, 0.7), colour("orange")


;======= Pad1 Voice 2 Params

groupbox bounds(329, 311, 179, 118), text("Voices Param - Pad2"), colour("blue"), caption("groupbBox")
vslider bounds(354, 332, 25, 90), channel("AT2"),text("At2"), range(0.05, 0.9, 0.9), colour("cornflowerblue")
vslider bounds(407, 332, 26, 91), channel("RE2"),text("Rl2"), range(0.05, 0.9, 0.9), colour("cornflowerblue")
vslider bounds(457, 332, 26, 89), channel("REVSEND2"), text("Rs2"),range(0.0, 1.0, 0.8), colour("orange")




groupbox bounds(36, 615, 179, 103), text("Wave / Leve - Pad1"), colour("blue"),
gentable bounds(46, 655, 47, 30), fill(0), tablenumber(10),zoom(-1),identchannel("TAB1"), tablecolour("cyan"), tablegridcolour(10,40,10),tablebackgroundcolour(0,60,60),outlinethickness(2)
rslider bounds(92, 651, 50, 50), channel("Fun_1"), text("Fun 1"),colour("black"),  range(1.0, 8.0, 1.0),trackercolour("white"),
rslider bounds(151, 652, 50, 50), channel("Lev_1"), text("Lev 1"),colour("black"), range(0.0, 1.0, 0.5),trackercolour("white"),
checkbox bounds(110, 700, 12, 12),channel("SIN_1"), shape("circle"),


;====================== GEOMETRIC GRID COMPILER GUI ====================================
groupbox bounds(217, 5, 291, 197), colour(10,80,90), text("Geometric Spectra Compiler"),

button bounds(436, 53, 60, 25), channel("GEOM"), text("GEOM", "GEOM"),colour:0("silver"),colour:1("silver")
checkbox bounds(436, 41, 60, 10),channel("dispGEOM")
button bounds(436, 78, 60, 16), channel("GEOM_Build"), text("Trigger","On Fly"),colour:0("lightgreen"),colour:1("red")

vslider bounds(244, 24, 18, 130), channel("ratio"),range(1.02, 2.00, 1.5,1,0.01), colour("cornflowerblue"),
;vslider bounds(2, 14, 50, 150), channel("ratio"),range(1.02, 2.00, 1.5,1,0.01), colour("gold"),
label bounds(226, 158, 58, 14),text("User"),fontstyle(2)


numberbox bounds(230, 175, 50, 20), channel("ratio"), range(1.02, 2.00, 1.5,1,0.001)
vslider bounds(374, 25, 18, 130), channel("outf"),range(16.00, 400.0, 50.0), colour("cornflowerblue"),
label bounds(352, 158, 58, 14),text("Fund"),fontstyle(2),fontcolour("cyan")
numberbox bounds(357, 175, 50, 20), channel("outf"), range(16.00, 400.0, 50.0)
rslider bounds(283, 26, 44, 44), channel("num"), text("Num"),colour("gold"), range(1, 10, 35,1,0.1),
numberbox bounds(282, 68, 44, 21), channel("num"),fontstyle(2),range(1, 10, 3,1,0.1),colour("darkgrey")
label bounds(274, 81, 64, 14),text("_________"),fontcolour("white")
rslider bounds(284, 121, 45, 44), channel("den"), text("Den"),colour("gold"), range(1, 10, 2,1,0.1),
numberbox bounds(283, 97, 44, 21), channel("den"),fontstyle(2),range(1, 10, 2,1,0.1),colour("darkgrey")


combobox bounds(424, 172, 70, 17), channel("mode_in"), items("User", "Num/Dem"),
combobox bounds(424, 149, 70, 17), channel("G_fund"), items("Freq", "Octave")
combobox bounds(409, 102, 43, 17), channel("G_key"), items("C","C#","D","D#","E","F","F#","G","G#","A","A#","B")
combobox bounds(453, 102, 43, 17), channel("G_oct"), items("0","1","2","3","4","5","6","7","8")
;;;;;;;;;


;====================== FIBONACCI GRID COMPILER GUI ====================================
groupbox bounds(217, 204, 291, 105),colour(10,80,90), text("Fibonacci Spectra Compiler"),
button bounds(425, 246, 60, 25), channel("FIBO"), text("FIBO", "FIBO"),colour:0("silver"),colour:1("silver")
checkbox bounds(425, 234, 60, 10),channel("dispFIBO"),colour(0,100,255)
button bounds(425, 271, 60, 16), channel("FIBO_Build"), text("Trigger","On Fly"),colour:0("lightgreen"),colour:1("red")


rslider bounds(233, 238, 44, 44), channel("FIB_Start"), text("1st"),colour("gold"), range(1, 50, 7,1,1),
rslider bounds(288, 239, 44, 44), channel("FIB_Fund"), text("Fund"),colour("gold"), range(1, 30, 13,1,1),textcolour("cyan")

xypad bounds(330, 438, 175, 175),channel("pad_X2", "pad_Y2"), rangex(0, 1, 0.5), rangey(0, 1, 0.3), text("x:Frq y:Spread"),textcolour("white"),fontcolour("black")
hslider bounds(222, 510, 100, 25), channel("XFADE"), range(0.0, 1.0, 0.0), colour("white")
groupbox bounds(329, 615, 178, 104), text("Wave / Level - Pad 2"), colour("blue"), caption("groupbBox")
rslider bounds(383, 652, 50, 50), channel("Fun_2"), text("Fun 2"),colour("black"),  range(1.0, 8.0, 1.0),trackercolour("white"),
gentable bounds(338, 655, 47, 30), fill(0), tablenumber(12),zoom(-1),identchannel("TAB2"), tablecolour("cyan"), tablegridcolour(10,40,10),tablebackgroundcolour(0,60,60),outlinethickness(2)
checkbox bounds(402, 700, 12, 12),channel("SIN_2"), shape("circle"),
vslider bounds(328, 444, 7, 126),channel("pad_Y2"),range(0,1,0.1),;visible(0)
hslider bounds(336, 431, 164, 6),channel("pad_X2"),range(0,1,0.1),;visible(0)

;=========== HARMONIC COMPILER GRID GUI ===========================================
groupbox bounds(510, 5, 256, 197), text("Harmonic Spectra Compiler"), colour(10,80,90), caption("groupbBox"),

button bounds(692, 49, 61, 25), channel("HARM"), text("HARM", "HARM"),colour:0("silver"),colour:1("silver")
checkbox bounds(692, 37, 61, 10),channel("dispHARM"),colour("yellow")
button bounds(693, 74, 60, 16), channel("HARM_Build"), text("Trigger","On Fly"),colour:0("lightgreen"),colour:1("red")


vslider bounds(634, 24, 18, 130), channel("ffund"),range(16.0, 400.0, 50.0,0.5,1), colour("cornflowerblue")
label bounds(615, 159, 58, 14),text("Fund"),fontstyle(2),fontcolour("cyan")
vslider bounds(541, 27, 18, 130), channel("exp"), range(-0.1, 0.1, 0.0,1,0.001), colour("cornflowerblue")
label bounds(524, 161, 58, 14),text("Inha"),fontstyle(2)

rslider bounds(577, 72, 44, 44), channel("maxharm"), text("#hrm"),colour("gold"), range(1, 40, 10)
combobox bounds(681, 149, 70, 17), channel("H_fund"), items("Freq", "Octave")
combobox bounds(664, 102, 43, 17), channel("H_key"), items("C","C#","D","D#","E","F","F#","G","G#","A","A#","B")
combobox bounds(708, 102, 43, 17), channel("H_oct"), items("0","1","2","3","4","5","6","7","8")



;======= FM Controls
groupbox bounds(511, 204, 256, 225),colour(39,90,140), text("FM Controls"),

vslider bounds(528, 233, 30, 135), channel("CAR_min"),text("Cmn"), range(1.0, 8.0, 1.0), colour("cornflowerblue")
vslider bounds(556, 233, 32, 135), channel("CAR_max"),text("Cmx"), range(1.0, 8.0, 1.0), colour("cornflowerblue")
vslider bounds(670, 233, 33, 135), channel("MOD_min"),text("Mmn"), range(1.0, 8.0, 1.0), colour("cornflowerblue")
vslider bounds(698, 233, 32, 135), channel("MOD_max"),text("Mmx"), range(1.0, 8.0, 1.0), colour("cornflowerblue")


button bounds(602, 269, 46, 17), channel("cm"), text("Int", "FLoat"),colour:0("green"),colour:1("orange")
button bounds(602, 313, 46, 17), channel("ADSYN"), text("Adsyn", "FM"),colour:0("green"),colour:1("orange")

rslider bounds(536, 372, 44, 44), channel("indx1"), text("Im1"), colour("gold"), range(0.0, 4.0, 1.0),trackercolour("white"),

rslider bounds(677, 369, 44, 44), channel("indx2"), text("Im2"), colour("gold"), range(0.0, 4.0, 1.0),trackercolour("white"),

;button bounds(574, 254, 61, 18), channel("cm"),text("Int", "FLoat"),colour:0("gold"),colour:1("gold")

;button bounds(573, 304, 61, 18), channel("ADSYN","FM"),text("Adsyn", "FM"),colour:0("gold"),colour:1("gold")

;======= Reverb
groupbox bounds(218, 615, 108, 103), text("Reverb"), colour("80,110,160")
rslider bounds(211, 651, 50, 50), channel("ROOM"), text("Len"),colour("black"), range(0.0, 0.99, 0.92),trackercolour("white"),
rslider bounds(247, 651, 50, 50), channel("HF"), text("Hf"),colour("black"), range(0.0, 1.0, 0.5),trackercolour("white"),
rslider bounds(281, 651, 50, 50), channel("REVLEV"), text("Lev"),colour("black"), range(0.0, 1.0, 0.5),trackercolour("white"),

groupbox bounds(510, 432, 258, 287), text("Snapshots"), colour(30,80,100), caption("groupbBox")


checkbox bounds(520, 493, 12, 14), colour("cyan"),shape("round"),channel("L01")
checkbox bounds(540, 493, 14, 14), colour("cyan"),shape("round"),channel("L02")
checkbox bounds(560, 493, 14, 14), colour("cyan"),shape("round"),channel("L03")
checkbox bounds(580, 493, 14, 14), colour("cyan"),shape("round"),channel("L04")
checkbox bounds(600, 493, 14, 14), colour("cyan"),shape("round"),channel("L05")
checkbox bounds(620, 493, 14, 14), colour("cyan"),shape("round"),channel("L06")
checkbox bounds(640, 493, 14, 14), colour("cyan"),shape("round"),channel("L07")
checkbox bounds(660, 493, 14, 14), colour("cyan"),shape("round"),channel("L08")
checkbox bounds(680, 493, 14, 14), colour("cyan"),shape("round"),channel("L09")
checkbox bounds(700, 493, 14, 14), colour("cyan"),shape("round"),channel("L10")
checkbox bounds(720, 493, 14, 14), colour("cyan"),shape("round"),channel("L11")
checkbox bounds(740, 493, 14, 14), colour("cyan"),shape("round"),channel("L12")


checkbox bounds(520, 523, 14, 14), colour("cyan"),shape("round"),channel("L13")
checkbox bounds(540, 523, 14, 14), colour("cyan"),shape("round"),channel("L14")
checkbox bounds(560, 523, 14, 14), colour("cyan"),shape("round"),channel("L15")
checkbox bounds(580, 523, 14, 14), colour("cyan"),shape("round"),channel("L16")
checkbox bounds(600, 523, 14, 14), colour("cyan"),shape("round"),channel("L17")
checkbox bounds(620, 523, 14, 14), colour("cyan"),shape("round"),channel("L18")
checkbox bounds(640, 523, 14, 14), colour("cyan"),shape("round"),channel("L19")
checkbox bounds(660, 523, 14, 14), colour("cyan"),shape("round"),channel("L20")
checkbox bounds(680, 523, 14, 14), colour("cyan"),shape("round"),channel("L21")
checkbox bounds(700, 523, 14, 14), colour("cyan"),shape("round"),channel("L22")
checkbox bounds(720, 523, 14, 14), colour("cyan"),shape("round"),channel("L23")
checkbox bounds(740, 523, 14, 14), colour("cyan"),shape("round"),channel("L24")


checkbox bounds(520, 553, 14, 14), colour("cyan"),shape("round"),channel("L25")
checkbox bounds(540, 553, 14, 14), colour("cyan"),shape("round"),channel("L26")
checkbox bounds(560, 553, 14, 14), colour("cyan"),shape("round"),channel("L27")
checkbox bounds(580, 553, 14, 14), colour("cyan"),shape("round"),channel("L28")
checkbox bounds(600, 553, 14, 14), colour("cyan"),shape("round"),channel("L29")
checkbox bounds(620, 553, 14, 14), colour("cyan"),shape("round"),channel("L30")
checkbox bounds(640, 553, 14, 14), colour("cyan"),shape("round"),channel("L31")
checkbox bounds(660, 553, 14, 14), colour("cyan"),shape("round"),channel("L32")
checkbox bounds(680, 553, 14, 14), colour("cyan"),shape("round"),channel("L33")
checkbox bounds(700, 553, 14, 14), colour("cyan"),shape("round"),channel("L34")
checkbox bounds(720, 553, 14, 14), colour("cyan"),shape("round"),channel("L35")
checkbox bounds(740, 553, 14, 14), colour("cyan"),shape("round"),channel("L36")


checkbox bounds(520, 583, 14, 12), colour("cyan"),shape("round"),channel("L37")
checkbox bounds(540, 583, 14, 12), colour("cyan"),shape("round"),channel("L38")
checkbox bounds(560, 583, 14, 12), colour("cyan"),shape("round"),channel("L39")
checkbox bounds(580, 583, 14, 12), colour("cyan"),shape("round"),channel("L40")
checkbox bounds(600, 583, 14, 12), colour("cyan"),shape("round"),channel("L41")
checkbox bounds(620, 583, 14, 12), colour("cyan"),shape("round"),channel("L42")
checkbox bounds(640, 583, 14, 12), colour("cyan"),shape("round"),channel("L43")
checkbox bounds(660, 583, 14, 12), colour("cyan"),shape("round"),channel("L44")
checkbox bounds(680, 583, 14, 12), colour("cyan"),shape("round"),channel("L45")
checkbox bounds(700, 583, 14, 12), colour("cyan"),shape("round"),channel("L46")
checkbox bounds(720, 583, 14, 12), colour("cyan"),shape("round"),channel("L47")
checkbox bounds(740, 583, 14, 12), colour("cyan"),shape("round"),channel("L48")


label bounds(524, 507, 13, 12), text("1")
label bounds(544, 507, 13, 12), text("2")
label bounds(564, 507, 13, 12), text("3")
label bounds(584, 507, 13, 12), text("4")
label bounds(604, 507, 13, 12), text("5")
label bounds(624, 507, 13, 12), text("6")
label bounds(644, 507, 13, 12), text("7")
label bounds(664, 507, 13, 12), text("8")
label bounds(684, 507, 13, 12), text("9")
label bounds(701, 507, 15, 11), text("10")
label bounds(721, 507, 15, 11), text("11")
label bounds(741, 507, 15, 11), text("12")

label bounds(521, 537, 15, 11), text("13")
label bounds(541, 537, 17, 11), text("14")
label bounds(561, 537, 17, 11), text("15")
label bounds(581, 537, 17, 11), text("16")
label bounds(601, 537, 17, 11), text("17")
label bounds(621, 537, 17, 11), text("18")
label bounds(641, 537, 17, 11), text("19")
label bounds(661, 537, 17, 11), text("20")
label bounds(681, 537, 17, 11), text("21")
label bounds(701, 537, 17, 11), text("22")
label bounds(721, 537, 17, 11), text("23")
label bounds(741, 537, 17, 11), text("24")


label bounds(521, 567, 15, 11), text("25")
label bounds(541, 567, 17, 11), text("26")
label bounds(561, 567, 17, 11), text("27")
label bounds(581, 567, 17, 11), text("28")
label bounds(601, 567, 17, 11), text("29")
label bounds(621, 567, 17, 11), text("30")
label bounds(641, 567, 17, 11), text("31")
label bounds(661, 567, 17, 11), text("32")
label bounds(681, 567, 17, 11), text("33")
label bounds(701, 567, 17, 11), text("34")
label bounds(721, 567, 17, 11), text("35")
label bounds(741, 567, 17, 11), text("36")

label bounds(521, 597, 15, 11), text("37")
label bounds(541, 597, 17, 11), text("38")
label bounds(561, 597, 17, 11), text("39")
label bounds(581, 597, 17, 11), text("40")
label bounds(601, 597, 17, 11), text("41")
label bounds(621, 597, 17, 11), text("42")
label bounds(641, 597, 17, 11), text("43")
label bounds(661, 597, 17, 11), text("44")
label bounds(681, 597, 17, 11), text("45")
label bounds(701, 597, 17, 11), text("46")
label bounds(721, 597, 17, 11), text("47")
label bounds(741, 597, 17, 11), text("48")


hslider bounds(46, 25, 161, 16), channel("band"),text("Spr1"), range(0.01, 400.0, 7.0,0.5,0.0001), colour("cornflowerblue")
hslider bounds(46, 47, 161, 16), channel("band2"),text("Spr2"), range(0.01, 400.0, 7.0,0.5,0.0001), colour("cornflowerblue")
button bounds(242, 562, 72, 20), channel("keyb_SW"),text("Kb Inactive","Kb Active"),colour:0("black"),colour:1("red") 
rslider bounds(235, 437, 71, 65), channel("over"), colour("black"), range(0.0, 1.0, 0.125,0.5,0.01),trackercolour("gray")




checkbox bounds(300, 347, 19, 21), channel("MUTE1"), colour:0(0,0,0), colour:1(255,0,0)
checkbox bounds(300, 398, 19, 21), channel("MUTE2"), colour:0(0,0,0), colour:1(255,0,0))

checkbox bounds(107, 231, 19, 21), channel("RAN1MUTE"), colour("red")
checkbox  bounds(107, 274, 19, 21), channel("RAN2MUTE"), colour("red")


label bounds(294, 377, 32, 11), text("Mute"), 
label bounds(101, 257, 32, 12), text("Mute"), 


;encoder bounds(626, 596, 32, 32),channel("Get"),min(1),max(48),sliderincr(0.5),value(1)






numberbox bounds(51, 728, 64, 30), channel("disp_debug"), range(-10000, 10000,0,1,0.001),colour("yellow"),	fontcolour("maroon"),text("disp_debug"),textcolour("maroon")
checkbox bounds(40, 406, 10, 10), channel("V1"), value(0)
checkbox bounds(40, 396, 10, 10), channel("V2"), value(0)
checkbox bounds(40, 386, 10, 10), channel("V3"), value(0)
checkbox bounds(40, 376, 10, 10), channel("V4"), value(0)
checkbox bounds(40, 366, 10, 10), channel("V5"), value(0)
checkbox bounds(40, 356, 10, 10), channel("V6"), value(0)
checkbox bounds(40, 346, 10, 10), channel("V7"), value(0)
checkbox bounds(40, 336, 10, 10), channel("V8"), value(0)
;
rslider bounds(445, 652, 50, 50), channel("Lev_2"), text("Lev 2"),colour("black"),  range(0.0, 1.0, 0.5),trackercolour("white"),




;===== MIDI

groupbox bounds(769, 5, 293, 306), text("MIDI"),colour(65,110,120) 





;====== SEQUENCER
groupbox bounds(770, 503, 292, 215), text("Snap Morph"), colour(70,90,90),

combobox bounds(902, 77, 90, 16), channel("MIDIVAR_1"), items("Item 1", "Item 2", "Item 3")
combobox bounds(902, 97, 90, 16), channel("MIDIVAR_2"), items("Item 1", "Item 2", "Item 3")
combobox bounds(902, 117, 90, 16), channel("MIDIVAR_3"), items("Item 1", "Item 2", "Item 3")
combobox bounds(902, 137, 90, 16), channel("MIDIVAR_4"), items("Item 1", "Item 2", "Item 3")
combobox bounds(902, 157, 90, 16), channel("MIDIVAR_5"), items("Item 1", "Item 2", "Item 3")
combobox bounds(902, 177, 90, 16), channel("MIDIVAR_6"), items("Item 1", "Item 2", "Item 3")
combobox bounds(902, 197, 90, 16), channel("MIDIVAR_7"), items("Item 1", "Item 2", "Item 3")
combobox bounds(902, 217, 90, 16), channel("MIDIVAR_8"), items("Item 1", "Item 2", "Item 3")
combobox bounds(902, 237, 90, 16), channel("MIDIVAR_9"), items("Item 1", "Item 2", "Item 3")
combobox bounds(902, 257, 90, 16), channel("MIDIVAR_10"), items("Item 1", "Item 2", "Item 3")

button bounds(993, 77, 60, 16), channel("midi_1"), text("Off 1","On 1"),colour:0("black"),colour:1("springgreen")
button bounds(993, 97, 60, 16), channel("midi_2"), text("Off 2","On 2"),colour:0("black"),colour:1("springgreen")
button bounds(993, 117, 60, 16), channel("midi_3"), text("Off 3","On 3"),colour:0("black"),colour:1("springgreen")
button bounds(993, 137, 60, 16), channel("midi_4"), text("Off 4","On 4"),colour:0("black"),colour:1("springgreen")
button bounds(993, 157, 60, 16), channel("midi_5"), text("Off 5","On 5"),colour:0("black"),colour:1("springgreen")
button bounds(993, 177, 60, 16), channel("midi_6"), text("Off 6","On 6"),colour:0("black"),colour:1("springgreen")
button bounds(993, 197, 60, 16), channel("midi_7"), text("Off 7","On 7"),colour:0("black"),colour:1("springgreen")
button bounds(993, 217, 60, 16), channel("midi_8"), text("Off 8","On 8"),colour:0("black"),colour:1("springgreen")
button bounds(993, 237, 60, 16), channel("midi_9"), text("Off 9","On 9"),colour:0("black"),colour:1("springgreen")
button bounds(993, 257, 60, 16), channel("midi_10"), text("Off 10","On 10"),colour:0("black"),colour:1("springgreen")

hslider bounds(846, 79, 60, 11) channel("cc1_lev" ), range(0, 1),
hslider bounds(846, 99, 60, 11) channel("cc2_lev" ), range(0, 1),
hslider bounds(846, 119, 60, 11) channel("cc3_lev" ), range(0, 1),
hslider bounds(846, 139, 60, 11) channel("cc4_lev" ), range(0, 1),
hslider bounds(846, 159, 60, 11) channel("cc5_lev" ), range(0, 1),
hslider bounds(846, 179, 60, 11) channel("cc6_lev" ), range(0, 1),
hslider bounds(846, 199, 60, 11) channel("cc7_lev" ), range(0, 1),
hslider bounds(846, 219, 60, 11) channel("cc8_lev" ), range(0, 1),
hslider bounds(846, 239, 60, 11) channel("cc9_lev" ), range(0, 1),
hslider bounds(846, 259, 60, 11) channel("cc10_lev" ), range(0, 1),

numberbox bounds(814, 78, 32, 13), channel("cc_A"), range(1, 50,0,1,1)
numberbox bounds(814, 98, 32, 13), channel("cc_B"), range(1, 50,0,1,1)
numberbox bounds(814, 118, 32, 13), channel("cc_C"), range(1, 50,0,1,1)
numberbox bounds(814, 138, 32, 13), channel("cc_D"), range(1, 50,0,1,1)
numberbox bounds(814, 158, 32, 13), channel("cc_E"), range(1, 50,0,1,1)
numberbox bounds(814, 178, 32, 13), channel("cc_F"), range(1, 50,0,1,1)
numberbox bounds(814, 198, 32, 13), channel("cc_G"), range(1, 50,0,1,1)
numberbox bounds(814, 218, 32, 13), channel("cc_H"), range(1, 50,0,1,1)
numberbox bounds(814, 238, 32, 13), channel("cc_I"), range(1, 50,0,1,1)
numberbox bounds(814, 258, 32, 13), channel("cc_L"), range(1, 50,0,1,1)

button bounds(774, 78, 40, 12), channel("inv1"),colour("orange"),text("Dir1,Inv1")
button bounds(774, 98, 40, 12), channel("inv2"),colour("orange"),text("Dir2,Inv2")
button bounds(774, 118, 40, 12), channel("inv3"),colour("orange"),text("Dir3,Inv3")
button bounds(774, 138, 40, 12), channel("inv4"),colour("orange"),text("Dir4,Inv4")
button bounds(774, 158, 40, 12), channel("inv5"),colour("orange"),text("Dir5,Inv5")
button bounds(774, 178, 40, 12), channel("inv6"),colour("orange"),text("Dir6,Inv6")
button bounds(774, 198, 40, 12), channel("inv7"),colour("orange"),text("Dir7,Inv7")
button bounds(774, 218, 40, 12), channel("inv8"),colour("orange"),text("Dir8,Inv8")
button bounds(774, 238, 40, 12), channel("inv9"),colour("orange"),text("Dir9,Inv9")
button bounds(774, 258, 40, 12), channel("inv10"),colour("orange"),text("Dir10,Inv10")






hslider bounds(795, 552, 73, 11),channel("TIME"),range(0,120,10)
button bounds(877, 551, 69, 20),channel("STOP"),text("Stop","Stop"), colour:0("lightgreen"),colour:1("lightgreen")
hslider bounds(955, 552, 73, 11),channel("TYPE"),range(-5,5,0)
label bounds(789, 563, 82, 11), text("Morph Time"),fontcolour("silver"),fontstyle("plain")
label bounds(949, 563, 82, 11), text("Morph Type"),fontcolour("silver"),fontstyle("plain")
numberbox bounds(885, 577, 50, 20), channel("transtime"), range(0, 120,0),colour("grey"),fontcolour("white")
button bounds(798, 591, 69, 20),channel("Write"),text("Write Snap","Write Snap"), colour:0("green"),colour:1("green")
button bounds(798, 612, 69, 20),channel("Clear"),text("Clear Snap","Clear Snap"), colour:0("maroon"),colour:1("maroon")
button bounds(798, 633, 69, 20),channel("Save"),text("Save Bank","Save Bank"), colour:0("LightBlue"),colour:1("LightBlue")
combobox bounds(883, 607, 55, 21), channel("Get"), items("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48")								
filebutton bounds(878, 633, 69, 20),channel("_Browse1"),text("BROWSE","BROWSE"), 
button bounds(958, 591, 69, 20),channel("Read"),text("Read Snap","Read Snap"), colour:0("green"),colour:1("green")
button bounds(958, 612, 69, 20),channel("Clearall"),text("Clear All","Clear All"), colour:0("maroon"),colour:1("maroon")
button bounds(957, 633, 69, 20),channel("Load"),text("Load Bank","Load Bank"), colour:0("LightBlue"),colour:1("LightBlue")
;texteditor bounds(776, 694, 282, 17),channel("_Browse1")





groupbox bounds(769, 313, 293, 189), text("Sequencer"), colour("80,100,110"),

;label bounds(512, 720, 555, 17), text(""), align(left), colour("white"), fontcolour("black"), identchannel("stringbox"),fontstyle(2)
texteditor bounds(776, 695, 284, 17), channel("filename_editor"), text(""),colour(70,70,50), fontcolour("white"),fontstyle(2)



</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-d -n -m0
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 128
nchnls = 2

#define  EPSILON #int(sr/ksmps)#

massign 0,0

gi_DEBUG1		init 1111
gi_DEBUG2		init 2222
gkZERO			init 0
gkUNO			init 1

;====== a code from Rory Walsh to extract a file name from afull path
gSfilepath	init	""

opcode FileNameFromPath,S,S		; Extract a file name (as a string) from a full path (also as a string)
 Ssrc	xin				; Read in the file path string
 icnt	strlen	Ssrc			; Get the length of the file path string
 LOOP:					; Loop back to here when checking for a backslash
 iasc	strchar Ssrc, icnt		; Read ascii value of current letter for checking
 if iasc==47 igoto ESCAPE		; If it is a backslash, escape from loop (92 for PC Windows)
 loop_gt	icnt,1,0,LOOP		; Loop back and decrement counter which is also used as an index into the string
 ESCAPE:				; Escape point once the backslash has been found
 Sname	strsub Ssrc, icnt+1, -1		; Create a new string of just the file name
	xout	Sname			; Send it back to the caller instrument
endop
;=====






;gkpad_Y1L	init 0.7
;gkpad_X1L	init 0.2

gkMORPH_FLAG	init 0
gifreq			init 1
gipitchspace	init 2048	;tabella contenente le frequenze (pitchspace)
gispace			init 64	
gind 			init 0		;indice di tabella (pitchspace)
girecompile_G	init 0
giSEQ 			init 0
giPrn 			init 1
giTtran			init 0
giMode			init 0

gksw1 			init 0
gksw2			init 0
gksw3			init 0
gksw4			init 0
gksw5 			init 0
gksw6			init 0
gksw7			init 0
gksw8			init 0

gkfauto1		init 0
gkfauto2		init 0
gkfauto3		init 0
gkfauto4		init 0


gaFFT 			init 0
gaMETER_L 		init 0
gaMETER_R 		init 0
gaREVL			init 0
gaREVR			init 0
gkATK1 			init 1
gkREL1 			init 1
gkenvp 			init 0
gaWRITE_L		init 0
gaWRITE_R		init 0


gaREVREC_L		init 0
gaREVREC_R		init 0


gkval_1_old 	init 0
gkval_2_old 	init 0
gkval_3_old 	init 0
gkval_4_old 	init 0
gkval_5_old 	init 0
gkval_6_old 	init 0
gkval_7_old 	init 0
gkval_8_old 	init 0


gkval_11_old	init 0
gkval_12_old	init 0
gkval_13_old	init 0
gkval_14_old	init 0

gkMIDIVAR_1		init 0
gkMIDIVAR_2		init 0
gkMIDIVAR_3		init 0
gkMIDIVAR_4		init 0
gkMIDIVAR_5		init 0
gkMIDIVAR_6		init 0
gkMIDIVAR_7		init 0
gkM8			init 0 

gkinv_1			init 0
gkinv_2			init 0
gkinv_3			init 0
gkinv_4			init 0
gkinv_5			init 0
gkinv_6			init 0
gkinv_7			init 0
gkinv_8			init 0

gkcc1_lev		init 1
gkcc2_lev		init 1
gkcc3_lev		init 1
gkcc4_lev		init 1
gkcc5_lev		init 1
gkcc6_lev		init 1
gkcc7_lev		init 1
gkcc8_lev		init 1
;

gkSHAPE init 1


gkstop init 0
#define DEFAULT # 0 #
#define SCALEFACTOR1 # 5000 #  
#define SCALEFACTOR2 # 15000 #

; TABELLE PER CONTENERE 48 SNAPSHOT
gisna0 	ftgen 200, 0, gispace, -2, $DEFAULT		;tabella di 48 locazioni (snap01)  Get = 0
gisna1 	ftgen 201, 0, gispace, -2, $DEFAULT		;tabella di 48 locazioni (snap02)  Get = 1
gisna2 	ftgen 202, 0, gispace, -2, $DEFAULT		; etc....
gisna3 	ftgen 203, 0, gispace, -2, $DEFAULT
gisna4 	ftgen 204, 0, gispace, -2, $DEFAULT
gisna5 	ftgen 205, 0, gispace, -2, $DEFAULT
gisna6 	ftgen 206, 0, gispace, -2, $DEFAULT
gisna7 	ftgen 207, 0, gispace, -2, $DEFAULT
gisna8 	ftgen 208, 0, gispace, -2, $DEFAULT
gisna9 	ftgen 209, 0, gispace, -2, $DEFAULT
gisna10 	ftgen 210, 0, gispace, -2, $DEFAULT
gisna11 	ftgen 211, 0, gispace, -2, $DEFAULT
gisna12 	ftgen 212, 0, gispace, -2, $DEFAULT
gisna13 	ftgen 213, 0, gispace, -2, $DEFAULT
gisna14 	ftgen 214, 0, gispace, -2, $DEFAULT
gisna15 	ftgen 215, 0, gispace, -2, $DEFAULT
gisna16 	ftgen 216, 0, gispace, -2, $DEFAULT
gisna17 	ftgen 217, 0, gispace, -2, $DEFAULT
gisna18 	ftgen 218, 0, gispace, -2, $DEFAULT
gisna19 	ftgen 219, 0, gispace, -2, $DEFAULT
gisna20 	ftgen 220, 0, gispace, -2, $DEFAULT
gisna21 	ftgen 221, 0, gispace, -2, $DEFAULT
gisna22 	ftgen 222, 0, gispace, -2, $DEFAULT
gisna23 	ftgen 223, 0, gispace, -2, $DEFAULT
gisna24 	ftgen 224, 0, gispace, -2, $DEFAULT
gisna25 	ftgen 225, 0, gispace, -2, $DEFAULT
gisna26 	ftgen 226, 0, gispace, -2, $DEFAULT
gisna27 	ftgen 227, 0, gispace, -2, $DEFAULT
gisna28 	ftgen 228, 0, gispace, -2, $DEFAULT
gisna29 	ftgen 229, 0, gispace, -2, $DEFAULT
gisna30 	ftgen 230, 0, gispace, -2, $DEFAULT
gisna31 	ftgen 231, 0, gispace, -2, $DEFAULT
gisna32 	ftgen 232, 0, gispace, -2, $DEFAULT
gisna33 	ftgen 233, 0, gispace, -2, $DEFAULT
gisna34 	ftgen 234, 0, gispace, -2, $DEFAULT
gisna35 	ftgen 235, 0, gispace, -2, $DEFAULT
gisna36 	ftgen 236, 0, gispace, -2, $DEFAULT
gisna37 	ftgen 237, 0, gispace, -2, $DEFAULT
gisna38 	ftgen 238, 0, gispace, -2, $DEFAULT
gisna39 	ftgen 239, 0, gispace, -2, $DEFAULT
gisna40 	ftgen 240, 0, gispace, -2, $DEFAULT
gisna41 	ftgen 241, 0, gispace, -2, $DEFAULT
gisna42 	ftgen 242, 0, gispace, -2, $DEFAULT
gisna43 	ftgen 243, 0, gispace, -2, $DEFAULT
gisna44 	ftgen 244, 0, gispace, -2, $DEFAULT
gisna45 	ftgen 245, 0, gispace, -2, $DEFAULT
gisna46 	ftgen 246, 0, gispace, -2, $DEFAULT
gisna47 	ftgen 247, 0, gispace, -2, $DEFAULT



; TABELLA PER CONTENERE LA GRIGLIA DEL PITCH
;gisna300 ftgen 300, 0, gipitchspace, -2, $DEFAULT

;TABELLA PER MODELLARE LA RAMPA DELL'INVILUPPO
gifn6	ftgen   20, 0 , 8192, 20 , 2,  1	; 


; BASIC WAVEFORMS

gifn8	ftgen	8,0,16384,10,1,0,0,0.125,0.25, 0.7, 1, 0.7, 0.25,  0, 0, 0, 0, 0.2, 0.5, 0.7, 0.5, 0.1
gifn7	ftgen	7,0,16384,10,1,0,0,0,0,0,0,0,0.1,0.2,0,0,0,0,1,1,0,0,0,0,0.1,0,0.05
gifn6	ftgen	6,0,16384,10,1,0,0.1,0,0,0,0,0,0,0,1,0,0,0,0.1,0,0,0,0,0,0.1
gifn5	ftgen	5,0,16384,10,1,0,0,0.125,0.25, 0.7, 1, 0.7, 0.25,  0, 0, 0, 0, 0.2, 0.5, 0.7, 0.5, 0.1
gifn4	ftgen	4,0,16384,10,1,0,0,0,0,0,0,0,0.1,0.2,0,0,0,0,0.3,0.31,0,0,0,0,0.1,0,0.05
gifn3	ftgen	3,0,16384,10,1,0,0.1,0,0,0,0,0,0,0,0,0,0,0,0.1,0,0,0,0,0,0.1
gifn2	ftgen	2,0,16384,10,1,0,0,0.01,0,0.03,0.02,0,0,0,0,0,0,0,0.01
gifn1	ftgen	1,0,16384,10,1,0

; TABELLE PER LO SHAPE SPETTRALE
gifn501 ftgen	501,0,8,16, 1,   8,  0, 1    ; flat equiamp spectrum
gifn502 ftgen	502,0,8,16, 1,   8,  0, 0.1  ; linear ramp (1 - 0.1)
gifn503 ftgen	503,0,8,16, 0.1, 8,  0, 1    ; linear ramp (0.1 - 1)
gifn504 ftgen	504,0,8,16, 1,   8,  2, 0.1  ; log up (1 - 0.1)
gifn505 ftgen	505,0,8,16, 0.1, 8, -2, 1    ; log dwn (0.1 - 1)
gifn506 ftgen	506,0,8,16, 1,   8, -2, 0.1  ; exp up (1 - 0.1)
gifn507 ftgen	507,0,8,16, 0.1, 8,  2, 1    ; exp dwn (0.1 - 1)
gifn508 ftgen	508,0,8,16, 1,   4,  0, 0.1, 4, 0, 1  ; V-shaped ramp (1 - 0.1 - 1)
gifn509 ftgen	509,0,8,16, 0.1, 4,  0, 1, 4, 0, 0.1  ; TRI-shaped ramp (1 - 0.1 - 1)







;====================== INPUT VIRTUAL SURFACE CONTROL PARAMETERS ==========
instr 1
;
gkxfade_0		chnget "XFADE"
gkxfade 		port gkxfade_0, 0.05

;outvalue "disp_G1LEV", 1 - gkxfade
;outvalue "disp_G2LEV", gkxfade


gkON_1	chnget "ON1"
gkON_2	chnget "ON2"
gkRON_1	chnget "RON1"
gkRON_2	chnget "RON2"



;gkWRSN	chnget "WRSN"
;gkRDSN	chnget "RDSN"
;gkSVBN	chnget "SVBN"
;gkLDSN	chnget "LDSN"
;
;===== GRID COMPILERS WIDGETS =====


;
;========= GEOM RELATED ============
gkGEOM			chnget "GEOM"		;GEOM creator - Button 
gkGEOM_Build 	chnget "GEOM_Build"	;GEOM build mode (On the fly / Trigger)- Button
;
gk_outf 		chnget "outf"		;GEOM base frequency (Freq mode)- Vslider 
gk_ratio 		chnget "ratio"		;GEOM User freq. ratio (User ratio mode)- Vslider
gk_num			chnget "num"		;GEOM numerator (num/dem mode) - Rslider
gk_den			chnget "den"		;GEOM denominator (num/dem mode)- Rslider

gkmode_in		chnget "mode_in"	;GEOM mode selector (User ratio/num-den) - Combo box


gk_G_fund		chnget "G_fund"		;GEOM freq. mode (Freq/ Octave)- Combo box

gk_G_oct		chnget "G_oct"		;GEOM octave selector - Combo box

gk_G_key		chnget "G_key"		;GEOM key(note)selector - Combo box
;====================================
gkHARM			chnget "HARM"
gkHARM_Build 	chnget "HARM_Build"	;HARM build mode (On the fly / Trigger)- Button
gk_H_fund		chnget "H_fund"
gk_H_oct		chnget "H_oct"
gk_H_key		chnget "H_key"
;
gk_ffund		chnget "ffund"
gk_exp			chnget "exp"
gk_maxharm		chnget "maxharm"

;============================
gkFIBO			chnget "FIBO"
gkFIBO_Build 	chnget "FIBO_Build"	;FIBO build mode (On the fly / Trigger)- Button

gkFIB_Start		chnget "FIB_Start"
gkFIB_Fund		chnget "FIB_Fund"
;
;
gkover_0		chnget "over"
gkover 			port gkover_0, 1
;
gk_CAR_min		chnget "CAR_min"
gk_CAR_max		chnget "CAR_max"
gk_MOD_min		chnget "MOD_min"
gk_MOD_max		chnget "MOD_max"
gk_cm			chnget "cm"
gk_ADSYN		chnget "ADSYN"
;

;gkpad_Y1L 		= gkpad_Y1
;gkpad_X1L 		= gkpad_X1			; limit gkpad_X1, 0.0,1.0									;gkpad_X1L 	limit gkpad_X1, 0.001,1

gkpad_Y1L		chnget "pad_Y1"
gkpad_X1L		chnget "pad_X1"
gkran1_amp		chnget "ran1amp"
gkran1_vel		chnget "ran1vel"
gkfun1			chnget "Fun_1"
gkATK1			chnget "AT1"
gkREL1			chnget "RE1"
gkREVSEND1		chnget "REVSEND1"
;
gkstep			chnget "STEP"
gklev_1			chnget "Lev_1"
gkindx1			chnget "indx1"
gkSHAPE			chnget "SHAPE"

;
gkvoi			chnget "vox"
gkvoi_i  = 	int (gkvoi)
;
gkpad_Y2		chnget "pad_Y2"
gkpad_X2		chnget "pad_X2"
gkpad_Y2L 		limit gkpad_Y2, 0,1	
gkpad_X2L 		limit gkpad_X2, 0,1
gkran2_amp		chnget "ran2amp"
gkran2_vel		chnget "ran2vel"
gkfun2			chnget "Fun_2"
gkATK2			chnget "AT2"
gkREL2			chnget "RE2"
gkREVSEND2		chnget "REVSEND2"
gklev_2			chnget "Lev_2"
gkindx2			chnget "indx2"
;
;
gkband			chnget "band"
gkband2			chnget "band2"
gkdur			chnget "dur"
gkrate			chnget "rate"
;
;
gkREVLEV		chnget	"REVLEV"
gkROOM			chnget	"ROOM"
gkHF			chnget	"HF"
;
gkmute1			chnget  "MUTE1"
gkmute2			chnget  "MUTE2"
;
gkran1_mute		chnget	"RAN1MUTE"
gkran2_mute		chnget	"RAN2MUTE"


;gkpad_Y1L		chnget "pad_Y1"
;gkpad_X1L		chnget "pad_X1"

gkWrite			chnget "Write"
gkClear			chnget "Clear"
gkSave			chnget "Save"
gSfilepath		chnget "_Browse1"
gSfile 			chnget "filename_editor"
;
;
;gknum_fib		chnget "NUMFIB"
;
gkGet			chnget "Get"
;
gkTYPE			chnget "TYPE"
;gkTrans			chnget "read_snap"
gkTIME			chnget "TIME"
;
;gkBYSTTIME		chnget "BYSTTIME"
;
;gkgrid_morph 	chnget "grid_morph"
;
gkkeyb_SW		chnget "keyb_SW"
;
;
;gkrectime		chnget "rectime"
;
;
;gkin_index		chnget "in_index"
;gkin_readend	chnget "in_readend"
;gkin_readton	chnget "in_readton"
;gkin_readsnap	chnget "in_readsnap"
;gkin_readtran	chnget "in_readtran"
;gkin_readtype	chnget "in_readtype"
;
;
;
;
;
;gknum_den = gk_num/gk_den
;outvalue "disp_numdem", gknum_den
;outvalue "disppad_Y1", gkpad_Y1L
;outvalue "disppad_X1", gkpad_X1L
;outvalue "metervoi", gkvoi_i/8


;chnset gk_ADSYN, "led_ADSYN"
;chnset 1 - gk_ADSYN, "led_FM"
;
;chnset 1 - gk_cm, "led_INT"
;chnset gk_cm, "led_FLOAT"




;===================== SHOW ACTIVE INSTR
;kactive active 151
;outvalue "active", kactive


endin

instr	2   ; ==============  Switches control center
;	
;
;
ktrigGEOM	changed gkGEOM					;Call Geometric Grid Compiler (instr 10)
if ktrigGEOM ==1 then
 schedkwhen ktrigGEOM,0,1, 10, 0, 0.1 
endif  
   
   
ktrigHARM	changed gkHARM					;Call Harmonic Grid Compiler (instr 12)
if ktrigHARM ==1 then
 schedkwhen ktrigHARM,0,1, 12, 0, 0.1 
endif  

ktrigFIBO	changed gkFIBO					;Call Fibonacci Grid Compiler (instr 13)
if ktrigFIBO ==1 then
 schedkwhen ktrigFIBO,0,1, 13, 0, 0.1 
endif  


   
;	ktrigHARM	changed gkHARM
;	ktrigFIBO	changed	gkFIBO
;	ktrigWRSN	changed gkWRSN
;	ktrigRDSN	changed gkSVBN
;	ktrigLDSN	changed gkLDSN


;

;schedkwhen ktrigHARM, 0, 1, 12, 0, 1
;schedkwhen ktrigFIBO, 0, 1, 13, 0, 1
;schedkwhen ktrigWRSN, 0, 1,100, 0, 1
;
;
;
endin
;
;
instr 3

k1 init 1
k0 init 0

if gkvoi_i == 1 kgoto V1
if gkvoi_i == 2 kgoto V2
if gkvoi_i == 3 kgoto V3
if gkvoi_i == 4 kgoto V4
if gkvoi_i == 5 kgoto V5
if gkvoi_i == 6 kgoto V6
if gkvoi_i == 7 kgoto V7
if gkvoi_i == 8 kgoto V8
kgoto next


V1:
chnset k1, "V1"
chnset k0, "V2"
chnset k0, "V3"
chnset k0, "V4"
chnset k0, "V5"
chnset k0, "V6"
chnset k0, "V7"
chnset k0, "V8"
kgoto next

V2:
chnset k1, "V1"
chnset k1, "V2"
chnset k0, "V3"
chnset k0, "V4"
chnset k0, "V5"
chnset k0, "V6"
chnset k0, "V7"
chnset k0, "V8"
kgoto next

V3:
chnset k1, "V1"
chnset k1, "V2"
chnset k1, "V3"
chnset k0, "V4"
chnset k0, "V5"
chnset k0, "V6"
chnset k0, "V7"
chnset k0, "V8"
kgoto next

V4:
chnset k1, "V1"
chnset k1, "V2"
chnset k1, "V3"
chnset k1, "V4"
chnset k0, "V5"
chnset k0, "V6"
chnset k0, "V7"
chnset k0, "V8"
kgoto next

V5:
chnset k1, "V1"
chnset k1, "V2"
chnset k1, "V3"
chnset k1, "V4"
chnset k1, "V5"
chnset k0, "V6"
chnset k0, "V7"
chnset k0, "V8"
kgoto next

V6:
chnset k1, "V1"
chnset k1, "V2"
chnset k1, "V3"
chnset k1, "V4"
chnset k1, "V5"
chnset k1, "V6"
chnset k0, "V7"
chnset k0, "V8"
kgoto next

V7:
chnset k1, "V1"
chnset k1, "V2"
chnset k1, "V3"
chnset k1, "V4"
chnset k1, "V5"
chnset k1, "V6"
chnset k1, "V7"
chnset k0, "V8"
kgoto next

V8:
chnset k1, "V1"
chnset k1, "V2"
chnset k1, "V3"
chnset k1, "V4"
chnset k1, "V5"
chnset k1, "V6"
chnset k1, "V7"
chnset k1, "V8"
next:

if gkGEOM_Build == 1 then  ; If "GEOM On the Fly" is active 

if gkmode_in == 1 then		; if Freq is selected

ktrig_GEOM changed gk_ratio,gk_outf,gk_G_oct,gk_G_key ; sense if the listed k-variables are moved

else
ktrig_GEOM changed gk_ratio,gk_outf,gk_G_oct,gk_G_key,gk_num,gk_den ;sense num/dem also 
endif


if ktrig_GEOM == 1 then
schedkwhen ktrig_GEOM, 0,1,10,0,0.1
endif



 endif 



if gkHARM_Build == 1 then
ktrig_HARM changed gk_ffund,gk_exp,gk_H_oct,gk_H_key

if ktrig_HARM == 1 then
schedkwhen ktrig_HARM, 0,1,12,0,0.1
endif
 endif 
 
 
 if gkFIBO_Build == 1 then
ktrig_FIBO changed gkFIB_Start,gkFIB_Fund

if ktrig_FIBO == 1 then
schedkwhen ktrig_FIBO, 0,1,13,0,0.2
endif
 endif 
 
 
endin

;
;=======================  GEOM. SPECTRA GENERATOR ==================
instr 10

;inum init 1
;iden init 1


chnset 1, "dispGEOM"
chnset 0, "dispHARM"
chnset 0, "dispFIBO"
ind init 0



iG_fund  = i(gk_G_fund)-1 
i_G_oct  = i(gk_G_oct) -1
i_G_key  = i(gk_G_key) -1
imode_in = i(gkmode_in) -1
i_outf = i(gk_outf)

if (iG_fund == 1)  then
	i_int_note = i_G_oct + 4
	i_decimal_note = i_G_key * 0.01
	inote = i_int_note + i_decimal_note
 
	ifreq = cpspch (inote)

 else

  ifreq init i_outf ;

endif

 


ifreq0 = ifreq



;gkmode_in = gkmode_in -1
imode_in = i(gkmode_in )-1



inum_0 = i(gk_num)
iden_0 = i(gk_den)

inum = inum_0;int(inum_0)
iden = iden_0;int(iden_0)

if inum<= iden && imode_in==1 igoto stop

iratio = inum/iden



if imode_in == 1 then
iratio = (inum/iden)
else
iratio = i(gk_ratio)
endif



if ifreq <= 0 igoto stop
if iratio < 1 goto stop





do:
ifreq = ifreq0 * iratio^ind		; Geometric Formula
;if ifreq > sr/2 goto stop
;print ind,ifreq
if ind >=16 igoto stop
tabw_i	ifreq, ind, 300
tabw_i	ifreq, ind, 301


gifreq = ifreq
ind = ind + 1
gind = ind	; copia il valore massimo dell'indice in gind

igoto do

stop:
;ifreq = ifreq_old
gisw_G = 1
gisw_H = 0
gisw_F = 0
;
;print gind
turnoff
;
;
endin

;=============== HARMONIC SPECTRA GENERATOR ======================
;
instr 12
chnset 0, "dispGEOM"
chnset 1, "dispHARM"
chnset 0, "dispFIBO"

ind init 0
iH_fund = i(gk_H_fund)		;legge lo stato dello switch di modo per l'immisione della freq. fond.
iH_oct  = i(gk_H_oct) -1
iH_fund = i(gk_H_fund)-1
iH_key  = i(gk_H_key)-1
imaxharm = i(gk_maxharm)

;
if (iH_fund == 1)  then
	i_int_note = iH_oct + 4
	i_decimal_note = iH_key * 0.01
	inote = i_int_note + i_decimal_note
;	
ifund = cpspch (inote)
ifreq0 = ifund

;
else
ifreq0 = 0
ifund = i(gk_ffund)
endif
;

;
iexp = i(gk_exp)

icurfreq = ifund
;
do:
;
if ind > (imaxharm - 1) igoto stop
gifreq = icurfreq
ind = ind + 1
iexpval pow (ind ), (1+iexp)
icurfreq = ifund * iexpval 
tabw_i	icurfreq, ind - 1, 300
tabw_i	icurfreq, ind - 1, 301
gind = ind
gifreq = icurfreq
;

igoto do

stop:

;outvalue "H_fre", ifreq0
;outvalue "led_G", 0
;outvalue "led_H", 1
;outvalue "led_F", 0
gisw_G = 0
gisw_H = 1
gisw_F = 0
;
turnoff
;
endin
;
instr 13;=============== FIBONACCI ===========
chnset 0, "dispGEOM"
chnset 0, "dispHARM"
chnset gkUNO, "dispFIBO"

index init 0
iPHI init (1 + sqrt(5))/2
ifNY init sr*0.5

istart  	= 	i(gkFIB_Start)
ifund   	= 	i(gkFIB_Fund)

;
ifreq = istart


do:

ifreq_old = ifreq

ifreq = ifund * ((iPHI ^(index + istart) - (1 - iPHI)^(index + istart))/ sqrt(5))
;print ifreq,index
;if ifreq >= 10000 igoto stop
if index > 10 igoto stop ;!!!!!! only for debug
tableiw	ifreq, index, 300
tableiw	ifreq, index, 301
;print index , ifreq
gifreq = ifreq
index = index + 1
gind = index	; make a copy of index into gind

igoto do

stop:
gisw_G = 0
gisw_H = 0
gisw_F = 1

turnoff

endin
;

;
instr 21;======= Random Gen. 1

	if gkRON_1 == 1 then
	
	
	gkfauto1 randh (1-gkran1_mute) * gkpad_X1L * gkran1_amp*25000, gkran1_vel

chnset gkfauto1, "disp_ran1"
else
gkfauto1 = 0
chnset gkfauto1, "disp_ran1"
endif

endin

;
instr 22
if gkRON_2 == 1 then
;	
	gkfauto2 randh (1-gkran2_mute)*gkpad_X2L * gkran2_amp*25000, gkran2_vel
chnset gkfauto2, "disp_ran2"
else
gkfauto2 = 0
chnset gkfauto2, "disp_ran2"
endif
endin
;
instr 60 ;============ Wavetable (Func) Morph

kindex port gkfun1 - 1, 0.2

ftmorf  kindex, 9,10

kindex2 port gkfun2 - 1, 0.2
ftmorf  kindex2, 9,12

if gkfun1 > 1 then
chnset gkZERO, "SIN_1"
elseif gkfun1 == 1 then
chnset gkUNO,"SIN_1"
endif

if gkfun2 > 1 then
chnset gkZERO, "SIN_2"
elseif gkfun1 == 1 then
chnset gkUNO,"SIN_2"
endif

ktrig1 changed gkfun1

if ktrig1!=0 then
chnset "tablenumber(10)","TAB1"
endif

ktrig2 changed gkfun2

if ktrig2!=0 then
chnset "tablenumber(12)","TAB2"
endif

endin


;
;=========================== ACCENDE LED SNAPSHOT =========
instr 70
inum = i(gkGet) ; +1
;print inum
knum init inum


if knum == 01 then
	chnset gkUNO,"L01"
elseif knum == 02 then
	chnset gkUNO,"L02"
elseif knum == 03 then
	chnset gkUNO,"L03"
elseif knum == 04 then
	chnset gkUNO,"L04"
elseif knum == 05 then
	chnset gkUNO,"L05"
elseif knum == 06 then
	chnset gkUNO,"L06"
elseif knum == 07 then
	chnset gkUNO,"L07"
elseif knum == 08 then
	chnset gkUNO,"L08"
elseif knum == 09 then
	chnset gkUNO,"L09"
elseif knum == 10 then
	chnset gkUNO,"L10"
elseif knum == 11 then
	chnset gkUNO,"L11"
elseif knum == 12 then
	chnset gkUNO,"L12"
elseif knum == 13 then
	chnset gkUNO,"L13"
elseif knum == 14 then
	chnset gkUNO,"L14"
elseif knum == 15 then
	chnset gkUNO,"L15"
elseif knum == 16 then
	chnset gkUNO,"L16"
elseif knum == 17 then
	chnset gkUNO,"L17"
elseif knum == 18 then
	chnset gkUNO,"L18"
elseif knum == 19 then
	chnset gkUNO,"L19"
elseif knum == 20 then
	chnset gkUNO,"L20"
elseif knum == 21 then
	chnset gkUNO,"L21"
elseif knum == 22 then
	chnset gkUNO,"L22"
elseif knum == 23 then
	chnset gkUNO,"L23"
elseif knum == 24 then
	chnset gkUNO,"L24"
elseif knum == 25 then
	chnset gkUNO,"L25"
elseif knum == 26 then
	chnset gkUNO,"L26"
elseif knum == 27 then
	chnset gkUNO,"L27"
elseif knum == 28 then
	chnset gkUNO,"L28"
elseif knum == 29 then
	chnset gkUNO,"L29"
elseif knum == 30 then
	chnset gkUNO,"L30"
elseif knum == 31 then
	chnset gkUNO,"L31"
elseif knum == 32 then
	chnset gkUNO,"L32"
elseif knum == 33 then
	chnset gkUNO,"L33"
elseif knum == 34 then
	chnset gkUNO,"L34"
elseif knum == 35 then
	chnset gkUNO,"L35"
elseif knum == 36 then
	chnset gkUNO,"L36"
elseif knum == 37 then
	chnset gkUNO,"L37"
elseif knum == 38 then
	chnset gkUNO,"L38"
elseif knum == 39 then
	chnset gkUNO,"L39"
elseif knum == 40 then
	chnset gkUNO,"L40"
elseif knum == 41 then
	chnset gkUNO,"L41"
elseif knum == 42 then
	chnset gkUNO,"L42"
elseif knum == 43 then
	chnset gkUNO,"L43"
elseif knum == 44 then
	chnset gkUNO,"L44"
elseif knum == 45 then
	chnset gkUNO,"L45"
elseif knum == 46 then
	chnset gkUNO,"L46"
elseif knum == 47 then
	chnset gkUNO,"L47"
elseif knum == 48 then
	chnset gkUNO,"L48"
else
;
endif
;
turnoff

;
endin

;======================== SWITCH OFF SNAPSHOT LED AND CLEAR 1st VALUE =================
instr 71
inum = i(gkGet)
;print 0071,inum
if     inum == 1 then
	chnset gkZERO,"L01"
	vtabwi	0, 200, 0
elseif inum == 2 then
	chnset gkZERO,"L02"
	vtabwi	0, 201, 0
elseif inum == 3 then
	chnset gkZERO,"L03"
	vtabwi	0, 202, 0
elseif inum == 4 then
	chnset gkZERO,"L04"
	vtabwi	0, 203, 0
elseif inum == 5 then
	chnset gkZERO,"L05"
	vtabwi	0, 204, 0
elseif inum == 6 then
	chnset gkZERO,"L06"
	vtabwi	0, 205, 0
elseif inum == 7 then
	chnset gkZERO,"L07"
	vtabwi	0, 206, 0
elseif inum == 8 then
	chnset gkZERO,"L08"
	vtabwi	0, 207, 0
elseif inum == 9 then
	chnset gkZERO,"L09"
	vtabwi	0, 208, 0
elseif inum == 10 then
	chnset gkZERO,"L10"
	vtabwi	0, 209, 0
	
elseif inum == 11 then
	chnset gkZERO,"L11"
	vtabwi	0, 210, 0
elseif inum == 12 then
	chnset gkZERO,"L12"
	vtabwi	0, 211, 0
elseif inum == 13 then
	chnset gkZERO,"L13"
	vtabwi	0, 212, 0
elseif inum == 14 then
	chnset gkZERO,"L14"
	vtabwi	0, 213, 0
elseif inum == 15 then
	chnset gkZERO,"L15"
	vtabwi	0, 214, 0
elseif inum == 16 then
	chnset gkZERO,"L16"
	vtabwi	0, 215, 0
elseif inum == 17 then
	chnset gkZERO,"L17"
	vtabwi	0, 216, 0
elseif inum == 18 then
	chnset gkZERO,"L18"
	vtabwi	0, 217, 0
elseif inum == 19 then
	chnset gkZERO,"L19"
	vtabwi	0, 218, 0
elseif inum == 20 then
	chnset gkZERO,"L20"
	vtabwi	0, 219, 0	
elseif inum == 21 then
	chnset gkZERO,"L21"
	vtabwi	0, 220, 0
elseif inum == 22 then
	chnset gkZERO,"L22"
	vtabwi	0, 221, 0
elseif inum == 23 then
	chnset gkZERO,"L23"
	vtabwi	0, 222, 0
elseif inum == 24 then
	chnset gkZERO,"L24"
	vtabwi	0, 223, 0
elseif inum == 25 then
	chnset gkZERO,"L25"
	vtabwi	0, 224, 0
elseif inum == 26 then
	chnset gkZERO,"L26"
	vtabwi	0, 225, 0
elseif inum == 27 then
	chnset gkZERO,"L27"
	vtabwi	0, 226, 0
elseif inum == 28 then
	chnset gkZERO,"L28"
	vtabwi	0, 227, 0
elseif inum == 29 then
	chnset gkZERO,"L29"
	vtabwi	0, 228, 0
elseif inum == 30 then
	chnset gkZERO,"L30"
	vtabwi	0, 229, 0
	
elseif inum == 31 then
	chnset gkZERO,"L31"
	vtabwi	0, 230, 0
elseif inum == 32 then
	chnset gkZERO,"L32"
	vtabwi	0, 231, 0
elseif inum == 33 then
	chnset gkZERO,"L33"
	vtabwi	0, 232, 0
elseif inum == 34 then
	chnset gkZERO,"L34"
	vtabwi	0, 233, 0
elseif inum == 35 then
	chnset gkZERO,"L35"
	vtabwi	0, 234, 0
elseif inum == 36 then
	chnset gkZERO,"L36"
	vtabwi	0, 235, 0
elseif inum == 37 then
	chnset gkZERO,"L37"
	vtabwi	0, 236, 0
elseif inum == 38 then
	chnset gkZERO,"L38"
	vtabwi	0, 237, 0
elseif inum == 39 then
	chnset gkZERO,"L39"
	vtabwi	0, 238, 0
	
elseif inum == 40 then
	chnset gkZERO,"L40"
	vtabwi	0, 239, 0
elseif inum == 41 then
	chnset gkZERO,"L41"
	vtabwi	0, 240, 0
elseif inum == 42 then
	chnset gkZERO,"L42"
	vtabwi	0, 241, 0
elseif inum == 43 then
	chnset gkZERO,"L43"
	vtabwi	0, 242, 0
elseif inum == 44 then
	chnset gkZERO,"L44"
	vtabwi	0, 243, 0
elseif inum == 45 then
	chnset gkZERO,"L45"
	vtabwi	0, 244, 0
elseif inum == 46 then
	chnset gkZERO,"L46"
	vtabwi	0, 245, 0
elseif inum == 47 then
	chnset gkZERO,"L47"
	vtabwi	0, 246, 0
elseif inum == 48 then
	chnset gkZERO,"L48"
	vtabwi	0, 247, 0	
endif		


turnoff


endin


;
;
instr 99 ; ===== Scheduler for Write /Read Snap/Clear Snap

ktrig_write changed gkWrite
if ktrig_write!=0 then

 schedkwhen ktrig_write,0,1,100,0,0.1
endif

ktrig_clear changed gkClear
if ktrig_clear!=0 then

 schedkwhen ktrig_clear,0,1,71,0,-1
endif


if changed:k(gSfilepath)==1 then
Smessage sprintfk "text(%s)",gSfilepath
chnset Smessage,"filename_edit"
endif

ktrig changed gkSave
if ktrig == 1 then
schedkwhen ktrig,0,1,300,0,0.1
endif
endin

;==============================   SAVE PARAMETERS  SNAP USED WITH TRANSITION   
instr 100 
;

print 9090 



schedule 70, 0, -1

index = i(gkGet)-1
;
vtabwi 0,200  + index\
,i(gkband),   i(gkrate),   i(gkdur),    i(gk_CAR_min),   i(gk_CAR_max), i(gk_MOD_min), i(gk_MOD_max), i(gkindx1)\
,i(gkindx2),  i(gklev_1),		i(gklev_2),		i(gkran1_amp),		i(gkran2_amp),		i(gkran1_vel), 		i(gkran2_vel), 		i(gkvoi)\
,i(gkstep),		i(gkfun1),		i(gkfun2),		i(gkpad_X1L),		i(gkpad_Y1L),		i(gkpad_X2L),		i(gkpad_Y2L),		i(gkover_0)\
,i(gkREVLEV),	i(gkROOM),		i(gkHF),		i(gkATK1),			i(gkATK2),			i(gkREL1),			i(gkREL2),			i(gkREVSEND1)\
,i(gkREVSEND2),	i(gkxfade),		i(gkSHAPE),		i(gkTIME),			i(gkTYPE),			i(gkmute1),			i(gkmute2),			i(gk_cm)\
,i(gk_ADSYN),	i(gkGEOM),		i(gkHARM),		i(gkFIBO),			i(gk_ratio),		i(gk_num),			i(gk_den),			i(gkmode_in)\
,i(gk_outf),	i(gk_G_fund),	i(gk_G_oct),	i(gk_G_key),		i(gk_ffund),		i(gk_exp),			i(gk_maxharm), i(gk_H_fund)\
,i(gk_H_oct),	i(gk_H_key),	i(gkFIB_Start),	i(gkFIB_Fund),		i(gkran1_mute),		i(gkran2_mute)
;
;
turnoff
endin
;
;=====================
;
;instr 101	; CALLING INSTRUMENT 1

instr 101

if gkON_1 == 0 kgoto nogen 

reset:
;
itime = 	i(gkrate)		;legge velocità di generazione grani
gidur = 	i(gkdur)		;legge durata dei grani
iatk	= 	i(gkATK1)		;reads and freeze attack time
irel	= 	i(gkREL1)		;reads and freeze release time

istep_0		= i(gkstep)		;reads step value
istep		= int(istep_0)	;cast to integer
ifauto1		= i(gkfauto1);  >>>>>>>>>>>>>>> da attivare !!!!

;>>>>>> codice per la tastiera MIDI da inserire
;>>>>>> 

nokeyb:
kpad_X1L = gkpad_X1L*gind
if1gr = abs(int(i(kpad_X1L))); scale X PAD1 on variable gind		;scale X PAD1 on variable gind
;printk2 kpad_X1L
nxt:
kpad_X1L = gkpad_X1L*gind
if1gr = i(kpad_X1L)	; sscale X PAD1 on variable gind

if1gr_int = int(if1gr)


gif1 tab_i		if1gr,300			; reads 1st partial freq.
gif2 tab_i		if1gr_int +        istep, 300	;reads 2nst
gif3 tab_i		if1gr_int +    2 * istep, 300	;..
gif4 tab_i		if1gr_int +    3 * istep, 300	;..
gif5 tab_i		if1gr_int +    4 * istep, 300	;..
gif6 tab_i		if1gr_int +    5 * istep ,300	;..
gif7 tab_i		if1gr_int +    6 * istep, 300	;..
gif8 tab_i		if1gr_int +    7 * istep, 300	;legge il valore di frequenza dell



gifreq_ref1 = gif1 + ifauto1	;add random 1 to 1st partial
gifreq_ref2 = gif2 + ifauto1	;add random 1 to 2nd partial
gifreq_ref3 = gif3 + ifauto1 ;..
gifreq_ref4 = gif4 + ifauto1
gifreq_ref5 = gif5 + ifauto1
gifreq_ref6 = gif6 + ifauto1
gifreq_ref7 = gif7 + ifauto1
gifreq_ref8 = gif8 + ifauto1

;print gif1 ,gif2 ,gif3 ,gif4 ,gif5 ,gif6 ,gif7 ,gif8 
irand_dev1 = i(gkpad_Y1L)		;reads  Y PAD1  and set frequency deviation
ilev_1 tab_i 	i(gklev_1)*0.5,20,1 ; set Lev1 to non linear

timout 0,itime,cont	;START TIME scheduler of each grain
reinit reset

cont:
schedule 151, 0, (4.1-gidur), gifreq_ref1, irand_dev1,ilev_1, gifreq_ref2, gifreq_ref3, gifreq_ref4,gifreq_ref5, gifreq_ref6, gifreq_ref7, gifreq_ref8,iatk,irel


;-------------  test

;ktrig metro 1/gkrate

;schedkwhen ktrig, 0,0,151,0,gkdur

;-------------- end test
nogen:

endin

;==============================
;
instr 102		;CALLING INSTRUMENT 2
;
if gkON_2 == 0 kgoto nogen
reset:
itime = 	i(gkrate)		;legge velocità di generazione grani
gidur = 	i(gkdur)		;legge durata dei grani
iatk2 = 	i(gkATK2)		;legge attack time inviluppo grani
irel2 = 	i(gkREL2)		;legge release time invilppo grani
ifun2 =		i(gkfun2)

;
;print itime, gidur, iatk2,irel2,ifun2
;turnoff
;
kpad_X2L 		= gkpad_X2L* 2500
ifreq_ref2 		= i(kpad_X2L)+ i(gkfauto2)
irand_dev2 		= i(gkpad_Y2L)
ilev_2 tab_i i(gklev_2)*0.5,20,1


timout 0,itime,cont		;START TIME schedulator 
reinit reset		


cont:
;
;
;if gksw2 = 1 goto go
;outvalue "led2", 0
;turnoff
;go:
;outvalue "led2", 1
							schedule  152, 0, (4.1-gidur),ifreq_ref2,irand_dev2,ilev_2,iatk2,irel2,ifun2




nogen:
endin
;
;
;
 
instr   151       ;=====================CALLED INSTRUMENT 1   (GRANULAR STYLE COMPLEX FM/ADD GRID)



ilev = p6

irandfreq   = birnd(p5)			;extracts random number for freq. dev.

ichan = birnd(1)					;extracts random number for stereo distrib.
ileft = (ichan <= 0 ? 1 : 0)
iright = (ichan > 0 ? 1 : 0)
iSHAPE = i(gkSHAPE)

icar  random	i(gk_CAR_min), i(gk_CAR_max);extracts random number for	car_min
imod  random 	i(gk_MOD_min), i(gk_MOD_max) ;extracts random number for car_max


icar = (i(gk_cm) = 0 ?  int(icar) : icar)	;select if use integer or float values
imod = (i(gk_cm) = 0 ?  int(imod) : imod)

iindex random 0,i(gkindx1)					;extracts random number for modulation index


itab510_step = ftlen(510)/7 			;compute the SHAPE step when custom table (128 vals) is selected

itab_SHAPE = 500+iSHAPE				

if iSHAPE == 10 then
chnset 1,"DESIGN_LED"
iampH1 tab_i 0, 510						;shape in amplitude 1st voice (tab 510)
iampH2 tab_i 1*itab510_step, 510		;shape in amplitude 2nd voice (tab 510)
iampH3 tab_i 2*itab510_step, 510
iampH4 tab_i 3*itab510_step, 510
iampH5 tab_i 4*itab510_step, 510
iampH6 tab_i 5*itab510_step, 510
iampH7 tab_i 6*itab510_step, 510
iampH8 tab_i ftlen(510)-1, 510		;shape in amplitude 2nd voice (tab 510)
else
chnset 0,"DESIGN_LED"
iampH1 tab_i 0, itab_SHAPE		;shape in amplitude 1st voice
iampH2 tab_i 1, itab_SHAPE		;shape in amplitude 2nd voice 
iampH3 tab_i 2, itab_SHAPE
iampH4 tab_i 3, itab_SHAPE
iampH5 tab_i 4, itab_SHAPE
iampH6 tab_i 5, itab_SHAPE
iampH7 tab_i 6, itab_SHAPE
iampH8 tab_i 7, itab_SHAPE		;shape in amplitude 2nd voice 
endif



iat  = p3 * p14						;set attack time
irel = p3 * p15						;set release
ion  = p3 - (iat+irel)					;set duration
invoices  = i(gkvoi_i)					;set number of simultaneous voices


								;k1	linen ilev, iat,p3,irel
								;kindex  linseg 0,p3/2,iindex,p3/2,0

kindex  cosseg 0,p3/2,iindex,p3/2,0		;FM modulation index envelope
;ak1	  linen ilev, iat,p3,irel			;amplitude envelope



;ak1	transeg 0,p3/2,2,ilev,p3/2,2,0
;ak1	transeg 0,p3/2,2,ilev, p3/2,2,0   ;  amplitude envelope (as in AFM8)
ak1	cosseg 0,p3/2,ilev, p3/2,0
if i(gk_ADSYN)  == 1 goto ADSYN

FM:

if invoices == 1 goto FMvoices1
if invoices == 2 goto FMvoices2
if invoices == 3 goto FMvoices3
if invoices == 4 goto FMvoices4
if invoices == 5 goto FMvoices5
if invoices == 6 goto FMvoices6
if invoices == 7 goto FMvoices7


FMvoice8:

a1	foscili iampH1*ak1,p4+irandfreq*gkband, icar,imod, kindex, 10
a2	foscili iampH2*ak1,p7+irandfreq*gkband, icar,imod, kindex, 10
a3	foscili iampH3*ak1,p8+irandfreq*gkband, icar,imod, kindex, 10
a4	foscili iampH4*ak1,p9+irandfreq*gkband, icar,imod, kindex, 10
a5	foscili iampH5*ak1,p10+irandfreq*gkband, icar,imod, kindex, 10
a6	foscili iampH6*ak1,p11+irandfreq*gkband, icar,imod, kindex, 10
a7	foscili iampH7*ak1,p12+irandfreq*gkband, icar,imod, kindex, 10
a8	foscili iampH8*ak1,p13+irandfreq*gkband, icar,imod, kindex, 10



aout sum a1,a2,a3,a4,a5,a6,a7,a8
goto outsum

FMvoices7:

a1	foscili iampH1*ak1,p4+irandfreq*gkband, icar,imod, kindex, 10
a2	foscili iampH2*ak1,p7+irandfreq*gkband, icar,imod, kindex, 10
a3	foscili iampH3*ak1,p8+irandfreq*gkband, icar,imod, kindex, 10
a4	foscili iampH4*ak1,p9+irandfreq*gkband, icar,imod, kindex, 10
a5	foscili iampH5*ak1,p10+irandfreq*gkband, icar,imod, kindex, 10
a6	foscili iampH6*ak1,p11+irandfreq*gkband, icar,imod, kindex, 10
a7	foscili iampH7*ak1,p12+irandfreq*gkband, icar,imod, kindex, 10


aout sum a1,a2,a3,a4,a5,a6,a7
goto outsum

FMvoices6:

a1	foscili iampH1*ak1,p4+irandfreq*gkband, icar,imod, kindex, 10
a2	foscili iampH2*ak1,p7+irandfreq*gkband, icar,imod, kindex, 10
a3	foscili iampH3*ak1,p8+irandfreq*gkband, icar,imod, kindex, 10
a4	foscili iampH4*ak1,p9+irandfreq*gkband, icar,imod, kindex, 10
a5	foscili iampH5*ak1,p10+irandfreq*gkband, icar,imod, kindex, 10
a6	foscili iampH6*ak1,p11+irandfreq*gkband, icar,imod, kindex, 10


aout sum a1,a2,a3,a4,a5,a6
goto outsum

FMvoices5:

a1	foscili iampH1*ak1,p4+irandfreq*gkband, icar,imod, kindex, 10
a2	foscili iampH2*ak1,p7+irandfreq*gkband, icar,imod, kindex, 10
a3	foscili iampH3*ak1,p8+irandfreq*gkband, icar,imod, kindex, 10
a4	foscili iampH4*ak1,p9+irandfreq*gkband, icar,imod, kindex, 10
a5	foscili iampH5*ak1,p10+irandfreq*gkband, icar,imod, kindex, 10


aout sum a1,a2,a3,a4,a5
goto outsum

FMvoices4:

a1	foscili iampH1*ak1,p4+irandfreq*gkband, icar,imod, kindex, 10
a2	foscili iampH2*ak1,p7+irandfreq*gkband, icar,imod, kindex, 10
a3	foscili iampH3*ak1,p8+irandfreq*gkband, icar,imod, kindex, 10
a4	foscili iampH4*ak1,p9+irandfreq*gkband, icar,imod, kindex, 10

aout sum a1,a2,a3,a4
goto outsum

FMvoices3:

a1	foscili iampH1*ak1,p4+irandfreq*gkband, icar,imod, kindex, 10
a2	foscili iampH2*ak1,p7+irandfreq*gkband, icar,imod, kindex, 10
a3	foscili iampH3*ak1,p8+irandfreq*gkband, icar,imod, kindex, 10


aout sum a1,a2,a3
goto outsum

FMvoices2:

a1	foscili iampH1*ak1,p4+irandfreq*gkband, icar,imod, kindex, 10
a2	foscili iampH2*ak1,p7+irandfreq*gkband, icar,imod, kindex, 10


aout sum a1,a2
goto outsum

FMvoices1:

a1	foscili iampH1*ak1,p4+irandfreq*gkband, icar,imod, kindex, 10


aout sum a1
goto outsum

ADSYN:


if invoices == 1 goto ADvoices1
if invoices == 2 goto ADvoices2
if invoices == 3 goto ADvoices3
if invoices == 4 goto ADvoices4
if invoices == 5 goto ADvoices5
if invoices == 6 goto ADvoices6
if invoices == 7 goto ADvoices7

ADvoices8:

a1	oscili iampH1*ak1,p4+irandfreq*gkband, 10
a2	oscili iampH2*ak1,p7+irandfreq*gkband, 10
a3	oscili iampH3*ak1,p8+irandfreq*gkband, 10
a4	oscili iampH4*ak1,p9+irandfreq*gkband, 10
a5	oscili iampH5*ak1,p10+irandfreq*gkband, 10
a6	oscili iampH6*ak1,p11+irandfreq*gkband, 10
a7	oscili iampH7*ak1,p12+irandfreq*gkband, 10
a8	oscili iampH8*ak1,p13+irandfreq*gkband, 10



aout sum a1,a2,a3,a4,a5,a6,a7,a8
goto outsum

ADvoices7:

a1	oscili iampH1*ak1,p4+irandfreq*gkband, 10
a2	oscili iampH2*ak1,p7+irandfreq*gkband, 10
a3	oscili iampH3*ak1,p8+irandfreq*gkband, 10
a4	oscili iampH4*ak1,p9+irandfreq*gkband, 10
a5	oscili iampH5*ak1,p10+irandfreq*gkband, 10
a6	oscili iampH6*ak1,p11+irandfreq*gkband, 10
a7	oscili iampH7*ak1,p12+irandfreq*gkband, 10


aout sum a1,a2,a3,a4,a5,a6,a7
goto outsum


ADvoices6:

a1	oscili iampH1*ak1,p4+irandfreq*gkband, 10
a2	oscili iampH2*ak1,p7+irandfreq*gkband, 10
a3	oscili iampH3*ak1,p8+irandfreq*gkband, 10
a4	oscili iampH4*ak1,p9+irandfreq*gkband, 10
a5	oscili iampH5*ak1,p10+irandfreq*gkband, 10
a6	oscili iampH6*ak1,p11+irandfreq*gkband, 10


aout sum a1,a2,a3,a4,a5,a6
goto outsum


ADvoices5:

a1	oscili iampH1*ak1,p4+irandfreq*gkband, 10
a2	oscili iampH2*ak1,p7+irandfreq*gkband, 10
a3	oscili iampH3*ak1,p8+irandfreq*gkband, 10
a4	oscili iampH4*ak1,p9+irandfreq*gkband, 10
a5	oscili iampH5*ak1,p10+irandfreq*gkband, 10


aout sum a1,a2,a3,a4,a5
goto outsum

ADvoices4:

a1	oscili iampH1*ak1,p4+irandfreq*gkband, 10
a2	oscili iampH2*ak1,p7+irandfreq*gkband, 10
a3	oscili iampH3*ak1,p8+irandfreq*gkband, 10
a4	oscili iampH4*ak1,p9+irandfreq*gkband, 10


aout sum a1,a2,a3,a4
goto outsum

ADvoices3:

a1	oscili iampH1*ak1,p4+irandfreq*gkband, 10
a2	oscili iampH2*ak1,p7+irandfreq*gkband, 10
a3	oscili iampH3*ak1,p8+irandfreq*gkband, 10


aout sum a1,a2,a3
goto outsum

ADvoices2:

a1	oscili iampH1*ak1,p4+irandfreq*gkband, 10
a2	oscili iampH2*ak1,p7+irandfreq*gkband, 10


aout sum a1,a2
goto outsum

ADvoices1:

a1	oscili iampH1*ak1,p4+irandfreq*gkband, 10


aout sum a1



outsum:
aL = (1-gkmute1) * gkover * aout * $SCALEFACTOR1 * ileft * (1 - gkxfade)
aR = (1-gkmute1) * gkover * aout * $SCALEFACTOR1 * iright * (1 - gkxfade)

aL dcblock aL
aR dcblock aR
	outs	aL, aR 
	
	
gaFFT = gaFFT + aL
gaREVL= gaREVL + aL * gkREVSEND1
gaREVR=gaREVR + aR * gkREVSEND1

gaMETER_L = gaMETER_L + aL
gaMETER_R = gaMETER_R + aR

gaWRITE_L = gaWRITE_L + aL
gaWRITE_R = gaWRITE_R + aR


;gaCONV_L = gaCONV_L + aL
;gaCONV_R = gaCONV_R + aR

;aenv cosseg 0,p3/4,1,p3/2,1,p3/4,0
;a1 oscili 0.1,ifreq
;agrain = a1 * aenv 
;outs agrain*5000,agrain*5000
endin




instr 152;=================

;print p3,p4,p5,p6,p7,p8,p9

ilev = p6
ifun = p9


irandfreq   = birnd(p5)
ichan = birnd(1)
ileft = (ichan <= 0 ? 1 : 0)
iright = (ichan > 0 ? 1 : 0)
;
icar  random	i(gk_CAR_min), i(gk_CAR_max)			;6,14
imod  random  	i(gk_MOD_min), i(gk_MOD_max)		 ;5,13
;
;
icar = (i(gk_cm) = 0 ?  int(icar) : icar)
imod = (i(gk_cm) = 0 ?  int(imod) : imod)
;
iindex random 0,i(gkindx2)
;
;
iat = p3 * p7
irel = p3 * p8
ion = p3 - (iat+irel)
;
ak1		linen ilev, iat,p3,irel
kindex	linseg 0,p3/2,iindex,p3/2,0
;chnset kindex,"disp_debug"
;
;
a1	foscil ak1,p4+irandfreq*gkband2, icar,imod, kindex, 12
;
aL = gkover * a1 * $SCALEFACTOR2 * ileft  * (1- gkmute2)*gkxfade
aR = gkover * a1 * $SCALEFACTOR2 * iright * (1 - gkmute2)*gkxfade
;aL dcblock aL
;aR dcblock aR
	outs	aL,aR	;  Audio to DAC -  outs PAD N. 2
;
gaREVL = gaREVL + aL * gkREVSEND2
gaREVR = gaREVR + aR * gkREVSEND2


endin






instr 300; ========== SAVE BANK ==========


printf  "---> '%s' \n", 1, gSfile
ftsave gSfile	,1  ,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215\
			        ,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231\
			        ,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247
;
;
;
;kpos strindexk	String_Read,"."		;Get point position inside string
;
;SubString	strsubk String_Read, 0, kpos	;Get the name before point
;
;
;Sfile_MIDISetup  strcat SubString, "_MIDI.txt"   ;Concatenate with _MIDI.txt to make the name
;
;
;
;
;
;
;ftsave Sfile_MIDISetup, 1, 11
;
turnoff
endin
;

;
instr 900;-----> REVERB

ainL = gaREVL
ainR = gaREVR
denorm ainL
denorm ainR
;arevL, arevR 	freeverb  ainL, ainR, gkROOM, gkHF

gkROOM 		port gkROOM, 0.1
gkHF		port gkHF,0.1
gkREVLEV 	port gkREVLEV, 0.1
arevL, arevR reverbsc ainL, ainR, gkROOM*0.995, gkHF * sr/2
outs arevL*gkREVLEV, arevR*gkREVLEV	;  Audio to DAC -  REVERB out 	

gaREVREC_L = arevL*gkREVLEV
gaREVREC_R = arevR*gkREVLEV

gaREVL= 0
gaREVR = 0
endin




</CsInstruments>



<CsScore>
f1 0 16384 10 1

f9  	0 8 -2 1 2 3 4 5 6 7 8	; Contiene i numeri di tabelle interessate da ftmorf
f10		0 16384 10 1			;Tabella dove avviene il morph
f12 	0 16384 10 1
f11 	0 16 -2 22 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0


f300   0 2048 -2 0  ; contiene la grid pitch generata da pannello
f301   0 2048 -2 0	; copia della precedente
f302	 0 2048 -2 0	; contiene la grid pitch calcolata dopo la lettura snap
f303	 0  2   -2  301 302 ; lista


f510	0 128 -7 1  64 0.7 32 0.9 32 0

f701  0  2   -2  703 704  ; contiene la lista per il morph dei parametri (2 tabelle)
f702  0  64  10  1			; dove avviene il morph (on importa qui il contenuto)
f703  0  64  -2  0  		; prima tabella 
f704  0  64  -2  0			; seconda tabella

f800 0   32 7 1 15 1 1 -1 15 -1
;             y/n On  Prn  Tt 
f900 0 512 -2 0;  1   0   10  10 -1     1  0  20  10 -1      1  10  1  10 1     1  0   21  20 0     0  0   28  20 4    
f901 0 512 -2 0
f902 0 512 -2 0

f1000 0 512 7 1 64 1 0 0 448 0


i1 0 36000
i2 0 36000
i21 0 36000
i22 0 36000
i60 0 36000

i99 0 36000
i101 0 36000
i102 0 36000
i3 0 36000
;i60 0 36000

i900 0 36000





</CsScore>

</CsoundSynthesizer>--