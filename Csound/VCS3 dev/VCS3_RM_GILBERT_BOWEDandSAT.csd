<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 128
nchnls = 2
0dbfs = 1

instr 1

k1 invalue "I1"
k2 = k1
k3 = k1
k4 = k1

kaMOD invalue "_AMPMOD"
kfMOD invalue "_FREQMOD"
kaCAR invalue "_AMPCAR"
kfCAR invalue "_FREQCAR"
kFFTON invalue "_FFTON"

ksw invalue "_SW"

kswDC		invalue "_SWDC"
kDCINPUT_0	invalue "_DCINPUT"
kDCINPUT_1 port kDCINPUT_0, 0.05
kDCINPUT atonek kDCINPUT_1, 16
kDCINPUT port kDCINPUT, 0.02



	
	aMOD_0   oscili 0.495 * kaMOD, kfMOD, 1
	aMOD_1  table3 aMOD_0, 2, 1, 0.5, 0
	
	aMOD  = aMOD_1  
	
	
	
	aCAR_0 	oscili 0.495 * kaCAR, kfCAR, 1
	aCAR_1  table3 aCAR_0, 2, 1, 0.5, 0
	
	aCAR = tanh (aCAR_1)
	aRM_0 =  aMOD * aCAR_1
	aRM   =  aMOD * aCAR
	
	if kswDC == 0  then
	
	aRM_VCS3 =  (aMOD + k1*aCAR) * (aCAR + k2*aMOD) + (k3 * aCAR) + (k4 * aMOD)
	
	else
	
	aRM_VCS3  = kDCINPUT *  aCAR
	endif

	
	if (ksw == 0) then	
	 aout = aRM_0	
	  elseif (ksw == 1) then
		aout = aRM
		 else
		  aout = aRM_VCS3
	endif
	
	
	 if kFFTON !=0  then
	   outvalue "_TABDISP", 2
	   dispfft aout, 0.1, 1024, 1
	  else
	  
	  endif
	   
	 
	  
	   
	
	outs aout, aout
	
	
endin

</CsInstruments>
<CsScore>
f 1 0 4096 10 1;  0 0.333 0 0.2;Sine wave
f 2 0 4096 9 0.5 1 -90
i 1 0 1000
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>632</x>
 <y>126</y>
 <width>926</width>
 <height>695</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>104</r>
  <g>128</g>
  <b>151</b>
 </bgcolor>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>_AMPMOD</objectName>
  <x>47</x>
  <y>79</y>
  <width>20</width>
  <height>100</height>
  <uuid>{d09db8a8-bb4a-4c7b-ae36-af082aabeee8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.78000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScope">
  <objectName/>
  <x>76</x>
  <y>270</y>
  <width>350</width>
  <height>150</height>
  <uuid>{05cdc6a3-7475-456a-af1c-bd4a78a4ac07}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <value>1.00000000</value>
  <type>scope</type>
  <zoomx>2.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <mode>0.00000000</mode>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>_FREQMOD</objectName>
  <x>122</x>
  <y>80</y>
  <width>20</width>
  <height>100</height>
  <uuid>{1cc87638-c379-4e3c-b85f-e03e82ee0de8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>6.00000000</minimum>
  <maximum>1760.00000000</maximum>
  <value>1374.12000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBGraph">
  <objectName>_TABDISP</objectName>
  <x>74</x>
  <y>430</y>
  <width>355</width>
  <height>205</height>
  <uuid>{8d327f11-1a88-4757-a19f-fa0d4ff31bb9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <value>2</value>
  <objectName2/>
  <zoomx>1.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <modex>lin</modex>
  <modey>lin</modey>
  <all>true</all>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>_AMPMOD</objectName>
  <x>28</x>
  <y>55</y>
  <width>60</width>
  <height>24</height>
  <uuid>{1d39854d-b5f5-401b-904b-df77ba0a54eb}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.780</label>
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
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>_FREQMOD</objectName>
  <x>105</x>
  <y>56</y>
  <width>60</width>
  <height>24</height>
  <uuid>{54b1279c-648b-4f9f-b6cf-3df5c9ff5d8e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>1374.120</label>
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
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>_AMPCAR</objectName>
  <x>217</x>
  <y>81</y>
  <width>20</width>
  <height>100</height>
  <uuid>{e6507427-7d3c-4ecf-9f11-e0fe488764b4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.89000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>_FREQCAR</objectName>
  <x>292</x>
  <y>82</y>
  <width>20</width>
  <height>100</height>
  <uuid>{a6d3c3eb-0993-4beb-ae9c-fca9ecc6ed4b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>6.00000000</minimum>
  <maximum>1760.00000000</maximum>
  <value>690.06000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>_AMPCAR</objectName>
  <x>200</x>
  <y>57</y>
  <width>60</width>
  <height>24</height>
  <uuid>{b23bc043-0256-4d9e-a487-5169b518ed91}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.890</label>
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
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>_FREQCAR</objectName>
  <x>275</x>
  <y>58</y>
  <width>60</width>
  <height>24</height>
  <uuid>{9da938f4-7daf-47c4-8c60-e0c056cd6462}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>690.060</label>
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
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>25</x>
  <y>180</y>
  <width>62</width>
  <height>25</height>
  <uuid>{cb2f6e56-56f2-4189-bbb3-9ebd83d80751}</uuid>
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
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>104</x>
  <y>180</y>
  <width>62</width>
  <height>25</height>
  <uuid>{3f27a88b-f466-42b5-a2b2-0f044c386b8f}</uuid>
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
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>198</x>
  <y>182</y>
  <width>62</width>
  <height>25</height>
  <uuid>{a560ec4d-baa9-431d-9328-b6c8e27bfe82}</uuid>
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
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>276</x>
  <y>181</y>
  <width>62</width>
  <height>25</height>
  <uuid>{1a79c9fc-fe92-4a84-9ef2-dfdaba49bbbf}</uuid>
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
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>196</x>
  <y>208</y>
  <width>152</width>
  <height>25</height>
  <uuid>{39586d42-71df-4b29-a8e9-93a972d8f76c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>________  CAR  ________</label>
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
  <x>28</x>
  <y>207</y>
  <width>152</width>
  <height>25</height>
  <uuid>{e17c9f54-7fdb-4a50-a2a6-c07225c382f2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>________  MOD  ________</label>
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
 <bsbObject version="2" type="BSBDropdown">
  <objectName>_SW</objectName>
  <x>422</x>
  <y>62</y>
  <width>104</width>
  <height>25</height>
  <uuid>{0108946e-3c9a-49aa-a681-8b6acd13e85c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>IDEAL RM</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> tanh </name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> VCS3_RM</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>2</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>_FFTON</objectName>
  <x>447</x>
  <y>514</y>
  <width>20</width>
  <height>20</height>
  <uuid>{5bc2f999-c1bc-47be-813a-af0bf0d19a70}</uuid>
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
  <x>444</x>
  <y>87</y>
  <width>80</width>
  <height>25</height>
  <uuid>{bc5c5f6d-4a9e-4628-8edc-e87d6c1bb2d2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>RM type</label>
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
  <x>432</x>
  <y>542</y>
  <width>80</width>
  <height>25</height>
  <uuid>{eb2ba1ef-51ba-4a92-9399-13f794214a39}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>FFT ON/OFF</label>
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
  <x>2</x>
  <y>2</y>
  <width>899</width>
  <height>30</height>
  <uuid>{40249019-0505-4b1a-9593-f8956768f88b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>VCS3 RM -  Gilbert Circuit SImulation with DC control and saturation</label>
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
   <r>232</r>
   <g>156</g>
   <b>10</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>I1</objectName>
  <x>433</x>
  <y>120</y>
  <width>80</width>
  <height>80</height>
  <uuid>{ff5a4f64-0e46-411a-aa05-581208c24219}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>0.01000000</maximum>
  <value>0.00460000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>_DCINPUT</objectName>
  <x>603</x>
  <y>261</y>
  <width>23</width>
  <height>231</height>
  <uuid>{145fc63d-65bd-4f4b-b77e-4a024767c833}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.53246753</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>_SWDC</objectName>
  <x>603</x>
  <y>525</y>
  <width>20</width>
  <height>20</height>
  <uuid>{b7c193d7-0fb0-4a51-a26d-102bfad864a7}</uuid>
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
  <x>668</x>
  <y>365</y>
  <width>175</width>
  <height>28</height>
  <uuid>{3c970bfc-33a6-4d7e-906e-d35cb1227840}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Vertical Joystick Control</label>
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
  <x>433</x>
  <y>202</y>
  <width>80</width>
  <height>25</height>
  <uuid>{47b1ad0f-fa48-4ee7-9417-14a7682acaea}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Bleed amount</label>
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
  <x>639</x>
  <y>520</y>
  <width>205</width>
  <height>27</height>
  <uuid>{73c21fe1-3ca9-4626-b315-61f2b576595e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>RM DC control enable/disable</label>
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
  <x>629</x>
  <y>260</y>
  <width>281</width>
  <height>92</height>
  <uuid>{42c8b563-44f2-400c-8a4c-4794ccf1da74}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>NOTE: The control simulated the effect of "bowing" the RM via DC signal (Joystick).  In this example the bowing action is done on the carrier wave. Move slow or fast the slider to hear the effect...</label>
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
