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
            ; INIT GAME VARIABLES
            JSR BIRDINIT
            JSR SCOINIT
            ; CLEAN PIPES
            MOVE.W  #PIPEAGTP,D0
            JSR AGLCLEAN
            RTS

; ------------------------------------------------------------------------------
ISCUPD
; INTRO SCREEN UPDATE
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            
            JSR BACKUPD
            JSR AGLUPD
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
            JSR AGLPLOT
            RTS









*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
