; =============================================================================
; TITLE       :
; DESCRIPTION :
; AUTHOR      :
; HISTORY     :
; =============================================================================

            ORG     $1000
            
            ; CONSTANTS INCLUDES
            INCLUDE "SYSCONST.X68"
            INCLUDE "CONST.X68"
            ; LIB INCLUDES
            INCLUDE "LIB/DMMCONST.X68"
            INCLUDE "LIB/UTLCONST.X68"
            INCLUDE "LIB/DMMCODE.X68"
            INCLUDE "LIB/AGLCODE.X68"
            INCLUDE "LIB/UTLCODE.X68"
            ; SYSTEM INCLUDES
            INCLUDE "SYSTEM.X68"
            ; STATES INCLUDES
            INCLUDE "STATES.X68"
            INCLUDE "INTRO.X68"
            INCLUDE "INSTRUCTIONS.X68"
            INCLUDE "GAME.X68"
            INCLUDE "PAUSE.X68"
            INCLUDE "GOVER.X68"
            ; FEATURE INCLUDES
            INCLUDE "BIRD.X68"
            INCLUDE "PIPE.X68"
            INCLUDE "BACKGROUND.X68"
            INCLUDE "SCORE.X68"
            

START

; --- INITIALIZATION ----------------------------------------------------------

            ORI.W   #$0700,SR
            JSR     SYSINIT
            JSR     UTLINIT
            JSR     STAINIT
            
.LOOP

; --- UPDATE ------------------------------------------------------------------

            ; READ INPUT DEVICES

            TRAP    #KBDUPDTN

            JSR     STAUPD
            
; --- SYNC --------------------------------------------------------------------

.WINT       TST.B   (SCRINTCT)
            BEQ     .WINT
            CLR.B   (SCRINTCT)
            
; --- PLOT --------------------------------------------------------------------

            JSR     BACKPLOT
            JSR     STAPLOT
            
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
