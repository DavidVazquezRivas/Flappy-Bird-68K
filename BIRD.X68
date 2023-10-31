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

            MOVE.W  #SCRHEIGH/2,(BIRDPOSY)
            CLR.W   (BIRDVELY)
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
            
            MOVE.W  #JUMPVELY,(BIRDVELY)
            BRA     .CORDUPD
            
.NOJUMP     MOVE.B  (SCRCYCCT),D0       ; CHECK IF SHOULD ACCELERATE DOWN
            AND.B   #$01,D0
            BNE     .CORDUPD            

            ADDQ.W  #1,BIRDVELY          ; ACCELERATE
            
            ; UPDATE BIRD COORDINATES
.CORDUPD    MOVE.W  (BIRDPOSY),D0
            ADD.W   (BIRDVELY),D0
            
            ; CHECK SCREEN COLLISIONS
            CMP.W   #SCRHEIGH-FLOHEIGH-BIRDRAD,D0
            BGT     .COLBOT
            CMP.W   #BIRDRAD,D0
            BLT     .COLTOP
            BRA     .NOCOL
            
; TODO MANAGE COLLISIONS
        
            ; COLLISION BOT
.COLBOT     MOVE.W  #SCRHEIGH-FLOHEIGH-BIRDRAD,(BIRDPOSY)
            BRA     .DONE

            ; COLLISION TOP
.COLTOP     ;BRA     .DONE
            
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
            MOVE.L  #BIRDPCOL,D1
            TRAP    #15
            
            ; SET FILL COLOR
            MOVE.B  #81,D0
            MOVE.L  #BIRDFCOL,D1
            TRAP    #15

            ; DEFINE COORDINATES
            MOVE.W  #(SCRWIDTH/4)-BIRDRAD,D1
            MOVE.W  #(SCRWIDTH/4)+BIRDRAD,D3
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
