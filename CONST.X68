; =============================================================================
; GAME CONSTANTS
; =============================================================================

; --- COLORS CONSTANTS 00BBGGRR -----------------------------------------------

DKYELLOW    EQU     $0000BBBB           ; DARK YELLOW COLOR
LGYELLOW    EQU     $0000FFFF           ; LIGHT YELLOW COLOR
DARKGRAY    EQU     $000C0C0C           ; DARK GRAY COLOR
NORMGRAY    EQU     $00616161           ; NORMAL (NOT DARK OR LIGHT) GRAY COLOR 
SKYBLUE     EQU     $00FFBF80           ; SKY BLUE COLOR
LGGREEN     EQU     $0035DE3B           ; LIGHT GREEN COLOR
LGBROWN     EQU     $00306284           ; LIGHT BROWN COLOR
WHITE       EQU     $00FEFDFB           ; WHITE COLOR

; --- BIRD RELATED CONSTANTS --------------------------------------------------

JUMPVELY    EQU     -10
BIRDPOSX    EQU     SCRWIDTH/4
BIRDRAD     EQU     15                  ; BIRD RADIUS

; --- PIPE RELATED CONSTANTS --------------------------------------------------

PIPEPCOL    EQU     DARKGRAY           ; PIPE PEN COLOR
PIPEFCOL    EQU     NORMGRAY           ; PIPE FILL COLOR
PIPEVELX    EQU     -5                  ; PIPE X SPEED
PIPEWIDT    EQU     50                  ; PIPE WIDTH
PIPEGAPS    EQU     120                 ; PIPE GAP SIZE
PIPEAGTP    EQU     1                   ; PIPE AGENT TYPE CODE
MASKNWPP    EQU     %00111111           ; NEW PIPE MASK 
PPOPOVER    EQU     5                   ; PIPE OPENING OVERFLOW
PPOPHEIG    EQU     15                  ; PIPE OPENING HEIGHT

; --- BACKGROUND RELATED CONSTANTS --------------------------------------------

SKYCOLOR    EQU     SKYBLUE            ; SKY BACKGROUND COLOR
GRASSCLR    EQU     LGGREEN            ; GRASS COLOR
DIRTCLR     EQU     LGBROWN            ; DIRT COLOR
FLOHEIGH    EQU     60                 ; FLOOR HEIGHT
DIRTHEIG    EQU     45                 ; DIRT PART HEIGHT

; --- CLOUD (BACKGROUND) RELATED CONSTANTS ------------------------------------

CLDSPMSK    EQU     $FFFFFFFC
MASKNWCL    EQU     %01111111
CLOUDAGT    EQU     2

; --- SCOREBOARD RELATED CONSTANTS --------------------------------------------

SCOFCOL     EQU     DIRTCLR            ; TEXT BACKGROUND COLOR
SCOLINE     EQU     $101D              ; SCORE TEXT COORDINATE 
HSCOLINE    EQU     $101E              ; HIGHSCORE TEXT COORDINATE

; --- STATE RELATED CONSTANTS -------------------------------------------------

STANONE     EQU     -1                 ; NON-EXISTENT STATE NUMBER
STAINTRO    EQU     0                  ; INTRO SCREEN STATE NUMBER
STAINSTR    EQU     1                  ; INSTRUCTION STATE NUMBER
STAGAME     EQU     2                  ; GAME SCREEN STATE NUMBER
STAPAUSE    EQU     3                  ; PAUSE SCREEN STATE NUMBER
STAGOVER    EQU     4                  ; GAME OVER SCREEN STATE NUMBER

; --- IMAGE DRAWING CONSTANTS -------------------------------------------------

BLOCKSZ     EQU     4

















*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
