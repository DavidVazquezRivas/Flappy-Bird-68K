; =============================================================================
; DYNAMIC MEMORY MANAGEMENT VARIABLES (SYSTEM VARIABLES)
; =============================================================================

            ORG     (*+DMMBSIZE-1)&-DMMBSIZE ; ALIGN TO DMMBSIZE
DMMDATA     DS.B    DMMBSIZE*DMMBNUM        ; DYNAMIC MEMORY ALLOCATION SPACE
            DS.W    0                       ; JUST IN CASE (SIZE IS POW OF TWO)