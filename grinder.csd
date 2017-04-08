<CsoundSynthesizer>
<CsOptions>
-odac
;;; This program is derived from the CSound manual example for cross2 by
;;; Author: Paris Smaragdis
;;; MIT, Cambridge
;;; 1997
;;; found at http://www.csounds.com/manual/html/cross2.html
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 2
0dbfs = 1

instr cross
  idur        = p3
  icps        = p4
  isize       = 4096
  ioverlap    = 8
  iwin        = 3
  ;ain1,ainx  soundin "196678__soundmary__coffee-grinder.wav"
  ain1,ainx   soundin "67429__juskiddink__coffee-grind.wav"
  ;ain1,ainx  soundin "coffee_grinder.wav"
  ain2,ainy   diskin "riff2.wav", 1, 0, 1	
  istart      = 0.4
  kbias       init 1
  kmix        linseg 0, istart*idur, 0.7
  kmix2       linseg 0, istart*idur, 0, (1-istart)*idur, 1
  aout        cross2 ain1, ain2, isize, ioverlap, iwin, kbias
  aring       = ain1 * ain2
  aout1       = 2*kmix * aout + ain1 * (1 - kmix) + 0.0* kmix2 * ain2 + kmix * aring
             outs aout1, aout1
endin


</CsInstruments>
<CsScore>
; f 1 0 128 1 "ahh.aiff" 0 4 0
f 3 0 2048 20 2	;windowing function
i "cross" 0 10

</CsScore>
</CsoundSynthesizer>

