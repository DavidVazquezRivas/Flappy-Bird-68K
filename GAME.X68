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
GAMEPLOT
; PLOTS THE GAME.
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------
            
            JSR     BACKPLOT
            JSR     AGLPLOT
            BRA     BIRDPLOT
         


*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
