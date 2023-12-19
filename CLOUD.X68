; =============================================================================
; CLOUD MANAGEMENT (AGENT)
; CLOUDPOSX  (W) (A0)
; CLOUDPOSY  (W) 2(A0)
; CLOUDSPEED (W) 4(A0)
; CLOUDTYPE  (W) 6(A0)
; =============================================================================

; -----------------------------------------------------------------------------
CLDINIT
; INITIALIZE CLOUD.
; INPUT     : A0 POINTER TO INSTANCE VARIABLES
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------

            MOVE.L  D0,-(A7)

            ; INIT POSITION
            MOVE.W  #SCRWIDTH,(A0)
            JSR UTLRAND             ; RANDOM NUMBER BETWEEN 0-255
            MOVE.W  D0,2(A0)
            ; INIT CLOUD TYPE
            AND.B   #7,D0
            MOVE.W  D0,6(A0)
            ; INIT SPEED
            OR.L    #CLDSPMSK,D1
            MOVE.W  D1,4(A0)
            
            MOVE.L (A7)+,D0
            RTS

; -----------------------------------------------------------------------------
CLDUPD
; UPDATES CLOUD.
; INPUT     : A0 POINTER TO INSTANCE VARIABLES
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------
            
            MOVEM.L D0/A1,-(A7)
            
            ; UPDATE POSITION
            MOVE.W  4(A0),D0
            ADD.W   (A0),D0
            MOVE.W  D0,(A0)
            
; CHECK AND HANDLE COLISION
            ; SELECT CLOUD WIDTH
            MOVE.W  6(A0),D0
            ROL.W   #2,D0           ; TIMES 4 TIMES SINCE WE ACCESS LONG
            LEA     CLDTBL,A1
            MOVE.L  (A1,D0.W),A1
            MOVE.W  (A1),D0
            
            ADD.W   (A0),D0
            BGT     .NOKILL
            JSR AGLKILL             ; KILL AGENT
            
.NOKILL     MOVEM.L (A7)+,D0/A1       
            RTS

; -----------------------------------------------------------------------------
CLDPLOT
; PLOTS CLOUD.
; INPUT     : A0 POINTER TO INSTANCE VARIABLES
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------
            
            MOVEM.L D0/D2-D3/D7/A1,-(A7)
            
            ; SELECT THE CLOUD TYPE
            MOVE.W  6(A0),D0
            ROL.W   #2,D0           ; TIMES 4 TIMES SINCE WE ACCESS LONG
            LEA     CLDTBL,A1
            MOVE.L  (A1,D0.W),A1
            
            ; PLOT IMAGE
            MOVE.W  (A1)+,D7        ; ASSUME CLOUDX IS RIGHT NEXT TO CLOUDXW
            MOVE.W  2(A0),D2
            MOVE.W  (A0),D3
            JSR     IMGPLOT
            
            MOVEM.L (A7)+,D0/D2-D3/D7/A1
            RTS
              
CLDTBL      DC.L    CLOUD0W
            DC.L    CLOUD1W
            DC.L    CLOUD2W
            DC.L    CLOUD3W
            DC.L    CLOUD4W
            DC.L    CLOUD5W
            DC.L    CLOUD6W
            DC.L    CLOUD7W



*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
