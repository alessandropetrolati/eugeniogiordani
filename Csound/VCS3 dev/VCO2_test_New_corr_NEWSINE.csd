<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 128
nchnls = 2
0dbfs = 1



instr 1

icutmin init 5			;minimun filter cutoff
icutmax init 18000		;maximum filter cutoff
icutrange = icutmax - icutmin		; compute cutoff range

gkamp			invalue "_amp"		; VCO amp
gkfreq			invalue "_freq"	; VCO freq (normalized)

gkfreq_norm  port gkfreq, 0.01	;smooth freq

gkpwm_0			invalue "_PWM"		; PWM
gkpwm			port gkpwm_0, 0.01 ; smooth PWM



gkRAMP			invalue "_RAMP"
gkSQUARE 		invalue "_SQUARE"
gkSINE			invalue "_SINE"
gkNOISE			invalue "_NOISE"


gkcut_0	invalue		"_CUT"		; FILTER cutoff (normalized)
gkres_0	invalue		"_RES"		; FILTER Resonance
gkBYPASS invalue "_BYPASS"	; Bypass filter


gkcut_port   portk gkcut_0, 0.1		;Smooth cut freq
gkcut = icutmin + gkcut_port * icutrange		;scale filter freq. range
gkres	portk gkres_0, 0.05					;Smooth resonance

endin



instr 2


;NOTE
;=======
ireson_OSC_amp  init 0.1   ;!!!!!! initialize scale factor for whistle effect amount
							  ;!!!!!! can be increased or reduced for najor or minor effect
;==========



			
     
 
    	
gkfreq 		port gkfreq_norm, 0.012	; smooth VCO freq
kfreq_log  tablei  gkfreq, 10, 1		; convert to expon
outvalue "val", kfreq_log				;dispay acutal freq


if (gkRAMP == 1 && gkSQUARE == 0 && gkSINE == 0 && gkNOISE == 0 ) then    ; select between periodic waves and 

	aout	vco2 gkamp*0.5, kfreq_log,4,gkpwm	; Use a nice sawtooth waveform.
elseif 	(gkRAMP == 0 && gkSQUARE == 1 && gkSINE == 0 && gkNOISE == 0 ) then

	aout	vco2 gkamp*0.5, kfreq_log,2,gkpwm	; Use a square sawtooth waveform.
	
elseif 	(gkRAMP == 0 && gkSQUARE == 0 && gkSINE == 1 && gkNOISE == 0 ) then

	aout	vco2 gkamp*0.5, kfreq_log,2,gkpwm	; Use a square sawtooth waveform.
	aout	tonex aout, 400,3  ; transform square to sine
	aout   dcblock aout		; reduce or remove AC component
	
	
elseif 	(gkRAMP == 0 && gkSQUARE == 0 && gkSINE == 0 && gkNOISE == 1 ) then	
	
	;aout   atone aout, 20 ;  for test   ( enhance band)!!!!!!!!!!
	;aout   pareq aout, 10000, 6,0.5,2	(tilt response due to matrix board capacitive effect)  !!!!!!!
  
  
aout gauss 1   ;   Noise generator

else
aout = 0		;  No sound at all
endif  







;=== filter section

afil moogladder  aout, gkcut, gkres


kamposc_exp tablei gkres,97, 1
aosc oscili ireson_OSC_amp*kamposc_exp, gkcut, 1    ;  scaled oscili amplitude


aHP  atonex afil, gkcut, 2

aFILMIX = aHP * gkres + afil * (1-gkres)

aFILMIX_OSCIL =  (0.72 - kamposc_exp)* aFILMIX  + aosc   ;add this line for pure OSC effect on VCF


if gkBYPASS == 0 then

asig = aFILMIX_OSCIL				;  different name in variable...			

else
asig  = aout 

endif
	
outs asig, asig
    


kfft_onoff invalue "FFT"
if kfft_onoff !=0 then 
 outvalue "tab", 5 
 
 
 dispfft asig, 0.1, 1024, 1					; FFT display
 
endif 

endin






</CsInstruments>
<CsScore>


f1 0 16384 10 1			; SINE

f10 0 1024 -16 2 1024 10 12000   ;  tabella di modellazione della corrispondenza dial/frequenza
 

 
;f13 0 0 -1 "/Users/eug/Desktop/VCS3_test/vcs3ramp4k.wav" 0 2 0

f97 0 1024 5 0.0001 512 0.0002 256 0.001 128 0.002 128 1
f98 0 1024 10 1 0.05 0.05 0.05
f99 0 1024 5 0.001 1024 1
i 1 0 3600
i 2 0 3600


</CsScore>
</CsoundSynthesizer>




<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>464</x>
 <y>407</y>
 <width>892</width>
 <height>588</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>175</r>
  <g>67</g>
  <b>16</b>
 </bgcolor>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>10</x>
  <y>51</y>
  <width>320</width>
  <height>257</height>
  <uuid>{3d7e00aa-d3bd-4bec-adba-207e468d4c91}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>VCO</label>
  <alignment>left</alignment>
  <font>Eurostile</font>
  <fontsize>16</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>98</r>
   <g>187</g>
   <b>232</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>1</x>
  <y>0</y>
  <width>880</width>
  <height>39</height>
  <uuid>{c5f4063e-4a46-4f9d-96db-839bea9a983f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>VCO2 Test + VCF+NEW SINE</label>
  <alignment>left</alignment>
  <font>Apple Chancery</font>
  <fontsize>24</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>191</r>
   <g>204</g>
   <b>234</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>_amp</objectName>
  <x>27</x>
  <y>74</y>
  <width>52</width>
  <height>24</height>
  <uuid>{bdb420cd-3c6f-4a72-bf63-3699e6bcead6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.880</label>
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
  <x>111</x>
  <y>180</y>
  <width>43</width>
  <height>23</height>
  <uuid>{51b0e8bd-f3cc-4642-8bcc-d6b49ff6204a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>FREQ</label>
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
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>30</x>
  <y>179</y>
  <width>43</width>
  <height>23</height>
  <uuid>{eac8982c-7f09-43a2-99f6-ce726fedb4dd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>AMP</label>
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
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>_freq</objectName>
  <x>176</x>
  <y>55</y>
  <width>51</width>
  <height>150</height>
  <uuid>{014cf455-512f-4266-8e38-182754747379}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>102</r>
   <g>102</g>
   <b>102</b>
  </bgcolor>
  <value>0.57500000</value>
  <resolution>0.00010000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>0.99000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>_freq</objectName>
  <x>94</x>
  <y>99</y>
  <width>80</width>
  <height>80</height>
  <uuid>{166bc677-757f-403d-8e9b-1f217b37af4f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>0.99000000</maximum>
  <value>0.57500000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>val</objectName>
  <x>103</x>
  <y>75</y>
  <width>65</width>
  <height>23</height>
  <uuid>{b5f095de-78ae-42ad-a2c6-f4163a76adef}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>172.607</label>
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
   <r>232</r>
   <g>218</g>
   <b>111</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScope">
  <objectName/>
  <x>385</x>
  <y>275</y>
  <width>481</width>
  <height>294</height>
  <uuid>{ab744b88-4927-48b1-a6dd-2155e9893945}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <value>-255.00000000</value>
  <type>scope</type>
  <zoomx>1.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <mode>0.00000000</mode>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>_PWM</objectName>
  <x>238</x>
  <y>95</y>
  <width>80</width>
  <height>80</height>
  <uuid>{d765fb6e-69b2-4d40-9052-47f846d6580e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00200000</minimum>
  <maximum>0.99800000</maximum>
  <value>0.47012000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBGraph">
  <objectName>tab</objectName>
  <x>385</x>
  <y>49</y>
  <width>481</width>
  <height>225</height>
  <uuid>{c57fbef8-87ca-4cb3-837f-a9147a0934cf}</uuid>
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
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>256</x>
  <y>176</y>
  <width>43</width>
  <height>23</height>
  <uuid>{df757b9f-7b92-4b24-86e8-0c265287cc72}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>PWM</label>
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
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>_PWM</objectName>
  <x>250</x>
  <y>70</y>
  <width>53</width>
  <height>24</height>
  <uuid>{19d27a6d-05eb-4855-8a95-986d7f42f977}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.470</label>
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
  <x>17</x>
  <y>278</y>
  <width>126</width>
  <height>23</height>
  <uuid>{fd10a8a6-204e-49b9-80ca-c8a47eef4cc1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>WAVEFORM  SELECT</label>
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
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>161</x>
  <y>207</y>
  <width>79</width>
  <height>21</height>
  <uuid>{1bf74e83-03eb-4646-b487-83b527cf3d17}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>...scroll</label>
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
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>10</x>
  <y>320</y>
  <width>322</width>
  <height>163</height>
  <uuid>{474d8440-2300-4149-bc88-a76f4c2f2868}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>FILTER</label>
  <alignment>left</alignment>
  <font>Eurostile</font>
  <fontsize>14</fontsize>
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
 <bsbObject version="2" type="BSBKnob">
  <objectName>_CUT</objectName>
  <x>45</x>
  <y>369</y>
  <width>80</width>
  <height>80</height>
  <uuid>{ff13cdac-db20-48b3-9941-75173f3d6941}</uuid>
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
 <bsbObject version="2" type="BSBKnob">
  <objectName>_RES</objectName>
  <x>131</x>
  <y>369</y>
  <width>80</width>
  <height>80</height>
  <uuid>{1c801120-bdda-481e-bcc1-910772f9bd2e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>0.99200000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>_RES</objectName>
  <x>134</x>
  <y>343</y>
  <width>79</width>
  <height>23</height>
  <uuid>{b480c206-3240-43e2-81f7-da0eed01b992}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.000</label>
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
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>_CUT</objectName>
  <x>44</x>
  <y>343</y>
  <width>80</width>
  <height>22</height>
  <uuid>{a8ca5e61-e281-4174-9a9d-9e9bc9118e83}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.850</label>
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
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>52</x>
  <y>451</y>
  <width>69</width>
  <height>26</height>
  <uuid>{f547ffc9-4929-4f7a-b428-3dedeb8758a0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Cut Freq</label>
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
  <x>145</x>
  <y>449</y>
  <width>59</width>
  <height>25</height>
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
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>_BYPASS</objectName>
  <x>258</x>
  <y>366</y>
  <width>26</width>
  <height>18</height>
  <uuid>{6b0a1446-ce3d-4aec-9a1a-b3d1fdff81d5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>221</x>
  <y>384</y>
  <width>111</width>
  <height>24</height>
  <uuid>{234ad702-7bee-4208-ae30-e1a92f3daa46}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Filter Bypass</label>
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
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>FFT</objectName>
  <x>355</x>
  <y>145</y>
  <width>20</width>
  <height>20</height>
  <uuid>{25960cbb-05d9-42c6-b2e2-d8841a502360}</uuid>
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
  <x>335</x>
  <y>168</y>
  <width>53</width>
  <height>37</height>
  <uuid>{7ea988ec-8537-4657-9992-d884d14f1a74}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>FFT
On/Off</label>
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
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>137</x>
  <y>227</y>
  <width>190</width>
  <height>51</height>
  <uuid>{d4d8595f-4320-4f96-b2ad-ca47b5110ef6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Set scroll freq to 0.5748  (172.265 Hz) for stable display @ 44100 and ksmps = 128</label>
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
 <bsbObject version="2" type="BSBKnob">
  <objectName>_amp</objectName>
  <x>14</x>
  <y>99</y>
  <width>80</width>
  <height>80</height>
  <uuid>{a353cb45-d881-4225-8106-bc8a60fd3404}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.88000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>_PWM</objectName>
  <x>244</x>
  <y>201</y>
  <width>80</width>
  <height>25</height>
  <uuid>{465801af-2bbf-4235-8482-024165305798}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>center</alignment>
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
  <value>0.47012000</value>
  <resolution>0.00100000</resolution>
  <minimum>0.00200000</minimum>
  <maximum>0.99800000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>_RAMP</objectName>
  <x>23</x>
  <y>507</y>
  <width>20</width>
  <height>20</height>
  <uuid>{d5913e8d-2191-49e7-adbc-df9d6f756a08}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>7</x>
  <y>528</y>
  <width>59</width>
  <height>25</height>
  <uuid>{3c18c17b-8e22-4b86-9f9d-f369722fadf8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>RAMP</label>
  <alignment>center</alignment>
  <font>AppleMyungjo</font>
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
  <objectName>_SQUARE</objectName>
  <x>82</x>
  <y>508</y>
  <width>20</width>
  <height>20</height>
  <uuid>{4edb2e1f-591e-4247-a71e-3b6efd084ed8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>67</x>
  <y>528</y>
  <width>61</width>
  <height>25</height>
  <uuid>{d952471c-75b9-4d0e-a16a-558b81d09f01}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>SQUARE</label>
  <alignment>center</alignment>
  <font>AppleMyungjo</font>
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
  <objectName>_SINE</objectName>
  <x>144</x>
  <y>508</y>
  <width>20</width>
  <height>20</height>
  <uuid>{137dd7b6-3692-45d8-b77d-c8d8078b3e2f}</uuid>
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
  <x>129</x>
  <y>528</y>
  <width>61</width>
  <height>25</height>
  <uuid>{b2ad2230-b92f-43e6-8fd4-83f60bcff758}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>SINE</label>
  <alignment>center</alignment>
  <font>AppleMyungjo</font>
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
  <objectName>_NOISE</objectName>
  <x>206</x>
  <y>508</y>
  <width>20</width>
  <height>20</height>
  <uuid>{646e0e0c-cb94-489e-9cff-1c5cb3540a8f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>191</x>
  <y>528</y>
  <width>61</width>
  <height>25</height>
  <uuid>{5bd255fa-13c9-43cf-9088-4d7f52c17100}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>NOISE</label>
  <alignment>center</alignment>
  <font>AppleMyungjo</font>
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
  <x>5</x>
  <y>554</y>
  <width>246</width>
  <height>24</height>
  <uuid>{8a12cb50-45ec-43fa-96b5-767fcbad1542}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Select ONLY one waveform at a time</label>
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
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
