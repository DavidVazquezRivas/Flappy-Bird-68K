; =============================================================================
; SCOREBOARD MANAGEMENT
; =============================================================================

; ------------------------------------------------------------------------------
SCOINIT
; INITIALIZE SCOREBOARD
; INPUT    : NONE 
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------

            MOVEM.L D0-D2/A0-A1,-(A7)
            CLR.W   (SCORE)
            CLR.W   (HIGHSCO)
            
            ; OPEN FILE
            LEA     SCOPATH,A1
            MOVE.B  #51,D0
            TRAP    #15
            
            ; READ HIGH SCORE
            LEA     HIGHSCO,A1
            MOVE.L  #2,D2
            MOVE.B  #53,D0
            TRAP    #15
            
            ; CLOSE FILE
            MOVE.B  #56,D0
            TRAP    #15
            
            MOVEM.L (A7)+,D0-D2/A0-A1
            RTS
            
; -----------------------------------------------------------------------------
SCOINC
; INCREASES THE SCORE BY 1
; INPUT     : NONE
; OUTPUT    : SCORE = SCORE + 1
; MODIFIES  : NONE (APART FROM OUTPUT)
; -----------------------------------------------------------------------------
            MOVEM.L D0/D2/D7,-(A7)

            ADDQ.W  #1,(SCORE)
            ; STOP ALL SOUNDS
            MOVE.B  #76,D0
            MOVE.L  #3,D2
            TRAP    #15
            
            ; PLAY SOUND
            MOVE.B  #SNDSCO,D7
            TRAP    #SNDPLTN
            
            MOVEM.L (A7)+,D0/D2/D7
            RTS
            
; ------------------------------------------------------------------------------
SCOPLOT
; PLOT THE SCOREBOARD
; INPUT    : NONE 
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------

            MOVEM.L D0-D1/A1,-(A7)

            ; SET BACKGROUND COLOR
            MOVE.B  #81,D0
            MOVE.L  #SCOFCOL,D1
            TRAP    #15
            
            ; SET SCORE LINE POSITION
            MOVE.B  #11,D0
            MOVE.W  #SCOLINE,D1
            TRAP    #15
            
            ; PLOT THE SCORE
            LEA     .SCOTXT,A1
            CLR.L   D1
            MOVE.W  (SCORE),D1
            MOVE.B  #17,D0
            TRAP    #15
            
            ; SET HIGH SCORE LINE POSITION
            MOVE.B  #11,D0
            MOVE.W  #HSCOLINE,D1
            TRAP    #15
            
            ; PLOT THE HIGHSCORE
            LEA     .HISCOTXT,A1
            CLR.L   D1
            MOVE.W  (HIGHSCO),D1
            MOVE.B  #17,D0
            TRAP    #15
            
            MOVEM.L (A7)+,D0-D1/A1
            RTS
            
.SCOTXT     DC.B    'SCORE: ',0
.HISCOTXT   DC.B    'HIGHSCORE: ',0

; ------------------------------------------------------------------------------
SCOSAVE
; SAVES THE HIGH SCORE
; INPUT    : NONE 
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------

            MOVEM.L A0-A1/D0-D2,-(A7)
            ; IF ACTUAL SCORE > HIGH SCORE
            MOVE.W  (SCORE),D0
            MOVE.W  (HIGHSCO),D1
            CMP.W   D0,D1
            BGE     .END
            
            ; OPEN FILE
            LEA     SCOPATH,A1
            MOVE.B  #51,D0
            TRAP    #15
            
            ; SAVE NEW HIGH SCORE
            MOVE.W  (SCORE),(HIGHSCO)
            LEA     HIGHSCO,A1
            MOVE.L  #2,D2
            MOVE.B  #54,D0
            TRAP    #15
            
            ; CLOSE FILE
            MOVE.B  #56,D0
            TRAP    #15
            
            
.END        MOVEM.L (A7)+,A0-A1/D0-D2
            RTS




*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
