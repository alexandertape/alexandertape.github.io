<CsoundSynthesizer>
<CsOptions>
-odac -W -d
</CsOptions>
; ==============================================
<CsInstruments>

sr	=	44100
ksmps	=	1
nchnls	=	2
0dbfs	=	1

gisine ftgen 0, 0, 4096, 10, 1
garvbL init 0
garvbR init 0
gadelay init 0

instr 1	
kenv linseg 0, 0.1, 1, p3-0.1, 0
kamp = p4
kpch = cpsmidinn(p5)
kpan = p6
asig oscil kamp, kpch, gisine
aL, aR pan2 asig, kpan
outs aL * kenv, aR * kenv


garvbL = garvbL + (aL * .2)
garvbR = garvbR + (aR * .2)
gadelay = gadelay + ((aL)*0.4)
endin

instr 997
asig init 0
asig vdelay3 gadelay +(asig*0.6),3000, 20000 
asig butterlp asig, 2000
outs asig, asig
garvbL = garvbL + (asig*0.3)
garvbR = garvbR + (asig*0.3)
clear gadelay
endin

instr 998
asig init 0
asig vdelay3 gadelay +(asig*0.5),1000, 20000 
asig butterlp asig, 2000
outs asig, asig
garvbL = garvbL + (asig*0.3)
garvbR = garvbR + (asig*0.3)
clear gadelay
endin

instr 999
denorm garvbL, garvbL
aL, aR reverbsc garvbL, garvbR, 0.95, 40000
outs aL, aR
garvbL = 0
garvbR = 0
endin
</CsInstruments>
; ==============================================
<CsScore>
i997 0 3600
i998 0 3600
i999 0 3600
i1 4 2 0.2 60 0.1
i1 6 2 0.2 62 0.3
i1 8 2 0.2 64 0.6
i1 10 2 0.2 67 0.9
</CsScore>
</CsoundSynthesizer>

