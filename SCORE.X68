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
            CLR.W   (SCORE)
            CLR.W   (HIGHSCO)
            RTS
            
; -----------------------------------------------------------------------------
SCOINC
; INCREASES THE SCORE BY 1
; INPUT     : NONE
; OUTPUT    : SCORE = SCORE + 1
; MODIFIES  : NONE (APART FROM OUTPUT)
; -----------------------------------------------------------------------------
            ADDQ.W  #1,(SCORE)
            MOVE.B  #SNDSCO,D7
            TRAP    #SNDPLTN
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




*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~