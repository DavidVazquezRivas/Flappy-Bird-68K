; =============================================================================
; SYSTEM CONSTANTS
; =============================================================================

; --- COLORS CONSTANTS 00BBGGRR -----------------------------------------------

DKYELLOW    EQU     $0000BBBB           ; DARK YELLOW COLOR
LGYELLOW    EQU     $0000FFFF           ; LIGHT YELLOW COLOR
DARKRED     EQU     $000000BB           ; DARK RED COLOR
LIGHTRED    EQU     $000000FF           ; LIGHT RED COLOR

; --- SCREEN RELATED CONSTANTS ------------------------------------------------

SCRFPS      EQU     60                  ; SCREEN FRAMES PER SECOND
SCRWIDTH    EQU     640                 ; SCREEN WIDTH
SCRHEIGH    EQU     480                 ; SCREEN HEIGHT

; --- KEYCODES ----------------------------------------------------------------

KBDSPACE    EQU     ' '

; --- TRAP NUMBERS ------------------------------------------------------------

SCRUPDTN    EQU     0                   ; SCREEN UPDATE TRAP NUMBER
KBDUPDTN    EQU     1                   ; KEYBOARD UPDATE TRAP NUMBER

; --- INTERRUPTION NUMBERS ----------------------------------------------------

SCRINTN     EQU     1                   ; SCREEN INTERRUPT TRAP NUMBER    







*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
