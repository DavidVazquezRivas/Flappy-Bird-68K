; =============================================================================
; IMAGE LIBRARY. IT CONTAINS ROUTINES TO DRAW IMAGES. EVERY IMAGE DATA SHOULD 
; HAVE N LONG PAIRS, THE FIRST OF THE PAIR MEANS THE COLOR OF A BLOCK IN 
; FORMAT $00BBGGRR AND THE SECOND IS THE AMMOUNT OF BLOCKS IN A ROW WITH 
; THE SAME COLOR.
; EVERY IMAGE DATA IS ENDING WITH THE FLAG $FFFFFFFF
; =============================================================================

; -----------------------------------------------------------------------------
IMGPLOT
; PLOTS AN IMAGE IN THE GIVEN COORDINATES
; INPUT:    A1 POINTER TO IMAGE DATA
;           D2.W Y START
;           D3.W X START
;           D7.W IMAGE WIDTH
; NOTE : WON'T USE IMAGE HEIGHT TO MANAGE IMAGE END, AS WE ASSUME IMAGE DATA
;        IS ENDING WITH THE FLAG $FFFFFFFF
; -----------------------------------------------------------------------------

            MOVEM.L A1/D0-D7,-(A7)
            
            MOVE.W  D3,(.STARTX)  ; STORE STARTING X
            MOVE.W  D3,D5   
            ADD.W   D7,D5       ; X ENDING COORD
            
            
            ; SET PEN AND FILL COLOR
            MOVE.L  (A1)+,D1
.LOOP1      MOVE.B  #80,D0
            TRAP    #15
            ADDQ.B  #1,D0
            TRAP    #15
            
            ; DRAW BLOCK
            MOVE.L  (A1)+,D6
            SUBQ.L  #1,D6            
.LOOP2      MOVE.W  D3,D1       ; BLOCK START X
            ADDQ.W  #BLOCKSZ,D3 ; BLOCK END X
            MOVE.W  D2,D4       
            ADDQ.W  #BLOCKSZ,D4 ; BLOCK END Y
            MOVE.B  #87,D0
            TRAP    #15
            
            CMP.W   D3,D5
            BGE     .SAMEROW
            ; MOVE TO NEXT ROW
            MOVE.W  (.STARTX),D3
            ADDQ.W  #BLOCKSZ,D2
.SAMEROW    DBRA    D6,.LOOP2
            
            MOVE.L  (A1)+,D1
            CMP.W   #.ENDFLAG,D1
            BNE     .LOOP1
            
            
            MOVEM.L (A7)+,A1/D0-D7
            RTS
       
.ENDFLAG    EQU     $FFFFFFFF

.STARTX     DS.W    1







*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
