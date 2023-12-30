; =============================================================================
; AGENT MANAGEMENT
; EACH AGENT HAS A DATA BLOCK FROM DMM AS FOLLOWS:
; +0 - LONG : UPDATE SUBROUTINE POINTER
; +4 - LONG : PLOT SUBROUTINE POINTER
; +8:END    : DATA (AGENT SPECIFIC)
; =============================================================================

; -----------------------------------------------------------------------------
AGLADD
; CREATES A NEW AGENT
; INPUT    - A1 - POINTER TO AGENT INIT FUNCTION
;            A2 - POINTER TO AGENT UPDATE FUNCTION
;            A3 - POINTER TO AGENT PLOT FUNCTION
;            A4 - POINTER TO INITIALIZATION PARAMETER ADREES 1
;            A5 - POINTER TO INITIALIZATION PARAMETER ADREES 2
;            A6 - POINTER TO INITIALIZATION PARAMETER ADREES 3
;            D0 - AGENT TYPE (USED AS OWNER BY DMM)
;            D1 - AGENT INITIALIZATION PARAMETER DATA 1
;            D2 - AGENT INITIALIZATION PARAMETER DATA 2
;            D3 - AGENT INITIALIZATION PARAMETER DATA 3
;            D4 - AGENT INITIALIZATION PARAMETER DATA 4
;            D5 - AGENT INITIALIZATION PARAMETER DATA 5
;            D6 - AGENT INITIALIZATION PARAMETER DATA 6
;            D7 - AGENT INITIALIZATION PARAMETER DARA 7
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            MOVE.L  A0,-(A7)
            JSR     DMMALLOC
            CMP.L   #0,A0
            BEQ     .END
            MOVE.L  A2,(A0)+
            MOVE.L  A3,(A0)+
            JSR     (A1)
.END        MOVE.L  (A7)+,A0
            RTS

; -----------------------------------------------------------------------------
AGLUPD
; UPDATES THE AGENT LIST. PRIOR TO CALLING THE UPDATE FUNCTIONS, A0 IS SET
; TO THE DATA BLOCK OF THE CORRESPONDING SLOT.
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            MOVEM.L A0-A1,-(A7)
            JSR     DMMFIRST
.LOOP       CMP.L   #0,A0
            BEQ     .END
            MOVE.L  (A0),A1
            ADD.L   #8,A0
            JSR     (A1)
            JSR     DMMNEXT
            BRA     .LOOP
.END        MOVEM.L (A7)+,A0-A1
            RTS

; -----------------------------------------------------------------------------
AGLPLOT
; PLOTS THE AGENT LIST. PRIOR TO CALLING THE UPDATE FUNCTIONS, A0 IS SET
; TO THE DATA BLOCK OF THE CORRESPONDING SLOT.
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            MOVEM.L A0-A1,-(A7)
            JSR     DMMFIRST
.LOOP       CMP.L   #0,A0
            BEQ     .END
            MOVE.L  4(A0),A1
            ADD.L   #8,A0
            JSR     (A1)
            JSR     DMMNEXT
            BRA     .LOOP
.END        MOVEM.L (A7)+,A0-A1
            RTS

; -----------------------------------------------------------------------------
AGLCLEAN
; KILLS EVERY AGENT ON AGENLIST OF THE SPECIFIED TYPE
; INPUT     - D0.W - AGENT TYPE (USED AS OWNER BY DMM)
; OUTPUT    - KILLS EVERY AGENT ON AGENTLIST
; MODIFIES  - NONE
; -----------------------------------------------------------------------------
            MOVEM.L A0-A1,-(A7)
            
.LOOP       JSR     DMMFRSTO
            CMP.L   #0,A0
            BEQ     .END
            JSR     AGLKILL
            BRA     .LOOP
            
.END        MOVEM.L (A7)+,A0-A1
            RTS

            


; -----------------------------------------------------------------------------
AGLKILL     EQU     DMMFREE
; KILLS THE AGENT BY RELEASING ITS MEMORY
; INPUT    - A0 POINTER WITHIN THE AGENT MEMORY
; OUTPUT   - NONE
; MODIFIES - NONE
; NOTE     - IT IS JUST A WRAPPER FOR DMMFREE
; -----------------------------------------------------------------------------




*~Font name~Fixedsys~
*~Font size~24~
*~Tab type~0~
*~Tab size~4~
