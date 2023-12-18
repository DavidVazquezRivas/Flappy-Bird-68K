; =============================================================================
; SYSTEM VARIABLES
; =============================================================================

; --- KEYBOARD RELATED VARIABLES ----------------------------------------------

KBDVAL      DS.B    1                       ; KEY STATE
KBDEDGE     DS.B    1                       ; KEY EDGE

; --- TIMED INTERRUPT RELATED VARIABLES ---------------------------------------

SCRINTCT    DS.B    1                       ; INTERRUPT COUNTER
SCRCYCCT    DS.B    1                       ; SCREEN CYCLE COUNTER
GAMCYCCT    DC.B    0                       ; GAME CYCLE COUNTER
            DS.W    0
            
; --- FILE PATHS --------------------------------------------------------------

SCOPATH     DC.B     'DATA/SCORES.dat',0
            DS.W     0




*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
