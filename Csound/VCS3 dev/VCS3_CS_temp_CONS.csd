<CsoundSynthesizer>
<CsOptions>
;-o/Users/eg/Documents/MacCSFiles/myEx/VCS3_CS_temp.aif
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
i "input"			0 86400
i "matrix" 			0 86400
i "osc1" 			0 86400
i "osc2" 			0 86400
i "osc3" 			0 86400
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
i "envsw"			0 86400
i "rev"				0 86400
i "seqcompile" 		0 86400



</CsScore>

</CsoundSynthesizer>>
<MacOptions>
Version: 3
Render: Real
Ask: Yes
Functions: Window
Listing: Window
WindowBounds: 1164 62 200 544
CurrentView: io
IOViewEdit: Off
Options: -b1024 -A  -s -m39 -Z -R --midi-velocity-amp=4 --midi-key-cps=5 
</MacOptions>
<MacGUI>
ioView background {43690, 43690, 43690}
ioText {29, 146} {50, 48} label 0.000000 0.00100 "" center "Lucida Grande" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder OSC  1
ioCheckbox {197, 146} {33, 35} off k01-02
ioCheckbox {229, 146} {33, 35} off k01-03
ioCheckbox {261, 146} {33, 35} off k01-04
ioCheckbox {293, 146} {33, 35} off k01-05
ioCheckbox {325, 146} {33, 35} off k01-06
ioCheckbox {357, 146} {33, 35} on k01-07
ioCheckbox {389, 146} {33, 35} off k01-08
ioCheckbox {421, 146} {33, 35} off k01-09
ioCheckbox {453, 146} {33, 35} off k01-10
ioCheckbox {485, 146} {33, 35} off k01-11
ioCheckbox {517, 146} {33, 35} off k01-12
ioCheckbox {581, 146} {33, 35} on k01-14
ioCheckbox {613, 146} {33, 35} off k01-15
ioCheckbox {165, 180} {33, 35} off k02-01
ioCheckbox {197, 180} {33, 35} off k02-02
ioCheckbox {229, 180} {33, 35} off k02-03
ioCheckbox {261, 180} {33, 35} off k02-04
ioCheckbox {293, 180} {33, 35} off k02-05
ioCheckbox {325, 180} {33, 35} off k02-06
ioCheckbox {357, 180} {33, 35} on k02-07
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
ioCheckbox {197, 214} {33, 35} off k03-02
ioCheckbox {229, 214} {33, 35} off k03-03
ioCheckbox {261, 214} {33, 35} off k03-04
ioCheckbox {293, 214} {33, 35} off k03-05
ioCheckbox {325, 214} {33, 35} off k03-06
ioCheckbox {357, 214} {33, 35} on k03-07
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
ioCheckbox {357, 282} {33, 35} on k05-07
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
ioCheckbox {197, 452} {33, 35} on k10-02
ioCheckbox {229, 452} {33, 35} on k10-03
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
ioCheckbox {485, 554} {33, 35} on 
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
ioCheckbox {485, 588} {33, 35} on 
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
ioCheckbox {581, 656} {33, 35} on 
ioCheckbox {613, 656} {33, 35} off 
ioCheckbox {645, 554} {33, 35} off 
ioCheckbox {645, 588} {33, 35} off 
ioCheckbox {645, 622} {33, 35} off 
ioCheckbox {645, 656} {33, 35} off 
ioButton {44, 101} {96, 48} event 1.000000 "" "MUTE" "/" i9999 0 1
ioText {677, 146} {29, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 1
ioText {677, 181} {29, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 2
ioText {677, 215} {29, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 3
ioText {677, 249} {29, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 4
ioText {677, 282} {29, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 5
ioText {677, 316} {29, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 6
ioText {677, 350} {29, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 7
ioText {677, 384} {29, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 8
ioText {677, 418} {29, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 9
ioText {677, 452} {29, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 10
ioText {677, 486} {29, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 11
ioText {677, 520} {29, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 12
ioText {677, 554} {29, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 13
ioText {677, 588} {29, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 14
ioText {677, 622} {29, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 15
ioText {677, 656} {29, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 16
ioText {197, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder B
ioText {229, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder C
ioText {261, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder D
ioText {293, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder E
ioText {325, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder F
ioText {357, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder G
ioText {389, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder H
ioText {421, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder I
ioText {453, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder J
ioText {485, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder K
ioText {517, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder L
ioText {549, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder M
ioText {581, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder N
ioText {613, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder O
ioText {645, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder P
ioText {165, 690} {33, 35} label 0.000000 0.00100 "" center "Verdana" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder A
ioMeter {158, 20} {13, 710} {44544, 53504, 65280} "" 0.000000 "" 0.736390 point 1 0 mouse
ioText {471, 11} {100, 24} label 0.000000 0.00100 "" center "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder CONTROL INPUTS
ioMeter {191, 49} {13, 103} {44544, 53504, 65280} "" 0.000000 "" 0.263736 point 1 0 mouse
ioMeter {160, 140} {552, 13} {44544, 53504, 65280} "" 0.981413 "" 1.000000 point 1 0 mouse
ioMeter {255, 49} {13, 103} {44544, 53504, 65280} "" 0.000000 "" 0.263736 point 1 0 mouse
ioMeter {287, 50} {13, 103} {44544, 53504, 65280} "" 0.000000 "" 0.989011 point 1 0 mouse
ioMeter {352, 50} {13, 103} {44544, 53504, 65280} "" 0.000000 "" 0.263736 point 1 0 mouse
ioMeter {384, 50} {13, 103} {44544, 53504, 65280} "" 0.000000 "" 0.263736 point 1 0 mouse
ioMeter {384, 50} {13, 103} {44544, 53504, 65280} "" 0.000000 "" 0.263736 point 1 0 mouse
ioMeter {415, 19} {13, 134} {44544, 53504, 65280} "" 0.000000 "" 0.263736 point 1 0 mouse
ioMeter {512, 48} {13, 103} {44544, 53504, 65280} "" 0.000000 "" 0.263736 point 1 0 mouse
ioMeter {544, 48} {13, 103} {44544, 53504, 65280} "" 0.000000 "" 0.263736 point 1 0 mouse
ioMeter {577, 49} {13, 103} {44544, 53504, 65280} "" 0.000000 "" 0.263736 point 1 0 mouse
ioMeter {607, 49} {13, 103} {44544, 53504, 65280} "" 0.000000 "" 0.263736 point 1 0 mouse
ioMeter {672, 19} {13, 715} {44544, 53504, 65280} "" 0.000000 "" 0.325479 point 1 0 mouse
ioMeter {700, 141} {13, 554} {44544, 53504, 65280} "" 0.000000 "" 0.830258 point 1 0 mouse
ioMeter {160, 717} {525, 13} {44544, 53504, 65280} "" 0.981413 "" 1.000000 point 1 0 mouse
ioMeter {159, 684} {555, 13} {44544, 53504, 65280} "" 0.981413 "" 1.000000 point 1 0 mouse
ioText {29, 349} {136, 37} label 0.000000 0.00100 "" left "Lucida Grande" 14 {0, 0, 0} {65280, 65280, 65280} nobackground border NOISE
ioText {29, 385} {136, 67} label 0.000000 0.00100 "" left "Lucida Grande" 14 {0, 0, 0} {65280, 65280, 65280} nobackground border INPUT               1INPUT               2
ioText {29, 451} {136, 37} label 0.000000 0.00100 "" left "Lucida Grande" 14 {0, 0, 0} {65280, 65280, 65280} nobackground border FILTER
ioText {29, 487} {136, 37} label 0.000000 0.00100 "" left "Lucida Grande" 14 {0, 0, 0} {65280, 65280, 65280} nobackground border TRAPEZ
ioText {29, 523} {136, 33} label 0.000000 0.00100 "" left "Lucida Grande" 14 {0, 0, 0} {65280, 65280, 65280} nobackground border ENV SIG
ioText {29, 555} {136, 33} label 0.000000 0.00100 "" left "Lucida Grande" 14 {0, 0, 0} {65280, 65280, 65280} nobackground border RING MODRING MOD
ioText {29, 587} {136, 35} label 0.000000 0.00100 "" left "Lucida Grande" 14 {0, 0, 0} {65280, 65280, 65280} nobackground border REVERBRING MOD
ioText {29, 621} {136, 70} label 0.000000 0.00100 "" left "Lucida Grande" 14 {0, 0, 0} {65280, 65280, 65280} nobackground border  STICK      <-->                        |
ioText {171, 53} {24, 85} label 0.000000 0.00100 "" left "Lucida Grande" 12 {0, 0, 0} {65280, 65280, 65280} nobackground noborder METER
ioText {268, 54} {25, 88} label 0.000000 0.00100 "" left "Lucida Grande" 12 {0, 0, 0} {65280, 65280, 65280} nobackground noborder ENVEL
ioText {208, 53} {47, 88} label 0.000000 0.00100 "" center "Lucida Grande" 12 {0, 0, 0} {65280, 65280, 65280} nobackground noborder OUTAMPS1     2
ioText {248, 11} {90, 24} label 0.000000 0.00100 "" center "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder SIGNAL INPUTS
ioCheckbox {549, 147} {33, 35} off k01-13
ioCheckbox {644, 150} {30, 30} off k01-16
ioText {301, 53} {47, 88} label 0.000000 0.00100 "" center "Lucida Grande" 12 {0, 0, 0} {65280, 65280, 65280} nobackground noborder RINGMODA   B
ioText {395, 54} {26, 89} label 0.000000 0.00100 "" center "Lucida Grande" 11 {0, 0, 0} {65280, 65280, 65280} nobackground noborder REVERB
ioText {363, 53} {25, 91} label 0.000000 0.00100 "" center "Lucida Grande" 11 {0, 0, 0} {65280, 65280, 65280} nobackground noborder FILTER
ioText {427, 55} {86, 86} label 0.000000 0.00100 "" center "Lucida Grande" 12 {0, 0, 0} {65280, 65280, 65280} nobackground noborder OSC.FREQ1     2    3 
ioText {523, 56} {24, 84} label 0.000000 0.00100 "" center "Lucida Grande" 12 {0, 0, 0} {65280, 65280, 65280} nobackground noborder DECAY
ioText {554, 53} {26, 89} label 0.000000 0.00100 "" center "Lucida Grande" 11 {0, 0, 0} {65280, 65280, 65280} nobackground noborder REVERB
ioText {586, 53} {25, 91} label 0.000000 0.00100 "" center "Lucida Grande" 11 {0, 0, 0} {65280, 65280, 65280} nobackground noborder FILTER
ioText {623, 54} {47, 88} label 0.000000 0.00100 "" center "Lucida Grande" 12 {0, 0, 0} {65280, 65280, 65280} nobackground noborder OUTAMPS1     2
ioKnob {851, 115} {48, 48} 0.100000 0.900000 0.010000 0.277778 shape1
ioKnob {918, 115} {48, 48} 0.000000 1.000000 0.010000 0.565657 lsine1
ioKnob {982, 115} {48, 48} 0.000000 1.000000 0.010000 0.404040 lramp1
ioKnob {771, 112} {62, 60} 0.000000 10.000000 0.010000 6.464646 frosc1
ioText {773, 104} {47, 24} display 0.000000 0.00100 "dispfrosc1" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioCheckbox {197, 350} {33, 33} off k07-02
ioText {763, 64} {98, 24} label 0.000000 0.00100 "" center "Lucida Grande" 9 {63744, 65280, 65280} {3328, 4864, 1024} background noborder OSCILLATOR 1
ioMeter {1036, 48} {14, 615} {44544, 53504, 65280} "" 0.500000 "" 0.011532 fill 1 0 mouse
ioText {763, 206} {100, 24} label 0.000000 0.00100 "" center "Lucida Grande" 9 {63744, 65280, 65280} {3328, 4864, 1024} background noborder OSCILLATOR 2
ioKnob {773, 255} {60, 58} 0.000000 10.000000 0.010000 2.020202 frosc2
ioKnob {853, 260} {48, 48} 0.000000 1.000000 0.010000 0.424242 shape2
ioText {775, 245} {47, 24} display 0.000000 0.00100 "dispfrosc2" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioKnob {918, 261} {48, 48} 0.000000 1.000000 0.010000 0.000000 lsquare2
ioKnob {984, 261} {48, 48} 0.000000 1.000000 0.010000 0.000000 lramp2
ioText {763, 346} {107, 24} label 0.000000 0.00100 "" center "Lucida Grande" 9 {63744, 65280, 65280} {3328, 4864, 1024} background noborder OSCILLATOR 3
ioKnob {774, 396} {61, 60} 0.000000 10.000000 0.010000 7.373737 frosc3
ioKnob {852, 399} {48, 48} 0.000000 1.000000 0.010000 0.878788 shape3
ioText {780, 386} {41, 24} display 0.000000 0.00100 "dispfrosc3" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioKnob {920, 399} {48, 48} 0.000000 1.000000 0.010000 0.000000 lsquare3
ioKnob {983, 399} {48, 48} 0.000000 1.000000 0.010000 0.000000 lramp3
ioMeter {752, 473} {696, 14} {44544, 53504, 65280} "" 0.000000 "" 0.000000 fill 1 0 mouse
ioMeter {730, 27} {743, 38} {32768, 16384, 0} "left" 1.000000 "left" 1.000000 fill 1 0 notrack
ioText {764, 493} {109, 24} label 0.000000 0.00100 "" center "Lucida Grande" 10 {63744, 65280, 65280} {3328, 4864, 1024} background noborder NOISE GENERATOR
ioMeter {759, 639} {687, 29} {6400, 6400, 6400} "blackstrip" 1.000000 "blackstrip" 1.000000 fill 1 0 mouse
ioText {768, 520} {75, 35} label 0.000000 0.00100 "" center "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder COLOURWhite
ioText {850, 521} {48, 24} label 0.000000 0.00100 "" center "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder LEVEL
ioMeter {756, 182} {693, 14} {44544, 53504, 65280} "" 0.000000 "" 0.000000 fill 1 0 mouse
ioMeter {1434, 54} {39, 937} {32768, 16384, 0} "left" 1.000000 "left" 1.000000 fill 1 0 notrack
ioMeter {895, 475} {14, 187} {44544, 53504, 65280} "" 1.000000 "" 0.000000 fill 1 0 mouse
ioText {905, 493} {114, 24} label 0.000000 0.00100 "" center "Lucida Grande" 10 {63744, 65280, 65280} {3328, 4864, 1024} background noborder INPUT LEVEL
ioKnob {919, 545} {48, 48} 0.000000 1.000000 0.010000 1.000000 levin_1
ioKnob {981, 545} {48, 48} 0.000000 1.000000 0.010000 1.000000 levin_2
ioMeter {1154, 51} {14, 146} {44544, 53504, 65280} "" 0.000000 "" 0.000000 fill 1 0 mouse
ioText {1047, 63} {107, 24} label 0.000000 0.00100 "" center "Arial" 9 {63744, 65280, 65280} {3328, 4864, 1024} background noborder RING MODULATOR
ioMeter {755, 333} {486, 14} {0, 0, 0} "" 0.018987 "" 0.500000 fill 1 0 mouse
ioMeter {1228, 334} {14, 329} {44544, 53504, 65280} "" 1.000000 "" 0.000000 fill 1 0 mouse
ioText {1168, 64} {112, 24} label 0.000000 0.00100 "" left "Arial" 9 {63744, 65280, 65280} {3328, 4864, 1024} background noborder FILTER / OSCILLATOR
ioText {1047, 206} {107, 24} label 0.000000 0.00100 "" center "Lucida Grande" 10 {63744, 65280, 65280} {3328, 4864, 1024} background noborder ENVELOPE SHAPER
ioKnob {1073, 260} {48, 48} 0.003000 4.500000 0.010000 3.500667 attack
ioKnob {1165, 259} {49, 50} 0.010000 4.000000 0.010000 0.372727 eon
ioKnob {1259, 259} {50, 50} 0.010000 4.000000 0.010000 0.695152 decay
ioText {1051, 345} {134, 24} label 0.000000 0.00100 "" center "Lucida Grande" 10 {63744, 65280, 65280} {3328, 4864, 1024} background noborder REVERBERATION
ioKnob {1350, 259} {50, 50} 0.050000 4.000000 0.010000 2.005051 off_pulse
ioCheckbox {1077, 601} {30, 30} off mutech1
ioCheckbox {1169, 602} {30, 30} off mutech2
ioKnob {1065, 399} {48, 48} 0.000000 1.000000 0.010000 0.303030 wetdry
ioKnob {1177, 112} {49, 50} 0.100000 1.000000 0.010000 0.254545 cutoff
ioKnob {1264, 112} {49, 50} 0.100000 1.200000 0.010000 1.033333 res
ioKnob {1349, 112} {49, 50} 0.000000 1.000000 0.010000 1.000000 fillev
ioKnob {1162, 399} {48, 48} 0.000000 1.000000 0.010000 0.343434 revlev
ioKnob {1068, 545} {48, 48} -6.000000 6.000000 0.010000 -6.000000 filch1
ioKnob {1158, 545} {48, 48} -6.000000 6.000000 0.010000 -6.000000 filch2
ioKnob {1261, 399} {48, 48} 0.000000 1.000000 0.010000 1.000000 traplev
ioKnob {1352, 399} {48, 48} 0.000000 1.000000 0.010000 1.000000 signal
ioMeter {1266, 538} {16, 79} {0, 65280, 0} "RMS1" 0.000000 "RMS1" 0.000000 fill 1 0 notrack
ioMeter {1247, 731} {131, 126} {1792, 35328, 52224} "joy_h" 0.000000 "joy_v" 1.000000 point 12 123 mouse
ioMeter {9, 744} {38, 247} {32768, 16384, 0} "left" 1.000000 "left" 1.000000 fill 1 0 notrack
ioText {1051, 493} {121, 24} label 0.000000 0.00100 "" center "Lucida Grande" 10 {63744, 65280, 65280} {3328, 4864, 1024} background noborder OUTPUT FILTER
ioText {1179, 147} {44, 24} display 0.000000 0.00100 "dispcutoff" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {1275, 147} {32, 24} display 0.000000 0.00100 "res" center "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {1254, 93} {75, 24} label 0.000000 0.00100 "" center "Arial" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder RESPONSE
ioText {770, 91} {71, 24} label 0.000000 0.00100 "" center "Arial" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder FREQUENCY
ioText {849, 98} {53, 24} label 0.000000 0.00100 "" center "Arial" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder SHAPE
ioText {948, 82} {51, 33} label 0.000000 0.00100 "" center "Arial" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder LEVEL
ioText {1071, 93} {54, 24} label 0.000000 0.00100 "" center "Arial" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder LEVEL
ioText {812, 102} {31, 27} label 0.000000 0.00100 "" left "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder Hz
ioKnob {1074, 115} {48, 48} 0.000000 1.000000 0.010000 0.272727 rmlev
ioText {1344, 851} {44, 24} display 0.000000 0.00100 "disp_joy_h" left "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {1211, 739} {41, 24} display 0.000000 0.00100 "disp_joy_v" left "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {1185, 738} {31, 27} label 0.000000 0.00100 "" left "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder Y = 
ioText {1320, 851} {31, 27} label 0.000000 0.00100 "" left "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder X = = 
ioKnob {1188, 758} {48, 48} 0.000000 1.000000 0.010000 1.000000 range_v
ioKnob {1276, 688} {48, 48} 0.000000 1.000000 0.010000 0.454545 range_h
ioText {1148, 771} {44, 30} display 0.000000 0.00100 "range_v" left "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {1321, 695} {44, 30} display 0.000000 0.00100 "range_h" left "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {1273, 680} {61, 24} label 0.000000 0.00100 "" left "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder RANGE_X
ioText {1183, 796} {60, 24} label 0.000000 0.00100 "" left "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder RANGE_Y
ioCheckbox {582, 625} {30, 30} off k15-14
ioMeter {1132, 236} {20, 20} {65280, 6400, 0} "lamp" 1.000000 "lamp" 1.000000 fill 1 0 notrack
ioText {1358, 241} {32, 24} label 0.000000 0.00100 "" left "Arial" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder OFF
ioText {1071, 241} {49, 24} label 0.000000 0.00100 "" left "Arial" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder ATTACK
ioText {1167, 241} {47, 24} label 0.000000 0.00100 "" center "Arial" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder ON
ioText {1263, 241} {42, 26} label 0.000000 0.00100 "" left "Arial" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder DECAY
ioText {1073, 378} {34, 25} label 0.000000 0.00100 "" left "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder MIX
ioText {1165, 378} {46, 24} label 0.000000 0.00100 "" left "Arial" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder LEVEL
ioText {845, 835} {48, 25} display 0.000000 0.00100 "disppitch" left "Lucida Grande" 12 {32768, 0, 0} {52224, 65280, 26112} background border 
ioMeter {78, 956} {22, 23} {65280, 47104, 1792} "led1" 0.000000 "led1" 0.000000 fill 1 0 notrack
ioMeter {113, 956} {22, 23} {65280, 47104, 1792} "led2" 0.000000 "led2" 0.000000 fill 1 0 notrack
ioMeter {147, 956} {22, 23} {65280, 47104, 1792} "led3" 0.000000 "led3" 0.000000 fill 1 0 notrack
ioMeter {182, 956} {22, 23} {65280, 47104, 1792} "led4" 0.000000 "led4" 0.000000 fill 1 0 notrack
ioMeter {218, 956} {22, 23} {65280, 47104, 1792} "led5" 0.000000 "led5" 0.000000 fill 1 0 notrack
ioText {792, 855} {38, 24} display 0.000000 0.00100 "vel" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioCheckbox {964, 719} {30, 30} on seq
ioText {1238, 483} {81, 24} label 0.000000 0.00100 "" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} background border EuVCS3x-mCS
ioText {1009, 720} {65, 48} label 0.000000 0.00100 "" left "Lucida Grande" 10 {65280, 0, 512} {65280, 65280, 65280} nobackground noborder Sequencer Synth
ioText {80, 755} {281, 34} label 0.000000 0.00100 "" left "Lucida Grande" 9 {65280, 0, 0} {65280, 65280, 65280} nobackground noborder 01        02         03        04         05        06       07        08         
ioCheckbox {964, 773} {30, 30} off dir
ioText {1009, 775} {77, 37} label 0.000000 0.00100 "" left "Lucida Grande" 10 {65280, 3840, 0} {65280, 65280, 65280} nobackground noborder Rev / Frwd
ioMeter {45, 791} {23, 22} {65280, 5888, 0} "led1" 0.000000 "led1" 0.000000 fill 1 0 mouse
ioText {788, 702} {44, 26} label 0.000000 0.00100 "" left "Lucida Grande" 10 {65280, 0, 0} {65280, 65280, 65280} nobackground noborder Attacked:
ioCheckbox {964, 826} {30, 30} off port
ioKnob {905, 817} {48, 48} 0.010000 0.050000 0.010000 0.010000 time
ioText {904, 703} {43, 24} label 0.000000 0.00100 "" left "Lucida Grande" 10 {65280, 0, 0} {65280, 65280, 65280} nobackground noborder DecayDeacy
ioText {998, 827} {78, 24} label 0.000000 0.00100 "" left "Lucida Grande" 10 {65280, 0, 0} {65280, 65280, 65280} nobackground noborder Glide On/Off
ioMeter {730, 54} {38, 936} {32768, 16384, 0} "left" 1.000000 "left" 1.000000 fill 1 0 notrack
ioText {910, 799} {40, 24} label 0.000000 0.00100 "" left "Lucida Grande" 10 {65280, 0, 0} {65280, 65280, 65280} nobackground noborder Time
ioButton {761, 892} {83, 44} event 1.000000 "" "Pitch" "/" i  100  0  0.1
ioKnob {779, 920} {48, 48} 1.000000 71.000000 0.010000 33.525253 lambda
ioMeter {1142, 656} {14, 333} {44544, 53504, 65280} "" 0.000000 "" 0.000000 fill 1 0 mouse
ioButton {835, 892} {86, 43} event 1.000000 "" "Levels" "/" i  101  0  0.1
ioKnob {853, 920} {48, 48} 0.000000 1.000000 0.010000 0.646465 avrg
ioButton {839, 949} {80, 40} event 1.000000 "" "Reset" "/" i112 0 0.1
ioText {846, 703} {43, 24} label 0.000000 0.00100 "" center "Lucida Grande" 10 {65280, 0, 0} {65280, 65280, 65280} nobackground noborder On
ioButton {648, 745} {90, 50} event 1.000000 "" "Run/Stop" "/" i199 0 0.1
ioMeter {107, 111} {18, 16} {65280, 1792, 0} "ledmute" 0.000000 "ledmute" 0.000000 fill 1 0 mouse
ioButton {46, 51} {93, 49} event 1.000000 "" "FadeOut" "/" i9998 0 4 4
ioButton {45, 4} {94, 50} event 1.000000 "" "FadeIn" "/" i9997 0 4 4
ioMeter {27, 1} {15, 55} {26112, 52224, 65280} "fin" 0.990852 "fin" 0.990852 fill 1 0 mouse
ioCheckbox {1265, 338} {30, 30} off envsw
ioText {1242, 315} {76, 24} label 0.000000 0.00100 "AutoMan" center "Lucida Grande" 10 {32768, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {1248, 379} {73, 24} label 0.000000 0.00100 "" center "Arial" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder TRAPEZOID
ioText {1344, 379} {71, 24} label 0.000000 0.00100 "" center "Arial" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder SIGNAL
ioText {772, 233} {71, 24} label 0.000000 0.00100 "" center "Arial" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder FREQUENCY
ioText {849, 243} {53, 24} label 0.000000 0.00100 "" center "Arial" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder SHAPE
ioText {949, 226} {52, 24} label 0.000000 0.00100 "" center "Arial" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder LEVEL
ioText {773, 372} {71, 24} label 0.000000 0.00100 "" center "Arial" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder FREQUENCY
ioText {850, 383} {53, 24} label 0.000000 0.00100 "" center "Arial" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder SHAPE
ioText {1347, 93} {54, 24} label 0.000000 0.00100 "" center "Arial" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder LEVEL
ioText {1171, 92} {71, 24} label 0.000000 0.00100 "" center "Arial" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder FREQUENCY
ioMeter {27, 47} {15, 55} {26112, 52224, 65280} "fout" 0.002315 "fout" 0.002315 fill 1 0 mouse
ioMeter {1244, 344} {19, 18} {65280, 0, 0} "auto" 1.000000 "auto" 1.000000 fill 1 0 notrack
ioMeter {1294, 344} {19, 18} {65280, 0, 0} "man" 0.000000 "man" 0.000000 fill 1 0 notrack
ioText {1238, 322} {87, 24} label 0.000000 0.00100 "" left "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder Auto         Man
ioText {912, 521} {63, 24} label 0.000000 0.00100 "" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder CHANNEL 1
ioText {972, 521} {67, 24} label 0.000000 0.00100 "" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder CHANNEL 2
ioText {1061, 521} {63, 24} label 0.000000 0.00100 "" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder CHANNEL 1
ioText {1147, 521} {67, 24} label 0.000000 0.00100 "" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder CHANNEL 2
ioMeter {159, 17} {97, 13} {44544, 53504, 65280} "" 0.000000 "" 0.000000 fill 1 0 mouse
ioMeter {325, 16} {145, 13} {44544, 53504, 65280} "" 0.000000 "" 0.000000 fill 1 0 mouse
ioMeter {566, 16} {119, 13} {512, 0, 1280} "" 0.056075 "" 1.000000 fill 1 0 notrack
ioMeter {159, 44} {526, 13} {44544, 53504, 65280} "" 0.000000 "" 0.000000 fill 1 0 mouse
ioText {1381, 767} {54, 24} label 0.000000 0.00100 "" center "Lucida Grande" 9 {65280, 0, 0} {65280, 65280, 65280} nobackground noborder ATTACK
ioMeter {1394, 790} {28, 25} {65280, 14848, 0} "trig" 0.000000 "trig" 0.000000 point 13 351 mousezero
ioMeter {1293, 538} {16, 79} {0, 65280, 0} "RMS2" 0.000000 "RMS2" 0.000000 fill 1 0 notrack
ioText {949, 363} {52, 24} label 0.000000 0.00100 "" center "Arial" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder LEVEL
ioButton {1332, 545} {64, 65} pict 1.000000 "" "Button" "/" i1 0 10
ioText {773, 584} {33, 24} label 0.000000 0.00100 "" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder Low
ioText {806, 584} {35, 24} label 0.000000 0.00100 "" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder High
ioText {1053, 576} {33, 24} label 0.000000 0.00100 "" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder Low
ioText {1102, 576} {35, 24} label 0.000000 0.00100 "" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder High
ioText {1144, 576} {33, 24} label 0.000000 0.00100 "" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder Low
ioText {1194, 576} {35, 24} label 0.000000 0.00100 "" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder High
ioMeter {23, 141} {13, 237} {44544, 53504, 65280} "" 0.000000 "" 0.000000 fill 1 0 mouse
ioMeter {23, 140} {192, 13} {44544, 53504, 65280} "" 0.000000 "" 0.000000 fill 1 0 mouse
ioMeter {25, 206} {145, 13} {44544, 53504, 65280} "" 0.000000 "" 0.000000 fill 1 0 mouse
ioMeter {25, 276} {145, 13} {44544, 53504, 65280} "" 0.000000 "" 0.000000 fill 1 0 mouse
ioText {29, 212} {50, 48} label 0.000000 0.00100 "" center "Lucida Grande" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder OSC  2
ioText {30, 282} {50, 48} label 0.000000 0.00100 "" center "Lucida Grande" 14 {0, 0, 0} {65280, 65280, 65280} nobackground noborder OSC  3
ioMeter {9, 723} {750, 32} {32768, 16384, 0} "left" 1.000000 "left" 1.000000 fill 1 0 notrack
ioKnob {66, 779} {48, 48} 1.000000 71.000000 0.010000 48.373737 s01
ioKnob {136, 779} {48, 48} 1.000000 71.000000 0.010000 37.767677 s03
ioKnob {171, 779} {48, 48} 1.000000 71.000000 0.010000 38.474747 s04
ioKnob {241, 779} {48, 48} 1.000000 71.000000 0.010000 41.303030 s06
ioKnob {276, 779} {48, 48} 1.000000 71.000000 0.010000 31.404040 s07
ioKnob {311, 779} {48, 48} 1.000000 71.000000 0.010000 49.787879 s08
ioKnob {346, 779} {48, 48} 1.000000 71.000000 0.010000 49.787879 s09
ioKnob {381, 779} {48, 48} 1.000000 71.000000 0.010000 49.787879 s10
ioKnob {416, 779} {48, 48} 1.000000 71.000000 0.010000 49.787879 s11
ioKnob {451, 779} {48, 48} 1.000000 71.000000 0.010000 1.000000 s12
ioKnob {486, 779} {48, 48} 1.000000 71.000000 0.010000 1.000000 s13
ioKnob {521, 779} {48, 48} 1.000000 71.000000 0.010000 63.929293 s14
ioKnob {556, 779} {48, 48} 1.000000 71.000000 0.010000 1.000000 s15
ioKnob {591, 779} {48, 48} 1.000000 71.000000 0.010000 49.787879 s16
ioKnob {206, 779} {48, 48} 1.000000 71.000000 0.010000 39.888889 s05
ioKnob {101, 779} {48, 48} 1.000000 71.000000 0.010000 48.373737 s02
ioText {356, 755} {313, 34} label 0.000000 0.00100 "" left "Lucida Grande" 9 {65280, 0, 0} {65280, 65280, 65280} nobackground noborder 09         10         11        12         13        14        15        16        
ioKnob {66, 834} {48, 48} 0.000000 1.000000 0.010000 0.000000 L01
ioKnob {101, 834} {48, 48} 0.000000 1.000000 0.010000 0.464646 L02
ioKnob {136, 834} {48, 48} 0.000000 1.000000 0.010000 0.000000 L03
ioKnob {171, 834} {48, 48} 0.000000 1.000000 0.010000 0.000000 L04
ioKnob {241, 834} {48, 48} 0.000000 1.000000 0.010000 0.030303 L06
ioKnob {206, 834} {48, 48} 0.000000 1.000000 0.010000 0.000000 L05
ioKnob {276, 834} {48, 48} 0.000000 1.000000 0.010000 0.000000 L07
ioKnob {311, 834} {48, 48} 0.000000 1.000000 0.010000 0.000000 L08
ioKnob {346, 834} {48, 48} 0.000000 1.000000 0.010000 0.000000 L09
ioKnob {381, 834} {48, 48} 0.000000 1.000000 0.010000 0.303030 L10
ioKnob {416, 834} {48, 48} 0.000000 1.000000 0.010000 0.000000 L11
ioKnob {451, 834} {48, 48} 0.000000 1.000000 0.010000 0.323232 L12
ioKnob {486, 834} {48, 48} 0.000000 1.000000 0.010000 0.000000 L13
ioKnob {521, 834} {48, 48} 0.000000 1.000000 0.010000 0.000000 L14
ioKnob {556, 834} {48, 48} 0.000000 1.000000 0.010000 0.000000 L15
ioKnob {591, 834} {48, 48} 0.000000 1.000000 0.010000 0.000000 L16
ioKnob {66, 872} {48, 48} 0.000000 1.000000 0.010000 0.646465 C01
ioKnob {101, 872} {48, 48} 0.000000 1.000000 0.010000 0.808081 C02
ioKnob {136, 872} {48, 48} 0.000000 1.000000 0.010000 0.494949 C03
ioKnob {171, 872} {48, 48} 0.000000 1.000000 0.010000 0.020202 C04
ioKnob {241, 872} {48, 48} 0.000000 1.000000 0.010000 0.656566 C06
ioKnob {206, 872} {48, 48} 0.000000 1.000000 0.010000 1.000000 C05
ioKnob {276, 872} {48, 48} 0.000000 1.000000 0.010000 0.696970 C07
ioKnob {311, 872} {48, 48} 0.000000 1.000000 0.010000 0.161616 C08
ioKnob {346, 872} {48, 48} 0.000000 1.000000 0.010000 0.373737 C09
ioKnob {381, 872} {48, 48} 0.000000 1.000000 0.010000 0.171717 C10
ioKnob {416, 872} {48, 48} 0.000000 1.000000 0.010000 0.373737 C11
ioKnob {451, 872} {48, 48} 0.000000 1.000000 0.010000 0.323232 C12
ioKnob {486, 872} {48, 48} 0.000000 1.000000 0.010000 0.424242 C13
ioKnob {521, 872} {48, 48} 0.000000 1.000000 0.010000 0.808081 C14
ioKnob {556, 872} {48, 48} 0.000000 1.000000 0.010000 0.333333 C15
ioKnob {591, 872} {48, 48} 0.000000 1.000000 0.010000 0.000000 C16
ioKnob {66, 910} {48, 48} 0.000000 1.000000 0.010000 0.010101 P01
ioKnob {101, 910} {48, 48} 0.000000 1.000000 0.010000 0.000000 P02
ioKnob {136, 910} {48, 48} 0.000000 1.000000 0.010000 0.000000 P03
ioKnob {171, 910} {48, 48} 0.000000 1.000000 0.010000 0.737374 P04
ioKnob {206, 910} {48, 48} 0.000000 1.000000 0.010000 0.000000 P05
ioKnob {241, 910} {48, 48} 0.000000 1.000000 0.010000 0.000000 P06
ioKnob {276, 910} {48, 48} 0.000000 1.000000 0.010000 0.000000 P07
ioKnob {311, 910} {48, 48} 0.000000 1.000000 0.010000 0.232323 P08
ioKnob {346, 910} {48, 48} 0.000000 1.000000 0.010000 0.262626 P09
ioKnob {381, 910} {48, 48} 0.000000 1.000000 0.010000 0.313131 P10
ioKnob {416, 910} {48, 48} 0.000000 1.000000 0.010000 0.757576 P11
ioKnob {451, 910} {48, 48} 0.000000 1.000000 0.010000 0.737374 P12
ioKnob {486, 910} {48, 48} 0.000000 1.000000 0.010000 0.181818 P13
ioKnob {521, 910} {48, 48} 0.000000 1.000000 0.010000 0.727273 P14
ioKnob {556, 910} {48, 48} 0.000000 1.000000 0.010000 1.000000 P15
ioKnob {591, 910} {48, 48} 0.000000 1.000000 0.010000 1.000000 P16
ioMeter {253, 957} {22, 23} {65280, 47104, 1792} "led6" 0.000000 "led6" 0.000000 fill 1 0 notrack
ioMeter {288, 957} {22, 23} {65280, 47104, 1792} "led7" 1.000000 "led7" 1.000000 fill 1 0 notrack
ioMeter {323, 957} {22, 23} {65280, 47104, 1792} "led8" 0.000000 "led8" 0.000000 fill 1 0 notrack
ioMeter {358, 957} {22, 23} {65280, 47104, 1792} "led9" 0.000000 "led9" 0.000000 fill 1 0 notrack
ioMeter {393, 957} {22, 23} {65280, 47104, 1792} "led10" 0.000000 "led10" 0.000000 fill 1 0 notrack
ioMeter {427, 957} {22, 23} {65280, 47104, 1792} "led11" 0.000000 "led11" 0.000000 fill 1 0 notrack
ioMeter {462, 957} {22, 23} {65280, 47104, 1792} "led12" 0.000000 "led12" 0.000000 fill 1 0 notrack
ioMeter {497, 957} {22, 23} {65280, 47104, 1792} "led13" 0.000000 "led13" 0.000000 fill 1 0 notrack
ioMeter {533, 957} {22, 23} {65280, 47104, 1792} "led14" 0.000000 "led14" 0.000000 fill 1 0 notrack
ioMeter {568, 957} {22, 23} {65280, 47104, 1792} "led15" 0.000000 "led15" 0.000000 fill 1 0 notrack
ioMeter {603, 957} {22, 23} {65280, 47104, 1792} "led16" 0.000000 "led16" 0.000000 fill 1 0 notrack
ioMeter {9, 980} {1465, 35} {32768, 16384, 0} "left" 1.000000 "left" 1.000000 fill 1 0 notrack
ioKnob {786, 721} {48, 48} 0.003500 0.050000 0.010000 0.003500 atck
ioKnob {903, 721} {48, 48} 0.004000 0.030000 0.010000 0.004000 dec
ioKnob {844, 721} {48, 48} 0.000000 1.000000 0.010000 1.000000 on
ioText {765, 666} {129, 24} label 0.000000 0.00100 "" center "Lucida Grande" 10 {65280, 65280, 65280} {0, 0, 0} background border SEQUENCER CONTROLS
ioKnob {786, 815} {50, 50} 0.125000 1.000000 0.010000 0.505051 vel
ioText {789, 795} {50, 30} label 0.000000 0.00100 "" left "Lucida Grande" 12 {65280, 0, 0} {65280, 65280, 65280} nobackground noborder SPEEDed
ioText {791, 762} {40, 24} display 0.000000 0.00100 "atck" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {849, 762} {38, 24} display 0.000000 0.00100 "on" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {909, 762} {38, 24} display 0.000000 0.00100 "dec" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {911, 857} {38, 24} display 0.000000 0.00100 "time" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioButton {913, 892} {83, 44} event 1.000000 "" "Cutoff" "/" i  102  0  0.5
ioKnob {931, 920} {48, 48} 0.010000 0.500000 0.010000 0.039697 cutref
ioButton {990, 891} {86, 43} event 1.000000 "" "Pan" "/" i  103  0  0.1
ioKnob {1010, 921} {48, 48} 0.000000 1.000000 0.010000 0.555556 panrange
ioText {638, 794} {36, 24} label 0.000000 0.00100 "" left "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder Pitch
ioText {638, 848} {30, 24} label 0.000000 0.00100 "" left "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder Lev
ioText {638, 884} {34, 26} label 0.000000 0.00100 "" left "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder Cut
ioText {638, 927} {30, 24} label 0.000000 0.00100 "" left "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder Pan
ioText {77, 816} {26, 24} display 0.000000 0.00100 "s01" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {111, 816} {26, 24} display 0.000000 0.00100 "s02" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {147, 816} {26, 24} display 0.000000 0.00100 "s03" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {181, 817} {26, 24} display 0.000000 0.00100 "s04" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {217, 817} {26, 24} display 0.000000 0.00100 "s05" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {253, 817} {26, 24} display 0.000000 0.00100 "s06" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioMeter {770, 884} {129, 13} {44544, 53504, 65280} "" 0.008547 "" 1.000000 fill 1 0 notrack
ioText {891, 878} {96, 32} label 0.000000 0.00100 "" center "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder Randomize
ioMeter {968, 883} {177, 13} {44544, 53504, 65280} "" 0.000000 "" 0.000000 fill 1 0 mouse
ioText {286, 817} {26, 24} display 0.000000 0.00100 "s07" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {321, 817} {26, 24} display 0.000000 0.00100 "s08" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {357, 817} {26, 24} display 0.000000 0.00100 "s09" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {392, 817} {26, 24} display 0.000000 0.00100 "s10" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {427, 817} {26, 24} display 0.000000 0.00100 "s11" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {462, 817} {26, 24} display 0.000000 0.00100 "s12" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {497, 817} {26, 24} display 0.000000 0.00100 "s13" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {531, 817} {26, 24} display 0.000000 0.00100 "s14" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {567, 817} {26, 24} display 0.000000 0.00100 "s15" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {602, 817} {26, 24} display 0.000000 0.00100 "s16" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioButton {916, 948} {80, 40} event 1.000000 "" "Reset" "/" i113 0 0.1
ioButton {994, 949} {80, 40} event 1.000000 "" "Reset" "/" i114 0 0.1
ioMeter {935, 836} {41, 13} {44544, 53504, 65280} "" 0.000000 "" 0.000000 fill 1 0 mouse
ioKnob {851, 548} {48, 48} 0.000000 1.000000 0.010000 0.505051 noiselev
ioKnob {782, 548} {48, 48} -10.000000 10.000000 0.010000 10.000000 noisecolor
ioMeter {1072, 724} {20, 18} {0, 65280, 65280} "seq" 1.000000 "seq" 1.000000 fill 1 0 notrack
ioMeter {982, 727} {33, 13} {44544, 53504, 65280} "" 0.008547 "" 1.000000 fill 1 0 notrack
ioMeter {995, 729} {13, 31} {0, 0, 0} "" 0.008547 "" 1.000000 fill 1 0 notrack
ioMeter {1072, 746} {20, 18} {0, 65280, 65280} "synth" 0.000000 "synth" 0.000000 fill 1 0 notrack
ioMeter {1073, 779} {20, 18} {0, 65280, 65280} "frwd" 1.000000 "frwd" 1.000000 fill 1 0 notrack
ioMeter {990, 778} {20, 18} {0, 65280, 65280} "rvrs" 0.000000 "rvrs" 0.000000 fill 1 0 notrack
ioMeter {960, 582} {15, 63} {65280, 32768, 0} "in_1" 0.000000 "in_1" 0.000000 fill 1 0 notrack
ioMeter {974, 582} {15, 63} {65280, 32768, 0} "in_2" 0.000000 "in_2" 0.000000 fill 1 0 notrack
ioText {859, 291} {42, 24} display 0.000000 0.00100 "shape2" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {859, 431} {42, 24} display 0.000000 0.00100 "shape3" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {855, 146} {42, 24} display 0.000000 0.00100 "shape1" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {1217, 146} {29, 24} label 0.000000 0.00100 "" left "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder Hz
ioText {1077, 147} {44, 24} display 0.000000 0.00100 "rmlev" center "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {1352, 148} {44, 24} display 0.000000 0.00100 "fillev" center "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {813, 244} {31, 27} label 0.000000 0.00100 "" left "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder Hz
ioText {923, 148} {39, 24} display 0.000000 0.00100 "lsine1" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {985, 148} {39, 24} display 0.000000 0.00100 "lramp1" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {989, 295} {39, 24} display 0.000000 0.00100 "lramp2" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {814, 385} {31, 27} label 0.000000 0.00100 "" left "Lucida Grande" 11 {0, 0, 0} {65280, 65280, 65280} nobackground noborder Hz
ioText {927, 433} {39, 24} display 0.000000 0.00100 "lsquare3" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {988, 433} {39, 24} display 0.000000 0.00100 "lramp3" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {1070, 433} {39, 24} display 0.000000 0.00100 "wetdry" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {1168, 433} {39, 24} display 0.000000 0.00100 "revlev" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {1267, 433} {39, 24} display 0.000000 0.00100 "traplev" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {1356, 433} {39, 24} display 0.000000 0.00100 "signal" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {1067, 295} {39, 24} display 0.000000 0.00100 "attack" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {1099, 293} {39, 35} label 0.000000 0.00100 "" left "Lucida Grande" 11 {0, 0, 0} {65280, 65280, 65280} nobackground noborder sec
ioText {1195, 293} {39, 35} label 0.000000 0.00100 "" left "Lucida Grande" 11 {0, 0, 0} {65280, 65280, 65280} nobackground noborder sec
ioText {1161, 295} {45, 25} display 0.000000 0.00100 "eon" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {1258, 295} {39, 24} display 0.000000 0.00100 "decay" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {1290, 293} {39, 35} label 0.000000 0.00100 "" left "Lucida Grande" 11 {0, 0, 0} {65280, 65280, 65280} nobackground noborder sec
ioText {856, 582} {39, 24} display 0.000000 0.00100 "noiselev" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {924, 582} {39, 24} display 0.000000 0.00100 "levin_1" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {985, 582} {39, 24} display 0.000000 0.00100 "levin_2" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {1063, 618} {59, 24} label 0.000000 0.00100 "" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder Mute CH1
ioText {1155, 619} {58, 24} label 0.000000 0.00100 "" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder Mute CH2
ioText {1067, 586} {40, 24} display 0.000000 0.00100 "filch1" center "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {1093, 586} {24, 24} label 0.000000 0.00100 "" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder dB
ioText {1190, 586} {24, 24} label 0.000000 0.00100 "" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder dB
ioText {1163, 586} {40, 24} display 0.000000 0.00100 "filch2" center "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {1350, 295} {39, 24} display 0.000000 0.00100 "off_pulse" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {1380, 293} {39, 35} label 0.000000 0.00100 "" left "Lucida Grande" 11 {0, 0, 0} {65280, 65280, 65280} nobackground noborder sec
ioMenu {758, 956} {98, 30} 1 202 "octave-1 ,octave 0, octave+1" transpose
ioMeter {1073, 829} {20, 18} {0, 65280, 65280} "port" 0.000000 "port" 0.000000 fill 1 0 notrack
ioText {914, 774} {29, 24} label 0.000000 0.00100 "" left "Lucida Grande" 11 {0, 0, 0} {65280, 65280, 65280} nobackground noborder ms
ioText {797, 771} {29, 24} label 0.000000 0.00100 "" left "Lucida Grande" 11 {0, 0, 0} {65280, 65280, 65280} nobackground noborder ms
ioMeter {1146, 883} {297, 13} {44544, 53504, 65280} "" 0.000000 "" 0.000000 fill 1 0 mouse
ioText {836, 857} {69, 24} label 0.000000 0.00100 "" center "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder Oct. Hstep
ioKnob {1214, 928} {48, 48} 0.001000 0.010000 0.010000 0.003000 del
ioText {1220, 963} {38, 24} display 0.000000 0.00100 "del" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {1217, 917} {40, 24} label 0.000000 0.00100 "" left "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder Delay
ioKnob {1285, 928} {48, 48} 0.000000 0.900000 0.010000 0.618182 fdbk
ioText {1288, 917} {40, 24} label 0.000000 0.00100 "" left "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder Feeday
ioText {1291, 963} {38, 24} display 0.000000 0.00100 "fdbk" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioCheckbox {1157, 942} {30, 30} on flsw
ioKnob {1355, 928} {48, 48} 0.010000 2.000000 0.010000 0.391919 rate
ioText {1361, 917} {38, 24} label 0.000000 0.00100 "" left "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder Rate
ioText {1361, 963} {38, 24} display 0.000000 0.00100 "rate" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioMeter {1163, 927} {18, 17} {65280, 0, 0} "flsw" 1.000000 "flsw" 1.000000 fill 1 0 notrack
ioText {1260, 614} {32, 24} label 0.000000 0.00100 "" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder CH1
ioText {1286, 614} {31, 24} label 0.000000 0.00100 "" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder CH2
ioMeter {999, 749} {19, 13} {0, 0, 0} "" 0.008547 "" 1.000000 fill 1 0 notrack
ioText {1153, 891} {85, 24} label 0.000000 0.00100 "" center "Lucida Grande" 10 {63744, 65280, 65280} {3328, 4864, 1024} background noborder FLANGER
ioText {781, 156} {41, 26} display 0.000000 0.00100 "frosc1" left "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {781, 298} {41, 25} display 0.000000 0.00100 "frosc2" left "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {782, 440} {41, 25} display 0.000000 0.00100 "frosc3" left "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {1462, 662} {166, 37} label 0.000000 0.00100 "" left "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioText {929, 300} {39, 24} display 0.000000 0.00100 "lsquare2" left "Lucida Grande" 9 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioMeter {707, 755} {18, 16} {65280, 0, 0} "ledseq" 0.000000 "ledseq" 0.000000 fill 1 0 notrack
ioText {679, 795} {31, 26} display 0.000000 0.00100 "notebar" center "Lucida Grande" 12 {32768, 0, 0} {52224, 65280, 26112} background border 
ioSlider {69, 766} {562, 34} 1.000000 16.000000 16.000000 nnote
ioText {679, 940} {52, 24} display 0.000000 0.00100 "incr" left "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder 
ioKnob {675, 905} {48, 48} 0.100000 4.000000 0.010000 1.793939 incr
ioText {845, 793} {48, 25} display 0.000000 0.00100 "dispindex" left "Lucida Grande" 12 {32768, 0, 0} {52224, 65280, 26112} background border 
ioText {848, 813} {39, 24} label 0.000000 0.00100 "" center "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder Index
ioText {680, 890} {39, 24} label 0.000000 0.00100 "" center "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder Incr
ioText {662, 821} {63, 32} label 0.000000 0.00100 "" center "Lucida Grande" 10 {0, 0, 0} {65280, 65280, 65280} nobackground noborder #Events
ioButton {926, 93} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {991, 93} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {927, 240} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {990, 240} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {930, 379} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {989, 379} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {830, 293} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {830, 433} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {890, 293} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {890, 433} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {117, 147} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {118, 178} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {118, 215} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {118, 248} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {118, 284} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {118, 314} {40, 40} pict 1.000000 "" "Button" "/" i1 0 10
ioButton {656, 853} {82, 41} event 1.000000 "" "SET = 1" "/" i9990 0 0.1
ioSlider {37, 808} {34, 169} 0.000000 0.120000 0.000000 shift
</MacGUI>
<MacPresets>
LastPreset: Basequ
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
</MacPresets
