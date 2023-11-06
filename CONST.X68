; =============================================================================
; GAME CONSTANTS
; =============================================================================

; --- BIRD RELATED CONSTANTS --------------------------------------------------

JUMPVELY    EQU     -12
BIRDPOSX    EQU     SCRWIDTH/4
        ; THE FOLLOWING CONSTANTS WILL BE REMOVED WHEN USE AN IMAGE AS A BIRD
BIRDRAD     EQU     15                  ; BIRD RADIUS

; --- PIPE RELATED CONSTANTS --------------------------------------------------

PIPEPCOL    EQU     $00151a30           ; PIPE PEN COLOR
PIPEFCOL    EQU     $0020284D           ; PIPE FILL COLOR
PIPEVELX    EQU     -5                  ; PIPE X SPEED
PIPEWIDT    EQU     50                  ; PIPE WIDTH
PIPEGAPS    EQU     120                 ; PIPE GAP SIZE
PIPEAGTP    EQU     1                   ; PIPE AGENT TYPE CODE

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
