<CsoundSynthesizer>
<CsOptions>

</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 256
nchnls = 2
0dbfs   =2

;UDO for gbuzz

;=====================
opcode BLIT_0, a, kkk

setksmps 1

kcps,knh,kmul xin

acps interp kcps
acpsf tonex acps, 16
a1 gbuzz .5, acpsf, knh, 1, kmul, 1

xout a1

endop

;========================

opcode MOOG_Ladder, a, akk

   setksmps 1

ipi = 4*taninv(1)
az1 init 0             /* filter delays */
az2 init 0
az3 init 0
az4 init 0
az5 init 0
ay4 init 0
amf init 0

asig,kcf,kres  xin

if kres > 1 then
kres = 1
elseif kres < 0 then
kres = 0
endif

i2v = 40000   /* twice the \'thermal voltage of a transistor\' */
 
kfc = kcf/sr  /* sr is half the actual filter sampling rate  */
kf =  kcf/(sr*2)
/* frequency & amplitude correction  */ 
kfcr = 1.8730*(kfc^3) + 0.4955*(kfc^2) - 0.6490*kfc + 0.9988
kacr = -3.9364*(kfc^2) + 1.8409*kfc + 0.9968;
k2vg = i2v*(1-exp(-2*ipi*kfcr*kf)) /* filter tuning  */

/* cascade of 4 1st order sections         */
ay1 = az1 + k2vg*(tanh((asig - 4*kres*amf*kacr)/i2v) - tanh(az1/i2v))
az1 = ay1
ay2 = az2 + k2vg*(tanh(ay1/i2v) - tanh(az2/i2v ))
az2 = ay2
ay3 = az3 + k2vg*(tanh(ay2/i2v) - tanh(az3/i2v))
az3 = ay3
ay4 = az4 + k2vg*(tanh(ay3/i2v) - tanh(az4/i2v))
az4 = ay4
/* 1/2-sample delay for phase compensation  */
amf = (ay4+az5)*0.5
az5 = ay4

/* oversampling  */
ay1 = az1 + k2vg*(tanh((asig - 4*kres*amf*kacr)/i2v) - tanh(az1/i2v))
az1 = ay1
ay2 = az2 + k2vg*(tanh(ay1/i2v) - tanh(az2/i2v ))
az2 = ay2
ay3 = az3 + k2vg*(tanh(ay2/i2v) - tanh(az3/i2v))
az3 = ay3
ay4 = az4 + k2vg*(tanh(ay3/i2v) - tanh(az4/i2v))
az4 = ay4
amf = (ay4+az5)*0.5
az5 = ay4
        
        xout  amf
	
endop

;===============

instr 1

ifmin init 2			; min freq
ifmax init 12800		; max freq
ispan = ifmax - ifmin

knh init 700      ; max number of partials

kcps_00  invalue	"_FREQ"
kwave	invalue 	"_WAVE"
kpwm_0	invalue 	"_PWM"
kcut_0	invalue		"_CUT"
kres_0	invalue		"_RES"

kcps_0 portk kcps_00, 0.05
kcut   portk kcut_0, 0.02
kres	portk kres_0, 0.05

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
		
;aBLIT_0 		gbuzz .5, kcps, knh, 1, kmul, 1		; generate band limited impulse train  (BLIT)
aBLIT_0		BLIT_0 kcps, knh, kmul
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

anoise gauss 1

if (kwave == 0) then				; waveform selection
aout = aRAMP

elseif (kwave == 1) then
aout = aSQUARE * 0.7				;!!!!!!!!  added a rescale factor of 0.7 to equalize levels  !!!!!!!

elseif (kwave == 2) then
aout = aTRI

elseif (kwave == 3) then

aout = aTRI * kSINEgain 			;!!!!!!!  Sine wave compensation vs freq


								;!!!!!! NOTE: sine wave is like trian but with a reduced band
else
aout = anoise

endif







;afil MOOG_Ladder  aout, kcut, kres
afil moogladder  aout, kcut, kres			; VCF


kamposc_exp tablei kres,97, 1		; Scale auxiliary whistle oscillator amp with kres value (table 97) 

;printk2 kamposc_exp
aosc oscili 0.7*kamposc_exp, kcut, 96	; Generate auxiliary whistle effect for VCF filter in hi-res setting 

aHP  atonex afil, kcut, 2		; Hi-pass signal with hi-res setting

aFILMIX = aHP * kres + afil ;  ;  Mix the two contributes 
									; NOTE: when kres = 0 the HI-PASS component is zero 




outs (0.72 - kamposc_exp)* aFILMIX  + aosc, (0.72 - kamposc_exp)* aFILMIX  + aosc
     
     
     
     


; ====   FFT DISPLAY
kfft_onoff invalue "fftONOFF"
if kfft_onoff !=0 then 
 outvalue "tabdisp", 5
 
 
 
 dispfft aFILMIX, 0.1, 512, 1					; FFT display
 
endif



endin
</CsInstruments>
<CsScore>
; cosine wave
f 1 0 16384 11 1
f96 0 1024 10 1 ; 0.05 0.05 0.05
f97 0 1024 5 0.0001 512 0.0002 256 0.001 128 0.002 128 1
f98  0  1024 7  0.1 128 1.5  128 2 256 3   512  3  ; Sine Amplitude compensation function    
f99  0  16  7   1    1    0.8    6    0.05    7    0.01    2    0  ; Band control table

i 1 0 3600

e
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>903</x>
 <y>315</y>
 <width>722</width>
 <height>743</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>202</r>
  <g>171</g>
  <b>96</b>
 </bgcolor>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>272</x>
  <y>197</y>
  <width>343</width>
  <height>163</height>
  <uuid>{474d8440-2300-4149-bc88-a76f4c2f2868}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>VCF FILTER</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>232</r>
   <g>179</g>
   <b>97</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBGraph">
  <objectName>tabdisp</objectName>
  <x>271</x>
  <y>368</y>
  <width>350</width>
  <height>150</height>
  <uuid>{156a3454-0fb9-4709-966b-82a188ba6ac7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <value>5</value>
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
  <value>0.03386975</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScope">
  <objectName/>
  <x>273</x>
  <y>523</y>
  <width>350</width>
  <height>150</height>
  <uuid>{2f316817-3ffc-4160-8fa6-051f08451ca8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <value>1.00000000</value>
  <type>scope</type>
  <zoomx>2.00000000</zoomx>
  <zoomy>2.00000000</zoomy>
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
  <label>0.892</label>
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
  <label>0.034</label>
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
  <label>435.465</label>
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
  <value>0.03386975</value>
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
   <bsbDropdownItem>
    <name> NOISE</name>
    <value>4</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>1</selectedIndex>
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
  <value>0.00000000</value>
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
  <label>0.000</label>
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
  <x>41</x>
  <y>489</y>
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
  <x>647</x>
  <y>400</y>
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
  <x>634</x>
  <y>422</y>
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
  <width>717</width>
  <height>33</height>
  <uuid>{055ea6e8-338e-4a80-92eb-b3be3b0efeca}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>PWM Ramp/Square/Triangle/Sine/ Noise Virtual Analog Simulator and Ladder FIlter</label>
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
 <bsbObject version="2" type="BSBKnob">
  <objectName>_CUT</objectName>
  <x>338</x>
  <y>249</y>
  <width>80</width>
  <height>80</height>
  <uuid>{ff13cdac-db20-48b3-9941-75173f3d6941}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>20.00000000</minimum>
  <maximum>10000.00000000</maximum>
  <value>2215.60000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>_RES</objectName>
  <x>477</x>
  <y>246</y>
  <width>80</width>
  <height>80</height>
  <uuid>{1c801120-bdda-481e-bcc1-910772f9bd2e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>0.99200000</maximum>
  <value>0.78368000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>_RES</objectName>
  <x>476</x>
  <y>220</y>
  <width>78</width>
  <height>25</height>
  <uuid>{b480c206-3240-43e2-81f7-da0eed01b992}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.784</label>
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
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>_CUT</objectName>
  <x>337</x>
  <y>223</y>
  <width>78</width>
  <height>25</height>
  <uuid>{a8ca5e61-e281-4174-9a9d-9e9bc9118e83}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>2215.600</label>
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
  <x>355</x>
  <y>329</y>
  <width>49</width>
  <height>24</height>
  <uuid>{f547ffc9-4929-4f7a-b428-3dedeb8758a0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Freq</label>
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
  <x>489</x>
  <y>326</y>
  <width>49</width>
  <height>24</height>
  <uuid>{d8d63226-78ab-4d4a-af1b-afc45885e786}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Res</label>
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
</bsbPanel>
<bsbPresets>
</bsbPresets>
