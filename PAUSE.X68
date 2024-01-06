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
            
            ; INIT RESUME BUTTON
            LEA     BUTINIT,A1
            LEA     BUTUPD,A2
            LEA     BUTPLOT,A3
            MOVE    #BUTAGTP,D0
            LEA     PAUTXTB1,A4
            MOVE.W  #SCRWIDTH/2-PAUBUTWD/2,D1
            MOVE.W  #SCRWIDTH/2+PAUBUTWD/2,D3
            MOVE.W  #SCRHEIGH/2-PAUBUTHG,D2
            MOVE.W  #SCRHEIGH/2,D4
            MOVE.W  #STAGAME,D5
            JSR     AGLADD
            
            ; INIT LEAVE BUTTON
            LEA     BUTINIT,A1
            LEA     BUTUPD,A2
            LEA     BUTPLOT,A3
            MOVE    #BUTAGTP,D0
            LEA     PAUTXTB2,A4
            MOVE.W  #SCRWIDTH/2-PAUBUTWD/2,D1
            MOVE.W  #SCRWIDTH/2+PAUBUTWD/2,D3
            MOVE.W  #SCRHEIGH/2+PAUBUTHG/2,D2
            MOVE.W  #SCRHEIGH/2+3*PAUBUTHG/2,D4
            MOVE.W  #STAINTRO,D5
            JSR     AGLADD
            
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
            
.CONT       MOVE.W  #BUTAGTP,D0
            JSR     AGLUPD
            
            MOVE.B  (A7)+,D0     
            RTS

; ------------------------------------------------------------------------------
PAUSPLOT
; PAUSE SCREEN PLOT
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------

            MOVEM.L D0-D4,-(A7)

            ; PLOT SCORE ITEMS (SCORE, BIRD, CLOUDS AND PIPES)
            JSR     SCOPLOT
            MOVE.W  #CLOUDAGT,D0
            JSR     AGLPLOTT
            MOVE.W  #PIPEAGTP,D0
            JSR     AGLPLOTT
            JSR     BIRDPLOT
            
            ; PLOT MENU BACKGROUND
            CLR.L   D1                      ; SET PEN COLOR
            MOVE.B  #80,D0  
            TRAP    #15
            MOVE.L  #LGGRAY,D1              ; SET FILL COLOR
            ADDQ.B  #1,D0
            TRAP    #15
            MOVE.W  #SCRWIDTH/2-PAUMEWID/2,D1
            MOVE.W  #SCRWIDTH/2+PAUMEWID/2,D3
            MOVE.W  #SCRHEIGH/2-PAUMEHEI/2,D2
            MOVE.W  #SCRHEIGH/2+PAUMEHEI/2,D4
            MOVE.B  #87,D0
            TRAP    #15
            
            ; PLOT BUTTONS
            MOVE.W  #BUTAGTP,D0
            JSR     AGLPLOTT
            
            MOVEM.L (A7)+,D0-D4
            RTS
















*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
