; =============================================================================
; GAME CONSTANTS
; =============================================================================

; --- BIRD RELATED CONSTANTS --------------------------------------------------

;BIRDPOSX    EQU     SCRWIDTH/4          BIRD X COORDINATE
        ; THE FOLLOWING CONSTANTS WILL BE REMOVED WHEN USE AN IMAGE AS A BIRD
BIRDPCOL    EQU     $0000CCCC
BIRDFCOL    EQU     $0000FFFF
BIRDRAD     EQU     10


; --- SCOREBOARD RELATED CONSTANTS --------------------------------------------

SCOFCOL     EQU     $00000000           ; TEXT BACKGROUND COLOR
SCOLINE1    EQU     $0101               ; FIRST TEXT LINE COORDINATE 
SCOLINE2    EQU     $0102               ; SECOND TEXT LINE COORDINATE

; --- BACKGROUND RELATED CONSTANTS --------------------------------------------

FLOHEIGH    EQU     20                  ; FLOOR HEIGHT

*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
