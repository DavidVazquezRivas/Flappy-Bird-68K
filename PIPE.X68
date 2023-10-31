; =============================================================================
; PIPE MANAGEMENT (AGENT)
; PIPEPOSX (W) +0
; PIPETOPH (B) +2
; =============================================================================

; -----------------------------------------------------------------------------
PIPEINIT
; INITIALIZE PIPE.
; INPUT     : NONE 
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------

            MOVE.L  D0,-(A7)
            
            MOVE.W  #SCRWIDTH,(PIPEPOSX)
            JSR UTLRAND
            ADD.L   #(SCRHEIGH-PIPEGAPS-FLOHEIGH)/2,D0
            MOVE.B  D0,(PIPETOPH)
            
            MOVE.L  (A7)+,D0
            RTS
            
; -----------------------------------------------------------------------------
PIPEUPD
; UPDATES PIPE.
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------

            ADD.W   #PIPEVELX,(PIPEPOSX)
         
            ; TODO HANDLE COLLISIONS
            RTS

; -----------------------------------------------------------------------------
PIPEPLOT
; PLOT THE PIPE.
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------
    
            MOVEM.L D0-D4,-(A7)
            
            ; SET PEN AND FILL COLORS
            MOVE.B  #80,D0
            MOVE.L  #PIPEPCOL,D1
            TRAP    #15
            MOVE.B  #81,D0
            MOVE.L  #PIPEFCOL,D1
            TRAP    #15
            
            ; PLOT TOP HALF
            MOVE.W  (PIPEPOSX),D1
            CLR.W   D2
            MOVE.W  D1,D3
            ADD.W   #PIPEWIDT,D3
            CLR.W   D4
            MOVE.B  (PIPETOPH),D4
            MOVE.B  #87,D0
            TRAP    #15
            
            ; PLOT BOTTOM HALF
            MOVE.W  D4,D2
            ADD.W   #PIPEGAPS,D2
            MOVE.W  #SCRHEIGH-FLOHEIGH,D4
            TRAP    #15
            
            MOVEM.L (A7)+,D0-D4
            RTS


*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
