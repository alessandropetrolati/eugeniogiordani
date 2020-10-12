
<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 128
nchnls = 2
0dbfs = 1
; Gli algoritmi sono derivati da un metodo chiamato DPW (Differential Parabolic Wave)

;=========================
;An Average Differentiator
opcode AverageDiff, a,a
 
ain xin
setksmps 1

ad1 delay1 ain
ad2 delay1 ad1
aout = 0.5*(ain - ad2)
xout aout
endop
;========================
;A fast comparator 
opcode Compare_a, a, a

aphasor xin
setksmps 1
kphasor downsamp aphasor
if kphasor <=0 then
aout = 1 
else
aout = -1
endif

xout aout

endop






instr 1 ; RAMP GENERATOR  (After Valimaki and Houvilainen -  CMJ) 

kcps_0 invalue "cps"			;read freq
kcps port kcps_0, 0.02	

aphasor_1 phasor	kcps			;generate basic phasor
a1_1 = 2*(aphasor_1 - 0.5) 	;trasform into bipolar phasor
a2_1 = a1_1 * a1_1				;trasform into parabolic signal				
aRAMP_1 AverageDiff a2_1		;Differentiate with Average Differentiator
gaRAMP_comp_1 balance aRAMP_1, a2_1	;Balance it

outs gaRAMP_comp_1, gaRAMP_comp_1

dispfft gaRAMP_comp_1, 0.05, 1024, 1


endin




instr 3 ; TRIANGLE GENERATOR

kcps_0 invalue "cps"
kcps_0 = kcps_0 * 2	
kcps port kcps_0, 0.02	

kmod_rate invalue "mod_rate"
kmod_dep  invalue "mod_dep"
 
amodf  oscili kmod_dep, kmod_rate, 1

aphasor  phasor	 kcps + amodf 	;generate basic phasor
aphasor2 phasor   kcps/2	+ amodf/2;generate secondary phasor at half freq


aphasor2 = aphasor2 - 0.5 ;trasform into bipolar phasor2
a1 = 2*(aphasor - 0.5)		;trasform into bipolar phasor
a2 = 1- a1*a1					; 1 - a1^2	
					
asign Compare_a aphasor2   ;compare phasor2 and a2

a3 = a2 * asign				;if phasor2 >0 , then a2 is negated, else unaffected 


aTRI AverageDiff a3			;Differentiate with Average Differentiator
aTRI_comp balance  aTRI, a1

outs aTRI_comp*0.7, aTRI_comp*0.7
dispfft aTRI, 0.05, 1024, 1

endin




</CsInstruments>
<CsScore>

f1 0 1024 10 1
;i 1 0 1000
;i3 0 1000
f0 3600				
e 							
</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1071</x>
 <y>319</y>
 <width>632</width>
 <height>657</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>141</r>
  <g>153</g>
  <b>162</b>
 </bgcolor>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>cps</objectName>
  <x>49</x>
  <y>217</y>
  <width>20</width>
  <height>100</height>
  <uuid>{cf93831d-b6ec-46cf-8fdf-d701518cc817}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.50000000</minimum>
  <maximum>10000.00000000</maximum>
  <value>700.46500000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBScope" version="2">
  <objectName/>
  <x>187</x>
  <y>85</y>
  <width>350</width>
  <height>150</height>
  <uuid>{3c639f71-78bb-493f-ae21-138b65253de9}</uuid>
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
 <bsbObject type="BSBScope" version="2">
  <objectName/>
  <x>187</x>
  <y>239</y>
  <width>350</width>
  <height>150</height>
  <uuid>{356a2b7d-ed8e-4149-b4ec-574cdf877d0f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <value>2.00000000</value>
  <type>scope</type>
  <zoomx>2.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <mode>0.00000000</mode>
 </bsbObject>
 <bsbObject type="BSBGraph" version="2">
  <objectName/>
  <x>187</x>
  <y>419</y>
  <width>350</width>
  <height>150</height>
  <uuid>{ed3dbf09-8892-4856-b50b-0c13272ee5a8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <value>4</value>
  <objectName2/>
  <zoomx>1.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <modex>lin</modex>
  <modey>lin</modey>
  <all>true</all>
 </bsbObject>
 <bsbObject type="BSBScrollNumber" version="2">
  <objectName>cps</objectName>
  <x>79</x>
  <y>210</y>
  <width>46</width>
  <height>119</height>
  <uuid>{acb962a3-0d49-4c4d-ba57-84d78d8f7c3d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
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
  <value>700.46500000</value>
  <resolution>0.50000000</resolution>
  <minimum>0.50000000</minimum>
  <maximum>10000.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act="continuous"/>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>button9</objectName>
  <x>31</x>
  <y>88</y>
  <width>100</width>
  <height>30</height>
  <uuid>{baec73ac-2c7f-4e1f-9b5e-8acf097359a0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>RAMP</text>
  <image>/</image>
  <eventLine>i1 0 -10</eventLine>
  <latch>true</latch>
  <latched>true</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName/>
  <x>31</x>
  <y>126</y>
  <width>100</width>
  <height>30</height>
  <uuid>{33a22acf-77e4-4b2e-9d69-160f343d7968}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>TRI</text>
  <image>/</image>
  <eventLine>i3 0 -10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>44</x>
  <y>332</y>
  <width>80</width>
  <height>25</height>
  <uuid>{997d6eaf-4739-48f8-903e-c17b9645b6bc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>FREQ (Hz)</label>
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
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>53</x>
  <y>62</y>
  <width>51</width>
  <height>25</height>
  <uuid>{5ce686aa-42aa-4c2a-8cac-0053dfcd290e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>ON/OFF</label>
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
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1</x>
  <y>2</y>
  <width>630</width>
  <height>32</height>
  <uuid>{94643b48-0570-4ee1-9b12-92ab2ba5beb5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>DPW -  Virtual Analog Generator (Band Limited Oscillators)</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>mod_rate</objectName>
  <x>44</x>
  <y>441</y>
  <width>20</width>
  <height>100</height>
  <uuid>{988ba0df-e3f4-43dd-980f-2f765bb80679}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>30.00000000</maximum>
  <value>4.20000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>mod_dep</objectName>
  <x>100</x>
  <y>442</y>
  <width>20</width>
  <height>100</height>
  <uuid>{487d0526-a40f-49ff-be23-cefd914dbe1d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1000.00000000</maximum>
  <value>440.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>85</x>
  <y>545</y>
  <width>80</width>
  <height>25</height>
  <uuid>{06a83a18-c074-4cce-a00b-adc286e06a5c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Mod. Depth</label>
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
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>7</x>
  <y>545</y>
  <width>80</width>
  <height>25</height>
  <uuid>{c35104bf-b02d-485b-8847-367fcb368061}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Mod. Rate</label>
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
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>6</x>
  <y>570</y>
  <width>159</width>
  <height>25</height>
  <uuid>{c5aeb2e4-6225-499c-989e-782b3682b046}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Works only for Triangle</label>
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
</bsbPanel>
<bsbPresets>
</bsbPresets>
