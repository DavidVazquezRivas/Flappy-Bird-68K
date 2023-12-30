; =============================================================================
; BUTTON MANAGEMENT (AGENT)
; BUTTON LEFT POS X (W)         (A0)
; BUTTON TOP POS Y (W)          2(A0)
; BUTTON RIGHT POS X (W)        4(A0)
; BUTTON BOTTOM POS Y (W)       6(A0)
; BUTTON POINTER TO TEXT (L)    10(A0)
; BUTTON NEXT STATE (W)         14(A0)
; BUTTON STATE (BOOL HOVER)     16(A0)
; =============================================================================

; ------------------------------------------------------------------------------
BUTINIT
; INITS A BUTTON
; INPUT    : A0 POINTER TO INSTANCE VARIABLES
;            A4 POINTER TO ZERO-TERMINATED STRING
;            D1.W LEFT POS X
;            D2.W TOP POS Y
;            D3.W RIGHT POS X
;            D4.W BOT POS Y
;            D5.W STATE TO CHANGE WHEN PRESSED
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            
            MOVE.W  D1,(A0)
            MOVE.W  D2,2(A0)
            MOVE.W  D3,4(A0)
            MOVE.W  D4,6(A0)
            MOVE.L  A4,10(A0)
            MOVE.W  D5,14(A0)
            CLR.B   16(A0)
            
            RTS

; ------------------------------------------------------------------------------
BUTUPD
; UPDATES BUTTON STATUS
; INPUT    : A0 POINTER TO INSTANCE VARIABLES
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------

            MOVEM.L D0-D1,-(A7)
            
            ; CHECK IF HOVER
            MOVE.L  (MOUPOS),D1
            MOVE.W  D1,D0           ; X MOUSE POS
            AND.L   #$FFFF0000,D1
            ROL.L   #8,D1           
            ROL.L   #8,D1           ; Y MOUSE POS
            CMP.W   (A0),D0
            BLT     .NOHOVER
            CMP.W   4(A0),D0
            BGT     .NOHOVER
            CMP.W   2(A0),D1
            BLT     .NOHOVER
            CMP.W   6(A0),D1
            BGT     .NOHOVER
            ; SET STATE TO HOVER
            MOVE.B  #1,16(A0)
            
            ; CHANGE STATE IN CASE MOUSE IS PRESSED
            MOVE.B  MOUVAL,D0
            AND.B   #7,D0           ; LEFT, RIGHT OR MID MOUSE BUTTON WORKS
            BEQ     .END
            MOVE.W  14(A0),(STANEXT)
            BRA     .END
            
            
            ; SET STATE TO NOT HOVER
.NOHOVER    CLR.B   16(A0)

.END        MOVEM.L (A7)+,D0-D1
            RTS

; ------------------------------------------------------------------------------
BUTPLOT
; PLOTS THE BUTTON
; INPUT    : A0 POINTER TO INSTANCE VARIABLES
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            
            MOVEM.L A0-A1/D0-D4,-(A7)
            
            ; SET COLORS
            CLR.L   D1              ; SET PEN COLOR
            MOVE.B  #80,D0
            TRAP    #15
            MOVE.B  16(A0),D0       ; SET FILL COLOR
            BEQ     .NOHOVER
            MOVE.L  #BUTHVCLR,D1
            BRA     .HOVER
.NOHOVER    MOVE.L  #BUTCOLOR,D1
.HOVER      MOVE.B  #81,D0
            TRAP    #15
            ; SET COORDS
            MOVE.B  #87,D0
            MOVE.W  (A0),D1
            MOVE.W  2(A0),D2
            MOVE.W  4(A0),D3
            MOVE.W  6(A0),D4
            TRAP    #15
            
            ; DRAW BUTTON TEXT
            CLR.W   D0              ; COUNT TEXT LENGTH
            MOVE.L  10(A0),A1
.LOOP       TST.B   (A1)+
            BEQ     .ENDLOOP
            ADDQ.B  #1,D0
            BRA     .LOOP
.ENDLOOP    MULU    #TXTSIZE,D0     ; TEXT WIDTH IN PIXELS
            SUB.W   D1,D3           ; BUTTON WIDTH
            SUB.W   D0,D3           
            LSR.W   #1,D3           ; LEFT TEXT MARGIN
            ADD.W   D3,D1           ; X TEXT POSITION
            SUB.W   D2,D4           ; BUTTON HEIGHT
            SUB.W   #TXTSIZE,D0     
            LSR.W   #1,D4           ; TOP TEXT MARGIN
            ADD.W   D4,D2           ; Y TEXT POSITION
            MOVEA.L 10(A0),A1
            MOVE.B  #95,D0
            TRAP    #15
            
            
            MOVEM.L (A7)+,A0-A1/D0-D4
            RTS















*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
