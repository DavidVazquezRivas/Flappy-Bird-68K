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
            JSR UTLRAND
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
            ; UPDATE POSITION
            ADD.W   #PIPEVELX,(A0)

            ; CHECK AND HANDLE COLLISIONS
            BRA PIPECOLI
            
; -----------------------------------------------------------------------------
PIPECOLI
; CHECKS AND HANDLE PIPE COLLISIONS
; INPUT     : A0 POINTER TO INSTANCE VARIABLE
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------
            MOVE.L  D0,-(A7)
            MOVE.L  D1,-(A7)
         
            ; COLLISION WITH SCREEN
            MOVE.W  (A0),D0
            ADD.W   #PIPEWIDT,D0
            BPL     .NOKILL
            JSR AGLKILL
            
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
.COL        MOVE.L  #DARKRED<<16|LIGHTRED,(BIRDPCOL) ; TURN BIRD TO RED
            BRA     .END

.NOCOL      MOVE.L  #DKYELLOW<<16|LGYELLOW,(BIRDPCOL) ; TURN BIRD TO YELLOW
.END        MOVE.L  (A7)+,D1
            MOVE.L  (A7)+,D0
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
