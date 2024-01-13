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

            MOVEM.L  A1-A4/D0-D5,-(A7)
            
            CLR.B   MOUVAL
            CLR.B   KBDVAL
            CLR.B   KBDEDGE
            CLR.B   GAMCYCCT
            ; INIT GAME VARIABLES
            JSR BIRDINIT
            JSR SCOINIT
            ; CLEAN PIPES AND BUTTONS
            MOVE.W  #PIPEAGTP,D0
            JSR AGLCLEAN
            MOVE.W  #BUTAGTP,D0
            JSR AGLCLEAN
          
            ; INIT PLAY BUTTON
            LEA     BUTINIT,A1
            LEA     BUTUPD,A2
            LEA     BUTPLOT,A3
            MOVE    #BUTAGTP,D0
            LEA     INTTXTB1,A4
            MOVE.W  #SCRWIDTH/2-INTBUTWD/2,D1
            MOVE.W  #SCRWIDTH/2+INTBUTWD/2,D3
            MOVE.W  #SCRHEIGH/2-INTBUTHG/2,D2
            MOVE.W  #SCRHEIGH/2+INTBUTHG/2,D4
            MOVE.W  #STAGAME,D5
            JSR     AGLADD
            ; INIT EXIT BUTTON
            LEA     BUTINIT,A1
            LEA     BUTUPD,A2
            LEA     BUTPLOT,A3
            MOVE    #BUTAGTP,D0
            LEA     INTTXTB2,A4
            MOVE.W  #SCRWIDTH/2-INTBUTWD/2,D1
            MOVE.W  #SCRWIDTH/2+INTBUTWD/2,D3
            MOVE.W  #SCRHEIGH/2+INTBUTHG,D2
            MOVE.W  #SCRHEIGH/2+2*INTBUTHG,D4
            MOVE.W  #STAEXIT,D5
            JSR     AGLADD
            
            MOVEM.L  (A7)+,A1-A4/D0-D5
            RTS

; ------------------------------------------------------------------------------
ISCUPD
; INTRO SCREEN UPDATE
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            
            MOVE.B  D0,-(A7)
            
            JSR BACKUPD
            JSR AGLUPD
            MOVE.B  (KBDEDGE),D0
            AND.B   #1,D0
            BEQ     .CONT
            MOVE.W  #STAGAME,(STANEXT)    
  
.CONT       MOVE.B  (A7)+,D0
            RTS

; ------------------------------------------------------------------------------
ISCPLOT
; INTRO SCREEN PLOT
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------

            MOVEM.L D0-D4/D6-D7/A1,-(A7)

            ; PLOT ITEMS (SCORE, BIRD, CLOUDS AND PIPES)
            MOVE.W  #CLOUDAGT,D0
            JSR     AGLPLOTT
            
            ; PLOT MENU BACKGROUND
            CLR.L   D1                      ; SET PEN COLOR
            MOVE.B  #80,D0  
            TRAP    #15
            MOVE.L  #LGGRAY,D1              ; SET FILL COLOR
            ADDQ.B  #1,D0
            TRAP    #15
            MOVE.W  #SCRWIDTH/2-INTMEWID/2,D1
            MOVE.W  #SCRWIDTH/2+INTMEWID/2,D3
            MOVE.W  #SCRHEIGH/2-INTMEHEI/2,D2
            MOVE.W  #SCRHEIGH/2+INTMEHEI/2,D4
            MOVE.B  #87,D0
            TRAP    #15
            
            ; PLOT LOGO
            LEA     LOGOH,A1
            MOVE.W  (A1)+,D6        ; ASSUME LOGOW IS RIGHT NEXT TO LOGOH
            MOVE.W  (A1)+,D7        ; ASSUME LOGO IS RIGHT NEXT TO LOGOW
            MOVE.W  D6,D0
            MOVE.W  D7,D1
            LSR.W   #1,D0
            LSR.W   #1,D1
            MOVE.W  #SCRHEIGH/2-INTMEHEI/2,D2
            SUB.W   D0,D2
            MOVE.W  #SCRWIDTH/2,D3
            SUB.W   D1,D3
            JSR     IMGPLOT
            
            ; PLOT BUTTONS
            MOVE.W  #BUTAGTP,D0
            JSR     AGLPLOTT
            
            MOVEM.L (A7)+,D0-D4/D6-D7/A1
            RTS














*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
