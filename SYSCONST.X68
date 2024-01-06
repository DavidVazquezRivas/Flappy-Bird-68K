; =============================================================================
; SYSTEM CONSTANTS
; =============================================================================

; --- SCREEN RELATED CONSTANTS ------------------------------------------------

SCRFPS      EQU     60                  ; SCREEN FRAMES PER SECOND
SCRWIDTH    EQU     640                 ; SCREEN WIDTH
SCRHEIGH    EQU     480                 ; SCREEN HEIGHT

; --- TEXT OUTPUT RELATED CONSTANTS -------------------------------------------

TXTCOLOR    EQU     $0                  ; TEXT OUTPUT COLOR
TXTSTYLE    EQU     %0001               ; TEXT STYLE (STRIKEOUT,UNDERLINE,ITALIC,BOLD)
TXTSIZE     EQU     14                  ; TEXT SIZE
TXTFONT     EQU     4                   ; TEXT FONT (CURRENT 'LUCIDA CONSOLE')

; --- KEYCODES ----------------------------------------------------------------

KBDSPACE    EQU     ' '
KBDPAUSE    EQU     27

; --- SOUND IDENTIFIERS -------------------------------------------------------

SNDDIE      EQU     0
SNDJUMP     EQU     1
SNDSCO      EQU     2

; --- TRAP NUMBERS ------------------------------------------------------------

SCRUPDTN    EQU     0                   ; SCREEN UPDATE TRAP NUMBER
KBDUPDTN    EQU     1                   ; KEYBOARD UPDATE TRAP NUMBER
MOUUPDTN    EQU     2                   ; MOUSE UPDATE TRAP NUMBER
SNDPLTN     EQU     3                   ; SOUND PLAY TRAP NUMBER

; --- INTERRUPTION NUMBERS ----------------------------------------------------

SCRINTN     EQU     1                   ; SCREEN INTERRUPT TRAP NUMBER    













*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
