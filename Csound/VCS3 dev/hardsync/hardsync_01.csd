<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1.0


instr 1
 async_in_master init 0.0 ; l'osc. master non viene sincronizzato da nessuno  
    
    ; 
    kfmastercps	invalue "fmaster"	; master osc. freq
	kfslavecps		invalue "fslave"	; slave  osc. freq
	kmode			invalue "mode"
		
    
  amaster_phase, async_out_master   syncphasor  kfmastercps, async_in_master  ; fasore per l'oscillatore master
  asig_master 			 tablei amaster_phase, 10, 1					;look up table master osc.
    
    if kmode == 1 then
    
    async_slave_in = async_out_master
    
    else
    async_slave_in = 0
    endif
    
  aslave_phase, as		syncphasor  kfslavecps, async_slave_in   ; fasore per l'oscillatore slave (la fase è controllata dal fasore master)   
  asig_slave 			tablei aslave_phase, 10, 1	 ; look up table slave osc.
    
    
              outs         asig_master*0.2,asig_slave*0.2
endin

</CsInstruments>
<CsScore>
f1 1 1024 10 1

f10 0 1025 1 "saw_02.wav" 0 0 0

i1 0 3600
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>421</x>
 <y>172</y>
 <width>751</width>
 <height>365</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>143</r>
  <g>153</g>
  <b>179</b>
 </bgcolor>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>fmaster</objectName>
  <x>460</x>
  <y>29</y>
  <width>20</width>
  <height>100</height>
  <uuid>{e1edcd93-00b2-445b-ad77-738c79c6d399}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>400.00000000</maximum>
  <value>332.17000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>fslave</objectName>
  <x>542</x>
  <y>28</y>
  <width>20</width>
  <height>100</height>
  <uuid>{dd1418c2-8acf-43da-9cac-3bd0fff74cff}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>100.00000000</minimum>
  <maximum>1000.00000000</maximum>
  <value>577.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBScope" version="2">
  <objectName/>
  <x>21</x>
  <y>24</y>
  <width>350</width>
  <height>150</height>
  <uuid>{f7258b10-cd82-4128-8e17-2cf0b0c6f778}</uuid>
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
  <x>23</x>
  <y>189</y>
  <width>350</width>
  <height>150</height>
  <uuid>{7d19b9e8-de5b-4716-bb2f-2494c00ba04e}</uuid>
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
  <x>383</x>
  <y>189</y>
  <width>350</width>
  <height>150</height>
  <uuid>{e23df672-3744-4c9f-bd98-da01d3e6f47d}</uuid>
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
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>434</x>
  <y>128</y>
  <width>80</width>
  <height>25</height>
  <uuid>{3176c51e-b28b-4832-ace7-87cbfe07b7d2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Freq. MASTER</label>
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
  <x>522</x>
  <y>127</y>
  <width>80</width>
  <height>25</height>
  <uuid>{3c7ca4c5-999a-48a0-aeb7-750f0cc1453d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Freq. SLAVE</label>
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
 <bsbObject type="BSBScrollNumber" version="2">
  <objectName>fmaster</objectName>
  <x>450</x>
  <y>8</y>
  <width>41</width>
  <height>22</height>
  <uuid>{b9ec21c2-c895-4ff8-b00c-9aa5f432f6c2}</uuid>
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
  <value>332.17000000</value>
  <resolution>0.10000000</resolution>
  <minimum>200.00000000</minimum>
  <maximum>1000.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act="continuous"/>
 </bsbObject>
 <bsbObject type="BSBScrollNumber" version="2">
  <objectName>fslave</objectName>
  <x>532</x>
  <y>7</y>
  <width>41</width>
  <height>22</height>
  <uuid>{cf0095e0-a467-4379-a1d5-923d3c87f3d7}</uuid>
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
  <value>577.00000000</value>
  <resolution>0.10000000</resolution>
  <minimum>200.00000000</minimum>
  <maximum>1000.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>22</x>
  <y>2</y>
  <width>80</width>
  <height>25</height>
  <uuid>{f6412997-efbf-4143-a1d1-2178b9253a27}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>MASTER OSC.</label>
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
  <x>21</x>
  <y>172</y>
  <width>80</width>
  <height>25</height>
  <uuid>{29173002-5576-491b-85fc-12431e514c79}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>SLAVE OSC.</label>
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
 <bsbObject type="BSBCheckBox" version="2">
  <objectName>mode</objectName>
  <x>673</x>
  <y>57</y>
  <width>20</width>
  <height>20</height>
  <uuid>{eb2fb1f0-bbfd-48b0-9d69-53e58fb83b82}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
