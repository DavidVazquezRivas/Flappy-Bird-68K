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
            MOVE.L  #SNDPLAY,($80+SNDPLTN*4)
            MOVE.L  #SCRTIM,($60+SCRINTN*4)
            
            JSR     KBDINIT
            JSR     SNDINIT
            JSR     SCRINIT
            JSR     DMMINIT
            
            ; SET USER MODE AND ALLOW INTERRUPTIONS
            MOVE.W  SR,-(A7)
            ANDI.W  #$D8FF,(A7)
            RTE
            
; -----------------------------------------------------------------------------
SNDINIT
; INITIALIZES SOUND SYSTEM
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------
            MOVEM.L D0-D1/A0-A1,-(A7)
            
            CLR.B   D1
            LEA     .SNDLIST,A0
.LOOP       MOVE.L  (A0)+,D0
            BEQ     .DONE
            MOVE.L  D0,A1
            MOVE.B  #71,D0
            TRAP    #15
            ADDQ.B  #1,D1
            BRA     .LOOP
            
.DONE       MOVEM.L (A7)+,D0-D1/A0-A1
            RTS
            
.SNDDIE     DC.B    'SND/DIE.wav',0
.SNDJUMP    DC.B    'SND/JUMP.wav',0
.SNDSCO     DC.B    'SND/SCO.wav',0
            DS.W    0                       ; WORD ALIGN
.SNDLIST    DC.L    .SNDDIE,.SNDJUMP,.SNDSCO,0
            
; ------------------------------------------------------------------------------
SNDPLAY
; PLAY SOUND
; INPUT    : D7 SOUND ID
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            MOVEM.W D0-D1,-(A7)
            
            MOVE.B  #72,D0
            MOVE.B  D7,D1
            TRAP    #15
            
            MOVEM.W (A7)+,D0-D1
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
            RTE
            
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
            MOVEM.L D0-D3,-(A7)
            
            ; READ KEYBOARD
            MOVE.B  #19,D0
            MOVE.L  #KBDP<<8|KBDSPACE,D1
            TRAP    #15
            
            ; CONVERT TO DESIRED FORMAT
            JSR     .PACK

            ; COMPUTE KBDEDGE
            MOVE.B  (KBDVAL),D0
            NOT.B   D0
            AND.W   D2,D0
            MOVE.B  D0,(KBDEDGE)
            
            ; STORE KBDVAL
            MOVE.B  D2,(KBDVAL)
            
            MOVEM.L (A7)+,D0-D3
            RTE

.PACK       MOVE.W  #3,D3
.LOOP       LSL.L   #8,D1
            ROXL.B  #1,D2
            DBRA.W  D3,.LOOP
            RTS

    









*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
