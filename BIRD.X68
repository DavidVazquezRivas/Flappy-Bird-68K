; =============================================================================
; BIRD MANAGEMENT
; =============================================================================

; -----------------------------------------------------------------------------
BIRDINIT
; INITIALIZE BIRD.
; INPUT     : NONE 
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------

            RTS
            
; -----------------------------------------------------------------------------
BIRDUPD
; UPDATES THE BIRD.
; INPUT    : NONE 
; OUTPUT   : NONE
; MODIFIES : NONE
; -----------------------------------------------------------------------------

            MOVEM.L D0-D2,-(A7)

            ; UPDATE VELOCITY
            MOVE.B  (KBDEDGE),D2        ; CHECK IF SHOULD JUMP
            BTST    #0,D2
            BEQ     .NOJUMP
            
            MOVE.B  #SNDJUMP,D7         ; PLAY SOUND
            TRAP    #SNDPLTN
            MOVE.W  #JUMPVELY,(BIRDVELY)
            BRA     .CORDUPD
            
.NOJUMP     ADDQ.W  #1,BIRDVELY          ; ACCELERATE
            
            ; UPDATE BIRD COORDINATES
.CORDUPD    MOVE.W  (BIRDPOSY),D0
            ADD.W   (BIRDVELY),D0
            
            ; CHECK SCREEN COLLISIONS
            CMP.W   #SCRHEIGH-FLOHEIGH-BIRDRAD,D0
            BLT     .NOCOL
        
            ; COLLISION BOT
.COLBOT     MOVE.W  #STAGOVER,(STANEXT)
            
            ; STORE POSITION
.NOCOL      MOVE.W  D0,(BIRDPOSY)

.DONE       MOVEM.L (A7)+,D0-D2
            
            RTS

; -----------------------------------------------------------------------------
BIRDPLOT
; PLOT THE BIRD.
; INPUT    : NONE 
; OUTPUT   : NONE
; MODIFIES : NONE
; -----------------------------------------------------------------------------

            MOVEM.L D0-D4,-(A7)

            ; SET PEN COLOR
            MOVE.B  #80,D0
            CLR.L   D1
            MOVE.W  (BIRDPCOL),D1
            TRAP    #15
            
            ; SET FILL COLOR
            MOVE.B  #81,D0
            MOVE.W  (BIRDFCOL),D1
            TRAP    #15

            ; DEFINE COORDINATES
            MOVE.W  #(BIRDPOSX)-BIRDRAD,D1
            MOVE.W  #(BIRDPOSX)+BIRDRAD,D3
            MOVE.W  (BIRDPOSY),D2
            MOVE.W  D2,D4
            SUB.W  #BIRDRAD,D2
            ADD.W  #BIRDRAD,D4
            
            ; DRAW CIRCLE
            MOVE.B  #88,D0
            TRAP    #15
            
            MOVEM.L (A7)+,D0-D4

            RTS












*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
