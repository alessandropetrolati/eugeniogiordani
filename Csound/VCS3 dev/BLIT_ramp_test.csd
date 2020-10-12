<CsoundSynthesizer>
<CsOptions>

</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 128
nchnls = 2
0dbfs   =1.5

instr 1

ifmin init 25			; min freq
ifmax init 12800		; max freq
ispan = ifmax - ifmin

knh init 300          ; max number of partials

kcps_0  invalue "_FREQ"
kcps_0 = (kcps_0 > 0.935? 0.935 : kcps_0) ; limit upper freq

kcps = ifmin + kcps_0 * ispan		; convert from 0 : 1   to actual freq


outvalue "_FREQHZ", kcps


kmul tablei kcps_0, 99,1			; compute band

outvalue "_HIPARLEV", kmul
		
asig gbuzz .6, kcps, knh, 1, kmul, 1		; generate band limited impulse train  (BLIT)
asigDC dcblock asig 						; remove DC component
ares integ asigDC 							; trasform impulses into ramp  via integration
     outs ares, ares


dispfft asig, 0.1, 512, 1					; FFT display
endin
</CsInstruments>
<CsScore>
; cosine wave
f 1 0 16384 11 1


f99  0  16  7   1 1 0.8 6 0.05 7 0.01 2 0
i 1 0 3600

e
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>901</x>
 <y>623</y>
 <width>811</width>
 <height>577</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>162</r>
  <g>188</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBGraph">
  <objectName/>
  <x>213</x>
  <y>201</y>
  <width>350</width>
  <height>150</height>
  <uuid>{156a3454-0fb9-4709-966b-82a188ba6ac7}</uuid>
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
 <bsbObject version="2" type="BSBHSlider">
  <objectName>_FREQ</objectName>
  <x>138</x>
  <y>111</y>
  <width>476</width>
  <height>26</height>
  <uuid>{e50752cb-1f17-4f17-a648-b013827c53d0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>0.98000000</maximum>
  <value>0.00823529</value>
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
  <x>80</x>
  <y>236</y>
  <width>53</width>
  <height>29</height>
  <uuid>{aa6dcfcc-b5c2-4c46-b1e3-7deb0aca665b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.974</label>
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
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>_FREQ</objectName>
  <x>309</x>
  <y>81</y>
  <width>82</width>
  <height>29</height>
  <uuid>{878677ef-2c5d-48e6-9e02-92d9ec370101}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.008</label>
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
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>_FREQHZ</objectName>
  <x>308</x>
  <y>138</y>
  <width>82</width>
  <height>29</height>
  <uuid>{bd48895d-536e-42b7-bae2-51521a8ed7a7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>130.206</label>
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
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>396</x>
  <y>83</y>
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
  <x>396</x>
  <y>141</y>
  <width>157</width>
  <height>24</height>
  <uuid>{dfcc507a-8afa-4157-87e1-98a54492498a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Actual Hz freq [25 : 12800]</label>
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
  <x>79</x>
  <y>263</y>
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
  <x>138</x>
  <y>138</y>
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
</bsbPanel>
<bsbPresets>
</bsbPresets>
