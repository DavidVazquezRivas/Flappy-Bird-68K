; =============================================================================
; INTRO SCREEN MANAGEMENT
; =============================================================================

; ------------------------------------------------------------------------------
ISCINIT
; INTRO SCREEN INIT
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            JSR AGLCLEAN
            RTS

; ------------------------------------------------------------------------------
ISCUPD
; INTRO SCREEN UPDATE
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------

            MOVE.B  (KBDEDGE),D0
            AND.B   #1,D0
            BEQ     .CONT
            MOVE.W  #STAGAME,(STANEXT)      
.CONT
            RTS

; ------------------------------------------------------------------------------
ISCPLOT
; INTRO SCREEN PLOT
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            RTS







*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~