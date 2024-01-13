; =============================================================================
; SYSTEM VARIABLES
; =============================================================================

; --- KEYBOARD RELATED VARIABLES ----------------------------------------------

KBDVAL      DS.B    1                       ; KEY STATE
KBDEDGE     DS.B    1                       ; KEY EDGE

; --- MOUSE RELATED VARIABLES -------------------------------------------------

MOUPOS      DS.L    1                       ; MOUSE POSITION (16 BITS Y, 16 BITS X)
MOUVAL      DS.B    1                       ; MOUSE VALUE (0,CTRL,ALT,SHIFT,DOUBLE,MID,RIGHT,LEFT)
            DS.W    0

; --- TIMED INTERRUPT RELATED VARIABLES ---------------------------------------

SCRINTCT    DS.B    1                       ; INTERRUPT COUNTER
SCRCYCCT    DC.B    0                       ; SCREEN CYCLE COUNTER
GAMCYCCT    DC.B    0                       ; GAME CYCLE COUNTER
            DS.W    0
            
; --- FILE PATHS --------------------------------------------------------------

SCOPATH     DC.B     'DATA/SCORES.dat',0    ; SCORE FILE PATH
            DS.W     0








*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
