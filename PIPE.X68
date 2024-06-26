; =============================================================================
; PIPE MANAGEMENT (AGENT)
; PIPEPOSX (W) (A0)
; PIPETOPH (B) 2(A0)
; =============================================================================

; -----------------------------------------------------------------------------
PIPEINIT
; INITIALIZE PIPE.
; INPUT     : A0 POINTER TO INSTANCE VARIABLES
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------

            MOVE.L  D0,-(A7)
            
            MOVE.W  #SCRWIDTH,(A0)
            JSR UTLRAND         ; RANDOM NUMBER BETWEEN 0-255
            ADD.L   #(SCRHEIGH-PIPEGAPS-FLOHEIGH)/2,D0
            MOVE.B  D0,2(A0)
            
            MOVE.L  (A7)+,D0
            RTS
            
; -----------------------------------------------------------------------------
PIPEUPD
; UPDATES PIPE.
; INPUT     : A0 POINTER TO INSTANCE VARIABLES
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------
            MOVEM.L D0-D2,-(A7)
            
            MOVE.W  (STACUR),D0
            CMP.W   #STAGAME,D0
            BNE     .END

            ; UPDATE POSITION
            ADD.W   #PIPEVELX,(A0)

; CHECK AND HANDLE COLLISIONS
            
            ; COLLISION WITH SCREEN
            MOVE.W  (A0),D0
            ADD.W   #PIPEWIDT,D0
            BPL     .NOKILL
            JSR AGLKILL
            BRA     .END
            
            ; COLLISION WITH BIRD
.NOKILL     CMP.W   #BIRDPOSX+BIRDRAD+PIPEWIDT,D0
            BPL     .NOCOL
            CMP.W   #BIRDPOSX-BIRDRAD,D0
            BMI     .NOCOL

            
            ; BIRD IS IN PIPE X RANGE
            CLR.L   D0
            MOVE.B  2(A0),D0
            MOVE.W  (BIRDPOSY),D1
            SUB.W   #BIRDRAD,D1
            CMP.W   D1,D0
            BPL     .COL
            ADD.W   #PIPEGAPS,D0
            ADD.W   #2*BIRDRAD,D1
            CMP.W   D1,D0
            BMI     .COL

            BRA     .NOCOL

            ; STOP ALL SOUNDS
.COL        MOVE.B  #76,D0
            MOVE.L  #3,D2
            TRAP    #15
            
            MOVE.B  #SNDDIE,D7  ; PLAY DIE SOUND
            TRAP    #SNDPLTN
            
            MOVE.W  #STAGOVER,(STANEXT)
            
            BRA     .END

            ; SCORE INCREASE
.NOCOL      CMP.W   #BIRDPOSX-PIPEWIDT-BIRDRAD,(A0)
            BNE     .END
            JSR     SCOINC
            
.END        MOVEM.L  (A7)+,D0-D2
            RTS

; -----------------------------------------------------------------------------
PIPEPLOT
; PLOT THE PIPE.
; INPUT     : A0 POINTER TO INSTANCE VARIABLES
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
            MOVE.W  (A0),D1
            CLR.W   D2
            MOVE.W  D1,D3
            ADD.W   #PIPEWIDT,D3
            CLR.W   D4
            MOVE.B  2(A0),D4
            MOVE.B  #87,D0
            TRAP    #15
            ; PLOT TOP PIPE OPENING
            MOVE.W  D4,D2
            SUB.W   #PPOPHEIG,D2
            SUB.W   #PPOPOVER,D1
            ADD.W   #PPOPOVER,D3
            TRAP    #15
            
            
            ; PLOT BOTTOM HALF
            ADD.W   #PPOPOVER,D1
            SUB.W   #PPOPOVER,D3
            MOVE.W  D4,D2
            ADD.W   #PIPEGAPS,D2
            MOVE.W  #SCRHEIGH-FLOHEIGH,D4
            TRAP    #15
            ;PLOT BOTTOM PIPE OPNENING
            SUB.W   #PPOPOVER,D1
            ADD.W   #PPOPOVER,D3
            MOVE.W  D2,D4
            ADD.W   #PPOPHEIG,D4
            TRAP    #15
            
            MOVEM.L (A7)+,D0-D4
            RTS














*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
