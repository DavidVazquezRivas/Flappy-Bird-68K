; ==============================================================================
; TITLE       :
; DESCRIPTION :
; AUTHOR      :
; HISTORY     :
; ==============================================================================

            ORG     $1000
            
            INCLUDE "CONST.X68"
            INCLUDE "SYSCONST.X68"
            INCLUDE "SYSTEM.X68"
            INCLUDE "BIRD.X68"
            INCLUDE "BACKGROUND.X68"
            

START

; --- INITIALIZATION ----------------------------------------------------------

            JSR     SYSINIT
            JSR     BIRDINIT
            
.LOOP

; --- UPDATE ------------------------------------------------------------------

; READ INPUT DEVICES

            TRAP    #KBDUPDTN

; UPDATE GAME LOGIC

            JSR     BIRDUPD
            
; --- SYNC --------------------------------------------------------------------

.WINT       TST.B   (SCRINTCT)
            BEQ     .WINT
            CLR.B   (SCRINTCT)
            
; --- PLOT --------------------------------------------------------------------

            JSR     BACKPLOT
            JSR     BIRDPLOT
            
            TRAP    #SCRUPDTN
            
            BRA     .LOOP
            
            SIMHALT
    		
            INCLUDE "VARS.X68"
            INCLUDE "SYSVARS.X68"

    		END    START




*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
