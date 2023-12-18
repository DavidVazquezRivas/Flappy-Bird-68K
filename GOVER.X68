; =============================================================================
; GAME OVER SCREEN MANAGEMENT
; =============================================================================

; ------------------------------------------------------------------------------
GOVINIT
; GAME OVER SCREEN INIT
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            BRA     SCOSAVE

; ------------------------------------------------------------------------------
GOVUPD
; GAME OVER SCREEN UPDATE
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            MOVE.B  (KBDEDGE),D0
            BEQ     .CONT
            MOVE.W  #STAINTRO,(STANEXT)      
.CONT
            RTS

; ------------------------------------------------------------------------------
GOVPLOT
; GAME OVER SCREEN PLOT
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            JSR GAMEPLOT
            RTS









*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
