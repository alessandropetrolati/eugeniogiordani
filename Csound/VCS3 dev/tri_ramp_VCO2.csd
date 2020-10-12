<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 128
nchnls = 2
0dbfs = 1.0

opcode Compare,aaa, aaak
setksmps 1


atri, aramp_dwn, aramp_up, kpwm xin
kramp_dwn downsamp aramp_dwn
kramp_up  downsamp aramp_up
ktri downsamp atri

if kpwm >= -1.5 && kpwm <=-0.5 then

		if kramp_dwn < -0.5 && kramp_dwn > kpwm then		;   -1.5 < kpwm < -0.5

			amulramp_dwn = 1
			amultri  = 0
			amulramp_up = 0
		else	

		amulramp_dwn = 0
		amultri = 1
		amulramp_up = 0
		endif

else
	if kpwm > -0.5 && kramp_dwn < kpwm then
	amulramp_dwn = 0
	amultri  = 0
	amulramp_up = 1
else


amulramp_dwn = 0
amultri = 1
amulramp_up = 0
endif
		


endif





xout amulramp_dwn, amulramp_up, amultri


endop



itmp1    ftgen 1, 0, 16384, 7, 0, 4096, 1, 8192, -1, 4096, 0
iftTRI   vco2init -1, 10000, 0, 0, 0, 1

itmp1    ftgen 2, 0, 16384, 7, 1, 16384, 0
iftRAMP     vco2init -2, 10000, 0, 0, 0, 1


instr 1
kfreq_0 invalue "freq"
kpwm_0 invalue "pwm" 

kfreq port kfreq_0,0.01
kpwm port kpwm_0, 0.01


;aTRI oscili 0.5, kfreq, 1, 0.25		; triangle base

aTRI vco2 0.5, kfreq, 14, 0,0.25
aRAMP_DWN_0 vco2 0.5, kfreq, 0, 0


aRAMP_DWN_0 poscil 1, kfreq, 2				; rampa DOWN simmetrica : -1/1
aRAMP_UP_0  = 1 - aRAMP_DWN_0					; rampa UP   simmetrica : -1/1

aRAMP_DWN = aRAMP_DWN_0 - 0.5					; rampa DOWN A_simmetrica : 0.5 / -1.5
aRAMP_UP = aRAMP_UP_0 - 1.5					; rampa UP   A_simmetrica : -1.5 / 0.5
 



amulramp_dwn, amulramp_up,  amultri Compare aTRI, aRAMP_DWN,aRAMP_UP, kpwm

asig = (aTRI * amultri  + aRAMP_DWN * amulramp_dwn)    + (aRAMP_UP * amulramp_up + aTRI * amultri) * amulramp_up

;outs asig*0.5, asig*0.5

outs asig*0.5, asig*0.5
dispfft asig, 0.02, 1024, 1

endin
</CsInstruments>
<CsScore>



;f1 0 1025 7  0 256 1 512 -1 256 0			; triangle
f2 0 1025 7  1 1024 -1						; control ramp

i1 0 3600
e
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>586</x>
 <y>260</y>
 <width>988</width>
 <height>724</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>91</r>
  <g>139</g>
  <b>169</b>
 </bgcolor>
 <bsbObject version="2" type="BSBScope">
  <objectName/>
  <x>387</x>
  <y>108</y>
  <width>509</width>
  <height>245</height>
  <uuid>{765e0e94-25c1-446c-a1f7-7e34cdcb7c59}</uuid>
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
 <bsbObject version="2" type="BSBScope">
  <objectName/>
  <x>385</x>
  <y>369</y>
  <width>515</width>
  <height>292</height>
  <uuid>{7c860eaa-875d-4ff2-bded-2831f62f08ca}</uuid>
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
 <bsbObject version="2" type="BSBDisplay">
  <objectName>freq</objectName>
  <x>381</x>
  <y>42</y>
  <width>80</width>
  <height>25</height>
  <uuid>{68a73a1f-4d15-4912-8682-3a2b71ea150d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>28.272</label>
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
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBHSlider">
  <objectName>freq</objectName>
  <x>103</x>
  <y>72</y>
  <width>696</width>
  <height>19</height>
  <uuid>{1b1fa674-c3d8-4199-a080-dcb1890dafe7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>1000.00000000</maximum>
  <value>28.27155172</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>254</x>
  <y>184</y>
  <width>35</width>
  <height>22</height>
  <uuid>{6f79c9a4-dfb8-4590-b6b6-37775aaba5eb}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>TRI</label>
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
  <x>83</x>
  <y>182</y>
  <width>35</width>
  <height>22</height>
  <uuid>{17336497-8cbe-4c86-8627-431bf2aab75c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>SAW</label>
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
 <bsbObject version="2" type="BSBGraph">
  <objectName/>
  <x>27</x>
  <y>320</y>
  <width>350</width>
  <height>150</height>
  <uuid>{26c31b49-4386-46c8-a92b-e0a4cbbf4095}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <value>1</value>
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
  <objectName>pwm</objectName>
  <x>119</x>
  <y>178</y>
  <width>133</width>
  <height>33</height>
  <uuid>{0512efd9-97a5-431e-b259-13b09f00a70c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>-1.50000000</minimum>
  <maximum>0.50000000</maximum>
  <value>0.50000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>pwm</objectName>
  <x>148</x>
  <y>155</y>
  <width>80</width>
  <height>25</height>
  <uuid>{9bb499dd-9783-40a0-af28-5777a8a5b833}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.500</label>
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
