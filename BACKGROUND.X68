; =============================================================================
; BACKGROUND MANAGEMENT
; =============================================================================

; -----------------------------------------------------------------------------
BACKUPD
; UPDATES BACKGROUND
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------
            
            MOVEM.L D0/A1-A3,-(A7)
            
            ; CREATE NEW CLOUD
            MOVE.B  (SCRCYCCT),D0
            ANDI.B  #MASKNWCL,D0
            BNE     .NONEWCL
            LEA     CLDINIT,A1
            LEA     CLDUPD,A2
            LEA     CLDPLOT,A3
            MOVE    #CLOUDAGT,D0
            JSR     AGLADD
            
.NONEWCL    MOVEM.L (A7)+,D0/A1-A3
            RTS

; -----------------------------------------------------------------------------
BACKPLOT
; DRAWS BACKGROUND
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------

            JSR SKYPLOT
            BRA FLOPLOT
            
; -----------------------------------------------------------------------------
SKYPLOT
; DRAWS THE SKY BACKGROUND
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------
            
            MOVEM.L D0-D4,-(A7)
            ; SET PEN COLOR
            MOVE.L  #SKYCOLOR,D1
            MOVE.B  #80,D0
            TRAP    #15
            
            ; SET FILL COLOR
            MOVE.B  #81,D0
            TRAP    #15
            
            ; SET COORDS AND DRAW
            MOVE.B  #87,D0
            CLR.W   D1
            CLR.W   D2
            MOVE.W  #SCRWIDTH,D3
            MOVE.W  #SCRHEIGH,D4
            TRAP    #15
            
            MOVEM.L (A7)+,D0-D4
            RTS
            
; -----------------------------------------------------------------------------
FLOPLOT
; DRAWS THE FLOOR BACKGROUND
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------

            MOVEM.L D0-D4,-(A7)
            
            ; DRAW GRASS
            CLR.L   D1                      ; SET PEN COLOR
            MOVE.B  #80,D0
            TRAP    #15
            MOVE.L  #GRASSCLR,D1            ; SET FILL COLOR
            MOVE.B  #81,D0                  
            TRAP    #15
            MOVE.B  #87,D0                  ; SET COORDS AND DRAW
            MOVE.L  #-1,D1
            MOVE.W  #SCRHEIGH-FLOHEIGH,D2
            MOVE.W  #SCRWIDTH,D3
            MOVE.W  #SCRHEIGH-DIRTHEIG,D4
            TRAP    #15
            
            ; DRAW DIRT
            MOVE.L  #DIRTCLR,D1             ; SET PEN COLOR
            MOVE.B  #80,D0
            TRAP    #15
            MOVE.L  #DIRTCLR,D1             ; SET FILL COLOR
            MOVE.B  #81,D0                  
            TRAP    #15
            MOVE.B  #87,D0
            CLR.W   D1
            MOVE.W  D4,D2
            MOVE.W  #SCRHEIGH,D4
            TRAP    #15
            
            MOVEM.L (A7)+,D0-D4
            RTS




*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
