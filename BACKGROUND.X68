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
            CLR.L   D1
            CLR.L   D2
            MOVE.L  #SCRWIDTH,D3
            MOVE.L  #SCRHEIGH,D4
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
            ; SET PEN COLOR 
            MOVE.L  #FLOCOLOR,D1
            MOVE.B  #80,D0
            TRAP    #15
            
            ; SET FILL COLOR
            MOVE.B  #81,D0
            TRAP    #15
            
            ; SET COORDS AND DRAW
            MOVE.B  #87,D0
            CLR.L   D1
            MOVE.L  #SCRHEIGH-FLOHEIGH,D2
            MOVE.L  #SCRWIDTH,D3
            MOVE.L  #SCRHEIGH,D4
            TRAP    #15
            
            MOVEM.L (A7)+,D0-D4
            RTS


*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
