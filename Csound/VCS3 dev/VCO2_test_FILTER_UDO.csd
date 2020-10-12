<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 128
nchnls = 2
0dbfs = 1



opcode MOOG_Ladder, a, akkk

   setksmps 1


ipi init $M_PI				;


az1 init 0             /* filter delays */
az2 init 0
az3 init 0
az4 init 0
az5 init 0
ay4 init 0
amf init 0

inv_sr  init 1/sr
i2v     init 40000		;thermal voltage of a transistor   
inv_i2v init 1/i2v		;inversal of the twice the thermal voltage of a transistor


asig,kcf,kres,kmod  xin		; asig=input signal  kcf = cutoff freq. in Hz    kres = resonance (0-1)



kfc = kcf*inv_sr  			;sr is half the actual filter sampling rate 
kf = kcf * inv_sr * 0.5   	; kf =  kcf/(sr*2)

;Frequency & amplitude correction 
 
kfcr = 1.8730*(kfc*kfc*kfc) + 0.4955*(kfc*kfc) - 0.6490*kfc + 0.9988
kacr = -3.9364*(kfc*kfc) + 1.8409*kfc + 0.9968				
k2vg = i2v*(1-exp(-2*$M_PI*kfcr*kf)) 						; filter tuning 



;cascade of 4 1st order sections 

;ay1 = az1 + k2vg*(tanh((asig - 4*kres*amf*kacr)*inv_i2v) - tanh(az1*inv_i2v))

ay1 = az1 + k2vg*((asig - 4*kres*amf*kacr)*inv_i2v - az1*inv_i2v) 

az1 = ay1

;kvalore downsamp k2vg*((asig - 4*kres*amf*kacr)*inv_i2v - az1*inv_i2v)
;printk 0.5, kvalore

aX21 = ay1*inv_i2v
aX22 = az2*inv_i2v



;ay2 = az2 + k2vg * (tanh(ay1*inv_i2v) - tanh(az2*inv_i2v))

ay2 = az2 + k2vg * ((ay1*inv_i2v) - (az2*inv_i2v))

az2 = ay2

aX31 = ay2*inv_i2v
aX32 = az3*inv_i2v

;ay3 = az3 + k2vg * (tanh(ay2*inv_i2v) - tanh(az3*inv_i2v))
ay3 = az3 + k2vg * ((ay2*inv_i2v) - (az3*inv_i2v))

az3 = ay3

aX41 = ay3*inv_i2v
aX42 = az4*inv_i2v

;ay4 = az4 + k2vg * (tanh(ay3*inv_i2v) - tanh(az4*inv_i2v))

ay4 = az4 + k2vg * ((ay3*inv_i2v) - (az4*inv_i2v))
az4 = ay4


; 1/2-sample delay for phase compensation
amf = (ay4+az5)*0.5
az5 = ay4

;oversampling

ay1 = az1 + k2vg*(((asig - 4*kres*amf*kacr)*inv_i2v) - (az1*inv_i2v))
az1 = ay1
ay2 = az2 + k2vg*((ay1*inv_i2v) - (az2*inv_i2v ))
az2 = ay2
ay3 = az3 + k2vg*((ay2*inv_i2v) - (az3*inv_i2v))
az3 = ay3
ay4 = az4 + k2vg*((ay3*inv_i2v) - (az4*inv_i2v))
az4 = ay4

amf = (ay4+az5)*0.5
az5 = ay4
        
        xout  amf
	
endop


instr 1

icutmin init 5			;minimun filter cutoff
icutmax init 10000		;maximum filter cutoff
icutrange = icutmax - icutmin		; compute cutoff range

gkamp				invalue "_amp"		; VCO amp
gkfreq				invalue "_freq"	; VCO freq (normalized)

gkfreq_norm  		port gkfreq, 0.01	;smooth freq

gkpwm_0			invalue "_PWM"		; PWM
gkpwm				port gkpwm_0, 0.01 ; smooth PWM



gkwave 			invalue "_WAVE"		; wave select
gkcut_0			invalue "_CUT"		; FILTER cutoff (normalized)
gkres_0			invalue "_RES"		; FILTER Resonance
gkBYPASS 			invalue "_BYPASS"	; Bypass filter
gkfilter_type 	invalue "_FILTER_TYPE"

gkFMrate			invalue "FM_rate"
gkFMdepth			invalue "FM_depth"

gkcut_port   		portk gkcut_0, 0.1		;Smooth cut freq
gkcut = icutmin + gkcut_port * icutrange		;scale filter freq. range
gkres	portk gkres_0, 0.05					;Smooth resonance

endin



instr 2


;NOTE
;=======
ireson_OSC_amp  init 0.1   ;!!!!!! initialize scale factor for whistle effect amount
							  ;!!!!!! can be increased or reduced for najor or minor effect
;==========

if gkwave == 0  then			; select appropriate value for VCO2 parameter (wave) when start orc

kwf = 2

else
kwf = 4



endif 

iwave = i(kwf)					; freeze wave value  (i-time only)



ktrig		changed	 gkwave		;detect change waveform
	if	ktrig=1	then			;IF I-RATE VARIABLE CHANGE TRIGGER IS '1'...
		reinit	UPDATE				;BEGIN A REINITIALISATION PASS FROM LABEL 'UPDATE'
	endif
	UPDATE:
    	
  if gkwave == 1 then			;select new value for waveform parameter in VCO2
     kwf = 4
     else
     kwf = 2
  endif
     
 iwave = i(kwf)				; freeze new value   	
    	
gkfreq 		port gkfreq_norm, 0.012	; smooth VCO freq
kfreq_log  tablei  gkfreq, 10, 1		; convert to expon
outvalue "val", kfreq_log				;dispay acutal freq


if (gkwave == 0 || gkwave == 1 || gkwave == 2) then    ; select between periodic waves and noise

	aout	vco2 gkamp*0.5, kfreq_log,iwave,gkpwm	; Use a nice sawtooth waveform.
  else
  
aout gauss 1
endif  
asine tone aout, 180
rireturn            ; resume perf after re-init pass





if gkwave == 2 then

aout = asine

else
endif

kmod oscili gkFMdepth, gkFMrate, 1		;FM oscillator

kfrq_tot = gkcut+kmod

kfrq_tot = (kfrq_tot <= 1 ? 1 : kfrq_tot)  

;=== filter section

if gkfilter_type == 0 then
afil moogladder  aout, kfrq_tot, gkres
elseif gkfilter_type == 1 then
afil moogvcf aout, kfrq_tot, gkres
elseif gkfilter_type == 2 then
afil moogvcf2 aout, kfrq_tot, gkres
else
afil MOOG_Ladder aout, kfrq_tot , gkres, kmod

endif

kamposc_exp tablei gkres,97, 1
aosc oscili ireson_OSC_amp*kamposc_exp, gkcut+kmod, 1    ;!!!!!!!!!!  scaled oscili amplitude


aHP  atonex afil, gkcut, 2

aFILMIX = aHP * gkres + afil * (1-gkres)

aFILMIX_OSCIL =  (0.72 - kamposc_exp)* aFILMIX  + aosc   ;!!!!!!!!!!! add this line for pure OSC effect on VCF


if gkBYPASS == 0 then

asig = aFILMIX_OSCIL				; !!!!!  different name in variable...			

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

;f 50 0 65536 "tanh" -10 10 0 
 

 
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
 <x>788</x>
 <y>256</y>
 <width>892</width>
 <height>716</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>85</r>
  <g>110</g>
  <b>128</b>
 </bgcolor>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>9</x>
  <y>530</y>
  <width>322</width>
  <height>163</height>
  <uuid>{0de60cdf-8a29-4968-ba7d-68c6419cdeb0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>FILTER FM</label>
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
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>7</x>
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
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>0</x>
  <y>0</y>
  <width>880</width>
  <height>39</height>
  <uuid>{c5f4063e-4a46-4f9d-96db-839bea9a983f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>VCO2 Test + VCF UDO</label>
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
 <bsbObject type="BSBDisplay" version="2">
  <objectName>_amp</objectName>
  <x>24</x>
  <y>74</y>
  <width>52</width>
  <height>24</height>
  <uuid>{bdb420cd-3c6f-4a72-bf63-3699e6bcead6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>1.000</label>
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
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>108</x>
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
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>27</x>
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
 <bsbObject type="BSBScrollNumber" version="2">
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
  <value>0.71280000</value>
  <resolution>0.00010000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>0.99000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject type="BSBKnob" version="2">
  <objectName>_freq</objectName>
  <x>91</x>
  <y>99</y>
  <width>80</width>
  <height>80</height>
  <uuid>{166bc677-757f-403d-8e9b-1f217b37af4f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>0.99000000</maximum>
  <value>0.71280000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>val</objectName>
  <x>100</x>
  <y>75</y>
  <width>65</width>
  <height>23</height>
  <uuid>{b5f095de-78ae-42ad-a2c6-f4163a76adef}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>680.403</label>
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
 <bsbObject type="BSBScope" version="2">
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
 <bsbObject type="BSBKnob" version="2">
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
  <value>0.15140000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBGraph" version="2">
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
 <bsbObject type="BSBLabel" version="2">
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
 <bsbObject type="BSBDisplay" version="2">
  <objectName>_PWM</objectName>
  <x>250</x>
  <y>70</y>
  <width>53</width>
  <height>24</height>
  <uuid>{19d27a6d-05eb-4855-8a95-986d7f42f977}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.151</label>
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
 <bsbObject type="BSBDropdown" version="2">
  <objectName>_WAVE</objectName>
  <x>29</x>
  <y>256</y>
  <width>93</width>
  <height>24</height>
  <uuid>{5854b9eb-fbdd-4f82-b98f-eaa574698015}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>SQUARE</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAMP</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> SINE</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> NOISE</name>
    <value>3</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>3</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>14</x>
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
 <bsbObject type="BSBLabel" version="2">
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
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>7</x>
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
 <bsbObject type="BSBKnob" version="2">
  <objectName>_CUT</objectName>
  <x>42</x>
  <y>369</y>
  <width>80</width>
  <height>80</height>
  <uuid>{ff13cdac-db20-48b3-9941-75173f3d6941}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.16000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBKnob" version="2">
  <objectName>_RES</objectName>
  <x>128</x>
  <y>369</y>
  <width>80</width>
  <height>80</height>
  <uuid>{1c801120-bdda-481e-bcc1-910772f9bd2e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>0.99200000</maximum>
  <value>0.46624000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>_RES</objectName>
  <x>131</x>
  <y>343</y>
  <width>79</width>
  <height>23</height>
  <uuid>{b480c206-3240-43e2-81f7-da0eed01b992}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.466</label>
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
 <bsbObject type="BSBDisplay" version="2">
  <objectName>_CUT</objectName>
  <x>41</x>
  <y>343</y>
  <width>80</width>
  <height>22</height>
  <uuid>{a8ca5e61-e281-4174-9a9d-9e9bc9118e83}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.160</label>
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
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>48</x>
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
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>140</x>
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
 <bsbObject type="BSBCheckBox" version="2">
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
 <bsbObject type="BSBLabel" version="2">
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
 <bsbObject type="BSBCheckBox" version="2">
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
 <bsbObject type="BSBLabel" version="2">
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
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>134</x>
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
 <bsbObject type="BSBKnob" version="2">
  <objectName>_amp</objectName>
  <x>11</x>
  <y>99</y>
  <width>80</width>
  <height>80</height>
  <uuid>{a353cb45-d881-4225-8106-bc8a60fd3404}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>_FILTER_TYPE</objectName>
  <x>94</x>
  <y>489</y>
  <width>157</width>
  <height>22</height>
  <uuid>{e97867db-3201-41ec-bf35-6c60109aecf2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>moogladder</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> moogvcf</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> moogvcf2</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> UDO_moogladder</name>
    <value>3</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>3</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>FM_rate</objectName>
  <x>73</x>
  <y>552</y>
  <width>20</width>
  <height>100</height>
  <uuid>{7653cf7a-8b2f-42ec-a8b1-ab7cfb359202}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.50000000</minimum>
  <maximum>20.00000000</maximum>
  <value>0.89000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>FM_depth</objectName>
  <x>159</x>
  <y>549</y>
  <width>20</width>
  <height>100</height>
  <uuid>{426b1df1-c842-4cf9-b391-9ce1c52062a6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1500.00000000</maximum>
  <value>645.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>55</x>
  <y>652</y>
  <width>69</width>
  <height>26</height>
  <uuid>{efe9b4d9-8e41-40b4-a597-7e93432cfeea}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>FM Rate</label>
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
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>144</x>
  <y>651</y>
  <width>69</width>
  <height>26</height>
  <uuid>{7944104f-a93c-4ab8-96ce-8a585f4ed0fe}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>FM Depth</label>
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
</bsbPanel>
<bsbPresets>
</bsbPresets>
