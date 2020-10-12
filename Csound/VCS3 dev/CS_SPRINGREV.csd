<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 128
nchnls = 2

#define	  ALLPASS_MAX_DEL # 0.100 #
#define  SR_MILLI #(sr/1000.0)#
#define  MILLI # 0.001 #

;=================================================
opcode ALLPASS_K, a,akk		;   ALLPASS UDO 

        setksmps 1      ; need sr=kr
ain, k1,k2 xin          ; read input parameters : ain=input sig, k1=gain, k2= delay time (ms)
aout    init 0          ; initialize output
;-------------------------------------------------

kgainAP1 = k1			;receive allpass gain (0:1)
kdelaysampAP1 = k2			;receive allpass delay (samples)
  
adummy_AP1 	delayr $ALLPASS_MAX_DEL	;set maximum delay line length
a1 		deltapn  kdelaysampAP1					;tap delay line
aout = a1 + (-kgainAP1 * ain)	
			
	   	delayw ain + (kgainAP1 * aout  )
	   
        xout aout               ; write ALLPASS output

        endop 



instr 1
aAP_DEL_FIL init 0

kgain			invalue "_GAIN"
kdel			invalue "_DEL"			; delay in msec
kfdb_gain		invalue "_FDBGAIN" 
kFC				invalue "_FC"

kINPUT_SCALE	invalue "_INPUTSCALE" 
kOUTPUT_MULT	invalue "_OUTPUTMULT"
kSOURCE			invalue "_SOURCE"
kPITCH			invalue "_PITCH"

kdel_samp = int(kdel*$SR_MILLI)

if kSOURCE == 0 then
ainput_0 mpulse 1, 2				; USE DIFFERENT SOURCE INPUT instead pulse  BUT WARN OF AMPLITUDE !!!!!

else

ainput_0 oscil 1, kPITCH, 1
ainput_0 = ainput_0 * 0.03
endif
ainput = ainput_0 * kINPUT_SCALE + aAP_DEL_FIL*kfdb_gain

;8 ALLPASS FILTER

aAP_1	ALLPASS_K ainput, kgain, kdel_samp		; CHIRP FILTER DISPERSION SECTION START
aAP_2	ALLPASS_K aAP_1,  kgain, kdel_samp
aAP_3	ALLPASS_K aAP_2,  kgain, kdel_samp
aAP_4	ALLPASS_K aAP_3,  kgain, kdel_samp
aAP_5	ALLPASS_K aAP_4,  kgain, kdel_samp
aAP_6	ALLPASS_K aAP_5,  kgain, kdel_samp
aAP_7	ALLPASS_K aAP_6,  kgain, kdel_samp
aAP_8	ALLPASS_K aAP_7,  kgain, kdel_samp		; CHIRP FILTER DISPERSION SECTION END
	

aAP_DEL	delay aAP_8, 0.059							; 59 ms is the VCS3 reverb pulse repetition
aAP_DEL_FIL tone aAP_DEL, 3000

aSPRING_LOW_SEC  tonex aAP_DEL, kFC-500, 8 


aSPRING_DIFFUSE nreverb aSPRING_LOW_SEC, 4, 0.15
aSPRING_HI   atonex aAP_DEL, kFC, 3

aSPRING_HI_DEL delay aSPRING_HI, 0.002

aSPRING_HI_SEC = aSPRING_DIFFUSE*0.2 + aSPRING_HI_DEL


outs (aSPRING_LOW_SEC + aSPRING_HI_SEC*0.3) * 30000*kOUTPUT_MULT, (aSPRING_LOW_SEC + aSPRING_HI_SEC*0.3) * 30000*kOUTPUT_MULT

endin




</CsInstruments>
<CsScore>

f1 0 1024 7 1 1024 -1

i1 0 1000


</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>472</x>
 <y>302</y>
 <width>932</width>
 <height>569</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>179</r>
  <g>90</g>
  <b>0</b>
 </bgcolor>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>13</x>
  <y>0</y>
  <width>522</width>
  <height>157</height>
  <uuid>{1417d5a8-3e4f-4c9c-9f04-d4ecf2fb3e39}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label/>
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
   <g>204</g>
   <b>102</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>13</x>
  <y>159</y>
  <width>522</width>
  <height>250</height>
  <uuid>{b9d762e0-4307-43c1-a962-72c885a13d0f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label/>
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
   <r>179</r>
   <g>179</g>
   <b>179</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>_DEL</objectName>
  <x>54</x>
  <y>214</y>
  <width>20</width>
  <height>100</height>
  <uuid>{3caa9b6b-e658-4610-97e8-56b4149ce75c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.10000000</minimum>
  <maximum>0.20000000</maximum>
  <value>0.17300000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>_DEL</objectName>
  <x>39</x>
  <y>188</y>
  <width>50</width>
  <height>24</height>
  <uuid>{6ca7efc8-5af8-496a-8a92-3132e6642cd6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.173</label>
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
  <x>30</x>
  <y>313</y>
  <width>81</width>
  <height>34</height>
  <uuid>{583f58d8-b766-4fae-bd86-3d57cf57d0f2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>K_DELAY</label>
  <alignment>center</alignment>
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
 <bsbObject version="2" type="BSBVSlider">
  <objectName>_GAIN</objectName>
  <x>129</x>
  <y>214</y>
  <width>20</width>
  <height>101</height>
  <uuid>{04ee013d-da04-4c5e-89da-ac15ec67fbb6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>0.99000000</maximum>
  <value>0.48510000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>_GAIN</objectName>
  <x>116</x>
  <y>188</y>
  <width>48</width>
  <height>24</height>
  <uuid>{512fc9a6-3b17-48bf-a311-1a375398fd6e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.485</label>
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
  <x>111</x>
  <y>314</y>
  <width>63</width>
  <height>34</height>
  <uuid>{f52d28ea-c603-48a6-826a-e883676aee5d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>ALPASS
GAIN</label>
  <alignment>center</alignment>
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
 <bsbObject version="2" type="BSBScope">
  <objectName/>
  <x>543</x>
  <y>161</y>
  <width>377</width>
  <height>249</height>
  <uuid>{594e86d1-50a3-4716-b8c4-02c9ea926b4b}</uuid>
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
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>271</x>
  <y>315</y>
  <width>123</width>
  <height>20</height>
  <uuid>{735bd3e8-c8f7-4961-aedd-3bf9456c421d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>FBK_DELAY _GAIN</label>
  <alignment>center</alignment>
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
 <bsbObject version="2" type="BSBVSlider">
  <objectName>_FDBGAIN</objectName>
  <x>316</x>
  <y>214</y>
  <width>20</width>
  <height>100</height>
  <uuid>{b5102a42-b393-4946-baca-3a3f0b9fb325}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>0.99000000</maximum>
  <value>0.81180000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>_FDBGAIN</objectName>
  <x>299</x>
  <y>189</y>
  <width>50</width>
  <height>23</height>
  <uuid>{66ad2061-d242-45d6-9d8f-d6e8e1639a0f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.812</label>
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
 <bsbObject version="2" type="BSBKnob">
  <objectName>_FC</objectName>
  <x>419</x>
  <y>223</y>
  <width>80</width>
  <height>80</height>
  <uuid>{2c92ff76-aaf9-4f1d-a911-94959733a5f7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1000.00000000</minimum>
  <maximum>5000.00000000</maximum>
  <value>4560.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>30</x>
  <y>350</y>
  <width>79</width>
  <height>49</height>
  <uuid>{becb9eb8-6e53-46fb-89a8-14303fca7249}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>LF_SECTION
STRETCH
FACTOR</label>
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
   <r>199</r>
   <g>196</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>_FC</objectName>
  <x>418</x>
  <y>189</y>
  <width>80</width>
  <height>24</height>
  <uuid>{c84e8c99-923e-4d2b-bec4-da0f9b3f6207}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>4560.000</label>
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
  <x>418</x>
  <y>306</y>
  <width>85</width>
  <height>48</height>
  <uuid>{19afb2d0-0b8c-47fe-8f2b-ec114c691aa8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>CUT_FREQ
LOW SECTION</label>
  <alignment>center</alignment>
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
 <bsbObject version="2" type="BSBKnob">
  <objectName>_INPUTSCALE</objectName>
  <x>47</x>
  <y>50</y>
  <width>50</width>
  <height>50</height>
  <uuid>{40a1d8a2-63af-4a6d-a38e-35338c747254}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.85000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>46</x>
  <y>101</y>
  <width>51</width>
  <height>36</height>
  <uuid>{a6d63a14-ba17-444d-a9f3-1fee77a3f973}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Input
Scale</label>
  <alignment>center</alignment>
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
 <bsbObject version="2" type="BSBKnob">
  <objectName>_OUTPUTMULT</objectName>
  <x>114</x>
  <y>52</y>
  <width>50</width>
  <height>50</height>
  <uuid>{3a66039f-a84c-49ad-a53c-f6535784f409}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>4.00000000</maximum>
  <value>3.28000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>113</x>
  <y>103</y>
  <width>51</width>
  <height>36</height>
  <uuid>{2b8be2b0-93d9-4daf-9b46-cfe66c5c2ca5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Output
Mult</label>
  <alignment>center</alignment>
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
 <bsbObject version="2" type="BSBDisplay">
  <objectName>_INPUTSCALE</objectName>
  <x>46</x>
  <y>24</y>
  <width>50</width>
  <height>23</height>
  <uuid>{0df847e5-463c-4fd2-b65b-fb411deb8d4d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.850</label>
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
  <objectName>_OUTPUTMULT</objectName>
  <x>113</x>
  <y>25</y>
  <width>52</width>
  <height>22</height>
  <uuid>{1887fabf-4d9e-4cdc-8eb0-e2827da05b98}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>3.280</label>
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
 <bsbObject version="2" type="BSBDropdown">
  <objectName>_SOURCE</objectName>
  <x>200</x>
  <y>56</y>
  <width>73</width>
  <height>23</height>
  <uuid>{b581f92e-a9c6-4eaf-9a9c-d31b1255831a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>PULSE</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAMP</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>0</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>_PITCH</objectName>
  <x>284</x>
  <y>18</y>
  <width>135</width>
  <height>108</height>
  <uuid>{9fcd3643-bc80-405e-a356-d1b07103fb23}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>220.00000000</minimum>
  <maximum>880.00000000</maximum>
  <value>451.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>110</x>
  <y>350</y>
  <width>64</width>
  <height>49</height>
  <uuid>{5f95eed5-2ce4-4011-8e8a-b8a00ead07aa}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>REV
COLOUR</label>
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
   <r>63</r>
   <g>255</g>
   <b>201</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>269</x>
  <y>350</y>
  <width>124</width>
  <height>51</height>
  <uuid>{d772083f-1a8c-4641-a0a6-e5d70765b594}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>SPRING 
FEEDBACK</label>
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
   <g>200</g>
   <b>185</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>113</x>
  <y>103</y>
  <width>51</width>
  <height>36</height>
  <uuid>{2417e181-9b89-4972-8402-1d6f9a0268be}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Output
Mult</label>
  <alignment>center</alignment>
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
  <x>283</x>
  <y>124</y>
  <width>136</width>
  <height>31</height>
  <uuid>{84ee9777-3a8f-4bae-896d-580943c29363}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Ramp Pitch</label>
  <alignment>center</alignment>
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
 <bsbObject version="2" type="BSBDisplay">
  <objectName>_PITCH</objectName>
  <x>426</x>
  <y>61</y>
  <width>80</width>
  <height>25</height>
  <uuid>{122867e1-a14b-46ba-8dca-51a37cc484dc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>451.000</label>
  <alignment>center</alignment>
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
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>542</x>
  <y>2</y>
  <width>350</width>
  <height>72</height>
  <uuid>{de9721af-a4d7-4540-baae-bfecfea890ff}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>RIchiamare il primo preset (SPRING_0).  CLick dx del mouse e poi RECALL PRESET. Selezionando PULSE si ha la risposta impulsiva mentre con RAMP si attiva una rampa e si può muovere la frequenza Ramp Pitch</label>
  <alignment>left</alignment>
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
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
</bsbPanel>
<bsbPresets>
<preset name="SPRING_0" number="0" >
<value id="{3caa9b6b-e658-4610-97e8-56b4149ce75c}" mode="1" >0.17299999</value>
<value id="{6ca7efc8-5af8-496a-8a92-3132e6642cd6}" mode="1" >0.17299999</value>
<value id="{6ca7efc8-5af8-496a-8a92-3132e6642cd6}" mode="4" >0.173</value>
<value id="{04ee013d-da04-4c5e-89da-ac15ec67fbb6}" mode="1" >0.48510000</value>
<value id="{512fc9a6-3b17-48bf-a311-1a375398fd6e}" mode="1" >0.48500001</value>
<value id="{512fc9a6-3b17-48bf-a311-1a375398fd6e}" mode="4" >0.485</value>
<value id="{594e86d1-50a3-4716-b8c4-02c9ea926b4b}" mode="1" >-255.00000000</value>
<value id="{b5102a42-b393-4946-baca-3a3f0b9fb325}" mode="1" >0.81180000</value>
<value id="{66ad2061-d242-45d6-9d8f-d6e8e1639a0f}" mode="1" >0.81199998</value>
<value id="{66ad2061-d242-45d6-9d8f-d6e8e1639a0f}" mode="4" >0.812</value>
<value id="{2c92ff76-aaf9-4f1d-a911-94959733a5f7}" mode="1" >4720.00000000</value>
<value id="{c84e8c99-923e-4d2b-bec4-da0f9b3f6207}" mode="1" >4720.00000000</value>
<value id="{c84e8c99-923e-4d2b-bec4-da0f9b3f6207}" mode="4" >4720.000</value>
<value id="{40a1d8a2-63af-4a6d-a38e-35338c747254}" mode="1" >1.00000000</value>
<value id="{3a66039f-a84c-49ad-a53c-f6535784f409}" mode="1" >3.27999997</value>
<value id="{0df847e5-463c-4fd2-b65b-fb411deb8d4d}" mode="1" >1.00000000</value>
<value id="{0df847e5-463c-4fd2-b65b-fb411deb8d4d}" mode="4" >1.000</value>
<value id="{1887fabf-4d9e-4cdc-8eb0-e2827da05b98}" mode="1" >3.27999997</value>
<value id="{1887fabf-4d9e-4cdc-8eb0-e2827da05b98}" mode="4" >3.280</value>
<value id="{b581f92e-a9c6-4eaf-9a9c-d31b1255831a}" mode="1" >0.00000000</value>
<value id="{9fcd3643-bc80-405e-a356-d1b07103fb23}" mode="1" >305.79998779</value>
<value id="{122867e1-a14b-46ba-8dca-51a37cc484dc}" mode="1" >305.79998779</value>
<value id="{122867e1-a14b-46ba-8dca-51a37cc484dc}" mode="4" >305.800</value>
</preset>
</bsbPresets>
