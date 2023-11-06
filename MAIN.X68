; =============================================================================
; TITLE       :
; DESCRIPTION :
; AUTHOR      :
; HISTORY     :
; =============================================================================

            ORG     $1000
            
            INCLUDE "SYSCONST.X68"
            INCLUDE "CONST.X68"
            INCLUDE "LIB/DMMCONST.X68"
            INCLUDE "LIB/DMMCODE.X68"
            INCLUDE "SYSTEM.X68"
            INCLUDE "LIB/AGLCODE.X68"
            INCLUDE "LIB/UTLCODE.X68"
            INCLUDE "BIRD.X68"
            INCLUDE "PIPE.X68"
            INCLUDE "BACKGROUND.X68"
            

START

; --- INITIALIZATION ----------------------------------------------------------

            JSR     SYSINIT
            JSR     UTLINIT
            JSR     BIRDINIT
            
            LEA     PIPEINIT,A1
            LEA     PIPEUPD,A2
            LEA     PIPEPLOT,A3
            MOVE.W  #PIPEAGTP,D0
            JSR     AGLADD
            
.LOOP

; --- UPDATE ------------------------------------------------------------------

            ; READ INPUT DEVICES

            TRAP    #KBDUPDTN

            ; UPDATE GAME LOGIC
            
            JSR     AGLUPD
            JSR     BIRDUPD
            
; --- SYNC --------------------------------------------------------------------

.WINT       TST.B   (SCRINTCT)
            BEQ     .WINT
            CLR.B   (SCRINTCT)
            
; --- PLOT --------------------------------------------------------------------

            JSR     BACKPLOT
            JSR     AGLPLOT
            JSR     BIRDPLOT
            
            TRAP    #SCRUPDTN
            
            BRA     .LOOP
            
            SIMHALT
    		
            INCLUDE "VARS.X68"
            INCLUDE "LIB/UTLVARS.X68"
            INCLUDE "SYSVARS.X68"
            INCLUDE "LIB/DMMVARS.X68"

    		END    START








*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
