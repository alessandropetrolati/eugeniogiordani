<CsoundSynthesizer>
<CsOptions>

</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 128
nchnls = 2
0dbfs   =2

instr 1

ifmin init 2			; min freq
ifmax init 12800		; max freq
ispan = ifmax - ifmin

knh init 800          ; max number of partials

kcps_0  invalue	"_FREQ"
kwave	invalue 	"_WAVE"
kpwm_0	invalue 	"_PWM"

kcps_0 = (kcps_0 > 0.935? 0.935 : kcps_0) ; limit upper freq
kpwm_0_i port kpwm_0,  0.1



kcps = ifmin + kcps_0 * ispan		; convert from 0 : 1   to actual freq
kper = 1/kcps						; find period
kper_milli = kper * 1000			; in msec

kpwm = kper_milli * kpwm_0_i * 0.01		;compute PWM

outvalue "_FREQHZ", kcps

kmul tablei kcps_0, 99,1			; compute band according to table 99

kmul = (kwave == 3? 0.5 * kmul :  kmul ) ; !!!!!! If Sine wave selected reduce Triangle  band of 50%


outvalue "_HIPARLEV", kmul
		
aBLIT_0 		gbuzz .5, kcps, knh, 1, kmul, 1		; generate band limited impulse train  (BLIT)
aBLIT_0_AC		dcblock aBLIT_0 						; DC block it


adel interp kpwm + kper_milli/2
aBLIT_180 vdelay3 -aBLIT_0, adel, 1000 ; generate out of phase BLIT according to PWM



aBLIT_180_AC	dcblock aBLIT_180				; DC block it 										
aRAMP 			integ aBLIT_0_AC				; Generate RAMP via direct BLIT integration 
aSQUARE integ aBLIT_0_AC + aBLIT_180_AC		; Generate SQUARE via direct sum BLIT in phase and out of phase 
aTRI_0 integ 0.025 * aSQUARE		;!!!! Generate TRIANGLE via integration of SQUARE (ampli compensated)
aTRI_AC dcblock aTRI_0										
aTRI balance aTRI_AC, aRAMP		;!!!! Balance TRIANGLE wave amplitude in respect of RAMP wave
kSINEgain tablei kcps_0, 98, 1

if (kwave == 0) then				; waveform selection
aout = aRAMP

elseif (kwave == 1) then
aout = aSQUARE * 0.7				;!!!!!!!!  added a rescale factor of 0.7 to equalize levels  !!!!!!!

elseif (kwave == 2) then
aout = aTRI

else

aout = aTRI * kSINEgain 			;!!!!!!!  Sine wave compensation vs freq
endif								;!!!!!! NOTE: sine wave is like trian but with a reduced band




     outs aout, aout


; ====   FFT DISPLAY
kfft_onoff invalue "fftONOFF"
if kfft_onoff !=0 then 
 outvalue "tabdisp", 3
 
 dispfft aout, 0.1, 512, 1					; FFT display
 
endif



endin
</CsInstruments>
<CsScore>
; cosine wave
f 1 0 16384 11 1


f98  0  1024 7  0.1 128 1.5  128 2 256 3   512  3  ; Sine Amplitude compensation function    
f99  0  16  7   1    1    0.8    6    0.05    7    0.01    2    0  ; Band control table

i 1 0 3600

e
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>787</x>
 <y>384</y>
 <width>643</width>
 <height>587</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>202</r>
  <g>171</g>
  <b>96</b>
 </bgcolor>
 <bsbObject version="2" type="BSBGraph">
  <objectName>tabdisp</objectName>
  <x>213</x>
  <y>201</y>
  <width>350</width>
  <height>150</height>
  <uuid>{156a3454-0fb9-4709-966b-82a188ba6ac7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <value>3</value>
  <objectName2/>
  <zoomx>1.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <modex>lin</modex>
  <modey>lin</modey>
  <all>true</all>
 </bsbObject>
 <bsbObject version="2" type="BSBHSlider">
  <objectName>_FREQ</objectName>
  <x>89</x>
  <y>88</y>
  <width>476</width>
  <height>26</height>
  <uuid>{e50752cb-1f17-4f17-a648-b013827c53d0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00030000</minimum>
  <maximum>0.99900000</maximum>
  <value>0.01998298</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScope">
  <objectName/>
  <x>215</x>
  <y>356</y>
  <width>350</width>
  <height>150</height>
  <uuid>{2f316817-3ffc-4160-8fa6-051f08451ca8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <value>-255.00000000</value>
  <type>scope</type>
  <zoomx>2.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <mode>0.00000000</mode>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>_HIPARLEV</objectName>
  <x>93</x>
  <y>268</y>
  <width>53</width>
  <height>25</height>
  <uuid>{aa6dcfcc-b5c2-4c46-b1e3-7deb0aca665b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.468</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>18</r>
   <g>255</g>
   <b>245</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>_FREQ</objectName>
  <x>260</x>
  <y>58</y>
  <width>82</width>
  <height>29</height>
  <uuid>{878677ef-2c5d-48e6-9e02-92d9ec370101}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.020</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
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
  <bordermode>noborder</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>_FREQHZ</objectName>
  <x>259</x>
  <y>115</y>
  <width>82</width>
  <height>29</height>
  <uuid>{bd48895d-536e-42b7-bae2-51521a8ed7a7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>257.742</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
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
  <bordermode>noborder</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>347</x>
  <y>60</y>
  <width>157</width>
  <height>24</height>
  <uuid>{1411fff9-dd12-448e-9ab3-ad99af780c04}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Normalized Value [0 : 1]</label>
  <alignment>left</alignment>
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
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>347</x>
  <y>118</y>
  <width>189</width>
  <height>26</height>
  <uuid>{dfcc507a-8afa-4157-87e1-98a54492498a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Actual Hz freq [5.83 : 11968]</label>
  <alignment>left</alignment>
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
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>91</x>
  <y>293</y>
  <width>55</width>
  <height>22</height>
  <uuid>{3df9d2f6-7fc4-4b19-a596-b0a2729e3b57}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Band</label>
  <alignment>center</alignment>
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
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>89</x>
  <y>115</y>
  <width>53</width>
  <height>24</height>
  <uuid>{6a81a241-2dd4-4f70-a9a6-f981f318b14c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>FREQ</label>
  <alignment>left</alignment>
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
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>_FREQ</objectName>
  <x>134</x>
  <y>35</y>
  <width>80</width>
  <height>25</height>
  <uuid>{fff68095-044a-469f-9685-5513043aaf48}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
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
  <value>0.01998298</value>
  <resolution>0.00010000</resolution>
  <minimum>0.00030000</minimum>
  <maximum>0.99900000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBDropdown">
  <objectName>_WAVE</objectName>
  <x>85</x>
  <y>185</y>
  <width>90</width>
  <height>24</height>
  <uuid>{2b12eaea-b8f1-4187-9e52-8bb7e95c3584}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>RAMP</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> SQUARE</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> TRI</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> SINE</name>
    <value>3</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>3</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>_PWM</objectName>
  <x>83</x>
  <y>380</y>
  <width>80</width>
  <height>80</height>
  <uuid>{d246b180-4ba3-40ae-b268-136174e8b4e4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>-49.00000000</minimum>
  <maximum>49.00000000</maximum>
  <value>1.96000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>39</x>
  <y>435</y>
  <width>51</width>
  <height>24</height>
  <uuid>{e6c1f119-1df6-49cf-b103-d58eb67a9c32}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>- 49 %</label>
  <alignment>left</alignment>
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
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>156</x>
  <y>436</y>
  <width>51</width>
  <height>24</height>
  <uuid>{deb9e55f-b7bf-45b0-a7de-477384cb5e70}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>+ 49 %</label>
  <alignment>left</alignment>
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
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>98</x>
  <y>460</y>
  <width>51</width>
  <height>24</height>
  <uuid>{165ab919-9b82-49e0-b9b9-72b12b7b383f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>PWM</label>
  <alignment>left</alignment>
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
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>_PWM</objectName>
  <x>83</x>
  <y>355</y>
  <width>80</width>
  <height>25</height>
  <uuid>{3e757d22-817f-415f-b962-01aad1f31bfc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>1.960</label>
  <alignment>center</alignment>
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
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>42</x>
  <y>507</y>
  <width>174</width>
  <height>39</height>
  <uuid>{4387b4d9-b126-4b8b-9ced-f16ff0d4de10}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>NOTE : PWM is active only for:
SQUARE , TRIANGLE and SINE</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>126</x>
  <y>60</y>
  <width>106</width>
  <height>25</height>
  <uuid>{260ce33d-2a9f-4f39-91c8-c6a1ab5c00a9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Fine Freq Control</label>
  <alignment>left</alignment>
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
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>86</x>
  <y>208</y>
  <width>87</width>
  <height>41</height>
  <uuid>{11121a2f-98b5-408e-a126-1db03c9528af}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Waveform
Selector
</label>
  <alignment>center</alignment>
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
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>fftONOFF</objectName>
  <x>589</x>
  <y>233</y>
  <width>20</width>
  <height>20</height>
  <uuid>{0c85df6d-61be-4251-a8b2-e3d80f2d3c50}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <selected>true</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>576</x>
  <y>255</y>
  <width>61</width>
  <height>42</height>
  <uuid>{5b0cf2ad-586a-44d1-8e13-c478d6a7d53c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>FFT
On/Off</label>
  <alignment>center</alignment>
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
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>1</x>
  <y>1</y>
  <width>639</width>
  <height>32</height>
  <uuid>{055ea6e8-338e-4a80-92eb-b3be3b0efeca}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>PWM Ramp/Square/Triangle/Sine Virtual Analog Simulator</label>
  <alignment>left</alignment>
  <font>Apple Chancery</font>
  <fontsize>20</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>217</r>
   <g>195</g>
   <b>169</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
