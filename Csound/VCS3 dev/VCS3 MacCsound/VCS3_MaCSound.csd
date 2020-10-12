<CsoundSynthesizer>
<CsOptions>
-o/Users/eg/Documents/MacCSFiles/myEx/VCS3_CS_temp.aif
</CsOptions>
<CsInstruments>


	;sr     = 44100

;	kr     = 441

	ksmps  = 350

	nchnls = 2


#define TRUE #1#
#define  FALSE #0#
 
gaout1 init 0
gaout2 init 0
ganoise init 0
gafilter	init 0
garmod init 0
gkpitch_sequ init 8.00
gaenv_seq init 1
gaenvsig init 0
gkHZ_sequ init 300
gklevel_sequ init 1
gkcutoff_sequ init 0
gkpan_sequ init 0.5
gkstate_sequ init $FALSE
gindex init 0
gkmute init $FALSE
gkmutesynth init 1
gkfadesw init $FALSE
gkfadeout init 1
gkfadein init 1
gkindex init 0
ga31_vc_out init 0
ga32_vc_out init 0
ga21_vc_out init 0
ga22_vc_out init 0
ga11_vc_out init 0
ga12_vc_out init 0

gktrapezoid init 0

gksw9990 init 0
;-----------------------------------
instr default

;klsine1_0 init 0.5
;klramp1_0 init 0.5
;outvalue "lsine1", klsine1_0
;outvalue "lramp1", klramp1_0
outvalue "ledmute", 0
endin



;===================================   MATRIX SWITCH BOARD      ===============================
instr matrix						
kstatus invalue "_Play"
outvalue	"status", kstatus
;printk 0.1, gkmute

gk0102		invalue		"k01-02"
gk0103		invalue		"k01-03"
gk0105		invalue		"k01-05"
gk0104		invalue		"k01-04"
gk0106		invalue		"k01-06"
gk0107		invalue		"k01-07"
gk0108		invalue		"k01-08"		;(osc11 sine OUT  ---->  reverb IN)
gk0110		invalue		"k01-10"
gk0210		invalue		"k02-10"

gk0207		invalue		"k02-07"
gk0202		invalue		"k02-02"
gk0203		invalue		"k02-03"
gk0204		invalue		"k02-04"
gk0205		invalue		"k02-05"
gk0206		invalue		"k02-06"
gk0208		invalue		"k02-08"		;(out osc12 OUT   ---->  reverb IN)

gk0302		invalue		"k03-02"
gk0303		invalue		"k03-03"
gk0304		invalue		"k03-04"

gk0305		invalue		"k03-05"
gk0306		invalue		"k03-06"
gk0307		invalue		"k03-07"
gk0308		invalue		"k03-08"		;(osc21 square OUT  ---->  reverb IN)
gk0309		invalue		"k03-09"
gk0310		invalue		"k03-10"


gk0402		invalue		"k04-02"
gk0403		invalue		"k04-03"
gk0404		invalue		"k04-04"
gk0405		invalue		"k04-05"
gk0406		invalue		"k04-06"
gk0407		invalue		"k04-07"
gk0408		invalue		"k04-08"		;(osc22 ramp  OUT  ---->  reverb IN)
gk0409		invalue		"k04-09"
gk0410		invalue		"k04-10"


gk0502		invalue		"k05-02"
gk0503		invalue		"k05-03"
gk0504		invalue		"k05-04"
gk0505		invalue		"k05-05"
gk0506		invalue		"k05-06"

gk0507		invalue		"k05-07"
gk0508		invalue		"k05-08"
gk0509		invalue		"k05-09"
gk0510		invalue		"k05-10"

gk0602		invalue		"k06-02"
gk0603		invalue		"k06-03"
gk0604		invalue		"k06-04"
gk0605		invalue		"k06-05"
gk0607		invalue		"k06-07"
gk0606		invalue		"k06-06"
gk0608		invalue		"k06-08"
gk0609		invalue		"k06-09"
gk0610		invalue		"k06-10"

gk0702		invalue		"k07-02"
gk0703		invalue		"k07-03"
gk0704		invalue		"k07-04"
gk0707		invalue		"k07-07"
gk0708		invalue		"k07-08"		;(noise OUT  ---->  reverb IN)


gk0802		invalue		"k08-02"
gk0803		invalue		"k08-03"
gk0805		invalue		"k08-05"
gk0806		invalue		"k08-06"
gk0807		invalue		"k08-07"
gk0808		invalue		"k08-08"

gk0902		invalue		"k09-02"
gk0903		invalue		"k09-03"
gk0905		invalue		"k09-05"
gk0906		invalue		"k09-06"
gk0907		invalue		"k09-07"
gk0908		invalue		"k09-08"


gk1002		invalue		"k10-02"
gk1003		invalue		"k10-03"
gk1004		invalue		"k10-04"
gk1005		invalue		"k10-05"
gk1006		invalue		"k10-06"
gk1008		invalue		"k10-08"		;(filter OUT  ---->  reverb IN)

gk1109		invalue		"k11-09"
gk1110		invalue		"k11-10"
gk1111		invalue		"k11-11"
gk1114		invalue		"k11-14"

gk1202		invalue		"k12-02"
gk1203		invalue		"k12-03"
gk1207		invalue		"k12-07"
gk1208		invalue		"k12-08"

gk1302		invalue		"k13-02"
gk1303		invalue		"k13-03"
gk1307		invalue		"k13-07"
gk1308		invalue		"k13-08"		;(rmod OUT  ---->  reverb IN)

gk1402		invalue		"k14-02"		;(rev OUT  ---->  outamp1 IN)
gk1403		invalue		"k14-03"		;(rev OUT  ---->  outamp2 IN)

gk1509		invalue		"k15-09"
gk1514		invalue		"k15-14"
gk1510		invalue		"k15-10"
gk1511		invalue		"k15-11"


gk1609		invalue		"k16-09"
gk1610		invalue		"k16-10"
gk1611		invalue		"k16-11"

gkseq		invalue		"seq"

outvalue "seq", gkseq
outvalue "synth" , 1-gkseq
gktraplev invalue 	"traplev"
gksignal	invalue		"signal"
endin

;-----------    EXTERNAL INPUT

instr input
klevin1		invalue "levin_1"
klevin2		invalue "levin_2"
ain1, ain2 	ins
gainput1 =  klevin1 * ain1
gainput2 =  klevin2 * ain2
ain1f			follow ain1, 1/kr
ain2f			follow ain2, 1/kr
kin1_norm 		downsamp ain1f/32767
kin2_norm 		downsamp ain2f/32767

outvalue "in_1", kin1_norm
outvalue "in_2", kin2_norm
;outs gainput1,gainput2

endin




;-------------------------------------------------------------

instr joy

kjoy_h		invalue "joy_h"
kjoy_v		invalue "joy_v"

gkrange_h	invalue "range_h"
gkrange_v	invalue "range_v"

gkjoy_hl limit kjoy_h, 0, 1
gkjoy_vl limit kjoy_v, 0, 1

gkjoy_hl port gkjoy_hl, 0.01
gkjoy_vl port gkjoy_vl, 0.01

gkjoy_hlr = gkjoy_hl * gkrange_h  ; Use this variables to control all other devices
gkjoy_vlr = gkjoy_vl * gkrange_v  ;  "


outvalue "disp_joy_h" , gkjoy_hl
outvalue "disp_joy_v" , gkjoy_vl

endin



;-------------------------------------------------------------

instr woodbox

kfill = 1

outvalue "left" , kfill
outvalue "blackstrip" , kfill


endin


;------------------------------------------------------------
instr osc1



kf1			invalue "frosc1"
klramp1 	invalue "lramp1"
klsine1 	invalue "lsine1"
kshape1	invalue "shape1"

kf1 tablei kf1 * 0.1, 9, 1, 0
outvalue "dispfrosc1", kf1

kf1 port kf1, 0.02
if gkseq == 0 goto norm
kfsuml =  kf1 * 0.01 + gkHZ_sequ
goto osc
norm:
kdeltaf =  (gkjoy_hlr - gkrange_h * 0.5) * gk1509 * 1000 + ( gkjoy_vlr - gkrange_v * 0.5 ) * gk1609 * 1000 



kfsum = kf1 + kdeltaf + (1000 * gktrapezoid * gk1109 * gktraplev)
kfsuml limit kfsum, 1, 10000

osc:


avc_OSC21 = ga21_vc_out  * gk0309 * 200
avc_OSC22 = ga22_vc_out  * gk0409 * 200

avc_OSC31 = ga31_vc_out  * gk0509 * 200
avc_OSC32 = ga32_vc_out  * gk0609 * 200

avc = avc_OSC21 + avc_OSC22 + avc_OSC31 + avc_OSC32 

					atri	oscili  0.5, avc + kfsuml, 3, -1          ; Generate triangle
					aramp oscili  0.5, avc + kfsuml, 2, -1
					a1		tablei (atri + kshape1 - 0.5 ), 4, 1, .5  ; Shape triangle into sine
					a2 = aramp * 48000 * klramp1


ga11_vc_out = a1  * klsine1				;CV out 1
ga12_vc_out = a2 / 48000 * klramp1		;CV out 2



if gkseq == 1 then

gasig11 = a1 * 20000 * klsine1 * gklevel_sequ * gaenv_seq
gasig12 = a2 * gaenv_seq * gklevel_sequ
else
gasig11 = a1 * 20000 * klsine1 
gasig12 = a2  
endif



endin


;----------------------------
instr osc2								; OSCILLATOR 2 (New Version)


kf2 		invalue "frosc2"
klramp2 	invalue "lramp2"
klsquare2 invalue "lsquare2"
kshape2	invalue "shape2"

kf2 tablei kf2 * 0.1, 9, 1, 0
outvalue "dispfrosc2", kf2
kf2 port kf2, 0.02

if gkseq == 0 goto norm
kfsuml =  kf2 * 0.01 + gkHZ_sequ
goto osc
norm:
kdeltaf =  (gkjoy_hlr - gkrange_h * 0.5) * gk1510 * 1000 + ( gkjoy_vlr - gkrange_v * 0.5 ) * gk1610 * 1000 
kfsum = kf2 + kdeltaf + (1000 * gktrapezoid * gk1110 * gktraplev)
kfsuml limit kfsum, 1, 10000

osc:

avc_OSC11 = ga11_vc_out  * gk0110 * 200
avc_OSC12 = ga12_vc_out  * gk0210 * 200

avc_OSC31 = ga31_vc_out  * gk0510 * 200
avc_OSC32 = ga32_vc_out  * gk0610 * 200

avc = (avc_OSC11 + avc_OSC12 + avc_OSC31 + avc_OSC32) 


kshift = abs(0.5 - kshape2) * 0.5 + 0.25  ; DC level shift for ramp

aramp phasor  kfsuml + avc , -1



aramp	mirror 1 - aramp - kshape2, 0 , 1

						a2 = (aramp - kshift) * klramp2 * 90000				; RAMP signal
						kshape2x = (kshape2 - 0.5) * 1.5						; Rescale shape param. to range -0.75 to +0.75
						atri	oscili  1, kfsuml + avc, 3					; TRIANGLE signal for SQUARE PW
						aindex limit atri + kshape2x   , -1, 1				; Generate limited index 
   						asq		tablei  aindex, 5, 1,0.5,0					; Generate SQUARE PW
						a1 = asq * 14000 * klsquare2

ga21_vc_out = a1 / 14000 * klsquare2	;CV out 1
ga22_vc_out = a2 / 24000 * klramp2		;CV out 2
	

if gkseq == 1 then

gasig21 = a1 * gaenv_seq * gklevel_sequ
gasig22 = a2 * gaenv_seq * gklevel_sequ
else
gasig21 = a1 
gasig22 = a2 
endif
endin





;------------------------------------------------------------
instr osc3


kf3 		invalue "frosc3"
klramp3 	invalue "lramp3"
klsquare3 invalue "lsquare3"
kshape3	invalue "shape3"

kf3 tablei kf3 * 0.1, 10, 1, 0
outvalue "dispfrosc3", kf3
kf3 port kf3, 0.02


if gkseq == 0 goto norm
kfsuml =  kf3 * 0.01 + gkHZ_sequ
goto osc
norm:
kdeltaf =  (gkjoy_hlr - gkrange_h * 0.5) * gk1511 * 1000 + ( gkjoy_vlr - gkrange_v * 0.5 ) * gk1611 * 1000  
kfsum = kf3 + kdeltaf + (1000 * gktrapezoid * gk1111 * gktraplev)
kfsuml limit kfsum, 0.1, 10000

osc:


kshift = abs(0.5 - kshape3) * 0.5 + 0.25  ; DC level shift for ramp

aramp phasor  kfsuml, -1



aramp	mirror 1 - aramp - kshape3, 0 , 1
;arampxsq mirror 1 - aramp - kshape3 * 0.5, 0, 1



a2 = (aramp - kshift) * klramp3 * 90000

						kshape3x = (kshape3 - 0.5) * 1.5			; Rescale shape param. to range -0.75 to +0.75
						atri	oscili  1, kfsuml , 3				; TRIANGLE signal for SQUARE PW
						aindex limit atri + kshape3x   , -1, 1	; Generate limited index 
   						asq		tablei  aindex, 5, 1,0.5,0		; Generate SQUARE PW
						a1 = asq * 14000 * klsquare3





;a1 table3  arampxsq, 5 , 1

;a1 = a1 * 15000 * klsquare3



ga31_vc_out = a1 / 14000 * klsquare3	;CV out 1
ga32_vc_out = a2 / 24000 * klramp3		;CV out 2




if gkseq == 1 then

gasig31 = a1 * gaenv_seq * gklevel_sequ
gasig32 = a2 * gaenv_seq * gklevel_sequ

else
gasig31 = a1 
gasig32 = a2
endif 
endin


;------------------------------------------------------------
instr wnoise


knoiselev invalue "noiselev"
kcolor		invalue "noisecolor"

kgain      =       ampdb(kcolor)    


if gkseq == 1 goto cont
gaenv_seq = 1

cont:

anoise linrand  30000 * knoiselev


anoise   pareq  anoise, 100, kgain, .707, 1 ; Bass +/-
anoise   pareq  anoise, 10000, kgain, .707, 2 ; Treble -/+

ganoise = anoise * gaenv_seq
endin


;-------------------------------------------------------------


instr filter

kcutoff invalue "cutoff"
kres	invalue "res"
kfillev invalue "fillev"

kdelta = (gkjoy_hlr - gkrange_h * 0.5) * gk1514 * 5000	+ gkcutoff_sequ ; deltaf

outvalue "kdelta", kdelta

ain1 = (ganoise*gk0707 + gasig11* gk0107 + gasig12 *gk0207 + gasig21 * gk0307 + gasig22 * gk0407 + gasig31 * gk0507 + gasig32 *gk0607 + gaenvsig * gk1207)
ain2 = garmod * gk1307 + gainput1 * gk0807 + gainput2 * gk0907 
ain = ain1 + ain2


kfreqexp    tablei  kcutoff , 8, 1      ; Linear to exponential convertor
outvalue "dispcutoff", kfreqexp

kfreq = kfreqexp + kdelta + (10000 * gktrapezoid * gk1114 * gktraplev) 
kfreql limit kfreq, 50, 10000

gafilter	moogladder  ain * kfillev, kfreql, kres


endin

;---------------------------------------------------------

instr ringmod
krmlev invalue	"rmlev"

asum_a1 = (gasig11 * gk0105  + gasig12 * gk0205 + gasig21 * gk0305 + gasig22 * gk0405 + gasig31 * gk0505 + gasig32 * gk0605 + gafilter * gk1005) * 0.0001
asum_b1 = (gasig11 * gk0106  + gasig12 * gk0206 + gasig21 * gk0306 + gasig22 * gk0406 + gasig31 * gk0506 + gasig32 * gk0606 + gafilter * gk1006) * 0.0001

asum_a2 = (gainput1 * gk0805 + gainput2 * gk0905) * 0.0001
asum_b2 = (gainput1 * gk0806 + gainput2 * gk0906) * 0.0001

;ain_a = asum_a1
;ain_b = asum_b1 


garmod = ( asum_a1 + asum_a2) * ( asum_b1 + asum_b2) * krmlev * 10000 


endin

;--------------------------------------------------------

instr envelopeManual


igate init 0

ktrap		invalue		"trap"
kamp		invalue 	"ampsig"


ktck invalue "attack"
kdec invalue "decay"

ktrig invalue "trig"
kgate = (ktrig > 0 ? 1 : 0)




kn_tck = ktck * 230 ; MAGIC NUMBER !!
kn_dec = kdec * 230

kinc_tck = 1/kn_tck
kinc_dec = 1/kn_dec 
gi1 init 0



reset:
igate = i (kgate)
if igate < 0.5 igoto dw
gi1 = gi1 + i(kinc_tck)
igoto next
dw:
gi1 = gi1 - i(kinc_dec)
next:
gi1 limit gi1, 0, 1

timout 0, 1/sr, cont
reinit reset

cont:

outvalue "lamp", gi1

gktrapez_man = gi1
;k1 = gi1
;outvalue "disp1", k1



endin


;-------------------------------------------------------
instr envmult




ain = gk0104 * gasig11 + gk0204 * gasig12 + gk0304 * gasig21 + gk0404 * gasig22 + gk0504 * gasig31 + gk0604 * gasig32 +  gk0704 * ganoise + gk1004 * gafilter

gaenvsig_man = ain * gi1 * gksignal

endin

;------------------------- ENVELOPEK (new version)

instr envelopek

kattack	invalue		"attack"
keon		invalue		"eon"   
kdecay		invalue		"decay"
koff		invalue		"off_pulse"
ktrap		invalue		"trap"
kamp		invalue 	"ampsig"
gkenvsw invalue "envsw"

kdur = kattack + keon + kdecay + koff



ain = gk0104 * gasig11 + gk0204 * gasig12 + gk0304 * gasig21 + gk0404 * gasig22 + gk0504 * gasig31 + gk0604 * gasig32 +  gk0704 * ganoise + gk1004 * gafilter

reset:
idur = i(kdur)

timout 0, idur, cont
reinit reset 

cont:
adr linseg 0, i(kattack), 1, i(keon), 1, i(kdecay), 0, i(koff), 0 
kadr downsamp adr
gktrapez_auto = kadr
if gkenvsw == 0 then
if kadr > 0 then

outvalue "lamp", 1

else
outvalue "lamp", 0

endif 
else
endif

gaenvsig_auto = ain * adr * gksignal
endin

;--------------------------------


instr envsw
;gkenvsw invalue "envsw"

kval = (gkenvsw > 0 ? 1 : 0)
kled1 = kval
kled2 = 1 - kval

outvalue "man", kled1
outvalue "auto", kled2


gaenvsig = (gkenvsw > 0 ? gaenvsig_man : gaenvsig_auto)

gktrapezoid = (gkenvsw > 0 ? gktrapez_man : gktrapez_auto)

endin






;-------------------------------------------------------



instr rev

kwetdry invalue "wetdry"
krevlev invalue "revlev"

asum_p1 sum gk0108 * gasig11 , gk0208 * gasig12 , gk0308 * gasig21 , gk0408 * gasig22 , gk0708 * ganoise , gk1008 * gafilter ; somma parziale 1
asum_p2 sum gk1308 * garmod , gk0508 * gasig31, gk0608 * gasig31, gk1208 * gaenvsig + gk0808 * gainput1 + gk0908 * gainput2
ain sum asum_p1, asum_p2

;ain = gasig11 * gk0108

;kain downsamp ain/32767
;outvalue "monitor", kain
arev	reverb	0.2 * ain, 3

garevout = (arev * kwetdry + ain* (1-kwetdry)) * krevlev
 
endin

;-------------------------------------------------- OUTAMP 1
instr outamp1
;               oscil1sine         oscil1tri

kfilch1 invalue "filch1"
kmutech1 invalue "mutech1"
kmute_ch1 = 1 - kmutech1
gkrate	invalue "rate"
gkdel invalue  "del"
gkfdbk invalue "fdbk"
gkflsw invalue "flsw"

adel	oscili gkdel, gkrate, 1 


asum_p1 = gk0102 * gasig11 +  gk0202 * gasig12 + gk0302 * gasig21 + gk0402 * gasig22 + gk0702 * ganoise + gk1002 * gafilter ; somma parziale 1
asum_p2 = gk1302 * garmod + gk1402 * garevout + gk0502 * gasig31+ gk0602 * gasig32 + gk1202 * gaenvsig
asum_p3 = gk0802 * gainput1 + gk0902 * gainput2

gaout1  = (asum_p1 + asum_p2 + asum_p3) * gkmutesynth

krms1 rms  gaout1
outvalue "RMS1", krms1/14400

kpan_sequ = (gkseq == 1? 1-gkpan_sequ : 1)
kpan_sequ_p port kpan_sequ, 0.2

a1	= gaout1 * gkfadeout * gkfadein *kpan_sequ_p * kmute_ch1
a1 pareq a1, 100,  ampdb(kfilch1), 0.707, 1
a1 pareq a1, 10000, ampdb(kfilch1), 0.707, 2

if gkflsw == 0 kgoto noflang

a1 flanger 0.85 * a1 , 0.01 + adel, gkfdbk
noflang:


outs a1, gaout1 * 0

;outs gaout1 * gkfadeout * gkfadein *kpan_sequ_p * kmute_ch1, gaout1 * 0

endin
;-------------------------------------------------- OUTAMP 2
instr outamp2

kfilch2 invalue "filch2"
kmutech2 invalue "mutech2"
kmute_ch2 = 1 - kmutech2



adel	oscili gkdel, gkrate, 1 , 0.25
 
asum_p1  = gk0103 * gasig11 + gk0203 * gasig12 + gk0303 * gasig21 + gk0403 * gasig22 + gk0703 * ganoise + gk1003 * gafilter
asum_p2  = gk1303 * garmod + gk1403 * garevout + gk0503 * gasig31+ gk0603 * gasig32 + gk1203 * gaenvsig
asum_p3 =  gk0803 * gainput1 + gk0903 * gainput2

gaout2 = (asum_p1 + asum_p2 + asum_p3) * gkmutesynth
krms2		rms gaout2
outvalue "RMS2", krms2/14400

kpan_sequ = (gkseq == 1? gkpan_sequ : 1)
kpan_sequ_p port kpan_sequ, 0.2

a2	= gaout2 * gkfadeout * gkfadein *kpan_sequ_p * kmute_ch2
a2 pareq a2, 100,  ampdb(kfilch2), 0.707, 1
a2 pareq a2, 10000, ampdb(kfilch2), 0.707, 2


if gkflsw == 0 kgoto noflang

a2 flanger 0.85 * a2 , 0.01 + adel, gkfdbk
noflang:
outs gaout2 * 0 , a2


endin

;---------------------------------------------------- SEQUENCER TABLE COMPILER

instr seqcompile
kindex init -1




ks01 invalue "s01"				; legge slider  s01   ( pitch)
kpch tab int(ks01), 100			; accede alla tabella del pitch
tabw	kpch, kindex + 1, 101		; scrive il valore estratto nella tabella dei pitch correnti
kL01	invalue "L01"				; legge slider  L01 (livello)			
tabw	kL01, kindex + 1, 102		; scrivi il valore nella tabella dei livelli correnti
kC01	invalue "C01"				; legge slider C01 (cutoff)
tabw	kC01, kindex + 1, 103		; scrivi il valore nella tabella dei cutoff correnti
kP01	invalue "P01"				; legge slider P01 (pan)
tabw	kP01, kindex + 1, 104		; scrivi il valore nella tabella dei panning correnti			


ks02 invalue "s02"
kpch tab int(ks02), 100			
tabw	kpch, kindex + 2, 101		
kL02	invalue "L02"				
tabw	kL02, kindex + 2, 102		
kC02	invalue "C02"				
tabw	kC02, kindex + 2, 103		
kP02	invalue "P02"				
tabw	kP02, kindex + 2, 104				



ks03 invalue "s03"
kpch tab int(ks03), 100			
tabw	kpch, kindex + 3, 101	
kL03	invalue "L03"		
tabw	kL03, kindex + 3, 102	
kC03	invalue "C03"				
tabw	kC03, kindex + 3, 103		
kP03	invalue "P03"				
tabw	kP03, kindex + 3, 104


ks04 invalue "s04"
kpch tab int(ks04), 100			
tabw	kpch, kindex + 4, 101
kL04	invalue "L04"		
tabw	kL04, kindex + 4, 102
kC04	invalue "C04"				
tabw	kC04, kindex + 4, 103		
kP04	invalue "P04"				
tabw	kP04, kindex + 4, 104

ks05 invalue "s05"
kpch tab int(ks05), 100			
tabw	kpch, kindex + 5, 101
kL05	invalue "L05"		
tabw	kL05, kindex + 5, 102
kC05	invalue "C05"				
tabw	kC05, kindex + 5, 103		
kP05	invalue "P05"				
tabw	kP05, kindex + 5, 104

ks06 invalue "s06"
kpch tab int(ks06), 100			
tabw	kpch, kindex + 6, 101
kL06	invalue "L06"		
tabw	kL06, kindex + 6, 102
kC06	invalue "C06"				
tabw	kC06, kindex + 6, 103		
kP06	invalue "P06"				
tabw	kP06, kindex + 6, 104
	

ks07 invalue "s07"
kpch tab int(ks07), 100			
tabw	kpch, kindex + 7, 101
kL07	invalue "L07"		
tabw	kL07, kindex + 7, 102
kC07	invalue "C07"				
tabw	kC07, kindex + 7, 103		
kP07	invalue "P07"				
tabw	kP07, kindex + 7, 104


ks08 invalue "s08"
kpch tab int(ks08), 100			
tabw	kpch, kindex + 8, 101
kL08	invalue "L08"		
tabw	kL08, kindex + 8, 102
kC08	invalue "C08"				
tabw	kC08, kindex + 8, 103		
kP08	invalue "P08"				
tabw	kP08, kindex + 8, 104


ks09 invalue "s09"
kpch tab int(ks09), 100			
tabw	kpch, kindex + 9, 101
kL09	invalue "L09"		
tabw	kL09, kindex + 9, 102
kC09	invalue "C09"				
tabw	kC09, kindex + 9, 103		
kP09	invalue "P09"				
tabw	kP09, kindex + 9, 104

ks10 invalue "s10"
kpch tab int(ks10), 100			
tabw	kpch, kindex + 10, 101
kL10	invalue "L10"		
tabw	kL10, kindex + 10, 102
kC10	invalue "C10"				
tabw	kC10, kindex + 10, 103		
kP10	invalue "P10"				
tabw	kP10, kindex + 10, 104

ks11 invalue "s11"
kpch tab int(ks11), 100			
tabw	kpch, kindex + 11, 101
kL11	invalue "L11"		
tabw	kL11, kindex + 11, 102
kC11	invalue "C11"				
tabw	kC11, kindex + 11, 103		
kP11	invalue "P11"				
tabw	kP11, kindex + 11, 104

ks12 invalue "s12"
kpch tab int(ks12), 100			
tabw	kpch, kindex + 12, 101
kL12	invalue "L12"		
tabw	kL12, kindex + 12, 102
kC12	invalue "C12"				
tabw	kC12, kindex + 12, 103		
kP12	invalue "P12"				
tabw	kP12, kindex + 12, 104


ks13 invalue "s13"
kpch tab int(ks13), 100			
tabw	kpch, kindex + 13, 101
kL13	invalue "L13"		
tabw	kL13, kindex + 13, 102
kC13	invalue "C13"				
tabw	kC13, kindex + 13, 103		
kP13	invalue "P13"				
tabw	kP13, kindex + 13, 104

ks14 invalue "s14"
kpch tab int(ks14), 100			
tabw	kpch, kindex + 14, 101
kL14	invalue "L14"		
tabw	kL14, kindex + 14, 102
kC14	invalue "C14"				
tabw	kC14, kindex + 14, 103		
kP14	invalue "P14"				
tabw	kP14, kindex + 14, 104

ks15 invalue "s15"
kpch tab int(ks15), 100			
tabw	kpch, kindex + 15, 101
kL15	invalue "L15"		
tabw	kL15, kindex + 15, 102
kC15	invalue "C15"				
tabw	kC15, kindex + 15, 103		
kP15	invalue "P15"				
tabw	kP15, kindex + 15, 104

ks16 invalue "s16"
kpch tab int(ks16), 100			
tabw	kpch, kindex + 16, 101
kL16	invalue "L16"		
tabw	kL16, kindex + 16, 102
kC16	invalue "C16"				
tabw	kC16, kindex + 16, 103		
kP16	invalue "P16"				
tabw	kP16, kindex + 16, 104





kindex = -1


gkvel invalue "vel"
gkdir invalue "dir"

endin


;--------------------------------- Random Pitch Class Extractor  (POISSON)

instr 100						
kindex init -1
klambda invalue "lambda" 

klambda = int (klambda)



;outvalue "disp", klambda
knum1 poisson klambda
knum limit knum1, 0, 71
;outvalue "disp1", knum
;outvalue "num", knum
kpch tab knum, 100			; accede alla tabella del pitch
tabw	kpch, kindex + 1, 101	; scrive il valore estratto nella tabella dei pitch correnti
outvalue "s01", knum

knum1 poisson klambda
knum limit knum1, 0, 71
;outvalue "num", knum
kpch tab knum, 100			; accede alla tabella del pitch
tabw	kpch, kindex + 2, 101	; scrive il valore estratto nella tabella dei pitch correnti
outvalue "s02", knum

knum1 poisson klambda
knum limit knum1, 0, 71
;outvalue "num", knum
kpch tab knum, 100			; accede alla tabella del pitch
tabw	kpch, kindex + 3, 101	; scrive il valore estratto nella tabella dei pitch correnti
outvalue "s03", knum

knum1 poisson klambda
knum limit knum1, 0, 71
;outvalue "num", knum
kpch tab knum, 100			; accede alla tabella del pitch
tabw	kpch, kindex + 4, 101	; scrive il valore estratto nella tabella dei pitch correnti
outvalue "s04", knum

knum1 poisson klambda
knum limit knum1, 0, 71
;outvalue "num", knum
kpch tab knum, 100			; accede alla tabella del pitch
tabw	kpch, kindex + 5, 101	; scrive il valore estratto nella tabella dei pitch correnti
outvalue "s05", knum

knum1 poisson klambda
knum limit knum1, 0, 71
;outvalue "num", knum
kpch tab knum, 100			; accede alla tabella del pitch
tabw	kpch, kindex + 6, 101	; scrive il valore estratto nella tabella dei pitch correnti
outvalue "s06", knum

knum1 poisson klambda
knum limit knum1, 0, 71
;outvalue "num", knum
kpch tab knum, 100			; accede alla tabella del pitch
tabw	kpch, kindex + 7, 101	; scrive il valore estratto nella tabella dei pitch correnti
outvalue "s07", knum

knum1 poisson klambda
knum limit knum1, 0, 71
;outvalue "num", knum
kpch tab knum, 100			; accede alla tabella del pitch
tabw	kpch, kindex + 8, 101	; scrive il valore estratto nella tabella dei pitch correnti
outvalue "s08", knum

knum1 poisson klambda
knum limit knum1, 0, 71
;outvalue "num", knum
kpch tab knum, 100			; accede alla tabella del pitch
tabw	kpch, kindex + 9, 101	; scrive il valore estratto nella tabella dei pitch correnti
outvalue "s09", knum

knum1 poisson klambda
knum limit knum1, 0, 71
;outvalue "num", knum
kpch tab knum, 100			; accede alla tabella del pitch
tabw	kpch, kindex + 10, 101	; scrive il valore estratto nella tabella dei pitch correnti
outvalue "s10", knum

knum1 poisson klambda
knum limit knum1, 0, 71
;outvalue "num", knum
kpch tab knum, 100			; accede alla tabella del pitch
tabw	kpch, kindex + 11, 101	; scrive il valore estratto nella tabella dei pitch correnti
outvalue "s11", knum

knum1 poisson klambda
knum limit knum1, 0, 71
;outvalue "num", knum
kpch tab knum, 100			; accede alla tabella del pitch
tabw	kpch, kindex + 12, 101	; scrive il valore estratto nella tabella dei pitch correnti
outvalue "s12", knum

knum1 poisson klambda
knum limit knum1, 0, 71
;outvalue "num", knum
kpch tab knum, 100			; accede alla tabella del pitch
tabw	kpch, kindex + 13, 101	; scrive il valore estratto nella tabella dei pitch correnti
outvalue "s13", knum

knum1 poisson klambda
knum limit knum1, 0, 71
;outvalue "num", knum
kpch tab knum, 100			; accede alla tabella del pitch
tabw	kpch, kindex + 14, 101	; scrive il valore estratto nella tabella dei pitch correnti
outvalue "s14", knum

knum1 poisson klambda
knum limit knum1, 0, 71
;outvalue "num", knum
kpch tab knum, 100			; accede alla tabella del pitch
tabw	kpch, kindex + 15, 101	; scrive il valore estratto nella tabella dei pitch correnti
outvalue "s15", knum

knum1 poisson klambda
knum limit knum1, 0, 71
;outvalue "num", knum
kpch tab knum, 100			; accede alla tabella del pitch
tabw	kpch, kindex + 16, 101	; scrive il valore estratto nella tabella dei pitch correnti
outvalue "s16", knum
turnoff

endin
;------------------------------- Random Levels Class Extractor  (LINRAND) 

instr 101
kindex init -1

kavrg invalue "avrg" 




kamp linrand kavrg
tabw	kamp, kindex + 1, 102	; scrive il valore estratto nella tabella dei livelli correnti
outvalue "L01", kamp

kamp linrand kavrg
tabw	kamp, kindex + 2, 102	
outvalue "L02", kamp+kavrg

kamp  linrand kavrg
tabw	kamp, kindex + 3, 102	
outvalue "L03", kamp+kavrg

kamp	linrand kavrg
tabw	kamp, kindex + 4, 102	
outvalue "L04", kamp+kavrg

kamp	linrand kavrg
tabw	kamp+kavrg, kindex + 5, 102	
outvalue "L05", kamp+kavrg

kamp 	linrand 1
tabw	kamp, kindex + 6, 102	
outvalue "L06", kamp+kavrg

kamp 	linrand kavrg
tabw	kamp, kindex + 7, 102	
outvalue "L07", kamp+kavrg

kamp 	linrand 1
tabw	kamp+kavrg, kindex + 8, 102	
outvalue "L08", kamp+kavrg

kamp 	linrand kavrg
tabw	kamp, kindex + 9, 102	
outvalue "L09", kamp+kavrg

kamp 	linrand kavrg
tabw	kamp, kindex + 10, 102	
outvalue "L10", kamp+kavrg

kamp 	linrand kavrg
tabw	kamp, kindex + 11, 102	
outvalue "L11", kamp+kavrg

kamp 	linrand kavrg
tabw	kamp, kindex + 12, 102	
outvalue "L12", kamp+kavrg

kamp 	linrand kavrg
tabw	kamp, kindex + 13, 102	
outvalue "L13", kamp+kavrg

kamp 	linrand kavrg
tabw	kamp, kindex + 14, 102	
outvalue "L14", kamp+kavrg


kamp 	linrand kavrg
tabw	kamp, kindex + 15, 102	
outvalue "L15", kamp+kavrg

kamp 	linrand kavrg
tabw	kamp, kindex + 16, 102	
outvalue "L16", kamp+kavrg

turnoff
endin

;--------------------------------Random Levels Cutoff Extractor  (LINRAND) 

instr 102
kindex init -1

kcutref invalue "cutref" 
;printk 0.01, kcutref


kcut 	linrand 0.5
tabw	kcut + kcutref, kindex + 1, 103	; scrive il valore estratto nella tabella dei cutoff correnti
outvalue "C01", kcut+kcutref


kcut 	linrand 0.5
tabw	kcut + kcutref, kindex + 2, 103	
outvalue "C02", kcut+kcutref

kcut 	linrand 0.5
tabw	kcut + kcutref, kindex + 3, 103
outvalue "C03", kcut+kcutref

kcut 	linrand 0.5
tabw	kcut + kcutref, kindex + 4, 103	
outvalue "C04", kcut+kcutref

kcut 	linrand 0.5
tabw	kcut + kcutref, kindex + 5, 103	
outvalue "C05", kcut+kcutref

kcut 	linrand 0.5
tabw	kcut + kcutref, kindex + 6, 103	
outvalue "C06", kcut+kcutref

kcut 	linrand 0.5
tabw	kcut + kcutref, kindex + 7, 103	
outvalue "C07", kcut+kcutref

kcut 	linrand 0.5
tabw	kcut + kcutref, kindex + 8, 103	
outvalue "C08", kcut+kcutref

kcut 	linrand 0.5
tabw	kcut + kcutref, kindex + 9, 103	
outvalue "C09", kcut+kcutref

kcut 	linrand 0.5
tabw	kcut + kcutref, kindex + 10, 103	
outvalue "C10", kcut+kcutref

kcut 	linrand 0.5
tabw	kcut + kcutref, kindex + 11, 103	
outvalue "C11", kcut+kcutref

kcut 	linrand 0.5
tabw	kcut+kcutref, kindex + 12, 103	
outvalue "C12", kcut+kcutref

kcut 	linrand 0.5
tabw	kcut+kcutref, kindex + 13, 103	
outvalue "C13", kcut+kcutref

kcut 	linrand 0.5
tabw	kcut+kcutref, kindex + 14, 103	
outvalue "C14", kcut+kcutref

kcut 	linrand 0.5
tabw	kcut+kcutref, kindex + 15, 103	
outvalue "C15", kcut+kcutref

kcut 	linrand 0.5
tabw	kcut+kcutref, kindex + 16, 103	
outvalue "C16", kcut+kcutref

turnoff
endin

;----------------------------- Random Levels Pan Extractor  (LINRAND) 

instr 103
kindex init -1

kpanrange invalue "panrange" 
;printk 0.01, kcutref


kpan linrand 1
outvalue "disp2", kpan
tabw	kpan , kindex + 1, 104	; scrive il valore estratto nella tabella dei pan correnti
outvalue "P01", kpan


kpan linrand 1
tabw	kpan , kindex + 2, 104	
outvalue "P02", kpan 

kpan linrand 1
tabw	kpan , kindex + 3, 104
outvalue "P03", kpan

kpan linrand 1
tabw	kpan , kindex + 4, 104	
outvalue "P04", kpan

kpan linrand 1
tabw	kpan , kindex + 5, 104	
outvalue "P05", kpan 

kpan linrand 1
tabw	kpan , kindex + 6, 104
outvalue "P06", kpan

kpan linrand 1
tabw	kpan , kindex + 7, 104	
outvalue "P07", kpan

kpan linrand 1
tabw	kpan , kindex + 8, 104	
outvalue "P08", kpan 

kpan linrand 1
tabw	kpan , kindex + 9, 104	
outvalue "P09", kpan

kpan linrand 1
tabw	kpan , kindex + 10, 104	
outvalue "P10", kpan

kpan linrand 1
tabw	kpan , kindex + 11, 104	
outvalue "P11", kpan

kpan linrand 1
tabw	kpan , kindex + 12, 104	
outvalue "P12", kpan

kpan linrand 1
tabw	kpan , kindex + 13, 104	
outvalue "P13", kpan 

kpan linrand 1
tabw	kpan , kindex + 14, 104	
outvalue "P14", kpan 

kpan linrand 1
tabw	kpan , kindex + 15, 104	
outvalue "P15", kpan

kpan linrand 1
tabw	kpan , kindex + 16, 104
outvalue "P16", kpan

turnoff
endin





;-------------------- RESET SEQUENCER AMP LEVEL TO MAXIMUM  -----------------
instr 112
kindex init -1


tabw	1, kindex + 1, 102
outvalue "L01", 1
tabw	1, kindex + 2, 102
outvalue "L02", 1
tabw	1, kindex + 3, 102
outvalue "L03", 1
tabw	1, kindex + 4, 102
outvalue "L04", 1
tabw	1, kindex + 5, 102
outvalue "L05", 1
tabw	1, kindex + 6, 102
outvalue "L06", 1
tabw	1, kindex + 7, 102
outvalue "L07", 1
tabw	1, kindex + 8, 102
outvalue "L08", 1
tabw	1, kindex + 9, 102
outvalue "L09", 1
tabw	1, kindex + 10, 102
outvalue "L10", 1
tabw	1, kindex + 11, 102
outvalue "L11", 1
tabw	1, kindex + 12, 102
outvalue "L12", 1
tabw	1, kindex + 13, 102
outvalue "L13", 1
tabw	1, kindex + 14, 102
outvalue "L14", 1
tabw	1, kindex + 15, 102
outvalue "L15", 1
tabw	1, kindex + 16, 102
outvalue "L16", 1
turnoff
endin
;---------------------- RESET SEQUENCER  CUTOFF TO DEFAULT
instr 113
kindex init -1
tabw	0.5, kindex + 1, 103
outvalue "C01", 0.5
tabw	0.5, kindex + 2, 103
outvalue "C02", 0.5
tabw	0.5, kindex + 3, 103
outvalue "C03", 0.5
tabw	0.5, kindex + 4, 103
outvalue "C04", 0.5
tabw	0.5, kindex + 5, 103
outvalue "C05", 0.5
tabw	0.5, kindex + 6, 103
outvalue "C06", 0.5
tabw	0.5, kindex + 7, 103
outvalue "C07", 0.5
tabw	0.5, kindex + 8, 103
outvalue "C08", 0.5
tabw	0.5, kindex + 9, 103
outvalue "C09", 0.5
tabw	0.5, kindex + 10, 103
outvalue "C10", 0.5
tabw	0.5, kindex + 11, 103
outvalue "C11", 0.5
tabw	0.5, kindex + 12, 103
outvalue "C12", 0.5
tabw	0.5, kindex + 13, 103
outvalue "C13", 0.5
tabw	0.5, kindex + 14, 103
outvalue "C14", 0.5
tabw	0.5, kindex + 15, 103
outvalue "C15", 0.5
tabw	0.5, kindex + 16, 103
outvalue "C16", 0.5

turnoff
endin


;-----------------  RESET SEQUENCER  PANNING TO MID



instr 114
kindex init -1
tabw	0.5, kindex + 1, 104
outvalue "P01", 0.5
tabw	0.5, kindex + 2, 104
outvalue "P02", 0.5
tabw	0.5, kindex + 3, 104
outvalue "P03", 0.5
tabw	0.5, kindex + 4, 104
outvalue "P04", 0.5
tabw	0.5, kindex + 5, 104
outvalue "P05", 0.5
tabw	0.5, kindex + 6, 104
outvalue "P06", 0.5
tabw	0.5, kindex + 7, 104
outvalue "P07", 0.5
tabw	0.5, kindex + 8, 104
outvalue "P08", 0.5
tabw	0.5, kindex + 9, 104
outvalue "P09", 0.5
tabw	0.5, kindex + 10, 104
outvalue "P10", 0.5
tabw	0.5, kindex + 11, 104
outvalue "P11", 0.5
tabw	0.5, kindex + 12, 104
outvalue "P12", 0.5
tabw	0.5, kindex + 13, 104
outvalue "P13", 0.5
tabw	0.5, kindex + 14, 104
outvalue "P14", 0.5
tabw	0.5, kindex + 15, 104
outvalue "P15", 0.5
tabw	0.5, kindex + 16, 104
outvalue "P16", 0.5

turnoff
endin






;-------------------------------------  SEQ SCHEDULER

instr 199
gkstate_sequ = 1 - gkstate_sequ

schedule 200, 0, 86400		; ONE DAY ACTIVE
turnoff

endin




;_________________________________     SEQUENCER --------------
instr 200
;kdur init 1/16
;idur init  1/16



kdir 		init 0
index 		init i(gkindex)
iatck 		init 0.01
idec 		init 0.01
irel 		init  0.01
itime 		init 0.01

kshift 		invalue "shift"
katck 		invalue "atck"
kdec		invalue "dec"
kportsw	invalue "port"
ktime		invalue "time"	
konscale	invalue "on"	
ktranspose invalue "transpose"
knnote 	invalue "nnote"
gkincr		invalue "incr"
outvalue "ledseq", 1

if gksw9990 == 0 kgoto reset
gkincr = 1
outvalue "incr", gkincr
gksw9990 = 0


reset:

iatck = 	i(katck)
idec = 	i(kdec)
itime = 	i(ktime)
ionscale = i(konscale)
innote = int(i(knnote) - 1)
incr = i(gkincr)
outvalue "notebar", innote + 1
outvalue "dispindex", index
outvalue "led1", 0
outvalue "led2", 0
outvalue "led3", 0
outvalue "led4", 0
outvalue "led5", 0
outvalue "led6", 0
outvalue "led7", 0
outvalue "led8", 0
outvalue "led9", 0
outvalue "led10", 0
outvalue "led11", 0
outvalue "led12", 0
outvalue "led13", 0
outvalue "led14", 0
outvalue "led15", 0
outvalue "led16", 0

idur = 1/i(gkvel)/16
ion = (idur - (iatck + idec)) * ionscale

if i(gkdir) == 0 goto forward
outvalue "frwd", 0
outvalue "rvrs", 1
isign = 1
;index = index - 1
index = index - incr
index = ( int(index) < 0? innote : index)
goto select

forward:
outvalue "frwd", 1
outvalue "rvrs", 0
isign = -1
;index = index + 1
index = index + incr
;index = ( int(index) > innote ? 0 : index)
index = ( int(index) > innote? index - innote - 1 : index)
select:
if int(index) = 15 goto led16
if int(index) = 14 goto led15
if int(index) = 13 goto led14
if int(index) = 12 goto led13
if int(index) = 11 goto led12
if int(index) = 10 goto led11
if int(index) = 9 goto led10
if int(index) = 8 goto led9
if int(index) = 7 goto led8
if int(index) = 6 goto led7
if int(index) = 5 goto led6
if int(index) = 4 goto led5
if int(index) =  3 goto led4
if int(index) = 2 goto led3
if int(index) = 1 goto led2
if int(index) =  0 goto led1



goto continue
led1:
outvalue "led1", 1
goto continue
led2:
outvalue "led2", 1
goto continue
led3:
outvalue "led3", 1
goto continue
led4:
outvalue "led4", 1
goto continue
led5:
outvalue "led5", 1
goto continue
led6:
outvalue "led6", 1
goto continue
led7:
outvalue "led7", 1
goto continue
led8:
outvalue "led8", 1
goto continue
led9:
outvalue "led9", 1
goto continue
led10:
outvalue "led10", 1
goto continue
led11:
outvalue "led11", 1
goto continue
led12:
outvalue "led12", 1
goto continue
led13:
outvalue "led13", 1
goto continue
led14:
outvalue "led14", 1
goto continue
led15:
outvalue "led15", 1
goto continue
led16:
outvalue "led16", 1
goto continue

continue:

timout 0, idur, next

reinit reset

;ion = (idur - (iatck + idec)) * ionscale

next:

;outvalue "index", index

if gkstate_sequ == $TRUE then
gkindex = index + isign

;gaenv_seq transeg 0,iatck, 1 , idur -(iatck+idec), 1, idec, 0 
;gaenv_seq expsegr 0.01, iatck, 1, iatck, 0.01, 1, 1

gaenv_seq linseg 0,iatck, 1, ion, 1, idec, 0


kpitch 	tab index, 101
if ktranspose == 1 kgoto minus_oct
if ktranspose == 3 kgoto plus_oct
gkpitch_sequ = kpitch  
kgoto go

minus_oct: 
gkpitch_sequ = kpitch - 1.00
kgoto go
plus_oct:
gkpitch_sequ = kpitch + 1.00
go:


gkpitch_sequ = gkpitch_sequ + kshift
kHZ_sequ = cpspch(gkpitch_sequ)
gklevel_sequ tab index, 102
kcut tab index, 103
gkcutoff_sequ = kcut * 4000
kpan_sequ tab index, 104
gkpan_sequ = abs (kpan_sequ)

if kportsw == 0 goto noport
gkHZ_sequ port kHZ_sequ , itime, -1
goto yesport
noport:

gkHZ_sequ = kHZ_sequ
yesport:
outvalue "disppitch", gkpitch_sequ
;outvalue "disp",gklevel_sequ
else
gaenv_seq = 0
gkindex = index + isign
outvalue "ledseq", 0
turnoff
endif
endin
;------------------------- SET SEQ. STEP = 1
instr 9990

gksw9990 = 1 - gksw9990

turnoff


endin
;---------------------------------- FADEIN


instr 9997
gkfadeout = 1
outvalue "fin", 0



gkfadein transeg 0, p4, 2, 1

outvalue "fin", gkfadein

endin
;--------------------------------- FADEOUT
instr 9998

;gkfadesw = 1 - gkfadesw
outvalue "fin", 1
gkfadeout transeg 1, p4, -1, 0

outvalue "fout", gkfadeout

endin

;------------------------------  MUTE

instr 9999
gkmute = 1 - gkmute
gkmutesynth = 1 - gkmute	

;gkmutesynth transeg 1, 0.05, -1, 0


outvalue "ledmute", gkmute

turnoff


endin




</CsInstruments>
<CsScore>
f1 0 4097  10 1								;Sine wave (not used)
f2 0 8193  -7  -1 8028 1 26 0.95 112 -0.95 26 -1 						;Ramp
f3 0 4097 7 -1 2048 1 2048 -1				; Triangl
f4 0 4097 -9 .5 1 270							; Rising Sigmoid for sine shaper
f5 0 16385 7 1 8191 1 1 -1 8192 -1
f8 0 8193   -5   5      8192     16000		;Exponential curve (filter freq)
f09 0 4097 -8  0.6    410 1.7 410 4.1 410 11.6  410 32.7 410 92.5 410 261.6 410 740 410 2093 410 5920 406 10000 ; Freq table for OSC 1 / 2
f10 0 4097 -8  0.015  410 0.043 410 0.122 410 0.344 410 0.975 410 2.76 410 7.82 410 22.2 410 62.5 410 177 406 500

f99		0 4096 7 1  256  1  1  0				;Squarer

; Pitch Table ( Six octave from C0 to B5)
f100 0 128 -2  4.00 4.01 4.02 4.03 4.04 4.05 4.06 4.07 4.08 4.09 4.10 4.11 \
               5.00 5.01 5.02 5.03 5.04 5.05 5.06 5.07 5.08 5.09 5.10 5.11 \
               6.00 6.01 6.02 6.03 6.04 6.05 6.06 6.07 6.08 6.09 6.10 6.11 \
               7.00 7.01 7.02 7.03 7.04 7.05 7.06 7.07 7.08 7.09 7.10 7.11 \
               8.00 8.01 8.02 8.03 8.04 8.05 8.06 8.07 8.08 8.09 8.10 8.11 \
               9.00 9.01 9.02 9.03 9.04 9.05 9.06 9.07 9.08 9.09 9.10 9.11 


f101	0 16 -2	 0																			; CURRENT PITCH TABLE
f102	0 16 -2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1											; CURRENT AMP   TABLE
f103   0 16 -2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1											; CURRENT CUTOFF FILTER TABLE
f104   0 16 -2 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5		; CURRENT PAN  TABLE




f0 9999
i "default" 			0 1
i "input"				0 86400
i "matrix" 			0 86400
i "osc1" 				0 86400
i "osc2" 				0 86400
i "osc3" 				0 86400
i "outamp1" 			0 86400
i "outamp2" 			0 86400
i "wnoise" 			0 86400
i "woodbox" 			0 86400
i "filter" 			0 86400
i "ringmod" 			0 86400
i "joy"				0 86400
i "envelopek"  		0 86400
i "envelopeManual"	0 86400
i "envmult"			0 86400
i "envsw"				0 86400
i "rev"				0 86400
i "seqcompile" 		0 86400



</CsScore>

</CsoundSynthesizer>>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>2</x>
 <y>46</y>
 <width>1438</width>
 <height>896</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>170</r>
  <g>170</g>
  <b>170</b>
 </bgcolor>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>29</x>
  <y>146</y>
  <width>50</width>
  <height>48</height>
  <uuid>{2c669714-734a-4a71-9cf9-e8f083bb93fc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>OSC  1</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>16</fontsize>
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
  <objectName>k01-02</objectName>
  <x>197</x>
  <y>146</y>
  <width>33</width>
  <height>35</height>
  <uuid>{ef887d88-250e-4f16-9233-c4289d4968bd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k01-03</objectName>
  <x>229</x>
  <y>146</y>
  <width>33</width>
  <height>35</height>
  <uuid>{d3e8a6fb-d10d-4fd8-bee2-5351859bd131}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>true</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k01-04</objectName>
  <x>261</x>
  <y>146</y>
  <width>33</width>
  <height>35</height>
  <uuid>{8e45cf84-91e1-443a-b04e-16e94bee74de}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k01-05</objectName>
  <x>293</x>
  <y>146</y>
  <width>33</width>
  <height>35</height>
  <uuid>{8bd852b8-157c-480b-8104-e5c2cbadf23c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k01-06</objectName>
  <x>325</x>
  <y>146</y>
  <width>33</width>
  <height>35</height>
  <uuid>{13cee18a-af70-4e87-a84b-fd4e398ab1a8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k01-07</objectName>
  <x>357</x>
  <y>146</y>
  <width>33</width>
  <height>35</height>
  <uuid>{34d51c2d-49e7-4f59-b072-e4bed1dbe334}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k01-08</objectName>
  <x>389</x>
  <y>146</y>
  <width>33</width>
  <height>35</height>
  <uuid>{aa9af18d-8579-4f3a-85c4-a79421776f28}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k01-09</objectName>
  <x>421</x>
  <y>146</y>
  <width>33</width>
  <height>35</height>
  <uuid>{4110ff5c-d596-4003-adaf-c3006ba8665b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k01-10</objectName>
  <x>453</x>
  <y>146</y>
  <width>33</width>
  <height>35</height>
  <uuid>{aec38ea8-5988-4444-be67-48f1250eb458}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k01-11</objectName>
  <x>485</x>
  <y>146</y>
  <width>33</width>
  <height>35</height>
  <uuid>{bfbe134e-965f-4841-a6b3-bf121fcff9aa}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k01-12</objectName>
  <x>517</x>
  <y>146</y>
  <width>33</width>
  <height>35</height>
  <uuid>{32c18613-abc0-479f-b2be-1bbe5e8aa423}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k01-14</objectName>
  <x>581</x>
  <y>146</y>
  <width>33</width>
  <height>35</height>
  <uuid>{7bc828ba-a7fa-4c17-b2a6-b5e251100390}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k01-15</objectName>
  <x>613</x>
  <y>146</y>
  <width>33</width>
  <height>35</height>
  <uuid>{b3df773d-4c4e-48bf-a3d4-c3e59ca98057}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k02-01</objectName>
  <x>165</x>
  <y>180</y>
  <width>33</width>
  <height>35</height>
  <uuid>{431cf532-1b36-4244-ad27-2b3831daa724}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k02-02</objectName>
  <x>197</x>
  <y>180</y>
  <width>33</width>
  <height>35</height>
  <uuid>{9f1fa638-5e5f-4227-b670-971c714e4692}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>true</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k02-03</objectName>
  <x>229</x>
  <y>180</y>
  <width>33</width>
  <height>35</height>
  <uuid>{62670405-5f3a-4c76-927a-c589c0448e9b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k02-04</objectName>
  <x>261</x>
  <y>180</y>
  <width>33</width>
  <height>35</height>
  <uuid>{cb9d39a4-8fa7-4200-a47c-203336196301}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k02-05</objectName>
  <x>293</x>
  <y>180</y>
  <width>33</width>
  <height>35</height>
  <uuid>{f2b3d790-6fd5-432b-a38f-2be9231291c2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k02-06</objectName>
  <x>325</x>
  <y>180</y>
  <width>33</width>
  <height>35</height>
  <uuid>{9454e604-1160-47eb-a477-09b92df3cb40}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k02-07</objectName>
  <x>357</x>
  <y>180</y>
  <width>33</width>
  <height>35</height>
  <uuid>{96d40269-e65e-4501-8a25-58b7eab38bb0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k02-08</objectName>
  <x>389</x>
  <y>180</y>
  <width>33</width>
  <height>35</height>
  <uuid>{f189cb1c-06f5-4ecf-92fb-0b6d68fdba52}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k02-09</objectName>
  <x>421</x>
  <y>180</y>
  <width>33</width>
  <height>35</height>
  <uuid>{1476fd2b-25c4-49ac-984e-ba0ceccfd9bc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k02-10</objectName>
  <x>453</x>
  <y>180</y>
  <width>33</width>
  <height>35</height>
  <uuid>{44942a03-e405-4412-98fc-3d297ae30798}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k02-11</objectName>
  <x>485</x>
  <y>180</y>
  <width>33</width>
  <height>35</height>
  <uuid>{f821bfa3-1a46-4f84-9e66-5a29133c1533}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k01-12</objectName>
  <x>517</x>
  <y>180</y>
  <width>33</width>
  <height>35</height>
  <uuid>{d712df5c-8522-4af9-a53b-221b47354c30}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k02-13</objectName>
  <x>549</x>
  <y>180</y>
  <width>33</width>
  <height>35</height>
  <uuid>{32491cac-384a-4126-98d7-60ea3da9e5e4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k02-14</objectName>
  <x>581</x>
  <y>180</y>
  <width>33</width>
  <height>35</height>
  <uuid>{f437a54e-377b-4c1a-8963-d7b460b689fe}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k02-15</objectName>
  <x>613</x>
  <y>180</y>
  <width>33</width>
  <height>35</height>
  <uuid>{e6726df8-0348-4132-a823-fdfbb3c1bb18}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k02-16</objectName>
  <x>645</x>
  <y>180</y>
  <width>33</width>
  <height>35</height>
  <uuid>{0b6c6747-9acc-45c0-9584-6f69dd21c324}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k03-01</objectName>
  <x>165</x>
  <y>214</y>
  <width>33</width>
  <height>35</height>
  <uuid>{4ce3f673-0047-44de-8963-55ff1ff1b8d7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k03-02</objectName>
  <x>197</x>
  <y>214</y>
  <width>33</width>
  <height>35</height>
  <uuid>{5945742c-a73a-4d5d-897d-b56f57ecc04a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>true</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k03-03</objectName>
  <x>229</x>
  <y>214</y>
  <width>33</width>
  <height>35</height>
  <uuid>{b315697f-ed32-4f97-aec4-c00fe7afb00b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>true</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k03-04</objectName>
  <x>261</x>
  <y>214</y>
  <width>33</width>
  <height>35</height>
  <uuid>{6c3ff89e-b9fd-4f44-8f1b-e0d9256c7416}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k03-05</objectName>
  <x>293</x>
  <y>214</y>
  <width>33</width>
  <height>35</height>
  <uuid>{86b46121-f147-4828-8d14-b033439a8c6c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k03-06</objectName>
  <x>325</x>
  <y>214</y>
  <width>33</width>
  <height>35</height>
  <uuid>{b196b6c0-6c71-4e68-9520-45e73da0a9fc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k03-07</objectName>
  <x>357</x>
  <y>214</y>
  <width>33</width>
  <height>35</height>
  <uuid>{a6ba3a79-028e-41b0-9c2f-c27817263175}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k03-08</objectName>
  <x>389</x>
  <y>214</y>
  <width>33</width>
  <height>35</height>
  <uuid>{7ff1babf-fefd-4195-9c4b-9962b293c7f2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k04-01</objectName>
  <x>165</x>
  <y>248</y>
  <width>33</width>
  <height>35</height>
  <uuid>{4179ef5f-f3b0-403f-866f-b580214b781e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k04-02</objectName>
  <x>197</x>
  <y>248</y>
  <width>33</width>
  <height>35</height>
  <uuid>{ecb43fba-21fd-49cc-bfcc-625ccef27c97}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k04-03</objectName>
  <x>229</x>
  <y>248</y>
  <width>33</width>
  <height>35</height>
  <uuid>{8b16fbb1-9c5e-4c93-a031-b9e07e20716c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k04-04</objectName>
  <x>261</x>
  <y>248</y>
  <width>33</width>
  <height>35</height>
  <uuid>{d7d983b0-838c-4f8f-9398-e9f2596ce0a2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k04-05</objectName>
  <x>293</x>
  <y>248</y>
  <width>33</width>
  <height>35</height>
  <uuid>{b2b328d3-fb19-409b-917c-fe7ba1641978}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k04-06</objectName>
  <x>325</x>
  <y>248</y>
  <width>33</width>
  <height>35</height>
  <uuid>{6cb226a1-7909-4d02-b5d1-b387f43433e4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k04-07</objectName>
  <x>357</x>
  <y>248</y>
  <width>33</width>
  <height>35</height>
  <uuid>{cb79036e-dae4-4130-87ff-26db3298c3a3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k04-08</objectName>
  <x>389</x>
  <y>248</y>
  <width>33</width>
  <height>35</height>
  <uuid>{800cbc56-fcc8-4477-89a8-5636cef05959}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k03-09</objectName>
  <x>421</x>
  <y>214</y>
  <width>33</width>
  <height>35</height>
  <uuid>{4f5260b7-615e-4c24-8991-cedfcdb57476}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k04-09</objectName>
  <x>421</x>
  <y>248</y>
  <width>33</width>
  <height>35</height>
  <uuid>{bda22f6a-a627-443b-8ae3-a3f012587554}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k03-10</objectName>
  <x>453</x>
  <y>214</y>
  <width>33</width>
  <height>35</height>
  <uuid>{5e11bf73-3007-4e38-b208-081a18bc9e3d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k03-11</objectName>
  <x>485</x>
  <y>214</y>
  <width>33</width>
  <height>35</height>
  <uuid>{5e993f97-0071-4678-826e-5511397f5c1e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k04-10</objectName>
  <x>453</x>
  <y>248</y>
  <width>33</width>
  <height>35</height>
  <uuid>{c7343859-49cb-4ccc-848c-80fa208ae203}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k04-11</objectName>
  <x>485</x>
  <y>248</y>
  <width>33</width>
  <height>35</height>
  <uuid>{24b8177e-e9a3-440a-b14e-ee55daf362ec}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k03-12</objectName>
  <x>517</x>
  <y>214</y>
  <width>33</width>
  <height>35</height>
  <uuid>{dee272cd-0db4-40f0-850c-dc1d63687d21}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k04-12</objectName>
  <x>517</x>
  <y>248</y>
  <width>33</width>
  <height>35</height>
  <uuid>{949581cc-9931-4d11-8b37-9fc429e846a6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k03-13</objectName>
  <x>549</x>
  <y>214</y>
  <width>33</width>
  <height>35</height>
  <uuid>{f1b68d23-9818-4b0d-a067-e5acae786bda}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k03-14</objectName>
  <x>581</x>
  <y>214</y>
  <width>33</width>
  <height>35</height>
  <uuid>{53b8aea6-7d10-4a73-8083-8a3b2b69bbcf}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k04-13</objectName>
  <x>549</x>
  <y>248</y>
  <width>33</width>
  <height>35</height>
  <uuid>{be9024e2-1118-4eda-8500-ca7281132d02}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k04-14</objectName>
  <x>581</x>
  <y>248</y>
  <width>33</width>
  <height>35</height>
  <uuid>{3dd15477-f64b-454d-9aa5-53e22a106a57}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k03-15</objectName>
  <x>613</x>
  <y>214</y>
  <width>33</width>
  <height>35</height>
  <uuid>{03b4212f-efb0-42df-adcc-437e708f30db}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k04-15</objectName>
  <x>613</x>
  <y>248</y>
  <width>33</width>
  <height>35</height>
  <uuid>{ff5eedb3-b6b9-451d-b50a-61c4d675a413}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k03-16</objectName>
  <x>645</x>
  <y>214</y>
  <width>33</width>
  <height>35</height>
  <uuid>{1e979af2-bc87-417e-be78-afd1ad2eaebe}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k04-16</objectName>
  <x>645</x>
  <y>248</y>
  <width>33</width>
  <height>35</height>
  <uuid>{5a072897-ea8e-40de-aee6-9519a22ce5a4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k05-01</objectName>
  <x>165</x>
  <y>282</y>
  <width>33</width>
  <height>35</height>
  <uuid>{e5647aff-e2c5-4341-a011-bd92a0128a21}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k06-01</objectName>
  <x>165</x>
  <y>316</y>
  <width>33</width>
  <height>35</height>
  <uuid>{4c66cc57-fc17-4f72-825c-9ca19cc16e0e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k05-02</objectName>
  <x>197</x>
  <y>282</y>
  <width>33</width>
  <height>35</height>
  <uuid>{05ab55fe-a812-43fe-b6ea-1df4d276d125}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k06-02</objectName>
  <x>197</x>
  <y>316</y>
  <width>33</width>
  <height>35</height>
  <uuid>{a8771a29-4b51-456b-a5ec-b43cd423c7ab}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k05-03</objectName>
  <x>229</x>
  <y>282</y>
  <width>33</width>
  <height>35</height>
  <uuid>{c422d20d-5ea8-476d-b65f-4999a5fdfd68}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k06-03</objectName>
  <x>229</x>
  <y>316</y>
  <width>33</width>
  <height>35</height>
  <uuid>{bff670aa-ab49-4b00-bfba-727131153dca}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k07-01</objectName>
  <x>165</x>
  <y>350</y>
  <width>33</width>
  <height>35</height>
  <uuid>{a808ae3c-ac7d-4fd1-b0b8-81c31837ea3f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k01-01</objectName>
  <x>167</x>
  <y>147</y>
  <width>30</width>
  <height>33</height>
  <uuid>{325465f9-258d-4453-ad28-503ffbe66bb2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k07-03</objectName>
  <x>229</x>
  <y>350</y>
  <width>33</width>
  <height>35</height>
  <uuid>{c8849767-e2e8-44b9-81d7-47382cef84fe}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k05-04</objectName>
  <x>261</x>
  <y>282</y>
  <width>33</width>
  <height>35</height>
  <uuid>{92db005f-b93c-462a-8986-45bd988f47eb}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k05-05</objectName>
  <x>293</x>
  <y>282</y>
  <width>33</width>
  <height>35</height>
  <uuid>{a8caf74b-6c6c-41b0-a1cb-67ef484a4c09}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k06-04</objectName>
  <x>261</x>
  <y>316</y>
  <width>33</width>
  <height>35</height>
  <uuid>{ee9bc6a1-65f9-483a-a112-33674cce5612}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k06-05</objectName>
  <x>293</x>
  <y>316</y>
  <width>33</width>
  <height>35</height>
  <uuid>{f019a15c-8149-41d7-b63b-bd1582665514}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k07-04</objectName>
  <x>261</x>
  <y>350</y>
  <width>33</width>
  <height>35</height>
  <uuid>{06422325-f433-4e73-b4c3-01cb32f6595f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>293</x>
  <y>350</y>
  <width>33</width>
  <height>35</height>
  <uuid>{11157d27-dc7b-41ea-af96-4ff09f1fca78}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k05-06</objectName>
  <x>325</x>
  <y>282</y>
  <width>33</width>
  <height>35</height>
  <uuid>{b84e30f1-9a02-4126-8dd1-6866dc5fdd44}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k05-07</objectName>
  <x>357</x>
  <y>282</y>
  <width>33</width>
  <height>35</height>
  <uuid>{86e4722c-7b4b-472a-b441-0011870a2e22}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k06-06</objectName>
  <x>325</x>
  <y>316</y>
  <width>33</width>
  <height>35</height>
  <uuid>{25ca82d2-87dc-4746-b5fc-8df8d0995bca}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k06-07</objectName>
  <x>357</x>
  <y>316</y>
  <width>33</width>
  <height>35</height>
  <uuid>{0dc9ee76-f3bc-4798-864f-bab940e07405}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>325</x>
  <y>350</y>
  <width>33</width>
  <height>35</height>
  <uuid>{7d4ebc4a-7e2e-4c2e-a3e8-83740157ca77}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k07-07</objectName>
  <x>357</x>
  <y>350</y>
  <width>33</width>
  <height>35</height>
  <uuid>{d0be294c-d95e-4f69-a188-7db9091dc175}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k05-08</objectName>
  <x>389</x>
  <y>282</y>
  <width>33</width>
  <height>35</height>
  <uuid>{4e62790c-548e-40a6-9e48-3d8f119cc924}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k05-09</objectName>
  <x>421</x>
  <y>282</y>
  <width>33</width>
  <height>35</height>
  <uuid>{b86dedf2-fc0b-458a-884d-df29547c5100}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k06-08</objectName>
  <x>389</x>
  <y>316</y>
  <width>33</width>
  <height>35</height>
  <uuid>{0337e556-33c5-426d-a0b4-2c0b4908078a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k06-09</objectName>
  <x>421</x>
  <y>316</y>
  <width>33</width>
  <height>35</height>
  <uuid>{1efe1024-9abf-4485-a7bf-29f8d76cc89d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k07-08</objectName>
  <x>389</x>
  <y>350</y>
  <width>33</width>
  <height>35</height>
  <uuid>{c54519fc-ed62-484e-b80d-72dc1ca21c5d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>165</x>
  <y>384</y>
  <width>33</width>
  <height>35</height>
  <uuid>{c7fae33d-a4d5-46b0-ac1b-582547953b37}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k08-02</objectName>
  <x>198</x>
  <y>384</y>
  <width>33</width>
  <height>35</height>
  <uuid>{f9714d60-1005-43ff-9702-57c12532862d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k08-03</objectName>
  <x>229</x>
  <y>384</y>
  <width>33</width>
  <height>35</height>
  <uuid>{09a14d98-06f9-4cc9-9e8c-51f6a9ec2198}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k08-04</objectName>
  <x>261</x>
  <y>384</y>
  <width>33</width>
  <height>35</height>
  <uuid>{dc92c9d2-01d1-41d4-b187-f393bcdb7465}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k08-05</objectName>
  <x>293</x>
  <y>384</y>
  <width>33</width>
  <height>35</height>
  <uuid>{972fd17a-2e56-4ec8-ad5a-a8675946eefe}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k08-06</objectName>
  <x>325</x>
  <y>384</y>
  <width>33</width>
  <height>35</height>
  <uuid>{c1cebb0d-aba0-4ac7-adf7-279d0ddb8b12}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k08-07</objectName>
  <x>357</x>
  <y>384</y>
  <width>33</width>
  <height>35</height>
  <uuid>{0917f6fc-bef9-4584-9653-0a514822ca60}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k08-08</objectName>
  <x>389</x>
  <y>384</y>
  <width>33</width>
  <height>35</height>
  <uuid>{71c23e0e-d91e-4d08-8839-d645c6ebd1ea}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>421</x>
  <y>350</y>
  <width>33</width>
  <height>35</height>
  <uuid>{88ab03da-fee1-42fe-8f3a-9437cfdcbcb5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>421</x>
  <y>384</y>
  <width>33</width>
  <height>35</height>
  <uuid>{1098723e-f605-4725-b549-0d062e23dd56}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k05-10</objectName>
  <x>453</x>
  <y>282</y>
  <width>33</width>
  <height>35</height>
  <uuid>{4e65e4ab-5c2a-407f-b5f7-681c605a13e2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k05-11</objectName>
  <x>485</x>
  <y>282</y>
  <width>33</width>
  <height>35</height>
  <uuid>{69ea1a3f-89da-44e6-b324-9e03888bff80}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k05-12</objectName>
  <x>517</x>
  <y>282</y>
  <width>33</width>
  <height>35</height>
  <uuid>{de269de6-1f33-41cc-b71f-8da26a63886f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k06-10</objectName>
  <x>453</x>
  <y>316</y>
  <width>33</width>
  <height>35</height>
  <uuid>{8d3ca41c-adef-4a07-8ecc-57e889bc21f0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k06-11</objectName>
  <x>485</x>
  <y>316</y>
  <width>33</width>
  <height>35</height>
  <uuid>{5860150d-439f-4356-ba81-bcc681e8293e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k06-12</objectName>
  <x>517</x>
  <y>316</y>
  <width>33</width>
  <height>35</height>
  <uuid>{d6cac839-dfba-44b7-9a74-f8db1d651a5a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>453</x>
  <y>350</y>
  <width>33</width>
  <height>35</height>
  <uuid>{b855e436-78d1-43b9-a301-3d886690e527}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>485</x>
  <y>350</y>
  <width>33</width>
  <height>35</height>
  <uuid>{c147813d-b7eb-43e6-b0c3-8cbddeb9fbab}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>453</x>
  <y>384</y>
  <width>33</width>
  <height>35</height>
  <uuid>{bd5725d6-78f0-4647-8c43-3793acfeea4d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>485</x>
  <y>384</y>
  <width>33</width>
  <height>35</height>
  <uuid>{e65aad2c-eb65-4ef4-bfb7-2854093a0cb9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>517</x>
  <y>350</y>
  <width>33</width>
  <height>35</height>
  <uuid>{45125aa2-1a19-4578-a601-793a1464dd18}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>517</x>
  <y>384</y>
  <width>33</width>
  <height>35</height>
  <uuid>{c4d36214-a3e9-49bc-b1c9-f25bed67147c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k05-13</objectName>
  <x>549</x>
  <y>282</y>
  <width>33</width>
  <height>35</height>
  <uuid>{004ca820-499d-45ff-a505-e5a6b1abfb17}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k05-14</objectName>
  <x>581</x>
  <y>282</y>
  <width>33</width>
  <height>35</height>
  <uuid>{9c0777f8-a2ca-4c92-8614-183e0e150e14}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k06-13</objectName>
  <x>549</x>
  <y>316</y>
  <width>33</width>
  <height>35</height>
  <uuid>{dfe2ead7-4ea1-48e7-ac18-6d71d37a3ce3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k06-14</objectName>
  <x>581</x>
  <y>316</y>
  <width>33</width>
  <height>35</height>
  <uuid>{2a2b585e-5ede-401d-8cc7-d53eb4351171}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>549</x>
  <y>350</y>
  <width>33</width>
  <height>35</height>
  <uuid>{4bbd7073-f6c6-4ae3-8e0a-f600d63345a7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>581</x>
  <y>350</y>
  <width>33</width>
  <height>35</height>
  <uuid>{b063e556-c78f-4074-8708-48495d3b13c4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>549</x>
  <y>384</y>
  <width>33</width>
  <height>35</height>
  <uuid>{bfe82354-aeb8-4f36-9e72-f5e51315ccc4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>581</x>
  <y>384</y>
  <width>33</width>
  <height>35</height>
  <uuid>{9828732b-bf7a-4b3b-838b-18d39858b28f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k05-15</objectName>
  <x>613</x>
  <y>282</y>
  <width>33</width>
  <height>35</height>
  <uuid>{78fa4539-ff9c-4669-9469-ce33746c1f42}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k06-15</objectName>
  <x>613</x>
  <y>316</y>
  <width>33</width>
  <height>35</height>
  <uuid>{d110184d-1357-4d51-aaa2-80fe097add42}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>613</x>
  <y>350</y>
  <width>33</width>
  <height>35</height>
  <uuid>{cc91ab91-d12a-4476-be3b-9a1f9243af90}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>613</x>
  <y>384</y>
  <width>33</width>
  <height>35</height>
  <uuid>{6e81d74a-b84d-4f8c-b26c-32276abcae96}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k05-16</objectName>
  <x>645</x>
  <y>282</y>
  <width>33</width>
  <height>35</height>
  <uuid>{45a75176-e013-4b09-acdf-ff07cc816bb6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k06-16</objectName>
  <x>645</x>
  <y>316</y>
  <width>33</width>
  <height>35</height>
  <uuid>{a828acd0-e2ac-45aa-af29-faa25d24b824}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>645</x>
  <y>350</y>
  <width>33</width>
  <height>35</height>
  <uuid>{2340f136-da35-4f1b-8868-35a076cada4c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>645</x>
  <y>384</y>
  <width>33</width>
  <height>35</height>
  <uuid>{5ce3f8a2-4388-4f4d-b9b8-87f9fe868cec}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>165</x>
  <y>418</y>
  <width>33</width>
  <height>35</height>
  <uuid>{4db3018f-8ff5-4b5c-9824-d1251f135b4b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k09-02</objectName>
  <x>197</x>
  <y>418</y>
  <width>33</width>
  <height>35</height>
  <uuid>{2023c3e0-e5b7-495e-af37-becdc52132ac}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k09-03</objectName>
  <x>229</x>
  <y>418</y>
  <width>33</width>
  <height>35</height>
  <uuid>{9a56002d-c7a7-42b8-80ca-f5885f56e31e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>165</x>
  <y>452</y>
  <width>33</width>
  <height>35</height>
  <uuid>{c4450fab-0bdf-4756-bea1-ea0183b47b58}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k10-02</objectName>
  <x>197</x>
  <y>452</y>
  <width>33</width>
  <height>35</height>
  <uuid>{7cd9e657-293e-4364-ab5e-8ff369bfb319}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k10-03</objectName>
  <x>229</x>
  <y>452</y>
  <width>33</width>
  <height>35</height>
  <uuid>{5b6de6d2-41e1-403d-bf2d-d66b775103e7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k09-04</objectName>
  <x>261</x>
  <y>418</y>
  <width>33</width>
  <height>35</height>
  <uuid>{5ea13e16-8ba8-44fa-9545-b62c4c971224}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k10-04</objectName>
  <x>261</x>
  <y>452</y>
  <width>33</width>
  <height>35</height>
  <uuid>{fc9f8f26-8864-497f-a31b-e3fb308b0b57}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k09-05</objectName>
  <x>293</x>
  <y>418</y>
  <width>33</width>
  <height>35</height>
  <uuid>{77997f7d-9ab2-4026-b4db-a6f108a30ba6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k09-06</objectName>
  <x>325</x>
  <y>418</y>
  <width>33</width>
  <height>35</height>
  <uuid>{23c4586e-9feb-4059-8cbe-81244295925a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k09-07</objectName>
  <x>357</x>
  <y>418</y>
  <width>33</width>
  <height>35</height>
  <uuid>{89a4ac4d-a883-485a-a036-2a3e81c7fd52}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k10-05</objectName>
  <x>293</x>
  <y>452</y>
  <width>33</width>
  <height>35</height>
  <uuid>{2cecbce0-1ba5-4bbf-a2de-df987ddec4dc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k10-06</objectName>
  <x>325</x>
  <y>452</y>
  <width>33</width>
  <height>35</height>
  <uuid>{3e1c6380-9350-4ae7-a3b1-3a74c8729def}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>357</x>
  <y>452</y>
  <width>33</width>
  <height>35</height>
  <uuid>{5e6cc2fa-819f-4398-b873-616a0c426d4a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>165</x>
  <y>486</y>
  <width>33</width>
  <height>35</height>
  <uuid>{771ca248-d5ba-4ed0-a558-746e673f094a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k11-02</objectName>
  <x>197</x>
  <y>486</y>
  <width>33</width>
  <height>35</height>
  <uuid>{76134609-6cc8-4c63-a2c9-5aae2e6b3f02}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>229</x>
  <y>486</y>
  <width>33</width>
  <height>35</height>
  <uuid>{a4b8d517-71a9-4531-832f-b385ea4e2d2c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>261</x>
  <y>486</y>
  <width>33</width>
  <height>35</height>
  <uuid>{6a78b1a7-fea8-42e8-9d5b-85e2cf617745}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>293</x>
  <y>486</y>
  <width>33</width>
  <height>35</height>
  <uuid>{ec57af53-c5f6-4faa-8374-42e5a615843d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>325</x>
  <y>486</y>
  <width>33</width>
  <height>35</height>
  <uuid>{93a38af2-17b1-41f1-94c3-4a62b3947c83}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>357</x>
  <y>486</y>
  <width>33</width>
  <height>35</height>
  <uuid>{ddac0346-faf8-4ebb-8574-6bb7f0cc7eb8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k09-08</objectName>
  <x>389</x>
  <y>418</y>
  <width>33</width>
  <height>35</height>
  <uuid>{1dc2b1fc-bcdf-4882-8a27-db4dc4f783fc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>421</x>
  <y>418</y>
  <width>33</width>
  <height>35</height>
  <uuid>{3c9ae6c6-2120-4a3e-b827-3df9b9e5fcd8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>453</x>
  <y>418</y>
  <width>33</width>
  <height>35</height>
  <uuid>{bca72597-bf36-467c-9104-d396d8310860}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>485</x>
  <y>418</y>
  <width>33</width>
  <height>35</height>
  <uuid>{661e9a42-52fb-4ffa-8b59-bc17c49326bf}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k10-08</objectName>
  <x>389</x>
  <y>452</y>
  <width>33</width>
  <height>35</height>
  <uuid>{670734cb-aa3a-4482-8b6d-87c50d4646d6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>421</x>
  <y>452</y>
  <width>33</width>
  <height>35</height>
  <uuid>{13731543-9aea-43ca-80a9-fc6de748dec2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>453</x>
  <y>452</y>
  <width>33</width>
  <height>35</height>
  <uuid>{daeccbf6-8dc9-4d8b-be06-c611ecdd5d84}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>485</x>
  <y>452</y>
  <width>33</width>
  <height>35</height>
  <uuid>{8087e837-63e6-49f1-a51f-50387ef9634a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>389</x>
  <y>486</y>
  <width>33</width>
  <height>35</height>
  <uuid>{f16bc839-6aa9-4162-9c0c-da995e3150e5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>165</x>
  <y>520</y>
  <width>33</width>
  <height>35</height>
  <uuid>{a2f838d0-fad0-487b-b07c-07cbbfcd46b2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k12-02</objectName>
  <x>197</x>
  <y>520</y>
  <width>33</width>
  <height>35</height>
  <uuid>{a0aa1bac-a34c-4047-99d5-ed00035faf83}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k12-03</objectName>
  <x>229</x>
  <y>520</y>
  <width>33</width>
  <height>35</height>
  <uuid>{0d537fe4-9b35-461e-b3fe-388b36047f0a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>261</x>
  <y>520</y>
  <width>33</width>
  <height>35</height>
  <uuid>{3113d229-4126-4734-a899-31bdfd811af9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>293</x>
  <y>520</y>
  <width>33</width>
  <height>35</height>
  <uuid>{9ead8388-77d4-4a44-bf44-b6b1f8e5c460}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>325</x>
  <y>520</y>
  <width>33</width>
  <height>35</height>
  <uuid>{7690d310-5153-405c-9602-03b3e6f1d5ea}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k12-07</objectName>
  <x>357</x>
  <y>520</y>
  <width>33</width>
  <height>35</height>
  <uuid>{1cdd8b14-9fa8-4a99-aac4-d6cf4084b99b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k12-08</objectName>
  <x>389</x>
  <y>520</y>
  <width>33</width>
  <height>35</height>
  <uuid>{e7212c93-3dfa-4639-8310-179d67b4f320}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k11-09</objectName>
  <x>421</x>
  <y>486</y>
  <width>33</width>
  <height>35</height>
  <uuid>{f2b27a31-a698-4830-a63c-305e34ee1d52}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>421</x>
  <y>520</y>
  <width>33</width>
  <height>35</height>
  <uuid>{6d1785c6-31cb-41f6-9a06-3e7f5761c084}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k11-10</objectName>
  <x>453</x>
  <y>486</y>
  <width>33</width>
  <height>35</height>
  <uuid>{ae2c318f-210c-46ca-a4d9-ab5ffdc6cf66}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k11-11</objectName>
  <x>485</x>
  <y>486</y>
  <width>33</width>
  <height>35</height>
  <uuid>{ccae9202-32fd-41d9-9fd6-13adbba3cf3b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>453</x>
  <y>520</y>
  <width>33</width>
  <height>35</height>
  <uuid>{0eed999e-6e75-42fd-999a-500c8abd9a3a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>485</x>
  <y>520</y>
  <width>33</width>
  <height>35</height>
  <uuid>{1a0cd9f8-057f-4ddd-aef4-a4dbe684e61d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>165</x>
  <y>554</y>
  <width>33</width>
  <height>35</height>
  <uuid>{e8047af1-683d-40e2-9b41-1fd52e0ffc2b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k13-02</objectName>
  <x>197</x>
  <y>554</y>
  <width>33</width>
  <height>35</height>
  <uuid>{7c4657d2-7555-4a57-9c4d-5908925c61e5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k13-03</objectName>
  <x>229</x>
  <y>554</y>
  <width>33</width>
  <height>35</height>
  <uuid>{2dd25bf4-05a2-47dc-93fb-e8b1ee7969fe}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k13-04</objectName>
  <x>261</x>
  <y>554</y>
  <width>33</width>
  <height>35</height>
  <uuid>{e735bcbd-2d8c-4f72-af82-bfb286f930f4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>293</x>
  <y>554</y>
  <width>33</width>
  <height>35</height>
  <uuid>{bcbc0467-ab5a-4941-98b2-13886c25e7c9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>325</x>
  <y>554</y>
  <width>33</width>
  <height>35</height>
  <uuid>{e23dce55-3fe6-43ca-a4a3-e95f37409929}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k13-07</objectName>
  <x>357</x>
  <y>554</y>
  <width>33</width>
  <height>35</height>
  <uuid>{b916aa49-add3-401a-9299-6a7f18909f38}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k13-08</objectName>
  <x>389</x>
  <y>554</y>
  <width>33</width>
  <height>35</height>
  <uuid>{2e043546-a3d7-42a7-98ce-aa141310fdf9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>421</x>
  <y>554</y>
  <width>33</width>
  <height>35</height>
  <uuid>{3d000910-b430-4f92-a955-a20ff4169e83}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>453</x>
  <y>554</y>
  <width>33</width>
  <height>35</height>
  <uuid>{c79fc9c0-c216-42f8-a00d-f4eaf1777428}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>485</x>
  <y>554</y>
  <width>33</width>
  <height>35</height>
  <uuid>{7e0ab21d-22cd-427a-adbc-56443bb53592}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>517</x>
  <y>418</y>
  <width>33</width>
  <height>35</height>
  <uuid>{eec3efd9-d06a-4cbf-911b-40ac036a183b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>549</x>
  <y>418</y>
  <width>33</width>
  <height>35</height>
  <uuid>{830d84ea-1647-4417-ae62-23ff6e650697}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>581</x>
  <y>418</y>
  <width>33</width>
  <height>35</height>
  <uuid>{20649c05-da38-46fc-b94a-8d53afac6580}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>613</x>
  <y>418</y>
  <width>33</width>
  <height>35</height>
  <uuid>{542247e2-cc20-40f4-a308-57668e3165e1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>517</x>
  <y>452</y>
  <width>33</width>
  <height>35</height>
  <uuid>{e7cdf664-4f73-4387-9963-3d50df8391c1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>549</x>
  <y>452</y>
  <width>33</width>
  <height>35</height>
  <uuid>{46c9401e-1cc9-47b9-87ab-e414822e4b6a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>581</x>
  <y>452</y>
  <width>33</width>
  <height>35</height>
  <uuid>{eb0ab972-60e5-4c2e-b5a1-06dc67ea9978}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>613</x>
  <y>452</y>
  <width>33</width>
  <height>35</height>
  <uuid>{da946a25-c164-4c6e-8dc7-92774bd3d651}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>517</x>
  <y>486</y>
  <width>33</width>
  <height>35</height>
  <uuid>{08856eb6-0eb5-4576-9c68-b917728fe00a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>517</x>
  <y>520</y>
  <width>33</width>
  <height>35</height>
  <uuid>{dff83c96-d630-4a90-b300-27a1ef66bf32}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>549</x>
  <y>486</y>
  <width>33</width>
  <height>35</height>
  <uuid>{735f70f9-8005-431f-9264-2bd8c18e0822}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k11-14</objectName>
  <x>581</x>
  <y>486</y>
  <width>33</width>
  <height>35</height>
  <uuid>{acde6525-4f2c-4a9c-81fa-57e6c60dcd0d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>549</x>
  <y>520</y>
  <width>33</width>
  <height>35</height>
  <uuid>{e98e4be3-572e-4a17-8bf9-5607991dd696}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>581</x>
  <y>520</y>
  <width>33</width>
  <height>35</height>
  <uuid>{4ef165fc-19d3-4881-8279-3d85e3cde66b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>613</x>
  <y>486</y>
  <width>33</width>
  <height>35</height>
  <uuid>{545cbb2d-a4ac-4d75-9589-dfe7037fc8ff}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>613</x>
  <y>520</y>
  <width>33</width>
  <height>35</height>
  <uuid>{114e95ab-8ae8-4109-b142-3f728b998cb7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>165</x>
  <y>588</y>
  <width>33</width>
  <height>35</height>
  <uuid>{c165a945-864a-4280-936e-96da17afa925}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k14-02</objectName>
  <x>197</x>
  <y>588</y>
  <width>33</width>
  <height>35</height>
  <uuid>{bb1d6273-c6f3-4c1f-81c0-891e6d8d3ec7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k14-03</objectName>
  <x>229</x>
  <y>588</y>
  <width>33</width>
  <height>35</height>
  <uuid>{d2622f83-fc5b-40eb-8487-540f2a97f15c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>165</x>
  <y>622</y>
  <width>33</width>
  <height>35</height>
  <uuid>{00d292be-8b19-4f4f-96c1-a972ab93d9f9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>197</x>
  <y>622</y>
  <width>33</width>
  <height>35</height>
  <uuid>{9e0dc7be-5c7f-41b4-b919-cef3f4d7fbf8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>229</x>
  <y>622</y>
  <width>33</width>
  <height>35</height>
  <uuid>{3d3cf995-6122-435a-aef8-8c6b00648ebc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k14-04</objectName>
  <x>261</x>
  <y>588</y>
  <width>33</width>
  <height>35</height>
  <uuid>{6e0c830b-1b7c-4fe6-8a80-a64894ba860a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>293</x>
  <y>588</y>
  <width>33</width>
  <height>35</height>
  <uuid>{d8ae27c6-6c31-4e2c-b504-0edca12a83c5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>261</x>
  <y>622</y>
  <width>33</width>
  <height>35</height>
  <uuid>{a9363a50-1588-46da-b03f-eb2cfeecd006}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>293</x>
  <y>622</y>
  <width>33</width>
  <height>35</height>
  <uuid>{122ddc6d-cea0-4555-a436-f3fbf8ff6ff5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>325</x>
  <y>588</y>
  <width>33</width>
  <height>35</height>
  <uuid>{c195904f-be0e-44f1-8200-7d620232b71a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>357</x>
  <y>588</y>
  <width>33</width>
  <height>35</height>
  <uuid>{274cd62e-c327-4851-8cbd-92e34c88be8e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>325</x>
  <y>622</y>
  <width>33</width>
  <height>35</height>
  <uuid>{bb13a1d2-dd88-45b2-8045-25770629b893}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>357</x>
  <y>622</y>
  <width>33</width>
  <height>35</height>
  <uuid>{aebf53f1-a1de-45fb-8130-2bc4b998e82a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>389</x>
  <y>588</y>
  <width>33</width>
  <height>35</height>
  <uuid>{05bb9d75-20fe-4046-ae75-95983fdb116c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>421</x>
  <y>588</y>
  <width>33</width>
  <height>35</height>
  <uuid>{291bee29-26b7-4019-8f4d-f5db6a24a964}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>389</x>
  <y>622</y>
  <width>33</width>
  <height>35</height>
  <uuid>{df6af031-6e66-4344-8dab-b82c676f4181}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k15-09</objectName>
  <x>421</x>
  <y>622</y>
  <width>33</width>
  <height>35</height>
  <uuid>{b2119f47-af82-41b1-a21d-75525b45c816}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>517</x>
  <y>554</y>
  <width>33</width>
  <height>35</height>
  <uuid>{295fe3fe-15f9-4f49-9466-d974c58467de}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>453</x>
  <y>588</y>
  <width>33</width>
  <height>35</height>
  <uuid>{8c3b1fb6-00a8-4c1e-b756-1dc5a76d5b24}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>485</x>
  <y>588</y>
  <width>33</width>
  <height>35</height>
  <uuid>{6f3346f9-efac-4dea-b2cd-8542d1249bb2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>517</x>
  <y>588</y>
  <width>33</width>
  <height>35</height>
  <uuid>{a8381ca2-0de4-484e-9be1-8a1b8344a2c5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k15-10</objectName>
  <x>453</x>
  <y>622</y>
  <width>33</width>
  <height>35</height>
  <uuid>{11891697-e18e-4e7c-bec4-0c7d44e6cb6d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k15-11</objectName>
  <x>485</x>
  <y>622</y>
  <width>33</width>
  <height>35</height>
  <uuid>{a7950d61-b435-472c-9e7b-7a4b413b82c3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>517</x>
  <y>622</y>
  <width>33</width>
  <height>35</height>
  <uuid>{5cb29f1a-4382-4cf3-9711-86190c7fb515}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>549</x>
  <y>554</y>
  <width>33</width>
  <height>35</height>
  <uuid>{990b7b70-ef43-48be-91e2-7b1b72f9e227}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>581</x>
  <y>554</y>
  <width>33</width>
  <height>35</height>
  <uuid>{8949abf8-575a-487c-9edc-2915769b49a3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>549</x>
  <y>588</y>
  <width>33</width>
  <height>35</height>
  <uuid>{85dee00a-31a3-40b1-aeb7-b38018767920}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>581</x>
  <y>588</y>
  <width>33</width>
  <height>35</height>
  <uuid>{be2c3b52-905b-4023-96f0-a77e6be2135f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>549</x>
  <y>622</y>
  <width>33</width>
  <height>35</height>
  <uuid>{f4c726c1-69c6-4191-8b9b-073cd1ef3a8a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>613</x>
  <y>554</y>
  <width>33</width>
  <height>35</height>
  <uuid>{16746593-dc46-48c7-a045-40493b37876a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>613</x>
  <y>588</y>
  <width>33</width>
  <height>35</height>
  <uuid>{fa9c62e4-bc5e-4022-9da3-f75ee21e90e0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>613</x>
  <y>622</y>
  <width>33</width>
  <height>35</height>
  <uuid>{df785b84-a419-413e-8eef-cede0c480119}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>645</x>
  <y>418</y>
  <width>33</width>
  <height>35</height>
  <uuid>{bcfbd31e-a185-43a8-a112-8fa4999e294c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>645</x>
  <y>452</y>
  <width>33</width>
  <height>35</height>
  <uuid>{c0ef7d09-d4ae-4d29-a2c1-bcb3a2005dc8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>645</x>
  <y>486</y>
  <width>33</width>
  <height>35</height>
  <uuid>{e418f539-06bb-4473-9f89-e43a7ab72c4b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>645</x>
  <y>520</y>
  <width>33</width>
  <height>35</height>
  <uuid>{e360b2dd-e11f-440d-9124-20ea68ba7b68}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>165</x>
  <y>656</y>
  <width>33</width>
  <height>35</height>
  <uuid>{60fea29e-4d8a-477e-97c7-ce20947c29ac}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>197</x>
  <y>656</y>
  <width>33</width>
  <height>35</height>
  <uuid>{11c3f7e3-fe2f-40b1-b31a-13d6f50fe56c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>229</x>
  <y>656</y>
  <width>33</width>
  <height>35</height>
  <uuid>{e0e72886-5a65-4d14-aa44-e5c7af7ee5e9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>261</x>
  <y>656</y>
  <width>33</width>
  <height>35</height>
  <uuid>{fb0a8989-cfc3-4557-9d91-94442f5b76a4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>293</x>
  <y>656</y>
  <width>33</width>
  <height>35</height>
  <uuid>{e7787a9a-0c89-4274-963f-97d07cca3bd6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>325</x>
  <y>656</y>
  <width>33</width>
  <height>35</height>
  <uuid>{faddcbf5-d0dc-4888-ac6c-7ccee5fc5da0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>357</x>
  <y>656</y>
  <width>33</width>
  <height>35</height>
  <uuid>{86b17e95-efe9-417e-b385-e81c03d446cb}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>389</x>
  <y>656</y>
  <width>33</width>
  <height>35</height>
  <uuid>{5b5e4349-5187-4174-9331-b3ea32a3d77f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k16-09</objectName>
  <x>421</x>
  <y>656</y>
  <width>33</width>
  <height>35</height>
  <uuid>{2cbb9f0b-e3d7-489f-a549-eaf110065e6d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k16-10</objectName>
  <x>453</x>
  <y>656</y>
  <width>33</width>
  <height>35</height>
  <uuid>{eea1c170-789f-4160-91f9-cea644eb8c0a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k16-11</objectName>
  <x>485</x>
  <y>656</y>
  <width>33</width>
  <height>35</height>
  <uuid>{f10baf94-5704-4deb-b14f-c3e7dcfc5c0f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>517</x>
  <y>656</y>
  <width>33</width>
  <height>35</height>
  <uuid>{14403463-15cd-4416-967d-2e1ab5895990}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>549</x>
  <y>656</y>
  <width>33</width>
  <height>35</height>
  <uuid>{0b542a95-dc80-4148-85ff-fedfd1f49438}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>581</x>
  <y>656</y>
  <width>33</width>
  <height>35</height>
  <uuid>{a9411e9b-d639-4e20-85ab-25c7498c711d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>613</x>
  <y>656</y>
  <width>33</width>
  <height>35</height>
  <uuid>{eb2541bb-dc36-4c29-953b-eaf8bc1d9aa3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>645</x>
  <y>554</y>
  <width>33</width>
  <height>35</height>
  <uuid>{5a260b2a-aa08-4ec9-8319-f2ff3c04f631}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>645</x>
  <y>588</y>
  <width>33</width>
  <height>35</height>
  <uuid>{8609ce20-153c-4b8f-b3b6-590b5e9affbd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>645</x>
  <y>622</y>
  <width>33</width>
  <height>35</height>
  <uuid>{651dc908-4c33-4295-a8ff-95d42dae68af}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName/>
  <x>645</x>
  <y>656</y>
  <width>33</width>
  <height>35</height>
  <uuid>{257e72ce-29b0-4e95-af9f-2ad3eec57e6f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>44</x>
  <y>101</y>
  <width>96</width>
  <height>48</height>
  <uuid>{05c82933-3678-4b0e-85d6-00056f65f366}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>MUTE</text>
  <image>/</image>
  <eventLine>i9999 0 1</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>677</x>
  <y>146</y>
  <width>29</width>
  <height>35</height>
  <uuid>{f6b9395e-514a-46a2-950c-68e79588250b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>1</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>677</x>
  <y>181</y>
  <width>29</width>
  <height>35</height>
  <uuid>{abfa23cc-e7f5-4d7f-ae17-830f3616cbf3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>2</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>677</x>
  <y>215</y>
  <width>29</width>
  <height>35</height>
  <uuid>{ba940311-afd0-4608-bf59-e8e416d35494}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>3</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>677</x>
  <y>249</y>
  <width>29</width>
  <height>35</height>
  <uuid>{9209c8d7-570c-450a-8f6e-9b9a136740b4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>4</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>677</x>
  <y>282</y>
  <width>29</width>
  <height>35</height>
  <uuid>{85dc1213-513d-4bfb-98e7-e1dbdccf47ff}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>5</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>677</x>
  <y>316</y>
  <width>29</width>
  <height>35</height>
  <uuid>{5a9563c8-36a9-46be-b057-104dc26c717a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>6</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>677</x>
  <y>350</y>
  <width>29</width>
  <height>35</height>
  <uuid>{4bcc2b08-5840-42a7-942e-2605c2ac6a43}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>7</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>677</x>
  <y>384</y>
  <width>29</width>
  <height>35</height>
  <uuid>{b00beda5-9c3c-4735-b63d-774f1e709788}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>8</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>677</x>
  <y>418</y>
  <width>29</width>
  <height>35</height>
  <uuid>{a380346a-f6c3-4c71-b997-86c57983c3c6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>9</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>677</x>
  <y>452</y>
  <width>29</width>
  <height>35</height>
  <uuid>{0c2355a2-a5d7-4885-9617-4360e2a6a068}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>10</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>677</x>
  <y>486</y>
  <width>29</width>
  <height>35</height>
  <uuid>{cbd9daa4-fcbf-4d2d-86f3-bfc28b59e0f3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>11</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>677</x>
  <y>520</y>
  <width>29</width>
  <height>35</height>
  <uuid>{d6fca4c9-6aef-48d2-973c-22713cf80459}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>12</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>677</x>
  <y>554</y>
  <width>29</width>
  <height>35</height>
  <uuid>{73d79d4e-6500-4487-ad72-3caec6340a75}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>13</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>677</x>
  <y>588</y>
  <width>29</width>
  <height>35</height>
  <uuid>{b01cbda2-6485-4fae-8d5f-4b57b43d56e5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>14</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>677</x>
  <y>622</y>
  <width>29</width>
  <height>35</height>
  <uuid>{e32188ba-523b-4639-a678-b86ef18f2184}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>15</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>677</x>
  <y>656</y>
  <width>29</width>
  <height>35</height>
  <uuid>{c4ad0cfc-cc87-416f-a01a-9c270f6014b9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>16</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>197</x>
  <y>690</y>
  <width>33</width>
  <height>35</height>
  <uuid>{309662da-77e8-4d8c-9a74-5213d1f7137c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>B</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>229</x>
  <y>690</y>
  <width>33</width>
  <height>35</height>
  <uuid>{f09adecf-822c-4e87-98e7-9967aace864a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>C</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>261</x>
  <y>690</y>
  <width>33</width>
  <height>35</height>
  <uuid>{71ccf9a6-440a-47f8-8ce8-2cfcbfccbc27}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>D</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>293</x>
  <y>690</y>
  <width>33</width>
  <height>35</height>
  <uuid>{d29831b0-e8ed-4405-a057-27efd3126839}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>E</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>325</x>
  <y>690</y>
  <width>33</width>
  <height>35</height>
  <uuid>{a4a4edbb-33b8-4c6c-bcc6-aced759d11f5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>F</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>357</x>
  <y>690</y>
  <width>33</width>
  <height>35</height>
  <uuid>{5db7298c-c5ca-49af-a672-c47fcd4c3d8f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>G</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>389</x>
  <y>690</y>
  <width>33</width>
  <height>35</height>
  <uuid>{ffd6f918-5770-498c-80bc-474a2eef44a8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>H</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>421</x>
  <y>690</y>
  <width>33</width>
  <height>35</height>
  <uuid>{fedbba16-5e49-4aa1-b55d-e276bbb80ad4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>I</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>453</x>
  <y>690</y>
  <width>33</width>
  <height>35</height>
  <uuid>{98dd7435-6319-44af-bee9-7613701d6c01}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>J</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>485</x>
  <y>690</y>
  <width>33</width>
  <height>35</height>
  <uuid>{07ac8c00-fccf-4aed-9ee3-1d1eb11c6e45}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>K</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>517</x>
  <y>690</y>
  <width>33</width>
  <height>35</height>
  <uuid>{bdb5689c-deeb-43a9-ad7a-5979ead359ad}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>L</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>549</x>
  <y>690</y>
  <width>33</width>
  <height>35</height>
  <uuid>{22433384-cb51-4fae-b265-ef681ecd4bb5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>M</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>581</x>
  <y>690</y>
  <width>33</width>
  <height>35</height>
  <uuid>{8aff3cac-222c-47d7-90bf-8b2543359c3a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>N</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>613</x>
  <y>690</y>
  <width>33</width>
  <height>35</height>
  <uuid>{9ff960a6-5b47-4cc4-9d24-accd960c3071}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>O</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>645</x>
  <y>690</y>
  <width>33</width>
  <height>35</height>
  <uuid>{cd149c88-59cb-40b6-b6ea-370d6240c877}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>P</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
  <x>165</x>
  <y>690</y>
  <width>33</width>
  <height>35</height>
  <uuid>{a875a749-c2db-4a88-a3e2-a5fd169e8383}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>A</label>
  <alignment>center</alignment>
  <font>Verdana</font>
  <fontsize>16</fontsize>
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
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>158</x>
  <y>20</y>
  <width>13</width>
  <height>710</height>
  <uuid>{6660c3e6-ec2c-4346-9ef9-9e09162edf4f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.73639000</xValue>
  <yValue>0.00000000</yValue>
  <type>point</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>471</x>
  <y>11</y>
  <width>100</width>
  <height>24</height>
  <uuid>{cb292df8-54b5-403c-89bb-0b457b7ee2e6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>CONTROL INPUTS</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
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
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>191</x>
  <y>49</y>
  <width>13</width>
  <height>103</height>
  <uuid>{23a6f45c-5d18-40c2-af4c-a6c932122a17}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.26373600</xValue>
  <yValue>0.00000000</yValue>
  <type>point</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>160</x>
  <y>140</y>
  <width>552</width>
  <height>13</height>
  <uuid>{0886790d-9e8b-4d16-9612-dba1713bf719}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.98141300</yValue>
  <type>point</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>255</x>
  <y>49</y>
  <width>13</width>
  <height>103</height>
  <uuid>{492efc9d-e7b9-45bb-bb74-08efe185e403}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.26373600</xValue>
  <yValue>0.00000000</yValue>
  <type>point</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>287</x>
  <y>50</y>
  <width>13</width>
  <height>103</height>
  <uuid>{12485714-3532-4328-9c3e-ce40d9c65f98}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.98901100</xValue>
  <yValue>0.00000000</yValue>
  <type>point</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>352</x>
  <y>50</y>
  <width>13</width>
  <height>103</height>
  <uuid>{43e56085-950c-47eb-88a5-3564197b313d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.26373600</xValue>
  <yValue>0.00000000</yValue>
  <type>point</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>384</x>
  <y>50</y>
  <width>13</width>
  <height>103</height>
  <uuid>{c55fa5a4-906b-4718-b9f0-12e99a183c4e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.26373600</xValue>
  <yValue>0.00000000</yValue>
  <type>point</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>384</x>
  <y>50</y>
  <width>13</width>
  <height>103</height>
  <uuid>{7b55e0b7-3b99-44c0-b90c-07889158bcb7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.26373600</xValue>
  <yValue>0.00000000</yValue>
  <type>point</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>415</x>
  <y>19</y>
  <width>13</width>
  <height>134</height>
  <uuid>{a920d80d-c179-46d1-95aa-6e42c4b89b67}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.26373600</xValue>
  <yValue>0.00000000</yValue>
  <type>point</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>512</x>
  <y>48</y>
  <width>13</width>
  <height>103</height>
  <uuid>{5c6cabfc-98c8-41d2-be1d-fcc9ce2ac0a9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.26373600</xValue>
  <yValue>0.00000000</yValue>
  <type>point</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>544</x>
  <y>48</y>
  <width>13</width>
  <height>103</height>
  <uuid>{beabf17e-ba96-4d4f-b512-a68dded53232}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.26373600</xValue>
  <yValue>0.00000000</yValue>
  <type>point</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>577</x>
  <y>49</y>
  <width>13</width>
  <height>103</height>
  <uuid>{955d17de-3ecc-433d-9851-07e1b216dc01}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.26373600</xValue>
  <yValue>0.00000000</yValue>
  <type>point</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>607</x>
  <y>49</y>
  <width>13</width>
  <height>103</height>
  <uuid>{21b9cd82-2e49-4613-ae03-de12ac557016}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.26373600</xValue>
  <yValue>0.00000000</yValue>
  <type>point</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>672</x>
  <y>19</y>
  <width>13</width>
  <height>715</height>
  <uuid>{5d71158b-26bd-411c-9b11-6e4bcf38c9ee}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.32547900</xValue>
  <yValue>-139.00000000</yValue>
  <type>point</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>700</x>
  <y>141</y>
  <width>13</width>
  <height>554</height>
  <uuid>{f747ed75-efbd-4961-90f4-07ceac0a2362}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.83025800</xValue>
  <yValue>0.00000000</yValue>
  <type>point</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>160</x>
  <y>717</y>
  <width>525</width>
  <height>13</height>
  <uuid>{d3124622-47d6-4389-aa97-d6db50d42ff5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.98141300</yValue>
  <type>point</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>159</x>
  <y>684</y>
  <width>555</width>
  <height>13</height>
  <uuid>{dcc69ebd-1dbf-4771-9d81-e4d9054c8db8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.98141300</yValue>
  <type>point</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>29</x>
  <y>349</y>
  <width>136</width>
  <height>37</height>
  <uuid>{6149640f-82e8-4b9a-a6da-85073a8d74a7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>NOISE</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>16</fontsize>
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
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>29</x>
  <y>385</y>
  <width>136</width>
  <height>67</height>
  <uuid>{06c0cef1-b2b7-4eaa-bd1d-65e22d902ab1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>INPUT               1INPUT               2</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>16</fontsize>
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
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>29</x>
  <y>451</y>
  <width>136</width>
  <height>37</height>
  <uuid>{d5ce41f3-1d36-4e13-8c4b-1a9d663f9a41}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>FILTER</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>16</fontsize>
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
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>29</x>
  <y>487</y>
  <width>136</width>
  <height>37</height>
  <uuid>{deb5b30e-f022-4409-be0d-6bd3758c10d4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>TRAPEZ</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>16</fontsize>
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
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>29</x>
  <y>523</y>
  <width>136</width>
  <height>33</height>
  <uuid>{060cf72e-82c8-4d6c-88f4-46d68cb1b43c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>ENV SIG</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>16</fontsize>
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
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>29</x>
  <y>555</y>
  <width>136</width>
  <height>33</height>
  <uuid>{f3ceedae-adc6-4e76-913d-6de9a1ffaa4a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>RING MODRING MOD</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>16</fontsize>
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
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>29</x>
  <y>587</y>
  <width>136</width>
  <height>35</height>
  <uuid>{7caf8411-8a1f-414b-9293-bc9d58f5ac96}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>REVERBRING MOD</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>16</fontsize>
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
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>29</x>
  <y>621</y>
  <width>136</width>
  <height>70</height>
  <uuid>{9ace813d-a4f3-46a4-bc38-e9fe2a4a9cb7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label> STICK      &lt;-->                        |</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>16</fontsize>
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
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>171</x>
  <y>53</y>
  <width>24</width>
  <height>85</height>
  <uuid>{ffff5157-b698-460b-ac06-4ebdba919eb6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>METER</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>14</fontsize>
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
  <x>268</x>
  <y>54</y>
  <width>25</width>
  <height>88</height>
  <uuid>{cab772fd-d96c-410e-99bc-2ff360f5f193}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>ENVEL</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>14</fontsize>
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
  <x>208</x>
  <y>53</y>
  <width>47</width>
  <height>88</height>
  <uuid>{23c5f05c-f6c2-4908-8996-35b279539104}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>OUTAMPS1     2</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>14</fontsize>
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
  <x>248</x>
  <y>11</y>
  <width>90</width>
  <height>24</height>
  <uuid>{025ed4aa-ce96-43eb-896e-2846868e009a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>SIGNAL INPUTS</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
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
  <objectName>k01-13</objectName>
  <x>549</x>
  <y>147</y>
  <width>33</width>
  <height>35</height>
  <uuid>{551a82b7-36a9-4faa-a3b8-766a2b836023}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>k01-16</objectName>
  <x>644</x>
  <y>150</y>
  <width>30</width>
  <height>30</height>
  <uuid>{d14b4c8c-4881-43b4-b580-2499d8b69275}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>301</x>
  <y>53</y>
  <width>47</width>
  <height>88</height>
  <uuid>{196b319a-f244-4e3b-af73-cd33df5bbf49}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>RINGMODA   B</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>14</fontsize>
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
  <x>395</x>
  <y>54</y>
  <width>26</width>
  <height>89</height>
  <uuid>{4617b5ef-9be4-43fa-9327-eeaef8931173}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>REVERB</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>13</fontsize>
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
  <x>363</x>
  <y>53</y>
  <width>25</width>
  <height>91</height>
  <uuid>{cf9f3f29-9eae-4363-b414-be10586c7eee}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>FILTER</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>13</fontsize>
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
  <x>427</x>
  <y>55</y>
  <width>86</width>
  <height>86</height>
  <uuid>{17da74a4-8b45-4b3a-8b26-1167d1fa4cf4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>OSC.FREQ1     2    3 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>14</fontsize>
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
  <x>523</x>
  <y>56</y>
  <width>24</width>
  <height>84</height>
  <uuid>{24f76c12-6582-4215-8320-aa54cb0457c6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>DECAY</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>14</fontsize>
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
  <x>554</x>
  <y>53</y>
  <width>26</width>
  <height>89</height>
  <uuid>{0fe00fc4-61b8-4030-b510-054c5f1ee2bc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>REVERB</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>13</fontsize>
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
  <x>586</x>
  <y>53</y>
  <width>25</width>
  <height>91</height>
  <uuid>{07d2bd7a-2e69-4281-b294-58c3edc37d68}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>FILTER</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>13</fontsize>
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
  <x>623</x>
  <y>54</y>
  <width>47</width>
  <height>88</height>
  <uuid>{3a1d8c41-f47d-4da4-b7b0-4b9ad5901526}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>OUTAMPS1     2</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>14</fontsize>
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
  <objectName>shape1</objectName>
  <x>851</x>
  <y>115</y>
  <width>48</width>
  <height>48</height>
  <uuid>{8e93f7a2-e227-4e49-abb9-fdce58ba9951}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.10000000</minimum>
  <maximum>0.90000000</maximum>
  <value>0.58500000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.00100000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>lsine1</objectName>
  <x>918</x>
  <y>115</y>
  <width>48</width>
  <height>48</height>
  <uuid>{050c83ea-a17a-4188-b89e-09d5e54afd02}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.33000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>lramp1</objectName>
  <x>982</x>
  <y>115</y>
  <width>48</width>
  <height>48</height>
  <uuid>{ffc7a379-4afa-4752-b1d3-cd92b8cf7a94}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.72000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>frosc1</objectName>
  <x>771</x>
  <y>112</y>
  <width>62</width>
  <height>60</height>
  <uuid>{c5e66b47-05fd-4051-a9e4-1428d0ee8823}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>10.00000000</maximum>
  <value>4.50399800</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.00100000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>dispfrosc1</objectName>
  <x>773</x>
  <y>104</y>
  <width>47</width>
  <height>24</height>
  <uuid>{1cf9c2d1-af1e-473f-a009-4fe212eca275}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>53.330</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>k07-02</objectName>
  <x>197</x>
  <y>350</y>
  <width>33</width>
  <height>33</height>
  <uuid>{fad12585-4eb8-4008-ac40-81da44b47dd4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>763</x>
  <y>64</y>
  <width>98</width>
  <height>24</height>
  <uuid>{c24b18bc-4584-4ffa-89af-ee4f83544a76}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>OSCILLATOR 1</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>249</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="background">
   <r>13</r>
   <g>19</g>
   <b>4</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>1036</x>
  <y>48</y>
  <width>14</width>
  <height>615</height>
  <uuid>{1fd34611-863f-4dff-8d0e-d7e1c6e97ed0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.01153200</xValue>
  <yValue>0.50000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>763</x>
  <y>206</y>
  <width>100</width>
  <height>24</height>
  <uuid>{981e86f8-3932-4b91-975c-85d78f0cac2c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>OSCILLATOR 2</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>249</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="background">
   <r>13</r>
   <g>19</g>
   <b>4</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>frosc2</objectName>
  <x>773</x>
  <y>255</y>
  <width>60</width>
  <height>58</height>
  <uuid>{8bbd7f96-a0bb-4277-9e72-64a891be6575}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>10.00000000</maximum>
  <value>10.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.00100000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>shape2</objectName>
  <x>853</x>
  <y>260</y>
  <width>48</width>
  <height>48</height>
  <uuid>{2e541ec3-812a-47e0-a521-5102119f57d2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.53900000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.00100000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>dispfrosc2</objectName>
  <x>775</x>
  <y>245</y>
  <width>47</width>
  <height>24</height>
  <uuid>{752d73ba-f4a2-442f-8d05-0e72ef469521}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>10000.000</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>lsquare2</objectName>
  <x>918</x>
  <y>261</y>
  <width>48</width>
  <height>48</height>
  <uuid>{6f4b4a96-04c9-4059-8888-f8be9c1c9adc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>lramp2</objectName>
  <x>984</x>
  <y>261</y>
  <width>48</width>
  <height>48</height>
  <uuid>{393dda63-0fa8-42c8-b729-22cdb65f79b7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.47000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>763</x>
  <y>346</y>
  <width>107</width>
  <height>24</height>
  <uuid>{167395c5-ad01-485b-98b5-0be7496e6954}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>OSCILLATOR 3</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>249</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="background">
   <r>13</r>
   <g>19</g>
   <b>4</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>frosc3</objectName>
  <x>774</x>
  <y>396</y>
  <width>61</width>
  <height>60</height>
  <uuid>{502c2bfd-1afa-4f2d-9567-93295e2e4ba9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>10.00000000</maximum>
  <value>9.09400400</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.00100000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>shape3</objectName>
  <x>852</x>
  <y>399</y>
  <width>48</width>
  <height>48</height>
  <uuid>{cc2bb0bc-c156-4260-a3ea-b90b135f52db}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.80100000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.00100000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>dispfrosc3</objectName>
  <x>780</x>
  <y>386</y>
  <width>41</width>
  <height>24</height>
  <uuid>{75c7724e-79f8-4ec1-8b3e-1dbe7323c224}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>199.460</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>lsquare3</objectName>
  <x>920</x>
  <y>399</y>
  <width>48</width>
  <height>48</height>
  <uuid>{4747fa64-e5ad-483e-80d0-52d5fd8798de}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.18000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>lramp3</objectName>
  <x>983</x>
  <y>399</y>
  <width>48</width>
  <height>48</height>
  <uuid>{92d7b6bf-6be4-4bc1-b492-bc92cfc6ae3b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.38000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>752</x>
  <y>473</y>
  <width>696</width>
  <height>14</height>
  <uuid>{0dc87a0c-04c3-437e-a30a-20c5b58591ad}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>left</objectName>
  <x>730</x>
  <y>27</y>
  <width>743</width>
  <height>38</height>
  <uuid>{12173040-81d6-431b-8503-8eda42a6f51e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>left</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>1.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>128</r>
   <g>64</g>
   <b>0</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>764</x>
  <y>493</y>
  <width>109</width>
  <height>24</height>
  <uuid>{3f39f2d0-fef2-4091-acbc-47b6a0a05e2a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>NOISE GENERATOR</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>249</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="background">
   <r>13</r>
   <g>19</g>
   <b>4</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>blackstrip</objectName>
  <x>759</x>
  <y>639</y>
  <width>687</width>
  <height>29</height>
  <uuid>{4d91eb35-a28c-4430-afa6-915f9711da4e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>blackstrip</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>1.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>25</r>
   <g>25</g>
   <b>25</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>768</x>
  <y>520</y>
  <width>75</width>
  <height>35</height>
  <uuid>{9bef636e-18fd-4163-b0ec-e3f5a1b70174}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>COLOURWhite</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <x>850</x>
  <y>521</y>
  <width>48</width>
  <height>24</height>
  <uuid>{9214001f-7498-413e-9aba-333ab5b3623e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>LEVEL</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>756</x>
  <y>182</y>
  <width>693</width>
  <height>14</height>
  <uuid>{4fdb95b7-eae7-4a68-99d7-ee03aa6051a2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>left</objectName>
  <x>1434</x>
  <y>54</y>
  <width>39</width>
  <height>937</height>
  <uuid>{0dcca960-a665-411d-a811-aff4ba16f623}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>left</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>1.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>128</r>
   <g>64</g>
   <b>0</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>895</x>
  <y>475</y>
  <width>14</width>
  <height>187</height>
  <uuid>{63cab7fc-ca88-4684-a2de-7184d666dbb1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>-0.01604300</xValue>
  <yValue>3.50000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>905</x>
  <y>493</y>
  <width>114</width>
  <height>24</height>
  <uuid>{090a241c-77b3-4056-aac5-030f2662ff8c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>INPUT LEVEL</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>249</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="background">
   <r>13</r>
   <g>19</g>
   <b>4</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>levin_1</objectName>
  <x>919</x>
  <y>545</y>
  <width>48</width>
  <height>48</height>
  <uuid>{26a26925-f931-4c10-b3a1-9686114aa22d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>levin_2</objectName>
  <x>981</x>
  <y>545</y>
  <width>48</width>
  <height>48</height>
  <uuid>{37c7d70c-97bb-4f55-8d80-0751a182ad5a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.65000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>1154</x>
  <y>51</y>
  <width>14</width>
  <height>146</height>
  <uuid>{9bc078f6-b605-4899-a20e-b56bd8d50a04}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>1047</x>
  <y>63</y>
  <width>107</width>
  <height>24</height>
  <uuid>{f7e23f5e-1cec-406d-8c7f-92df28533be5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>RING MODULATOR</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>249</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="background">
   <r>13</r>
   <g>19</g>
   <b>4</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>755</x>
  <y>333</y>
  <width>486</width>
  <height>14</height>
  <uuid>{95b2c009-cd31-4871-891b-f2a5bf9ce6fd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.50000000</xValue>
  <yValue>0.01898700</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>1228</x>
  <y>334</y>
  <width>14</width>
  <height>329</height>
  <uuid>{c187229d-2b6f-4688-980f-a0f4a5036799}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>-0.00315500</xValue>
  <yValue>2.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>1168</x>
  <y>64</y>
  <width>112</width>
  <height>24</height>
  <uuid>{d1d6f384-2780-4118-b3df-90622d2258a1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>FILTER / OSCILLATOR</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>249</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="background">
   <r>13</r>
   <g>19</g>
   <b>4</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>1047</x>
  <y>206</y>
  <width>107</width>
  <height>24</height>
  <uuid>{a2cdf264-b632-4686-b476-bc19c347c4a3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>ENVELOPE SHAPER</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>249</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="background">
   <r>13</r>
   <g>19</g>
   <b>4</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>attack</objectName>
  <x>1073</x>
  <y>260</y>
  <width>48</width>
  <height>48</height>
  <uuid>{b86081c4-561f-4dbb-be14-db98becc21e2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00300000</minimum>
  <maximum>4.50000000</maximum>
  <value>2.45300000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>eon</objectName>
  <x>1165</x>
  <y>259</y>
  <width>49</width>
  <height>50</height>
  <uuid>{7a193a40-0e97-46c6-8e8a-9b23d3422f51}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.01000000</minimum>
  <maximum>4.00000000</maximum>
  <value>1.01500100</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.00500000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>decay</objectName>
  <x>1259</x>
  <y>259</y>
  <width>50</width>
  <height>50</height>
  <uuid>{8f5d9587-7abf-4996-b616-151ffbeaa6ac}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.01000000</minimum>
  <maximum>4.00000000</maximum>
  <value>1.67500000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.00500000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>1051</x>
  <y>345</y>
  <width>134</width>
  <height>24</height>
  <uuid>{8b3df0af-74e3-4759-9416-7812e653a60d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>REVERBERATION</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>249</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="background">
   <r>13</r>
   <g>19</g>
   <b>4</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>off_pulse</objectName>
  <x>1350</x>
  <y>259</y>
  <width>50</width>
  <height>50</height>
  <uuid>{f5d991f0-def9-4876-9b07-c4bfd1b3f5a4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.05000000</minimum>
  <maximum>4.00000000</maximum>
  <value>0.05000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.00500000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>mutech1</objectName>
  <x>1077</x>
  <y>601</y>
  <width>30</width>
  <height>30</height>
  <uuid>{214123e4-9eb8-41d7-852e-6ea2b3c04fe7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>mutech2</objectName>
  <x>1169</x>
  <y>602</y>
  <width>30</width>
  <height>30</height>
  <uuid>{693a7753-e792-4357-83bd-62ff5844395e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>wetdry</objectName>
  <x>1065</x>
  <y>399</y>
  <width>48</width>
  <height>48</height>
  <uuid>{d822afbe-750b-413f-98b4-e18dc40cea7c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.27000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>cutoff</objectName>
  <x>1177</x>
  <y>112</y>
  <width>49</width>
  <height>50</height>
  <uuid>{945dc55e-727f-41a1-ab1b-b12a9e598efe}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.10000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.83499900</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.00500000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>res</objectName>
  <x>1264</x>
  <y>112</y>
  <width>49</width>
  <height>50</height>
  <uuid>{433c16d2-d3b3-495d-beed-2fac30bef0ea}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.10000000</minimum>
  <maximum>1.20000000</maximum>
  <value>1.02000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>fillev</objectName>
  <x>1349</x>
  <y>112</y>
  <width>49</width>
  <height>50</height>
  <uuid>{d3b04bbc-f4ff-4739-97bd-74298c639239}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.80000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>revlev</objectName>
  <x>1162</x>
  <y>399</y>
  <width>48</width>
  <height>48</height>
  <uuid>{074d3aa0-054a-431e-9f20-be490cec9585}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.52000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>filch1</objectName>
  <x>1068</x>
  <y>545</y>
  <width>48</width>
  <height>48</height>
  <uuid>{5fd02fd7-d162-4afa-b070-ddad15394a71}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>-6.00000000</minimum>
  <maximum>6.00000000</maximum>
  <value>0.20000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.10000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>filch2</objectName>
  <x>1158</x>
  <y>545</y>
  <width>48</width>
  <height>48</height>
  <uuid>{4931046f-accc-4436-a27a-9d46e78d56c2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>-6.00000000</minimum>
  <maximum>6.00000000</maximum>
  <value>-6.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.05000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>traplev</objectName>
  <x>1261</x>
  <y>399</y>
  <width>48</width>
  <height>48</height>
  <uuid>{503858a8-7e5a-47af-9790-c7975a849137}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.49000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>signal</objectName>
  <x>1352</x>
  <y>399</y>
  <width>48</width>
  <height>48</height>
  <uuid>{b7828972-1a7d-43e5-ab40-3e2b62f6aef5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.53000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>RMS1</objectName>
  <x>1266</x>
  <y>538</y>
  <width>16</width>
  <height>79</height>
  <uuid>{86d60d2e-9920-4239-a959-44b75d961e76}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>RMS1</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.16478710</xValue>
  <yValue>1.16478710</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>joy_v</objectName>
  <x>1247</x>
  <y>731</y>
  <width>131</width>
  <height>126</height>
  <uuid>{3c166241-3e18-44c5-8f6f-ccedeb2db6e5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>joy_h</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.40350900</xValue>
  <yValue>-6.97479000</yValue>
  <type>point</type>
  <pointsize>12</pointsize>
  <fadeSpeed>123.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>7</r>
   <g>138</g>
   <b>204</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>left</objectName>
  <x>9</x>
  <y>744</y>
  <width>38</width>
  <height>247</height>
  <uuid>{97301cce-9f81-4c3e-985c-383a9dc0d42b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>left</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>1.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>128</r>
   <g>64</g>
   <b>0</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>1051</x>
  <y>493</y>
  <width>121</width>
  <height>24</height>
  <uuid>{9e47534f-4f4a-4dab-a522-04d6dd90bdc0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>OUTPUT FILTER</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>249</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="background">
   <r>13</r>
   <g>19</g>
   <b>4</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>dispcutoff</objectName>
  <x>1179</x>
  <y>147</y>
  <width>44</width>
  <height>24</height>
  <uuid>{b6bf4825-0141-4f3b-ba2e-545900d2604e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>4224.417</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>res</objectName>
  <x>1275</x>
  <y>147</y>
  <width>32</width>
  <height>24</height>
  <uuid>{18e75c8b-7905-4ab5-b777-3bfa1bf164d4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <x>1254</x>
  <y>93</y>
  <width>75</width>
  <height>24</height>
  <uuid>{3dcdc3a6-004e-4357-8800-01933a3d965a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>RESPONSE</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
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
  <x>770</x>
  <y>91</y>
  <width>71</width>
  <height>24</height>
  <uuid>{5413747b-f927-44f0-8cb4-6c4c7a660fc1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>FREQUENCY</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
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
  <x>849</x>
  <y>98</y>
  <width>53</width>
  <height>24</height>
  <uuid>{c6e63927-3399-49c7-ad71-e74e8a4a01a6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>SHAPE</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
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
  <x>948</x>
  <y>82</y>
  <width>51</width>
  <height>33</height>
  <uuid>{4828b196-cb84-41a9-a7b8-c13703ee1385}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>LEVEL</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
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
  <x>1071</x>
  <y>93</y>
  <width>54</width>
  <height>24</height>
  <uuid>{214d4b0b-b044-427b-9f8d-1058efa64985}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>LEVEL</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
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
  <x>812</x>
  <y>102</y>
  <width>31</width>
  <height>27</height>
  <uuid>{a33c4f89-9974-45ce-ad52-2ffd7aed0934}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Hz</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
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
 <bsbObject version="2" type="BSBKnob">
  <objectName>rmlev</objectName>
  <x>1074</x>
  <y>115</y>
  <width>48</width>
  <height>48</height>
  <uuid>{44f5cfe9-84e1-4a86-a07e-7c30f3cc214c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>disp_joy_h</objectName>
  <x>1344</x>
  <y>851</y>
  <width>44</width>
  <height>24</height>
  <uuid>{71d0dd3d-eb52-4dd9-bfe0-53c1f31465cb}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>0.000</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
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
  <objectName>disp_joy_v</objectName>
  <x>1211</x>
  <y>739</y>
  <width>41</width>
  <height>24</height>
  <uuid>{7c0e7d63-6f87-4e57-b7fe-5f46c7d57d32}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>0.993</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
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
  <x>1185</x>
  <y>738</y>
  <width>31</width>
  <height>27</height>
  <uuid>{cbe4eca7-fb6f-4b0e-8690-385b8cb12a37}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Y = </label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
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
  <x>1320</x>
  <y>851</y>
  <width>31</width>
  <height>27</height>
  <uuid>{22101f88-bb2d-47c8-b0dd-d5b0ead1155a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>X = = </label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
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
 <bsbObject version="2" type="BSBKnob">
  <objectName>range_v</objectName>
  <x>1188</x>
  <y>758</y>
  <width>48</width>
  <height>48</height>
  <uuid>{a2733431-0910-4b6d-971d-42061af795a5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.96000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>range_h</objectName>
  <x>1276</x>
  <y>688</y>
  <width>48</width>
  <height>48</height>
  <uuid>{7fc28873-a6c5-4dd7-ae69-69dfaab29276}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.63000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>range_v</objectName>
  <x>1148</x>
  <y>771</y>
  <width>44</width>
  <height>30</height>
  <uuid>{1fe02f08-021c-4f71-b57e-95b0953380ec}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
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
  <objectName>range_h</objectName>
  <x>1321</x>
  <y>695</y>
  <width>44</width>
  <height>30</height>
  <uuid>{07887950-b6a6-4f67-9e3f-cbbf1e726c8d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
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
  <x>1273</x>
  <y>680</y>
  <width>61</width>
  <height>24</height>
  <uuid>{8a38feb2-2b21-47f0-bd18-13e3fe95d884}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>RANGE_X</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
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
  <x>1183</x>
  <y>796</y>
  <width>60</width>
  <height>24</height>
  <uuid>{6ca2d729-fc6c-405f-8d12-c8dc365e6e0e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>RANGE_Y</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
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
  <objectName>k15-14</objectName>
  <x>582</x>
  <y>625</y>
  <width>30</width>
  <height>30</height>
  <uuid>{148321b0-7332-4fea-8f1a-535646ce59d9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>lamp</objectName>
  <x>1132</x>
  <y>236</y>
  <width>20</width>
  <height>20</height>
  <uuid>{68f9619b-66bd-4afc-90ea-3054d07514a1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>lamp</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>1.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>25</g>
   <b>0</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>1358</x>
  <y>241</y>
  <width>32</width>
  <height>24</height>
  <uuid>{df5504b5-c6e7-4c2b-86b6-78dd087b0619}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>OFF</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
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
  <x>1071</x>
  <y>241</y>
  <width>49</width>
  <height>24</height>
  <uuid>{50bfc455-2823-4eaa-9e49-a53b43434482}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>ATTACK</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
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
  <x>1167</x>
  <y>241</y>
  <width>47</width>
  <height>24</height>
  <uuid>{b9c4e9b5-4923-4fe7-901d-3db15295bb6b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>ON</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
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
  <x>1263</x>
  <y>241</y>
  <width>42</width>
  <height>26</height>
  <uuid>{60b3f4e8-ba08-4e02-988f-7493946cdf96}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>DECAY</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
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
  <x>1073</x>
  <y>378</y>
  <width>34</width>
  <height>25</height>
  <uuid>{eae49839-7bb3-45d4-a0be-ab7f8eb17c04}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>MIX</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
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
  <x>1165</x>
  <y>378</y>
  <width>46</width>
  <height>24</height>
  <uuid>{ba374763-89d3-492d-ba60-870293069396}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>LEVEL</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
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
  <objectName>disppitch</objectName>
  <x>845</x>
  <y>835</y>
  <width>48</width>
  <height>25</height>
  <uuid>{1e64f541-ee95-4ecf-aa8a-c6c897046b71}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>128</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>204</r>
   <g>255</g>
   <b>102</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>led1</objectName>
  <x>78</x>
  <y>956</y>
  <width>22</width>
  <height>23</height>
  <uuid>{c725f240-5520-4363-b420-1476dd5094df}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>led1</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>184</g>
   <b>7</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>led2</objectName>
  <x>113</x>
  <y>956</y>
  <width>22</width>
  <height>23</height>
  <uuid>{e7c6ee66-1bd0-427d-924e-5c7ef8be4188}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>led2</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>184</g>
   <b>7</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>led3</objectName>
  <x>147</x>
  <y>956</y>
  <width>22</width>
  <height>23</height>
  <uuid>{aa69ca4d-d84c-495c-9c26-49905af67c89}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>led3</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>184</g>
   <b>7</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>led4</objectName>
  <x>182</x>
  <y>956</y>
  <width>22</width>
  <height>23</height>
  <uuid>{33b99ce0-7dbe-42b6-9eb8-366a03bd9a88}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>led4</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>184</g>
   <b>7</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>led5</objectName>
  <x>218</x>
  <y>956</y>
  <width>22</width>
  <height>23</height>
  <uuid>{0ae4fe51-993b-4cba-9d08-2047986d8445}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>led5</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>184</g>
   <b>7</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>vel</objectName>
  <x>792</x>
  <y>855</y>
  <width>38</width>
  <height>24</height>
  <uuid>{66a5e6df-0d7c-44f8-a98b-533aaff9e4a8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>seq</objectName>
  <x>964</x>
  <y>719</y>
  <width>30</width>
  <height>30</height>
  <uuid>{27d14b76-b614-4b15-83d0-5688fdc85974}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>1238</x>
  <y>483</y>
  <width>81</width>
  <height>24</height>
  <uuid>{97cc9039-97e0-4a5e-84b3-d4347ee274b4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>EuVCS3x-mCS</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
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
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>1009</x>
  <y>720</y>
  <width>65</width>
  <height>48</height>
  <uuid>{7adea078-be14-4da6-a996-0780e783fe5d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Sequencer Synth</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>0</g>
   <b>2</b>
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
  <x>80</x>
  <y>755</y>
  <width>281</width>
  <height>34</height>
  <uuid>{1e3ed7c8-e9cd-4b25-a67d-7f3e035fef92}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>01        02         03        04         05        06       07        08         </label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
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
  <objectName>dir</objectName>
  <x>964</x>
  <y>773</y>
  <width>30</width>
  <height>30</height>
  <uuid>{adaeec02-88e1-4228-9582-be9301fbfbcd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>1009</x>
  <y>775</y>
  <width>77</width>
  <height>37</height>
  <uuid>{03416468-72e7-4765-8f2f-ec6020631fb1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Rev / Frwd</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>15</g>
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
 <bsbObject version="2" type="BSBController">
  <objectName>led1</objectName>
  <x>45</x>
  <y>791</y>
  <width>23</width>
  <height>22</height>
  <uuid>{64bfc358-9a8f-4339-bc7e-96d9065b1d79}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>led1</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>23</g>
   <b>0</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>788</x>
  <y>702</y>
  <width>44</width>
  <height>26</height>
  <uuid>{52c85595-c556-4cf9-88e1-74a48ce32e3f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Attacked:</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
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
  <objectName>port</objectName>
  <x>964</x>
  <y>826</y>
  <width>30</width>
  <height>30</height>
  <uuid>{a3ec569a-7ed2-4008-9f8b-f5f606ebb7a2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>time</objectName>
  <x>905</x>
  <y>817</y>
  <width>48</width>
  <height>48</height>
  <uuid>{dad8bc7f-f6cf-4212-86af-20bd91e26a66}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.01000000</minimum>
  <maximum>0.05000000</maximum>
  <value>0.03400000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.00100000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>904</x>
  <y>703</y>
  <width>43</width>
  <height>24</height>
  <uuid>{3488d418-2300-40b0-8530-832a83779e99}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>DecayDeacy</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
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
  <x>998</x>
  <y>827</y>
  <width>78</width>
  <height>24</height>
  <uuid>{892d4001-5d3b-4ebe-836c-f6b55aaeaebf}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Glide On/Off</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
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
 <bsbObject version="2" type="BSBController">
  <objectName>left</objectName>
  <x>730</x>
  <y>54</y>
  <width>38</width>
  <height>936</height>
  <uuid>{0cc55a4c-731f-4081-8133-325aa0a56ab5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>left</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>1.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>128</r>
   <g>64</g>
   <b>0</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>910</x>
  <y>799</y>
  <width>40</width>
  <height>24</height>
  <uuid>{29170eab-1545-47be-8dd9-6852375018d8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Time</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
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
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>761</x>
  <y>892</y>
  <width>83</width>
  <height>44</height>
  <uuid>{2584cec9-895c-41d4-99ac-3923a402b74e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Pitch</text>
  <image>/</image>
  <eventLine>i  100  0  0.1</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>lambda</objectName>
  <x>779</x>
  <y>920</y>
  <width>48</width>
  <height>48</height>
  <uuid>{55176011-3e5b-45af-bdd5-cde84fce3b15}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>1.00000000</minimum>
  <maximum>71.00000000</maximum>
  <value>49.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>1142</x>
  <y>656</y>
  <width>14</width>
  <height>333</height>
  <uuid>{ebfa2a73-f314-4f86-a9eb-c3fa604eead6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>835</x>
  <y>892</y>
  <width>86</width>
  <height>43</height>
  <uuid>{187ce8d2-7f79-4199-99b0-48629a27690c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Levels</text>
  <image>/</image>
  <eventLine>i  101  0  0.1</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>avrg</objectName>
  <x>853</x>
  <y>920</y>
  <width>48</width>
  <height>48</height>
  <uuid>{ab9981e1-d56d-4fb7-a838-e8f1d7c87791}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.85000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.05000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>839</x>
  <y>949</y>
  <width>80</width>
  <height>40</height>
  <uuid>{990d4b61-9d06-4585-a15e-c1a5265a766f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Reset</text>
  <image>/</image>
  <eventLine>i112 0 0.1</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>846</x>
  <y>703</y>
  <width>43</width>
  <height>24</height>
  <uuid>{9030d2d2-72a2-486a-9bff-a51dcb9db9f3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>On</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
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
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>648</x>
  <y>745</y>
  <width>90</width>
  <height>50</height>
  <uuid>{96e0b92c-abe0-4479-b609-605e1dbcfabd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Run/Stop</text>
  <image>/</image>
  <eventLine>i199 0 0.1</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>ledmute</objectName>
  <x>107</x>
  <y>111</y>
  <width>18</width>
  <height>16</height>
  <uuid>{2574814c-b059-49ab-9205-337d447b7b4b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>ledmute</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>7</g>
   <b>0</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>46</x>
  <y>51</y>
  <width>93</width>
  <height>49</height>
  <uuid>{92de9467-cfdf-462b-8406-bb8ac18c9d90}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>FadeOut</text>
  <image>/</image>
  <eventLine>i9998 0 4 4</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>45</x>
  <y>4</y>
  <width>94</width>
  <height>50</height>
  <uuid>{47994891-e71d-401b-9926-24554ea29806}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>FadeIn</text>
  <image>/</image>
  <eventLine>i9997 0 4 4</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>fin</objectName>
  <x>27</x>
  <y>1</y>
  <width>15</width>
  <height>55</height>
  <uuid>{60abefc1-97c7-4f32-ba00-a742c725a150}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>fin</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.99085200</xValue>
  <yValue>0.99085200</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>envsw</objectName>
  <x>1265</x>
  <y>338</y>
  <width>30</width>
  <height>30</height>
  <uuid>{a37b556b-61b3-4bc3-88c0-598a13bf7891}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName>AutoMan</objectName>
  <x>1242</x>
  <y>315</y>
  <width>76</width>
  <height>24</height>
  <uuid>{ff183d16-f37d-4ea0-b26a-bba0dd699cf6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>128</r>
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
  <x>1248</x>
  <y>379</y>
  <width>73</width>
  <height>24</height>
  <uuid>{5bef6224-0144-4b35-af53-849ab524d924}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>TRAPEZOID</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
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
  <x>1344</x>
  <y>379</y>
  <width>71</width>
  <height>24</height>
  <uuid>{52dfbf6b-a40e-43e8-9481-cb1cfb6d8137}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>SIGNAL</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
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
  <x>772</x>
  <y>233</y>
  <width>71</width>
  <height>24</height>
  <uuid>{338bec8e-060b-42bc-99c4-b7e501ddd1b8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>FREQUENCY</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
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
  <x>849</x>
  <y>243</y>
  <width>53</width>
  <height>24</height>
  <uuid>{0c426294-3377-4d0a-91ea-5e969c7ee063}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>SHAPE</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
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
  <x>949</x>
  <y>226</y>
  <width>52</width>
  <height>24</height>
  <uuid>{04aa0e7f-a97a-49a2-bcff-85b1983fd521}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>LEVEL</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
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
  <x>773</x>
  <y>372</y>
  <width>71</width>
  <height>24</height>
  <uuid>{f2aa46ca-2764-481a-995d-3bec0d24336e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>FREQUENCY</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
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
  <x>850</x>
  <y>383</y>
  <width>53</width>
  <height>24</height>
  <uuid>{a4c95733-60e2-4c11-a50a-dd05d5785252}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>SHAPE</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
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
  <x>1347</x>
  <y>93</y>
  <width>54</width>
  <height>24</height>
  <uuid>{498ffeb3-d632-4249-873a-0d6a801cae06}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>LEVEL</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
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
  <x>1171</x>
  <y>92</y>
  <width>71</width>
  <height>24</height>
  <uuid>{16afac5f-79b7-4710-9e99-3d78abe44f9b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>FREQUENCY</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
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
 <bsbObject version="2" type="BSBController">
  <objectName>fout</objectName>
  <x>27</x>
  <y>47</y>
  <width>15</width>
  <height>55</height>
  <uuid>{f6cd2861-8a8f-4ac0-ba1e-3e8dd1461f28}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>fout</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00231500</xValue>
  <yValue>0.00231500</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>auto</objectName>
  <x>1244</x>
  <y>344</y>
  <width>19</width>
  <height>18</height>
  <uuid>{7e4365c8-362b-42fc-9006-d490b3df5e4f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>auto</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>1.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>0</g>
   <b>0</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>man</objectName>
  <x>1294</x>
  <y>344</y>
  <width>19</width>
  <height>18</height>
  <uuid>{5ca9c64d-ebac-4b89-aceb-1bfe8947e953}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>man</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>0</g>
   <b>0</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>1238</x>
  <y>322</y>
  <width>87</width>
  <height>24</height>
  <uuid>{232aa506-7a40-4843-8086-c52eb612fd7a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Auto         Man</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
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
  <x>912</x>
  <y>521</y>
  <width>63</width>
  <height>24</height>
  <uuid>{06f5969a-4398-40de-bca9-ec0e93c0a333}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>CHANNEL 1</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <x>972</x>
  <y>521</y>
  <width>67</width>
  <height>24</height>
  <uuid>{c011c1eb-737d-4c16-9629-681f929611d7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>CHANNEL 2</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <x>1061</x>
  <y>521</y>
  <width>63</width>
  <height>24</height>
  <uuid>{23e68027-5126-4299-be97-abddc7139b24}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>CHANNEL 1</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <x>1147</x>
  <y>521</y>
  <width>67</width>
  <height>24</height>
  <uuid>{6036e358-a134-4407-960c-5ac065872c3d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>CHANNEL 2</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>159</x>
  <y>17</y>
  <width>97</width>
  <height>13</height>
  <uuid>{d3febe86-647e-4a0e-bdef-a84ad19d1015}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>325</x>
  <y>16</y>
  <width>145</width>
  <height>13</height>
  <uuid>{6be3648b-5696-4a7d-8769-0a186670638c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>566</x>
  <y>16</y>
  <width>119</width>
  <height>13</height>
  <uuid>{4bfe3048-4a1d-4fee-b6b7-371d63b948a3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.05607500</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>2</r>
   <g>0</g>
   <b>5</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>159</x>
  <y>44</y>
  <width>526</width>
  <height>13</height>
  <uuid>{8a83cec7-1e5b-481a-b582-772b7531e215}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>1381</x>
  <y>767</y>
  <width>54</width>
  <height>24</height>
  <uuid>{4c06edd2-190d-447e-b7fd-f4d123591a67}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>ATTACK</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
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
 <bsbObject version="2" type="BSBController">
  <objectName>trig</objectName>
  <x>1394</x>
  <y>790</y>
  <width>28</width>
  <height>25</height>
  <uuid>{da430cc4-225d-425f-9012-d537532e9165}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>trig</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>point</type>
  <pointsize>13</pointsize>
  <fadeSpeed>351.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>58</g>
   <b>0</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>RMS2</objectName>
  <x>1293</x>
  <y>538</y>
  <width>16</width>
  <height>79</height>
  <uuid>{3e480be5-1982-407e-8efb-fdebf3e9857f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>RMS2</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.98353340</xValue>
  <yValue>0.98353340</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>949</x>
  <y>363</y>
  <width>52</width>
  <height>24</height>
  <uuid>{ee19741b-fc0d-4f99-b5b6-ff9668bf6ce3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>LEVEL</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
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
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>1332</x>
  <y>545</y>
  <width>64</width>
  <height>65</height>
  <uuid>{466bfd26-b990-4c04-aa35-36086b76a944}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>pict</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Button</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>773</x>
  <y>584</y>
  <width>33</width>
  <height>24</height>
  <uuid>{7f8ea08f-da2e-478d-ad46-102afc8a55ea}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Low</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <x>806</x>
  <y>584</y>
  <width>35</width>
  <height>24</height>
  <uuid>{288c1953-2f5f-4965-aabc-e28abe32b7c5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>High</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <x>1053</x>
  <y>576</y>
  <width>33</width>
  <height>24</height>
  <uuid>{4fa85b16-1175-46c8-8b1c-f1ef3c97f8b4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Low</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <x>1102</x>
  <y>576</y>
  <width>35</width>
  <height>24</height>
  <uuid>{5f59ac70-09a0-4605-af69-c7e5a04fd36a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>High</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <x>1144</x>
  <y>576</y>
  <width>33</width>
  <height>24</height>
  <uuid>{97ba251b-ba22-41c2-9552-c32032e88351}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Low</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <x>1194</x>
  <y>576</y>
  <width>35</width>
  <height>24</height>
  <uuid>{9c0820c7-fb93-4eee-83c8-fc84b5cea36e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>High</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>23</x>
  <y>141</y>
  <width>13</width>
  <height>237</height>
  <uuid>{94c9aaeb-4d6f-4ac7-904d-ea8deeba64e0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>23</x>
  <y>140</y>
  <width>192</width>
  <height>13</height>
  <uuid>{41403db0-a3ec-4dec-bdad-d7d6c2041908}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>25</x>
  <y>206</y>
  <width>145</width>
  <height>13</height>
  <uuid>{543ce85a-4134-4a47-bd88-313e50ef6d73}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>25</x>
  <y>276</y>
  <width>145</width>
  <height>13</height>
  <uuid>{798a96fd-ff8c-49b4-8701-038e5748fc24}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>29</x>
  <y>212</y>
  <width>50</width>
  <height>48</height>
  <uuid>{c3309b47-562e-41c2-95b5-a5d90719532c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>OSC  2</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>16</fontsize>
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
  <x>30</x>
  <y>282</y>
  <width>50</width>
  <height>48</height>
  <uuid>{a4a78533-538d-4e34-b612-b1e7b654a440}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>OSC  3</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>16</fontsize>
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
 <bsbObject version="2" type="BSBController">
  <objectName>left</objectName>
  <x>9</x>
  <y>723</y>
  <width>750</width>
  <height>32</height>
  <uuid>{ad8c163a-c08e-4c1d-bf06-e52263f3200d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>left</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>1.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>128</r>
   <g>64</g>
   <b>0</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>s01</objectName>
  <x>66</x>
  <y>779</y>
  <width>48</width>
  <height>48</height>
  <uuid>{3b7259f7-37bb-43d7-9846-dba3401ea132}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>1.00000000</minimum>
  <maximum>71.00000000</maximum>
  <value>22.00000400</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>s03</objectName>
  <x>136</x>
  <y>779</y>
  <width>48</width>
  <height>48</height>
  <uuid>{db242626-823c-45e9-87c7-d875371bf9a0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>1.00000000</minimum>
  <maximum>71.00000000</maximum>
  <value>38.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>s04</objectName>
  <x>171</x>
  <y>779</y>
  <width>48</width>
  <height>48</height>
  <uuid>{550ab145-2441-46d8-9673-4f6fe9b4146b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>1.00000000</minimum>
  <maximum>71.00000000</maximum>
  <value>38.99998500</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>s06</objectName>
  <x>241</x>
  <y>779</y>
  <width>48</width>
  <height>48</height>
  <uuid>{2eacf5de-275d-40a9-82b3-042363781469}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>1.00000000</minimum>
  <maximum>71.00000000</maximum>
  <value>42.00001100</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>s07</objectName>
  <x>276</x>
  <y>779</y>
  <width>48</width>
  <height>48</height>
  <uuid>{c5dd2392-2ea8-4133-bd4e-c0702c00fcf7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>1.00000000</minimum>
  <maximum>71.00000000</maximum>
  <value>32.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>s08</objectName>
  <x>311</x>
  <y>779</y>
  <width>48</width>
  <height>48</height>
  <uuid>{b7c96291-4380-4489-9308-d2a3625a30ca}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>1.00000000</minimum>
  <maximum>71.00000000</maximum>
  <value>50.00000800</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>s09</objectName>
  <x>346</x>
  <y>779</y>
  <width>48</width>
  <height>48</height>
  <uuid>{58b74cb7-219a-400e-87ab-716844bb23e6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>1.00000000</minimum>
  <maximum>71.00000000</maximum>
  <value>50.00000400</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>s10</objectName>
  <x>381</x>
  <y>779</y>
  <width>48</width>
  <height>48</height>
  <uuid>{b299ac18-9587-4c18-8555-db892575f9b8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>1.00000000</minimum>
  <maximum>71.00000000</maximum>
  <value>50.00000400</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>s11</objectName>
  <x>416</x>
  <y>779</y>
  <width>48</width>
  <height>48</height>
  <uuid>{4502669c-2a4f-4074-a038-ff2883e800ed}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>1.00000000</minimum>
  <maximum>71.00000000</maximum>
  <value>49.99999200</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>s12</objectName>
  <x>451</x>
  <y>779</y>
  <width>48</width>
  <height>48</height>
  <uuid>{fcb65747-c81e-4760-963b-532b7c6602a1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>1.00000000</minimum>
  <maximum>71.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>s13</objectName>
  <x>486</x>
  <y>779</y>
  <width>48</width>
  <height>48</height>
  <uuid>{f33b347c-f05a-4d78-82a7-ec1ec177e213}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>1.00000000</minimum>
  <maximum>71.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>s14</objectName>
  <x>521</x>
  <y>779</y>
  <width>48</width>
  <height>48</height>
  <uuid>{6ba676d1-3467-4c70-b197-7663c58685c6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>1.00000000</minimum>
  <maximum>71.00000000</maximum>
  <value>64.00001500</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>s15</objectName>
  <x>556</x>
  <y>779</y>
  <width>48</width>
  <height>48</height>
  <uuid>{d22bb25a-1dc2-4f3e-85cf-0bfcfd3d7e73}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>1.00000000</minimum>
  <maximum>71.00000000</maximum>
  <value>0.50000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>s16</objectName>
  <x>591</x>
  <y>779</y>
  <width>48</width>
  <height>48</height>
  <uuid>{71e77c9a-eccb-4055-815e-59d2f8384088}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>1.00000000</minimum>
  <maximum>71.00000000</maximum>
  <value>50.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>s05</objectName>
  <x>206</x>
  <y>779</y>
  <width>48</width>
  <height>48</height>
  <uuid>{d397133d-631c-4c04-84ea-9b99bdb5c11a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>1.00000000</minimum>
  <maximum>71.00000000</maximum>
  <value>40.00000800</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>s02</objectName>
  <x>101</x>
  <y>779</y>
  <width>48</width>
  <height>48</height>
  <uuid>{0a294141-01f9-4e69-84a7-66d4131ef2f9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>1.00000000</minimum>
  <maximum>71.00000000</maximum>
  <value>49.00001100</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>356</x>
  <y>755</y>
  <width>313</width>
  <height>34</height>
  <uuid>{92b8cbfe-d2da-4709-a2d7-05eaccef15e9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>09         10         11        12         13        14        15        16        </label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
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
  <objectName>L01</objectName>
  <x>66</x>
  <y>834</y>
  <width>48</width>
  <height>48</height>
  <uuid>{b5a77e45-4bfd-4d04-ad3a-7218175c9ef8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>L02</objectName>
  <x>101</x>
  <y>834</y>
  <width>48</width>
  <height>48</height>
  <uuid>{f3ec663d-5395-434e-89e2-05bb81bc4048}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.47000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>L03</objectName>
  <x>136</x>
  <y>834</y>
  <width>48</width>
  <height>48</height>
  <uuid>{eb340167-b3e3-405c-ac23-26210146f107}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>L04</objectName>
  <x>171</x>
  <y>834</y>
  <width>48</width>
  <height>48</height>
  <uuid>{64a007d8-52df-4830-bd3b-061746973838}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>L06</objectName>
  <x>241</x>
  <y>834</y>
  <width>48</width>
  <height>48</height>
  <uuid>{0577c205-a36d-4258-8c54-92ffc5fafae2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.04000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>L05</objectName>
  <x>206</x>
  <y>834</y>
  <width>48</width>
  <height>48</height>
  <uuid>{68146082-bfae-4af8-afea-f22b67f9b530}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>L07</objectName>
  <x>276</x>
  <y>834</y>
  <width>48</width>
  <height>48</height>
  <uuid>{74f10188-3392-4d53-91c2-c87784a37928}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>L08</objectName>
  <x>311</x>
  <y>834</y>
  <width>48</width>
  <height>48</height>
  <uuid>{2f7b4da7-e39e-4751-9c83-808852f4c054}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>L09</objectName>
  <x>346</x>
  <y>834</y>
  <width>48</width>
  <height>48</height>
  <uuid>{4c2bb792-4578-467b-bb31-e548cc6e82b4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>L10</objectName>
  <x>381</x>
  <y>834</y>
  <width>48</width>
  <height>48</height>
  <uuid>{e1d65372-ef8d-421b-85de-b6796efc6a20}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.31000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>L11</objectName>
  <x>416</x>
  <y>834</y>
  <width>48</width>
  <height>48</height>
  <uuid>{88385759-205c-42f9-857c-ae44a8ac21db}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>L12</objectName>
  <x>451</x>
  <y>834</y>
  <width>48</width>
  <height>48</height>
  <uuid>{d4965ecb-c0ef-46c1-853f-281ba5f8be87}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.33000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>L13</objectName>
  <x>486</x>
  <y>834</y>
  <width>48</width>
  <height>48</height>
  <uuid>{bd9f5d1a-332c-46d2-b0b1-888ab9afb447}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>L14</objectName>
  <x>521</x>
  <y>834</y>
  <width>48</width>
  <height>48</height>
  <uuid>{d87d366f-1df4-4ac0-a726-0ddffe9edec8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>L15</objectName>
  <x>556</x>
  <y>834</y>
  <width>48</width>
  <height>48</height>
  <uuid>{96af1d0c-0216-49e2-b801-620e2c7baf2b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>L16</objectName>
  <x>591</x>
  <y>834</y>
  <width>48</width>
  <height>48</height>
  <uuid>{2103a4a3-2464-4b17-ba15-1da9c0de1853}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>C01</objectName>
  <x>66</x>
  <y>872</y>
  <width>48</width>
  <height>48</height>
  <uuid>{aa675fe2-08b7-4398-a108-8585589826e5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.65000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>C02</objectName>
  <x>101</x>
  <y>872</y>
  <width>48</width>
  <height>48</height>
  <uuid>{0626ffdc-bfd2-435b-a397-8abdd6ed6a18}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.81000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>C03</objectName>
  <x>136</x>
  <y>872</y>
  <width>48</width>
  <height>48</height>
  <uuid>{165932f8-bc6c-4777-be83-4b904422b100}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.50000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>C04</objectName>
  <x>171</x>
  <y>872</y>
  <width>48</width>
  <height>48</height>
  <uuid>{4ea04a41-31ea-4aad-b346-27623311db85}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.03000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>C06</objectName>
  <x>241</x>
  <y>872</y>
  <width>48</width>
  <height>48</height>
  <uuid>{ff7d8d32-92d1-4188-9eb6-0e77551d8fb4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.66000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>C05</objectName>
  <x>206</x>
  <y>872</y>
  <width>48</width>
  <height>48</height>
  <uuid>{dd12484c-e261-4a89-826d-86a64263957c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>C07</objectName>
  <x>276</x>
  <y>872</y>
  <width>48</width>
  <height>48</height>
  <uuid>{0fb195d3-602c-4fe6-a262-775955ab4974}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.70000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>C08</objectName>
  <x>311</x>
  <y>872</y>
  <width>48</width>
  <height>48</height>
  <uuid>{1cd8c815-dd48-4722-a141-4f0c2913b205}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.17000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>C09</objectName>
  <x>346</x>
  <y>872</y>
  <width>48</width>
  <height>48</height>
  <uuid>{f7f94815-df42-423a-ac7b-8f4c54b8fcd4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.37520400</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>C10</objectName>
  <x>381</x>
  <y>872</y>
  <width>48</width>
  <height>48</height>
  <uuid>{0dc2bc3e-efc9-44dc-9562-642f2d66bb02}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.18000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>C11</objectName>
  <x>416</x>
  <y>872</y>
  <width>48</width>
  <height>48</height>
  <uuid>{19ce7f42-9318-44ba-a692-dd12ceb03571}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.38000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>C12</objectName>
  <x>451</x>
  <y>872</y>
  <width>48</width>
  <height>48</height>
  <uuid>{653a6f63-842b-496a-b3e3-d1ae76d14979}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.33000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>C13</objectName>
  <x>486</x>
  <y>872</y>
  <width>48</width>
  <height>48</height>
  <uuid>{b0305192-a45d-4718-a06d-8c0b8f3ed42e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.43000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>C14</objectName>
  <x>521</x>
  <y>872</y>
  <width>48</width>
  <height>48</height>
  <uuid>{d1593055-3ad0-4326-9434-1e80c9c357c0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.81000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>C15</objectName>
  <x>556</x>
  <y>872</y>
  <width>48</width>
  <height>48</height>
  <uuid>{16d596cc-fd33-479e-9c04-32776073e650}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.34000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>C16</objectName>
  <x>591</x>
  <y>872</y>
  <width>48</width>
  <height>48</height>
  <uuid>{7cec3707-faea-489a-b28f-f202c819063f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>P01</objectName>
  <x>66</x>
  <y>910</y>
  <width>48</width>
  <height>48</height>
  <uuid>{a9281406-cb91-4011-b3d0-bf9d3c458881}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.02000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>P02</objectName>
  <x>101</x>
  <y>910</y>
  <width>48</width>
  <height>48</height>
  <uuid>{03317d30-56ef-4d91-9b73-169ef4be2458}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>P03</objectName>
  <x>136</x>
  <y>910</y>
  <width>48</width>
  <height>48</height>
  <uuid>{bafa0bed-9378-4026-9071-c7904e53cd70}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>P04</objectName>
  <x>171</x>
  <y>910</y>
  <width>48</width>
  <height>48</height>
  <uuid>{3b4889ee-6bf5-46b3-bb70-2cd022a8efb3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.74502600</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>P05</objectName>
  <x>206</x>
  <y>910</y>
  <width>48</width>
  <height>48</height>
  <uuid>{9c0d646d-e478-43dd-ac37-1202ff41e3b2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>P06</objectName>
  <x>241</x>
  <y>910</y>
  <width>48</width>
  <height>48</height>
  <uuid>{c97f9822-db02-49a5-98b9-c6a4ec017f02}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>P07</objectName>
  <x>276</x>
  <y>910</y>
  <width>48</width>
  <height>48</height>
  <uuid>{3fc727de-0a77-441d-a0ab-53261449821b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>P08</objectName>
  <x>311</x>
  <y>910</y>
  <width>48</width>
  <height>48</height>
  <uuid>{ce51a37a-5c8e-45a0-8a26-5e353f344f8b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.24000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>P09</objectName>
  <x>346</x>
  <y>910</y>
  <width>48</width>
  <height>48</height>
  <uuid>{d1ef282d-02c5-46e2-945a-0aab5c198f57}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.27000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>P10</objectName>
  <x>381</x>
  <y>910</y>
  <width>48</width>
  <height>48</height>
  <uuid>{6d773293-855c-45c2-bd1d-a5adeac378e6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.32000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>P11</objectName>
  <x>416</x>
  <y>910</y>
  <width>48</width>
  <height>48</height>
  <uuid>{4575437a-3efb-43bd-b74a-7cca0f847c86}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.76000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>P12</objectName>
  <x>451</x>
  <y>910</y>
  <width>48</width>
  <height>48</height>
  <uuid>{f854cfa7-79b6-444c-b0b3-729c52552df9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.74000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>P13</objectName>
  <x>486</x>
  <y>910</y>
  <width>48</width>
  <height>48</height>
  <uuid>{bc5efd76-4054-44a6-ad15-9ccda7f888be}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.19000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>P14</objectName>
  <x>521</x>
  <y>910</y>
  <width>48</width>
  <height>48</height>
  <uuid>{b952638a-fcd4-44ab-8536-3a7f79ce9656}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.73000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>P15</objectName>
  <x>556</x>
  <y>910</y>
  <width>48</width>
  <height>48</height>
  <uuid>{32753533-85d9-4077-a8bd-b6f657b7a801}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>P16</objectName>
  <x>591</x>
  <y>910</y>
  <width>48</width>
  <height>48</height>
  <uuid>{827294cb-f0c5-497e-8fbd-c1dc13b22924}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>led6</objectName>
  <x>253</x>
  <y>957</y>
  <width>22</width>
  <height>23</height>
  <uuid>{939852d0-589b-4c33-9517-2ec5fa82b154}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>led6</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>184</g>
   <b>7</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>led7</objectName>
  <x>288</x>
  <y>957</y>
  <width>22</width>
  <height>23</height>
  <uuid>{4f895cb5-8f31-473e-a6e1-67516f363f6f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>led7</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>184</g>
   <b>7</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>led8</objectName>
  <x>323</x>
  <y>957</y>
  <width>22</width>
  <height>23</height>
  <uuid>{e0a42aaf-92de-45f2-9d4f-c2647b8f1234}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>led8</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>184</g>
   <b>7</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>led9</objectName>
  <x>358</x>
  <y>957</y>
  <width>22</width>
  <height>23</height>
  <uuid>{599df71c-e70e-4f39-971d-a13ac05f3886}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>led9</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>184</g>
   <b>7</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>led10</objectName>
  <x>393</x>
  <y>957</y>
  <width>22</width>
  <height>23</height>
  <uuid>{2b8dd89f-509c-4ada-ab2e-2f09b44fd018}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>led10</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>184</g>
   <b>7</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>led11</objectName>
  <x>427</x>
  <y>957</y>
  <width>22</width>
  <height>23</height>
  <uuid>{018a0ede-d08f-4b5c-9c22-762cbb7b367a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>led11</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>184</g>
   <b>7</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>led12</objectName>
  <x>462</x>
  <y>957</y>
  <width>22</width>
  <height>23</height>
  <uuid>{72fdf7f0-d1cd-48af-9906-a6559029b273}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>led12</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>184</g>
   <b>7</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>led13</objectName>
  <x>497</x>
  <y>957</y>
  <width>22</width>
  <height>23</height>
  <uuid>{24318f3c-e9bd-47c9-b985-115d5d183132}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>led13</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>1.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>184</g>
   <b>7</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>led14</objectName>
  <x>533</x>
  <y>957</y>
  <width>22</width>
  <height>23</height>
  <uuid>{25ae34cb-37e7-484a-94e1-86bed7ee4658}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>led14</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>184</g>
   <b>7</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>led15</objectName>
  <x>568</x>
  <y>957</y>
  <width>22</width>
  <height>23</height>
  <uuid>{8173748a-0c09-4ee7-b163-7621800f37da}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>led15</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>184</g>
   <b>7</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>led16</objectName>
  <x>603</x>
  <y>957</y>
  <width>22</width>
  <height>23</height>
  <uuid>{0f389003-1f2f-4bb5-95ad-33e2e829bed0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>led16</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>184</g>
   <b>7</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>left</objectName>
  <x>9</x>
  <y>980</y>
  <width>1465</width>
  <height>35</height>
  <uuid>{e743e78f-e3f1-4f40-b3ca-b17fb031a941}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>left</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>1.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>128</r>
   <g>64</g>
   <b>0</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>atck</objectName>
  <x>786</x>
  <y>721</y>
  <width>48</width>
  <height>48</height>
  <uuid>{cbdf92b6-c831-4391-a433-daa402709483}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00350000</minimum>
  <maximum>0.05000000</maximum>
  <value>0.01650000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.00100000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>dec</objectName>
  <x>903</x>
  <y>721</y>
  <width>48</width>
  <height>48</height>
  <uuid>{d026f540-dade-4e88-ab34-13eaa9052c9d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00400000</minimum>
  <maximum>0.03000000</maximum>
  <value>0.00400000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.00100000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>on</objectName>
  <x>844</x>
  <y>721</y>
  <width>48</width>
  <height>48</height>
  <uuid>{0682639c-aa5b-47cf-81c6-e516769b26b5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.67000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>765</x>
  <y>666</y>
  <width>129</width>
  <height>24</height>
  <uuid>{f3b7abaa-71d9-475d-aebf-9583568afe3b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>SEQUENCER CONTROLS</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>vel</objectName>
  <x>786</x>
  <y>815</y>
  <width>50</width>
  <height>50</height>
  <uuid>{9d13c310-5f42-4892-835d-1e879f0f97d0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.12500000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.63000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.00500000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>789</x>
  <y>795</y>
  <width>50</width>
  <height>30</height>
  <uuid>{9a7fdd98-44d0-411c-a74f-3f7498421134}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>SPEEDed</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
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
  <objectName>atck</objectName>
  <x>791</x>
  <y>762</y>
  <width>40</width>
  <height>24</height>
  <uuid>{cb5ee6fb-828c-458f-8113-a8c53f562991}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>on</objectName>
  <x>849</x>
  <y>762</y>
  <width>38</width>
  <height>24</height>
  <uuid>{0df5a49b-e492-4858-9ea0-040d7759dc66}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>dec</objectName>
  <x>909</x>
  <y>762</y>
  <width>38</width>
  <height>24</height>
  <uuid>{d433cddf-f4df-4023-924d-8431e6381c5a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>time</objectName>
  <x>911</x>
  <y>857</y>
  <width>38</width>
  <height>24</height>
  <uuid>{7cc04b85-02d8-458f-a6f2-29fc95b1374f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>913</x>
  <y>892</y>
  <width>83</width>
  <height>44</height>
  <uuid>{df75495d-6b86-4bb3-a083-3839b21194fc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Cutoff</text>
  <image>/</image>
  <eventLine>i  102  0  0.5</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>cutref</objectName>
  <x>931</x>
  <y>920</y>
  <width>48</width>
  <height>48</height>
  <uuid>{3dbf8a3a-f568-4290-a5c2-dcb72a2c3875}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.01000000</minimum>
  <maximum>0.50000000</maximum>
  <value>0.23000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>990</x>
  <y>891</y>
  <width>86</width>
  <height>43</height>
  <uuid>{a2cfb028-c0bf-4faf-8910-bb58fb9598d3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Pan</text>
  <image>/</image>
  <eventLine>i  103  0  0.1</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>panrange</objectName>
  <x>1010</x>
  <y>921</y>
  <width>48</width>
  <height>48</height>
  <uuid>{c79fdfe1-1485-4974-8278-083f509a0ad2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.36000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>638</x>
  <y>794</y>
  <width>36</width>
  <height>24</height>
  <uuid>{acd7c8b2-f881-4b6c-a0c7-5e31fba1429b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Pitch</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
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
  <x>638</x>
  <y>848</y>
  <width>30</width>
  <height>24</height>
  <uuid>{d574a1a5-7be6-43ba-8536-ce3c9d24154f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Lev</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
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
  <x>638</x>
  <y>884</y>
  <width>34</width>
  <height>26</height>
  <uuid>{efd261a6-2c47-4ede-b12a-a966e18a871a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Cut</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
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
  <x>638</x>
  <y>927</y>
  <width>30</width>
  <height>24</height>
  <uuid>{edf4d86d-d739-43ed-b034-a5350203b9e8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Pan</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
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
  <objectName>s01</objectName>
  <x>77</x>
  <y>816</y>
  <width>26</width>
  <height>24</height>
  <uuid>{2c66f83b-2d43-4d66-b352-3e7ca0e717ec}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>s02</objectName>
  <x>111</x>
  <y>816</y>
  <width>26</width>
  <height>24</height>
  <uuid>{60a19af2-00bb-4128-995a-9ee821a0baea}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>s03</objectName>
  <x>147</x>
  <y>816</y>
  <width>26</width>
  <height>24</height>
  <uuid>{0fbb553d-294a-41c9-9378-c680fb48d64d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>s04</objectName>
  <x>181</x>
  <y>817</y>
  <width>26</width>
  <height>24</height>
  <uuid>{89f36169-7567-4571-986e-4cb263914978}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>s05</objectName>
  <x>217</x>
  <y>817</y>
  <width>26</width>
  <height>24</height>
  <uuid>{59e9e7a2-fba1-4779-99f2-ed8eb596977a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>s06</objectName>
  <x>253</x>
  <y>817</y>
  <width>26</width>
  <height>24</height>
  <uuid>{40b27c67-a67b-4ed9-a9fa-583b06a07b03}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>770</x>
  <y>884</y>
  <width>129</width>
  <height>13</height>
  <uuid>{b0d5c94d-94e5-4486-97a1-8c27e498503c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.00854700</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>891</x>
  <y>878</y>
  <width>96</width>
  <height>32</height>
  <uuid>{6f0650f0-d397-40c7-83f0-2330687f8e17}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Randomize</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
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
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>968</x>
  <y>883</y>
  <width>177</width>
  <height>13</height>
  <uuid>{b923f9c8-7789-4777-ae1a-db77517c67e0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>-0.01818200</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>s07</objectName>
  <x>286</x>
  <y>817</y>
  <width>26</width>
  <height>24</height>
  <uuid>{fbcb6ece-3b25-4c7e-9cb9-a9364f7d6fd2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>s08</objectName>
  <x>321</x>
  <y>817</y>
  <width>26</width>
  <height>24</height>
  <uuid>{acae0370-0d7d-4b69-8d49-5146abf357e7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>s09</objectName>
  <x>357</x>
  <y>817</y>
  <width>26</width>
  <height>24</height>
  <uuid>{a61e5d87-b0de-435c-a183-480338343350}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>s10</objectName>
  <x>392</x>
  <y>817</y>
  <width>26</width>
  <height>24</height>
  <uuid>{ce0a4a5c-b749-4767-a135-e720e1389146}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>s11</objectName>
  <x>427</x>
  <y>817</y>
  <width>26</width>
  <height>24</height>
  <uuid>{abe85754-1f94-4d05-9870-520ff914f87b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>s12</objectName>
  <x>462</x>
  <y>817</y>
  <width>26</width>
  <height>24</height>
  <uuid>{1491c5f3-4def-4306-a12a-21bc5c06cb4a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>s13</objectName>
  <x>497</x>
  <y>817</y>
  <width>26</width>
  <height>24</height>
  <uuid>{513d1a28-5a75-475e-ac7f-d99869b800aa}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>s14</objectName>
  <x>531</x>
  <y>817</y>
  <width>26</width>
  <height>24</height>
  <uuid>{58143ea4-b56e-4508-b85e-5c4a5e3c1914}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>s15</objectName>
  <x>567</x>
  <y>817</y>
  <width>26</width>
  <height>24</height>
  <uuid>{f4e79fe0-d14e-48c8-bbcf-199a76dd3271}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>s16</objectName>
  <x>602</x>
  <y>817</y>
  <width>26</width>
  <height>24</height>
  <uuid>{fe1aa30f-381a-4a19-8dcc-c4cf1369dc91}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>916</x>
  <y>948</y>
  <width>80</width>
  <height>40</height>
  <uuid>{eb847d28-1f84-4de8-8d68-5eb38e77fb43}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Reset</text>
  <image>/</image>
  <eventLine>i113 0 0.1</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>994</x>
  <y>949</y>
  <width>80</width>
  <height>40</height>
  <uuid>{debfb211-2b71-45bf-8627-666210ee3ee8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Reset</text>
  <image>/</image>
  <eventLine>i114 0 0.1</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>935</x>
  <y>836</y>
  <width>41</width>
  <height>13</height>
  <uuid>{f0d60ea5-05c6-422f-a039-da284e051b88}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>-0.01818200</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>noiselev</objectName>
  <x>851</x>
  <y>548</y>
  <width>48</width>
  <height>48</height>
  <uuid>{9801be4d-4072-4612-8b06-a38efcd20f25}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.04000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>noisecolor</objectName>
  <x>782</x>
  <y>548</y>
  <width>48</width>
  <height>48</height>
  <uuid>{fddd5428-b3ec-49f9-8863-99e1e4eb1693}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>-10.00000000</minimum>
  <maximum>10.00000000</maximum>
  <value>-10.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.50000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>seq</objectName>
  <x>1072</x>
  <y>724</y>
  <width>20</width>
  <height>18</height>
  <uuid>{b716500a-5e90-448d-8bbd-32f2ae501e2e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>seq</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>982</x>
  <y>727</y>
  <width>33</width>
  <height>13</height>
  <uuid>{68bf4e78-a617-4384-8128-abbd1b421bc5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.00854700</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>995</x>
  <y>729</y>
  <width>13</width>
  <height>31</height>
  <uuid>{c70f1d24-7102-4fff-88b3-5a101b1197c8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.00854700</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>synth</objectName>
  <x>1072</x>
  <y>746</y>
  <width>20</width>
  <height>18</height>
  <uuid>{984bbb28-0aa5-473c-ab06-64db22e8cc58}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>synth</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>1.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>frwd</objectName>
  <x>1073</x>
  <y>779</y>
  <width>20</width>
  <height>18</height>
  <uuid>{3a3a30ae-3e5f-42bc-b4da-976ae88087a7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>frwd</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>1.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>rvrs</objectName>
  <x>990</x>
  <y>778</y>
  <width>20</width>
  <height>18</height>
  <uuid>{f2312b30-74a4-4e74-b24c-8ce585801ce4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>rvrs</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>in_1</objectName>
  <x>960</x>
  <y>582</y>
  <width>15</width>
  <height>63</height>
  <uuid>{c8dfd4bc-302a-47a3-ae8b-264d0b6fa352}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>in_1</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000834</xValue>
  <yValue>0.00000834</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>128</g>
   <b>0</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>in_2</objectName>
  <x>974</x>
  <y>582</y>
  <width>15</width>
  <height>63</height>
  <uuid>{4d084c7e-5f4c-4469-9d40-8a8e8c0c1922}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>in_2</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00001371</xValue>
  <yValue>0.00001371</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>128</g>
   <b>0</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>shape2</objectName>
  <x>859</x>
  <y>291</y>
  <width>42</width>
  <height>24</height>
  <uuid>{52d3a41e-66b2-4385-bb8c-16f90af3a260}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>shape3</objectName>
  <x>859</x>
  <y>431</y>
  <width>42</width>
  <height>24</height>
  <uuid>{76496a7e-07c4-4da1-84fb-63452010ee1d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>shape1</objectName>
  <x>855</x>
  <y>146</y>
  <width>42</width>
  <height>24</height>
  <uuid>{b60c1b05-2e71-40d7-a27d-8e923a388900}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <x>1217</x>
  <y>146</y>
  <width>29</width>
  <height>24</height>
  <uuid>{e145b02d-a72a-4c64-bfea-bbd8a756cd26}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Hz</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
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
  <objectName>rmlev</objectName>
  <x>1077</x>
  <y>147</y>
  <width>44</width>
  <height>24</height>
  <uuid>{8ca0ffa4-601a-450f-a1be-e1040a612964}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>fillev</objectName>
  <x>1352</x>
  <y>148</y>
  <width>44</width>
  <height>24</height>
  <uuid>{d317ef90-feb2-442c-9c9e-4c227a9a56b7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <x>813</x>
  <y>244</y>
  <width>31</width>
  <height>27</height>
  <uuid>{97cf9b76-eedc-464d-aeb1-c7beb772e15c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Hz</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
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
  <objectName>lsine1</objectName>
  <x>923</x>
  <y>148</y>
  <width>39</width>
  <height>24</height>
  <uuid>{659382e3-745f-4916-8319-077d8007b52f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>lramp1</objectName>
  <x>985</x>
  <y>148</y>
  <width>39</width>
  <height>24</height>
  <uuid>{c4dcdfd8-d008-4b5d-a1ea-c7c974c7a99f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>lramp2</objectName>
  <x>989</x>
  <y>295</y>
  <width>39</width>
  <height>24</height>
  <uuid>{ce83797f-5dee-49c6-b106-163c49621c15}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <x>814</x>
  <y>385</y>
  <width>31</width>
  <height>27</height>
  <uuid>{a27dffef-7a87-47d2-99b5-1de1ba671972}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Hz</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>13</fontsize>
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
  <objectName>lsquare3</objectName>
  <x>927</x>
  <y>433</y>
  <width>39</width>
  <height>24</height>
  <uuid>{22a34c93-0ce6-4517-9644-e19e3cb17a73}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>lramp3</objectName>
  <x>988</x>
  <y>433</y>
  <width>39</width>
  <height>24</height>
  <uuid>{82f4e480-09d0-4e65-a1b0-38310b93e595}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>wetdry</objectName>
  <x>1070</x>
  <y>433</y>
  <width>39</width>
  <height>24</height>
  <uuid>{df0350ca-cd5c-401f-8b0c-385fbc471e0a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>revlev</objectName>
  <x>1168</x>
  <y>433</y>
  <width>39</width>
  <height>24</height>
  <uuid>{0ed0c864-950f-4c22-be15-45c701647743}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>traplev</objectName>
  <x>1267</x>
  <y>433</y>
  <width>39</width>
  <height>24</height>
  <uuid>{cb40233d-d968-4f59-8589-022b741cc3b9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>signal</objectName>
  <x>1356</x>
  <y>433</y>
  <width>39</width>
  <height>24</height>
  <uuid>{b6ac5abb-6793-4112-94e9-d8b46383d7f6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>attack</objectName>
  <x>1067</x>
  <y>295</y>
  <width>39</width>
  <height>24</height>
  <uuid>{9e2cacd0-cc25-4b4b-97d6-90328fffacdf}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <x>1099</x>
  <y>293</y>
  <width>39</width>
  <height>35</height>
  <uuid>{c9a24f0b-3adc-44e7-a499-c7d66004bd3b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>sec</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>13</fontsize>
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
  <x>1195</x>
  <y>293</y>
  <width>39</width>
  <height>35</height>
  <uuid>{194a7968-b4b2-47c5-bd38-722801480714}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>sec</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>13</fontsize>
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
  <objectName>eon</objectName>
  <x>1161</x>
  <y>295</y>
  <width>45</width>
  <height>25</height>
  <uuid>{73c960a5-dfaf-4340-bbee-2f860cb07119}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>decay</objectName>
  <x>1258</x>
  <y>295</y>
  <width>39</width>
  <height>24</height>
  <uuid>{30e87377-d95a-41eb-ad5b-7851e6fa1ebf}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <x>1290</x>
  <y>293</y>
  <width>39</width>
  <height>35</height>
  <uuid>{18fd0115-4df7-4985-adbc-624379215e2e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>sec</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>13</fontsize>
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
  <objectName>noiselev</objectName>
  <x>856</x>
  <y>582</y>
  <width>39</width>
  <height>24</height>
  <uuid>{bf657f4b-1d67-4d30-b137-474063d36ebf}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>levin_1</objectName>
  <x>924</x>
  <y>582</y>
  <width>39</width>
  <height>24</height>
  <uuid>{3b703cd5-3b83-4fa1-88e4-2b08d0f20b9f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>levin_2</objectName>
  <x>985</x>
  <y>582</y>
  <width>39</width>
  <height>24</height>
  <uuid>{34ab4d25-f492-4de9-9eda-fb028c39b0b6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <x>1063</x>
  <y>618</y>
  <width>59</width>
  <height>24</height>
  <uuid>{55b31d1c-7c5b-403e-890b-b7f968e229cd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Mute CH1</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <x>1155</x>
  <y>619</y>
  <width>58</width>
  <height>24</height>
  <uuid>{0c6dda60-7a61-41da-9a77-5f3e2707f3f5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Mute CH2</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>filch1</objectName>
  <x>1067</x>
  <y>586</y>
  <width>40</width>
  <height>24</height>
  <uuid>{05589e75-2714-430c-9ae5-ac44f8b7c1b6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <x>1093</x>
  <y>586</y>
  <width>24</width>
  <height>24</height>
  <uuid>{8679220e-7278-407f-8df7-9adcb366d73b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>dB</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <x>1190</x>
  <y>586</y>
  <width>24</width>
  <height>24</height>
  <uuid>{45650ff4-8832-4c75-b7e6-66d1a7dae4f4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>dB</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>filch2</objectName>
  <x>1163</x>
  <y>586</y>
  <width>40</width>
  <height>24</height>
  <uuid>{e6dd46f9-aed8-4402-a2c8-9e9b5092693b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>off_pulse</objectName>
  <x>1350</x>
  <y>295</y>
  <width>39</width>
  <height>24</height>
  <uuid>{2b0ee0ee-9b4c-41ff-8cbf-be0ffceac19c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <x>1380</x>
  <y>293</y>
  <width>39</width>
  <height>35</height>
  <uuid>{5c3dcd92-91b6-4212-8940-4be4de9642c1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>sec</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>13</fontsize>
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
  <objectName>transpose</objectName>
  <x>758</x>
  <y>956</y>
  <width>98</width>
  <height>30</height>
  <uuid>{4f4cd016-a7a8-45fb-948d-9b6758547ed3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>octave-1 </name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>octave 0</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> octave+1</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>2</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>port</objectName>
  <x>1073</x>
  <y>829</y>
  <width>20</width>
  <height>18</height>
  <uuid>{fc43c1d8-9c24-4519-b4fc-f40743601211}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>port</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>914</x>
  <y>774</y>
  <width>29</width>
  <height>24</height>
  <uuid>{80e0b6b7-1c0b-41dc-b0c7-280cd06b8129}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>ms</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>13</fontsize>
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
  <x>797</x>
  <y>771</y>
  <width>29</width>
  <height>24</height>
  <uuid>{58965693-6b78-4764-8a76-ddd584b5813c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>ms</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>13</fontsize>
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
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>1146</x>
  <y>883</y>
  <width>297</width>
  <height>13</height>
  <uuid>{36da159d-0bd2-4bc7-9eba-16474714b8aa}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>-0.01818200</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>174</r>
   <g>209</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>836</x>
  <y>857</y>
  <width>69</width>
  <height>24</height>
  <uuid>{4408e4a8-70e4-4a46-a6b0-bb662dbf45e1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Oct. Hstep</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
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
 <bsbObject version="2" type="BSBKnob">
  <objectName>del</objectName>
  <x>1214</x>
  <y>928</y>
  <width>48</width>
  <height>48</height>
  <uuid>{f6e2db53-0861-4286-baa4-eb01009788d1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00100000</minimum>
  <maximum>0.01000000</maximum>
  <value>0.00400000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.00100000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>del</objectName>
  <x>1220</x>
  <y>963</y>
  <width>38</width>
  <height>24</height>
  <uuid>{f63cff1e-da8e-4975-b610-3c572ddaae3d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <x>1217</x>
  <y>917</y>
  <width>40</width>
  <height>24</height>
  <uuid>{7023204d-cecf-4fe1-a769-c5e87e702974}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Delay</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
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
 <bsbObject version="2" type="BSBKnob">
  <objectName>fdbk</objectName>
  <x>1285</x>
  <y>928</y>
  <width>48</width>
  <height>48</height>
  <uuid>{39e6cc83-ca04-44e1-be4a-6ec89534da0e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>0.90000000</maximum>
  <value>0.57000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>1288</x>
  <y>917</y>
  <width>40</width>
  <height>24</height>
  <uuid>{467612a4-f044-4d32-9f59-f810b0c30363}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Feeday</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
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
  <objectName>fdbk</objectName>
  <x>1291</x>
  <y>963</y>
  <width>38</width>
  <height>24</height>
  <uuid>{af9ece1c-356b-4ab2-a00e-339fd79ed71d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <objectName>flsw</objectName>
  <x>1157</x>
  <y>942</y>
  <width>30</width>
  <height>30</height>
  <uuid>{c4b4d031-3b70-4f5b-bb18-d642956a8544}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>rate</objectName>
  <x>1355</x>
  <y>928</y>
  <width>48</width>
  <height>48</height>
  <uuid>{1013dbc1-a3cd-400e-91a8-a43a5a182aad}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.01000000</minimum>
  <maximum>2.00000000</maximum>
  <value>0.35000100</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>1361</x>
  <y>917</y>
  <width>38</width>
  <height>24</height>
  <uuid>{24bb6c7c-8b3d-4938-9493-d64ce7ea2f15}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Rate</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
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
  <objectName>rate</objectName>
  <x>1361</x>
  <y>963</y>
  <width>38</width>
  <height>24</height>
  <uuid>{cfdcc70b-92d5-4f3c-81f3-6f6cd71d39b6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
 <bsbObject version="2" type="BSBController">
  <objectName>flsw</objectName>
  <x>1163</x>
  <y>927</y>
  <width>18</width>
  <height>17</height>
  <uuid>{5bf5639e-9e29-4f6d-947c-05d89e2c4651}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>flsw</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>1.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>0</g>
   <b>0</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>1260</x>
  <y>614</y>
  <width>32</width>
  <height>24</height>
  <uuid>{24577d38-9c54-4087-b271-9f5b46ba8c59}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>CH1</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
  <x>1286</x>
  <y>614</y>
  <width>31</width>
  <height>24</height>
  <uuid>{165a9fd8-ad0b-4919-9722-afa9e234a32d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>CH2</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>999</x>
  <y>749</y>
  <width>19</width>
  <height>13</height>
  <uuid>{82f4971f-c03b-4e68-bcec-7dc0796761c1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2/>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.00854700</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>1153</x>
  <y>891</y>
  <width>85</width>
  <height>24</height>
  <uuid>{8d2b94fa-2a46-45bb-9d1c-6881c94afe18}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>FLANGER</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>249</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="background">
   <r>13</r>
   <g>19</g>
   <b>4</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>frosc1</objectName>
  <x>781</x>
  <y>156</y>
  <width>41</width>
  <height>26</height>
  <uuid>{34b608aa-a40c-468d-8b97-159d1104228b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
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
  <objectName>frosc2</objectName>
  <x>781</x>
  <y>298</y>
  <width>41</width>
  <height>25</height>
  <uuid>{7c32c530-cfbb-42ac-86a3-9a53857672cb}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
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
  <objectName>frosc3</objectName>
  <x>782</x>
  <y>440</y>
  <width>41</width>
  <height>25</height>
  <uuid>{6f3c783e-2765-40f5-a16d-47af53b12e81}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
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
  <objectName>lsquare2</objectName>
  <x>929</x>
  <y>300</y>
  <width>39</width>
  <height>24</height>
  <uuid>{a5ffd78c-e590-4ad2-be2a-6d713c431db3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>11</fontsize>
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
 <bsbObject version="2" type="BSBController">
  <objectName>ledseq</objectName>
  <x>709</x>
  <y>761</y>
  <width>17</width>
  <height>18</height>
  <uuid>{b309c546-a687-4a37-8669-4eb00839b2f2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>ledseq</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>1.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>0</g>
   <b>0</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>notebar</objectName>
  <x>679</x>
  <y>795</y>
  <width>31</width>
  <height>26</height>
  <uuid>{91fa1241-8153-4f8c-882e-fca42bfa7e55}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>128</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>204</r>
   <g>255</g>
   <b>102</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBHSlider">
  <objectName>nnote</objectName>
  <x>69</x>
  <y>766</y>
  <width>562</width>
  <height>34</height>
  <uuid>{8de31ad6-8dd9-4fc4-8656-6ac701f2ba38}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>1.00000000</minimum>
  <maximum>16.00000000</maximum>
  <value>16.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>incr</objectName>
  <x>679</x>
  <y>940</y>
  <width>52</width>
  <height>24</height>
  <uuid>{34031258-e8ac-44bb-bbff-51d66e7a81ae}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
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
 <bsbObject version="2" type="BSBKnob">
  <objectName>incr</objectName>
  <x>675</x>
  <y>905</y>
  <width>48</width>
  <height>48</height>
  <uuid>{9af5bdf8-7d9c-4b21-a249-e3c96d42c927}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.10000000</minimum>
  <maximum>4.00000000</maximum>
  <value>1.19999800</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>dispindex</objectName>
  <x>845</x>
  <y>793</y>
  <width>48</width>
  <height>25</height>
  <uuid>{e34ed581-4aed-4752-a676-c71ac6869563}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>128</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>204</r>
   <g>255</g>
   <b>102</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>848</x>
  <y>813</y>
  <width>39</width>
  <height>24</height>
  <uuid>{6c2acbc7-e92c-4eda-aed2-ff588460fbba}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Index</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
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
  <x>680</x>
  <y>890</y>
  <width>39</width>
  <height>24</height>
  <uuid>{6d747594-0166-45b4-95f4-b0a5e54bdd75}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Incr</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
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
  <x>662</x>
  <y>821</y>
  <width>63</width>
  <height>32</height>
  <uuid>{028363a7-787e-4c93-b9d0-9adb112020b3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>#Events</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
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
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>926</x>
  <y>93</y>
  <width>40</width>
  <height>40</height>
  <uuid>{1076d30f-efc3-498d-9843-62582d614fc1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>pict</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Button</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>991</x>
  <y>93</y>
  <width>40</width>
  <height>40</height>
  <uuid>{e8186459-2b43-4263-822b-3af7f7308ad8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>pict</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Button</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>927</x>
  <y>240</y>
  <width>40</width>
  <height>40</height>
  <uuid>{3c18a3f7-f45c-4763-b53d-d5e791b51f36}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>pict</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Button</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>990</x>
  <y>240</y>
  <width>40</width>
  <height>40</height>
  <uuid>{4cecd855-1850-4e8d-8ffe-51be530eb811}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>pict</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Button</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>830</x>
  <y>293</y>
  <width>40</width>
  <height>40</height>
  <uuid>{f6b695c8-4e04-469f-85c3-eba344887821}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>pict</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Button</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>890</x>
  <y>293</y>
  <width>40</width>
  <height>40</height>
  <uuid>{3476db6e-7eda-4045-98bd-82e776072a8d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>pict</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Button</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>117</x>
  <y>147</y>
  <width>40</width>
  <height>40</height>
  <uuid>{c52fc0a1-908f-47b4-84ae-666fe8d9180e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>pict</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Button</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>117</x>
  <y>176</y>
  <width>40</width>
  <height>39</height>
  <uuid>{a335ab62-28dc-456e-b4ab-5835f3bf40f6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>pict</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Button</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>118</x>
  <y>216</y>
  <width>40</width>
  <height>39</height>
  <uuid>{90a857a3-8abc-4385-90be-5d8539d97751}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>pict</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Button</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>118</x>
  <y>248</y>
  <width>40</width>
  <height>40</height>
  <uuid>{57a0364f-fc34-425b-aeb4-cfe159851639}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>pict</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Button</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>118</x>
  <y>284</y>
  <width>40</width>
  <height>40</height>
  <uuid>{0d5ba07e-5829-4076-969e-2dee2466f8e7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>pict</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Button</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>118</x>
  <y>314</y>
  <width>40</width>
  <height>40</height>
  <uuid>{db8c3c30-2f18-4602-9f83-b2ad5e96b42f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>pict</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Button</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>656</x>
  <y>853</y>
  <width>82</width>
  <height>41</height>
  <uuid>{aee44a7b-1920-4185-8356-f5db8672d4a2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>SET = 1</text>
  <image>/</image>
  <eventLine>i9990 0 0.1</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>shift</objectName>
  <x>37</x>
  <y>808</y>
  <width>34</width>
  <height>169</height>
  <uuid>{1d94aad3-66dd-4c04-b3da-f944156c426b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>0.12000000</maximum>
  <value>0.04608000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>924</x>
  <y>379</y>
  <width>40</width>
  <height>40</height>
  <uuid>{fb5d1fe0-affc-41d0-9b37-b1f53d5898a0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>pict</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Button</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>987</x>
  <y>379</y>
  <width>40</width>
  <height>40</height>
  <uuid>{6cef86e9-b1e1-4fea-80bd-17b702bf8a39}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>pict</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Button</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>832</x>
  <y>437</y>
  <width>40</width>
  <height>40</height>
  <uuid>{ef3e34a6-b13e-4d8c-9b9c-38c3a2e28ff4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>pict</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Button</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>892</x>
  <y>437</y>
  <width>40</width>
  <height>40</height>
  <uuid>{09551d4d-a78d-4301-87d5-bc5fe877bdd1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>pict</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Button</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>832</x>
  <y>147</y>
  <width>40</width>
  <height>40</height>
  <uuid>{c405903a-a1d4-4bba-ae8c-58b0cd9010d0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>pict</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Button</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName/>
  <x>892</x>
  <y>147</y>
  <width>40</width>
  <height>40</height>
  <uuid>{9726d380-e941-4088-a11b-63042a03ee88}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>pict</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Button</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
<MacOptions>
Version: 3
Render: Real
Ask: Yes
SFDIR: /Users/alessandropetrolati/Desktop/VCS3 MacCsound OK
Functions: Window
Listing: Window
WindowBounds: 2 46 1438 896
CurrentView: io
IOViewEdit: Off
Options: -b1024 -A  -s -m32 -K -R -B4096 
</MacOptions>
<MacGUI>
ioView background {43690, 43690, 43690}
ioText {29, 146} {50, 48} label 0.000000 0.00100 "" center "Lucida Grande" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder OSC  1
ioCheckbox {197, 146} {33, 35} off k01-02
ioCheckbox {229, 146} {33, 35} on k01-03
ioCheckbox {261, 146} {33, 35} off k01-04
ioCheckbox {293, 146} {33, 35} off k01-05
ioCheckbox {325, 146} {33, 35} off k01-06
ioCheckbox {357, 146} {33, 35} off k01-07
ioCheckbox {389, 146} {33, 35} off k01-08
ioCheckbox {421, 146} {33, 35} off k01-09
ioCheckbox {453, 146} {33, 35} off k01-10
ioCheckbox {485, 146} {33, 35} off k01-11
ioCheckbox {517, 146} {33, 35} off k01-12
ioCheckbox {581, 146} {33, 35} off k01-14
ioCheckbox {613, 146} {33, 35} off k01-15
ioCheckbox {165, 180} {33, 35} off k02-01
ioCheckbox {197, 180} {33, 35} on k02-02
ioCheckbox {229, 180} {33, 35} off k02-03
ioCheckbox {261, 180} {33, 35} off k02-04
ioCheckbox {293, 180} {33, 35} off k02-05
ioCheckbox {325, 180} {33, 35} off k02-06
ioCheckbox {357, 180} {33, 35} off k02-07
ioCheckbox {389, 180} {33, 35} off k02-08
ioCheckbox {421, 180} {33, 35} off k02-09
ioCheckbox {453, 180} {33, 35} off k02-10
ioCheckbox {485, 180} {33, 35} off k02-11
ioCheckbox {517, 180} {33, 35} off k01-12
ioCheckbox {549, 180} {33, 35} off k02-13
ioCheckbox {581, 180} {33, 35} off k02-14
ioCheckbox {613, 180} {33, 35} off k02-15
ioCheckbox {645, 180} {33, 35} off k02-16
ioCheckbox {165, 214} {33, 35} off k03-01
ioCheckbox {197, 214} {33, 35} on k03-02
ioCheckbox {229, 214} {33, 35} on k03-03
ioCheckbox {261, 214} {33, 35} off k03-04
ioCheckbox {293, 214} {33, 35} off k03-05
ioCheckbox {325, 214} {33, 35} off k03-06
ioCheckbox {357, 214} {33, 35} off k03-07
ioCheckbox {389, 214} {33, 35} off k03-08
ioCheckbox {165, 248} {33, 35} off k04-01
ioCheckbox {197, 248} {33, 35} off k04-02
ioCheckbox {229, 248} {33, 35} off k04-03
ioCheckbox {261, 248} {33, 35} off k04-04
ioCheckbox {293, 248} {33, 35} off k04-05
ioCheckbox {325, 248} {33, 35} off k04-06
ioCheckbox {357, 248} {33, 35} off k04-07
ioCheckbox {389, 248} {33, 35} off k04-08
ioCheckbox {421, 214} {33, 35} off k03-09
ioCheckbox {421, 248} {33, 35} off k04-09
ioCheckbox {453, 214} {33, 35} off k03-10
ioCheckbox {485, 214} {33, 35} off k03-11
ioCheckbox {453, 248} {33, 35} off k04-10
ioCheckbox {485, 248} {33, 35} off k04-11
ioCheckbox {517, 214} {33, 35} off k03-12
ioCheckbox {517, 248} {33, 35} off k04-12
ioCheckbox {549, 214} {33, 35} off k03-13
ioCheckbox {581, 214} {33, 35} off k03-14
ioCheckbox {549, 248} {33, 35} off k04-13
ioCheckbox {581, 248} {33, 35} off k04-14
ioCheckbox {613, 214} {33, 35} off k03-15
ioCheckbox {613, 248} {33, 35} off k04-15
ioCheckbox {645, 214} {33, 35} off k03-16
ioCheckbox {645, 248} {33, 35} off k04-16
ioCheckbox {165, 282} {33, 35} off k05-01
ioCheckbox {165, 316} {33, 35} off k06-01
ioCheckbox {197, 282} {33, 35} off k05-02
ioCheckbox {197, 316} {33, 35} off k06-02
ioCheckbox {229, 282} {33, 35} off k05-03
ioCheckbox {229, 316} {33, 35} off k06-03
ioCheckbox {165, 350} {33, 35} off k07-01
ioCheckbox {167, 147} {30, 33} off k01-01
ioCheckbox {229, 350} {33, 35} off k07-03
ioCheckbox {261, 282} {33, 35} off k05-04
ioCheckbox {293, 282} {33, 35} off k05-05
ioCheckbox {261, 316} {33, 35} off k06-04
ioCheckbox {293, 316} {33, 35} off k06-05
ioCheckbox {261, 350} {33, 35} off k07-04
ioCheckbox {293, 350} {33, 35} off 
ioCheckbox {325, 282} {33, 35} off k05-06
ioCheckbox {357, 282} {33, 35} off k05-07
ioCheckbox {325, 316} {33, 35} off k06-06
ioCheckbox {357, 316} {33, 35} off k06-07
ioCheckbox {325, 350} {33, 35} off 
ioCheckbox {357, 350} {33, 35} off k07-07
ioCheckbox {389, 282} {33, 35} off k05-08
ioCheckbox {421, 282} {33, 35} off k05-09
ioCheckbox {389, 316} {33, 35} off k06-08
ioCheckbox {421, 316} {33, 35} off k06-09
ioCheckbox {389, 350} {33, 35} off k07-08
ioCheckbox {165, 384} {33, 35} off 
ioCheckbox {198, 384} {33, 35} off k08-02
ioCheckbox {229, 384} {33, 35} off k08-03
ioCheckbox {261, 384} {33, 35} off k08-04
ioCheckbox {293, 384} {33, 35} off k08-05
ioCheckbox {325, 384} {33, 35} off k08-06
ioCheckbox {357, 384} {33, 35} off k08-07
ioCheckbox {389, 384} {33, 35} off k08-08
ioCheckbox {421, 350} {33, 35} off 
ioCheckbox {421, 384} {33, 35} off 
ioCheckbox {453, 282} {33, 35} off k05-10
ioCheckbox {485, 282} {33, 35} off k05-11
ioCheckbox {517, 282} {33, 35} off k05-12
ioCheckbox {453, 316} {33, 35} off k06-10
ioCheckbox {485, 316} {33, 35} off k06-11
ioCheckbox {517, 316} {33, 35} off k06-12
ioCheckbox {453, 350} {33, 35} off 
ioCheckbox {485, 350} {33, 35} off 
ioCheckbox {453, 384} {33, 35} off 
ioCheckbox {485, 384} {33, 35} off 
ioCheckbox {517, 350} {33, 35} off 
ioCheckbox {517, 384} {33, 35} off 
ioCheckbox {549, 282} {33, 35} off k05-13
ioCheckbox {581, 282} {33, 35} off k05-14
ioCheckbox {549, 316} {33, 35} off k06-13
ioCheckbox {581, 316} {33, 35} off k06-14
ioCheckbox {549, 350} {33, 35} off 
ioCheckbox {581, 350} {33, 35} off 
ioCheckbox {549, 384} {33, 35} off 
ioCheckbox {581, 384} {33, 35} off 
ioCheckbox {613, 282} {33, 35} off k05-15
ioCheckbox {613, 316} {33, 35} off k06-15
ioCheckbox {613, 350} {33, 35} off 
ioCheckbox {613, 384} {33, 35} off 
ioCheckbox {645, 282} {33, 35} off k05-16
ioCheckbox {645, 316} {33, 35} off k06-16
ioCheckbox {645, 350} {33, 35} off 
ioCheckbox {645, 384} {33, 35} off 
ioCheckbox {165, 418} {33, 35} off 
ioCheckbox {197, 418} {33, 35} off k09-02
ioCheckbox {229, 418} {33, 35} off k09-03
ioCheckbox {165, 452} {33, 35} off 
ioCheckbox {197, 452} {33, 35} off k10-02
ioCheckbox {229, 452} {33, 35} off k10-03
ioCheckbox {261, 418} {33, 35} off k09-04
ioCheckbox {261, 452} {33, 35} off k10-04
ioCheckbox {293, 418} {33, 35} off k09-05
ioCheckbox {325, 418} {33, 35} off k09-06
ioCheckbox {357, 418} {33, 35} off k09-07
ioCheckbox {293, 452} {33, 35} off k10-05
ioCheckbox {325, 452} {33, 35} off k10-06
ioCheckbox {357, 452} {33, 35} off 
ioCheckbox {165, 486} {33, 35} off 
ioCheckbox {197, 486} {33, 35} off k11-02
ioCheckbox {229, 486} {33, 35} off 
ioCheckbox {261, 486} {33, 35} off 
ioCheckbox {293, 486} {33, 35} off 
ioCheckbox {325, 486} {33, 35} off 
ioCheckbox {357, 486} {33, 35} off 
ioCheckbox {389, 418} {33, 35} off k09-08
ioCheckbox {421, 418} {33, 35} off 
ioCheckbox {453, 418} {33, 35} off 
ioCheckbox {485, 418} {33, 35} off 
ioCheckbox {389, 452} {33, 35} off k10-08
ioCheckbox {421, 452} {33, 35} off 
ioCheckbox {453, 452} {33, 35} off 
ioCheckbox {485, 452} {33, 35} off 
ioCheckbox {389, 486} {33, 35} off 
ioCheckbox {165, 520} {33, 35} off 
ioCheckbox {197, 520} {33, 35} off k12-02
ioCheckbox {229, 520} {33, 35} off k12-03
ioCheckbox {261, 520} {33, 35} off 
ioCheckbox {293, 520} {33, 35} off 
ioCheckbox {325, 520} {33, 35} off 
ioCheckbox {357, 520} {33, 35} off k12-07
ioCheckbox {389, 520} {33, 35} off k12-08
ioCheckbox {421, 486} {33, 35} off k11-09
ioCheckbox {421, 520} {33, 35} off 
ioCheckbox {453, 486} {33, 35} off k11-10
ioCheckbox {485, 486} {33, 35} off k11-11
ioCheckbox {453, 520} {33, 35} off 
ioCheckbox {485, 520} {33, 35} off 
ioCheckbox {165, 554} {33, 35} off 
ioCheckbox {197, 554} {33, 35} off k13-02
ioCheckbox {229, 554} {33, 35} off k13-03
ioCheckbox {261, 554} {33, 35} off k13-04
ioCheckbox {293, 554} {33, 35} off 
ioCheckbox {325, 554} {33, 35} off 
ioCheckbox {357, 554} {33, 35} off k13-07
ioCheckbox {389, 554} {33, 35} off k13-08
ioCheckbox {421, 554} {33, 35} off 
ioCheckbox {453, 554} {33, 35} off 
ioCheckbox {485, 554} {33, 35} off 
ioCheckbox {517, 418} {33, 35} off 
ioCheckbox {549, 418} {33, 35} off 
ioCheckbox {581, 418} {33, 35} off 
ioCheckbox {613, 418} {33, 35} off 
ioCheckbox {517, 452} {33, 35} off 
ioCheckbox {549, 452} {33, 35} off 
ioCheckbox {581, 452} {33, 35} off 
ioCheckbox {613, 452} {33, 35} off 
ioCheckbox {517, 486} {33, 35} off 
ioCheckbox {517, 520} {33, 35} off 
ioCheckbox {549, 486} {33, 35} off 
ioCheckbox {581, 486} {33, 35} off k11-14
ioCheckbox {549, 520} {33, 35} off 
ioCheckbox {581, 520} {33, 35} off 
ioCheckbox {613, 486} {33, 35} off 
ioCheckbox {613, 520} {33, 35} off 
ioCheckbox {165, 588} {33, 35} off 
ioCheckbox {197, 588} {33, 35} off k14-02
ioCheckbox {229, 588} {33, 35} off k14-03
ioCheckbox {165, 622} {33, 35} off 
ioCheckbox {197, 622} {33, 35} off 
ioCheckbox {229, 622} {33, 35} off 
ioCheckbox {261, 588} {33, 35} off k14-04
ioCheckbox {293, 588} {33, 35} off 
ioCheckbox {261, 622} {33, 35} off 
ioCheckbox {293, 622} {33, 35} off 
ioCheckbox {325, 588} {33, 35} off 
ioCheckbox {357, 588} {33, 35} off 
ioCheckbox {325, 622} {33, 35} off 
ioCheckbox {357, 622} {33, 35} off 
ioCheckbox {389, 588} {33, 35} off 
ioCheckbox {421, 588} {33, 35} off 
ioCheckbox {389, 622} {33, 35} off 
ioCheckbox {421, 622} {33, 35} off k15-09
ioCheckbox {517, 554} {33, 35} off 
ioCheckbox {453, 588} {33, 35} off 
ioCheckbox {485, 588} {33, 35} off 
ioCheckbox {517, 588} {33, 35} off 
ioCheckbox {453, 622} {33, 35} off k15-10
ioCheckbox {485, 622} {33, 35} off k15-11
ioCheckbox {517, 622} {33, 35} off 
ioCheckbox {549, 554} {33, 35} off 
ioCheckbox {581, 554} {33, 35} off 
ioCheckbox {549, 588} {33, 35} off 
ioCheckbox {581, 588} {33, 35} off 
ioCheckbox {549, 622} {33, 35} off 
ioCheckbox {613, 554} {33, 35} off 
ioCheckbox {613, 588} {33, 35} off 
ioCheckbox {613, 622} {33, 35} off 
ioCheckbox {645, 418} {33, 35} off 
ioCheckbox {645, 452} {33, 35} off 
ioCheckbox {645, 486} {33, 35} off 
ioCheckbox {645, 520} {33, 35} off 
ioCheckbox {165, 656} {33, 35} off 
ioCheckbox {197, 656} {33, 35} off 
ioCheckbox {229, 656} {33, 35} off 
ioCheckbox {261, 656} {33, 35} off 
ioCheckbox {293, 656} {33, 35} off 
ioCheckbox {325, 656} {33, 35} off 
ioCheckbox {357, 656} {33, 35} off 
ioCheckbox {389, 656} {33, 35} off 
ioCheckbox {421, 656} {33, 35} off k16-09
ioCheckbox {453, 656} {33, 35} off k16-10
ioCheckbox {485, 656} {33, 35} off k16-11
ioCheckbox {517, 656} {33, 35} off 
ioCheckbox {549, 656} {33, 35} off 
ioCheckbox {581, 656} {33, 35} off 
ioCheckbox {613, 656} {33, 35} off 
ioCheckbox {645, 554} {33, 35} off 
ioCheckbox {645, 588} {33, 35} off 
ioCheckbox {645, 622} {33, 35} off 
ioCheckbox {645, 656} {33, 35} off 
ioButton {44, 101} {96, 48} event 1.000000 "" "MUTE" "/" i9999 0 1
ioText {677, 146} {29, 35} label 1.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 1
ioText {677, 181} {29, 35} label 2.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 2
ioText {677, 215} {29, 35} label 3.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 3
ioText {677, 249} {29, 35} label 4.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 4
ioText {677, 282} {29, 35} label 5.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 5
ioText {677, 316} {29, 35} label 6.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 6
ioText {677, 350} {29, 35} label 7.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 7
ioText {677, 384} {29, 35} label 8.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 8
ioText {677, 418} {29, 35} label 9.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 9
ioText {677, 452} {29, 35} label 10.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 10
ioText {677, 486} {29, 35} label 11.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 11
ioText {677, 520} {29, 35} label 12.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 12
ioText {677, 554} {29, 35} label 13.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 13
ioText {677, 588} {29, 35} label 14.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 14
ioText {677, 622} {29, 35} label 15.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 15
ioText {677, 656} {29, 35} label 16.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 16
ioText {197, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder B
ioText {229, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder C
ioText {261, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder D
ioText {293, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder E
ioText {325, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder F
ioText {357, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder G
ioText {389, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder H
ioText {421, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder I
ioText {453, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder J
ioText {485, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder K
ioText {517, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder L
ioText {549, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder M
ioText {581, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder N
ioText {613, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder O
ioText {645, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder P
ioText {165, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder A
ioMeter {158, 20} {13, 710} {44544, 53504, 65280} "" 0.736390 "" 0.000000 point 1 0 mouse
ioText {471, 11} {100, 24} label 0.000000 0.00100 "" center "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder CONTROL INPUTS
ioMeter {191, 49} {13, 103} {44544, 53504, 65280} "" 0.263736 "" 0.000000 point 1 0 mouse
ioMeter {160, 140} {552, 13} {44544, 53504, 65280} "" 1.000000 "" 0.981413 point 1 0 mouse
ioMeter {255, 49} {13, 103} {44544, 53504, 65280} "" 0.263736 "" 0.000000 point 1 0 mouse
ioMeter {287, 50} {13, 103} {44544, 53504, 65280} "" 0.989011 "" 0.000000 point 1 0 mouse
ioMeter {352, 50} {13, 103} {44544, 53504, 65280} "" 0.263736 "" 0.000000 point 1 0 mouse
ioMeter {384, 50} {13, 103} {44544, 53504, 65280} "" 0.263736 "" 0.000000 point 1 0 mouse
ioMeter {384, 50} {13, 103} {44544, 53504, 65280} "" 0.263736 "" 0.000000 point 1 0 mouse
ioMeter {415, 19} {13, 134} {44544, 53504, 65280} "" 0.263736 "" 0.000000 point 1 0 mouse
ioMeter {512, 48} {13, 103} {44544, 53504, 65280} "" 0.263736 "" 0.000000 point 1 0 mouse
ioMeter {544, 48} {13, 103} {44544, 53504, 65280} "" 0.263736 "" 0.000000 point 1 0 mouse
ioMeter {577, 49} {13, 103} {44544, 53504, 65280} "" 0.263736 "" 0.000000 point 1 0 mouse
ioMeter {607, 49} {13, 103} {44544, 53504, 65280} "" 0.263736 "" 0.000000 point 1 0 mouse
ioMeter {672, 19} {13, 715} {44544, 53504, 65280} "" 0.325479 "" -139.000000 point 1 0 mouse
ioMeter {700, 141} {13, 554} {44544, 53504, 65280} "" 0.830258 "" 0.000000 point 1 0 mouse
ioMeter {160, 717} {525, 13} {44544, 53504, 65280} "" 1.000000 "" 0.981413 point 1 0 mouse
ioMeter {159, 684} {555, 13} {44544, 53504, 65280} "" 1.000000 "" 0.981413 point 1 0 mouse
ioText {29, 349} {136, 37} label 0.000000 0.00100 "" left "Lucida Grande" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder NOISE
ioText {29, 385} {136, 67} label 0.000000 0.00100 "" left "Lucida Grande" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder INPUT               1INPUT               2
ioText {29, 451} {136, 37} label 0.000000 0.00100 "" left "Lucida Grande" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder FILTER
ioText {29, 487} {136, 37} label 0.000000 0.00100 "" left "Lucida Grande" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder TRAPEZ
ioText {29, 523} {136, 33} label 0.000000 0.00100 "" left "Lucida Grande" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder ENV SIG
ioText {29, 555} {136, 33} label 0.000000 0.00100 "" left "Lucida Grande" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder RING MODRING MOD
ioText {29, 587} {136, 35} label 0.000000 0.00100 "" left "Lucida Grande" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder REVERBRING MOD
ioText {29, 621} {136, 70} label 0.000000 0.00100 "" left "Lucida Grande" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder  STICK      <-->                        |
ioText {171, 53} {24, 85} label 0.000000 0.00100 "" left "Lucida Grande" 14 {0, 0, 0} {59392, 59392, 59392} nobackground noborder METER
ioText {268, 54} {25, 88} label 0.000000 0.00100 "" left "Lucida Grande" 14 {0, 0, 0} {59392, 59392, 59392} nobackground noborder ENVEL
ioText {208, 53} {47, 88} label 0.000000 0.00100 "" center "Lucida Grande" 14 {0, 0, 0} {59392, 59392, 59392} nobackground noborder OUTAMPS1     2
ioText {248, 11} {90, 24} label 0.000000 0.00100 "" center "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder SIGNAL INPUTS
ioCheckbox {549, 147} {33, 35} off k01-13
ioCheckbox {644, 150} {30, 30} off k01-16
ioText {301, 53} {47, 88} label 0.000000 0.00100 "" center "Lucida Grande" 14 {0, 0, 0} {59392, 59392, 59392} nobackground noborder RINGMODA   B
ioText {395, 54} {26, 89} label 0.000000 0.00100 "" center "Lucida Grande" 13 {0, 0, 0} {59392, 59392, 59392} nobackground noborder REVERB
ioText {363, 53} {25, 91} label 0.000000 0.00100 "" center "Lucida Grande" 13 {0, 0, 0} {59392, 59392, 59392} nobackground noborder FILTER
ioText {427, 55} {86, 86} label 0.000000 0.00100 "" center "Lucida Grande" 14 {0, 0, 0} {59392, 59392, 59392} nobackground noborder OSC.FREQ1     2    3 
ioText {523, 56} {24, 84} label 0.000000 0.00100 "" center "Lucida Grande" 14 {0, 0, 0} {59392, 59392, 59392} nobackground noborder DECAY
ioText {554, 53} {26, 89} label 0.000000 0.00100 "" center "Lucida Grande" 13 {0, 0, 0} {59392, 59392, 59392} nobackground noborder REVERB
ioText {586, 53} {25, 91} label 0.000000 0.00100 "" center "Lucida Grande" 13 {0, 0, 0} {59392, 59392, 59392} nobackground noborder FILTER
ioText {623, 54} {47, 88} label 0.000000 0.00100 "" center "Lucida Grande" 14 {0, 0, 0} {59392, 59392, 59392} nobackground noborder OUTAMPS1     2
ioKnob {851, 115} {48, 48} 0.900000 0.100000 0.001000 0.585000 shape1
ioKnob {918, 115} {48, 48} 1.000000 0.000000 0.010000 0.330000 lsine1
ioKnob {982, 115} {48, 48} 1.000000 0.000000 0.010000 0.720000 lramp1
ioKnob {771, 112} {62, 60} 10.000000 0.000000 0.001000 4.503998 frosc1
ioText {773, 104} {47, 24} display 53.329842 0.00100 "dispfrosc1" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 53.330
ioCheckbox {197, 350} {33, 33} off k07-02
ioText {763, 64} {98, 24} label 0.000000 0.00100 "" center "Lucida Grande" 11 {63744, 65280, 65280} {3328, 4864, 1024} nobackground noborder OSCILLATOR 1
ioMeter {1036, 48} {14, 615} {44544, 53504, 65280} "" 0.011532 "" 0.500000 fill 1 0 mouse
ioText {763, 206} {100, 24} label 0.000000 0.00100 "" center "Lucida Grande" 11 {63744, 65280, 65280} {3328, 4864, 1024} nobackground noborder OSCILLATOR 2
ioKnob {773, 255} {60, 58} 10.000000 0.000000 0.001000 10.000000 frosc2
ioKnob {853, 260} {48, 48} 1.000000 0.000000 0.001000 0.539000 shape2
ioText {775, 245} {47, 24} display 10000.000000 0.00100 "dispfrosc2" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 10000.000
ioKnob {918, 261} {48, 48} 1.000000 0.000000 0.010000 1.000000 lsquare2
ioKnob {984, 261} {48, 48} 1.000000 0.000000 0.010000 0.470000 lramp2
ioText {763, 346} {107, 24} label 0.000000 0.00100 "" center "Lucida Grande" 11 {63744, 65280, 65280} {3328, 4864, 1024} nobackground noborder OSCILLATOR 3
ioKnob {774, 396} {61, 60} 10.000000 0.000000 0.001000 9.094004 frosc3
ioKnob {852, 399} {48, 48} 1.000000 0.000000 0.001000 0.801000 shape3
ioText {780, 386} {41, 24} display 199.459867 0.00100 "dispfrosc3" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 199.460
ioKnob {920, 399} {48, 48} 1.000000 0.000000 0.010000 0.180000 lsquare3
ioKnob {983, 399} {48, 48} 1.000000 0.000000 0.010000 0.380000 lramp3
ioMeter {752, 473} {696, 14} {44544, 53504, 65280} "" 0.000000 "" 0.000000 fill 1 0 mouse
ioMeter {730, 27} {743, 38} {32768, 16384, 0} "left" 1.000000 "left" 1.000000 fill 1 0 mouse
ioText {764, 493} {109, 24} label 0.000000 0.00100 "" center "Lucida Grande" 12 {63744, 65280, 65280} {3328, 4864, 1024} nobackground noborder NOISE GENERATOR
ioMeter {759, 639} {687, 29} {6400, 6400, 6400} "blackstrip" 1.000000 "blackstrip" 1.000000 fill 1 0 mouse
ioText {768, 520} {75, 35} label 0.000000 0.00100 "" center "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder COLOURWhite
ioText {850, 521} {48, 24} label 0.000000 0.00100 "" center "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder LEVEL
ioMeter {756, 182} {693, 14} {44544, 53504, 65280} "" 0.000000 "" 0.000000 fill 1 0 mouse
ioMeter {1434, 54} {39, 937} {32768, 16384, 0} "left" 1.000000 "left" 1.000000 fill 1 0 mouse
ioMeter {895, 475} {14, 187} {44544, 53504, 65280} "" -0.016043 "" 3.500000 fill 1 0 mouse
ioText {905, 493} {114, 24} label 0.000000 0.00100 "" center "Lucida Grande" 12 {63744, 65280, 65280} {3328, 4864, 1024} nobackground noborder INPUT LEVEL
ioKnob {919, 545} {48, 48} 1.000000 0.000000 0.010000 0.000000 levin_1
ioKnob {981, 545} {48, 48} 1.000000 0.000000 0.010000 0.650000 levin_2
ioMeter {1154, 51} {14, 146} {44544, 53504, 65280} "" 0.000000 "" 0.000000 fill 1 0 mouse
ioText {1047, 63} {107, 24} label 0.000000 0.00100 "" center "Arial" 11 {63744, 65280, 65280} {3328, 4864, 1024} nobackground noborder RING MODULATOR
ioMeter {755, 333} {486, 14} {0, 0, 0} "" 0.500000 "" 0.018987 fill 1 0 mouse
ioMeter {1228, 334} {14, 329} {44544, 53504, 65280} "" -0.003155 "" 2.000000 fill 1 0 mouse
ioText {1168, 64} {112, 24} label 0.000000 0.00100 "" left "Arial" 11 {63744, 65280, 65280} {3328, 4864, 1024} nobackground noborder FILTER / OSCILLATOR
ioText {1047, 206} {107, 24} label 0.000000 0.00100 "" center "Lucida Grande" 12 {63744, 65280, 65280} {3328, 4864, 1024} nobackground noborder ENVELOPE SHAPER
ioKnob {1073, 260} {48, 48} 4.500000 0.003000 0.010000 2.453000 attack
ioKnob {1165, 259} {49, 50} 4.000000 0.010000 0.005000 1.015001 eon
ioKnob {1259, 259} {50, 50} 4.000000 0.010000 0.005000 1.675000 decay
ioText {1051, 345} {134, 24} label 0.000000 0.00100 "" center "Lucida Grande" 12 {63744, 65280, 65280} {3328, 4864, 1024} nobackground noborder REVERBERATION
ioKnob {1350, 259} {50, 50} 4.000000 0.050000 0.005000 0.050000 off_pulse
ioCheckbox {1077, 601} {30, 30} off mutech1
ioCheckbox {1169, 602} {30, 30} off mutech2
ioKnob {1065, 399} {48, 48} 1.000000 0.000000 0.010000 0.270000 wetdry
ioKnob {1177, 112} {49, 50} 1.000000 0.100000 0.005000 0.834999 cutoff
ioKnob {1264, 112} {49, 50} 1.200000 0.100000 0.010000 1.020000 res
ioKnob {1349, 112} {49, 50} 1.000000 0.000000 0.010000 0.800000 fillev
ioKnob {1162, 399} {48, 48} 1.000000 0.000000 0.010000 0.520000 revlev
ioKnob {1068, 545} {48, 48} 6.000000 -6.000000 0.100000 0.200000 filch1
ioKnob {1158, 545} {48, 48} 6.000000 -6.000000 0.050000 -6.000000 filch2
ioKnob {1261, 399} {48, 48} 1.000000 0.000000 0.010000 0.490000 traplev
ioKnob {1352, 399} {48, 48} 1.000000 0.000000 0.010000 0.530000 signal
ioMeter {1266, 538} {16, 79} {0, 65280, 0} "RMS1" 1.155206 "RMS1" 1.155206 fill 1 0 mouse
ioMeter {1247, 731} {131, 126} {1792, 35328, 52224} "joy_v" 1.403509 "joy_h" -6.974790 point 12 123 mouse
ioMeter {9, 744} {38, 247} {32768, 16384, 0} "left" 1.000000 "left" 1.000000 fill 1 0 mouse
ioText {1051, 493} {121, 24} label 0.000000 0.00100 "" center "Lucida Grande" 12 {63744, 65280, 65280} {3328, 4864, 1024} nobackground noborder OUTPUT FILTER
ioText {1179, 147} {44, 24} display 4224.416948 0.00100 "dispcutoff" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 4224.417
ioText {1275, 147} {32, 24} display 0.000000 0.00100 "res" center "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {1254, 93} {75, 24} label 0.000000 0.00100 "" center "Arial" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder RESPONSE
ioText {770, 91} {71, 24} label 0.000000 0.00100 "" center "Arial" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder FREQUENCY
ioText {849, 98} {53, 24} label 0.000000 0.00100 "" center "Arial" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder SHAPE
ioText {948, 82} {51, 33} label 0.000000 0.00100 "" center "Arial" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder LEVEL
ioText {1071, 93} {54, 24} label 0.000000 0.00100 "" center "Arial" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder LEVEL
ioText {812, 102} {31, 27} label 0.000000 0.00100 "" left "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder Hz
ioKnob {1074, 115} {48, 48} 1.000000 0.000000 0.010000 1.000000 rmlev
ioText {1344, 851} {44, 24} display 0.000000 0.00100 "disp_joy_h" left "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 0.000
ioText {1211, 739} {41, 24} display 0.993760 0.00100 "disp_joy_v" left "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 0.993
ioText {1185, 738} {31, 27} label 0.000000 0.00100 "" left "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder Y = 
ioText {1320, 851} {31, 27} label 0.000000 0.00100 "" left "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder X = = 
ioKnob {1188, 758} {48, 48} 1.000000 0.000000 0.010000 0.960000 range_v
ioKnob {1276, 688} {48, 48} 1.000000 0.000000 0.010000 0.630000 range_h
ioText {1148, 771} {44, 30} display 0.000000 0.00100 "range_v" left "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {1321, 695} {44, 30} display 0.000000 0.00100 "range_h" left "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {1273, 680} {61, 24} label 0.000000 0.00100 "" left "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder RANGE_X
ioText {1183, 796} {60, 24} label 0.000000 0.00100 "" left "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder RANGE_Y
ioCheckbox {582, 625} {30, 30} off k15-14
ioMeter {1132, 236} {20, 20} {65280, 6400, 0} "lamp" 1.000000 "lamp" 1.000000 fill 1 0 mouse
ioText {1358, 241} {32, 24} label 0.000000 0.00100 "" left "Arial" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder OFF
ioText {1071, 241} {49, 24} label 0.000000 0.00100 "" left "Arial" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder ATTACK
ioText {1167, 241} {47, 24} label 0.000000 0.00100 "" center "Arial" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder ON
ioText {1263, 241} {42, 26} label 0.000000 0.00100 "" left "Arial" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder DECAY
ioText {1073, 378} {34, 25} label 0.000000 0.00100 "" left "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder MIX
ioText {1165, 378} {46, 24} label 0.000000 0.00100 "" left "Arial" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder LEVEL
ioText {845, 835} {48, 25} display 0.000000 0.00100 "disppitch" left "Lucida Grande" 14 {32768, 0, 0} {52224, 65280, 26112} nobackground noborder 
ioMeter {78, 956} {22, 23} {65280, 47104, 1792} "led1" 0.000000 "led1" 0.000000 fill 1 0 mouse
ioMeter {113, 956} {22, 23} {65280, 47104, 1792} "led2" 0.000000 "led2" 0.000000 fill 1 0 mouse
ioMeter {147, 956} {22, 23} {65280, 47104, 1792} "led3" 0.000000 "led3" 0.000000 fill 1 0 mouse
ioMeter {182, 956} {22, 23} {65280, 47104, 1792} "led4" 0.000000 "led4" 0.000000 fill 1 0 mouse
ioMeter {218, 956} {22, 23} {65280, 47104, 1792} "led5" 0.000000 "led5" 0.000000 fill 1 0 mouse
ioText {792, 855} {38, 24} display 0.000000 0.00100 "vel" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioCheckbox {964, 719} {30, 30} off seq
ioText {1238, 483} {81, 24} label 0.000000 0.00100 "" left "Lucida Grande" 11 {0, 0, 0} {65280, 65280, 65280} nobackground noborder EuVCS3x-mCS
ioText {1009, 720} {65, 48} label 0.000000 0.00100 "" left "Lucida Grande" 12 {65280, 0, 512} {59392, 59392, 59392} nobackground noborder Sequencer Synth
ioText {80, 755} {281, 34} label 0.000000 0.00100 "" left "Lucida Grande" 11 {65280, 0, 0} {59392, 59392, 59392} nobackground noborder 01        02         03        04         05        06       07        08         
ioCheckbox {964, 773} {30, 30} off dir
ioText {1009, 775} {77, 37} label 0.000000 0.00100 "" left "Lucida Grande" 12 {65280, 3840, 0} {59392, 59392, 59392} nobackground noborder Rev / Frwd
ioMeter {45, 791} {23, 22} {65280, 5888, 0} "led1" 0.000000 "led1" 0.000000 fill 1 0 mouse
ioText {788, 702} {44, 26} label 0.000000 0.00100 "" left "Lucida Grande" 12 {65280, 0, 0} {59392, 59392, 59392} nobackground noborder Attacked:
ioCheckbox {964, 826} {30, 30} off port
ioKnob {905, 817} {48, 48} 0.050000 0.010000 0.001000 0.034000 time
ioText {904, 703} {43, 24} label 0.000000 0.00100 "" left "Lucida Grande" 12 {65280, 0, 0} {59392, 59392, 59392} nobackground noborder DecayDeacy
ioText {998, 827} {78, 24} label 0.000000 0.00100 "" left "Lucida Grande" 12 {65280, 0, 0} {59392, 59392, 59392} nobackground noborder Glide On/Off
ioMeter {730, 54} {38, 936} {32768, 16384, 0} "left" 1.000000 "left" 1.000000 fill 1 0 mouse
ioText {910, 799} {40, 24} label 0.000000 0.00100 "" left "Lucida Grande" 12 {65280, 0, 0} {59392, 59392, 59392} nobackground noborder Time
ioButton {761, 892} {83, 44} event 1.000000 "" "Pitch" "/" i  100  0  0.1
ioKnob {779, 920} {48, 48} 71.000000 1.000000 1.000000 49.000000 lambda
ioMeter {1142, 656} {14, 333} {44544, 53504, 65280} "" 0.000000 "" 0.000000 fill 1 0 mouse
ioButton {835, 892} {86, 43} event 1.000000 "" "Levels" "/" i  101  0  0.1
ioKnob {853, 920} {48, 48} 1.000000 0.000000 0.050000 0.850000 avrg
ioButton {839, 949} {80, 40} event 1.000000 "" "Reset" "/" i112 0 0.1
ioText {846, 703} {43, 24} label 0.000000 0.00100 "" center "Lucida Grande" 12 {65280, 0, 0} {59392, 59392, 59392} nobackground noborder On
ioButton {648, 745} {90, 50} event 1.000000 "" "Run/Stop" "/" i199 0 0.1
ioMeter {107, 111} {18, 16} {65280, 1792, 0} "ledmute" 0.000000 "ledmute" 0.000000 fill 1 0 mouse
ioButton {46, 51} {93, 49} event 1.000000 "" "FadeOut" "/" i9998 0 4 4
ioButton {45, 4} {94, 50} event 1.000000 "" "FadeIn" "/" i9997 0 4 4
ioMeter {27, 1} {15, 55} {26112, 52224, 65280} "fin" 0.990852 "fin" 0.990852 fill 1 0 mouse
ioCheckbox {1265, 338} {30, 30} off envsw
ioText {1242, 315} {76, 24} label 0.000000 0.00100 "AutoMan" center "Lucida Grande" 12 {32768, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {1248, 379} {73, 24} label 0.000000 0.00100 "" center "Arial" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder TRAPEZOID
ioText {1344, 379} {71, 24} label 0.000000 0.00100 "" center "Arial" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder SIGNAL
ioText {772, 233} {71, 24} label 0.000000 0.00100 "" center "Arial" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder FREQUENCY
ioText {849, 243} {53, 24} label 0.000000 0.00100 "" center "Arial" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder SHAPE
ioText {949, 226} {52, 24} label 0.000000 0.00100 "" center "Arial" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder LEVEL
ioText {773, 372} {71, 24} label 0.000000 0.00100 "" center "Arial" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder FREQUENCY
ioText {850, 383} {53, 24} label 0.000000 0.00100 "" center "Arial" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder SHAPE
ioText {1347, 93} {54, 24} label 0.000000 0.00100 "" center "Arial" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder LEVEL
ioText {1171, 92} {71, 24} label 0.000000 0.00100 "" center "Arial" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder FREQUENCY
ioMeter {27, 47} {15, 55} {26112, 52224, 65280} "fout" 0.002315 "fout" 0.002315 fill 1 0 mouse
ioMeter {1244, 344} {19, 18} {65280, 0, 0} "auto" 1.000000 "auto" 1.000000 fill 1 0 mouse
ioMeter {1294, 344} {19, 18} {65280, 0, 0} "man" 0.000000 "man" 0.000000 fill 1 0 mouse
ioText {1238, 322} {87, 24} label 0.000000 0.00100 "" left "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder Auto         Man
ioText {912, 521} {63, 24} label 0.000000 0.00100 "" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder CHANNEL 1
ioText {972, 521} {67, 24} label 0.000000 0.00100 "" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder CHANNEL 2
ioText {1061, 521} {63, 24} label 0.000000 0.00100 "" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder CHANNEL 1
ioText {1147, 521} {67, 24} label 0.000000 0.00100 "" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder CHANNEL 2
ioMeter {159, 17} {97, 13} {44544, 53504, 65280} "" 0.000000 "" 0.000000 fill 1 0 mouse
ioMeter {325, 16} {145, 13} {44544, 53504, 65280} "" 0.000000 "" 0.000000 fill 1 0 mouse
ioMeter {566, 16} {119, 13} {512, 0, 1280} "" 1.000000 "" 0.056075 fill 1 0 mouse
ioMeter {159, 44} {526, 13} {44544, 53504, 65280} "" 0.000000 "" 0.000000 fill 1 0 mouse
ioText {1381, 767} {54, 24} label 0.000000 0.00100 "" center "Lucida Grande" 11 {65280, 0, 0} {59392, 59392, 59392} nobackground noborder ATTACK
ioMeter {1394, 790} {28, 25} {65280, 14848, 0} "trig" 0.000000 "trig" 0.000000 point 13 351 mouse
ioMeter {1293, 538} {16, 79} {0, 65280, 0} "RMS2" 0.986303 "RMS2" 0.986303 fill 1 0 mouse
ioText {949, 363} {52, 24} label 0.000000 0.00100 "" center "Arial" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder LEVEL
ioButton {1332, 545} {64, 65} pict 1.000000 "" "Button" "/" i1 0 10
ioText {773, 584} {33, 24} label 0.000000 0.00100 "" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder Low
ioText {806, 584} {35, 24} label 0.000000 0.00100 "" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder High
ioText {1053, 576} {33, 24} label 0.000000 0.00100 "" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder Low
ioText {1102, 576} {35, 24} label 0.000000 0.00100 "" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder High
ioText {1144, 576} {33, 24} label 0.000000 0.00100 "" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder Low
ioText {1194, 576} {35, 24} label 0.000000 0.00100 "" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder High
ioMeter {23, 141} {13, 237} {44544, 53504, 65280} "" 0.000000 "" 0.000000 fill 1 0 mouse
ioMeter {23, 140} {192, 13} {44544, 53504, 65280} "" 0.000000 "" 0.000000 fill 1 0 mouse
ioMeter {25, 206} {145, 13} {44544, 53504, 65280} "" 0.000000 "" 0.000000 fill 1 0 mouse
ioMeter {25, 276} {145, 13} {44544, 53504, 65280} "" 0.000000 "" 0.000000 fill 1 0 mouse
ioText {29, 212} {50, 48} label 0.000000 0.00100 "" center "Lucida Grande" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder OSC  2
ioText {30, 282} {50, 48} label 0.000000 0.00100 "" center "Lucida Grande" 16 {0, 0, 0} {59392, 59392, 59392} nobackground noborder OSC  3
ioMeter {9, 723} {750, 32} {32768, 16384, 0} "left" 1.000000 "left" 1.000000 fill 1 0 mouse
ioKnob {66, 779} {48, 48} 71.000000 1.000000 1.000000 22.000004 s01
ioKnob {136, 779} {48, 48} 71.000000 1.000000 1.000000 38.000000 s03
ioKnob {171, 779} {48, 48} 71.000000 1.000000 1.000000 38.999985 s04
ioKnob {241, 779} {48, 48} 71.000000 1.000000 1.000000 42.000011 s06
ioKnob {276, 779} {48, 48} 71.000000 1.000000 1.000000 32.000000 s07
ioKnob {311, 779} {48, 48} 71.000000 1.000000 1.000000 50.000008 s08
ioKnob {346, 779} {48, 48} 71.000000 1.000000 1.000000 50.000004 s09
ioKnob {381, 779} {48, 48} 71.000000 1.000000 1.000000 50.000004 s10
ioKnob {416, 779} {48, 48} 71.000000 1.000000 1.000000 49.999992 s11
ioKnob {451, 779} {48, 48} 71.000000 1.000000 1.000000 1.000000 s12
ioKnob {486, 779} {48, 48} 71.000000 1.000000 1.000000 1.000000 s13
ioKnob {521, 779} {48, 48} 71.000000 1.000000 1.000000 64.000015 s14
ioKnob {556, 779} {48, 48} 71.000000 1.000000 1.000000 0.500000 s15
ioKnob {591, 779} {48, 48} 71.000000 1.000000 1.000000 50.000000 s16
ioKnob {206, 779} {48, 48} 71.000000 1.000000 1.000000 40.000008 s05
ioKnob {101, 779} {48, 48} 71.000000 1.000000 1.000000 49.000011 s02
ioText {356, 755} {313, 34} label 0.000000 0.00100 "" left "Lucida Grande" 11 {65280, 0, 0} {59392, 59392, 59392} nobackground noborder 09         10         11        12         13        14        15        16        
ioKnob {66, 834} {48, 48} 1.000000 0.000000 0.010000 0.000000 L01
ioKnob {101, 834} {48, 48} 1.000000 0.000000 0.010000 0.470000 L02
ioKnob {136, 834} {48, 48} 1.000000 0.000000 0.010000 0.000000 L03
ioKnob {171, 834} {48, 48} 1.000000 0.000000 0.010000 0.000000 L04
ioKnob {241, 834} {48, 48} 1.000000 0.000000 0.010000 0.040000 L06
ioKnob {206, 834} {48, 48} 1.000000 0.000000 0.010000 0.000000 L05
ioKnob {276, 834} {48, 48} 1.000000 0.000000 0.010000 0.000000 L07
ioKnob {311, 834} {48, 48} 1.000000 0.000000 0.010000 0.000000 L08
ioKnob {346, 834} {48, 48} 1.000000 0.000000 0.010000 0.000000 L09
ioKnob {381, 834} {48, 48} 1.000000 0.000000 0.010000 0.310000 L10
ioKnob {416, 834} {48, 48} 1.000000 0.000000 0.010000 0.000000 L11
ioKnob {451, 834} {48, 48} 1.000000 0.000000 0.010000 0.330000 L12
ioKnob {486, 834} {48, 48} 1.000000 0.000000 0.010000 0.000000 L13
ioKnob {521, 834} {48, 48} 1.000000 0.000000 0.010000 0.000000 L14
ioKnob {556, 834} {48, 48} 1.000000 0.000000 0.010000 0.000000 L15
ioKnob {591, 834} {48, 48} 1.000000 0.000000 0.010000 0.000000 L16
ioKnob {66, 872} {48, 48} 1.000000 0.000000 0.010000 0.650000 C01
ioKnob {101, 872} {48, 48} 1.000000 0.000000 0.010000 0.810000 C02
ioKnob {136, 872} {48, 48} 1.000000 0.000000 0.010000 0.500000 C03
ioKnob {171, 872} {48, 48} 1.000000 0.000000 0.010000 0.030000 C04
ioKnob {241, 872} {48, 48} 1.000000 0.000000 0.010000 0.660000 C06
ioKnob {206, 872} {48, 48} 1.000000 0.000000 0.010000 1.000000 C05
ioKnob {276, 872} {48, 48} 1.000000 0.000000 0.010000 0.700000 C07
ioKnob {311, 872} {48, 48} 1.000000 0.000000 0.010000 0.170000 C08
ioKnob {346, 872} {48, 48} 1.000000 0.000000 0.010000 0.375204 C09
ioKnob {381, 872} {48, 48} 1.000000 0.000000 0.010000 0.180000 C10
ioKnob {416, 872} {48, 48} 1.000000 0.000000 0.010000 0.380000 C11
ioKnob {451, 872} {48, 48} 1.000000 0.000000 0.010000 0.330000 C12
ioKnob {486, 872} {48, 48} 1.000000 0.000000 0.010000 0.430000 C13
ioKnob {521, 872} {48, 48} 1.000000 0.000000 0.010000 0.810000 C14
ioKnob {556, 872} {48, 48} 1.000000 0.000000 0.010000 0.340000 C15
ioKnob {591, 872} {48, 48} 1.000000 0.000000 0.010000 0.000000 C16
ioKnob {66, 910} {48, 48} 1.000000 0.000000 0.010000 0.020000 P01
ioKnob {101, 910} {48, 48} 1.000000 0.000000 0.010000 0.000000 P02
ioKnob {136, 910} {48, 48} 1.000000 0.000000 0.010000 0.000000 P03
ioKnob {171, 910} {48, 48} 1.000000 0.000000 0.010000 0.745026 P04
ioKnob {206, 910} {48, 48} 1.000000 0.000000 0.010000 0.000000 P05
ioKnob {241, 910} {48, 48} 1.000000 0.000000 0.010000 0.000000 P06
ioKnob {276, 910} {48, 48} 1.000000 0.000000 0.010000 0.000000 P07
ioKnob {311, 910} {48, 48} 1.000000 0.000000 0.010000 0.240000 P08
ioKnob {346, 910} {48, 48} 1.000000 0.000000 0.010000 0.270000 P09
ioKnob {381, 910} {48, 48} 1.000000 0.000000 0.010000 0.320000 P10
ioKnob {416, 910} {48, 48} 1.000000 0.000000 0.010000 0.760000 P11
ioKnob {451, 910} {48, 48} 1.000000 0.000000 0.010000 0.740000 P12
ioKnob {486, 910} {48, 48} 1.000000 0.000000 0.010000 0.190000 P13
ioKnob {521, 910} {48, 48} 1.000000 0.000000 0.010000 0.730000 P14
ioKnob {556, 910} {48, 48} 1.000000 0.000000 0.010000 1.000000 P15
ioKnob {591, 910} {48, 48} 1.000000 0.000000 0.010000 1.000000 P16
ioMeter {253, 957} {22, 23} {65280, 47104, 1792} "led6" 0.000000 "led6" 0.000000 fill 1 0 mouse
ioMeter {288, 957} {22, 23} {65280, 47104, 1792} "led7" 0.000000 "led7" 0.000000 fill 1 0 mouse
ioMeter {323, 957} {22, 23} {65280, 47104, 1792} "led8" 0.000000 "led8" 0.000000 fill 1 0 mouse
ioMeter {358, 957} {22, 23} {65280, 47104, 1792} "led9" 0.000000 "led9" 0.000000 fill 1 0 mouse
ioMeter {393, 957} {22, 23} {65280, 47104, 1792} "led10" 0.000000 "led10" 0.000000 fill 1 0 mouse
ioMeter {427, 957} {22, 23} {65280, 47104, 1792} "led11" 0.000000 "led11" 0.000000 fill 1 0 mouse
ioMeter {462, 957} {22, 23} {65280, 47104, 1792} "led12" 0.000000 "led12" 0.000000 fill 1 0 mouse
ioMeter {497, 957} {22, 23} {65280, 47104, 1792} "led13" 1.000000 "led13" 1.000000 fill 1 0 mouse
ioMeter {533, 957} {22, 23} {65280, 47104, 1792} "led14" 0.000000 "led14" 0.000000 fill 1 0 mouse
ioMeter {568, 957} {22, 23} {65280, 47104, 1792} "led15" 0.000000 "led15" 0.000000 fill 1 0 mouse
ioMeter {603, 957} {22, 23} {65280, 47104, 1792} "led16" 0.000000 "led16" 0.000000 fill 1 0 mouse
ioMeter {9, 980} {1465, 35} {32768, 16384, 0} "left" 1.000000 "left" 1.000000 fill 1 0 mouse
ioKnob {786, 721} {48, 48} 0.050000 0.003500 0.001000 0.016500 atck
ioKnob {903, 721} {48, 48} 0.030000 0.004000 0.001000 0.004000 dec
ioKnob {844, 721} {48, 48} 1.000000 0.000000 0.010000 0.670000 on
ioText {765, 666} {129, 24} label 0.000000 0.00100 "" center "Lucida Grande" 12 {65280, 65280, 65280} {0, 0, 0} nobackground noborder SEQUENCER CONTROLS
ioKnob {786, 815} {50, 50} 1.000000 0.125000 0.005000 0.630000 vel
ioText {789, 795} {50, 30} label 0.000000 0.00100 "" left "Lucida Grande" 14 {65280, 0, 0} {59392, 59392, 59392} nobackground noborder SPEEDed
ioText {791, 762} {40, 24} display 0.000000 0.00100 "atck" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {849, 762} {38, 24} display 0.000000 0.00100 "on" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {909, 762} {38, 24} display 0.000000 0.00100 "dec" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {911, 857} {38, 24} display 0.000000 0.00100 "time" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioButton {913, 892} {83, 44} event 1.000000 "" "Cutoff" "/" i  102  0  0.5
ioKnob {931, 920} {48, 48} 0.500000 0.010000 0.010000 0.230000 cutref
ioButton {990, 891} {86, 43} event 1.000000 "" "Pan" "/" i  103  0  0.1
ioKnob {1010, 921} {48, 48} 1.000000 0.000000 0.010000 0.360000 panrange
ioText {638, 794} {36, 24} label 0.000000 0.00100 "" left "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder Pitch
ioText {638, 848} {30, 24} label 0.000000 0.00100 "" left "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder Lev
ioText {638, 884} {34, 26} label 0.000000 0.00100 "" left "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder Cut
ioText {638, 927} {30, 24} label 0.000000 0.00100 "" left "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder Pan
ioText {77, 816} {26, 24} display 0.000000 0.00100 "s01" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {111, 816} {26, 24} display 0.000000 0.00100 "s02" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {147, 816} {26, 24} display 0.000000 0.00100 "s03" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {181, 817} {26, 24} display 0.000000 0.00100 "s04" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {217, 817} {26, 24} display 0.000000 0.00100 "s05" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {253, 817} {26, 24} display 0.000000 0.00100 "s06" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioMeter {770, 884} {129, 13} {44544, 53504, 65280} "" 1.000000 "" 0.008547 fill 1 0 mouse
ioText {891, 878} {96, 32} label 0.000000 0.00100 "" center "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder Randomize
ioMeter {968, 883} {177, 13} {44544, 53504, 65280} "" 0.000000 "" -0.018182 fill 1 0 mouse
ioText {286, 817} {26, 24} display 0.000000 0.00100 "s07" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {321, 817} {26, 24} display 0.000000 0.00100 "s08" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {357, 817} {26, 24} display 0.000000 0.00100 "s09" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {392, 817} {26, 24} display 0.000000 0.00100 "s10" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {427, 817} {26, 24} display 0.000000 0.00100 "s11" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {462, 817} {26, 24} display 0.000000 0.00100 "s12" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {497, 817} {26, 24} display 0.000000 0.00100 "s13" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {531, 817} {26, 24} display 0.000000 0.00100 "s14" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {567, 817} {26, 24} display 0.000000 0.00100 "s15" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {602, 817} {26, 24} display 0.000000 0.00100 "s16" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioButton {916, 948} {80, 40} event 1.000000 "" "Reset" "/" i113 0 0.1
ioButton {994, 949} {80, 40} event 1.000000 "" "Reset" "/" i114 0 0.1
ioMeter {935, 836} {41, 13} {44544, 53504, 65280} "" 0.000000 "" -0.018182 fill 1 0 mouse
ioKnob {851, 548} {48, 48} 1.000000 0.000000 0.010000 0.040000 noiselev
ioKnob {782, 548} {48, 48} 10.000000 -10.000000 0.500000 -10.000000 noisecolor
ioMeter {1072, 724} {20, 18} {0, 65280, 65280} "seq" 0.000000 "seq" 0.000000 fill 1 0 mouse
ioMeter {982, 727} {33, 13} {44544, 53504, 65280} "" 1.000000 "" 0.008547 fill 1 0 mouse
ioMeter {995, 729} {13, 31} {0, 0, 0} "" 1.000000 "" 0.008547 fill 1 0 mouse
ioMeter {1072, 746} {20, 18} {0, 65280, 65280} "synth" 1.000000 "synth" 1.000000 fill 1 0 mouse
ioMeter {1073, 779} {20, 18} {0, 65280, 65280} "frwd" 1.000000 "frwd" 1.000000 fill 1 0 mouse
ioMeter {990, 778} {20, 18} {0, 65280, 65280} "rvrs" 0.000000 "rvrs" 0.000000 fill 1 0 mouse
ioMeter {960, 582} {15, 63} {65280, 32768, 0} "in_1" 0.000016 "in_1" 0.000016 fill 1 0 mouse
ioMeter {974, 582} {15, 63} {65280, 32768, 0} "in_2" 0.000010 "in_2" 0.000010 fill 1 0 mouse
ioText {859, 291} {42, 24} display 0.000000 0.00100 "shape2" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {859, 431} {42, 24} display 0.000000 0.00100 "shape3" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {855, 146} {42, 24} display 0.000000 0.00100 "shape1" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {1217, 146} {29, 24} label 0.000000 0.00100 "" left "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder Hz
ioText {1077, 147} {44, 24} display 0.000000 0.00100 "rmlev" center "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {1352, 148} {44, 24} display 0.000000 0.00100 "fillev" center "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {813, 244} {31, 27} label 0.000000 0.00100 "" left "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder Hz
ioText {923, 148} {39, 24} display 0.000000 0.00100 "lsine1" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {985, 148} {39, 24} display 0.000000 0.00100 "lramp1" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {989, 295} {39, 24} display 0.000000 0.00100 "lramp2" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {814, 385} {31, 27} label 0.000000 0.00100 "" left "Lucida Grande" 13 {0, 0, 0} {59392, 59392, 59392} nobackground noborder Hz
ioText {927, 433} {39, 24} display 0.000000 0.00100 "lsquare3" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {988, 433} {39, 24} display 0.000000 0.00100 "lramp3" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {1070, 433} {39, 24} display 0.000000 0.00100 "wetdry" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {1168, 433} {39, 24} display 0.000000 0.00100 "revlev" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {1267, 433} {39, 24} display 0.000000 0.00100 "traplev" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {1356, 433} {39, 24} display 0.000000 0.00100 "signal" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {1067, 295} {39, 24} display 0.000000 0.00100 "attack" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {1099, 293} {39, 35} label 0.000000 0.00100 "" left "Lucida Grande" 13 {0, 0, 0} {59392, 59392, 59392} nobackground noborder sec
ioText {1195, 293} {39, 35} label 0.000000 0.00100 "" left "Lucida Grande" 13 {0, 0, 0} {59392, 59392, 59392} nobackground noborder sec
ioText {1161, 295} {45, 25} display 0.000000 0.00100 "eon" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {1258, 295} {39, 24} display 0.000000 0.00100 "decay" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {1290, 293} {39, 35} label 0.000000 0.00100 "" left "Lucida Grande" 13 {0, 0, 0} {59392, 59392, 59392} nobackground noborder sec
ioText {856, 582} {39, 24} display 0.000000 0.00100 "noiselev" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {924, 582} {39, 24} display 0.000000 0.00100 "levin_1" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {985, 582} {39, 24} display 0.000000 0.00100 "levin_2" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {1063, 618} {59, 24} label 0.000000 0.00100 "" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder Mute CH1
ioText {1155, 619} {58, 24} label 0.000000 0.00100 "" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder Mute CH2
ioText {1067, 586} {40, 24} display 0.000000 0.00100 "filch1" center "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {1093, 586} {24, 24} label 0.000000 0.00100 "" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder dB
ioText {1190, 586} {24, 24} label 0.000000 0.00100 "" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder dB
ioText {1163, 586} {40, 24} display 0.000000 0.00100 "filch2" center "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {1350, 295} {39, 24} display 0.000000 0.00100 "off_pulse" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {1380, 293} {39, 35} label 0.000000 0.00100 "" left "Lucida Grande" 13 {0, 0, 0} {59392, 59392, 59392} nobackground noborder sec
ioMenu {758, 956} {98, 30} 2 303 "octave-1 ,octave 0, octave+1" transpose
ioMeter {1073, 829} {20, 18} {0, 65280, 65280} "port" 0.000000 "port" 0.000000 fill 1 0 mouse
ioText {914, 774} {29, 24} label 0.000000 0.00100 "" left "Lucida Grande" 13 {0, 0, 0} {59392, 59392, 59392} nobackground noborder ms
ioText {797, 771} {29, 24} label 0.000000 0.00100 "" left "Lucida Grande" 13 {0, 0, 0} {59392, 59392, 59392} nobackground noborder ms
ioMeter {1146, 883} {297, 13} {44544, 53504, 65280} "" 0.000000 "" -0.018182 fill 1 0 mouse
ioText {836, 857} {69, 24} label 0.000000 0.00100 "" center "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder Oct. Hstep
ioKnob {1214, 928} {48, 48} 0.010000 0.001000 0.001000 0.004000 del
ioText {1220, 963} {38, 24} display 0.000000 0.00100 "del" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {1217, 917} {40, 24} label 0.000000 0.00100 "" left "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder Delay
ioKnob {1285, 928} {48, 48} 0.900000 0.000000 0.010000 0.570000 fdbk
ioText {1288, 917} {40, 24} label 0.000000 0.00100 "" left "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder Feeday
ioText {1291, 963} {38, 24} display 0.000000 0.00100 "fdbk" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioCheckbox {1157, 942} {30, 30} off flsw
ioKnob {1355, 928} {48, 48} 2.000000 0.010000 0.010000 0.350001 rate
ioText {1361, 917} {38, 24} label 0.000000 0.00100 "" left "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder Rate
ioText {1361, 963} {38, 24} display 0.000000 0.00100 "rate" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioMeter {1163, 927} {18, 17} {65280, 0, 0} "flsw" 1.000000 "flsw" 1.000000 fill 1 0 mouse
ioText {1260, 614} {32, 24} label 0.000000 0.00100 "" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder CH1
ioText {1286, 614} {31, 24} label 0.000000 0.00100 "" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder CH2
ioMeter {999, 749} {19, 13} {0, 0, 0} "" 1.000000 "" 0.008547 fill 1 0 mouse
ioText {1153, 891} {85, 24} label 0.000000 0.00100 "" center "Lucida Grande" 12 {63744, 65280, 65280} {3328, 4864, 1024} nobackground noborder FLANGER
ioText {781, 156} {41, 26} display 0.000000 0.00100 "frosc1" left "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {781, 298} {41, 25} display 0.000000 0.00100 "frosc2" left "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {782, 440} {41, 25} display 0.000000 0.00100 "frosc3" left "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioText {929, 300} {39, 24} display 0.000000 0.00100 "lsquare2" left "Lucida Grande" 11 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioMeter {709, 761} {17, 18} {65280, 0, 0} "ledseq" 1.000000 "ledseq" 1.000000 fill 1 0 mouse
ioText {679, 795} {31, 26} display 0.000000 0.00100 "notebar" center "Lucida Grande" 14 {32768, 0, 0} {52224, 65280, 26112} nobackground noborder 
ioSlider {69, 766} {562, 34} 1.000000 16.000000 16.000000 nnote
ioText {679, 940} {52, 24} display 0.000000 0.00100 "incr" left "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder 
ioKnob {675, 905} {48, 48} 4.000000 0.100000 0.010000 1.199998 incr
ioText {845, 793} {48, 25} display 0.000000 0.00100 "dispindex" left "Lucida Grande" 14 {32768, 0, 0} {52224, 65280, 26112} nobackground noborder 
ioText {848, 813} {39, 24} label 0.000000 0.00100 "" center "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder Index
ioText {680, 890} {39, 24} label 0.000000 0.00100 "" center "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder Incr
ioText {662, 821} {63, 32} label 0.000000 0.00100 "" center "Lucida Grande" 12 {0, 0, 0} {59392, 59392, 59392} nobackground noborder #Events
ioButton {926, 93} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {991, 93} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {927, 240} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {990, 240} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {830, 293} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {890, 293} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {117, 147} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {117, 176} {40, 39} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {118, 216} {40, 39} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {118, 248} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {118, 284} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {118, 314} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {656, 853} {82, 41} event 1.000000 "" "SET = 1" "/" i9990 0 0.1
ioSlider {37, 808} {34, 169} 0.000000 0.120000 0.046080 shift
ioButton {924, 379} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {987, 379} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {832, 437} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {892, 437} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {832, 147} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {892, 147} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
</MacGUI>
<MacPresets>
LastPreset: BaseCellos
"PowerCellos02" "_Preset" 0.000000 "_Play" 0.000000 "_Pause" 0.000000 "_Offset" 0.000000 "_Gain" 1.000000 "k01-02" 0.000000 "k01-03" 0.000000 "k01-04" 0.000000 "k01-05" 0.000000 "k01-06" 0.000000 "k01-07" 0.000000 "k01-08" 0.000000 "k01-09" 0.000000 "k01-10" 0.000000 "k01-11" 0.000000 "k01-12" 0.000000 "k01-14" 0.000000 "k01-15" 0.000000 "k02-01" 0.000000 "k02-02" 0.000000 "k02-03" 0.000000 "k02-04" 0.000000 "k02-05" 0.000000 "k02-06" 0.000000 "k02-07" 1.000000 "k02-08" 0.000000 "k02-09" 0.000000 "k02-10" 0.000000 "k02-11" 0.000000 "k02-13" 0.000000 "k02-14" 0.000000 "k02-15" 0.000000 "k02-16" 0.000000 "k03-01" 0.000000 "k03-02" 0.000000 "k03-03" 0.000000 "k03-04" 0.000000 "k03-05" 0.000000 "k03-06" 0.000000 "k03-07" 1.000000 "k03-08" 0.000000 "k04-01" 0.000000 "k04-02" 0.000000 "k04-03" 0.000000 "k04-04" 0.000000 "k04-05" 0.000000 "k04-06" 0.000000 "k04-07" 0.000000 "k04-08" 0.000000 "k03-09" 0.000000 "k04-09" 0.000000 "k03-10" 0.000000 "k03-11" 0.000000 "k04-10" 0.000000 "k04-11" 0.000000 "k03-12" 0.000000 "k04-12" 0.000000 "k03-13" 0.000000 "k03-14" 0.000000 "k04-13" 0.000000 "k04-14" 0.000000 "k03-15" 0.000000 "k04-15" 0.000000 "k03-16" 0.000000 "k04-16" 0.000000 "k05-01" 0.000000 "k06-01" 0.000000 "k05-02" 0.000000 "k06-02" 0.000000 "k05-03" 0.000000 "k06-03" 0.000000 "k07-01" 0.000000 "k01-01" 0.000000 "k07-03" 0.000000 "k05-04" 0.000000 "k05-05" 0.000000 "k06-04" 0.000000 "k06-05" 0.000000 "k07-04" 0.000000 "k05-06" 0.000000 "k05-07" 0.000000 "k06-06" 0.000000 "k06-07" 1.000000 "k07-07" 1.000000 "k05-08" 0.000000 "k05-09" 0.000000 "k06-08" 0.000000 "k06-09" 0.000000 "k07-08" 0.000000 "k08-02" 0.000000 "k08-03" 0.000000 "k08-04" 0.000000 "k08-05" 0.000000 "k08-06" 0.000000 "k08-07" 0.000000 "k08-08" 0.000000 "k05-10" 0.000000 "k05-11" 0.000000 "k05-12" 0.000000 "k06-10" 0.000000 "k06-11" 0.000000 "k06-12" 0.000000 "k05-13" 0.000000 "k05-14" 0.000000 "k06-13" 0.000000 "k06-14" 0.000000 "k05-15" 0.000000 "k06-15" 0.000000 "k05-16" 0.000000 "k06-16" 0.000000 "k09-02" 0.000000 "k09-03" 0.000000 "k10-02" 1.000000 "k10-03" 1.000000 "k09-04" 0.000000 "k10-04" 0.000000 "k09-05" 0.000000 "k09-06" 0.000000 "k09-07" 0.000000 "k10-05" 0.000000 "k10-06" 0.000000 "k11-02" 0.000000 "k09-08" 0.000000 "k10-08" 1.000000 "k12-02" 0.000000 "k12-03" 0.000000 "k12-07" 0.000000 "k12-08" 0.000000 "k11-09" 0.000000 "k11-10" 0.000000 "k11-11" 0.000000 "k13-02" 0.000000 "k13-03" 0.000000 "k13-04" 0.000000 "k13-07" 0.000000 "k13-08" 0.000000 "k11-14" 0.000000 "k14-02" 1.000000 "k14-03" 1.000000 "k14-04" 0.000000 "k15-09" 0.000000 "k15-10" 0.000000 "k15-11" 0.000000 "k16-09" 0.000000 "k16-10" 0.000000 "k16-11" 0.000000 "k01-13" 0.000000 "k01-16" 0.000000 "shape1" 0.501000 "lsine1" 0.590000 "lramp1" 1.000000 "frosc1" 5.111997 "dispfrosc1" 104.350433 "k07-02" 0.000000 "frosc2" 5.851000 "shape2" 0.500000 "dispfrosc2" 217.238159 "lsquare2" 0.940000 "lramp2" 1.000000 "frosc3" 5.788000 "shape3" 0.766000 "dispfrosc3" 6.037236 "lsquare3" 1.000000 "lramp3" 1.000000 "left" 1.000000 "blackstrip" 1.000000 "levin_1" 1.000000 "levin_2" 0.500000 "attack" 0.003000 "eon" 1.625000 "decay" 0.040000 "off_pulse" 0.050000 "mutech1" 0.000000 "mutech2" 0.000000 "wetdry" 1.000000 "cutoff" 0.624998 "res" 0.490000 "fillev" 1.000000 "revlev" 0.440000 "filch1" -6.000000 "filch2" -6.000000 "traplev" 0.740000 "signal" 0.830000 "RMS1" 0.954569 "joy_h" -6.974790 "joy_v" 1.403509 "dispcutoff" 775.830994 "rmlev" 0.770000 "disp_joy_h" 0.000000 "disp_joy_v" 1.000000 "range_v" 0.180000 "range_h" 0.290000 "k15-14" 0.000000 "lamp" 1.000000 "disppitch" 8.080000 "led1" 0.000000 "led2" 0.000000 "led3" 0.000000 "led4" 0.000000 "led5" 0.000000 "vel" 0.725000 "seq" 1.000000 "dir" 0.000000 "port" 0.000000 "time" 0.010000 "lambda" 42.999962 "avrg" 0.500000 "ledmute" 0.000000 "fin" 0.990852 "envsw" 0.000000 "AutoMan" 0.000000 "fout" 0.002315 "auto" 1.000000 "man" 0.000000 "trig" 0.000000 "RMS2" 0.954569 "s01" 43.000000 "s03" 36.000000 "s04" 39.000000 "s06" 43.000000 "s07" 32.000000 "s08" 41.000000 "s09" 46.000000 "s10" 42.000000 "s11" 46.000000 "s12" 46.000000 "s13" 38.000000 "s14" 56.000000 "s15" 45.000000 "s16" 35.000000 "s05" 36.000000 "s02" 50.000000 "L01" 1.000000 "L02" 1.000000 "L03" 1.000000 "L04" 1.000000 "L06" 1.000000 "L05" 1.000000 "L07" 1.000000 "L08" 1.000000 "L09" 1.000000 "L10" 1.000000 "L11" 1.000000 "L12" 1.000000 "L13" 1.000000 "L14" 1.000000 "L15" 1.000000 "L16" 1.000000 "C01" 0.488437 "C02" 0.427891 "C03" 0.735808 "C04" 0.460106 "C06" 0.552593 "C05" 0.610660 "C07" 0.440534 "C08" 0.537382 "C09" 0.710784 "C10" 0.596125 "C11" 0.679411 "C12" 0.440669 "C13" 0.663558 "C14" 0.810308 "C15" 0.445564 "C16" 0.565221 "P01" 0.397580 "P02" 0.302945 "P03" 0.010311 "P04" 0.528813 "P05" 0.195342 "P06" 0.184058 "P07" 0.286982 "P08" 0.316377 "P09" 0.804471 "P10" 0.408425 "P11" 0.031688 "P12" 0.424345 "P13" 0.513042 "P14" 0.468235 "P15" 0.624210 "P16" 0.185871 "led6" 0.000000 "led7" 0.000000 "led8" 0.000000 "led9" 0.000000 "led10" 0.000000 "led11" 0.000000 "led12" 0.000000 "led13" 0.000000 "led14" 1.000000 "led15" 0.000000 "led16" 0.000000 "atck" 0.003500 "dec" 0.030000 "on" 0.930000 "cutref" 0.410000 "panrange" 0.560000 "noiselev" 1.000000 "noisecolor" -0.500000 "synth" 0.000000 "frwd" 1.000000 "rvrs" 0.000000 "in_1" 0.000043 "in_2" 0.000028 "transpose" 2.000000 "del" 0.004000 "fdbk" 0.140000 "flsw" 1.000000 "rate" 0.210001 "status" 0.000000 "kdelta" 3241.233398 "disp2" 0.397580 
"PowerCellos03" "_Preset" 8.000000 "_Play" 0.000000 "_Pause" 0.000000 "_Offset" 0.000000 "_Gain" 1.000000 "k01-02" 0.000000 "k01-03" 0.000000 "k01-04" 0.000000 "k01-05" 0.000000 "k01-06" 0.000000 "k01-07" 0.000000 "k01-08" 0.000000 "k01-09" 0.000000 "k01-10" 0.000000 "k01-11" 0.000000 "k01-12" 0.000000 "k01-14" 0.000000 "k01-15" 0.000000 "k02-01" 0.000000 "k02-02" 0.000000 "k02-03" 0.000000 "k02-04" 0.000000 "k02-05" 0.000000 "k02-06" 0.000000 "k02-07" 1.000000 "k02-08" 0.000000 "k02-09" 0.000000 "k02-10" 0.000000 "k02-11" 0.000000 "k02-13" 0.000000 "k02-14" 0.000000 "k02-15" 0.000000 "k02-16" 0.000000 "k03-01" 0.000000 "k03-02" 0.000000 "k03-03" 0.000000 "k03-04" 0.000000 "k03-05" 0.000000 "k03-06" 0.000000 "k03-07" 1.000000 "k03-08" 0.000000 "k04-01" 0.000000 "k04-02" 0.000000 "k04-03" 0.000000 "k04-04" 0.000000 "k04-05" 0.000000 "k04-06" 0.000000 "k04-07" 0.000000 "k04-08" 0.000000 "k03-09" 0.000000 "k04-09" 0.000000 "k03-10" 0.000000 "k03-11" 0.000000 "k04-10" 0.000000 "k04-11" 0.000000 "k03-12" 0.000000 "k04-12" 0.000000 "k03-13" 0.000000 "k03-14" 0.000000 "k04-13" 0.000000 "k04-14" 0.000000 "k03-15" 0.000000 "k04-15" 0.000000 "k03-16" 0.000000 "k04-16" 0.000000 "k05-01" 0.000000 "k06-01" 0.000000 "k05-02" 0.000000 "k06-02" 0.000000 "k05-03" 0.000000 "k06-03" 0.000000 "k07-01" 0.000000 "k01-01" 0.000000 "k07-03" 0.000000 "k05-04" 0.000000 "k05-05" 0.000000 "k06-04" 0.000000 "k06-05" 0.000000 "k07-04" 0.000000 "k05-06" 0.000000 "k05-07" 0.000000 "k06-06" 0.000000 "k06-07" 1.000000 "k07-07" 1.000000 "k05-08" 0.000000 "k05-09" 0.000000 "k06-08" 0.000000 "k06-09" 0.000000 "k07-08" 0.000000 "k08-02" 0.000000 "k08-03" 0.000000 "k08-04" 0.000000 "k08-05" 0.000000 "k08-06" 0.000000 "k08-07" 0.000000 "k08-08" 0.000000 "k05-10" 0.000000 "k05-11" 0.000000 "k05-12" 0.000000 "k06-10" 0.000000 "k06-11" 0.000000 "k06-12" 0.000000 "k05-13" 0.000000 "k05-14" 0.000000 "k06-13" 0.000000 "k06-14" 0.000000 "k05-15" 0.000000 "k06-15" 0.000000 "k05-16" 0.000000 "k06-16" 0.000000 "k09-02" 0.000000 "k09-03" 0.000000 "k10-02" 1.000000 "k10-03" 1.000000 "k09-04" 0.000000 "k10-04" 0.000000 "k09-05" 0.000000 "k09-06" 0.000000 "k09-07" 0.000000 "k10-05" 0.000000 "k10-06" 0.000000 "k11-02" 0.000000 "k09-08" 0.000000 "k10-08" 1.000000 "k12-02" 0.000000 "k12-03" 0.000000 "k12-07" 0.000000 "k12-08" 0.000000 "k11-09" 0.000000 "k11-10" 0.000000 "k11-11" 0.000000 "k13-02" 0.000000 "k13-03" 0.000000 "k13-04" 0.000000 "k13-07" 0.000000 "k13-08" 0.000000 "k11-14" 0.000000 "k14-02" 1.000000 "k14-03" 1.000000 "k14-04" 0.000000 "k15-09" 0.000000 "k15-10" 0.000000 "k15-11" 0.000000 "k16-09" 0.000000 "k16-10" 0.000000 "k16-11" 0.000000 "k01-13" 0.000000 "k01-16" 0.000000 "shape1" 0.501000 "lsine1" 0.590000 "lramp1" 1.000000 "frosc1" 5.111997 "dispfrosc1" 104.350433 "k07-02" 0.000000 "frosc2" 5.851000 "shape2" 0.500000 "dispfrosc2" 217.238159 "lsquare2" 0.940000 "lramp2" 1.000000 "frosc3" 5.788000 "shape3" 0.766000 "dispfrosc3" 6.037236 "lsquare3" 1.000000 "lramp3" 1.000000 "left" 1.000000 "blackstrip" 1.000000 "levin_1" 1.000000 "levin_2" 0.500000 "attack" 0.003000 "eon" 1.625000 "decay" 0.040000 "off_pulse" 0.050000 "mutech1" 0.000000 "mutech2" 0.000000 "wetdry" 1.000000 "cutoff" 0.120000 "res" 1.020000 "fillev" 1.000000 "revlev" 0.540000 "filch1" -6.000000 "filch2" -6.000000 "traplev" 0.740000 "signal" 0.830000 "RMS1" 0.235983 "joy_h" -6.974790 "joy_v" 1.403509 "dispcutoff" 13.170558 "rmlev" 0.770000 "disp_joy_h" 0.000000 "disp_joy_v" 1.000000 "range_v" 0.180000 "range_h" 0.290000 "k15-14" 0.000000 "lamp" 1.000000 "disppitch" 8.030000 "led1" 0.000000 "led2" 0.000000 "led3" 0.000000 "led4" 1.000000 "led5" 0.000000 "vel" 0.725000 "seq" 1.000000 "dir" 0.000000 "port" 0.000000 "time" 0.010000 "lambda" 42.999962 "avrg" 0.500000 "ledmute" 0.000000 "fin" 0.990852 "envsw" 0.000000 "AutoMan" 0.000000 "fout" 0.002315 "auto" 1.000000 "man" 0.000000 "trig" 0.000000 "RMS2" 0.235983 "s01" 44.000000 "s03" 44.000000 "s04" 51.000000 "s06" 42.000000 "s07" 42.000000 "s08" 43.000000 "s09" 40.000000 "s10" 52.000000 "s11" 42.000000 "s12" 39.000000 "s13" 37.000000 "s14" 34.000000 "s15" 33.000000 "s16" 32.000000 "s05" 40.000000 "s02" 40.000000 "L01" 1.000000 "L02" 1.000000 "L03" 1.000000 "L04" 1.000000 "L06" 1.000000 "L05" 1.000000 "L07" 1.000000 "L08" 1.000000 "L09" 1.000000 "L10" 1.000000 "L11" 1.000000 "L12" 1.000000 "L13" 1.000000 "L14" 1.000000 "L15" 1.000000 "L16" 1.000000 "C01" 0.412527 "C02" 0.603481 "C03" 0.425520 "C04" 0.533764 "C06" 0.311890 "C05" 0.374210 "C07" 0.312111 "C08" 0.669550 "C09" 0.283005 "C10" 0.256133 "C11" 0.242656 "C12" 0.263578 "C13" 0.380431 "C14" 0.543238 "C15" 0.260476 "C16" 0.297728 "P01" 0.397580 "P02" 0.302945 "P03" 0.010311 "P04" 0.528813 "P05" 0.195342 "P06" 0.184058 "P07" 0.286982 "P08" 0.316377 "P09" 0.804471 "P10" 0.408425 "P11" 0.031688 "P12" 0.424345 "P13" 0.513042 "P14" 0.468235 "P15" 0.624210 "P16" 0.185871 "led6" 0.000000 "led7" 0.000000 "led8" 0.000000 "led9" 0.000000 "led10" 0.000000 "led11" 0.000000 "led12" 0.000000 "led13" 0.000000 "led14" 0.000000 "led15" 0.000000 "led16" 0.000000 "atck" 0.003500 "dec" 0.030000 "on" 0.160000 "cutref" 0.230000 "panrange" 0.560000 "noiselev" 1.000000 "noisecolor" -0.500000 "synth" 0.000000 "frwd" 1.000000 "rvrs" 0.000000 "in_1" 0.000035 "in_2" 0.000023 "transpose" 2.000000 "del" 0.004000 "fdbk" 0.140000 "flsw" 1.000000 "rate" 0.210001 "status" 0.000000 "kdelta" 2135.056396 "disp2" 0.397580 
"PowerCellos04" "_Preset" 9.000000 "_Play" 0.000000 "_Pause" 0.000000 "_Offset" 0.000000 "_Gain" 1.000000 "k01-02" 0.000000 "k01-03" 0.000000 "k01-04" 0.000000 "k01-05" 0.000000 "k01-06" 0.000000 "k01-07" 0.000000 "k01-08" 0.000000 "k01-09" 0.000000 "k01-10" 0.000000 "k01-11" 0.000000 "k01-12" 0.000000 "k01-14" 0.000000 "k01-15" 0.000000 "k02-01" 0.000000 "k02-02" 0.000000 "k02-03" 0.000000 "k02-04" 0.000000 "k02-05" 0.000000 "k02-06" 0.000000 "k02-07" 1.000000 "k02-08" 0.000000 "k02-09" 0.000000 "k02-10" 0.000000 "k02-11" 0.000000 "k02-13" 0.000000 "k02-14" 0.000000 "k02-15" 0.000000 "k02-16" 0.000000 "k03-01" 0.000000 "k03-02" 0.000000 "k03-03" 0.000000 "k03-04" 0.000000 "k03-05" 0.000000 "k03-06" 0.000000 "k03-07" 1.000000 "k03-08" 0.000000 "k04-01" 0.000000 "k04-02" 0.000000 "k04-03" 0.000000 "k04-04" 0.000000 "k04-05" 0.000000 "k04-06" 0.000000 "k04-07" 0.000000 "k04-08" 0.000000 "k03-09" 0.000000 "k04-09" 0.000000 "k03-10" 0.000000 "k03-11" 0.000000 "k04-10" 0.000000 "k04-11" 0.000000 "k03-12" 0.000000 "k04-12" 0.000000 "k03-13" 0.000000 "k03-14" 0.000000 "k04-13" 0.000000 "k04-14" 0.000000 "k03-15" 0.000000 "k04-15" 0.000000 "k03-16" 0.000000 "k04-16" 0.000000 "k05-01" 0.000000 "k06-01" 0.000000 "k05-02" 0.000000 "k06-02" 0.000000 "k05-03" 0.000000 "k06-03" 0.000000 "k07-01" 0.000000 "k01-01" 0.000000 "k07-03" 0.000000 "k05-04" 0.000000 "k05-05" 0.000000 "k06-04" 0.000000 "k06-05" 0.000000 "k07-04" 0.000000 "k05-06" 0.000000 "k05-07" 0.000000 "k06-06" 0.000000 "k06-07" 1.000000 "k07-07" 1.000000 "k05-08" 0.000000 "k05-09" 0.000000 "k06-08" 0.000000 "k06-09" 0.000000 "k07-08" 0.000000 "k08-02" 0.000000 "k08-03" 0.000000 "k08-04" 0.000000 "k08-05" 0.000000 "k08-06" 0.000000 "k08-07" 0.000000 "k08-08" 0.000000 "k05-10" 0.000000 "k05-11" 0.000000 "k05-12" 0.000000 "k06-10" 0.000000 "k06-11" 0.000000 "k06-12" 0.000000 "k05-13" 0.000000 "k05-14" 0.000000 "k06-13" 0.000000 "k06-14" 0.000000 "k05-15" 0.000000 "k06-15" 0.000000 "k05-16" 0.000000 "k06-16" 0.000000 "k09-02" 0.000000 "k09-03" 0.000000 "k10-02" 1.000000 "k10-03" 1.000000 "k09-04" 0.000000 "k10-04" 0.000000 "k09-05" 0.000000 "k09-06" 0.000000 "k09-07" 0.000000 "k10-05" 0.000000 "k10-06" 0.000000 "k11-02" 0.000000 "k09-08" 0.000000 "k10-08" 1.000000 "k12-02" 0.000000 "k12-03" 0.000000 "k12-07" 0.000000 "k12-08" 0.000000 "k11-09" 0.000000 "k11-10" 0.000000 "k11-11" 0.000000 "k13-02" 0.000000 "k13-03" 0.000000 "k13-04" 0.000000 "k13-07" 0.000000 "k13-08" 0.000000 "k11-14" 1.000000 "k14-02" 1.000000 "k14-03" 1.000000 "k14-04" 0.000000 "k15-09" 0.000000 "k15-10" 0.000000 "k15-11" 0.000000 "k16-09" 0.000000 "k16-10" 0.000000 "k16-11" 0.000000 "k01-13" 0.000000 "k01-16" 0.000000 "shape1" 0.501000 "lsine1" 0.590000 "lramp1" 1.000000 "frosc1" 5.111997 "dispfrosc1" 104.350433 "k07-02" 0.000000 "frosc2" 5.851000 "shape2" 0.500000 "dispfrosc2" 217.238159 "lsquare2" 0.940000 "lramp2" 1.000000 "frosc3" 5.788000 "shape3" 0.766000 "dispfrosc3" 6.037236 "lsquare3" 1.000000 "lramp3" 1.000000 "left" 1.000000 "blackstrip" 1.000000 "levin_1" 1.000000 "levin_2" 0.500000 "attack" 0.003000 "eon" 0.745001 "decay" 0.040000 "off_pulse" 0.050000 "mutech1" 0.000000 "mutech2" 0.000000 "wetdry" 1.000000 "cutoff" 0.120000 "res" 0.660000 "fillev" 1.000000 "revlev" 0.540000 "filch1" -6.000000 "filch2" -6.000000 "traplev" 0.310000 "signal" 1.000000 "RMS1" 0.235572 "joy_h" -6.974790 "joy_v" 1.403509 "dispcutoff" 13.170558 "rmlev" 0.770000 "disp_joy_h" 0.000000 "disp_joy_v" 1.000000 "range_v" 0.180000 "range_h" 0.290000 "k15-14" 0.000000 "lamp" 1.000000 "disppitch" 6.110000 "led1" 0.000000 "led2" 0.000000 "led3" 0.000000 "led4" 0.000000 "led5" 0.000000 "vel" 0.725000 "seq" 1.000000 "dir" 0.000000 "port" 0.000000 "time" 0.010000 "lambda" 42.999962 "avrg" 0.500000 "ledmute" 0.000000 "fin" 0.990852 "envsw" 0.000000 "AutoMan" 0.000000 "fout" 0.002315 "auto" 1.000000 "man" 0.000000 "trig" 0.000000 "RMS2" 0.235572 "s01" 45.000000 "s03" 42.000000 "s04" 49.000000 "s06" 42.000000 "s07" 39.000000 "s08" 28.000000 "s09" 55.000000 "s10" 48.000000 "s11" 43.000000 "s12" 41.000000 "s13" 35.000000 "s14" 36.000000 "s15" 45.000000 "s16" 50.000000 "s05" 54.000000 "s02" 39.000000 "L01" 1.000000 "L02" 1.000000 "L03" 1.000000 "L04" 1.000000 "L06" 1.000000 "L05" 1.000000 "L07" 1.000000 "L08" 1.000000 "L09" 1.000000 "L10" 1.000000 "L11" 1.000000 "L12" 1.000000 "L13" 1.000000 "L14" 1.000000 "L15" 1.000000 "L16" 1.000000 "C01" 0.412527 "C02" 0.603481 "C03" 0.425520 "C04" 0.533764 "C06" 0.311890 "C05" 0.374210 "C07" 0.312111 "C08" 0.669550 "C09" 0.283005 "C10" 0.256133 "C11" 0.242656 "C12" 0.263578 "C13" 0.380431 "C14" 0.543238 "C15" 0.260476 "C16" 0.297728 "P01" 0.397580 "P02" 0.302945 "P03" 0.010311 "P04" 0.528813 "P05" 0.195342 "P06" 0.184058 "P07" 0.286982 "P08" 0.316377 "P09" 0.804471 "P10" 0.408425 "P11" 0.031688 "P12" 0.424345 "P13" 0.513042 "P14" 0.468235 "P15" 0.624210 "P16" 0.185871 "led6" 0.000000 "led7" 0.000000 "led8" 0.000000 "led9" 0.000000 "led10" 0.000000 "led11" 0.000000 "led12" 0.000000 "led13" 1.000000 "led14" 0.000000 "led15" 0.000000 "led16" 0.000000 "atck" 0.003500 "dec" 0.030000 "on" 0.160000 "cutref" 0.230000 "panrange" 0.560000 "noiselev" 1.000000 "noisecolor" -0.500000 "synth" 0.000000 "frwd" 1.000000 "rvrs" 0.000000 "in_1" 0.000041 "in_2" 0.000029 "transpose" 2.000000 "del" 0.004000 "fdbk" 0.140000 "flsw" 1.000000 "rate" 0.210001 "status" 0.000000 "kdelta" 1521.722046 "disp2" 0.397580 
"POwerCellos05" "_Preset" 10.000000 "_Play" 0.000000 "_Pause" 0.000000 "_Offset" 0.000000 "_Gain" 1.000000 "k01-02" 0.000000 "k01-03" 0.000000 "k01-04" 0.000000 "k01-05" 1.000000 "k01-06" 0.000000 "k01-07" 0.000000 "k01-08" 0.000000 "k01-09" 0.000000 "k01-10" 0.000000 "k01-11" 0.000000 "k01-12" 0.000000 "k01-14" 0.000000 "k01-15" 0.000000 "k02-01" 0.000000 "k02-02" 0.000000 "k02-03" 0.000000 "k02-04" 0.000000 "k02-05" 0.000000 "k02-06" 0.000000 "k02-07" 1.000000 "k02-08" 0.000000 "k02-09" 0.000000 "k02-10" 0.000000 "k02-11" 0.000000 "k02-13" 0.000000 "k02-14" 0.000000 "k02-15" 0.000000 "k02-16" 0.000000 "k03-01" 0.000000 "k03-02" 0.000000 "k03-03" 0.000000 "k03-04" 0.000000 "k03-05" 0.000000 "k03-06" 0.000000 "k03-07" 1.000000 "k03-08" 0.000000 "k04-01" 0.000000 "k04-02" 0.000000 "k04-03" 0.000000 "k04-04" 0.000000 "k04-05" 0.000000 "k04-06" 1.000000 "k04-07" 0.000000 "k04-08" 0.000000 "k03-09" 0.000000 "k04-09" 0.000000 "k03-10" 0.000000 "k03-11" 0.000000 "k04-10" 0.000000 "k04-11" 0.000000 "k03-12" 0.000000 "k04-12" 0.000000 "k03-13" 0.000000 "k03-14" 0.000000 "k04-13" 0.000000 "k04-14" 0.000000 "k03-15" 0.000000 "k04-15" 0.000000 "k03-16" 0.000000 "k04-16" 0.000000 "k05-01" 0.000000 "k06-01" 0.000000 "k05-02" 0.000000 "k06-02" 0.000000 "k05-03" 0.000000 "k06-03" 0.000000 "k07-01" 0.000000 "k01-01" 0.000000 "k07-03" 0.000000 "k05-04" 0.000000 "k05-05" 0.000000 "k06-04" 0.000000 "k06-05" 0.000000 "k07-04" 0.000000 "k05-06" 0.000000 "k05-07" 1.000000 "k06-06" 0.000000 "k06-07" 1.000000 "k07-07" 1.000000 "k05-08" 0.000000 "k05-09" 0.000000 "k06-08" 0.000000 "k06-09" 0.000000 "k07-08" 0.000000 "k08-02" 0.000000 "k08-03" 0.000000 "k08-04" 0.000000 "k08-05" 0.000000 "k08-06" 0.000000 "k08-07" 0.000000 "k08-08" 0.000000 "k05-10" 0.000000 "k05-11" 0.000000 "k05-12" 0.000000 "k06-10" 0.000000 "k06-11" 0.000000 "k06-12" 0.000000 "k05-13" 0.000000 "k05-14" 0.000000 "k06-13" 0.000000 "k06-14" 0.000000 "k05-15" 0.000000 "k06-15" 0.000000 "k05-16" 0.000000 "k06-16" 0.000000 "k09-02" 0.000000 "k09-03" 0.000000 "k10-02" 1.000000 "k10-03" 1.000000 "k09-04" 0.000000 "k10-04" 0.000000 "k09-05" 0.000000 "k09-06" 0.000000 "k09-07" 0.000000 "k10-05" 0.000000 "k10-06" 0.000000 "k11-02" 0.000000 "k09-08" 0.000000 "k10-08" 1.000000 "k12-02" 0.000000 "k12-03" 0.000000 "k12-07" 0.000000 "k12-08" 0.000000 "k11-09" 0.000000 "k11-10" 0.000000 "k11-11" 0.000000 "k13-02" 1.000000 "k13-03" 1.000000 "k13-04" 0.000000 "k13-07" 0.000000 "k13-08" 0.000000 "k11-14" 1.000000 "k14-02" 1.000000 "k14-03" 1.000000 "k14-04" 0.000000 "k15-09" 0.000000 "k15-10" 0.000000 "k15-11" 0.000000 "k16-09" 0.000000 "k16-10" 0.000000 "k16-11" 0.000000 "k01-13" 0.000000 "k01-16" 0.000000 "shape1" 0.501000 "lsine1" 0.590000 "lramp1" 0.440000 "frosc1" 6.966997 "dispfrosc1" 704.678894 "k07-02" 0.000000 "frosc2" 6.859000 "shape2" 0.359000 "dispfrosc2" 619.552979 "lsquare2" 0.290000 "lramp2" 0.210000 "frosc3" 6.026000 "shape3" 0.517000 "dispfrosc3" 8.014170 "lsquare3" 0.540000 "lramp3" 0.430000 "left" 1.000000 "blackstrip" 1.000000 "levin_1" 1.000000 "levin_2" 0.500000 "attack" 0.012000 "eon" 0.490000 "decay" 0.335000 "off_pulse" 0.050000 "mutech1" 0.000000 "mutech2" 0.000000 "wetdry" 1.000000 "cutoff" 0.200000 "res" 0.100000 "fillev" 1.000000 "revlev" 0.460000 "filch1" -6.000000 "filch2" -6.000000 "traplev" 0.200000 "signal" 1.000000 "RMS1" 0.758098 "joy_h" -6.974790 "joy_v" 1.403509 "dispcutoff" 25.120474 "rmlev" 1.000000 "disp_joy_h" 0.000000 "disp_joy_v" 1.000000 "range_v" 0.180000 "range_h" 0.290000 "k15-14" 0.000000 "lamp" 1.000000 "disppitch" 8.040000 "led1" 0.000000 "led2" 1.000000 "led3" 0.000000 "led4" 0.000000 "led5" 0.000000 "vel" 0.725000 "seq" 1.000000 "dir" 0.000000 "port" 0.000000 "time" 0.010000 "lambda" 48.999958 "avrg" 0.500000 "ledmute" 0.000000 "fin" 0.990852 "envsw" 0.000000 "AutoMan" 0.000000 "fout" 0.002315 "auto" 1.000000 "man" 0.000000 "trig" 0.000000 "RMS2" 0.758098 "s01" 41.000000 "s03" 54.000000 "s04" 59.000000 "s06" 60.000000 "s07" 42.000000 "s08" 53.000000 "s09" 52.000000 "s10" 55.000000 "s11" 51.000000 "s12" 48.000000 "s13" 46.000000 "s14" 42.000000 "s15" 45.000000 "s16" 60.000000 "s05" 33.000000 "s02" 64.000000 "L01" 1.000000 "L02" 1.000000 "L03" 1.000000 "L04" 1.000000 "L06" 1.000000 "L05" 1.000000 "L07" 1.000000 "L08" 1.000000 "L09" 1.000000 "L10" 1.000000 "L11" 1.000000 "L12" 1.000000 "L13" 1.000000 "L14" 1.000000 "L15" 1.000000 "L16" 1.000000 "C01" 0.253451 "C02" 0.296887 "C03" 0.368919 "C04" 0.293678 "C06" 0.487912 "C05" 0.250716 "C07" 0.367429 "C08" 0.299318 "C09" 0.423331 "C10" 0.244531 "C11" 0.239044 "C12" 0.236535 "C13" 0.639609 "C14" 0.316532 "C15" 0.249290 "C16" 0.614926 "P01" 0.397580 "P02" 0.302945 "P03" 0.010311 "P04" 0.528813 "P05" 0.195342 "P06" 0.184058 "P07" 0.286982 "P08" 0.316377 "P09" 0.804471 "P10" 0.408425 "P11" 0.031688 "P12" 0.424345 "P13" 0.513042 "P14" 0.468235 "P15" 0.624210 "P16" 0.185871 "led6" 0.000000 "led7" 0.000000 "led8" 0.000000 "led9" 0.000000 "led10" 0.000000 "led11" 0.000000 "led12" 0.000000 "led13" 0.000000 "led14" 0.000000 "led15" 0.000000 "led16" 0.000000 "atck" 0.003500 "dec" 0.004000 "on" 0.760000 "cutref" 0.230000 "panrange" 0.560000 "noiselev" 1.000000 "noisecolor" -10.000000 "synth" 0.000000 "frwd" 1.000000 "rvrs" 0.000000 "in_1" 0.000049 "in_2" 0.000023 "transpose" 1.000000 "del" 0.002000 "fdbk" 0.380000 "flsw" 1.000000 "rate" 0.210001 "status" 0.000000 "kdelta" 1187.547485 "disp2" 0.397580 
"PowerCellos06" "_Preset" 11.000000 "_Play" 0.000000 "_Pause" 0.000000 "_Offset" 0.000000 "_Gain" 1.000000 "k01-02" 0.000000 "k01-03" 0.000000 "k01-04" 0.000000 "k01-05" 1.000000 "k01-06" 0.000000 "k01-07" 0.000000 "k01-08" 0.000000 "k01-09" 0.000000 "k01-10" 0.000000 "k01-11" 0.000000 "k01-12" 0.000000 "k01-14" 0.000000 "k01-15" 0.000000 "k02-01" 0.000000 "k02-02" 0.000000 "k02-03" 0.000000 "k02-04" 0.000000 "k02-05" 0.000000 "k02-06" 0.000000 "k02-07" 1.000000 "k02-08" 0.000000 "k02-09" 0.000000 "k02-10" 0.000000 "k02-11" 0.000000 "k02-13" 0.000000 "k02-14" 0.000000 "k02-15" 0.000000 "k02-16" 0.000000 "k03-01" 0.000000 "k03-02" 0.000000 "k03-03" 0.000000 "k03-04" 0.000000 "k03-05" 0.000000 "k03-06" 0.000000 "k03-07" 1.000000 "k03-08" 0.000000 "k04-01" 0.000000 "k04-02" 0.000000 "k04-03" 0.000000 "k04-04" 0.000000 "k04-05" 0.000000 "k04-06" 1.000000 "k04-07" 0.000000 "k04-08" 0.000000 "k03-09" 0.000000 "k04-09" 0.000000 "k03-10" 0.000000 "k03-11" 0.000000 "k04-10" 0.000000 "k04-11" 0.000000 "k03-12" 0.000000 "k04-12" 0.000000 "k03-13" 0.000000 "k03-14" 0.000000 "k04-13" 0.000000 "k04-14" 0.000000 "k03-15" 0.000000 "k04-15" 0.000000 "k03-16" 0.000000 "k04-16" 0.000000 "k05-01" 0.000000 "k06-01" 0.000000 "k05-02" 0.000000 "k06-02" 0.000000 "k05-03" 0.000000 "k06-03" 0.000000 "k07-01" 0.000000 "k01-01" 0.000000 "k07-03" 0.000000 "k05-04" 0.000000 "k05-05" 0.000000 "k06-04" 0.000000 "k06-05" 0.000000 "k07-04" 0.000000 "k05-06" 0.000000 "k05-07" 1.000000 "k06-06" 0.000000 "k06-07" 1.000000 "k07-07" 1.000000 "k05-08" 0.000000 "k05-09" 0.000000 "k06-08" 0.000000 "k06-09" 0.000000 "k07-08" 0.000000 "k08-02" 0.000000 "k08-03" 0.000000 "k08-04" 0.000000 "k08-05" 0.000000 "k08-06" 0.000000 "k08-07" 0.000000 "k08-08" 0.000000 "k05-10" 0.000000 "k05-11" 0.000000 "k05-12" 0.000000 "k06-10" 0.000000 "k06-11" 0.000000 "k06-12" 0.000000 "k05-13" 0.000000 "k05-14" 0.000000 "k06-13" 0.000000 "k06-14" 0.000000 "k05-15" 0.000000 "k06-15" 0.000000 "k05-16" 0.000000 "k06-16" 0.000000 "k09-02" 0.000000 "k09-03" 0.000000 "k10-02" 1.000000 "k10-03" 1.000000 "k09-04" 0.000000 "k10-04" 0.000000 "k09-05" 0.000000 "k09-06" 0.000000 "k09-07" 0.000000 "k10-05" 0.000000 "k10-06" 0.000000 "k11-02" 0.000000 "k09-08" 0.000000 "k10-08" 1.000000 "k12-02" 0.000000 "k12-03" 0.000000 "k12-07" 0.000000 "k12-08" 0.000000 "k11-09" 0.000000 "k11-10" 0.000000 "k11-11" 0.000000 "k13-02" 1.000000 "k13-03" 1.000000 "k13-04" 0.000000 "k13-07" 0.000000 "k13-08" 0.000000 "k11-14" 1.000000 "k14-02" 1.000000 "k14-03" 1.000000 "k14-04" 0.000000 "k15-09" 0.000000 "k15-10" 0.000000 "k15-11" 0.000000 "k16-09" 0.000000 "k16-10" 0.000000 "k16-11" 0.000000 "k01-13" 0.000000 "k01-16" 0.000000 "shape1" 0.501000 "lsine1" 0.590000 "lramp1" 0.720000 "frosc1" 6.966997 "dispfrosc1" 704.678894 "k07-02" 0.000000 "frosc2" 6.859000 "shape2" 0.359000 "dispfrosc2" 619.552979 "lsquare2" 0.630000 "lramp2" 0.320000 "frosc3" 6.026000 "shape3" 0.517000 "dispfrosc3" 8.014170 "lsquare3" 0.880000 "lramp3" 0.860000 "left" 1.000000 "blackstrip" 1.000000 "levin_1" 1.000000 "levin_2" 0.500000 "attack" 0.239000 "eon" 0.010000 "decay" 0.335000 "off_pulse" 1.000000 "mutech1" 0.000000 "mutech2" 0.000000 "wetdry" 1.000000 "cutoff" 0.245001 "res" 0.310000 "fillev" 1.000000 "revlev" 0.540000 "filch1" 1.199998 "filch2" 0.650001 "traplev" 0.480000 "signal" 1.000000 "RMS1" 0.855808 "joy_h" -6.974790 "joy_v" 1.403509 "dispcutoff" 36.121567 "rmlev" 1.000000 "disp_joy_h" 0.000000 "disp_joy_v" 1.000000 "range_v" 0.180000 "range_h" 0.290000 "k15-14" 0.000000 "lamp" 1.000000 "disppitch" 6.040000 "led1" 0.000000 "led2" 0.000000 "led3" 0.000000 "led4" 0.000000 "led5" 0.000000 "vel" 0.725000 "seq" 1.000000 "dir" 0.000000 "port" 1.000000 "time" 0.010000 "lambda" 46.999966 "avrg" 0.500000 "ledmute" 0.000000 "fin" 0.990852 "envsw" 0.000000 "AutoMan" 0.000000 "fout" 0.002315 "auto" 1.000000 "man" 0.000000 "trig" 0.000000 "RMS2" 0.855808 "s01" 50.000000 "s03" 40.000000 "s04" 37.000000 "s06" 47.000000 "s07" 49.000000 "s08" 47.000000 "s09" 54.000000 "s10" 47.000000 "s11" 51.000000 "s12" 44.000000 "s13" 35.000000 "s14" 40.000000 "s15" 42.000000 "s16" 47.000000 "s05" 38.000000 "s02" 38.000000 "L01" 1.000000 "L02" 1.000000 "L03" 1.000000 "L04" 1.000000 "L06" 1.000000 "L05" 1.000000 "L07" 1.000000 "L08" 1.000000 "L09" 1.000000 "L10" 1.000000 "L11" 1.000000 "L12" 1.000000 "L13" 1.000000 "L14" 1.000000 "L15" 1.000000 "L16" 1.000000 "C01" 0.290876 "C02" 0.387436 "C03" 0.449140 "C04" 0.250100 "C06" 0.432769 "C05" 0.235884 "C07" 0.367025 "C08" 0.537879 "C09" 0.618212 "C10" 0.432625 "C11" 0.361012 "C12" 0.328679 "C13" 0.684725 "C14" 0.393940 "C15" 0.288383 "C16" 0.399453 "P01" 0.324448 "P02" 0.320844 "P03" 0.383941 "P04" 0.044650 "P05" 0.040118 "P06" 0.052032 "P07" 0.773956 "P08" 0.393527 "P09" 0.446795 "P10" 0.161924 "P11" 0.596632 "P12" 0.130370 "P13" 0.131330 "P14" 0.535548 "P15" 0.622322 "P16" 0.360317 "led6" 0.000000 "led7" 0.000000 "led8" 0.000000 "led9" 0.000000 "led10" 0.000000 "led11" 0.000000 "led12" 0.000000 "led13" 0.000000 "led14" 1.000000 "led15" 0.000000 "led16" 0.000000 "atck" 0.003500 "dec" 0.004000 "on" 1.000000 "cutref" 0.230000 "panrange" 0.560000 "noiselev" 1.000000 "noisecolor" -10.000000 "synth" 0.000000 "frwd" 1.000000 "rvrs" 0.000000 "in_1" 0.000041 "in_2" 0.000030 "transpose" 1.000000 "del" 0.004000 "fdbk" 0.140000 "flsw" 1.000000 "rate" 0.210001 "status" 0.000000 "kdelta" 1575.759644 "disp2" 0.324448 
"PowerCellos07" "_Preset" 7.000000 "_Play" 0.000000 "_Pause" 0.000000 "_Offset" 0.000000 "_Gain" 1.000000 "k01-02" 0.000000 "k01-03" 0.000000 "k01-04" 0.000000 "k01-05" 0.000000 "k01-06" 0.000000 "k01-07" 0.000000 "k01-08" 0.000000 "k01-09" 0.000000 "k01-10" 0.000000 "k01-11" 0.000000 "k01-12" 0.000000 "k01-14" 0.000000 "k01-15" 0.000000 "k02-01" 0.000000 "k02-02" 0.000000 "k02-03" 0.000000 "k02-04" 0.000000 "k02-05" 0.000000 "k02-06" 0.000000 "k02-07" 1.000000 "k02-08" 0.000000 "k02-09" 0.000000 "k02-10" 0.000000 "k02-11" 0.000000 "k02-13" 0.000000 "k02-14" 0.000000 "k02-15" 0.000000 "k02-16" 0.000000 "k03-01" 0.000000 "k03-02" 0.000000 "k03-03" 0.000000 "k03-04" 0.000000 "k03-05" 0.000000 "k03-06" 0.000000 "k03-07" 1.000000 "k03-08" 0.000000 "k04-01" 0.000000 "k04-02" 0.000000 "k04-03" 0.000000 "k04-04" 0.000000 "k04-05" 0.000000 "k04-06" 0.000000 "k04-07" 0.000000 "k04-08" 0.000000 "k03-09" 0.000000 "k04-09" 0.000000 "k03-10" 0.000000 "k03-11" 0.000000 "k04-10" 0.000000 "k04-11" 0.000000 "k03-12" 0.000000 "k04-12" 0.000000 "k03-13" 0.000000 "k03-14" 0.000000 "k04-13" 0.000000 "k04-14" 0.000000 "k03-15" 0.000000 "k04-15" 0.000000 "k03-16" 0.000000 "k04-16" 0.000000 "k05-01" 0.000000 "k06-01" 0.000000 "k05-02" 0.000000 "k06-02" 0.000000 "k05-03" 0.000000 "k06-03" 0.000000 "k07-01" 0.000000 "k01-01" 0.000000 "k07-03" 0.000000 "k05-04" 0.000000 "k05-05" 0.000000 "k06-04" 0.000000 "k06-05" 0.000000 "k07-04" 0.000000 "k05-06" 0.000000 "k05-07" 0.000000 "k06-06" 0.000000 "k06-07" 1.000000 "k07-07" 1.000000 "k05-08" 0.000000 "k05-09" 0.000000 "k06-08" 0.000000 "k06-09" 0.000000 "k07-08" 0.000000 "k08-02" 0.000000 "k08-03" 0.000000 "k08-04" 0.000000 "k08-05" 0.000000 "k08-06" 0.000000 "k08-07" 0.000000 "k08-08" 0.000000 "k05-10" 0.000000 "k05-11" 0.000000 "k05-12" 0.000000 "k06-10" 0.000000 "k06-11" 0.000000 "k06-12" 0.000000 "k05-13" 0.000000 "k05-14" 0.000000 "k06-13" 0.000000 "k06-14" 0.000000 "k05-15" 0.000000 "k06-15" 0.000000 "k05-16" 0.000000 "k06-16" 0.000000 "k09-02" 0.000000 "k09-03" 0.000000 "k10-02" 1.000000 "k10-03" 1.000000 "k09-04" 0.000000 "k10-04" 0.000000 "k09-05" 0.000000 "k09-06" 0.000000 "k09-07" 0.000000 "k10-05" 0.000000 "k10-06" 0.000000 "k11-02" 0.000000 "k09-08" 0.000000 "k10-08" 1.000000 "k12-02" 0.000000 "k12-03" 0.000000 "k12-07" 0.000000 "k12-08" 0.000000 "k11-09" 0.000000 "k11-10" 0.000000 "k11-11" 0.000000 "k13-02" 0.000000 "k13-03" 0.000000 "k13-04" 0.000000 "k13-07" 0.000000 "k13-08" 0.000000 "k11-14" 1.000000 "k14-02" 1.000000 "k14-03" 1.000000 "k14-04" 0.000000 "k15-09" 0.000000 "k15-10" 0.000000 "k15-11" 0.000000 "k16-09" 0.000000 "k16-10" 0.000000 "k16-11" 0.000000 "k01-13" 0.000000 "k01-16" 0.000000 "shape1" 0.501000 "lsine1" 0.590000 "lramp1" 1.000000 "frosc1" 5.111997 "dispfrosc1" 104.350433 "k07-02" 0.000000 "frosc2" 5.851000 "shape2" 0.500000 "dispfrosc2" 217.238159 "lsquare2" 0.940000 "lramp2" 1.000000 "frosc3" 5.788000 "shape3" 0.766000 "dispfrosc3" 6.037236 "lsquare3" 1.000000 "lramp3" 1.000000 "left" 1.000000 "blackstrip" 1.000000 "levin_1" 0.000000 "levin_2" 0.000000 "attack" 0.003000 "eon" 1.625000 "decay" 0.040000 "off_pulse" 0.050000 "mutech1" 0.000000 "mutech2" 0.000000 "wetdry" 1.000000 "cutoff" 0.434998 "res" 0.560000 "fillev" 1.000000 "revlev" 0.330000 "filch1" 0.300000 "filch2" -0.299998 "traplev" 0.930000 "signal" 0.830000 "RMS1" 0.244084 "joy_h" -6.974790 "joy_v" 1.403509 "dispcutoff" 167.402390 "rmlev" 0.770000 "disp_joy_h" 0.000000 "disp_joy_v" 1.000000 "range_v" 0.180000 "range_h" 0.290000 "k15-14" 0.000000 "lamp" 1.000000 "disppitch" 7.090000 "led1" 0.000000 "led2" 0.000000 "led3" 0.000000 "led4" 0.000000 "led5" 0.000000 "vel" 0.725000 "seq" 1.000000 "dir" 0.000000 "port" 0.000000 "time" 0.010000 "lambda" 42.999962 "avrg" 0.500000 "ledmute" 0.000000 "fin" 0.990852 "envsw" 0.000000 "AutoMan" 0.000000 "fout" 0.002315 "auto" 1.000000 "man" 0.000000 "trig" 0.000000 "RMS2" 0.244084 "s01" 43.000000 "s03" 37.000000 "s04" 39.000000 "s06" 32.000000 "s07" 37.000000 "s08" 34.000000 "s09" 56.000000 "s10" 47.000000 "s11" 50.000000 "s12" 39.000000 "s13" 34.000000 "s14" 45.000000 "s15" 37.000000 "s16" 45.000000 "s05" 46.000000 "s02" 47.000000 "L01" 0.131948 "L02" 0.752415 "L03" 0.529769 "L04" 0.518243 "L06" 0.622588 "L05" 0.714538 "L07" 0.623468 "L08" 0.978560 "L09" 0.666344 "L10" 0.502795 "L11" 0.611161 "L12" 0.603330 "L13" 0.911320 "L14" 0.635983 "L15" 0.572723 "L16" 0.720533 "C01" 0.582369 "C02" 0.557401 "C03" 0.620525 "C04" 0.713061 "C06" 0.477443 "C05" 0.449337 "C07" 0.540359 "C08" 0.657381 "C09" 0.514161 "C10" 0.606292 "C11" 0.523081 "C12" 0.471700 "C13" 0.440091 "C14" 0.410470 "C15" 0.565146 "C16" 0.707595 "P01" 0.517488 "P02" 0.244571 "P03" 0.011256 "P04" 0.853294 "P05" 0.028017 "P06" 0.743059 "P07" 0.763352 "P08" 0.184402 "P09" 0.624571 "P10" 0.307092 "P11" 0.628607 "P12" 0.266761 "P13" 0.222957 "P14" 0.322603 "P15" 0.193039 "P16" 0.137480 "led6" 0.000000 "led7" 0.000000 "led8" 0.000000 "led9" 0.000000 "led10" 0.000000 "led11" 0.000000 "led12" 0.000000 "led13" 0.000000 "led14" 1.000000 "led15" 0.000000 "led16" 0.000000 "atck" 0.003500 "dec" 0.030000 "on" 0.080000 "cutref" 0.410000 "panrange" 0.560000 "noiselev" 1.000000 "noisecolor" -0.500000 "synth" 0.000000 "frwd" 1.000000 "rvrs" 0.000000 "in_1" 0.000039 "in_2" 0.000024 "transpose" 2.000000 "del" 0.004000 "fdbk" 0.140000 "flsw" 1.000000 "rate" 0.210001 "status" 0.000000 "kdelta" 1641.879517 "disp2" 0.517488 
"BaseCellos" "_Preset" 12.000000 "_Play" 0.000000 "_Pause" 0.000000 "_Offset" 0.000000 "_Gain" 1.000000 "k01-02" 0.000000 "k01-03" 0.000000 "k01-04" 0.000000 "k01-05" 1.000000 "k01-06" 0.000000 "k01-07" 0.000000 "k01-08" 1.000000 "k01-09" 0.000000 "k01-10" 0.000000 "k01-11" 0.000000 "k01-12" 0.000000 "k01-14" 0.000000 "k01-15" 0.000000 "k02-01" 0.000000 "k02-02" 0.000000 "k02-03" 0.000000 "k02-04" 0.000000 "k02-05" 0.000000 "k02-06" 0.000000 "k02-07" 1.000000 "k02-08" 1.000000 "k02-09" 0.000000 "k02-10" 0.000000 "k02-11" 0.000000 "k02-13" 0.000000 "k02-14" 0.000000 "k02-15" 0.000000 "k02-16" 0.000000 "k03-01" 0.000000 "k03-02" 0.000000 "k03-03" 0.000000 "k03-04" 0.000000 "k03-05" 0.000000 "k03-06" 1.000000 "k03-07" 1.000000 "k03-08" 0.000000 "k04-01" 0.000000 "k04-02" 0.000000 "k04-03" 0.000000 "k04-04" 0.000000 "k04-05" 0.000000 "k04-06" 0.000000 "k04-07" 1.000000 "k04-08" 0.000000 "k03-09" 0.000000 "k04-09" 0.000000 "k03-10" 0.000000 "k03-11" 0.000000 "k04-10" 0.000000 "k04-11" 0.000000 "k03-12" 0.000000 "k04-12" 0.000000 "k03-13" 0.000000 "k03-14" 0.000000 "k04-13" 0.000000 "k04-14" 0.000000 "k03-15" 0.000000 "k04-15" 0.000000 "k03-16" 0.000000 "k04-16" 0.000000 "k05-01" 0.000000 "k06-01" 0.000000 "k05-02" 0.000000 "k06-02" 0.000000 "k05-03" 0.000000 "k06-03" 0.000000 "k07-01" 0.000000 "k01-01" 0.000000 "k07-03" 0.000000 "k05-04" 0.000000 "k05-05" 0.000000 "k06-04" 0.000000 "k06-05" 0.000000 "k07-04" 0.000000 "k05-06" 0.000000 "k05-07" 1.000000 "k06-06" 0.000000 "k06-07" 1.000000 "k07-07" 1.000000 "k05-08" 0.000000 "k05-09" 0.000000 "k06-08" 0.000000 "k06-09" 0.000000 "k07-08" 0.000000 "k08-02" 0.000000 "k08-03" 0.000000 "k08-04" 0.000000 "k08-05" 0.000000 "k08-06" 0.000000 "k08-07" 0.000000 "k08-08" 0.000000 "k05-10" 0.000000 "k05-11" 0.000000 "k05-12" 0.000000 "k06-10" 0.000000 "k06-11" 0.000000 "k06-12" 0.000000 "k05-13" 0.000000 "k05-14" 0.000000 "k06-13" 0.000000 "k06-14" 0.000000 "k05-15" 0.000000 "k06-15" 0.000000 "k05-16" 0.000000 "k06-16" 0.000000 "k09-02" 0.000000 "k09-03" 0.000000 "k10-02" 1.000000 "k10-03" 1.000000 "k09-04" 0.000000 "k10-04" 1.000000 "k09-05" 0.000000 "k09-06" 0.000000 "k09-07" 0.000000 "k10-05" 0.000000 "k10-06" 0.000000 "k11-02" 0.000000 "k09-08" 0.000000 "k10-08" 1.000000 "k12-02" 1.000000 "k12-03" 1.000000 "k12-07" 0.000000 "k12-08" 0.000000 "k11-09" 0.000000 "k11-10" 0.000000 "k11-11" 0.000000 "k13-02" 1.000000 "k13-03" 1.000000 "k13-04" 0.000000 "k13-07" 0.000000 "k13-08" 0.000000 "k11-14" 1.000000 "k14-02" 1.000000 "k14-03" 1.000000 "k14-04" 0.000000 "k15-09" 0.000000 "k15-10" 0.000000 "k15-11" 0.000000 "k16-09" 0.000000 "k16-10" 0.000000 "k16-11" 0.000000 "k01-13" 0.000000 "k01-16" 0.000000 "shape1" 0.501000 "lsine1" 0.590000 "lramp1" 1.000000 "frosc1" 4.112997 "dispfrosc1" 36.964649 "k07-02" 0.000000 "frosc2" 2.833000 "shape2" 0.733000 "dispfrosc2" 9.470059 "lsquare2" 1.000000 "lramp2" 0.000000 "frosc3" 8.682000 "shape3" 0.368000 "dispfrosc3" 121.203972 "lsquare3" 1.000000 "lramp3" 1.000000 "left" 1.000000 "blackstrip" 1.000000 "levin_1" 0.000000 "levin_2" 0.000000 "attack" 0.003000 "eon" 0.010000 "decay" 0.010000 "off_pulse" 0.050000 "mutech1" 0.000000 "mutech2" 0.000000 "wetdry" 1.000000 "cutoff" 0.100000 "res" 0.380000 "fillev" 1.000000 "revlev" 0.330000 "filch1" 0.300000 "filch2" -0.299998 "traplev" 1.000000 "signal" 1.000000 "RMS1" 0.625904 "joy_h" -6.974790 "joy_v" 1.403509 "dispcutoff" 11.207233 "rmlev" 1.000000 "disp_joy_h" 0.000000 "disp_joy_v" 1.000000 "range_v" 0.180000 "range_h" 0.290000 "k15-14" 0.000000 "lamp" 0.000000 "disppitch" 8.010000 "led1" 0.000000 "led2" 0.000000 "led3" 0.000000 "led4" 0.000000 "led5" 0.000000 "vel" 0.725000 "seq" 1.000000 "dir" 0.000000 "port" 0.000000 "time" 0.010000 "lambda" 36.999954 "avrg" 0.500000 "ledmute" 0.000000 "fin" 0.990852 "envsw" 0.000000 "AutoMan" 0.000000 "fout" 0.002315 "auto" 1.000000 "man" 0.000000 "trig" 0.000000 "RMS2" 0.625904 "s01" 40.000000 "s03" 39.000000 "s04" 48.000000 "s06" 42.000000 "s07" 32.000000 "s08" 45.000000 "s09" 33.000000 "s10" 38.000000 "s11" 41.000000 "s12" 48.000000 "s13" 45.000000 "s14" 53.000000 "s15" 49.000000 "s16" 46.000000 "s05" 53.000000 "s02" 46.000000 "L01" 1.000000 "L02" 1.000000 "L03" 1.000000 "L04" 1.000000 "L06" 1.000000 "L05" 1.000000 "L07" 1.000000 "L08" 1.000000 "L09" 1.000000 "L10" 1.000000 "L11" 1.000000 "L12" 1.000000 "L13" 1.000000 "L14" 1.000000 "L15" 1.000000 "L16" 1.000000 "C01" 0.296207 "C02" 0.507127 "C03" 0.306111 "C04" 0.411927 "C06" 0.492888 "C05" 0.639397 "C07" 0.543647 "C08" 0.559111 "C09" 0.346580 "C10" 0.626526 "C11" 0.314930 "C12" 0.711011 "C13" 0.380883 "C14" 0.353208 "C15" 0.371388 "C16" 0.703362 "P01" 0.517488 "P02" 0.244571 "P03" 0.011256 "P04" 0.853294 "P05" 0.028017 "P06" 0.743059 "P07" 0.763352 "P08" 0.184402 "P09" 0.624571 "P10" 0.307092 "P11" 0.628607 "P12" 0.266761 "P13" 0.222957 "P14" 0.322603 "P15" 0.193039 "P16" 0.137480 "led6" 0.000000 "led7" 0.000000 "led8" 0.000000 "led9" 0.000000 "led10" 0.000000 "led11" 0.000000 "led12" 0.000000 "led13" 0.000000 "led14" 0.000000 "led15" 1.000000 "led16" 0.000000 "atck" 0.003500 "dec" 0.030000 "on" 1.000000 "cutref" 0.290000 "panrange" 0.560000 "noiselev" 1.000000 "noisecolor" -10.000000 "synth" 0.000000 "frwd" 1.000000 "rvrs" 0.000000 "in_1" 0.000559 "in_2" 0.000119 "transpose" 2.000000 "del" 0.004000 "fdbk" 0.150000 "flsw" 1.000000 "rate" 1.490001 "status" 0.000000 "kdelta" 1485.550537 "disp2" 0.517488 
"Basequ" "_Preset" 0.000000 "_Play" 0.000000 "_Pause" 0.000000 "_Offset" 0.000000 "_Gain" 1.000000 "k01-02" 0.000000 "k01-03" 0.000000 "k01-04" 0.000000 "k01-05" 0.000000 "k01-06" 0.000000 "k01-07" 1.000000 "k01-08" 0.000000 "k01-09" 0.000000 "k01-10" 0.000000 "k01-11" 0.000000 "k01-12" 0.000000 "k01-14" 0.000000 "k01-15" 0.000000 "k02-01" 0.000000 "k02-02" 0.000000 "k02-03" 0.000000 "k02-04" 0.000000 "k02-05" 0.000000 "k02-06" 0.000000 "k02-07" 1.000000 "k02-08" 0.000000 "k02-09" 0.000000 "k02-10" 0.000000 "k02-11" 0.000000 "k02-13" 0.000000 "k02-14" 0.000000 "k02-15" 0.000000 "k02-16" 0.000000 "k03-01" 0.000000 "k03-02" 0.000000 "k03-03" 0.000000 "k03-04" 0.000000 "k03-05" 0.000000 "k03-06" 0.000000 "k03-07" 1.000000 "k03-08" 0.000000 "k04-01" 0.000000 "k04-02" 0.000000 "k04-03" 0.000000 "k04-04" 0.000000 "k04-05" 0.000000 "k04-06" 0.000000 "k04-07" 0.000000 "k04-08" 0.000000 "k03-09" 0.000000 "k04-09" 0.000000 "k03-10" 0.000000 "k03-11" 0.000000 "k04-10" 0.000000 "k04-11" 0.000000 "k03-12" 0.000000 "k04-12" 0.000000 "k03-13" 0.000000 "k03-14" 0.000000 "k04-13" 0.000000 "k04-14" 0.000000 "k03-15" 0.000000 "k04-15" 0.000000 "k03-16" 0.000000 "k04-16" 0.000000 "k05-01" 0.000000 "k06-01" 0.000000 "k05-02" 0.000000 "k06-02" 0.000000 "k05-03" 0.000000 "k06-03" 0.000000 "k07-01" 0.000000 "k01-01" 0.000000 "k07-03" 0.000000 "k05-04" 0.000000 "k05-05" 0.000000 "k06-04" 0.000000 "k06-05" 0.000000 "k07-04" 0.000000 "k05-06" 0.000000 "k05-07" 1.000000 "k06-06" 0.000000 "k06-07" 0.000000 "k07-07" 0.000000 "k05-08" 0.000000 "k05-09" 0.000000 "k06-08" 0.000000 "k06-09" 0.000000 "k07-08" 0.000000 "k08-02" 0.000000 "k08-03" 0.000000 "k08-04" 0.000000 "k08-05" 0.000000 "k08-06" 0.000000 "k08-07" 0.000000 "k08-08" 0.000000 "k05-10" 0.000000 "k05-11" 0.000000 "k05-12" 0.000000 "k06-10" 0.000000 "k06-11" 0.000000 "k06-12" 0.000000 "k05-13" 0.000000 "k05-14" 0.000000 "k06-13" 0.000000 "k06-14" 0.000000 "k05-15" 0.000000 "k06-15" 0.000000 "k05-16" 0.000000 "k06-16" 0.000000 "k09-02" 0.000000 "k09-03" 0.000000 "k10-02" 1.000000 "k10-03" 1.000000 "k09-04" 0.000000 "k10-04" 0.000000 "k09-05" 0.000000 "k09-06" 0.000000 "k09-07" 0.000000 "k10-05" 0.000000 "k10-06" 0.000000 "k11-02" 0.000000 "k09-08" 0.000000 "k10-08" 0.000000 "k12-02" 0.000000 "k12-03" 0.000000 "k12-07" 0.000000 "k12-08" 0.000000 "k11-09" 0.000000 "k11-10" 0.000000 "k11-11" 0.000000 "k13-02" 0.000000 "k13-03" 0.000000 "k13-04" 0.000000 "k13-07" 0.000000 "k13-08" 0.000000 "k11-14" 0.000000 "k14-02" 0.000000 "k14-03" 0.000000 "k14-04" 0.000000 "k15-09" 0.000000 "k15-10" 0.000000 "k15-11" 0.000000 "k16-09" 0.000000 "k16-10" 0.000000 "k16-11" 0.000000 "k01-13" 0.000000 "k01-16" 0.000000 "shape1" 0.285000 "lsine1" 0.730000 "lramp1" 1.000000 "frosc1" 5.349998 "dispfrosc1" 130.667572 "k07-02" 0.000000 "frosc2" 5.533000 "shape2" 0.500001 "dispfrosc2" 154.946960 "lsquare2" 0.590000 "lramp2" 1.000000 "frosc3" 5.788000 "shape3" 0.500000 "dispfrosc3" 6.037241 "lsquare3" 1.000000 "lramp3" 1.000000 "left" 1.000000 "blackstrip" 1.000000 "levin_1" 1.000000 "levin_2" 0.500000 "attack" 0.003000 "eon" 0.745001 "decay" 0.040000 "off_pulse" 0.050000 "mutech1" 0.000000 "mutech2" 0.000000 "wetdry" 1.000000 "cutoff" 0.265000 "res" 0.760000 "fillev" 1.000000 "revlev" 0.540000 "filch1" -6.000000 "filch2" -6.000000 "traplev" 0.310000 "signal" 1.000000 "RMS1" 0.589953 "joy_h" -6.974790 "joy_v" 1.403509 "dispcutoff" 42.449352 "rmlev" 0.770000 "disp_joy_h" 0.000000 "disp_joy_v" 1.000000 "range_v" 0.180000 "range_h" 0.290000 "k15-14" 0.000000 "lamp" 1.000000 "disppitch" 5.060000 "led1" 1.000000 "led2" 0.000000 "led3" 0.000000 "led4" 0.000000 "led5" 0.000000 "vel" 0.620000 "seq" 1.000000 "dir" 0.000000 "port" 0.000000 "time" 0.010000 "lambda" 42.999962 "avrg" 0.500000 "ledmute" 0.000000 "fin" 0.990852 "envsw" 0.000000 "AutoMan" 0.000000 "fout" 0.002315 "auto" 1.000000 "man" 0.000000 "trig" 0.000000 "RMS2" 0.589953 "s01" 30.000000 "s03" 40.000000 "s04" 34.000000 "s06" 38.000000 "s07" 49.000000 "s08" 29.000000 "s09" 40.000000 "s10" 30.000000 "s11" 41.000000 "s12" 31.000000 "s13" 44.000000 "s14" 39.000000 "s15" 46.000000 "s16" 52.000000 "s05" 47.000000 "s02" 29.000000 "L01" 1.000000 "L02" 1.000000 "L03" 1.000000 "L04" 1.000000 "L06" 1.000000 "L05" 1.000000 "L07" 1.000000 "L08" 1.000000 "L09" 1.000000 "L10" 1.000000 "L11" 1.000000 "L12" 1.000000 "L13" 1.000000 "L14" 1.000000 "L15" 1.000000 "L16" 1.000000 "C01" 0.290403 "C02" 0.236234 "C03" 0.236828 "C04" 0.243044 "C06" 0.388021 "C05" 0.323149 "C07" 0.565891 "C08" 0.254192 "C09" 0.319806 "C10" 0.304953 "C11" 0.299310 "C12" 0.652332 "C13" 0.509439 "C14" 0.339974 "C15" 0.268816 "C16" 0.310022 "P01" 0.321851 "P02" 0.228120 "P03" 0.209353 "P04" 0.155923 "P05" 0.071569 "P06" 0.178057 "P07" 0.227893 "P08" 0.430110 "P09" 0.238630 "P10" 0.092272 "P11" 0.062544 "P12" 0.532692 "P13" 0.285303 "P14" 0.220311 "P15" 0.809998 "P16" 0.083520 "led6" 0.000000 "led7" 0.000000 "led8" 0.000000 "led9" 0.000000 "led10" 0.000000 "led11" 0.000000 "led12" 0.000000 "led13" 0.000000 "led14" 0.000000 "led15" 0.000000 "led16" 0.000000 "atck" 0.003500 "dec" 0.030000 "on" 1.000000 "cutref" 0.230000 "panrange" 0.560000 "noiselev" 1.000000 "noisecolor" -0.500000 "synth" 0.000000 "frwd" 1.000000 "rvrs" 0.000000 "in_1" 0.000032 "in_2" 0.001274 "transpose" 1.000000 "del" 0.004000 "fdbk" 0.140000 "flsw" 1.000000 "rate" 0.210001 "status" 0.000000 "kdelta" 1161.613892 "disp2" 0.321851 
"Stream1" "_Preset" 0.000000 "_Play" 0.000000 "_Pause" 0.000000 "_Offset" 0.000000 "_Gain" 1.000000 "k01-02" 0.000000 "k01-03" 0.000000 "k01-04" 0.000000 "k01-05" 0.000000 "k01-06" 0.000000 "k01-07" 0.000000 "k01-08" 0.000000 "k01-09" 0.000000 "k01-10" 0.000000 "k01-11" 0.000000 "k01-12" 0.000000 "k01-14" 0.000000 "k01-15" 0.000000 "k02-01" 0.000000 "k02-02" 0.000000 "k02-03" 0.000000 "k02-04" 0.000000 "k02-05" 0.000000 "k02-06" 0.000000 "k02-07" 1.000000 "k02-08" 0.000000 "k02-09" 0.000000 "k02-10" 0.000000 "k02-11" 0.000000 "k02-13" 0.000000 "k02-14" 0.000000 "k02-15" 0.000000 "k02-16" 0.000000 "k03-01" 0.000000 "k03-02" 0.000000 "k03-03" 0.000000 "k03-04" 0.000000 "k03-05" 0.000000 "k03-06" 0.000000 "k03-07" 0.000000 "k03-08" 0.000000 "k04-01" 0.000000 "k04-02" 0.000000 "k04-03" 0.000000 "k04-04" 0.000000 "k04-05" 0.000000 "k04-06" 0.000000 "k04-07" 0.000000 "k04-08" 0.000000 "k03-09" 0.000000 "k04-09" 0.000000 "k03-10" 0.000000 "k03-11" 0.000000 "k04-10" 0.000000 "k04-11" 0.000000 "k03-12" 0.000000 "k04-12" 0.000000 "k03-13" 0.000000 "k03-14" 0.000000 "k04-13" 0.000000 "k04-14" 0.000000 "k03-15" 0.000000 "k04-15" 0.000000 "k03-16" 0.000000 "k04-16" 0.000000 "k05-01" 0.000000 "k06-01" 0.000000 "k05-02" 0.000000 "k06-02" 0.000000 "k05-03" 0.000000 "k06-03" 0.000000 "k07-01" 0.000000 "k01-01" 0.000000 "k07-03" 0.000000 "k05-04" 0.000000 "k05-05" 0.000000 "k06-04" 0.000000 "k06-05" 0.000000 "k07-04" 0.000000 "k05-06" 0.000000 "k05-07" 0.000000 "k06-06" 0.000000 "k06-07" 0.000000 "k07-07" 0.000000 "k05-08" 0.000000 "k05-09" 0.000000 "k06-08" 0.000000 "k06-09" 0.000000 "k07-08" 0.000000 "k08-02" 0.000000 "k08-03" 0.000000 "k08-04" 0.000000 "k08-05" 0.000000 "k08-06" 0.000000 "k08-07" 0.000000 "k08-08" 0.000000 "k05-10" 0.000000 "k05-11" 0.000000 "k05-12" 0.000000 "k06-10" 0.000000 "k06-11" 0.000000 "k06-12" 0.000000 "k05-13" 0.000000 "k05-14" 0.000000 "k06-13" 0.000000 "k06-14" 0.000000 "k05-15" 0.000000 "k06-15" 0.000000 "k05-16" 0.000000 "k06-16" 0.000000 "k09-02" 0.000000 "k09-03" 0.000000 "k10-02" 0.000000 "k10-03" 0.000000 "k09-04" 0.000000 "k10-04" 0.000000 "k09-05" 0.000000 "k09-06" 0.000000 "k09-07" 0.000000 "k10-05" 0.000000 "k10-06" 0.000000 "k11-02" 0.000000 "k09-08" 0.000000 "k10-08" 1.000000 "k12-02" 0.000000 "k12-03" 0.000000 "k12-07" 0.000000 "k12-08" 0.000000 "k11-09" 0.000000 "k11-10" 0.000000 "k11-11" 0.000000 "k13-02" 0.000000 "k13-03" 0.000000 "k13-04" 0.000000 "k13-07" 0.000000 "k13-08" 0.000000 "k11-14" 0.000000 "k14-02" 1.000000 "k14-03" 1.000000 "k14-04" 0.000000 "k15-09" 0.000000 "k15-10" 0.000000 "k15-11" 0.000000 "k16-09" 0.000000 "k16-10" 0.000000 "k16-11" 0.000000 "k01-13" 0.000000 "k01-16" 0.000000 "shape1" 0.501000 "lsine1" 0.590000 "lramp1" 0.710000 "frosc1" 4.635997 "dispfrosc1" 60.771690 "k07-02" 0.000000 "frosc2" 2.833000 "shape2" 0.500000 "dispfrosc2" 9.470056 "lsquare2" 0.770000 "lramp2" 1.000000 "frosc3" 7.835001 "shape3" 0.368000 "dispfrosc3" 50.838581 "lsquare3" 1.000000 "lramp3" 1.000000 "left" 1.000000 "blackstrip" 1.000000 "levin_1" 0.000000 "levin_2" 0.000000 "attack" 0.003000 "eon" 0.010000 "decay" 0.010000 "off_pulse" 0.050000 "mutech1" 0.000000 "mutech2" 0.000000 "wetdry" 0.240000 "cutoff" 0.175001 "res" 0.300000 "fillev" 1.000000 "revlev" 0.580000 "filch1" 0.300000 "filch2" -0.299998 "traplev" 1.000000 "signal" 1.000000 "RMS1" 0.127908 "joy_h" -6.974790 "joy_v" 1.403509 "dispcutoff" 20.530367 "rmlev" 1.000000 "disp_joy_h" 0.000000 "disp_joy_v" 1.000000 "range_v" 0.180000 "range_h" 0.290000 "k15-14" 0.000000 "lamp" 0.000000 "disppitch" 8.080000 "led1" 0.000000 "led2" 0.000000 "led3" 0.000000 "led4" 0.000000 "led5" 0.000000 "vel" 0.560000 "seq" 1.000000 "dir" 0.000000 "port" 0.000000 "time" 0.010000 "lambda" 38.999962 "avrg" 0.500000 "ledmute" 0.000000 "fin" 0.990852 "envsw" 0.000000 "AutoMan" 0.000000 "fout" 0.002315 "auto" 1.000000 "man" 0.000000 "trig" 0.000000 "RMS2" 0.127908 "s01" 29.000000 "s03" 31.000000 "s04" 38.000000 "s06" 38.000000 "s07" 44.000000 "s08" 40.000000 "s09" 41.000000 "s10" 37.000000 "s11" 44.000000 "s12" 44.000000 "s13" 34.000000 "s14" 42.000000 "s15" 35.000000 "s16" 30.000000 "s05" 43.000000 "s02" 28.000000 "L01" 1.000000 "L02" 1.000000 "L03" 1.000000 "L04" 1.000000 "L06" 1.000000 "L05" 1.000000 "L07" 1.000000 "L08" 1.000000 "L09" 1.000000 "L10" 1.000000 "L11" 1.000000 "L12" 1.000000 "L13" 1.000000 "L14" 1.000000 "L15" 1.000000 "L16" 1.000000 "C01" 0.213131 "C02" 0.348820 "C03" 0.280914 "C04" 0.341497 "C06" 0.145231 "C05" 0.345612 "C07" 0.184592 "C08" 0.189057 "C09" 0.469545 "C10" 0.208657 "C11" 0.554088 "C12" 0.251126 "C13" 0.567192 "C14" 0.337018 "C15" 0.191952 "C16" 0.470800 "P01" 0.131303 "P02" 0.460995 "P03" 0.137319 "P04" 0.384336 "P05" 0.538271 "P06" 0.419158 "P07" 0.340212 "P08" 0.061885 "P09" 0.126810 "P10" 0.594310 "P11" 0.526802 "P12" 0.360161 "P13" 0.307824 "P14" 0.478451 "P15" 0.638365 "P16" 0.013363 "led6" 0.000000 "led7" 0.000000 "led8" 0.000000 "led9" 0.000000 "led10" 0.000000 "led11" 1.000000 "led12" 0.000000 "led13" 0.000000 "led14" 0.000000 "led15" 0.000000 "led16" 0.000000 "atck" 0.017500 "dec" 0.030000 "on" 1.000000 "cutref" 0.120000 "panrange" 0.560000 "noiselev" 1.000000 "noisecolor" -10.000000 "synth" 0.000000 "frwd" 1.000000 "rvrs" 0.000000 "in_1" 0.000058 "in_2" 0.001781 "transpose" 3.000000 "del" 0.006000 "fdbk" 0.140000 "flsw" 1.000000 "rate" 0.210000 "status" 0.000000 "kdelta" 2216.352539 "disp2" 0.131303 
"Oboestream" "_Preset" 0.000000 "_Play" 0.000000 "_Pause" 0.000000 "_Offset" 0.000000 "_Gain" 1.000000 "k01-02" 0.000000 "k01-03" 0.000000 "k01-04" 0.000000 "k01-05" 0.000000 "k01-06" 0.000000 "k01-07" 0.000000 "k01-08" 0.000000 "k01-09" 0.000000 "k01-10" 0.000000 "k01-11" 0.000000 "k01-12" 0.000000 "k01-14" 0.000000 "k01-15" 0.000000 "k02-01" 0.000000 "k02-02" 0.000000 "k02-03" 0.000000 "k02-04" 0.000000 "k02-05" 0.000000 "k02-06" 0.000000 "k02-07" 1.000000 "k02-08" 0.000000 "k02-09" 0.000000 "k02-10" 0.000000 "k02-11" 0.000000 "k02-13" 0.000000 "k02-14" 0.000000 "k02-15" 0.000000 "k02-16" 0.000000 "k03-01" 0.000000 "k03-02" 0.000000 "k03-03" 0.000000 "k03-04" 0.000000 "k03-05" 0.000000 "k03-06" 0.000000 "k03-07" 0.000000 "k03-08" 0.000000 "k04-01" 0.000000 "k04-02" 0.000000 "k04-03" 0.000000 "k04-04" 0.000000 "k04-05" 0.000000 "k04-06" 0.000000 "k04-07" 0.000000 "k04-08" 0.000000 "k03-09" 0.000000 "k04-09" 0.000000 "k03-10" 0.000000 "k03-11" 0.000000 "k04-10" 0.000000 "k04-11" 0.000000 "k03-12" 0.000000 "k04-12" 0.000000 "k03-13" 0.000000 "k03-14" 0.000000 "k04-13" 0.000000 "k04-14" 0.000000 "k03-15" 0.000000 "k04-15" 0.000000 "k03-16" 0.000000 "k04-16" 0.000000 "k05-01" 0.000000 "k06-01" 0.000000 "k05-02" 0.000000 "k06-02" 0.000000 "k05-03" 0.000000 "k06-03" 0.000000 "k07-01" 0.000000 "k01-01" 0.000000 "k07-03" 0.000000 "k05-04" 0.000000 "k05-05" 0.000000 "k06-04" 0.000000 "k06-05" 0.000000 "k07-04" 0.000000 "k05-06" 0.000000 "k05-07" 0.000000 "k06-06" 0.000000 "k06-07" 0.000000 "k07-07" 0.000000 "k05-08" 0.000000 "k05-09" 0.000000 "k06-08" 0.000000 "k06-09" 0.000000 "k07-08" 0.000000 "k08-02" 0.000000 "k08-03" 0.000000 "k08-04" 0.000000 "k08-05" 0.000000 "k08-06" 0.000000 "k08-07" 0.000000 "k08-08" 0.000000 "k05-10" 0.000000 "k05-11" 0.000000 "k05-12" 0.000000 "k06-10" 0.000000 "k06-11" 0.000000 "k06-12" 0.000000 "k05-13" 0.000000 "k05-14" 0.000000 "k06-13" 0.000000 "k06-14" 0.000000 "k05-15" 0.000000 "k06-15" 0.000000 "k05-16" 0.000000 "k06-16" 0.000000 "k09-02" 0.000000 "k09-03" 0.000000 "k10-02" 0.000000 "k10-03" 0.000000 "k09-04" 0.000000 "k10-04" 0.000000 "k09-05" 0.000000 "k09-06" 0.000000 "k09-07" 0.000000 "k10-05" 0.000000 "k10-06" 0.000000 "k11-02" 0.000000 "k09-08" 0.000000 "k10-08" 1.000000 "k12-02" 0.000000 "k12-03" 0.000000 "k12-07" 0.000000 "k12-08" 0.000000 "k11-09" 0.000000 "k11-10" 0.000000 "k11-11" 0.000000 "k13-02" 0.000000 "k13-03" 0.000000 "k13-04" 0.000000 "k13-07" 0.000000 "k13-08" 0.000000 "k11-14" 0.000000 "k14-02" 1.000000 "k14-03" 1.000000 "k14-04" 0.000000 "k15-09" 0.000000 "k15-10" 0.000000 "k15-11" 0.000000 "k16-09" 0.000000 "k16-10" 0.000000 "k16-11" 0.000000 "k01-13" 0.000000 "k01-16" 0.000000 "shape1" 0.501000 "lsine1" 0.590000 "lramp1" 0.710000 "frosc1" 4.635997 "dispfrosc1" 60.771690 "k07-02" 0.000000 "frosc2" 2.833000 "shape2" 0.500000 "dispfrosc2" 9.470056 "lsquare2" 0.770000 "lramp2" 1.000000 "frosc3" 7.835001 "shape3" 0.368000 "dispfrosc3" 50.838581 "lsquare3" 1.000000 "lramp3" 1.000000 "left" 1.000000 "blackstrip" 1.000000 "levin_1" 0.000000 "levin_2" 0.000000 "attack" 0.003000 "eon" 0.010000 "decay" 0.010000 "off_pulse" 0.050000 "mutech1" 0.000000 "mutech2" 0.000000 "wetdry" 0.240000 "cutoff" 0.175001 "res" 0.440000 "fillev" 1.000000 "revlev" 0.580000 "filch1" 0.300000 "filch2" -0.299998 "traplev" 1.000000 "signal" 1.000000 "RMS1" 0.117364 "joy_h" -6.974790 "joy_v" 1.403509 "dispcutoff" 20.530367 "rmlev" 1.000000 "disp_joy_h" 0.000000 "disp_joy_v" 1.000000 "range_v" 0.180000 "range_h" 0.290000 "k15-14" 0.000000 "lamp" 0.000000 "disppitch" 8.040000 "led1" 0.000000 "led2" 0.000000 "led3" 0.000000 "led4" 0.000000 "led5" 0.000000 "vel" 0.560000 "seq" 1.000000 "dir" 0.000000 "port" 0.000000 "time" 0.010000 "lambda" 40.000004 "avrg" 0.500000 "ledmute" 0.000000 "fin" 0.990852 "envsw" 0.000000 "AutoMan" 0.000000 "fout" 0.002315 "auto" 1.000000 "man" 0.000000 "trig" 0.000000 "RMS2" 0.117364 "s01" 35.000000 "s03" 49.000000 "s04" 41.000000 "s06" 43.000000 "s07" 47.000000 "s08" 38.000000 "s09" 40.000000 "s10" 29.000000 "s11" 32.000000 "s12" 30.000000 "s13" 35.000000 "s14" 43.000000 "s15" 37.000000 "s16" 38.000000 "s05" 47.000000 "s02" 33.000000 "L01" 1.000000 "L02" 1.000000 "L03" 1.000000 "L04" 1.000000 "L06" 1.000000 "L05" 1.000000 "L07" 1.000000 "L08" 1.000000 "L09" 1.000000 "L10" 1.000000 "L11" 1.000000 "L12" 1.000000 "L13" 1.000000 "L14" 1.000000 "L15" 1.000000 "L16" 1.000000 "C01" 0.112667 "C02" 0.445184 "C03" 0.271032 "C04" 0.334909 "C06" 0.117673 "C05" 0.101181 "C07" 0.306044 "C08" 0.139595 "C09" 0.265173 "C10" 0.223630 "C11" 0.288855 "C12" 0.206541 "C13" 0.293033 "C14" 0.129379 "C15" 0.150760 "C16" 0.124667 "P01" 0.131303 "P02" 0.460995 "P03" 0.137319 "P04" 0.384336 "P05" 0.538271 "P06" 0.419158 "P07" 0.340212 "P08" 0.061885 "P09" 0.126810 "P10" 0.594310 "P11" 0.526802 "P12" 0.360161 "P13" 0.307824 "P14" 0.478451 "P15" 0.638365 "P16" 0.013363 "led6" 0.000000 "led7" 0.000000 "led8" 0.000000 "led9" 1.000000 "led10" 0.000000 "led11" 0.000000 "led12" 0.000000 "led13" 0.000000 "led14" 0.000000 "led15" 0.000000 "led16" 0.000000 "atck" 0.017500 "dec" 0.004000 "on" 1.000000 "cutref" 0.100000 "panrange" 0.560000 "noiselev" 1.000000 "noisecolor" -10.000000 "synth" 0.000000 "frwd" 1.000000 "rvrs" 0.000000 "in_1" 0.000044 "in_2" 0.001586 "transpose" 3.000000 "del" 0.006000 "fdbk" 0.140000 "flsw" 1.000000 "rate" 0.210000 "status" 0.000000 "kdelta" 1060.693970 "disp2" 0.131303 
"NewStream" "_Preset" 0.000000 "_Play" 0.000000 "_Pause" 0.000000 "_Offset" 0.000000 "_Gain" 1.000000 "k01-02" 0.000000 "k01-03" 0.000000 "k01-04" 0.000000 "k01-05" 0.000000 "k01-06" 0.000000 "k01-07" 1.000000 "k01-08" 0.000000 "k01-09" 0.000000 "k01-10" 0.000000 "k01-11" 0.000000 "k01-12" 0.000000 "k01-14" 0.000000 "k01-15" 0.000000 "k02-01" 0.000000 "k02-02" 0.000000 "k02-03" 0.000000 "k02-04" 0.000000 "k02-05" 0.000000 "k02-06" 0.000000 "k02-07" 1.000000 "k02-08" 0.000000 "k02-09" 0.000000 "k02-10" 0.000000 "k02-11" 0.000000 "k02-13" 0.000000 "k02-14" 0.000000 "k02-15" 0.000000 "k02-16" 0.000000 "k03-01" 0.000000 "k03-02" 0.000000 "k03-03" 0.000000 "k03-04" 0.000000 "k03-05" 0.000000 "k03-06" 0.000000 "k03-07" 0.000000 "k03-08" 0.000000 "k04-01" 0.000000 "k04-02" 0.000000 "k04-03" 0.000000 "k04-04" 0.000000 "k04-05" 0.000000 "k04-06" 0.000000 "k04-07" 0.000000 "k04-08" 0.000000 "k03-09" 0.000000 "k04-09" 0.000000 "k03-10" 0.000000 "k03-11" 0.000000 "k04-10" 0.000000 "k04-11" 0.000000 "k03-12" 0.000000 "k04-12" 0.000000 "k03-13" 0.000000 "k03-14" 0.000000 "k04-13" 0.000000 "k04-14" 0.000000 "k03-15" 0.000000 "k04-15" 0.000000 "k03-16" 0.000000 "k04-16" 0.000000 "k05-01" 0.000000 "k06-01" 0.000000 "k05-02" 0.000000 "k06-02" 0.000000 "k05-03" 0.000000 "k06-03" 0.000000 "k07-01" 0.000000 "k01-01" 0.000000 "k07-03" 0.000000 "k05-04" 0.000000 "k05-05" 0.000000 "k06-04" 0.000000 "k06-05" 0.000000 "k07-04" 0.000000 "k05-06" 0.000000 "k05-07" 0.000000 "k06-06" 0.000000 "k06-07" 0.000000 "k07-07" 0.000000 "k05-08" 0.000000 "k05-09" 0.000000 "k06-08" 0.000000 "k06-09" 0.000000 "k07-08" 0.000000 "k08-02" 0.000000 "k08-03" 0.000000 "k08-04" 0.000000 "k08-05" 0.000000 "k08-06" 0.000000 "k08-07" 0.000000 "k08-08" 0.000000 "k05-10" 0.000000 "k05-11" 0.000000 "k05-12" 0.000000 "k06-10" 0.000000 "k06-11" 0.000000 "k06-12" 0.000000 "k05-13" 0.000000 "k05-14" 0.000000 "k06-13" 0.000000 "k06-14" 0.000000 "k05-15" 0.000000 "k06-15" 0.000000 "k05-16" 0.000000 "k06-16" 0.000000 "k09-02" 0.000000 "k09-03" 0.000000 "k10-02" 0.000000 "k10-03" 0.000000 "k09-04" 0.000000 "k10-04" 0.000000 "k09-05" 0.000000 "k09-06" 0.000000 "k09-07" 0.000000 "k10-05" 0.000000 "k10-06" 0.000000 "k11-02" 0.000000 "k09-08" 0.000000 "k10-08" 1.000000 "k12-02" 0.000000 "k12-03" 0.000000 "k12-07" 0.000000 "k12-08" 0.000000 "k11-09" 0.000000 "k11-10" 0.000000 "k11-11" 0.000000 "k13-02" 0.000000 "k13-03" 0.000000 "k13-04" 0.000000 "k13-07" 0.000000 "k13-08" 0.000000 "k11-14" 1.000000 "k14-02" 1.000000 "k14-03" 1.000000 "k14-04" 0.000000 "k15-09" 0.000000 "k15-10" 0.000000 "k15-11" 0.000000 "k16-09" 0.000000 "k16-10" 0.000000 "k16-11" 0.000000 "k01-13" 0.000000 "k01-16" 0.000000 "shape1" 0.501000 "lsine1" 0.780000 "lramp1" 1.000000 "frosc1" 4.635997 "dispfrosc1" 60.771690 "k07-02" 0.000000 "frosc2" 2.833000 "shape2" 0.500000 "dispfrosc2" 9.470056 "lsquare2" 0.770000 "lramp2" 1.000000 "frosc3" 7.835001 "shape3" 0.368000 "dispfrosc3" 50.838581 "lsquare3" 1.000000 "lramp3" 1.000000 "left" 1.000000 "blackstrip" 1.000000 "levin_1" 0.000000 "levin_2" 0.000000 "attack" 3.543000 "eon" 0.010000 "decay" 3.490000 "off_pulse" 2.010000 "mutech1" 0.000000 "mutech2" 0.000000 "wetdry" 0.240000 "cutoff" 0.175001 "res" 0.440000 "fillev" 1.000000 "revlev" 0.580000 "filch1" 0.300000 "filch2" -0.299998 "traplev" 1.000000 "signal" 1.000000 "RMS1" 0.194405 "joy_h" -6.974790 "joy_v" 1.403509 "dispcutoff" 20.530436 "rmlev" 1.000000 "disp_joy_h" 0.000000 "disp_joy_v" 1.000000 "range_v" 0.180000 "range_h" 0.290000 "k15-14" 0.000000 "lamp" 1.000000 "disppitch" 7.060000 "led1" 0.000000 "led2" 1.000000 "led3" 0.000000 "led4" 0.000000 "led5" 0.000000 "vel" 0.695000 "seq" 1.000000 "dir" 0.000000 "port" 0.000000 "time" 0.010000 "lambda" 30.999973 "avrg" 0.500000 "ledmute" 0.000000 "fin" 0.990852 "envsw" 0.000000 "AutoMan" 0.000000 "fout" 0.002315 "auto" 1.000000 "man" 0.000000 "trig" 0.000000 "RMS2" 0.194405 "s01" 32.000000 "s03" 27.000000 "s04" 21.000000 "s06" 24.000000 "s07" 23.000000 "s08" 24.000000 "s09" 32.000000 "s10" 26.000000 "s11" 27.000000 "s12" 22.000000 "s13" 33.000000 "s14" 28.000000 "s15" 37.000000 "s16" 25.000000 "s05" 23.000000 "s02" 30.000000 "L01" 1.000000 "L02" 1.000000 "L03" 1.000000 "L04" 1.000000 "L06" 1.000000 "L05" 1.000000 "L07" 1.000000 "L08" 1.000000 "L09" 1.000000 "L10" 1.000000 "L11" 1.000000 "L12" 1.000000 "L13" 1.000000 "L14" 1.000000 "L15" 1.000000 "L16" 1.000000 "C01" 0.507464 "C02" 0.485524 "C03" 0.584793 "C04" 0.409465 "C06" 0.314999 "C05" 0.197849 "C07" 0.395749 "C08" 0.476237 "C09" 0.591015 "C10" 0.290944 "C11" 0.509433 "C12" 0.314396 "C13" 0.448563 "C14" 0.193242 "C15" 0.288477 "C16" 0.354260 "P01" 0.131303 "P02" 0.460995 "P03" 0.137319 "P04" 0.384336 "P05" 0.538271 "P06" 0.419158 "P07" 0.340212 "P08" 0.061885 "P09" 0.126810 "P10" 0.594310 "P11" 0.526802 "P12" 0.360161 "P13" 0.307824 "P14" 0.478451 "P15" 0.638365 "P16" 0.013363 "led6" 0.000000 "led7" 0.000000 "led8" 0.000000 "led9" 0.000000 "led10" 0.000000 "led11" 0.000000 "led12" 0.000000 "led13" 0.000000 "led14" 0.000000 "led15" 0.000000 "led16" 0.000000 "atck" 0.003500 "dec" 0.004000 "on" 1.000000 "cutref" 0.190000 "panrange" 0.560000 "noiselev" 1.000000 "noisecolor" -10.000000 "synth" 0.000000 "frwd" 1.000000 "rvrs" 0.000000 "in_1" 0.000051 "in_2" 0.000211 "transpose" 3.000000 "del" 0.006000 "fdbk" 0.450000 "flsw" 1.000000 "rate" 0.210000 "ledseq" 0.000000 "notebar" 16.000000 "nnote" 16.000000 "incr" 2.151978 "dispindex" 15.397986 "status" 0.000000 "kdelta" 1417.040527 "disp2" 0.131303 
"Ale" "_Preset" 0.000000 "_Play" 0.000000 "_Pause" 0.000000 "_Offset" 0.000000 "_Gain" 1.000000 "k01-02" 0.000000 "k01-03" 0.000000 "k01-04" 1.000000 "k01-05" 0.000000 "k01-06" 0.000000 "k01-07" 0.000000 "k01-08" 0.000000 "k01-09" 0.000000 "k01-10" 0.000000 "k01-11" 0.000000 "k01-12" 0.000000 "k01-14" 0.000000 "k01-15" 0.000000 "k02-01" 0.000000 "k02-02" 0.000000 "k02-03" 0.000000 "k02-04" 0.000000 "k02-05" 1.000000 "k02-06" 0.000000 "k02-07" 0.000000 "k02-08" 0.000000 "k02-09" 0.000000 "k02-10" 0.000000 "k02-11" 0.000000 "k02-13" 0.000000 "k02-14" 0.000000 "k02-15" 0.000000 "k02-16" 0.000000 "k03-01" 0.000000 "k03-02" 0.000000 "k03-03" 0.000000 "k03-04" 0.000000 "k03-05" 0.000000 "k03-06" 1.000000 "k03-07" 0.000000 "k03-08" 0.000000 "k04-01" 0.000000 "k04-02" 0.000000 "k04-03" 0.000000 "k04-04" 0.000000 "k04-05" 0.000000 "k04-06" 1.000000 "k04-07" 0.000000 "k04-08" 0.000000 "k03-09" 0.000000 "k04-09" 0.000000 "k03-10" 0.000000 "k03-11" 0.000000 "k04-10" 0.000000 "k04-11" 0.000000 "k03-12" 0.000000 "k04-12" 0.000000 "k03-13" 0.000000 "k03-14" 0.000000 "k04-13" 0.000000 "k04-14" 0.000000 "k03-15" 0.000000 "k04-15" 0.000000 "k03-16" 0.000000 "k04-16" 0.000000 "k05-01" 0.000000 "k06-01" 0.000000 "k05-02" 0.000000 "k06-02" 0.000000 "k05-03" 0.000000 "k06-03" 0.000000 "k07-01" 0.000000 "k01-01" 0.000000 "k07-03" 0.000000 "k05-04" 0.000000 "k05-05" 0.000000 "k06-04" 0.000000 "k06-05" 0.000000 "k07-04" 0.000000 "k05-06" 0.000000 "k05-07" 0.000000 "k06-06" 0.000000 "k06-07" 0.000000 "k07-07" 1.000000 "k05-08" 0.000000 "k05-09" 0.000000 "k06-08" 0.000000 "k06-09" 0.000000 "k07-08" 0.000000 "k08-02" 0.000000 "k08-03" 0.000000 "k08-04" 0.000000 "k08-05" 0.000000 "k08-06" 0.000000 "k08-07" 0.000000 "k08-08" 0.000000 "k05-10" 0.000000 "k05-11" 0.000000 "k05-12" 0.000000 "k06-10" 0.000000 "k06-11" 0.000000 "k06-12" 0.000000 "k05-13" 0.000000 "k05-14" 1.000000 "k06-13" 0.000000 "k06-14" 0.000000 "k05-15" 0.000000 "k06-15" 0.000000 "k05-16" 0.000000 "k06-16" 0.000000 "k09-02" 0.000000 "k09-03" 0.000000 "k10-02" 0.000000 "k10-03" 0.000000 "k09-04" 0.000000 "k10-04" 1.000000 "k09-05" 0.000000 "k09-06" 0.000000 "k09-07" 0.000000 "k10-05" 0.000000 "k10-06" 0.000000 "k11-02" 0.000000 "k09-08" 0.000000 "k10-08" 0.000000 "k12-02" 1.000000 "k12-03" 1.000000 "k12-07" 0.000000 "k12-08" 0.000000 "k11-09" 0.000000 "k11-10" 0.000000 "k11-11" 0.000000 "k13-02" 0.000000 "k13-03" 0.000000 "k13-04" 0.000000 "k13-07" 1.000000 "k13-08" 0.000000 "k11-14" 0.000000 "k14-02" 0.000000 "k14-03" 0.000000 "k14-04" 0.000000 "k15-09" 0.000000 "k15-10" 0.000000 "k15-11" 0.000000 "k16-09" 0.000000 "k16-10" 0.000000 "k16-11" 0.000000 "k01-13" 0.000000 "k01-16" 0.000000 "shape1" 0.585000 "lsine1" 0.330000 "lramp1" 0.720000 "frosc1" 4.503998 "dispfrosc1" 53.329834 "k07-02" 0.000000 "frosc2" 10.000000 "shape2" 0.539000 "dispfrosc2" 10000.000000 "lsquare2" 0.770000 "lramp2" 1.000000 "frosc3" 9.094004 "shape3" 0.368000 "dispfrosc3" 199.459885 "lsquare3" 1.000000 "lramp3" 1.000000 "left" 1.000000 "blackstrip" 1.000000 "levin_1" 0.000000 "levin_2" 0.000000 "attack" 0.003000 "eon" 1.015001 "decay" 1.675000 "off_pulse" 0.050000 "mutech1" 0.000000 "mutech2" 0.000000 "wetdry" 0.240000 "cutoff" 0.834999 "res" 1.020000 "fillev" 0.800000 "revlev" 0.580000 "filch1" 0.300000 "filch2" -0.299998 "traplev" 1.000000 "signal" 1.000000 "RMS1" 0.377779 "joy_h" -6.974790 "joy_v" 1.403509 "dispcutoff" 4225.530273 "rmlev" 1.000000 "disp_joy_h" 0.000000 "disp_joy_v" 1.000000 "range_v" 0.180000 "range_h" 0.290000 "k15-14" 0.000000 "lamp" 1.000000 "disppitch" 8.040000 "led1" 0.000000 "led2" 0.000000 "led3" 0.000000 "led4" 0.000000 "led5" 0.000000 "vel" 1.000000 "seq" 0.000000 "dir" 0.000000 "port" 0.000000 "time" 0.034000 "lambda" 40.000004 "avrg" 0.500000 "ledmute" 0.000000 "fin" 0.990852 "envsw" 0.000000 "AutoMan" 0.000000 "fout" 0.002315 "auto" 1.000000 "man" 0.000000 "trig" 0.000000 "RMS2" 0.377779 "s01" 35.000000 "s03" 49.000000 "s04" 41.000000 "s06" 43.000000 "s07" 47.000000 "s08" 38.000000 "s09" 40.000000 "s10" 29.000000 "s11" 32.000000 "s12" 30.000000 "s13" 35.000000 "s14" 43.000000 "s15" 37.000000 "s16" 38.000000 "s05" 47.000000 "s02" 33.000000 "L01" 1.000000 "L02" 1.000000 "L03" 1.000000 "L04" 1.000000 "L06" 1.000000 "L05" 1.000000 "L07" 1.000000 "L08" 1.000000 "L09" 1.000000 "L10" 1.000000 "L11" 1.000000 "L12" 1.000000 "L13" 1.000000 "L14" 1.000000 "L15" 1.000000 "L16" 1.000000 "C01" 0.112667 "C02" 0.445184 "C03" 0.271032 "C04" 0.334909 "C06" 0.117673 "C05" 0.101181 "C07" 0.306044 "C08" 0.139595 "C09" 0.265173 "C10" 0.223630 "C11" 0.288855 "C12" 0.206541 "C13" 0.293033 "C14" 0.129379 "C15" 0.150760 "C16" 0.124667 "P01" 0.131303 "P02" 0.460995 "P03" 0.137319 "P04" 0.384336 "P05" 0.538271 "P06" 0.419158 "P07" 0.340212 "P08" 0.061885 "P09" 0.126810 "P10" 0.594310 "P11" 0.526802 "P12" 0.360161 "P13" 0.307824 "P14" 0.478451 "P15" 0.638365 "P16" 0.013363 "led6" 0.000000 "led7" 0.000000 "led8" 0.000000 "led9" 1.000000 "led10" 0.000000 "led11" 0.000000 "led12" 0.000000 "led13" 0.000000 "led14" 0.000000 "led15" 0.000000 "led16" 0.000000 "atck" 0.017500 "dec" 0.004000 "on" 1.000000 "cutref" 0.100000 "panrange" 0.560000 "noiselev" 1.000000 "noisecolor" -10.000000 "synth" 1.000000 "frwd" 1.000000 "rvrs" 0.000000 "in_1" 0.000000 "in_2" 0.000000 "transpose" 3.000000 "del" 0.006000 "fdbk" 0.140000 "flsw" 0.000000 "rate" 0.210000 "ledseq" 0.000000 "notebar" 16.000000 "nnote" 16.000000 "incr" 2.241982 "dispindex" 14.182512 "shift" 0.096516 "status" 0.000000 "kdelta" 0.000000 "disp2" 0.131303 
</MacPresets
