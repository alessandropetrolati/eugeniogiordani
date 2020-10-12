<CsoundSynthesizer>
<CsOptions>
-odac -d
</CsOptions>
<CsInstruments>

/*
This CSD is a vintage game PONG simulator by Eugenio Giordani - June 2019
Dedicated to Cagli Csound Team

*/

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1



seed 0					;get random seeds from internal clock
girack 		init 0.1	;init racket dimension
giscore 	init 0.0	;reset score
gktime 		init 0.0	;reset time
gaSEND  	init 0.0	;init rev esend bus



instr 1;	==========  Init scheduler =======




giscore 	init 0					; init score
gktime 		init 0					; init time			
outvalue "dispscore",0				;display score
outvalue "disptime", gktime		;display time

giGameTime 		invalue "gametime"		;get game time
giwindvel 		invalue "windvel"		;get wind velocity


schedule 3,0,giGameTime*60		;call instr 3 for giGameTime*60 secs
kactive active 3					;check if instr 3 is active


endin



instr 2; ==========  Play ball ========

kwind init 1			; set init kwind to 1

iYstart random 0,1		; extract Y ball init point

kxcur init 1			; set X ball init point

kycur init iYstart		; init current Y current value

iDX   random 0.0002, 0.0005	;extract random deltaX 
iDY   random 0.0003, 0.0004	;extract random deltaY


igamelev invalue "gamelev"	;get game level (ball velocity)
imul = igamelev*0.38			;scale it to lower value


kactive active 3				;sense instr 3


if kactive > 0 then			;if active (the game time is > 0 ) then play



kDX init iDX	;0.0004			; init   k-DX
kDY init iDY; 0.0002			; init	 k-DY

krack_L invalue "rack_L"		;get racket position

outvalue "X", kxcur			;draw X-ball component	
outvalue "Y", kycur			;draw Y-ball component

kwind rspline 0,1.5, 1,2		;generate wind 
kwind = 1 + kwind*giwindvel	;create an offset

kxcur = (kxcur + kDX*imul) 			;update current X ball position 
kycur = (kycur + kDY*imul * kwind) 	;update current Y ball position plus wind (eventually)

  

if kycur > 1 then		; bounce on the NORD wall
kDY = -kDY
schedkwhen 1, 0,1,26,0,0.1
endif

if kxcur > 1 then		; bounce on the EAST wall
kDX = -kDX
schedkwhen 1, 0,1,26,0,0.1
endif

if kycur < 0. then		; bounce on the SOUTH wall
schedkwhen 1, 0,1,26,0,0.1
kDY = -kDY
endif



 ksup = krack_L + girack/2		;find the racket limits (upper limit)
 kinf = krack_L - girack/2		;find the racket limits (lower limit)
 
outvalue "disp", kxcur				;diplay
;printk2 kxcur
 
if kxcur <= 0  then				; check the racket wall (WEST) 

 if kycur >= kinf && kycur <= ksup then	;bounce only if the ball interceps the racket
 
 schedkwhen 1, 0,1,24,0,0.1				;call the ball sound

kDX = -kDX

 else
schedkwhen 1, 0,1,25,0,0.1 
 outvalue "X", -1					; hide the ball
outvalue "Y", -1


turnoff
 
endif
endif

else

turnoff
endif



endin




instr 3; ======= TIME COUNTER  ======

gktime line giGameTime*60, giGameTime*60, 0

outvalue "disptime", gktime


endin






instr 24 ; ====== A SIMPLE BALL BOUNCE ========

ksoundlev invalue "soundlev"		;Get sound level
apulse mpulse 1, 1					;generate a single pulse

a0 delayr 1							; create 3 delayed pulses

atap1 deltapn 30
atap2 deltapn 50
atap3 deltapn 70
delayw apulse

apulses sum apulse, atap1,-0.2*atap2, 0.5*atap3  ; sum and scale the pulses

anoise rand 1											; a little bit of noise....

aball lowpass2 apulses*anoise, 700, 4					; a simple resonant LP
aball tone aball, 200									; LP again...

aout = aball * 8										; recale ....

outs aout*ksoundlev,aout*ksoundlev					; ... and voilà

vincr gaSEND,aout*ksoundlev							; send to Rev

endin

instr 25  ;=========== Score instr ========= 
giscore = giscore + 1				; update score
outvalue "dispscore",giscore		; diplay it
aenv linen 1,0.01,p3,0.05			; a "snort" sound ...
a1 oscili 0.1*aenv, 20,2
outs a1, a1
endin

instr 26
ksoundlev invalue "soundlev"		;Get sound level
aenv expon 1,p3,0.001		; a "snort" sound ...
a1 oscili 0.05*aenv, 30,2
outs a1*ksoundlev, a1*ksoundlev
vincr gaSEND,a1*ksoundlev
endin





instr 99 ; ===== A TINY REV


kloc invalue "loc"
ain = gaSEND*kloc

aL, aR  freeverb ain, ain, 0.9,0.7

outs aL*0.5, aR*0.5
clear gaSEND
endin



</CsInstruments>
<CsScore>

f2 0 1024 10 1 1 1 1 1 1 1
f0 3600

i99 0 3600

</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>383</x>
 <y>161</y>
 <width>1213</width>
 <height>637</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>143</r>
  <g>142</g>
  <b>144</b>
 </bgcolor>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>0</x>
  <y>1</y>
  <width>1203</width>
  <height>629</height>
  <uuid>{913056ae-37f0-4e66-9ea1-6b999c294fbc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>ARCADE GAME "C-PONG"  by EG (Eugene Garros)</label>
  <alignment>left</alignment>
  <font>Bradley Hand</font>
  <fontsize>26</fontsize>
  <precision>3</precision>
  <color>
   <r>32</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="background">
   <r>51</r>
   <g>51</g>
   <b>51</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>10</x>
  <y>281</y>
  <width>157</width>
  <height>72</height>
  <uuid>{0864eaaf-7132-43d9-983a-a9db8e2508db}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>252</r>
   <g>1</g>
   <b>7</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>11</borderradius>
  <borderwidth>5</borderwidth>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>X</objectName>
  <x>222</x>
  <y>165</y>
  <width>666</width>
  <height>397</height>
  <uuid>{86281f4c-0e1c-4468-8895-41de1975c393}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>Y</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>-1.00000000</xValue>
  <yValue>-1.00000000</yValue>
  <type>point</type>
  <pointsize>17</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>255</g>
   <b>10</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName/>
  <x>8</x>
  <y>283</y>
  <width>160</width>
  <height>73</height>
  <uuid>{66b51e89-5d5e-449d-b3b7-2b076a4bcedb}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>SERVE
NEW BALL</text>
  <image>/</image>
  <eventLine>i2 0.25 -1</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>rack_L</objectName>
  <x>214</x>
  <y>164</y>
  <width>8</width>
  <height>392</height>
  <uuid>{46a882df-6abe-4b6d-914c-230cf71797be}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.79187816</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>rack_L</objectName>
  <x>214</x>
  <y>174</y>
  <width>8</width>
  <height>374</height>
  <uuid>{3e477490-e1c6-4550-afdf-57e9f9702de8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.79187816</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>rack_L</objectName>
  <x>214</x>
  <y>186</y>
  <width>8</width>
  <height>374</height>
  <uuid>{c764f749-4800-4946-81cb-a3c2c23cd72d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.79187816</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>hor5</objectName>
  <x>174</x>
  <y>164</y>
  <width>38</width>
  <height>394</height>
  <uuid>{e5b644bb-3aa3-4a74-8b62-54777ca806c4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>rack_L</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.79187816</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
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
 </bsbObject>
 <bsbObject type="BSBScrollNumber" version="2">
  <objectName>gametime</objectName>
  <x>174</x>
  <y>80</y>
  <width>80</width>
  <height>25</height>
  <uuid>{cacfb3f7-29e5-459d-b725-ecf0e9fcb715}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <alignment>center</alignment>
  <font>Eurostile</font>
  <fontsize>18</fontsize>
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
  <value>2.00000000</value>
  <resolution>0.10000000</resolution>
  <minimum>0.10000000</minimum>
  <maximum>10.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>4</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>174</x>
  <y>108</y>
  <width>81</width>
  <height>25</height>
  <uuid>{01460306-7830-4ca3-9210-40e3645b304b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Game Time</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>32</r>
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
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>181</x>
  <y>46</y>
  <width>59</width>
  <height>25</height>
  <uuid>{2f019176-3735-4425-88a7-14af31138698}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>[minutes]</label>
  <alignment>left</alignment>
  <font>Arial</font>
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
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>disptime</objectName>
  <x>519</x>
  <y>136</y>
  <width>72</width>
  <height>27</height>
  <uuid>{aafca159-401c-4543-a2dd-1a1df6191dfd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>101.983</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>3</precision>
  <color>
   <r>33</r>
   <g>255</g>
   <b>6</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>0</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBScrollNumber" version="2">
  <objectName>gamelev</objectName>
  <x>290</x>
  <y>80</y>
  <width>80</width>
  <height>25</height>
  <uuid>{f526f393-20ec-43fa-93f6-99caf1627ece}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <alignment>center</alignment>
  <font>Eurostile</font>
  <fontsize>18</fontsize>
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
  <value>2.50000000</value>
  <resolution>0.50000000</resolution>
  <minimum>1.00000000</minimum>
  <maximum>5.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>4</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>298</x>
  <y>107</y>
  <width>69</width>
  <height>24</height>
  <uuid>{e0c1a8bb-9fcf-4bcb-93ad-f1ca5311b20a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Skill</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>32</r>
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
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>285</x>
  <y>42</y>
  <width>90</width>
  <height>38</height>
  <uuid>{695835bd-facd-4276-af01-38bf2ad49610}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>[1   : Beginner ]
[5  : Pro          ]
</label>
  <alignment>left</alignment>
  <font>Arial</font>
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
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBScrollNumber" version="2">
  <objectName>dispscore</objectName>
  <x>63</x>
  <y>370</y>
  <width>58</width>
  <height>38</height>
  <uuid>{46e272d6-c7f3-4882-a8b1-a25de25b0312}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <alignment>center</alignment>
  <font>Eurostile</font>
  <fontsize>30</fontsize>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="background">
   <r>252</r>
   <g>1</g>
   <b>7</b>
  </bgcolor>
  <value>1.00000000</value>
  <resolution>1.00000000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>26</x>
  <y>367</y>
  <width>125</width>
  <height>44</height>
  <uuid>{8b9660ca-e688-4a00-9e45-a032a8b4c618}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>center</alignment>
  <font>Eurostile</font>
  <fontsize>30</fontsize>
  <precision>3</precision>
  <color>
   <r>252</r>
   <g>1</g>
   <b>7</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>loc</objectName>
  <x>410</x>
  <y>80</y>
  <width>113</width>
  <height>30</height>
  <uuid>{d98bbd1a-3a80-45f7-ad87-bef78f3fac27}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>OUTDOOR</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> INDOOR</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>1</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>414</x>
  <y>108</y>
  <width>94</width>
  <height>24</height>
  <uuid>{cdba8da1-9f26-4ab4-9df1-45dde43b1370}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Location</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>32</r>
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
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>_Play</objectName>
  <x>11</x>
  <y>60</y>
  <width>143</width>
  <height>52</height>
  <uuid>{45634a3e-4098-48ed-8aca-6326152769c6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>START NEW GAME</text>
  <image>/</image>
  <eventLine>i1 0 0.1</eventLine>
  <latch>false</latch>
  <latched>true</latched>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>59</x>
  <y>411</y>
  <width>63</width>
  <height>22</height>
  <uuid>{13b41f4c-0389-4cc7-9230-00420efc78ce}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>SCORE</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>32</r>
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
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>_Stop</objectName>
  <x>10</x>
  <y>113</y>
  <width>144</width>
  <height>43</height>
  <uuid>{2153235e-0ee0-4e50-9175-4385f8e8c486}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>STOP GAME</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>true</latched>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>889</x>
  <y>165</y>
  <width>298</width>
  <height>396</height>
  <uuid>{7be7edd6-7107-42c2-a3ad-1cf3fa0a95b6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>INSTRUCTIONS

1. Run the csd

2. Set Game Time, Skill, Location, Wind and Sound Level

3. Press START NEW GAME

4. Press SERVE NEW BALL

5. Use the green bar to move the racket

6. ENJOY


Note: recall the Preset 0 for a basic configuration</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
  <precision>3</precision>
  <color>
   <r>32</r>
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
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>261</x>
  <y>212</y>
  <width>585</width>
  <height>307</height>
  <uuid>{733a5005-d46b-4058-819b-b4ed44b6d8b2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>179</r>
   <g>179</g>
   <b>179</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>3</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>261</x>
  <y>213</y>
  <width>585</width>
  <height>50</height>
  <uuid>{13db33f3-bc29-420b-8d2a-b1318ea5c4fb}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>153</r>
   <g>153</g>
   <b>153</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>2</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>261</x>
  <y>469</y>
  <width>585</width>
  <height>50</height>
  <uuid>{a97126d6-47a3-4cb7-afd3-7a1a5d21cb57}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>153</r>
   <g>153</g>
   <b>153</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>3</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>374</x>
  <y>261</y>
  <width>362</width>
  <height>211</height>
  <uuid>{4615140a-d1d6-4403-a7cd-2173d66e8f95}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>153</r>
   <g>153</g>
   <b>153</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>3</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>549</x>
  <y>168</y>
  <width>5</width>
  <height>348</height>
  <uuid>{61b8641b-11cc-4044-a0c1-144149f92e2b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>230</r>
   <g>230</g>
   <b>230</b>
  </color>
  <bgcolor mode="background">
   <r>127</r>
   <g>127</g>
   <b>127</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBKnob" version="2">
  <objectName>soundlev</objectName>
  <x>725</x>
  <y>53</y>
  <width>60</width>
  <height>60</height>
  <uuid>{6c71271d-eca1-4060-ba5e-6621fcc6cbb9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.77999997</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>710</x>
  <y>108</y>
  <width>94</width>
  <height>24</height>
  <uuid>{b93f5d9e-7bd9-4522-8f52-df817daf8155}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Sound Lev</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>32</r>
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
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBScrollNumber" version="2">
  <objectName>windvel</objectName>
  <x>570</x>
  <y>80</y>
  <width>80</width>
  <height>25</height>
  <uuid>{0ff09aa9-3c3f-44fc-9289-ab7ca563a341}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <alignment>center</alignment>
  <font>Eurostile</font>
  <fontsize>18</fontsize>
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
  <value>0.00000000</value>
  <resolution>0.00100000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>4</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>570</x>
  <y>108</y>
  <width>81</width>
  <height>25</height>
  <uuid>{497dbdb7-f9f4-4714-95e6-a503d050ab7f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Wind</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>32</r>
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
  <borderwidth>1</borderwidth>
 </bsbObject>
</bsbPanel>
<bsbPresets>
<preset name="Default" number="0" >
<value id="{86281f4c-0e1c-4468-8895-41de1975c393}" mode="1" >-1.00000000</value>
<value id="{86281f4c-0e1c-4468-8895-41de1975c393}" mode="2" >-1.00000000</value>
<value id="{66b51e89-5d5e-449d-b3b7-2b076a4bcedb}" mode="4" >0</value>
<value id="{46a882df-6abe-4b6d-914c-230cf71797be}" mode="1" >0.79187816</value>
<value id="{3e477490-e1c6-4550-afdf-57e9f9702de8}" mode="1" >0.79187816</value>
<value id="{c764f749-4800-4946-81cb-a3c2c23cd72d}" mode="1" >0.79187816</value>
<value id="{e5b644bb-3aa3-4a74-8b62-54777ca806c4}" mode="1" >0.00000000</value>
<value id="{e5b644bb-3aa3-4a74-8b62-54777ca806c4}" mode="2" >0.79187816</value>
<value id="{cacfb3f7-29e5-459d-b725-ecf0e9fcb715}" mode="1" >2.00000000</value>
<value id="{aafca159-401c-4543-a2dd-1a1df6191dfd}" mode="1" >101.98276520</value>
<value id="{aafca159-401c-4543-a2dd-1a1df6191dfd}" mode="4" >101.983</value>
<value id="{f526f393-20ec-43fa-93f6-99caf1627ece}" mode="1" >2.50000000</value>
<value id="{46e272d6-c7f3-4882-a8b1-a25de25b0312}" mode="1" >1.00000000</value>
<value id="{d98bbd1a-3a80-45f7-ad87-bef78f3fac27}" mode="1" >1.00000000</value>
<value id="{45634a3e-4098-48ed-8aca-6326152769c6}" mode="4" >0</value>
<value id="{2153235e-0ee0-4e50-9175-4385f8e8c486}" mode="4" >0</value>
<value id="{6c71271d-eca1-4060-ba5e-6621fcc6cbb9}" mode="1" >0.77999997</value>
<value id="{0ff09aa9-3c3f-44fc-9289-ab7ca563a341}" mode="1" >0.00000000</value>
</preset>
</bsbPresets>
