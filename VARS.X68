; =============================================================================
; GAME VARIABLES
; =============================================================================

; --- BIRD RELATED VARIABLES --------------------------------------------------

BIRDPOSY    DS.W    1                   ; BIRD POSITION Y
BIRDVELY    DS.W    1                   ; BIRD SPEED Y
BIRDPCOL    DC.W    DKYELLOW            ; BIRD PEN COLOR
BIRDFCOL    DC.W    LGYELLOW            ; BIRD FILL COLOR

; --- SCOREBOARD RELATED VARIABLES --------------------------------------------

SCORE       DS.W    1                   ; ACTUAL GAME SCORE
HIGHSCO     DS.W    1                   ; HIGH SCORE

;  --- STATE RELATED VARIABLES ------------------------------------------------

STACUR      DS.W    1                   ; CURRENT STATE
STANEXT     DS.W    1                   ; NEXT STATE






*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
