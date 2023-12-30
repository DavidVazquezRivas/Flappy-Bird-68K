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
            
            ; INIT BUTTON (THIS IS A TEST)
            LEA     BUTINIT,A1
            LEA     BUTUPD,A2
            LEA     BUTPLOT,A3
            MOVE    #BUTAGTP,D0
            LEA     .TXTTMP,A4
            MOVE.W  #200,D1
            MOVE.W  #300,D3
            MOVE.W  #100,D2
            MOVE.W  #200,D4
            MOVE.W  #STAGAME,D5
            JSR     AGLADD
            
            RTS
            
.TXTTMP    DC.B    'RESUME',0
            DS.W    0

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
            
.CONT       JSR     AGLUPD
            
            MOVE.B  (A7)+,D0     
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
