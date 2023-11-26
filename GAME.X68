; =============================================================================
; GAME MANAGEMENT
; =============================================================================

; -----------------------------------------------------------------------------
GAMEINIT
; INITIALIZES GAME.
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------        

            JSR     BIRDINIT
            JSR     SCOINIT
            
            LEA     PIPEINIT,A1
            LEA     PIPEUPD,A2
            LEA     PIPEPLOT,A3
            MOVE.W  #PIPEAGTP,D0
            BRA     AGLADD
            
; -----------------------------------------------------------------------------
GAMEUPD
; UPDATES GAME.
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------

            JSR     AGLUPD
            BRA     BIRDUPD

; -----------------------------------------------------------------------------
NEWPIPE
; CREATES A NEW PIPE IN CASE IT'S NECESSARY.
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------

            MOVEM.L D0/A1-A3,-(A7)
            
            MOVE.B  (SCRCYCCT),D0
            ANDI.B  #MASKNWPP,D0
            BNE     .GOUPD
            LEA     PIPEINIT,A1
            LEA     PIPEUPD,A2
            LEA     PIPEPLOT,A3
            MOVE    #PIPEAGTP,D0
            JSR     AGLADD
            
.GOUPD      MOVEM.L (A7)+,D0/A1-A3
            RTE

; -----------------------------------------------------------------------------
GAMEPLOT
; PLOTS THE GAME.
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------
            
            JSR     BACKPLOT
            JSR     SCOPLOT
            JSR     AGLPLOT
            BRA     BIRDPLOT
         





*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
