; =============================================================================
; TITLE       :
; DESCRIPTION :
; AUTHOR      :
; HISTORY     :
; =============================================================================

            ORG     $1000
            
; --- CODE INCLUDES -----------------------------------------------------------

            INCLUDE "SYSCONST.X68"      ; SYSTEM CONSTANTS
            INCLUDE "CONST.X68"         ; GAME CONSTANTS
            INCLUDE "LIB/DMMCONST.X68"  ; DYNAMIC MEMORY CONSTANTS
            INCLUDE "LIB/UTLCONST.X68"  ; UTIL CONSTANTS 
            INCLUDE "LIB/DMMCODE.X68"   ; DYNAMIC MEMORY CODE
            INCLUDE "LIB/AGLCODE.X68"   ; AGENTS CODE "OBJECTS"
            INCLUDE "LIB/UTLCODE.X68"   ; UTIL SUBRUTINES
            INCLUDE "SYSTEM.X68"        ; SYSTEM CODE
            INCLUDE "STATES.X68"        ; STATES MANAGEMENT
            INCLUDE "INTRO.X68"         ; INTRO STATE MANAGEMENT
            INCLUDE "INSTRUCTIONS.X68"  ; INSTRUCTIONS STATE MANAGEMENT
            INCLUDE "GAME.X68"          ; GAME STATE MANAGEMENT
            INCLUDE "PAUSE.X68"         ; PAUSE STATE MANAGEMENT
            INCLUDE "GOVER.X68"         ; GAME OVER STATE MANAGEMENT
            INCLUDE "BIRD.X68"          ; PLAYER (BIRD) MANAGEMENT
            INCLUDE "PIPE.X68"          ; OBSTACLE (PIPE) MANAGEMENT
            INCLUDE "BACKGROUND.X68"    ; BACKGROUND MANAGEMENT
            INCLUDE "SCORE.X68"         ; SCORE MANAGEMENT
            INCLUDE "CLOUD.X68"         ; CLOUD MANAGEMENT
            INCLUDE "IMAGE.X68"         ; IMAGE DRAWING ROUTINES
            
; --- DATA INCLUDES -----------------------------------------------------------

            INCLUDE "DATA/CLOUDSDATA.X68"    ; CLOUD IMAGES DATA
            

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
            TRAP    #MOUUPDTN

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
            
; --- VARIABLES ---------------------------------------------------------------
    		
    		INCLUDE "SYSVARS.X68"       ; SYSTEM VARIABLES
            INCLUDE "VARS.X68"          ; GAME VARIABLES
            INCLUDE "LIB/UTLVARS.X68"   ; UTIL CODE VARIABLES
            INCLUDE "LIB/DMMVARS.X68"   ; DYNAMIC MEMORY VARIABLES

    		END    START



*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
