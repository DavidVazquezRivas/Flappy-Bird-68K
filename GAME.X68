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

            MOVE.W  D0,-(A7)
   
            MOVE.B  (GAMCYCCT),(SCRCYCCT)
            ; CLEAN BUTTONS
            MOVE.W  #BUTAGTP,D0
            JSR AGLCLEAN
            
            MOVE.W  (A7)+,D0
            RTS
            
; -----------------------------------------------------------------------------
GAMEUPD
; UPDATES GAME.
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------

            MOVE.B  D0,-(A7)
            
            JSR     BACKUPD
            MOVE.B  (KBDEDGE),D0
            BTST    #1,D0
            BEQ     .NOPAUSE
            MOVE.W  #STAPAUSE, (STANEXT)
            MOVE.B  (SCRCYCCT),(GAMCYCCT)
            
.NOPAUSE    JSR     NEWPIPE
            JSR     AGLUPD
            JSR     BIRDUPD
            
            MOVE.B  (A7)+,D0
            RTS

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
            RTS

; -----------------------------------------------------------------------------
GAMEPLOT
; PLOTS THE GAME.
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------
            
            JSR     SCOPLOT
            JSR     AGLPLOT
            BRA     BIRDPLOT
         














*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
