; =============================================================================
; GAME CONSTANTS
; =============================================================================

; --- BIRD RELATED CONSTANTS --------------------------------------------------

JUMPVELY    EQU     -10
VELUPDRT    EQU     2
        ; THE FOLLOWING CONSTANTS WILL BE REMOVED WHEN USE AN IMAGE AS A BIRD
BIRDPCOL    EQU     $0000CCCC           ; BIRD PEN COLOR
BIRDFCOL    EQU     $0000FFFF           ; BIRD FILL COLOR
BIRDRAD     EQU     15                  ; BIRD RADIUS

; --- PIPE RELATED CONSTANTS --------------------------------------------------

PIPEVELX    EQU     -20
PIPERATE    EQU     50
PIPEWIDTH   EQU     50

; --- SCOREBOARD RELATED CONSTANTS --------------------------------------------

SCOFCOL     EQU     $00000000           ; TEXT BACKGROUND COLOR
SCOLINE1    EQU     $0101               ; FIRST TEXT LINE COORDINATE 
SCOLINE2    EQU     $0102               ; SECOND TEXT LINE COORDINATE

; --- BACKGROUND RELATED CONSTANTS --------------------------------------------

SKYCOLOR    EQU     $00FFBF80           ; SKY BACKGROUND COLOR
FLOCOLOR    EQU     $0035DE3B           ; FLOOR BACKGROUND COLOR
FLOHEIGH    EQU     60                  ; FLOOR HEIGHT





*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
