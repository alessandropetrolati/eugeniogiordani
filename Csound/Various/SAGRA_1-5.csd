



<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr 		= 44100	
ksmps 	= 128
nchnls 	= 2		
0dbfs	= 1		


;Ver 1.4
;File reload bug fixed !

;=========
;Ver 1.3 to  1.4
;1) Sono stati aggiunti nei preset gli switch relativi a 
;a) Grain Env b)  Rev Single/random  c) ScanOn/Off  d) Direction  e) Resonator Mute 

;==========
;Ver 1.2
;Aggiunto salvataggio preset 
;Morphing


;========
;Ver. 1.1
;1) migliorata la stabilità durante il cambio file
;2) aggiunta una funzione  a doppio decadimento come inviluppo dei grani (menu Grain Env)
;3) display immediato della nuova forma d'onda caricata all'avvio
;4) Avvio tramito pulsante Play/Pause e arresto con pulsante Stop
;5) Reset immediato del pitch del campione  (pulsante x1)
;6) Display del numero di canali del file caricato (display verde a sx della barra di fase manuale)
;7) Display numerico della fase automatica (display giallo sotto direction)

gipreset_1 ftgen 200, 0, 32, -2, 0		;Table 200 for Preset_1
gipreset_2 ftgen 201, 0, 32, -2, 0		;Table 201 for Preset_2
gipreset_3 ftgen 202, 0, 32, -2, 0		;..
gipreset_4 ftgen 203, 0, 32, -2, 0		;..
gipreset_5 ftgen 204, 0, 32, -2, 0		;..
gipreset_6 ftgen 205, 0, 32, -2, 0		;..
gipreset_7 ftgen 206, 0, 32, -2, 0		;..
gipreset_8 ftgen 207, 0, 32, -2, 0		;Table 207 for Preset_8


;gival init 10000
gkmorphflag init 0	
gaREVSEND_L init 0
gaREVSEND_R init 0
gaRESON_SEND init 0

gkmute init 1
;gkvolume init 0.5


instr	10	;========= GUI =========

if gkmorphflag == 1 kgoto next
	
ktrig metro 16
if ktrig !=0 then
gkscanon 			invalue "scanon"
gkvelscan 			invalue "vel"
gkdens_0 			invalue "dens"
gkdensrand 			invalue "densrand"
gkdur 				invalue "dur"
gkrnv				invalue "grnv"



gkdirection 		invalue "direction"
gkranphase 			invalue "ranphase"
gkranpitch 			invalue "ranpitch"

gkrevsend 			invalue "revsend"	;Rev Send
gkrevlen  			invalue "revlen"		;Rev Length
gkHF				invalue "HF"							;Rev HF

gkdur_rand			invalue "dur_rand"
gkrev_mode 			invalue "rev_mode"

gkF0 				invalue "F0"
gkBW 				invalue "BW"
gkSEP 				invalue "SEP"
gkRESLEV 			invalue "RESLEV"
gkRESMUTE 			invalue "RESMUTE"
gkFRANGE			invalue "FRANGE"

gkcut				invalue "cut"
gkcut_rand			invalue "cut_rand"

endif

gkphase 			invalue "phase"
gksync				invalue "sync"

gklevel				invalue "level"
gkdetune_0 			invalue "detune"
gkvol				invalue "vol"
gklisten 			invalue "listen"
next:

gkWm		  		invalue "Wm"				; Read value from Menu widget (selects the one of the 8 bank)
gkstop		  		invalue "stop"			; Read stop button value
gkmorph_time 		invalue "morph_time"		; Read morph_time value
gktype		  		invalue "type"			; Read type transition value


gkdetune = semitone (gkdetune_0)
;

gkdens = 1+(gkdens_0^1.5)*399


outvalue "densdisp", gkdens

	
endin



instr	1

 
	Sfile_new		strcpy	""											;
	Sfile			invalue	"_Browse"
	Sfile_old		strcpyk	Sfile_new
	Sfile_new		strcpyk	Sfile
	kfile 		strcmpk	Sfile_new, Sfile_old

	kSwitch		changed	 kfile									
	if	kSwitch=1	then													
		reinit	UPDATE												
	endif
	UPDATE:
	
	
	gifnL		ftgentmp	 0, 0, 0, 1, Sfile,0,0,1								;READ MONO OR STEREO AUDIO FILE CHANNEL 1
	;print gifnL
outvalue "LNAME", gifnL

	
ichan  filenchnls Sfile

outvalue "nchan", ichan 
	
	gifilelen	=		nsamp(gifnL)										;DERIVE SOUNDFILE LENGTH (IN SAMPLES)

;print ichan	,gifilelen
	giphasfreq	=		sr/ (ftlen(gifnL))
			
			;print gifilelen
			
			
			
			gkphase init 0
			
			
			rireturn
			
			

ksign = (gkdirection == 0? 1 : -1)


ktrigsync changed  gkphase, gksync
if ktrigsync == 1 && gksync == 1 then 
reinit UPDATEPHASE
endif

UPDATEPHASE:
gkautophase phasor giphasfreq*gkscanon*ksign*gkvelscan, i(gkphase)


outvalue "autophase",gkautophase
rireturn

endin



instr 2; ==================== GRAIN SCHEDULER ==================


krand_dens random -200,200

kdur_mod   random -gkdur_rand, gkdur_rand
kdur = gkdur + kdur_mod*gkdur


ktrig metro  gkdens+krand_dens*gkdensrand							; Generate timing for grain schedule
schedkwhen ktrig,0,0,3,0,kdur			; Schedule grain



endin


instr 3 ; ================= GRAIN GENERATOR  ===============
seed 0
idetune = i(gkdetune)
iscanon = i(gkscanon)
imanphase = i(gkphase) 
iautophase = i(gkautophase)

ienvmenu = i(gkrnv)

iranphase random -i(gkranphase), i(gkranphase)
iphase = (iranphase+iautophase*iscanon + imanphase*(1-iscanon))* gifilelen

irandet random -0.5,4
iranpos random 0,1
irev_single 	random 0,1


idetune = idetune + irandet*i(gkranpitch)

giFDELTA random -i(gkFRANGE),i(gkFRANGE)
gkFDELTA = k(giFDELTA)

if ienvmenu == 6 then
iranoffset  random 2,7
itabenv = int(iranoffset)
;
else
itabenv = ienvmenu + 2
endif
;
;print iranoffset,itabenv

irancut random -1,1
iran_fcut = i(gkcut)*irancut
iran_fcut = (iran_fcut <20? 20 : iran_fcut)
iran_fcut = (iran_fcut >20000? 20000 : iran_fcut)

aenv poscil3 1,1/(p3-0.5/kr),itabenv


aL_0 lposcil 1,idetune,0,0,gifnL,iphase
aL  tonex aL_0, gkcut+iran_fcut,2

alevel interp gklevel

agrainL = aL*aenv*iranpos*alevel*gkmute
agrainR = aL*aenv*(1-iranpos)*alevel*gkmute


outs agrainL, agrainR



if gkrev_mode == 0 then

gaREVSEND_L = gaREVSEND_L + agrainL
gaREVSEND_R = gaREVSEND_R + agrainR


else

gaREVSEND_L = gaREVSEND_L + agrainL * irev_single
gaREVSEND_R = gaREVSEND_R + agrainR * irev_single




endif

gaRESON_SEND = gaRESON_SEND + (agrainL+agrainR)*0.5


endin



instr 4 ; ====== Play Sample =======


iphase init i(gkphase)

aL lposcil gklisten*gkvol,1,0,0,gifnL,iphase*gifilelen
kphase phasor giphasfreq,iphase
outvalue "phasenorm", kphase


outs aL, aL


endin


instr 5 ; ======= AUTO-MUTE MANAGER ====

gkmute = (gklisten ==1?  0 : 1)


endin


instr 11; ========== Write Preset ===========

print 9999
vtabwi 0,200 + i(gkWm),\
i(gkdetune_0),i(gkdens_0),i(gkdur),i(gkphase),\
i(gkranpitch),i(gkdensrand),i(gkdur_rand),\
i(gklevel),i(gkrevsend),i(gkrevlen),i(gkHF),\
i(gkvelscan),i(gkranphase),\
i(gkRESLEV),i(gkF0),i(gkBW),i(gkSEP),i(gkFRANGE),\
i(gkscanon),i(gkdirection), i(gkrev_mode),i(gkrnv),i(gkRESMUTE) ; index 18 - 19 - 20 - 21 one shot parameters			
turnoff
endin

instr 12; ========= Read Preset  ============
ipreset_index = i(gkWm)

if i(gkmorphflag) == 0 then   ;>>>> AVOID THE MULTIPLE CALL OF INSTR 30 <<<<<
; Fill table 703 with the current values of the parameters
vtabwi 0,703,\
i(gkdetune_0),i(gkdens_0),i(gkdur),i(gkphase),\
i(gkranpitch),i(gkdensrand),i(gkdur_rand),\
i(gklevel),i(gkrevsend),i(gkrevlen),i(gkHF),\
i(gkvelscan),i(gkranphase),\
i(gkRESLEV),i(gkF0),i(gkBW),i(gkSEP),i(gkFRANGE),\
i(gkscanon),i(gkdirection), i(gkrev_mode),i(gkrnv),i(gkRESMUTE) ; index 18 - 19 - 20 - 21




tableicopy	704, 200 + ipreset_index   ; Make a copy of current preset table into table 704

iSCANON 		table 	18,	200 + ipreset_index
iDIRECTION 		table 	19,	200 + ipreset_index
iREV_MODE		table 	20,	200 + ipreset_index
iRNV			table	21,	200 + ipreset_index
iRESMUTE		table  	22,	200 + ipreset_index

outvalue "scanon",		iSCANON
outvalue "direction", iDIRECTION
outvalue "rev_mode", 	iREV_MODE
outvalue "grnv", 		iRNV
outvalue "RESMUTE", 	iRESMUTE


 
schedule 30, 0.05, -1 ; 			>>> TURN ON MORPH INSTR FOR INFINITE TIME ONLY IF gkmorphflag == 0 <<<<<< 
endif					;			>>> A slight delay is necessay to avoid strange behavior in transition of binary variables			
endin




instr 20;	==================== Save Bank Instr.  =====================						
Sfile_name	 invalue "_Browse1"
ftsave Sfile_name ,1,200,201,202,203,204,205,206,207
turnoff
endin

instr 21;	==================== Load Bank Instr.  =====================						
Sfile_name	 invalue "_Browse1"
ftload Sfile_name	, 1,200,201,202,203,204,205,206,207
turnoff
endin

instr 30; ================  Morphing Instrument  ====================

gkstop init 0									;Reset the Stop value flag	
kTr    init 0									;Reset the normalized transition envelope 
gkmorphflag = 1								;>>>>>SET MORPH CONTROL FLAG TO 1 <<<<<<
imorph_time = i(gkmorph_time)+ 0.001 			;Read the real morphing time in seconds plus a small offset

itype = i(gktype)



ktime timeinsts								;>>>>>READ ABSOLUTE TIME IN SEC. FROM INSTR START <<<<<<<


gkstop invalue  "stop"							; Read Stop Button value
kTr 	transeg 0, imorph_time, itype, 1		; Create normalized envelope function for preset transition
klintime line 0,imorph_time,1
outvalue "Tr_disp",kTr * imorph_time			; Display the current time during transition
outvalue "lintime_disp",klintime
ftmorf kTr, 701, 702							; Preset morphing


												; Read All k-variables into ftable 702
vtabk 0,702,\
gkdetune_0,gkdens_0,gkdur,gkphase,\
gkranpitch,gkdensrand,gkdur_rand,\
gklevel,gkrevsend,gkrevlen,gkHF,\
gkvelscan,gkranphase,\
gkRESLEV,gkF0,gkBW,gkSEP,gkFRANGE

												; Update widgets during transition
outvalue "detune", gkdetune_0
outvalue "dens", gkdens_0						
outvalue "dur", gkdur
outvalue "ranpitch", gkranpitch
outvalue "densrand",gkdensrand
outvalue "dur_rand", gkdur_rand
outvalue "level", gklevel
outvalue "revsend", gkrevsend
outvalue "revlen", gkrevlen
outvalue "HF", gkHF 
outvalue "vel", gkvelscan
outvalue "ranphase", gkranphase
outvalue "RESLEV",gkRESLEV
outvalue "F0",gkF0
outvalue "BW",gkBW
outvalue "SEP",gkSEP
outvalue "phase",gkphase
outvalue "FRANGE",gkFRANGE

 if gkstop == 1  then							; Check stop button value: if gkstop == 1 stop transition
									
   gkmorphflag = 0
   turnoff										; Turnoff intrument
 endif
   
if ktime <= gkmorph_time then					;>>>>> CONTROL IF TRANSITION TIME IS COMPLETE <<<<<
 else
 gkmorphflag = 0									;>>>>>> WHEN COMPLETE RESET MORPH CONTROL FLAG (= 0 )
 turnoff											;>>>>>> .. AND TURNOFF !!! <<<<<
endif  

endin



instr 50
print 99999
gksync = gkphase
outvalue "outphase", gkphase
turnoff

endin


instr 98 ;============== RESONATOR  =======
 

ain = gaRESON_SEND 


kf0 = gkF0+gkFDELTA
kf0 = (kf0 < 100? 100 : kf0)

if gkdens < 100 then 
;
;
ares resony ain * 0.5, kf0  , gkBW , 9, gkSEP  , 0, 2
;
else
;
ares tone ares, 5
endif


outs ares * gkRESLEV * (1-gkRESMUTE) , ares *gkRESLEV * (1-gkRESMUTE)

gaRESON_SEND = 0 
endin


instr 99
arevin_L = gaREVSEND_L*gkrevsend
arevin_R	 = gaREVSEND_R*gkrevsend
denorm arevin_L,arevin_R
arevin_L dcblock arevin_L
arevin_R dcblock arevin_R
arevout_L,arevout_R reverbsc arevin_L,arevin_R,gkrevlen,gkHF

 
outs arevout_L,arevout_R

clear gaREVSEND_L,gaREVSEND_R
endin



instr 100

kindex line 0, p3, 18

outvalue "L", kindex

outvalue "Listen", 0

endin



instr 101
outvalue "listen", 0
outvalue "detune", 0
outvalue "vol", 0.3
outvalue "RESMUTE",1
endin

instr 102
outvalue "detune", 0
endin

instr 103
outvalue "vel", 1
endin

</CsInstruments>
<CsScore>

i 1 0 36000
i 2 0 36000
i 5 0 36000
i 10 0 3600	0
i 98 0 36000
i 99 0 36000

i 100 0 0.1
i 101 0 0.1


f1 0 1024 10 1


f2 0 1025 20 2							; A Gauss bell envelope
f3 0 1025  7 0 128 1 768 1 120 0 8 0		; A trapezoid envelope
f4 0 1025  16 0 24 2 1  1000 -5 0	; An Exp envelope  
f5 0 1025  7 0 16 1 256 0.5 256 0.15 220 0 20 0 ; A dual decay envelope
f6 0 1025 19 2 1 270 1
f7  0 1024 7 0.000000 121 0.0515 170 0.1515 134 0.269 90 0.415 77 0.587 77 0.787 84 0.966 29 0.993 38 1.0 31 0.948 36 0.793 19 0.6 27 0.369 29 0.184 36 0.057 27 0.0

f701 0 2 -2 703 704 ;Contains the list of tables for preset morphing (2 tables)
f702 0 32 10 1 ; Morph table (don't care initial content)
f703 0 32 -2 0 ; 1st table
f704 0 32 -2 0 ; 2nd table
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>414</x>
 <y>312</y>
 <width>1246</width>
 <height>657</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>63</r>
  <g>130</g>
  <b>171</b>
 </bgcolor>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>282</x>
  <y>81</y>
  <width>148</width>
  <height>374</height>
  <uuid>{94882b46-653a-48e8-ac3d-75ecf6412524}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>ENVELOPE</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>245</r>
   <g>191</g>
   <b>93</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>598</x>
  <y>272</y>
  <width>633</width>
  <height>182</height>
  <uuid>{16a4fef4-0b89-461a-9ef7-e0d4ac7ea9a9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>PHASE</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>162</r>
   <g>191</g>
   <b>231</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>433</x>
  <y>271</y>
  <width>163</width>
  <height>184</height>
  <uuid>{de328a3e-53d9-4b0d-bc85-4491d18fa8b5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>REVERB</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>146</r>
   <g>170</g>
   <b>205</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>8</x>
  <y>271</y>
  <width>272</width>
  <height>184</height>
  <uuid>{3334f48d-a2c7-4d28-9d86-7bf448460318}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>RANDOM</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>208</r>
   <g>170</g>
   <b>116</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>8</x>
  <y>81</y>
  <width>272</width>
  <height>188</height>
  <uuid>{5decd36a-b525-4063-a68e-696b689ad0af}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>AVERAGE</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>239</r>
   <g>224</g>
   <b>178</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLineEdit">
  <objectName>_Browse</objectName>
  <x>353</x>
  <y>48</y>
  <width>879</width>
  <height>27</height>
  <uuid>{15a8ec14-710f-43e6-be9e-f5dc8c8786cb}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <label>/Users/francesco/Documents/Detunized HumBuzz/Hum/HumBuzz-Hum-03.wav</label>
  <alignment>left</alignment>
  <font>Liberation Sans</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>236</r>
   <g>236</g>
   <b>236</b>
  </bgcolor>
  <background>nobackground</background>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName>_Browse</objectName>
  <x>191</x>
  <y>43</y>
  <width>160</width>
  <height>40</height>
  <uuid>{8c630a69-dc58-46a0-a696-60bc59cec1d6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue>/Users/francesco/Documents/Detunized HumBuzz/Hum/HumBuzz-Hum-03.wav</stringvalue>
  <text>Browse Audio File</text>
  <image>/</image>
  <eventLine/>
  <latch>false</latch>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>phase</objectName>
  <x>433</x>
  <y>225</y>
  <width>801</width>
  <height>32</height>
  <uuid>{c4cdc52a-fbd1-4a5a-a374-1a47972563d2}</uuid>
  <visible>true</visible>
  <midichan>1</midichan>
  <midicc>23</midicc>
  <description/>
  <objectName2>phaseY</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.11002309</xValue>
  <yValue>0.50000000</yValue>
  <type>line</type>
  <pointsize>36</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <bordermode>noborder</bordermode>
  <borderColor>#00FF00</borderColor>
  <color>
   <r>0</r>
   <g>255</g>
   <b>221</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject version="2" type="BSBGraph">
  <objectName>L</objectName>
  <x>432</x>
  <y>81</y>
  <width>802</width>
  <height>148</height>
  <uuid>{a7476a63-a50a-4452-9e14-f6c453db56db}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <value>8</value>
  <objectName2>LNAME</objectName2>
  <zoomx>1.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <modex>lin</modex>
  <modey>lin</modey>
  <showSelector>true</showSelector>
  <showGrid>true</showGrid>
  <showTableInfo>true</showTableInfo>
  <showScrollbars>true</showScrollbars>
  <enableTables>true</enableTables>
  <enableDisplays>true</enableDisplays>
  <all>true</all>
 </bsbObject>
 <bsbObject version="2" type="BSBDropdown">
  <objectName>grnv</objectName>
  <x>292</x>
  <y>106</y>
  <width>84</width>
  <height>22</height>
  <uuid>{53f94227-adf2-4acc-8fea-795c9fb32852}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>Gauss</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>Trap</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>Exp</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>DualDec</name>
    <value>3</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>TwinPks</name>
    <value>4</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>Reverse</name>
    <value>5</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>Random</name>
    <value>6</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>3</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>291</x>
  <y>129</y>
  <width>64</width>
  <height>21</height>
  <uuid>{50990f43-8054-4eff-bd36-138445530c01}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Grain Env</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>dens</objectName>
  <x>117</x>
  <y>130</y>
  <width>20</width>
  <height>100</height>
  <uuid>{3c00b237-547f-4609-aab0-188ed2b2faf8}</uuid>
  <visible>true</visible>
  <midichan>1</midichan>
  <midicc>12</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.04722862</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>dur</objectName>
  <x>183</x>
  <y>130</y>
  <width>20</width>
  <height>100</height>
  <uuid>{b0f2b923-b9fd-4c4c-9160-78e5947d66e4}</uuid>
  <visible>true</visible>
  <midichan>1</midichan>
  <midicc>11</midicc>
  <description/>
  <minimum>0.00800000</minimum>
  <maximum>0.50000000</maximum>
  <value>0.46064000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>detune</objectName>
  <x>56</x>
  <y>130</y>
  <width>20</width>
  <height>100</height>
  <uuid>{640372ff-dfd8-4bdc-a994-4b92c2956b03}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-48.00000000</minimum>
  <maximum>48.00000000</maximum>
  <value>11.45545635</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>33</x>
  <y>230</y>
  <width>67</width>
  <height>34</height>
  <uuid>{c0e458fc-3607-4329-ae52-53d5b2378581}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Grain 
Pitch</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>103</x>
  <y>232</y>
  <width>53</width>
  <height>23</height>
  <uuid>{86bc84fa-31e7-48fa-a67c-de9242dcf4bb}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Dens</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>detune</objectName>
  <x>38</x>
  <y>109</y>
  <width>51</width>
  <height>16</height>
  <uuid>{0004f65f-fc56-4676-af99-5f5131293987}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>11.45545635</value>
  <resolution>0.00100000</resolution>
  <minimum>-48.00000000</minimum>
  <maximum>48.00000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>167</x>
  <y>233</y>
  <width>52</width>
  <height>20</height>
  <uuid>{21f0c06c-5429-4d1c-bd07-5d89b9ae6ea8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Dur</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>dur</objectName>
  <x>173</x>
  <y>112</y>
  <width>45</width>
  <height>16</height>
  <uuid>{6bad3d2e-c0fe-4d4c-ba1e-ad0a1263b5ad}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>0.46064000</value>
  <resolution>0.00100000</resolution>
  <minimum>0.00800000</minimum>
  <maximum>0.50000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>densdisp</objectName>
  <x>110</x>
  <y>108</y>
  <width>49</width>
  <height>20</height>
  <uuid>{8ab014b6-3163-4a0a-a58c-6d1bff22859d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>5.095</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName>scanon</objectName>
  <x>701</x>
  <y>277</y>
  <width>107</width>
  <height>25</height>
  <uuid>{f22544d5-4565-4be6-a82d-ddebd6db2e37}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>SCAN On/Off</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>autophase</objectName>
  <x>433</x>
  <y>258</y>
  <width>800</width>
  <height>11</height>
  <uuid>{85a560ea-d4ec-4cb7-9ee9-a43e5ff845fe}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>phaseY</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.83550790</xValue>
  <yValue>0.50000000</yValue>
  <type>fill</type>
  <pointsize>36</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <bordermode>noborder</bordermode>
  <borderColor>#00FF00</borderColor>
  <color>
   <r>0</r>
   <g>234</g>
   <b>0</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName>direction</objectName>
  <x>812</x>
  <y>276</y>
  <width>100</width>
  <height>30</height>
  <uuid>{1923321b-bf28-4f93-aaea-787116eef9f3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>>> / &lt;&lt;</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>ranpitch</objectName>
  <x>56</x>
  <y>306</y>
  <width>20</width>
  <height>100</height>
  <uuid>{8af41878-52af-4607-9406-afbf3673eea5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>28</x>
  <y>407</y>
  <width>69</width>
  <height>36</height>
  <uuid>{3593229c-f63d-49ad-870b-5b0060e3afb8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Rand 
Pitch</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>ranpitch</objectName>
  <x>42</x>
  <y>288</y>
  <width>51</width>
  <height>22</height>
  <uuid>{7f13ca46-f149-4c5c-9a02-9b9a4d2bef99}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>0.00000000</value>
  <resolution>0.00010000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>densrand</objectName>
  <x>117</x>
  <y>308</y>
  <width>20</width>
  <height>100</height>
  <uuid>{e195f144-f2ff-4386-8c59-9dd96d7a5a7b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>98</x>
  <y>407</y>
  <width>61</width>
  <height>35</height>
  <uuid>{96da4903-1de9-44f7-91e5-15fbfffe91fc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Rand
Dens</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>densrand</objectName>
  <x>108</x>
  <y>290</y>
  <width>40</width>
  <height>21</height>
  <uuid>{5be30767-b1c9-498e-8b71-8ecccb6068da}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.000</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>vel</objectName>
  <x>740</x>
  <y>320</y>
  <width>20</width>
  <height>100</height>
  <uuid>{9b6ab007-6fca-4610-ba63-bdb5c82e6c1a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00010000</minimum>
  <maximum>2.00000000</maximum>
  <value>0.00381179</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>267</x>
  <y>232</y>
  <width>160</width>
  <height>20</height>
  <uuid>{66ade370-d159-4b50-a575-7d504d113f5c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>MANUAL POSITION >>></label>
  <alignment>right</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>693</x>
  <y>417</y>
  <width>126</width>
  <height>24</height>
  <uuid>{47284ad9-98d9-4ed8-822f-f4f439222914}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Scan Velocity </label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>vel</objectName>
  <x>710</x>
  <y>302</y>
  <width>77</width>
  <height>21</height>
  <uuid>{9267574a-8201-4ed8-afe9-c0ff362e8929}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>0.00381179</value>
  <resolution>0.00100000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>2.00000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>ranphase</objectName>
  <x>953</x>
  <y>318</y>
  <width>20</width>
  <height>100</height>
  <uuid>{09f789f0-c317-4ae8-9e6f-07e8b382fdf9}</uuid>
  <visible>true</visible>
  <midichan>1</midichan>
  <midicc>10</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>0.10000000</maximum>
  <value>0.10000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>932</x>
  <y>417</y>
  <width>65</width>
  <height>35</height>
  <uuid>{2cdb9c35-4596-4382-b1ff-87575d4803cd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Rand 
Phase </label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>ranphase</objectName>
  <x>942</x>
  <y>298</y>
  <width>45</width>
  <height>20</height>
  <uuid>{1081fe51-0656-4788-b97f-422f050b203c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>0.10000000</value>
  <resolution>0.00100000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>0.10000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>revsend</objectName>
  <x>449</x>
  <y>334</y>
  <width>40</width>
  <height>40</height>
  <uuid>{089e293f-aae0-47ee-887f-88465332abbd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
  <color>
   <r>245</r>
   <g>124</g>
   <b>0</b>
  </color>
  <textcolor>#512900</textcolor>
  <border>0</border>
  <borderColor>#512900</borderColor>
  <showvalue>true</showvalue>
  <flatstyle>true</flatstyle>
  <integerMode>false</integerMode>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>revsend</objectName>
  <x>447</x>
  <y>317</y>
  <width>41</width>
  <height>15</height>
  <uuid>{90193a73-2def-44a8-9b62-8e8ad3273de3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>0.00000000</value>
  <resolution>0.01000000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>0.99000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>revlen</objectName>
  <x>495</x>
  <y>334</y>
  <width>40</width>
  <height>40</height>
  <uuid>{2ac63c02-c813-4243-8af5-e5fa4844d9cc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>0.98000000</maximum>
  <value>0.88200003</value>
  <mode>lin</mode>
  <mouseControl act="">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
  <color>
   <r>245</r>
   <g>124</g>
   <b>0</b>
  </color>
  <textcolor>#512900</textcolor>
  <border>0</border>
  <borderColor>#512900</borderColor>
  <showvalue>true</showvalue>
  <flatstyle>true</flatstyle>
  <integerMode>false</integerMode>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>revlen</objectName>
  <x>493</x>
  <y>317</y>
  <width>41</width>
  <height>15</height>
  <uuid>{45bf2fa1-a79e-43b1-a4b3-4446c6e33c50}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>0.88200003</value>
  <resolution>0.01000000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>0.98000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>HF</objectName>
  <x>539</x>
  <y>334</y>
  <width>40</width>
  <height>40</height>
  <uuid>{f2c9a9f4-5666-45ca-b2ed-d7805d464dfd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>1000.00000000</minimum>
  <maximum>16000.00000000</maximum>
  <value>9097.85847820</value>
  <mode>lin</mode>
  <mouseControl act="">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
  <color>
   <r>245</r>
   <g>124</g>
   <b>0</b>
  </color>
  <textcolor>#512900</textcolor>
  <border>0</border>
  <borderColor>#512900</borderColor>
  <showvalue>true</showvalue>
  <flatstyle>true</flatstyle>
  <integerMode>false</integerMode>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>HF</objectName>
  <x>537</x>
  <y>317</y>
  <width>41</width>
  <height>15</height>
  <uuid>{499d271e-d552-41b2-a18e-5a4ac67710f3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>9097.85847820</value>
  <resolution>1.00000000</resolution>
  <minimum>1000.00000000</minimum>
  <maximum>16000.00000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>448</x>
  <y>374</y>
  <width>41</width>
  <height>21</height>
  <uuid>{eda35cb8-c2b4-4b34-b75d-45e8153bfb22}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Send</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>495</x>
  <y>375</y>
  <width>41</width>
  <height>21</height>
  <uuid>{822f651c-ddab-4c8e-8b43-91753d9ab6c6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Room</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>538</x>
  <y>375</y>
  <width>41</width>
  <height>21</height>
  <uuid>{2e74c791-6890-4523-994f-f6b56f4c29c2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>HF</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>dur_rand</objectName>
  <x>183</x>
  <y>311</y>
  <width>20</width>
  <height>100</height>
  <uuid>{bb57b66d-6c93-4c54-bc6b-78050408f7fa}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>169</x>
  <y>414</y>
  <width>49</width>
  <height>35</height>
  <uuid>{718d1a23-7f36-4763-8b6d-dca54f41d8c9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Rand
Dur</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>dur_rand</objectName>
  <x>171</x>
  <y>291</y>
  <width>40</width>
  <height>22</height>
  <uuid>{a915f737-55e6-4989-aa4f-faff34cd87e4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>0.00000000</value>
  <resolution>0.00100000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>0</x>
  <y>1</y>
  <width>1232</width>
  <height>39</height>
  <uuid>{b1cc4041-8fa3-4bea-b3fa-3eabbf27e612}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>SAGRA 1.4 - A very basic sample granulator</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Eager Naturalist</font>
  <fontsize>24</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="background">
   <r>128</r>
   <g>0</g>
   <b>2</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>811</x>
  <y>301</y>
  <width>104</width>
  <height>21</height>
  <uuid>{930de015-c0c5-4ae7-bd9a-3c24b7b8be5a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Direction</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>level</objectName>
  <x>308</x>
  <y>319</y>
  <width>80</width>
  <height>80</height>
  <uuid>{fe0bd4a9-ff99-4649-bdd2-0a6ce755bf34}</uuid>
  <visible>true</visible>
  <midichan>1</midichan>
  <midicc>13</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.65057998</value>
  <mode>lin</mode>
  <mouseControl act="">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
  <color>
   <r>245</r>
   <g>124</g>
   <b>0</b>
  </color>
  <textcolor>#512900</textcolor>
  <border>0</border>
  <borderColor>#512900</borderColor>
  <showvalue>true</showvalue>
  <flatstyle>true</flatstyle>
  <integerMode>false</integerMode>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>316</x>
  <y>401</y>
  <width>64</width>
  <height>21</height>
  <uuid>{4a105347-61a0-450b-9bd4-0cbbc69189aa}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>MAIN LEVEL</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>472</x>
  <y>429</y>
  <width>78</width>
  <height>21</height>
  <uuid>{32f10718-4dac-45bb-9a5f-aafce66f97f3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <label>RevMode</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBDropdown">
  <objectName>rev_mode</objectName>
  <x>451</x>
  <y>405</y>
  <width>125</width>
  <height>23</height>
  <uuid>{f6967175-8d39-43fa-a866-5638b6a989a6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>Global</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>SingleRandom</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>1</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScope">
  <objectName/>
  <x>1013</x>
  <y>302</y>
  <width>204</width>
  <height>112</height>
  <uuid>{3cb5be56-f2a8-4de2-b9fc-88b3431aeb62}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <value>-255.00000000</value>
  <type>scope</type>
  <zoomx>10.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <mode>0.00000000</mode>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName>_Play</objectName>
  <x>6</x>
  <y>43</y>
  <width>100</width>
  <height>32</height>
  <uuid>{26f15c27-62bc-4bdb-943e-6a0dad1f3396}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Play / Pause</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName>_Stop</objectName>
  <x>106</x>
  <y>45</y>
  <width>79</width>
  <height>32</height>
  <uuid>{3c87eabf-5600-41c6-a2b3-d9aefd184a27}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Stop</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>nchan</objectName>
  <x>345</x>
  <y>167</y>
  <width>75</width>
  <height>23</height>
  <uuid>{535c4f1a-28ea-409a-b76b-54833fc4e63b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>1.000</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>102</r>
   <g>255</g>
   <b>102</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>344</x>
  <y>191</y>
  <width>78</width>
  <height>21</height>
  <uuid>{87be5bf0-ea78-4aa5-91d7-c4ebbc0e51ea}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Num of chan</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>18</x>
  <y>174</y>
  <width>27</width>
  <height>16</height>
  <uuid>{beb08e79-4b1c-412c-89c1-b69e840746da}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>x1</text>
  <image>/</image>
  <eventLine>i102 0 0.1</eventLine>
  <latch>false</latch>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>12</x>
  <y>188</y>
  <width>40</width>
  <height>20</height>
  <uuid>{49b3cf05-698d-40ae-9886-23d14574eee5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Reset</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>autophase</objectName>
  <x>839</x>
  <y>322</y>
  <width>44</width>
  <height>22</height>
  <uuid>{bdcfcbcc-e2ec-4aa1-bf26-b94cd6715752}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.836</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>255</g>
   <b>10</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>8</x>
  <y>458</y>
  <width>588</width>
  <height>180</height>
  <uuid>{1c89d3e7-7fb8-4cce-9acb-287b83b60aed}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <label>PRESET MANAGER</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>179</r>
   <g>179</g>
   <b>179</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>4</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBDropdown">
  <objectName>Wm</objectName>
  <x>126</x>
  <y>505</y>
  <width>125</width>
  <height>23</height>
  <uuid>{27d29594-319f-4f9e-813b-0aff6ed2953b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>Preset_01</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>Preset_02</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>Preset_03</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>Preset_04</name>
    <value>3</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>Preset_05</name>
    <value>4</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>Preset_06</name>
    <value>5</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>Preset_07</name>
    <value>6</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>Preset_08</name>
    <value>7</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>0</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>254</x>
  <y>566</y>
  <width>116</width>
  <height>30</height>
  <uuid>{503da0e5-9e0e-44b1-8c29-683ba373067f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>SAVE BANK</text>
  <image>/</image>
  <eventLine>i20 0 0.1</eventLine>
  <latch>false</latch>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>12</x>
  <y>565</y>
  <width>108</width>
  <height>32</height>
  <uuid>{d7e38189-c7d9-42cc-81ae-e25152592652}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>LOAD BANK</text>
  <image>/</image>
  <eventLine>i21 0 0.1</eventLine>
  <latch>false</latch>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject version="2" type="BSBLineEdit">
  <objectName>_Browse1</objectName>
  <x>17</x>
  <y>602</y>
  <width>571</width>
  <height>29</height>
  <uuid>{9ddd72fa-f4ec-4be3-afba-f8662b0402af}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <label>/Users/eug/Documents/CSD/PROVA_SAGRA.txt</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>236</r>
   <g>236</g>
   <b>236</b>
  </bgcolor>
  <background>nobackground</background>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName>_Browse1</objectName>
  <x>132</x>
  <y>567</y>
  <width>100</width>
  <height>30</height>
  <uuid>{ea72fd6f-9281-4866-b5c4-50a46941e04a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue>/Users/eug/Documents/CSD/PROVA_SAGRA.txt</stringvalue>
  <text>Browse </text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>12</x>
  <y>502</y>
  <width>110</width>
  <height>30</height>
  <uuid>{0e15a5b3-2dac-4913-9ddd-df611adaeddd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>READ PRESET</text>
  <image>/</image>
  <eventLine>i12 0 0.1</eventLine>
  <latch>false</latch>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>256</x>
  <y>503</y>
  <width>116</width>
  <height>29</height>
  <uuid>{6c716047-095f-4f2f-9a44-4400a27f1405}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>WRITE PRESET</text>
  <image>/</image>
  <eventLine>i11 0 0.1</eventLine>
  <latch>false</latch>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>121</x>
  <y>526</y>
  <width>126</width>
  <height>25</height>
  <uuid>{17998558-5a69-4074-81a2-0425f1c5c639}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <label>Preset Number</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>morph_time</objectName>
  <x>481</x>
  <y>508</y>
  <width>18</width>
  <height>74</height>
  <uuid>{fa99983b-531f-4bdb-b0d1-1103482bf31e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.10000000</minimum>
  <maximum>120.00000000</maximum>
  <value>3.34054054</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>type</objectName>
  <x>535</x>
  <y>508</y>
  <width>18</width>
  <height>74</height>
  <uuid>{bb6c6076-68e7-4a56-999f-0b0fc8d23b15}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-5.00000000</minimum>
  <maximum>5.00000000</maximum>
  <value>3.10810804</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>522</x>
  <y>582</y>
  <width>42</width>
  <height>25</height>
  <uuid>{be25de81-4061-43ac-8569-7b4a269286cc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <label>Type</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>type</objectName>
  <x>526</x>
  <y>488</y>
  <width>41</width>
  <height>15</height>
  <uuid>{bac6ca6e-8f37-4e38-86d9-12afbed0bd20}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>3.10810804</value>
  <resolution>0.10000000</resolution>
  <minimum>-5.00000000</minimum>
  <maximum>5.00000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName>stop</objectName>
  <x>379</x>
  <y>528</y>
  <width>62</width>
  <height>30</height>
  <uuid>{9f0a35bd-79b2-42a0-a8ee-48ff8f933de7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>stop</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>Tr_disp</objectName>
  <x>387</x>
  <y>506</y>
  <width>48</width>
  <height>22</height>
  <uuid>{3c733b0b-b218-405d-a46c-38ba9b44951f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <label>3.330</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>204</g>
   <b>102</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>5</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>455</x>
  <y>582</y>
  <width>73</width>
  <height>24</height>
  <uuid>{1cd73bd4-5bc4-423f-bf77-15e88b7a880a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <label>MorphTime</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>morph_time</objectName>
  <x>468</x>
  <y>488</y>
  <width>41</width>
  <height>15</height>
  <uuid>{ce441376-e8e7-4eb4-b88e-5f49c9067568}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>3.34054054</value>
  <resolution>0.10000000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>120.00000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>597</x>
  <y>469</y>
  <width>633</width>
  <height>180</height>
  <uuid>{6d9b94fe-004f-4c96-b299-0b87c0858a12}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <label>EFX</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>152</r>
   <g>121</g>
   <b>18</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>4</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>lintime_disp</objectName>
  <x>12</x>
  <y>554</y>
  <width>361</width>
  <height>8</height>
  <uuid>{307c51c1-352d-4742-a97b-42f3fd14ac5e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.99890109</xValue>
  <yValue>0.50000000</yValue>
  <type>fill</type>
  <pointsize>36</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <bordermode>noborder</bordermode>
  <borderColor>#00FF00</borderColor>
  <color>
   <r>0</r>
   <g>255</g>
   <b>204</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>72</x>
  <y>169</y>
  <width>23</width>
  <height>22</height>
  <uuid>{efdfd44e-60da-47b1-bc3c-6a0cf349312e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>---
</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>level</objectName>
  <x>309</x>
  <y>294</y>
  <width>80</width>
  <height>25</height>
  <uuid>{82d7be60-9bde-452d-b6c5-5f6a6edc5f54}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <color>
   <r>128</r>
   <g>0</g>
   <b>2</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>0.65057998</value>
  <resolution>0.01000000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>766</x>
  <y>607</y>
  <width>107</width>
  <height>24</height>
  <uuid>{59d7da69-fbf9-4a5f-9af8-9bd8eaf0a98e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>RESONATOR LEVEL </label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName>listen</objectName>
  <x>764</x>
  <y>81</y>
  <width>108</width>
  <height>24</height>
  <uuid>{39c1db49-1d03-4f10-b5ef-56a13f724d2e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Listen Sample</text>
  <image>/</image>
  <eventLine>i4 0 -1</eventLine>
  <latch>true</latch>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>phasenorm</objectName>
  <x>433</x>
  <y>215</y>
  <width>798</width>
  <height>10</height>
  <uuid>{ef9f87d9-45b5-4bb9-828b-46e9f81cf299}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>phaseY</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.25886144</xValue>
  <yValue>0.50000000</yValue>
  <type>fill</type>
  <pointsize>36</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <bordermode>noborder</bordermode>
  <borderColor>#00FF00</borderColor>
  <color>
   <r>253</r>
   <g>128</g>
   <b>8</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>vol</objectName>
  <x>872</x>
  <y>81</y>
  <width>30</width>
  <height>30</height>
  <uuid>{f52d8384-6081-4733-a9ef-6378b8d33982}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.30000000</value>
  <mode>lin</mode>
  <mouseControl act="">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
  <color>
   <r>245</r>
   <g>124</g>
   <b>0</b>
  </color>
  <textcolor>#512900</textcolor>
  <border>0</border>
  <borderColor>#512900</borderColor>
  <showvalue>true</showvalue>
  <flatstyle>true</flatstyle>
  <integerMode>false</integerMode>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>903</x>
  <y>84</y>
  <width>33</width>
  <height>25</height>
  <uuid>{fba88455-cbc6-4994-a6b6-d0c704996c82}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Vol</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>dens</objectName>
  <x>135</x>
  <y>134</y>
  <width>25</width>
  <height>98</height>
  <uuid>{5d0758ab-f340-4586-958d-824441102526}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>7</fontsize>
  <color>
   <r>128</r>
   <g>0</g>
   <b>2</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>0.04722862</value>
  <resolution>0.00010000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>266</x>
  <y>252</y>
  <width>160</width>
  <height>20</height>
  <uuid>{3c11b83d-4d94-4df2-aa1f-6806b510fb55}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>AUTO POSITION >>></label>
  <alignment>right</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName>RESMUTE</objectName>
  <x>601</x>
  <y>536</y>
  <width>61</width>
  <height>27</height>
  <uuid>{f9f660a0-91e5-4f94-8cbf-632cdcd28acd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Mute</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>FRANGE</objectName>
  <x>787</x>
  <y>520</y>
  <width>18</width>
  <height>50</height>
  <uuid>{ce0872db-aab3-4f5f-a0d4-8cc33874104e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>200.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>FRANGE</objectName>
  <x>776</x>
  <y>507</y>
  <width>41</width>
  <height>15</height>
  <uuid>{18454320-3c62-4167-95ec-9a47bbb2bb3e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>0.00000000</value>
  <resolution>1.00000000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>200.00000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>SEP</objectName>
  <x>889</x>
  <y>526</y>
  <width>40</width>
  <height>40</height>
  <uuid>{3fccbaf9-9ea9-481b-ad5e-4ddc088db950}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>8.00000000</maximum>
  <value>3.80000000</value>
  <mode>lin</mode>
  <mouseControl act="">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
  <color>
   <r>245</r>
   <g>124</g>
   <b>0</b>
  </color>
  <textcolor>#512900</textcolor>
  <border>0</border>
  <borderColor>#512900</borderColor>
  <showvalue>true</showvalue>
  <flatstyle>true</flatstyle>
  <integerMode>false</integerMode>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>881</x>
  <y>568</y>
  <width>73</width>
  <height>25</height>
  <uuid>{33e357eb-9d3c-4a64-a76b-ace6bf142199}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Freq Space</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>F0</objectName>
  <x>727</x>
  <y>526</y>
  <width>40</width>
  <height>40</height>
  <uuid>{ae9c2bdd-a785-4fa8-80c3-9d32b4849aa0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>20.00000000</minimum>
  <maximum>500.00000000</maximum>
  <value>153.15200000</value>
  <mode>lin</mode>
  <mouseControl act="">continuous</mouseControl>
  <resolution>1.00000000</resolution>
  <randomizable group="0">false</randomizable>
  <color>
   <r>245</r>
   <g>124</g>
   <b>0</b>
  </color>
  <textcolor>#512900</textcolor>
  <border>0</border>
  <borderColor>#512900</borderColor>
  <showvalue>true</showvalue>
  <flatstyle>true</flatstyle>
  <integerMode>false</integerMode>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>BW</objectName>
  <x>831</x>
  <y>526</y>
  <width>40</width>
  <height>40</height>
  <uuid>{d526a243-3315-44ef-ac3d-279fccd28769}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.05000000</minimum>
  <maximum>2.00000000</maximum>
  <value>0.71300000</value>
  <mode>lin</mode>
  <mouseControl act="">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
  <color>
   <r>245</r>
   <g>124</g>
   <b>0</b>
  </color>
  <textcolor>#512900</textcolor>
  <border>0</border>
  <borderColor>#512900</borderColor>
  <showvalue>true</showvalue>
  <flatstyle>true</flatstyle>
  <integerMode>false</integerMode>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>831</x>
  <y>567</y>
  <width>37</width>
  <height>24</height>
  <uuid>{d05b343b-9a29-487f-8739-6974e098e062}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>BW</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>734</x>
  <y>567</y>
  <width>28</width>
  <height>24</height>
  <uuid>{49027840-b64c-4d74-bcac-65eb5daf4e7d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>F0</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>RESLEV</objectName>
  <x>670</x>
  <y>525</y>
  <width>40</width>
  <height>40</height>
  <uuid>{9c1b3dc3-0a45-4b2f-8219-89204c771049}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.25000000</value>
  <mode>lin</mode>
  <mouseControl act="">continuous</mouseControl>
  <resolution>1.00000000</resolution>
  <randomizable group="0">false</randomizable>
  <color>
   <r>245</r>
   <g>124</g>
   <b>0</b>
  </color>
  <textcolor>#512900</textcolor>
  <border>0</border>
  <borderColor>#512900</borderColor>
  <showvalue>true</showvalue>
  <flatstyle>true</flatstyle>
  <integerMode>false</integerMode>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>675</x>
  <y>567</y>
  <width>33</width>
  <height>25</height>
  <uuid>{bbb7b793-e898-44c3-bd5d-9d53e75d56dd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Lev</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>F0</objectName>
  <x>724</x>
  <y>506</y>
  <width>50</width>
  <height>21</height>
  <uuid>{dc7a4d69-1ef6-4dc7-9e14-fc402d4bb43c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>153.15200000</value>
  <resolution>0.00100000</resolution>
  <minimum>20.00000000</minimum>
  <maximum>500.00000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>BW</objectName>
  <x>827</x>
  <y>507</y>
  <width>50</width>
  <height>21</height>
  <uuid>{f14a4447-0aae-4d71-8a05-45ce212779d5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>0.71300000</value>
  <resolution>0.00100000</resolution>
  <minimum>0.05000000</minimum>
  <maximum>2.00000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>SEP</objectName>
  <x>888</x>
  <y>506</y>
  <width>50</width>
  <height>21</height>
  <uuid>{85025874-5f38-4a8f-bf54-9cdbf7567449}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>3.80000000</value>
  <resolution>0.00100000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>8.00000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>RESLEV</objectName>
  <x>665</x>
  <y>504</y>
  <width>56</width>
  <height>25</height>
  <uuid>{ca28474e-d396-486b-8fdf-ff5094e77d70}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.250</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>774</x>
  <y>569</y>
  <width>42</width>
  <height>39</height>
  <uuid>{25b4afb5-bd46-477b-9464-e9fbf11223b8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>   F0
Rand</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>436</x>
  <y>83</y>
  <width>96</width>
  <height>26</height>
  <uuid>{6faf2266-00a5-48bb-a883-297385cba43d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Lenght: >>></label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>13</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>708</x>
  <y>363</y>
  <width>27</width>
  <height>16</height>
  <uuid>{fbb7146b-66ef-4783-bb1b-f1766bd81f50}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>x1</text>
  <image>/</image>
  <eventLine>i103 0 0.1</eventLine>
  <latch>false</latch>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>702</x>
  <y>376</y>
  <width>40</width>
  <height>20</height>
  <uuid>{e2ac1f16-bd6d-4592-a3f2-73f3de931eb0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Reset</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName>sync</objectName>
  <x>920</x>
  <y>275</y>
  <width>100</width>
  <height>25</height>
  <uuid>{977a4c82-1bef-44fa-89f4-f0a5a2e393da}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>SYNCPHASE</text>
  <image>/</image>
  <eventLine>i50 0 0.1</eventLine>
  <latch>true</latch>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>cut_rand</objectName>
  <x>230</x>
  <y>291</y>
  <width>40</width>
  <height>22</height>
  <uuid>{2177df5e-4727-4f03-9ea9-b2702dc48c44}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>0.00000000</value>
  <resolution>0.00100000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>cut</objectName>
  <x>240</x>
  <y>130</y>
  <width>20</width>
  <height>100</height>
  <uuid>{3f504333-4234-49e8-98f6-13fc85072af8}</uuid>
  <visible>true</visible>
  <midichan>1</midichan>
  <midicc>11</midicc>
  <description/>
  <minimum>50.00000000</minimum>
  <maximum>2000.00000000</maximum>
  <value>206.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>224</x>
  <y>234</y>
  <width>52</width>
  <height>20</height>
  <uuid>{9a572ace-3b16-474a-a468-b0524652b2a5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Cut</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>cut</objectName>
  <x>225</x>
  <y>112</y>
  <width>50</width>
  <height>16</height>
  <uuid>{a0857be9-ad58-45a5-a054-808222bf23e1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>206.00000000</value>
  <resolution>1.00000000</resolution>
  <minimum>100.00000000</minimum>
  <maximum>20000.00000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>cut_rand</objectName>
  <x>240</x>
  <y>313</y>
  <width>20</width>
  <height>100</height>
  <uuid>{cf6392ef-905e-47d6-9906-555bdbc6488f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>228</x>
  <y>414</y>
  <width>49</width>
  <height>35</height>
  <uuid>{76aab853-f5b9-4729-b4d9-740e0c22ce42}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Rand
Cut</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>detune</objectName>
  <x>64</x>
  <y>114</y>
  <width>80</width>
  <height>25</height>
  <uuid>{d39e697f-a7ba-4809-842f-2cf463e61760}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>11.45545635</value>
  <resolution>0.10000000</resolution>
  <minimum>-48.00000000</minimum>
  <maximum>48.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
</bsbPanel>
<bsbPresets>
<preset name="Background" number="0" >
<value id="{15a8ec14-710f-43e6-be9e-f5dc8c8786cb}" mode="4" >/Users/eug/Documents/CSD/GetFooled_DRY.wav</value>
<value id="{8c630a69-dc58-46a0-a696-60bc59cec1d6}" mode="4" >/Users/eug/Documents/CSD/GetFooled_DRY.wav</value>
<value id="{c4cdc52a-fbd1-4a5a-a374-1a47972563d2}" mode="1" >0.12109863</value>
<value id="{c4cdc52a-fbd1-4a5a-a374-1a47972563d2}" mode="2" >0.50000000</value>
<value id="{a7476a63-a50a-4452-9e14-f6c453db56db}" mode="1" >17.00000000</value>
<value id="{53f94227-adf2-4acc-8fea-795c9fb32852}" mode="1" >1.00000000</value>
<value id="{3c00b237-547f-4609-aab0-188ed2b2faf8}" mode="1" >0.76999998</value>
<value id="{b0f2b923-b9fd-4c4c-9160-78e5947d66e4}" mode="1" >0.20972000</value>
<value id="{640372ff-dfd8-4bdc-a994-4b92c2956b03}" mode="1" >0.00000000</value>
<value id="{0004f65f-fc56-4676-af99-5f5131293987}" mode="1" >0.00000000</value>
<value id="{6bad3d2e-c0fe-4d4c-ba1e-ad0a1263b5ad}" mode="1" >0.20972000</value>
<value id="{8ab014b6-3163-4a0a-a58c-6d1bff22859d}" mode="1" >270.59323120</value>
<value id="{8ab014b6-3163-4a0a-a58c-6d1bff22859d}" mode="4" >270.593</value>
<value id="{f22544d5-4565-4be6-a82d-ddebd6db2e37}" mode="1" >0.00000000</value>
<value id="{f22544d5-4565-4be6-a82d-ddebd6db2e37}" mode="4" >0</value>
<value id="{85a560ea-d4ec-4cb7-9ee9-a43e5ff845fe}" mode="1" >0.00000000</value>
<value id="{85a560ea-d4ec-4cb7-9ee9-a43e5ff845fe}" mode="2" >0.50000000</value>
<value id="{1923321b-bf28-4f93-aaea-787116eef9f3}" mode="1" >0.00000000</value>
<value id="{1923321b-bf28-4f93-aaea-787116eef9f3}" mode="4" >0</value>
<value id="{8af41878-52af-4607-9406-afbf3673eea5}" mode="1" >0.00000000</value>
<value id="{7f13ca46-f149-4c5c-9a02-9b9a4d2bef99}" mode="1" >0.00000000</value>
<value id="{e195f144-f2ff-4386-8c59-9dd96d7a5a7b}" mode="1" >0.00000000</value>
<value id="{5be30767-b1c9-498e-8b71-8ecccb6068da}" mode="1" >0.00000000</value>
<value id="{5be30767-b1c9-498e-8b71-8ecccb6068da}" mode="4" >0.000</value>
<value id="{9b6ab007-6fca-4610-ba63-bdb5c82e6c1a}" mode="1" >0.06009400</value>
<value id="{9267574a-8201-4ed8-afe9-c0ff362e8929}" mode="1" >0.06009400</value>
<value id="{09f789f0-c317-4ae8-9e6f-07e8b382fdf9}" mode="1" >0.00100000</value>
<value id="{1081fe51-0656-4788-b97f-422f050b203c}" mode="1" >0.00100000</value>
<value id="{089e293f-aae0-47ee-887f-88465332abbd}" mode="1" >0.76999998</value>
<value id="{90193a73-2def-44a8-9b62-8e8ad3273de3}" mode="1" >0.76999998</value>
<value id="{2ac63c02-c813-4243-8af5-e5fa4844d9cc}" mode="1" >0.63700002</value>
<value id="{45bf2fa1-a79e-43b1-a4b3-4446c6e33c50}" mode="1" >0.63700002</value>
<value id="{f2c9a9f4-5666-45ca-b2ed-d7805d464dfd}" mode="1" >9100.00000000</value>
<value id="{499d271e-d552-41b2-a18e-5a4ac67710f3}" mode="1" >9100.00000000</value>
<value id="{bb57b66d-6c93-4c54-bc6b-78050408f7fa}" mode="1" >0.00000000</value>
<value id="{a915f737-55e6-4989-aa4f-faff34cd87e4}" mode="1" >0.00000000</value>
<value id="{fe0bd4a9-ff99-4649-bdd2-0a6ce755bf34}" mode="1" >0.50000000</value>
<value id="{f6967175-8d39-43fa-a866-5638b6a989a6}" mode="1" >1.00000000</value>
<value id="{3cb5be56-f2a8-4de2-b9fc-88b3431aeb62}" mode="1" >-255.00000000</value>
<value id="{26f15c27-62bc-4bdb-943e-6a0dad1f3396}" mode="4" >0</value>
<value id="{3c87eabf-5600-41c6-a2b3-d9aefd184a27}" mode="4" >0</value>
<value id="{535c4f1a-28ea-409a-b76b-54833fc4e63b}" mode="1" >2.00000000</value>
<value id="{535c4f1a-28ea-409a-b76b-54833fc4e63b}" mode="4" >2.000</value>
<value id="{beb08e79-4b1c-412c-89c1-b69e840746da}" mode="4" >0</value>
<value id="{bdcfcbcc-e2ec-4aa1-bf26-b94cd6715752}" mode="1" >0.00000000</value>
<value id="{bdcfcbcc-e2ec-4aa1-bf26-b94cd6715752}" mode="4" >0.000</value>
<value id="{27d29594-319f-4f9e-813b-0aff6ed2953b}" mode="1" >0.00000000</value>
<value id="{503da0e5-9e0e-44b1-8c29-683ba373067f}" mode="4" >0</value>
<value id="{d7e38189-c7d9-42cc-81ae-e25152592652}" mode="4" >0</value>
<value id="{9ddd72fa-f4ec-4be3-afba-f8662b0402af}" mode="4" >/Users/eug/Documents/CSD/PROVA_SAGRA.txt</value>
<value id="{ea72fd6f-9281-4866-b5c4-50a46941e04a}" mode="4" >/Users/eug/Documents/CSD/PROVA_SAGRA.txt</value>
<value id="{0e15a5b3-2dac-4913-9ddd-df611adaeddd}" mode="4" >0</value>
<value id="{6c716047-095f-4f2f-9a44-4400a27f1405}" mode="4" >0</value>
<value id="{fa99983b-531f-4bdb-b0d1-1103482bf31e}" mode="1" >29.18918991</value>
<value id="{bb6c6076-68e7-4a56-999f-0b0fc8d23b15}" mode="1" >3.10810804</value>
<value id="{bac6ca6e-8f37-4e38-86d9-12afbed0bd20}" mode="1" >3.10810804</value>
<value id="{9f0a35bd-79b2-42a0-a8ee-48ff8f933de7}" mode="4" >0</value>
<value id="{3c733b0b-b218-405d-a46c-38ba9b44951f}" mode="1" >29.18600082</value>
<value id="{3c733b0b-b218-405d-a46c-38ba9b44951f}" mode="4" >29.186</value>
<value id="{ce441376-e8e7-4eb4-b88e-5f49c9067568}" mode="1" >29.18918991</value>
<value id="{307c51c1-352d-4742-a97b-42f3fd14ac5e}" mode="1" >0.99995703</value>
<value id="{307c51c1-352d-4742-a97b-42f3fd14ac5e}" mode="2" >0.50000000</value>
<value id="{82d7be60-9bde-452d-b6c5-5f6a6edc5f54}" mode="1" >0.50000000</value>
<value id="{39c1db49-1d03-4f10-b5ef-56a13f724d2e}" mode="1" >0.00000000</value>
<value id="{39c1db49-1d03-4f10-b5ef-56a13f724d2e}" mode="4" >0</value>
<value id="{ef9f87d9-45b5-4bb9-828b-46e9f81cf299}" mode="1" >0.30951327</value>
<value id="{ef9f87d9-45b5-4bb9-828b-46e9f81cf299}" mode="2" >0.50000000</value>
<value id="{f52d8384-6081-4733-a9ef-6378b8d33982}" mode="1" >0.30000001</value>
<value id="{5d0758ab-f340-4586-958d-824441102526}" mode="1" >0.76999998</value>
<value id="{f9f660a0-91e5-4f94-8cbf-632cdcd28acd}" mode="1" >1.00000000</value>
<value id="{f9f660a0-91e5-4f94-8cbf-632cdcd28acd}" mode="4" >1</value>
<value id="{ce0872db-aab3-4f5f-a0d4-8cc33874104e}" mode="1" >76.00000000</value>
<value id="{18454320-3c62-4167-95ec-9a47bbb2bb3e}" mode="1" >76.00000000</value>
<value id="{3fccbaf9-9ea9-481b-ad5e-4ddc088db950}" mode="1" >2.55999994</value>
<value id="{ae9c2bdd-a785-4fa8-80c3-9d32b4849aa0}" mode="1" >298.39999390</value>
<value id="{d526a243-3315-44ef-ac3d-279fccd28769}" mode="1" >0.34250000</value>
<value id="{9c1b3dc3-0a45-4b2f-8219-89204c771049}" mode="1" >0.80000001</value>
<value id="{dc7a4d69-1ef6-4dc7-9e14-fc402d4bb43c}" mode="1" >298.39999390</value>
<value id="{f14a4447-0aae-4d71-8a05-45ce212779d5}" mode="1" >0.34250000</value>
<value id="{85025874-5f38-4a8f-bf54-9cdbf7567449}" mode="1" >2.55999994</value>
<value id="{ca28474e-d396-486b-8fdf-ff5094e77d70}" mode="1" >0.80000001</value>
<value id="{ca28474e-d396-486b-8fdf-ff5094e77d70}" mode="4" >0.800</value>
</preset>
<preset name="Texture" number="1" >
<value id="{15a8ec14-710f-43e6-be9e-f5dc8c8786cb}" mode="4" >/Users/eug/Documents/CSD/GetFooled_DRY.wav</value>
<value id="{8c630a69-dc58-46a0-a696-60bc59cec1d6}" mode="4" >/Users/eug/Documents/CSD/GetFooled_DRY.wav</value>
<value id="{c4cdc52a-fbd1-4a5a-a374-1a47972563d2}" mode="1" >0.12109863</value>
<value id="{c4cdc52a-fbd1-4a5a-a374-1a47972563d2}" mode="2" >0.50000000</value>
<value id="{a7476a63-a50a-4452-9e14-f6c453db56db}" mode="1" >17.00000000</value>
<value id="{53f94227-adf2-4acc-8fea-795c9fb32852}" mode="1" >1.00000000</value>
<value id="{3c00b237-547f-4609-aab0-188ed2b2faf8}" mode="1" >0.49000001</value>
<value id="{b0f2b923-b9fd-4c4c-9160-78e5947d66e4}" mode="1" >0.02276000</value>
<value id="{640372ff-dfd8-4bdc-a994-4b92c2956b03}" mode="1" >0.00000000</value>
<value id="{0004f65f-fc56-4676-af99-5f5131293987}" mode="1" >0.00000000</value>
<value id="{6bad3d2e-c0fe-4d4c-ba1e-ad0a1263b5ad}" mode="1" >0.02276000</value>
<value id="{8ab014b6-3163-4a0a-a58c-6d1bff22859d}" mode="1" >137.85699463</value>
<value id="{8ab014b6-3163-4a0a-a58c-6d1bff22859d}" mode="4" >137.857</value>
<value id="{f22544d5-4565-4be6-a82d-ddebd6db2e37}" mode="1" >0.00000000</value>
<value id="{f22544d5-4565-4be6-a82d-ddebd6db2e37}" mode="4" >0</value>
<value id="{85a560ea-d4ec-4cb7-9ee9-a43e5ff845fe}" mode="1" >0.00000000</value>
<value id="{85a560ea-d4ec-4cb7-9ee9-a43e5ff845fe}" mode="2" >0.50000000</value>
<value id="{1923321b-bf28-4f93-aaea-787116eef9f3}" mode="1" >0.00000000</value>
<value id="{1923321b-bf28-4f93-aaea-787116eef9f3}" mode="4" >0</value>
<value id="{8af41878-52af-4607-9406-afbf3673eea5}" mode="1" >1.00000000</value>
<value id="{7f13ca46-f149-4c5c-9a02-9b9a4d2bef99}" mode="1" >1.00000000</value>
<value id="{e195f144-f2ff-4386-8c59-9dd96d7a5a7b}" mode="1" >0.00000000</value>
<value id="{5be30767-b1c9-498e-8b71-8ecccb6068da}" mode="1" >0.00000000</value>
<value id="{5be30767-b1c9-498e-8b71-8ecccb6068da}" mode="4" >0.000</value>
<value id="{9b6ab007-6fca-4610-ba63-bdb5c82e6c1a}" mode="1" >0.06009400</value>
<value id="{9267574a-8201-4ed8-afe9-c0ff362e8929}" mode="1" >0.06009400</value>
<value id="{09f789f0-c317-4ae8-9e6f-07e8b382fdf9}" mode="1" >0.10000000</value>
<value id="{1081fe51-0656-4788-b97f-422f050b203c}" mode="1" >0.10000000</value>
<value id="{089e293f-aae0-47ee-887f-88465332abbd}" mode="1" >0.76999998</value>
<value id="{90193a73-2def-44a8-9b62-8e8ad3273de3}" mode="1" >0.76999998</value>
<value id="{2ac63c02-c813-4243-8af5-e5fa4844d9cc}" mode="1" >0.63700002</value>
<value id="{45bf2fa1-a79e-43b1-a4b3-4446c6e33c50}" mode="1" >0.63700002</value>
<value id="{f2c9a9f4-5666-45ca-b2ed-d7805d464dfd}" mode="1" >9100.00000000</value>
<value id="{499d271e-d552-41b2-a18e-5a4ac67710f3}" mode="1" >9100.00000000</value>
<value id="{bb57b66d-6c93-4c54-bc6b-78050408f7fa}" mode="1" >0.00000000</value>
<value id="{a915f737-55e6-4989-aa4f-faff34cd87e4}" mode="1" >0.00000000</value>
<value id="{fe0bd4a9-ff99-4649-bdd2-0a6ce755bf34}" mode="1" >0.50000000</value>
<value id="{f6967175-8d39-43fa-a866-5638b6a989a6}" mode="1" >1.00000000</value>
<value id="{3cb5be56-f2a8-4de2-b9fc-88b3431aeb62}" mode="1" >-255.00000000</value>
<value id="{26f15c27-62bc-4bdb-943e-6a0dad1f3396}" mode="4" >0</value>
<value id="{3c87eabf-5600-41c6-a2b3-d9aefd184a27}" mode="4" >0</value>
<value id="{535c4f1a-28ea-409a-b76b-54833fc4e63b}" mode="1" >2.00000000</value>
<value id="{535c4f1a-28ea-409a-b76b-54833fc4e63b}" mode="4" >2.000</value>
<value id="{beb08e79-4b1c-412c-89c1-b69e840746da}" mode="4" >0</value>
<value id="{bdcfcbcc-e2ec-4aa1-bf26-b94cd6715752}" mode="1" >0.00000000</value>
<value id="{bdcfcbcc-e2ec-4aa1-bf26-b94cd6715752}" mode="4" >0.000</value>
<value id="{27d29594-319f-4f9e-813b-0aff6ed2953b}" mode="1" >0.00000000</value>
<value id="{503da0e5-9e0e-44b1-8c29-683ba373067f}" mode="4" >0</value>
<value id="{d7e38189-c7d9-42cc-81ae-e25152592652}" mode="4" >0</value>
<value id="{9ddd72fa-f4ec-4be3-afba-f8662b0402af}" mode="4" >/Users/eug/Documents/CSD/PROVA_SAGRA.txt</value>
<value id="{ea72fd6f-9281-4866-b5c4-50a46941e04a}" mode="4" >/Users/eug/Documents/CSD/PROVA_SAGRA.txt</value>
<value id="{0e15a5b3-2dac-4913-9ddd-df611adaeddd}" mode="4" >0</value>
<value id="{6c716047-095f-4f2f-9a44-4400a27f1405}" mode="4" >0</value>
<value id="{fa99983b-531f-4bdb-b0d1-1103482bf31e}" mode="1" >29.18918991</value>
<value id="{bb6c6076-68e7-4a56-999f-0b0fc8d23b15}" mode="1" >3.10810804</value>
<value id="{bac6ca6e-8f37-4e38-86d9-12afbed0bd20}" mode="1" >3.10810804</value>
<value id="{9f0a35bd-79b2-42a0-a8ee-48ff8f933de7}" mode="4" >0</value>
<value id="{3c733b0b-b218-405d-a46c-38ba9b44951f}" mode="1" >29.18600082</value>
<value id="{3c733b0b-b218-405d-a46c-38ba9b44951f}" mode="4" >29.186</value>
<value id="{ce441376-e8e7-4eb4-b88e-5f49c9067568}" mode="1" >29.18918991</value>
<value id="{307c51c1-352d-4742-a97b-42f3fd14ac5e}" mode="1" >0.99995703</value>
<value id="{307c51c1-352d-4742-a97b-42f3fd14ac5e}" mode="2" >0.50000000</value>
<value id="{82d7be60-9bde-452d-b6c5-5f6a6edc5f54}" mode="1" >0.50000000</value>
<value id="{39c1db49-1d03-4f10-b5ef-56a13f724d2e}" mode="1" >0.00000000</value>
<value id="{39c1db49-1d03-4f10-b5ef-56a13f724d2e}" mode="4" >0</value>
<value id="{ef9f87d9-45b5-4bb9-828b-46e9f81cf299}" mode="1" >0.30951327</value>
<value id="{ef9f87d9-45b5-4bb9-828b-46e9f81cf299}" mode="2" >0.50000000</value>
<value id="{f52d8384-6081-4733-a9ef-6378b8d33982}" mode="1" >0.30000001</value>
<value id="{5d0758ab-f340-4586-958d-824441102526}" mode="1" >0.49000001</value>
<value id="{f9f660a0-91e5-4f94-8cbf-632cdcd28acd}" mode="1" >1.00000000</value>
<value id="{f9f660a0-91e5-4f94-8cbf-632cdcd28acd}" mode="4" >1</value>
<value id="{ce0872db-aab3-4f5f-a0d4-8cc33874104e}" mode="1" >76.00000000</value>
<value id="{18454320-3c62-4167-95ec-9a47bbb2bb3e}" mode="1" >76.00000000</value>
<value id="{3fccbaf9-9ea9-481b-ad5e-4ddc088db950}" mode="1" >2.55999994</value>
<value id="{ae9c2bdd-a785-4fa8-80c3-9d32b4849aa0}" mode="1" >298.39999390</value>
<value id="{d526a243-3315-44ef-ac3d-279fccd28769}" mode="1" >0.34250000</value>
<value id="{9c1b3dc3-0a45-4b2f-8219-89204c771049}" mode="1" >0.80000001</value>
<value id="{dc7a4d69-1ef6-4dc7-9e14-fc402d4bb43c}" mode="1" >298.39999390</value>
<value id="{f14a4447-0aae-4d71-8a05-45ce212779d5}" mode="1" >0.34250000</value>
<value id="{85025874-5f38-4a8f-bf54-9cdbf7567449}" mode="1" >2.55999994</value>
<value id="{ca28474e-d396-486b-8fdf-ff5094e77d70}" mode="1" >0.80000001</value>
<value id="{ca28474e-d396-486b-8fdf-ff5094e77d70}" mode="4" >0.800</value>
</preset>
<preset name="Impro" number="2" >
<value id="{15a8ec14-710f-43e6-be9e-f5dc8c8786cb}" mode="4" >/Users/eug/Documents/CSD/PilotMono.wav</value>
<value id="{8c630a69-dc58-46a0-a696-60bc59cec1d6}" mode="4" >/Users/eug/Documents/CSD/PilotMono.wav</value>
<value id="{c4cdc52a-fbd1-4a5a-a374-1a47972563d2}" mode="1" >0.12109863</value>
<value id="{c4cdc52a-fbd1-4a5a-a374-1a47972563d2}" mode="2" >0.50000000</value>
<value id="{a7476a63-a50a-4452-9e14-f6c453db56db}" mode="1" >19.00000000</value>
<value id="{53f94227-adf2-4acc-8fea-795c9fb32852}" mode="1" >3.00000000</value>
<value id="{3c00b237-547f-4609-aab0-188ed2b2faf8}" mode="1" >0.06000000</value>
<value id="{b0f2b923-b9fd-4c4c-9160-78e5947d66e4}" mode="1" >0.41635999</value>
<value id="{640372ff-dfd8-4bdc-a994-4b92c2956b03}" mode="1" >0.00000000</value>
<value id="{0004f65f-fc56-4676-af99-5f5131293987}" mode="1" >0.00000000</value>
<value id="{6bad3d2e-c0fe-4d4c-ba1e-ad0a1263b5ad}" mode="1" >0.41635999</value>
<value id="{8ab014b6-3163-4a0a-a58c-6d1bff22859d}" mode="1" >6.86407852</value>
<value id="{8ab014b6-3163-4a0a-a58c-6d1bff22859d}" mode="4" >6.864</value>
<value id="{f22544d5-4565-4be6-a82d-ddebd6db2e37}" mode="1" >1.00000000</value>
<value id="{f22544d5-4565-4be6-a82d-ddebd6db2e37}" mode="4" >1</value>
<value id="{85a560ea-d4ec-4cb7-9ee9-a43e5ff845fe}" mode="1" >0.58437651</value>
<value id="{85a560ea-d4ec-4cb7-9ee9-a43e5ff845fe}" mode="2" >0.50000000</value>
<value id="{1923321b-bf28-4f93-aaea-787116eef9f3}" mode="1" >0.00000000</value>
<value id="{1923321b-bf28-4f93-aaea-787116eef9f3}" mode="4" >0</value>
<value id="{8af41878-52af-4607-9406-afbf3673eea5}" mode="1" >0.00000000</value>
<value id="{7f13ca46-f149-4c5c-9a02-9b9a4d2bef99}" mode="1" >0.00000000</value>
<value id="{e195f144-f2ff-4386-8c59-9dd96d7a5a7b}" mode="1" >0.25999999</value>
<value id="{5be30767-b1c9-498e-8b71-8ecccb6068da}" mode="1" >0.25999999</value>
<value id="{5be30767-b1c9-498e-8b71-8ecccb6068da}" mode="4" >0.260</value>
<value id="{9b6ab007-6fca-4610-ba63-bdb5c82e6c1a}" mode="1" >0.51004899</value>
<value id="{9267574a-8201-4ed8-afe9-c0ff362e8929}" mode="1" >0.51004899</value>
<value id="{09f789f0-c317-4ae8-9e6f-07e8b382fdf9}" mode="1" >0.10000000</value>
<value id="{1081fe51-0656-4788-b97f-422f050b203c}" mode="1" >0.10000000</value>
<value id="{089e293f-aae0-47ee-887f-88465332abbd}" mode="1" >0.76999998</value>
<value id="{90193a73-2def-44a8-9b62-8e8ad3273de3}" mode="1" >0.76999998</value>
<value id="{2ac63c02-c813-4243-8af5-e5fa4844d9cc}" mode="1" >0.63700002</value>
<value id="{45bf2fa1-a79e-43b1-a4b3-4446c6e33c50}" mode="1" >0.63700002</value>
<value id="{f2c9a9f4-5666-45ca-b2ed-d7805d464dfd}" mode="1" >9100.00000000</value>
<value id="{499d271e-d552-41b2-a18e-5a4ac67710f3}" mode="1" >9100.00000000</value>
<value id="{bb57b66d-6c93-4c54-bc6b-78050408f7fa}" mode="1" >0.31000000</value>
<value id="{a915f737-55e6-4989-aa4f-faff34cd87e4}" mode="1" >0.31000000</value>
<value id="{fe0bd4a9-ff99-4649-bdd2-0a6ce755bf34}" mode="1" >0.50000000</value>
<value id="{f6967175-8d39-43fa-a866-5638b6a989a6}" mode="1" >1.00000000</value>
<value id="{3cb5be56-f2a8-4de2-b9fc-88b3431aeb62}" mode="1" >-255.00000000</value>
<value id="{26f15c27-62bc-4bdb-943e-6a0dad1f3396}" mode="4" >0</value>
<value id="{3c87eabf-5600-41c6-a2b3-d9aefd184a27}" mode="4" >0</value>
<value id="{535c4f1a-28ea-409a-b76b-54833fc4e63b}" mode="1" >1.00000000</value>
<value id="{535c4f1a-28ea-409a-b76b-54833fc4e63b}" mode="4" >1.000</value>
<value id="{beb08e79-4b1c-412c-89c1-b69e840746da}" mode="4" >0</value>
<value id="{bdcfcbcc-e2ec-4aa1-bf26-b94cd6715752}" mode="1" >0.58437651</value>
<value id="{bdcfcbcc-e2ec-4aa1-bf26-b94cd6715752}" mode="4" >0.584</value>
<value id="{27d29594-319f-4f9e-813b-0aff6ed2953b}" mode="1" >0.00000000</value>
<value id="{503da0e5-9e0e-44b1-8c29-683ba373067f}" mode="4" >0</value>
<value id="{d7e38189-c7d9-42cc-81ae-e25152592652}" mode="4" >0</value>
<value id="{9ddd72fa-f4ec-4be3-afba-f8662b0402af}" mode="4" >/Users/eug/Documents/CSD/PROVA_SAGRA.txt</value>
<value id="{ea72fd6f-9281-4866-b5c4-50a46941e04a}" mode="4" >/Users/eug/Documents/CSD/PROVA_SAGRA.txt</value>
<value id="{0e15a5b3-2dac-4913-9ddd-df611adaeddd}" mode="4" >0</value>
<value id="{6c716047-095f-4f2f-9a44-4400a27f1405}" mode="4" >0</value>
<value id="{fa99983b-531f-4bdb-b0d1-1103482bf31e}" mode="1" >29.18918991</value>
<value id="{bb6c6076-68e7-4a56-999f-0b0fc8d23b15}" mode="1" >3.10810804</value>
<value id="{bac6ca6e-8f37-4e38-86d9-12afbed0bd20}" mode="1" >3.10810804</value>
<value id="{9f0a35bd-79b2-42a0-a8ee-48ff8f933de7}" mode="4" >0</value>
<value id="{3c733b0b-b218-405d-a46c-38ba9b44951f}" mode="1" >29.18600082</value>
<value id="{3c733b0b-b218-405d-a46c-38ba9b44951f}" mode="4" >29.186</value>
<value id="{ce441376-e8e7-4eb4-b88e-5f49c9067568}" mode="1" >29.18918991</value>
<value id="{307c51c1-352d-4742-a97b-42f3fd14ac5e}" mode="1" >0.99995703</value>
<value id="{307c51c1-352d-4742-a97b-42f3fd14ac5e}" mode="2" >0.50000000</value>
<value id="{82d7be60-9bde-452d-b6c5-5f6a6edc5f54}" mode="1" >0.50000000</value>
<value id="{39c1db49-1d03-4f10-b5ef-56a13f724d2e}" mode="1" >0.00000000</value>
<value id="{39c1db49-1d03-4f10-b5ef-56a13f724d2e}" mode="4" >0</value>
<value id="{ef9f87d9-45b5-4bb9-828b-46e9f81cf299}" mode="1" >0.30951327</value>
<value id="{ef9f87d9-45b5-4bb9-828b-46e9f81cf299}" mode="2" >0.50000000</value>
<value id="{f52d8384-6081-4733-a9ef-6378b8d33982}" mode="1" >0.30000001</value>
<value id="{5d0758ab-f340-4586-958d-824441102526}" mode="1" >0.06000000</value>
<value id="{f9f660a0-91e5-4f94-8cbf-632cdcd28acd}" mode="1" >1.00000000</value>
<value id="{f9f660a0-91e5-4f94-8cbf-632cdcd28acd}" mode="4" >1</value>
<value id="{ce0872db-aab3-4f5f-a0d4-8cc33874104e}" mode="1" >76.00000000</value>
<value id="{18454320-3c62-4167-95ec-9a47bbb2bb3e}" mode="1" >76.00000000</value>
<value id="{3fccbaf9-9ea9-481b-ad5e-4ddc088db950}" mode="1" >2.55999994</value>
<value id="{ae9c2bdd-a785-4fa8-80c3-9d32b4849aa0}" mode="1" >298.39999390</value>
<value id="{d526a243-3315-44ef-ac3d-279fccd28769}" mode="1" >0.34250000</value>
<value id="{9c1b3dc3-0a45-4b2f-8219-89204c771049}" mode="1" >0.80000001</value>
<value id="{dc7a4d69-1ef6-4dc7-9e14-fc402d4bb43c}" mode="1" >298.39999390</value>
<value id="{f14a4447-0aae-4d71-8a05-45ce212779d5}" mode="1" >0.34250000</value>
<value id="{85025874-5f38-4a8f-bf54-9cdbf7567449}" mode="1" >2.55999994</value>
<value id="{ca28474e-d396-486b-8fdf-ff5094e77d70}" mode="1" >0.80000001</value>
<value id="{ca28474e-d396-486b-8fdf-ff5094e77d70}" mode="4" >0.800</value>
</preset>
<preset name="Ostinato" number="3" >
<value id="{15a8ec14-710f-43e6-be9e-f5dc8c8786cb}" mode="4" >/Users/eug/Documents/CSD/GetFooled_DRY.wav</value>
<value id="{8c630a69-dc58-46a0-a696-60bc59cec1d6}" mode="4" >/Users/eug/Documents/CSD/GetFooled_DRY.wav</value>
<value id="{c4cdc52a-fbd1-4a5a-a374-1a47972563d2}" mode="1" >0.12109863</value>
<value id="{c4cdc52a-fbd1-4a5a-a374-1a47972563d2}" mode="2" >0.50000000</value>
<value id="{a7476a63-a50a-4452-9e14-f6c453db56db}" mode="1" >17.00000000</value>
<value id="{53f94227-adf2-4acc-8fea-795c9fb32852}" mode="1" >3.00000000</value>
<value id="{3c00b237-547f-4609-aab0-188ed2b2faf8}" mode="1" >0.25999999</value>
<value id="{b0f2b923-b9fd-4c4c-9160-78e5947d66e4}" mode="1" >0.19496000</value>
<value id="{640372ff-dfd8-4bdc-a994-4b92c2956b03}" mode="1" >24.00000000</value>
<value id="{0004f65f-fc56-4676-af99-5f5131293987}" mode="1" >24.00000000</value>
<value id="{6bad3d2e-c0fe-4d4c-ba1e-ad0a1263b5ad}" mode="1" >0.19496000</value>
<value id="{8ab014b6-3163-4a0a-a58c-6d1bff22859d}" mode="1" >53.89722824</value>
<value id="{8ab014b6-3163-4a0a-a58c-6d1bff22859d}" mode="4" >53.897</value>
<value id="{f22544d5-4565-4be6-a82d-ddebd6db2e37}" mode="1" >1.00000000</value>
<value id="{f22544d5-4565-4be6-a82d-ddebd6db2e37}" mode="4" >1</value>
<value id="{85a560ea-d4ec-4cb7-9ee9-a43e5ff845fe}" mode="1" >0.00024179</value>
<value id="{85a560ea-d4ec-4cb7-9ee9-a43e5ff845fe}" mode="2" >0.50000000</value>
<value id="{1923321b-bf28-4f93-aaea-787116eef9f3}" mode="1" >0.00000000</value>
<value id="{1923321b-bf28-4f93-aaea-787116eef9f3}" mode="4" >0</value>
<value id="{8af41878-52af-4607-9406-afbf3673eea5}" mode="1" >0.00000000</value>
<value id="{7f13ca46-f149-4c5c-9a02-9b9a4d2bef99}" mode="1" >0.00000000</value>
<value id="{e195f144-f2ff-4386-8c59-9dd96d7a5a7b}" mode="1" >0.08000000</value>
<value id="{5be30767-b1c9-498e-8b71-8ecccb6068da}" mode="1" >0.08000000</value>
<value id="{5be30767-b1c9-498e-8b71-8ecccb6068da}" mode="4" >0.080</value>
<value id="{9b6ab007-6fca-4610-ba63-bdb5c82e6c1a}" mode="1" >0.00010000</value>
<value id="{9267574a-8201-4ed8-afe9-c0ff362e8929}" mode="1" >0.00010000</value>
<value id="{09f789f0-c317-4ae8-9e6f-07e8b382fdf9}" mode="1" >0.10000000</value>
<value id="{1081fe51-0656-4788-b97f-422f050b203c}" mode="1" >0.10000000</value>
<value id="{089e293f-aae0-47ee-887f-88465332abbd}" mode="1" >0.86000001</value>
<value id="{90193a73-2def-44a8-9b62-8e8ad3273de3}" mode="1" >0.86000001</value>
<value id="{2ac63c02-c813-4243-8af5-e5fa4844d9cc}" mode="1" >0.88200003</value>
<value id="{45bf2fa1-a79e-43b1-a4b3-4446c6e33c50}" mode="1" >0.88200003</value>
<value id="{f2c9a9f4-5666-45ca-b2ed-d7805d464dfd}" mode="1" >9100.00000000</value>
<value id="{499d271e-d552-41b2-a18e-5a4ac67710f3}" mode="1" >9100.00000000</value>
<value id="{bb57b66d-6c93-4c54-bc6b-78050408f7fa}" mode="1" >0.00000000</value>
<value id="{a915f737-55e6-4989-aa4f-faff34cd87e4}" mode="1" >0.00000000</value>
<value id="{fe0bd4a9-ff99-4649-bdd2-0a6ce755bf34}" mode="1" >0.64999998</value>
<value id="{f6967175-8d39-43fa-a866-5638b6a989a6}" mode="1" >1.00000000</value>
<value id="{3cb5be56-f2a8-4de2-b9fc-88b3431aeb62}" mode="1" >-255.00000000</value>
<value id="{26f15c27-62bc-4bdb-943e-6a0dad1f3396}" mode="4" >0</value>
<value id="{3c87eabf-5600-41c6-a2b3-d9aefd184a27}" mode="4" >0</value>
<value id="{535c4f1a-28ea-409a-b76b-54833fc4e63b}" mode="1" >2.00000000</value>
<value id="{535c4f1a-28ea-409a-b76b-54833fc4e63b}" mode="4" >2.000</value>
<value id="{beb08e79-4b1c-412c-89c1-b69e840746da}" mode="4" >0</value>
<value id="{bdcfcbcc-e2ec-4aa1-bf26-b94cd6715752}" mode="1" >0.00024179</value>
<value id="{bdcfcbcc-e2ec-4aa1-bf26-b94cd6715752}" mode="4" >0.000</value>
<value id="{27d29594-319f-4f9e-813b-0aff6ed2953b}" mode="1" >0.00000000</value>
<value id="{503da0e5-9e0e-44b1-8c29-683ba373067f}" mode="4" >0</value>
<value id="{d7e38189-c7d9-42cc-81ae-e25152592652}" mode="4" >0</value>
<value id="{9ddd72fa-f4ec-4be3-afba-f8662b0402af}" mode="4" >/Users/eug/Documents/CSD/PROVA_SAGRA.txt</value>
<value id="{ea72fd6f-9281-4866-b5c4-50a46941e04a}" mode="4" >/Users/eug/Documents/CSD/PROVA_SAGRA.txt</value>
<value id="{0e15a5b3-2dac-4913-9ddd-df611adaeddd}" mode="4" >0</value>
<value id="{6c716047-095f-4f2f-9a44-4400a27f1405}" mode="4" >0</value>
<value id="{fa99983b-531f-4bdb-b0d1-1103482bf31e}" mode="1" >29.18918991</value>
<value id="{bb6c6076-68e7-4a56-999f-0b0fc8d23b15}" mode="1" >3.10810804</value>
<value id="{bac6ca6e-8f37-4e38-86d9-12afbed0bd20}" mode="1" >3.10810804</value>
<value id="{9f0a35bd-79b2-42a0-a8ee-48ff8f933de7}" mode="4" >0</value>
<value id="{3c733b0b-b218-405d-a46c-38ba9b44951f}" mode="1" >29.18600082</value>
<value id="{3c733b0b-b218-405d-a46c-38ba9b44951f}" mode="4" >29.186</value>
<value id="{ce441376-e8e7-4eb4-b88e-5f49c9067568}" mode="1" >29.18918991</value>
<value id="{307c51c1-352d-4742-a97b-42f3fd14ac5e}" mode="1" >0.99995703</value>
<value id="{307c51c1-352d-4742-a97b-42f3fd14ac5e}" mode="2" >0.50000000</value>
<value id="{82d7be60-9bde-452d-b6c5-5f6a6edc5f54}" mode="1" >0.64999998</value>
<value id="{39c1db49-1d03-4f10-b5ef-56a13f724d2e}" mode="1" >0.00000000</value>
<value id="{39c1db49-1d03-4f10-b5ef-56a13f724d2e}" mode="4" >0</value>
<value id="{ef9f87d9-45b5-4bb9-828b-46e9f81cf299}" mode="1" >0.16769832</value>
<value id="{ef9f87d9-45b5-4bb9-828b-46e9f81cf299}" mode="2" >0.50000000</value>
<value id="{f52d8384-6081-4733-a9ef-6378b8d33982}" mode="1" >0.30000001</value>
<value id="{5d0758ab-f340-4586-958d-824441102526}" mode="1" >0.25999999</value>
<value id="{f9f660a0-91e5-4f94-8cbf-632cdcd28acd}" mode="1" >1.00000000</value>
<value id="{f9f660a0-91e5-4f94-8cbf-632cdcd28acd}" mode="4" >1</value>
<value id="{ce0872db-aab3-4f5f-a0d4-8cc33874104e}" mode="1" >0.00000000</value>
<value id="{18454320-3c62-4167-95ec-9a47bbb2bb3e}" mode="1" >0.00000000</value>
<value id="{3fccbaf9-9ea9-481b-ad5e-4ddc088db950}" mode="1" >2.55999994</value>
<value id="{ae9c2bdd-a785-4fa8-80c3-9d32b4849aa0}" mode="1" >394.39999390</value>
<value id="{d526a243-3315-44ef-ac3d-279fccd28769}" mode="1" >0.71300000</value>
<value id="{9c1b3dc3-0a45-4b2f-8219-89204c771049}" mode="1" >0.76999998</value>
<value id="{dc7a4d69-1ef6-4dc7-9e14-fc402d4bb43c}" mode="1" >394.39999390</value>
<value id="{f14a4447-0aae-4d71-8a05-45ce212779d5}" mode="1" >0.71300000</value>
<value id="{85025874-5f38-4a8f-bf54-9cdbf7567449}" mode="1" >2.55999994</value>
<value id="{ca28474e-d396-486b-8fdf-ff5094e77d70}" mode="1" >0.76999998</value>
<value id="{ca28474e-d396-486b-8fdf-ff5094e77d70}" mode="4" >0.770</value>
</preset>
<preset name="New_Saxes" number="10" >
<value id="{15a8ec14-710f-43e6-be9e-f5dc8c8786cb}" mode="4" >/Users/eug/Documents/CSD/Tenor_Sax.wav</value>
<value id="{8c630a69-dc58-46a0-a696-60bc59cec1d6}" mode="4" >/Users/eug/Documents/CSD/Tenor_Sax.wav</value>
<value id="{c4cdc52a-fbd1-4a5a-a374-1a47972563d2}" mode="1" >0.26342073</value>
<value id="{c4cdc52a-fbd1-4a5a-a374-1a47972563d2}" mode="2" >0.50000000</value>
<value id="{a7476a63-a50a-4452-9e14-f6c453db56db}" mode="1" >19.00000000</value>
<value id="{53f94227-adf2-4acc-8fea-795c9fb32852}" mode="1" >1.00000000</value>
<value id="{3c00b237-547f-4609-aab0-188ed2b2faf8}" mode="1" >0.00000000</value>
<value id="{b0f2b923-b9fd-4c4c-9160-78e5947d66e4}" mode="1" >0.50000000</value>
<value id="{640372ff-dfd8-4bdc-a994-4b92c2956b03}" mode="1" >0.00000000</value>
<value id="{0004f65f-fc56-4676-af99-5f5131293987}" mode="1" >0.00000000</value>
<value id="{6bad3d2e-c0fe-4d4c-ba1e-ad0a1263b5ad}" mode="1" >0.50000000</value>
<value id="{8ab014b6-3163-4a0a-a58c-6d1bff22859d}" mode="1" >1.00000000</value>
<value id="{8ab014b6-3163-4a0a-a58c-6d1bff22859d}" mode="4" >1.000</value>
<value id="{f22544d5-4565-4be6-a82d-ddebd6db2e37}" mode="1" >0.00000000</value>
<value id="{f22544d5-4565-4be6-a82d-ddebd6db2e37}" mode="4" >0</value>
<value id="{85a560ea-d4ec-4cb7-9ee9-a43e5ff845fe}" mode="1" >0.00000000</value>
<value id="{85a560ea-d4ec-4cb7-9ee9-a43e5ff845fe}" mode="2" >0.50000000</value>
<value id="{1923321b-bf28-4f93-aaea-787116eef9f3}" mode="1" >0.00000000</value>
<value id="{1923321b-bf28-4f93-aaea-787116eef9f3}" mode="4" >0</value>
<value id="{8af41878-52af-4607-9406-afbf3673eea5}" mode="1" >0.22000000</value>
<value id="{7f13ca46-f149-4c5c-9a02-9b9a4d2bef99}" mode="1" >0.22000000</value>
<value id="{e195f144-f2ff-4386-8c59-9dd96d7a5a7b}" mode="1" >0.25999999</value>
<value id="{5be30767-b1c9-498e-8b71-8ecccb6068da}" mode="1" >0.25999999</value>
<value id="{5be30767-b1c9-498e-8b71-8ecccb6068da}" mode="4" >0.260</value>
<value id="{9b6ab007-6fca-4610-ba63-bdb5c82e6c1a}" mode="1" >0.10009500</value>
<value id="{9267574a-8201-4ed8-afe9-c0ff362e8929}" mode="1" >0.10009500</value>
<value id="{09f789f0-c317-4ae8-9e6f-07e8b382fdf9}" mode="1" >0.10000000</value>
<value id="{1081fe51-0656-4788-b97f-422f050b203c}" mode="1" >0.10000000</value>
<value id="{089e293f-aae0-47ee-887f-88465332abbd}" mode="1" >0.88000000</value>
<value id="{90193a73-2def-44a8-9b62-8e8ad3273de3}" mode="1" >0.88000000</value>
<value id="{2ac63c02-c813-4243-8af5-e5fa4844d9cc}" mode="1" >0.75459999</value>
<value id="{45bf2fa1-a79e-43b1-a4b3-4446c6e33c50}" mode="1" >0.75459999</value>
<value id="{f2c9a9f4-5666-45ca-b2ed-d7805d464dfd}" mode="1" >9100.00000000</value>
<value id="{499d271e-d552-41b2-a18e-5a4ac67710f3}" mode="1" >9100.00000000</value>
<value id="{bb57b66d-6c93-4c54-bc6b-78050408f7fa}" mode="1" >0.27000001</value>
<value id="{a915f737-55e6-4989-aa4f-faff34cd87e4}" mode="1" >0.27000001</value>
<value id="{fe0bd4a9-ff99-4649-bdd2-0a6ce755bf34}" mode="1" >0.82999998</value>
<value id="{f6967175-8d39-43fa-a866-5638b6a989a6}" mode="1" >1.00000000</value>
<value id="{3cb5be56-f2a8-4de2-b9fc-88b3431aeb62}" mode="1" >-255.00000000</value>
<value id="{26f15c27-62bc-4bdb-943e-6a0dad1f3396}" mode="4" >0</value>
<value id="{3c87eabf-5600-41c6-a2b3-d9aefd184a27}" mode="4" >0</value>
<value id="{535c4f1a-28ea-409a-b76b-54833fc4e63b}" mode="1" >2.00000000</value>
<value id="{535c4f1a-28ea-409a-b76b-54833fc4e63b}" mode="4" >2.000</value>
<value id="{beb08e79-4b1c-412c-89c1-b69e840746da}" mode="4" >0</value>
<value id="{bdcfcbcc-e2ec-4aa1-bf26-b94cd6715752}" mode="1" >0.00000000</value>
<value id="{bdcfcbcc-e2ec-4aa1-bf26-b94cd6715752}" mode="4" >0.000</value>
<value id="{27d29594-319f-4f9e-813b-0aff6ed2953b}" mode="1" >0.00000000</value>
<value id="{503da0e5-9e0e-44b1-8c29-683ba373067f}" mode="4" >0</value>
<value id="{d7e38189-c7d9-42cc-81ae-e25152592652}" mode="4" >0</value>
<value id="{9ddd72fa-f4ec-4be3-afba-f8662b0402af}" mode="4" >/Users/eug/Documents/CSD/PROVA_SAGRA.txt</value>
<value id="{ea72fd6f-9281-4866-b5c4-50a46941e04a}" mode="4" >/Users/eug/Documents/CSD/PROVA_SAGRA.txt</value>
<value id="{0e15a5b3-2dac-4913-9ddd-df611adaeddd}" mode="4" >0</value>
<value id="{6c716047-095f-4f2f-9a44-4400a27f1405}" mode="4" >0</value>
<value id="{fa99983b-531f-4bdb-b0d1-1103482bf31e}" mode="1" >29.18918991</value>
<value id="{bb6c6076-68e7-4a56-999f-0b0fc8d23b15}" mode="1" >3.10810804</value>
<value id="{bac6ca6e-8f37-4e38-86d9-12afbed0bd20}" mode="1" >3.10810804</value>
<value id="{9f0a35bd-79b2-42a0-a8ee-48ff8f933de7}" mode="4" >0</value>
<value id="{3c733b0b-b218-405d-a46c-38ba9b44951f}" mode="1" >2.87958121</value>
<value id="{3c733b0b-b218-405d-a46c-38ba9b44951f}" mode="4" >2.880</value>
<value id="{ce441376-e8e7-4eb4-b88e-5f49c9067568}" mode="1" >29.18918991</value>
<value id="{307c51c1-352d-4742-a97b-42f3fd14ac5e}" mode="1" >0.36494726</value>
<value id="{307c51c1-352d-4742-a97b-42f3fd14ac5e}" mode="2" >0.50000000</value>
<value id="{82d7be60-9bde-452d-b6c5-5f6a6edc5f54}" mode="1" >0.82999998</value>
<value id="{39c1db49-1d03-4f10-b5ef-56a13f724d2e}" mode="1" >0.00000000</value>
<value id="{39c1db49-1d03-4f10-b5ef-56a13f724d2e}" mode="4" >0</value>
<value id="{ef9f87d9-45b5-4bb9-828b-46e9f81cf299}" mode="1" >0.28384659</value>
<value id="{ef9f87d9-45b5-4bb9-828b-46e9f81cf299}" mode="2" >0.50000000</value>
<value id="{f52d8384-6081-4733-a9ef-6378b8d33982}" mode="1" >0.30000001</value>
<value id="{5d0758ab-f340-4586-958d-824441102526}" mode="1" >0.00000000</value>
<value id="{f9f660a0-91e5-4f94-8cbf-632cdcd28acd}" mode="1" >1.00000000</value>
<value id="{f9f660a0-91e5-4f94-8cbf-632cdcd28acd}" mode="4" >1</value>
<value id="{ce0872db-aab3-4f5f-a0d4-8cc33874104e}" mode="1" >200.00000000</value>
<value id="{18454320-3c62-4167-95ec-9a47bbb2bb3e}" mode="1" >200.00000000</value>
<value id="{3fccbaf9-9ea9-481b-ad5e-4ddc088db950}" mode="1" >7.67999983</value>
<value id="{ae9c2bdd-a785-4fa8-80c3-9d32b4849aa0}" mode="1" >418.39999390</value>
<value id="{d526a243-3315-44ef-ac3d-279fccd28769}" mode="1" >0.61549997</value>
<value id="{9c1b3dc3-0a45-4b2f-8219-89204c771049}" mode="1" >0.20000000</value>
<value id="{dc7a4d69-1ef6-4dc7-9e14-fc402d4bb43c}" mode="1" >418.39999390</value>
<value id="{f14a4447-0aae-4d71-8a05-45ce212779d5}" mode="1" >0.61549997</value>
<value id="{85025874-5f38-4a8f-bf54-9cdbf7567449}" mode="1" >7.67999983</value>
<value id="{ca28474e-d396-486b-8fdf-ff5094e77d70}" mode="1" >0.20000000</value>
<value id="{ca28474e-d396-486b-8fdf-ff5094e77d70}" mode="4" >0.200</value>
<value id="{fbb7146b-66ef-4783-bb1b-f1766bd81f50}" mode="4" >0</value>
</preset>
<preset name="New_Saxes_fast" number="11" >
<value id="{15a8ec14-710f-43e6-be9e-f5dc8c8786cb}" mode="4" >/Users/eug/Documents/CSD/Tenor_Sax.wav</value>
<value id="{8c630a69-dc58-46a0-a696-60bc59cec1d6}" mode="4" >/Users/eug/Documents/CSD/Tenor_Sax.wav</value>
<value id="{c4cdc52a-fbd1-4a5a-a374-1a47972563d2}" mode="1" >0.26342073</value>
<value id="{c4cdc52a-fbd1-4a5a-a374-1a47972563d2}" mode="2" >0.50000000</value>
<value id="{a7476a63-a50a-4452-9e14-f6c453db56db}" mode="1" >19.00000000</value>
<value id="{53f94227-adf2-4acc-8fea-795c9fb32852}" mode="1" >6.00000000</value>
<value id="{3c00b237-547f-4609-aab0-188ed2b2faf8}" mode="1" >0.15238349</value>
<value id="{b0f2b923-b9fd-4c4c-9160-78e5947d66e4}" mode="1" >0.11107922</value>
<value id="{640372ff-dfd8-4bdc-a994-4b92c2956b03}" mode="1" >-16.31793976</value>
<value id="{0004f65f-fc56-4676-af99-5f5131293987}" mode="1" >-16.31793976</value>
<value id="{6bad3d2e-c0fe-4d4c-ba1e-ad0a1263b5ad}" mode="1" >0.11107922</value>
<value id="{8ab014b6-3163-4a0a-a58c-6d1bff22859d}" mode="1" >24.73448372</value>
<value id="{8ab014b6-3163-4a0a-a58c-6d1bff22859d}" mode="4" >24.734</value>
<value id="{f22544d5-4565-4be6-a82d-ddebd6db2e37}" mode="1" >0.00000000</value>
<value id="{f22544d5-4565-4be6-a82d-ddebd6db2e37}" mode="4" >0</value>
<value id="{85a560ea-d4ec-4cb7-9ee9-a43e5ff845fe}" mode="1" >0.00000000</value>
<value id="{85a560ea-d4ec-4cb7-9ee9-a43e5ff845fe}" mode="2" >0.50000000</value>
<value id="{1923321b-bf28-4f93-aaea-787116eef9f3}" mode="1" >0.00000000</value>
<value id="{1923321b-bf28-4f93-aaea-787116eef9f3}" mode="4" >0</value>
<value id="{8af41878-52af-4607-9406-afbf3673eea5}" mode="1" >0.22000000</value>
<value id="{7f13ca46-f149-4c5c-9a02-9b9a4d2bef99}" mode="1" >0.22000000</value>
<value id="{e195f144-f2ff-4386-8c59-9dd96d7a5a7b}" mode="1" >0.16476032</value>
<value id="{5be30767-b1c9-498e-8b71-8ecccb6068da}" mode="1" >0.16476032</value>
<value id="{5be30767-b1c9-498e-8b71-8ecccb6068da}" mode="4" >0.165</value>
<value id="{9b6ab007-6fca-4610-ba63-bdb5c82e6c1a}" mode="1" >0.10009500</value>
<value id="{9267574a-8201-4ed8-afe9-c0ff362e8929}" mode="1" >0.10009500</value>
<value id="{09f789f0-c317-4ae8-9e6f-07e8b382fdf9}" mode="1" >0.10000000</value>
<value id="{1081fe51-0656-4788-b97f-422f050b203c}" mode="1" >0.10000000</value>
<value id="{089e293f-aae0-47ee-887f-88465332abbd}" mode="1" >0.88000000</value>
<value id="{90193a73-2def-44a8-9b62-8e8ad3273de3}" mode="1" >0.88000000</value>
<value id="{2ac63c02-c813-4243-8af5-e5fa4844d9cc}" mode="1" >0.75459999</value>
<value id="{45bf2fa1-a79e-43b1-a4b3-4446c6e33c50}" mode="1" >0.75459999</value>
<value id="{f2c9a9f4-5666-45ca-b2ed-d7805d464dfd}" mode="1" >9100.00000000</value>
<value id="{499d271e-d552-41b2-a18e-5a4ac67710f3}" mode="1" >9100.00000000</value>
<value id="{bb57b66d-6c93-4c54-bc6b-78050408f7fa}" mode="1" >0.04142476</value>
<value id="{a915f737-55e6-4989-aa4f-faff34cd87e4}" mode="1" >0.04142476</value>
<value id="{fe0bd4a9-ff99-4649-bdd2-0a6ce755bf34}" mode="1" >0.82999998</value>
<value id="{f6967175-8d39-43fa-a866-5638b6a989a6}" mode="1" >1.00000000</value>
<value id="{3cb5be56-f2a8-4de2-b9fc-88b3431aeb62}" mode="1" >-255.00000000</value>
<value id="{26f15c27-62bc-4bdb-943e-6a0dad1f3396}" mode="4" >0</value>
<value id="{3c87eabf-5600-41c6-a2b3-d9aefd184a27}" mode="4" >0</value>
<value id="{535c4f1a-28ea-409a-b76b-54833fc4e63b}" mode="1" >2.00000000</value>
<value id="{535c4f1a-28ea-409a-b76b-54833fc4e63b}" mode="4" >2.000</value>
<value id="{beb08e79-4b1c-412c-89c1-b69e840746da}" mode="4" >0</value>
<value id="{bdcfcbcc-e2ec-4aa1-bf26-b94cd6715752}" mode="1" >0.00000000</value>
<value id="{bdcfcbcc-e2ec-4aa1-bf26-b94cd6715752}" mode="4" >0.000</value>
<value id="{27d29594-319f-4f9e-813b-0aff6ed2953b}" mode="1" >1.00000000</value>
<value id="{503da0e5-9e0e-44b1-8c29-683ba373067f}" mode="4" >0</value>
<value id="{d7e38189-c7d9-42cc-81ae-e25152592652}" mode="4" >0</value>
<value id="{9ddd72fa-f4ec-4be3-afba-f8662b0402af}" mode="4" >/Users/eug/Documents/CSD/PROVA_SAGRA.txt</value>
<value id="{ea72fd6f-9281-4866-b5c4-50a46941e04a}" mode="4" >/Users/eug/Documents/CSD/PROVA_SAGRA.txt</value>
<value id="{0e15a5b3-2dac-4913-9ddd-df611adaeddd}" mode="4" >0</value>
<value id="{6c716047-095f-4f2f-9a44-4400a27f1405}" mode="4" >0</value>
<value id="{fa99983b-531f-4bdb-b0d1-1103482bf31e}" mode="1" >34.12567520</value>
<value id="{bb6c6076-68e7-4a56-999f-0b0fc8d23b15}" mode="1" >3.10810804</value>
<value id="{bac6ca6e-8f37-4e38-86d9-12afbed0bd20}" mode="1" >3.10810804</value>
<value id="{9f0a35bd-79b2-42a0-a8ee-48ff8f933de7}" mode="4" >0</value>
<value id="{3c733b0b-b218-405d-a46c-38ba9b44951f}" mode="1" >34.12236786</value>
<value id="{3c733b0b-b218-405d-a46c-38ba9b44951f}" mode="4" >34.122</value>
<value id="{ce441376-e8e7-4eb4-b88e-5f49c9067568}" mode="1" >34.12567520</value>
<value id="{307c51c1-352d-4742-a97b-42f3fd14ac5e}" mode="1" >0.99996120</value>
<value id="{307c51c1-352d-4742-a97b-42f3fd14ac5e}" mode="2" >0.50000000</value>
<value id="{82d7be60-9bde-452d-b6c5-5f6a6edc5f54}" mode="1" >0.82999998</value>
<value id="{39c1db49-1d03-4f10-b5ef-56a13f724d2e}" mode="1" >0.00000000</value>
<value id="{39c1db49-1d03-4f10-b5ef-56a13f724d2e}" mode="4" >0</value>
<value id="{ef9f87d9-45b5-4bb9-828b-46e9f81cf299}" mode="1" >0.28384659</value>
<value id="{ef9f87d9-45b5-4bb9-828b-46e9f81cf299}" mode="2" >0.50000000</value>
<value id="{f52d8384-6081-4733-a9ef-6378b8d33982}" mode="1" >0.30000001</value>
<value id="{5d0758ab-f340-4586-958d-824441102526}" mode="1" >0.15238349</value>
<value id="{f9f660a0-91e5-4f94-8cbf-632cdcd28acd}" mode="1" >1.00000000</value>
<value id="{f9f660a0-91e5-4f94-8cbf-632cdcd28acd}" mode="4" >1</value>
<value id="{ce0872db-aab3-4f5f-a0d4-8cc33874104e}" mode="1" >200.00000000</value>
<value id="{18454320-3c62-4167-95ec-9a47bbb2bb3e}" mode="1" >200.00000000</value>
<value id="{3fccbaf9-9ea9-481b-ad5e-4ddc088db950}" mode="1" >7.67999983</value>
<value id="{ae9c2bdd-a785-4fa8-80c3-9d32b4849aa0}" mode="1" >418.39999390</value>
<value id="{d526a243-3315-44ef-ac3d-279fccd28769}" mode="1" >0.61549997</value>
<value id="{9c1b3dc3-0a45-4b2f-8219-89204c771049}" mode="1" >0.20000000</value>
<value id="{dc7a4d69-1ef6-4dc7-9e14-fc402d4bb43c}" mode="1" >418.39999390</value>
<value id="{f14a4447-0aae-4d71-8a05-45ce212779d5}" mode="1" >0.61549997</value>
<value id="{85025874-5f38-4a8f-bf54-9cdbf7567449}" mode="1" >7.67999983</value>
<value id="{ca28474e-d396-486b-8fdf-ff5094e77d70}" mode="1" >0.20000000</value>
<value id="{ca28474e-d396-486b-8fdf-ff5094e77d70}" mode="4" >0.200</value>
<value id="{fbb7146b-66ef-4783-bb1b-f1766bd81f50}" mode="4" >0</value>
</preset>
</bsbPresets>
