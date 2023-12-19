; =============================================================================
; PAUSE SCREEN MANAGEMENT
; =============================================================================

; ------------------------------------------------------------------------------
PAUSINIT
; PAUSE SCREEN INIT
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            MOVE.B  D0,-(A7)
            MOVE.B  (KBDEDGE),D0
            AND.B   #2,D0
            BEQ     .CONT
            MOVE.W  #STAGAME,(STANEXT)   
   
.CONT       MOVE.B  (A7)+,D0
            RTS

; ------------------------------------------------------------------------------
PAUSUPD
; PAUSE SCREEN UPDATE
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
        
            MOVE.B  D0,-(A7)
            
            ; CHECK IF KEY PRESSED TO RESUME GAME
            MOVE.B  (KBDEDGE),D0
            BTST    #1,D0
            BEQ     .CONT
            MOVE.W  #STAGAME, (STANEXT)   
            
.CONT       MOVE.B  (A7)+,D0     
            RTS

; ------------------------------------------------------------------------------
PAUSPLOT
; PAUSE SCREEN PLOT
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            BRA     GAMEPLOT












*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
