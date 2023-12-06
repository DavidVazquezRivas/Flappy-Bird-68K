; =============================================================================
; GAME CONSTANTS
; =============================================================================

; --- BIRD RELATED CONSTANTS --------------------------------------------------

JUMPVELY    EQU     -10
BIRDPOSX    EQU     SCRWIDTH/4
        ; THE FOLLOWING CONSTANTS WILL BE REMOVED WHEN USE AN IMAGE AS A BIRD
BIRDRAD     EQU     15                  ; BIRD RADIUS

; --- PIPE RELATED CONSTANTS --------------------------------------------------

PIPEPCOL    EQU     $00151A30           ; PIPE PEN COLOR
PIPEFCOL    EQU     $0020284D           ; PIPE FILL COLOR
PIPEVELX    EQU     -5                  ; PIPE X SPEED
PIPEWIDT    EQU     50                  ; PIPE WIDTH
PIPEGAPS    EQU     120                 ; PIPE GAP SIZE
PIPEAGTP    EQU     1                   ; PIPE AGENT TYPE CODE
MASKNWPP    EQU     %00111111           ; NEW PIPE MASK 

; --- BACKGROUND RELATED CONSTANTS --------------------------------------------

SKYCOLOR    EQU     $00FFBF80           ; SKY BACKGROUND COLOR
FLOCOLOR    EQU     $0035DE3B           ; FLOOR BACKGROUND COLOR
FLOHEIGH    EQU     60                  ; FLOOR HEIGHT

; --- SCOREBOARD RELATED CONSTANTS --------------------------------------------

SCOFCOL     EQU     FLOCOLOR           ; TEXT BACKGROUND COLOR
SCOLINE     EQU     $101D              ; SCORE TEXT COORDINATE 
HSCOLINE    EQU     $101E              ; HIGHSCORE TEXT COORDINATE

; --- STATE RELATED CONSTANTS -------------------------------------------------

STANONE     EQU     -1                 ; NON-EXISTENT STATE NUMBER
STAINTRO    EQU     0                  ; INTRO SCREEN STATE NUMBER
STAINSTR    EQU     1                  ; INSTRUCTION STATE NUMBER
STAGAME     EQU     2                  ; GAME SCREEN STATE NUMBER
STAPAUSE    EQU     3                  ; PAUSE SCREEN STATE NUMBER
STAGOVER    EQU     4                  ; GAME OVER SCREEN STATE NUMBER














*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
