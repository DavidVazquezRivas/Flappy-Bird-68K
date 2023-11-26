; =============================================================================
; SYSTEM
; =============================================================================

; -----------------------------------------------------------------------------
SYSINIT
; INITIALIZE SYSTEM
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------
            ; INSTALL TRAPS AND INTERRUPTIONS
            MOVE.L  #SCRPLOT,($80+SCRUPDTN*4)
            MOVE.L  #KBDUPD,($80+KBDUPDTN*4)
            MOVE.L  #SCRTIM,($60+SCRINTN*4)
            
            JSR     KBDINIT
            JSR     SCRINIT
            JSR     DMMINIT
            
            ; SET USER MODE AND ALLOW INTERRUPTIONS
            MOVE.W  SR,-(A7)
            ANDI.W  #$D8FF,(A7)
            RTE

; -----------------------------------------------------------------------------
SCRINIT
; INIT SCREEN. SET SCREEN RESOLUTION, SET WINDOWED MODE, CLEAR SCREEN,
; ENABLE DOUBLE BUFFER, ENABLE TIMED INTERRUPT.
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------

            MOVEM.L D0-D1,-(A7)
            
            ; SET SCREEN RESOLUTION
            MOVE.B  #33,D0
            MOVE.L  #SCRWIDTH<<16|SCRHEIGH,D1
            TRAP    #15
            
            ; SET WINDOWED MODE
            MOVE.L  #1,D1
            TRAP    #15
            
            ; CLEAR SCREEN
            MOVE.B  #11,D0
            MOVE.W  #$FF00,D1
            TRAP    #15
            
            ; ENABLE DOUBLE BUFFER
            MOVE.B  #92,D0
            MOVE.B  #17,D1
            TRAP    #15
            
            ; ENABLE TIMED INTERRUPT
            MOVE.B  #32,D0
            MOVE.B  #6,D1
            MOVE.B  #$80|SCRINTN,D2
            MOVE.L  #1000/SCRFPS,D3
            TRAP    #15
            
            ; CLEAR INTERRUPT COUNTER
            CLR.W   (SCRINTCT)
            
            MOVEM.L (A7)+,D0-D1
            RTS
            
; -----------------------------------------------------------------------------
SCRPLOT
; UPDATES DOUBLE BUFFER
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; -----------------------------------------------------------------------------
            MOVEM.W D0-D1,-(A7)
            
            ; SWITCH BUFFERS
            MOVE.B  #94,D0
            TRAP    #15
            
            ; CLEAN HIDDEN BUFFER
            MOVE.B  #11,D0
            MOVE.W  #$FF00,D1
            TRAP    #15
            MOVEM.W (A7)+,D0-D1
            RTE

; -----------------------------------------------------------------------------
SCRTIM
; TIMED INTERRUPT SERVICE ROUTINE, COUNTS TIME FALLING
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------
            ADDQ.B  #1,(SCRINTCT)
            ADDQ.B  #1,(SCRCYCCT)
            BRA     NEWPIPE    
            
; -----------------------------------------------------------------------------
KBDINIT
; INIT KEYBOARD
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------
            CLR.B   (KBDVAL)
            CLR.B   (KBDEDGE)
            RTS
            
; -----------------------------------------------------------------------------
KBDUPD
; UPDATE KEYBOARD INFO
; 0 -> SPACE
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------
            MOVEM.L D0-D1,-(A7)
            
            ; READ KEYBOARD
            MOVE.B  #19,D0
            MOVE.L  #KBDSPACE,D1
            TRAP    #15
            
            ; CONVERT TO DESIRED FORMAT
            AND.L   #$0001,D1

            ; COMPUTE KBDEDGE
            MOVE.B  (KBDVAL),D0
            NOT.B   D0
            AND.W   D1,D0
            MOVE.B  D0,(KBDEDGE)
            
            MOVEM.L (A7)+,D0-D1
            RTE

    




*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
