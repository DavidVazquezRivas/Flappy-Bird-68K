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

            MOVEM.L  A1-A4/D0-D5,-(A7)
            
            JSR     SCOSAVE
            ; INIT PLAY AGAIN BUTTON
            LEA     BUTINIT,A1
            LEA     BUTUPD,A2
            LEA     BUTPLOT,A3
            MOVE    #BUTAGTP,D0
            LEA     GOVTXTB1,A4
            MOVE.W  #SCRWIDTH/2-GOVBUTWD/2,D1
            MOVE.W  #SCRWIDTH/2+GOVBUTWD/2,D3
            MOVE.W  #SCRHEIGH/2-GOVBUTHG/2,D2
            MOVE.W  #SCRHEIGH/2+GOVBUTHG/2,D4
            MOVE.W  #STAINTRO,D5
            JSR     AGLADD

            MOVEM.L  (A7)+,A1-A4/D0-D5
            RTS

; ------------------------------------------------------------------------------
GOVUPD
; GAME OVER SCREEN UPDATE
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------

            MOVE.W  D0,-(A7)

            JSR     BACKUPD
            JSR     AGLUPD
            ; CHECK IF KEY PRESSED
            MOVE.B  (KBDEDGE),D0
            BEQ     .CONT
            MOVE.W  #STAINTRO,(STANEXT)   
   
.CONT       MOVE.W  (A7)+,D0
            RTS

; ------------------------------------------------------------------------------
GOVPLOT
; GAME OVER SCREEN PLOT
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------

            MOVEM.L D0-D4/A2,-(A7)

            ; PLOT ITEMS (SCORE, BIRD, CLOUDS AND PIPES)
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
            MOVE.W  #SCRWIDTH/2-GOVMEWID/2,D1
            MOVE.W  #SCRWIDTH/2+GOVMEWID/2,D3
            MOVE.W  #SCRHEIGH/2-GOVMEHEI/2,D2
            MOVE.W  #SCRHEIGH/2+GOVMEHEI/2,D4
            MOVE.B  #87,D0
            TRAP    #15
            
            ; PLOT MENU TITLE
            MOVE.L  #DARKBLUE,D1
            MOVE.B  #80,D0
            TRAP    #15
            ADDQ.B  #1,D0
            TRAP    #15
            MOVE.W  #SCRWIDTH/2-GOVBUTWD/2,D1
            MOVE.W  #SCRWIDTH/2+GOVBUTWD/2,D3
            SUB.W   #GOVBUTHG/2,D2
            MOVE.W  D2,D4
            ADD.W   #GOVBUTHG,D4
            MOVE.B  #87,D0
            TRAP    #15
            MOVE.W  D1,D3
            SUB.W   #GOVBUTHG/2,D1
            ADD.W   #GOVBUTHG/2,D3
            ADDQ.B  #1,D0
            TRAP    #15
            ADD.W   #GOVBUTWD,D1
            ADD.W   #GOVBUTWD,D3
            TRAP    #15
            MOVE.L  #WHITE,D1
            JSR     TXTINIT
            CLR.W   D0              ; COUNT TEXT LENGTH
            LEA     GOVTITLE,A1
.LOOP       TST.B   (A1)+
            BEQ     .ENDLOOP
            ADD.B   #TXTSIZE-2,D0
            BRA     .LOOP
.ENDLOOP    
            MOVE.W  #SCRWIDTH/2,D1
            LSR.W   #1,D0
            SUB.W   D0,D1
            ADD.W   #GOVBUTHG/2,D2
            SUB.W   #TXTSIZE/2-1,D2
            LEA     GOVTITLE,A1
            MOVE.B  #95,D0
            TRAP    #15

            ; PLOT BUTTONS
            MOVE.W  #BUTAGTP,D0
            JSR     AGLPLOTT
            
            MOVEM.L (A7)+,D0-D4/A2
            RTS












*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
