; SUBJECT: CS301 - Computer Organization and Assembly Language
; PROJECT: Pumba
; GROUP NAME: Vikings
; MEMBERS: Abordo, Anthony James G.| Morata, Mark Clear S.| Napiza, John Mervin U.
; SECTION: 3-CS4
; DATE STARTED: 11/09/2026
; DATE FINISHED: 11/19/2026 

.MODEL SMALL
.STACK 100H

.DATA
    ; Pumba base position
    ROW        DB 02H
    COL        DB 05H

    ; Control panel strings
    GRP_STR1   DB 'GROUP: VIKINGS$'
    GRP_STR2   DB 'Z = TAIL    T = TONGUE$'
    GRP_STR3   DB 'A/D = MOVE EYES LEFT/RIGHT$'
    GRP_STR4   DB 'W/S = EYES IN/OUT$'
    GRP_STR5   DB 'Q = QUIT$'

    ; Tail position
    TAIL_C     DB 05H

    ; Tongue state (00H = in, 01H = out)
    TONGUE_OUT DB 00H

    ; Eye pupil columns
    PUPIL_L    DB 11H
    PUPIL_R    DB 16H

.CODE
MAIN PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Set 80x25 text mode
    MOV AX, 0003H
    INT 10H

    ; Green background
    MOV BH, 20H
    MOV CH, 00H
    MOV CL, 00H
    MOV DH, 18H
    MOV DL, 4FH
    CALL FILL_ABS

    ; ===== BACKGROUND =====
    ; Ground
    MOV BH, 60H
    MOV CH, 0CH
    MOV CL, 00H
    MOV DH, 18H
    MOV DL, 4FH
    CALL FILL_ABS

    ; Shadow under Pumba
    MOV BH, 20H
    MOV CH, 14H
    MOV CL, 00H
    MOV DH, 18H
    MOV DL, 21H
    CALL FILL_ABS

    ; Shadow edge
    MOV BH, 20H
    MOV CH, 13H
    MOV CL, 00H
    MOV DH, 13H
    MOV DL, 1DH
    CALL FILL_ABS

    ; Ground dark corner
    MOV BH, 20H
    MOV CH, 16H
    MOV CL, 22H
    MOV DH, 18H
    MOV DL, 28H
    CALL FILL_ABS

    ; Log moss (left)
    MOV BH, 0A0H
    MOV CH, 07H
    MOV CL, 00H
    MOV DH, 07H
    MOV DL, 02H
    CALL FILL_ABS

    ; Log (left)
    MOV BH, 60H
    MOV CH, 08H
    MOV CL, 00H
    MOV DH, 09H
    MOV DL, 02H
    CALL FILL_ABS

    ; Log moss (right)
    MOV BH, 0A0H
    MOV CH, 08H
    MOV CL, 22H
    MOV DH, 08H
    MOV DL, 30H
    CALL FILL_ABS

    ; Log (right)
    MOV BH, 60H
    MOV CH, 09H
    MOV CL, 22H
    MOV DH, 0AH
    MOV DL, 30H
    CALL FILL_ABS

    ; Dark leaves
    MOV BH, 30H
    MOV CH, 00H
    MOV CL, 0CH
    MOV DH, 01H
    MOV DL, 16H
    CALL FILL_ABS

    MOV BH, 30H
    MOV CH, 00H
    MOV CL, 1BH
    MOV DH, 00H
    MOV DL, 29H
    CALL FILL_ABS

    MOV BH, 30H
    MOV CH, 01H
    MOV CL, 23H
    MOV DH, 03H
    MOV DL, 2CH
    CALL FILL_ABS

    MOV BH, 30H
    MOV CH, 04H
    MOV CL, 28H
    MOV DH, 06H
    MOV DL, 30H
    CALL FILL_ABS

    MOV BH, 30H
    MOV CH, 00H
    MOV CL, 3AH
    MOV DH, 00H
    MOV DL, 46H
    CALL FILL_ABS

    ; Bright leaves
    MOV BH, 0A0H
    MOV CH, 01H
    MOV CL, 00H
    MOV DH, 05H
    MOV DL, 01H
    CALL FILL_ABS

    MOV BH, 0A0H
    MOV CH, 03H
    MOV CL, 02H
    MOV DH, 04H
    MOV DL, 02H
    CALL FILL_ABS

    MOV BH, 0A0H
    MOV CH, 00H
    MOV CL, 2DH
    MOV DH, 01H
    MOV DL, 30H
    CALL FILL_ABS

    MOV BH, 0A0H
    MOV CH, 02H
    MOV CL, 2EH
    MOV DH, 03H
    MOV DL, 30H
    CALL FILL_ABS

    ; ===== TITLE BOX (PUMBA) =====
    ; Title box border
    MOV BH, 00H
    MOV CH, 02H
    MOV CL, 31H
    MOV DH, 0EH
    MOV DL, 4EH
    CALL FILL_ABS

    ; Title box background
    MOV BH, 60H
    MOV CH, 03H
    MOV CL, 32H
    MOV DH, 0DH
    MOV DL, 4DH
    CALL FILL_ABS

    ; Letter P
    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 33H
    MOV DH, 08H
    MOV DL, 33H
    CALL FILL_ABS

    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 34H
    MOV DH, 04H
    MOV DL, 35H
    CALL FILL_ABS

    MOV BH, 0E0H
    MOV CH, 06H
    MOV CL, 34H
    MOV DH, 06H
    MOV DL, 35H
    CALL FILL_ABS

    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 36H
    MOV DH, 06H
    MOV DL, 36H
    CALL FILL_ABS

    ; Letter U
    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 38H
    MOV DH, 07H
    MOV DL, 38H
    CALL FILL_ABS

    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 3BH
    MOV DH, 07H
    MOV DL, 3BH
    CALL FILL_ABS

    MOV BH, 0E0H
    MOV CH, 08H
    MOV CL, 39H
    MOV DH, 08H
    MOV DL, 3AH
    CALL FILL_ABS

    ; Letter M
    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 3DH
    MOV DH, 08H
    MOV DL, 3DH
    CALL FILL_ABS

    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 41H
    MOV DH, 08H
    MOV DL, 41H
    CALL FILL_ABS

    MOV BH, 0E0H
    MOV CH, 05H
    MOV CL, 3EH
    MOV DH, 05H
    MOV DL, 3EH
    CALL FILL_ABS

    MOV BH, 0E0H
    MOV CH, 06H
    MOV CL, 3FH
    MOV DH, 06H
    MOV DL, 3FH
    CALL FILL_ABS

    MOV BH, 0E0H
    MOV CH, 05H
    MOV CL, 40H
    MOV DH, 05H
    MOV DL, 40H
    CALL FILL_ABS

    ; Letter B
    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 43H
    MOV DH, 08H
    MOV DL, 43H
    CALL FILL_ABS

    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 44H
    MOV DH, 04H
    MOV DL, 45H
    CALL FILL_ABS

    MOV BH, 0E0H
    MOV CH, 06H
    MOV CL, 44H
    MOV DH, 06H
    MOV DL, 45H
    CALL FILL_ABS

    MOV BH, 0E0H
    MOV CH, 08H
    MOV CL, 44H
    MOV DH, 08H
    MOV DL, 45H
    CALL FILL_ABS

    MOV BH, 0E0H
    MOV CH, 05H
    MOV CL, 46H
    MOV DH, 05H
    MOV DL, 46H
    CALL FILL_ABS

    MOV BH, 0E0H
    MOV CH, 07H
    MOV CL, 46H
    MOV DH, 07H
    MOV DL, 46H
    CALL FILL_ABS

    ; Letter A
    MOV BH, 0E0H
    MOV CH, 05H
    MOV CL, 48H
    MOV DH, 08H
    MOV DL, 48H
    CALL FILL_ABS

    MOV BH, 0E0H
    MOV CH, 05H
    MOV CL, 4BH
    MOV DH, 08H
    MOV DL, 4BH
    CALL FILL_ABS

    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 49H
    MOV DH, 04H
    MOV DL, 4AH
    CALL FILL_ABS

    MOV BH, 0E0H
    MOV CH, 06H
    MOV CL, 49H
    MOV DH, 06H
    MOV DL, 4AH
    CALL FILL_ABS

    ; ===== INFO BOX =====
    ; Info box border
    MOV BH, 00H
    MOV CH, 10H
    MOV CL, 31H
    MOV DH, 16H
    MOV DL, 4EH
    CALL FILL_ABS

    ; Info box background
    MOV BH, 0FH
    MOV CH, 11H
    MOV CL, 32H
    MOV DH, 15H
    MOV DL, 4DH
    CALL FILL_ABS

    ; Display group name
    MOV AH, 02H
    MOV BH, 00H
    MOV DH, 11H
    MOV DL, 33H
    INT 10H
    MOV AH, 09H
    LEA DX, GRP_STR1
    INT 21H

    ; Display tail and tongue keys
    MOV AH, 02H
    MOV BH, 00H
    MOV DH, 12H
    MOV DL, 33H
    INT 10H
    MOV AH, 09H
    LEA DX, GRP_STR2
    INT 21H

    ; Display eye left/right keys
    MOV AH, 02H
    MOV BH, 00H
    MOV DH, 13H
    MOV DL, 33H
    INT 10H
    MOV AH, 09H
    LEA DX, GRP_STR3
    INT 21H

    ; Display eye in/out keys
    MOV AH, 02H
    MOV BH, 00H
    MOV DH, 14H
    MOV DL, 33H
    INT 10H
    MOV AH, 09H
    LEA DX, GRP_STR4
    INT 21H

    ; Display quit key
    MOV AH, 02H
    MOV BH, 00H
    MOV DH, 15H
    MOV DL, 33H
    INT 10H
    MOV AH, 09H
    LEA DX, GRP_STR5
    INT 21H

    ; ===== BODY AND LEGS =====
    ; Back leg outline
    MOV BH, 00H
    MOV CH, 11H
    MOV CL, 01H
    MOV DH, 14H
    MOV DL, 05H
    CALL FILL_REL

    ; Back leg fill
    MOV BH, 40H
    MOV CH, 11H
    MOV CL, 02H
    MOV DH, 14H
    MOV DL, 04H
    CALL FILL_REL

    ; Back leg hoof
    MOV BH, 00H
    MOV CH, 15H
    MOV CL, 01H
    MOV DH, 16H
    MOV DL, 05H
    CALL FILL_REL

    ; Front leg 1 outline
    MOV BH, 00H
    MOV CH, 11H
    MOV CL, 0BH
    MOV DH, 14H
    MOV DL, 0FH
    CALL FILL_REL

    ; Front leg 1 fill
    MOV BH, 40H
    MOV CH, 11H
    MOV CL, 0CH
    MOV DH, 14H
    MOV DL, 0EH
    CALL FILL_REL

    ; Front leg 1 hoof
    MOV BH, 00H
    MOV CH, 15H
    MOV CL, 0BH
    MOV DH, 16H
    MOV DL, 0FH
    CALL FILL_REL

    ; Front leg 2 outline
    MOV BH, 00H
    MOV CH, 11H
    MOV CL, 12H
    MOV DH, 14H
    MOV DL, 16H
    CALL FILL_REL

    ; Front leg 2 fill
    MOV BH, 40H
    MOV CH, 11H
    MOV CL, 13H
    MOV DH, 14H
    MOV DL, 15H
    CALL FILL_REL

    ; Front leg 2 hoof
    MOV BH, 00H
    MOV CH, 15H
    MOV CL, 12H
    MOV DH, 16H
    MOV DL, 16H
    CALL FILL_REL

    ; Body outline top
    MOV BH, 00H
    MOV CH, 06H
    MOV CL, 05H
    MOV DH, 11H
    MOV DL, 16H
    CALL FILL_REL

    ; Body outline upper
    MOV BH, 00H
    MOV CH, 07H
    MOV CL, 02H
    MOV DH, 11H
    MOV DL, 18H
    CALL FILL_REL

    ; Body outline middle
    MOV BH, 00H
    MOV CH, 08H
    MOV CL, 00H
    MOV DH, 10H
    MOV DL, 19H
    CALL FILL_REL

    ; Body outline widest 
    MOV BH, 00H
    MOV CH, 0BH
    MOV CL, 04H
    MOV DH, 11H
    MOV DL, 1FH
    CALL FILL_ABS

    ; Body fill top
    MOV BH, 40H
    MOV CH, 07H
    MOV CL, 06H
    MOV DH, 10H
    MOV DL, 15H
    CALL FILL_REL

    ; Body fill upper
    MOV BH, 40H
    MOV CH, 08H
    MOV CL, 03H
    MOV DH, 10H
    MOV DL, 17H
    CALL FILL_REL

    ; Body fill middle
    MOV BH, 40H
    MOV CH, 09H
    MOV CL, 01H
    MOV DH, 0FH
    MOV DL, 18H
    CALL FILL_REL

    ; Body fill widest
    MOV BH, 40H
    MOV CH, 0AH
    MOV CL, 00H
    MOV DH, 0EH
    MOV DL, 19H
    CALL FILL_REL

    ; Front leg 1
    MOV BH, 40H
    MOV CH, 11H
    MOV CL, 0CH
    MOV DH, 11H
    MOV DL, 0EH
    CALL FILL_REL

    ; Front leg 2
    MOV BH, 40H
    MOV CH, 11H
    MOV CL, 13H
    MOV DH, 11H
    MOV DL, 15H
    CALL FILL_REL

    ; Draw initial tail
    CALL DRAW_TAIL

    ; ===== HEAD =====
    ; Top hair
    MOV BH, 00H
    MOV CH, 01H
    MOV CL, 10H
    MOV DH, 01H
    MOV DL, 14H
    CALL FILL_REL

    ; Mane
    MOV BH, 00H
    MOV CH, 02H
    MOV CL, 0EH
    MOV DH, 03H
    MOV DL, 16H
    CALL FILL_REL

    ; Mane behind ear
    MOV BH, 00H
    MOV CH, 04H
    MOV CL, 0CH
    MOV DH, 05H
    MOV DL, 0FH
    CALL FILL_REL

    ; Left ear outer tip outline
    MOV BH, 00H
    MOV CH, 01H
    MOV CL, 08H
    MOV DH, 02H
    MOV DL, 0BH
    CALL FILL_REL

    ; Left ear base outline
    MOV BH, 00H
    MOV CH, 02H
    MOV CL, 09H
    MOV DH, 04H
    MOV DL, 0EH
    CALL FILL_REL

    ; Left ear edge
    MOV BH, 40H
    MOV CH, 01H
    MOV CL, 09H
    MOV DH, 02H
    MOV DL, 0BH
    CALL FILL_REL

    ; Left inner ear
    MOV BH, 0C0H
    MOV CH, 02H
    MOV CL, 0AH
    MOV DH, 03H
    MOV DL, 0DH
    CALL FILL_REL

    ; Right ear outer tip outline
    MOV BH, 00H
    MOV CH, 01H
    MOV CL, 19H
    MOV DH, 02H
    MOV DL, 1CH
    CALL FILL_REL

    ; Right ear base outline
    MOV BH, 00H
    MOV CH, 02H
    MOV CL, 17H
    MOV DH, 04H
    MOV DL, 1BH
    CALL FILL_REL

    ; Right ear fill
    MOV BH, 40H
    MOV CH, 02H
    MOV CL, 18H
    MOV DH, 03H
    MOV DL, 1BH
    CALL FILL_REL

    ; Right inner ear
    MOV BH, 0C0H
    MOV CH, 03H
    MOV CL, 18H
    MOV DH, 03H
    MOV DL, 19H
    CALL FILL_REL

    ; Forehead outline
    MOV BH, 00H
    MOV CH, 04H
    MOV CL, 0FH
    MOV DH, 06H
    MOV DL, 18H
    CALL FILL_REL

    ; Forehead fill
    MOV BH, 40H
    MOV CH, 04H
    MOV CL, 10H
    MOV DH, 06H
    MOV DL, 17H
    CALL FILL_REL

    ; Left cheek fill
    MOV BH, 40H
    MOV CH, 05H
    MOV CL, 0BH
    MOV DH, 06H
    MOV DL, 0FH
    CALL FILL_REL

    ; ===== FACE =====
    ; Jaw outline
    MOV BH, 00H
    MOV CH, 07H
    MOV CL, 0AH
    MOV DH, 09H
    MOV DL, 1AH
    CALL FILL_REL

    ; Jaw fill
    MOV BH, 40H
    MOV CH, 07H
    MOV CL, 0BH
    MOV DH, 09H
    MOV DL, 19H
    CALL FILL_REL

    ; ===== JAW LINE =====
    MOV BH, 00H
    MOV CH, 0AH
    MOV CL, 0AH
    MOV DH, 0AH
    MOV DL, 0AH
    CALL FILL_REL

    MOV BH, 00H
    MOV CH, 0BH
    MOV CL, 0AH
    MOV DH, 0BH
    MOV DL, 0BH
    CALL FILL_REL

    MOV BH, 00H
    MOV CH, 0CH
    MOV CL, 0BH
    MOV DH, 0CH
    MOV DL, 0CH
    CALL FILL_REL

    MOV BH, 00H
    MOV CH, 0DH
    MOV CL, 0CH
    MOV DH, 0DH
    MOV DL, 0DH
    CALL FILL_REL

    MOV BH, 00H
    MOV CH, 0EH
    MOV CL, 0DH
    MOV DH, 0EH
    MOV DL, 0EH
    CALL FILL_REL

    MOV BH, 00H
    MOV CH, 0FH
    MOV CL, 0EH
    MOV DH, 0FH
    MOV DL, 10H
    CALL FILL_REL

    MOV BH, 00H
    MOV CH, 10H
    MOV CL, 10H
    MOV DH, 10H
    MOV DL, 1AH
    CALL FILL_REL

    ; ===== LOWER JAW =====
    MOV BH, 40H
    MOV CH, 0BH
    MOV CL, 13H
    MOV DH, 0BH
    MOV DL, 1CH
    CALL FILL_REL

    MOV BH, 40H
    MOV CH, 0CH
    MOV CL, 13H
    MOV DH, 0DH
    MOV DL, 1EH
    CALL FILL_REL

    MOV BH, 40H
    MOV CH, 0EH
    MOV CL, 13H
    MOV DH, 0EH
    MOV DL, 1CH
    CALL FILL_REL

    MOV BH, 40H
    MOV CH, 0FH
    MOV CL, 11H
    MOV DH, 0FH
    MOV DL, 1AH
    CALL FILL_REL

    ; Lower jaw outline
    MOV BH, 00H
    MOV CH, 0BH
    MOV CL, 1DH
    MOV DH, 0BH
    MOV DL, 1EH
    CALL FILL_REL

    MOV BH, 00H
    MOV CH, 0CH
    MOV CL, 1FH
    MOV DH, 0DH
    MOV DL, 1FH
    CALL FILL_REL

    MOV BH, 00H
    MOV CH, 0EH
    MOV CL, 1DH
    MOV DH, 0EH
    MOV DL, 1EH
    CALL FILL_REL

    MOV BH, 00H
    MOV CH, 0FH
    MOV CL, 1BH
    MOV DH, 0FH
    MOV DL, 1DH
    CALL FILL_REL

    ; Cheek fill and outline
    MOV BH, 40H
    MOV CH, 05H
    MOV CL, 18H
    MOV DH, 05H
    MOV DL, 1AH
    CALL FILL_REL

    MOV BH, 00H
    MOV CH, 05H
    MOV CL, 1BH
    MOV DH, 05H
    MOV DL, 1BH
    CALL FILL_REL

    ; Snout outline and fill
    MOV BH, 00H
    MOV CH, 06H
    MOV CL, 17H
    MOV DH, 0AH
    MOV DL, 23H
    CALL FILL_REL

    MOV BH, 0C0H
    MOV CH, 07H
    MOV CL, 18H
    MOV DH, 09H
    MOV DL, 22H
    CALL FILL_REL

    ; Nose and nostrils
    MOV BH, 0C0H
    MOV CH, 07H
    MOV CL, 1EH
    MOV DH, 09H
    MOV DL, 22H
    CALL FILL_REL

    MOV BH, 00H
    MOV CH, 08H
    MOV CL, 1FH
    MOV DH, 08H
    MOV DL, 1FH
    CALL FILL_REL

    MOV BH, 00H
    MOV CH, 08H
    MOV CL, 21H
    MOV DH, 08H
    MOV DL, 21H
    CALL FILL_REL

    ; Smile corner
    MOV BH, 00H
    MOV CH, 08H
    MOV CL, 11H
    MOV DH, 09H
    MOV DL, 11H
    CALL FILL_REL

    ; Draw initial mouth
    CALL DRAW_MOUTH

    ; Near tusk
    MOV BH, 0F0H
    MOV CH, 06H
    MOV CL, 14H
    MOV DH, 08H
    MOV DL, 14H
    CALL FILL_REL

    MOV BH, 0F0H
    MOV CH, 09H
    MOV CL, 15H
    MOV DH, 09H
    MOV DL, 16H
    CALL FILL_REL

    ; Far tusk
    MOV BH, 0F0H
    MOV CH, 04H
    MOV CL, 26H
    MOV DH, 04H
    MOV DL, 26H
    CALL FILL_REL

    MOV BH, 0F0H
    MOV CH, 05H
    MOV CL, 25H
    MOV DH, 05H
    MOV DL, 25H
    CALL FILL_REL

    MOV BH, 0F0H
    MOV CH, 06H
    MOV CL, 24H
    MOV DH, 09H
    MOV DL, 24H
    CALL FILL_REL

    ; Draw initial eyes
    CALL DRAW_EYES

    ; ===== KEYBOARD INPUT LOOP =====
KEY_LOOP:
    MOV AH, 08H
    INT 21H

    CMP AL, 'a'
    JE DO_LEFT
    CMP AL, 'A'
    JE DO_LEFT
    CMP AL, 'd'
    JE DO_RIGHT
    CMP AL, 'D'
    JE DO_RIGHT
    CMP AL, 'w'
    JE DO_IN
    CMP AL, 'W'
    JE DO_IN
    CMP AL, 's'
    JE DO_OUT
    CMP AL, 'S'
    JE DO_OUT
    CMP AL, 'z'
    JE DO_TAIL
    CMP AL, 'Z'
    JE DO_TAIL
    CMP AL, 't'
    JE DO_TONGUE
    CMP AL, 'T'
    JE DO_TONGUE
    CMP AL, 'q'
    JE EXIT_PROG
    CMP AL, 'Q'
    JE EXIT_PROG
    JMP KEY_LOOP

DO_LEFT:
    CALL LOOK_LEFT
    JMP KEY_LOOP

DO_RIGHT:
    CALL LOOK_RIGHT
    JMP KEY_LOOP

DO_IN:
    CALL EYES_IN
    JMP KEY_LOOP

DO_OUT:
    CALL EYES_OUT
    JMP KEY_LOOP

DO_TAIL:
    CALL MOVE_TAIL
    JMP KEY_LOOP

DO_TONGUE:
    CALL MOVE_TONGUE
    JMP KEY_LOOP

EXIT_PROG:
    MOV AH, 4CH
    INT 21H
MAIN ENDP

; ===== PROCEDURES =====

; Fill box at absolute screen coordinates
FILL_ABS PROC
    MOV AH, 06H
    MOV AL, 00H
    INT 10H
    RET
FILL_ABS ENDP

; Fill box relative to Pumba base position
FILL_REL PROC
    MOV AL, ROW
    ADD CH, AL
    ADD DH, AL
    MOV AL, COL
    ADD CL, AL
    ADD DL, AL
    MOV AH, 06H
    MOV AL, 00H
    INT 10H
    RET
FILL_REL ENDP

; Move both pupils left
LOOK_LEFT PROC
    MOV AL, PUPIL_L
    CMP AL, 10H
    JE LEFT_EYE_R
    DEC AL
    MOV PUPIL_L, AL
LEFT_EYE_R:
    MOV AL, PUPIL_R
    CMP AL, 15H
    JE LEFT_DONE
    DEC AL
    MOV PUPIL_R, AL
LEFT_DONE:
    CALL DRAW_EYES
    RET
LOOK_LEFT ENDP

; Move both pupils right
LOOK_RIGHT PROC
    MOV AL, PUPIL_L
    CMP AL, 12H
    JE RIGHT_EYE_R
    INC AL
    MOV PUPIL_L, AL
RIGHT_EYE_R:
    MOV AL, PUPIL_R
    CMP AL, 17H
    JE RIGHT_DONE
    INC AL
    MOV PUPIL_R, AL
RIGHT_DONE:
    CALL DRAW_EYES
    RET
LOOK_RIGHT ENDP

; Cross eyes inward
EYES_IN PROC
    MOV AL, 12H
    MOV PUPIL_L, AL
    MOV AL, 15H
    MOV PUPIL_R, AL
    CALL DRAW_EYES
    RET
EYES_IN ENDP

; Move eyes outward
EYES_OUT PROC
    MOV AL, 10H
    MOV PUPIL_L, AL
    MOV AL, 17H
    MOV PUPIL_R, AL
    CALL DRAW_EYES
    RET
EYES_OUT ENDP

; Toggle tail left/right
MOVE_TAIL PROC
    MOV AL, TAIL_C
    CMP AL, 03H
    JE TAIL_RIGHT
    MOV AL, 03H
    MOV TAIL_C, AL
    JMP TAIL_DONE
TAIL_RIGHT:
    MOV AL, 06H
    MOV TAIL_C, AL
TAIL_DONE:
    CALL DRAW_TAIL
    RET
MOVE_TAIL ENDP

; Toggle tongue in/out
MOVE_TONGUE PROC
    MOV AL, TONGUE_OUT
    CMP AL, 00H
    JE TONGUE_SHOW
    MOV AL, 00H
    MOV TONGUE_OUT, AL
    JMP TONGUE_DONE
TONGUE_SHOW:
    MOV AL, 01H
    MOV TONGUE_OUT, AL
TONGUE_DONE:
    CALL DRAW_MOUTH
    RET
MOVE_TONGUE ENDP

; Draw eyes and pupils
DRAW_EYES PROC
    ; Left eye white/yellow
    MOV BH, 0E0H
    MOV CH, 05H
    MOV CL, 10H
    MOV DH, 05H
    MOV DL, 12H
    CALL FILL_REL

    ; Right eye white/yellow
    MOV BH, 0E0H
    MOV CH, 05H
    MOV CL, 15H
    MOV DH, 05H
    MOV DL, 17H
    CALL FILL_REL

    ; Left pupil
    MOV BH, 00H
    MOV CH, 05H
    MOV CL, PUPIL_L
    MOV DH, 05H
    MOV DL, CL
    CALL FILL_REL

    ; Right pupil
    MOV BH, 00H
    MOV CH, 05H
    MOV CL, PUPIL_R
    MOV DH, 05H
    MOV DL, CL
    CALL FILL_REL
    RET
DRAW_EYES ENDP

; Draw tail at current TAIL_C
DRAW_TAIL PROC
    ; Erase old tail
    MOV BH, 20H
    MOV CH, 02H
    MOV CL, 03H
    MOV DH, 07H
    MOV DL, 0AH
    CALL FILL_ABS

    ; Tail stem
    MOV BH, 40H
    MOV CH, 05H
    MOV CL, 09H
    MOV DH, 08H
    MOV DL, 0AH
    CALL FILL_ABS

    ; Tail bend
    MOV BH, 40H
    MOV CH, 05H
    MOV CL, TAIL_C
    MOV AL, 04H
    ADD CL, AL
    MOV DH, 05H
    MOV DL, 0AH
    CALL FILL_ABS

    ; Tail curve
    MOV BH, 40H
    MOV CH, 03H
    MOV CL, TAIL_C
    MOV AL, 04H
    ADD CL, AL
    MOV DH, 04H
    MOV DL, CL
    CALL FILL_ABS

    ; Tail tuft top
    MOV BH, 00H
    MOV CH, 02H
    MOV CL, TAIL_C
    MOV AL, 01H
    ADD CL, AL
    MOV DH, 03H
    MOV DL, TAIL_C
    MOV AL, 03H
    ADD DL, AL
    CALL FILL_ABS

    ; Tail tuft middle
    MOV BH, 00H
    MOV CH, 03H
    MOV CL, TAIL_C
    MOV DH, 05H
    MOV DL, TAIL_C
    MOV AL, 02H
    ADD DL, AL
    CALL FILL_ABS

    ; Tail tuft bottom
    MOV BH, 00H
    MOV CH, 06H
    MOV CL, TAIL_C
    MOV AL, 01H
    ADD CL, AL
    MOV DH, 06H
    MOV DL, CL
    CALL FILL_ABS
    RET
DRAW_TAIL ENDP

; Draw mouth and tongue
DRAW_MOUTH PROC
    ; Restore jaw under and beside the mouth
    MOV BH, 40H
    MOV CH, 0DH
    MOV CL, 13H
    MOV DH, 0FH
    MOV DL, 1AH
    CALL FILL_REL

    MOV BH, 40H
    MOV CH, 0EH
    MOV CL, 1BH
    MOV DH, 0EH
    MOV DL, 1BH
    CALL FILL_REL

    ; Mouth interior (black cavity)
    MOV BH, 00H
    MOV CH, 0AH
    MOV CL, 12H
    MOV DH, 0AH
    MOV DL, 1CH
    CALL FILL_REL

    MOV BH, 00H
    MOV CH, 0BH
    MOV CL, 13H
    MOV DH, 0CH
    MOV DL, 1CH
    CALL FILL_REL

    MOV BH, 00H
    MOV CH, 0DH
    MOV CL, 14H
    MOV DH, 0DH
    MOV DL, 1BH
    CALL FILL_REL

    MOV BH, 00H
    MOV CH, 0EH
    MOV CL, 15H
    MOV DH, 0EH
    MOV DL, 1AH
    CALL FILL_REL

    ; Check if tongue is in or out
    MOV AL, TONGUE_OUT
    CMP AL, 00H
    JE TONGUE_IN

    ; ===== TONGUE OUT (ANGLED DOWN-RIGHT) =====
    ; Base of tongue emerging from dark mouth (row 0BH stays black above)
    MOV BH, 0C0H
    MOV CH, 0CH
    MOV CL, 15H
    MOV DH, 0CH
    MOV DL, 19H
    CALL FILL_REL

    ; Mid tongue angling right (black mouth stays visible on left & right)
    MOV BH, 0C0H
    MOV CH, 0DH
    MOV CL, 16H
    MOV DH, 0DH
    MOV DL, 1AH
    CALL FILL_REL

    ; Tongue hanging over lower lip
    MOV BH, 0C0H
    MOV CH, 0EH
    MOV CL, 17H
    MOV DH, 0EH
    MOV DL, 1AH
    CALL FILL_REL

    ; Black outline on right edge of hanging tongue
    MOV BH, 00H
    MOV CH, 0EH
    MOV CL, 1BH
    MOV DH, 0EH
    MOV DL, 1BH
    CALL FILL_REL

    ; Black outline around tongue tip on chin
    MOV BH, 00H
    MOV CH, 0FH
    MOV CL, 16H
    MOV DH, 0FH
    MOV DL, 1AH
    CALL FILL_REL

    ; Rounded tongue tip
    MOV BH, 0C0H
    MOV CH, 0FH
    MOV CL, 17H
    MOV DH, 0FH
    MOV DL, 19H
    CALL FILL_REL

    JMP MOUTH_DONE

    ; ===== TONGUE IN (RESTING) =====
TONGUE_IN:
    ; Tongue in the corner
    MOV BH, 0C0H
    MOV CH, 0BH
    MOV CL, 14H
    MOV DH, 0BH
    MOV DL, 15H
    CALL FILL_REL

    MOV BH, 0C0H
    MOV CH, 0CH
    MOV CL, 14H
    MOV DH, 0CH
    MOV DL, 16H
    CALL FILL_REL

    MOV BH, 0C0H
    MOV CH, 0DH
    MOV CL, 15H
    MOV DH, 0DH
    MOV DL, 16H
    CALL FILL_REL

    ; Lower tooth
    MOV BH, 0F0H
    MOV CH, 0DH
    MOV CL, 17H
    MOV DH, 0DH
    MOV DL, 18H
    CALL FILL_REL

MOUTH_DONE:
    RET
DRAW_MOUTH ENDP

END MAIN