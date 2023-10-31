; =============================================================================
; TITLE       :
; DESCRIPTION :
; AUTHOR      :
; HISTORY     :
; =============================================================================

            ORG     $1000
            
            INCLUDE "CONST.X68"
            INCLUDE "SYSCONST.X68"
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
            JSR     BIRDINIT
            JSR     PIPEINIT
            
.LOOP

; --- UPDATE ------------------------------------------------------------------

            ; READ INPUT DEVICES

            TRAP    #KBDUPDTN

            ; UPDATE GAME LOGIC

            JSR     BIRDUPD
            JSR     PIPEUPD
            
; --- SYNC --------------------------------------------------------------------

.WINT       TST.B   (SCRINTCT)
            BEQ     .WINT
            CLR.B   (SCRINTCT)
            
; --- PLOT --------------------------------------------------------------------

            JSR     BACKPLOT
            JSR     BIRDPLOT
            JSR     PIPEPLOT
            
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
