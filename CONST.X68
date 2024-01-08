; =============================================================================
; GAME CONSTANTS
; =============================================================================

; --- COLORS CONSTANTS 00BBGGRR -----------------------------------------------

DKYELLOW    EQU     $0000BBBB           ; DARK YELLOW COLOR
LGYELLOW    EQU     $0000FFFF           ; LIGHT YELLOW COLOR
DARKGRAY    EQU     $000C0C0C           ; DARK GRAY COLOR
NORMGRAY    EQU     $00616161           ; NORMAL (NOT DARK OR LIGHT) GRAY COLOR 
LGGRAY      EQU     $00A3A3A3           ; LIGHT GRAY COLOR
DARKBLUE    EQU     $00231505           ; DARK BLUE COLOR 
SKYBLUE     EQU     $00FFBF80           ; SKY BLUE COLOR
NRMGREEN    EQU     $0018732C           ; NORMAL (NOT DARK OR LIGHT) GREEN COLOR
LGGREEN     EQU     $0035DE3B           ; LIGHT GREEN COLOR
LGBROWN     EQU     $00306284           ; LIGHT BROWN COLOR
WHITE       EQU     $00FEFDFB           ; WHITE COLOR
BLACK       EQU     $00000000           ; BLACK COLOR

; --- BIRD RELATED CONSTANTS --------------------------------------------------

JUMPVELY    EQU     -10                 ; VELOCITY BIRD GETS WHEN JUMPING
BIRDPOSX    EQU     SCRWIDTH/4          ; BIRD POSITION X
BIRDRAD     EQU     15                  ; BIRD RADIUS

; --- PIPE RELATED CONSTANTS --------------------------------------------------

PIPEPCOL    EQU     DARKGRAY            ; PIPE PEN COLOR
PIPEFCOL    EQU     NORMGRAY            ; PIPE FILL COLOR
PIPEVELX    EQU     -5                  ; PIPE X SPEED
PIPEWIDT    EQU     50                  ; PIPE WIDTH
PIPEGAPS    EQU     120                 ; PIPE GAP SIZE
PIPEAGTP    EQU     2                   ; PIPE AGENT TYPE CODE
MASKNWPP    EQU     %00111111           ; NEW PIPE MASK 
PPOPOVER    EQU     5                   ; PIPE OPENING OVERFLOW
PPOPHEIG    EQU     15                  ; PIPE OPENING HEIGHT

; --- BACKGROUND RELATED CONSTANTS --------------------------------------------

SKYCOLOR    EQU     SKYBLUE             ; SKY BACKGROUND COLOR
GRASSCLR    EQU     LGGREEN             ; GRASS COLOR
DIRTCLR     EQU     LGBROWN             ; DIRT COLOR
FLOHEIGH    EQU     60                  ; FLOOR HEIGHT
DIRTHEIG    EQU     45                  ; DIRT PART HEIGHT

; --- CLOUD (BACKGROUND) RELATED CONSTANTS ------------------------------------

CLDSPMSK    EQU     $FFFFFFFC           ; MASK TO INIT CLOUD SPEED
MASKNWCL    EQU     %11111111           ; MASK TO SPAWN NEW CLOUD
CLOUDAGT    EQU     1                   ; CLOUD AGENT TYPE CODE

; --- SCOREBOARD RELATED CONSTANTS --------------------------------------------

SCOFCOL     EQU     DIRTCLR             ; TEXT BACKGROUND COLOR
SCOLINE     EQU     $1017               ; SCORE TEXT COORDINATE 
HSCOLINE    EQU     $1018               ; HIGHSCORE TEXT COORDINATE

; --- STATE RELATED CONSTANTS -------------------------------------------------

STANONE     EQU     -1                  ; NON-EXISTENT STATE NUMBER
STAINTRO    EQU     0                   ; INTRO SCREEN STATE NUMBER
STAINSTR    EQU     1                   ; INSTRUCTION STATE NUMBER
STAGAME     EQU     2                   ; GAME SCREEN STATE NUMBER
STAPAUSE    EQU     3                   ; PAUSE SCREEN STATE NUMBER
STAGOVER    EQU     4                   ; GAME OVER SCREEN STATE NUMBER

; --- IMAGE DRAWING CONSTANTS -------------------------------------------------

BLOCKSZ     EQU     4                   ; BLOCK SIZE

; --- BUTTON RELATED CONSTANTS ------------------------------------------------

BUTCOLOR    EQU     NRMGREEN            ; BUTTON COLOR
BUTHVCLR    EQU     LGGREEN             ; BUTTON COLOR WHILE BEING HOVER
BUTAGTP     EQU     3                   ; BUTTON AGENT TYPE CODE

; --- PAUSE STATE RELATED CONSTANTS -------------------------------------------

PAUMEHEI    EQU     150                 ; PAUSE MENU HEIGHT
PAUMEWID    EQU     200                 ; PAUSE MENU WIDTH
PAUBUTWD    EQU     130                 ; PAUSE MENU BUTTON WIDTH
PAUBUTHG    EQU     35                  ; PAUSE MENU BUTTON HEIGHT

; --- GAME OVER STATE RELATED CONSTANTS ---------------------------------------

GOVMEHEI    EQU     100                 ; GAME OVER MENU HEIGHT
GOVMEWID    EQU     200                 ; GAME OVER MENU WIDTH
GOVBUTWD    EQU     130                 ; GAME OVER MENU BUTTON WIDTH
GOVBUTHG    EQU     35                  ; GAME OVER MENU BUTTON HEIGHT





*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
