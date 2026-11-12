; SUBJECT: CS301 - Computer Organization and Assembly Language
; PROJECT: Pumba
; GROUP NAME: Vikings
; MEMBERS: Abordo, Anthony James G.| Morata, Mark Clear S.| Napiza, John Mervin U.
; SECTION: 3-CS4
; DATE STARTED: 11/09/2026
; DATE FINISHED: 

.MODEL SMALL
.STACK 100H

.DATA
    ; Pumba position
    ROW       DB 02H
    COL       DB 05H

    GRP_STR1  DB 'GROUP: VIKINGS$'
    GRP_STR2  DB 'Q = QUIT$'
    GRP_STR3  DB 'A/D = MOVE EYES LEFT/RIGHT$'

    ; Tail position
    TAIL_C    DB 05H
    LAST_TICK DW 0000H
    TICKS_LEFT DB 00H

    ; Eye positions
    PUPIL_L   DB 11H
    PUPIL_R   DB 16H

.CODE
MAIN PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Text mode 80x25
    MOV AX, 0003H
    INT 10H

    ; Green background
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 20H
    MOV CH, 00H
    MOV CL, 00H
    MOV DH, 18H
    MOV DL, 4FH
    INT 10H

    ; Title box border
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 02H
    MOV CL, 31H
    MOV DH, 0EH
    MOV DL, 4EH
    INT 10H

    ; Title box background
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 60H
    MOV CH, 03H
    MOV CL, 32H
    MOV DH, 0DH
    MOV DL, 4DH
    INT 10H

    ; Letter P left stem
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 33H
    MOV DH, 08H
    MOV DL, 33H
    INT 10H

    ; Letter P top bar
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 34H
    MOV DH, 04H
    MOV DL, 35H
    INT 10H

    ; Letter P mid bar
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 06H
    MOV CL, 34H
    MOV DH, 06H
    MOV DL, 35H
    INT 10H

    ; Letter P right loop
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 36H
    MOV DH, 06H
    MOV DL, 36H
    INT 10H

    ; Letter U left stem
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 38H
    MOV DH, 07H
    MOV DL, 38H
    INT 10H

    ; Letter U right stem
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 3BH
    MOV DH, 07H
    MOV DL, 3BH
    INT 10H

    ; Letter U bottom curve
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 08H
    MOV CL, 39H
    MOV DH, 08H
    MOV DL, 3AH
    INT 10H

    ; Letter M left stem
    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 3DH
    MOV DH, 08H
    MOV DL, 3DH
    CALL FILL_ABS

    ; Letter M right stem
    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 41H
    MOV DH, 08H
    MOV DL, 41H
    CALL FILL_ABS

    ; Letter M left slant
    MOV BH, 0E0H
    MOV CH, 05H
    MOV CL, 3EH
    MOV DH, 05H
    MOV DL, 3EH
    CALL FILL_ABS

    ; Letter M middle point
    MOV BH, 0E0H
    MOV CH, 06H
    MOV CL, 3FH
    MOV DH, 06H
    MOV DL, 3FH
    CALL FILL_ABS

    ; Letter M right slant
    MOV BH, 0E0H
    MOV CH, 05H
    MOV CL, 40H
    MOV DH, 05H
    MOV DL, 40H
    CALL FILL_ABS

    ; Letter B stem
    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 43H
    MOV DH, 08H
    MOV DL, 43H
    CALL FILL_ABS

    ; Letter B top bar
    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 44H
    MOV DH, 04H
    MOV DL, 45H
    CALL FILL_ABS

    ; Letter B middle bar
    MOV BH, 0E0H
    MOV CH, 06H
    MOV CL, 44H
    MOV DH, 06H
    MOV DL, 45H
    CALL FILL_ABS

    ; Letter B bottom bar
    MOV BH, 0E0H
    MOV CH, 08H
    MOV CL, 44H
    MOV DH, 08H
    MOV DL, 45H
    CALL FILL_ABS

    ; Letter B upper curve
    MOV BH, 0E0H
    MOV CH, 05H
    MOV CL, 46H
    MOV DH, 05H
    MOV DL, 46H
    CALL FILL_ABS

    ; Letter B lower curve
    MOV BH, 0E0H
    MOV CH, 07H
    MOV CL, 46H
    MOV DH, 07H
    MOV DL, 46H
    CALL FILL_ABS

    ; Letter A left stem
    MOV BH, 0E0H
    MOV CH, 05H
    MOV CL, 48H
    MOV DH, 08H
    MOV DL, 48H
    CALL FILL_ABS

    ; Letter A right stem
    MOV BH, 0E0H
    MOV CH, 05H
    MOV CL, 4BH
    MOV DH, 08H
    MOV DL, 4BH
    CALL FILL_ABS

    ; Letter A top bar
    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 49H
    MOV DH, 04H
    MOV DL, 4AH
    CALL FILL_ABS

    ; Letter A middle bar
    MOV BH, 0E0H
    MOV CH, 06H
    MOV CL, 49H
    MOV DH, 06H
    MOV DL, 4AH
    CALL FILL_ABS

    ; Info box border
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 10H
    MOV CL, 31H
    MOV DH, 16H
    MOV DL, 4EH
    INT 10H

    ; Info box background
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0FH
    MOV CH, 11H
    MOV CL, 32H
    MOV DH, 15H
    MOV DL, 4DH
    INT 10H

    ; Display Group Name
    MOV AH, 02H
    MOV BH, 00H
    MOV DH, 11H
    MOV DL, 33H
    INT 10H

    MOV AH, 09H
    LEA DX, GRP_STR1
    INT 21H

    ; Display tail and quit keys
    MOV AH, 02H
    MOV BH, 00H
    MOV DH, 13H
    MOV DL, 33H
    INT 10H

    MOV AH, 09H
    LEA DX, GRP_STR2
    INT 21H

    ; Display eye keys
    MOV AH, 02H
    MOV BH, 00H
    MOV DH, 14H
    MOV DL, 33H
    INT 10H

    MOV AH, 09H
    LEA DX, GRP_STR3
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
    MOV CH, 09H
    MOV CL, -1H
    MOV DH, 0FH
    MOV DL, 1AH
    CALL FILL_REL

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

    ; Front leg 1 joins the belly
    MOV BH, 40H
    MOV CH, 11H
    MOV CL, 0CH
    MOV DH, 11H
    MOV DL, 0EH
    CALL FILL_REL

    ; Front leg 2 joins the belly
    MOV BH, 40H
    MOV CH, 11H
    MOV CL, 13H
    MOV DH, 11H
    MOV DL, 15H
    CALL FILL_REL

    ; Draw tail
    CALL DRAW_TAIL

    ; ===== HEAD =====
    ; Top hair
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 01H
    ADD CH, ROW
    MOV CL, 10H
    ADD CL, COL
    MOV DH, 01H
    ADD DH, ROW
    MOV DL, 14H
    ADD DL, COL
    INT 10H

    ; Mane
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 02H
    ADD CH, ROW
    MOV CL, 0EH
    ADD CL, COL
    MOV DH, 03H
    ADD DH, ROW
    MOV DL, 16H
    ADD DL, COL
    INT 10H

    ; Mane behind ear
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 04H
    ADD CH, ROW
    MOV CL, 0CH
    ADD CL, COL
    MOV DH, 05H
    ADD DH, ROW
    MOV DL, 0FH
    ADD DL, COL
    INT 10H

    ; Left ear outer tip outline
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 01H
    ADD CH, ROW
    MOV CL, 08H
    ADD CL, COL
    MOV DH, 02H
    ADD DH, ROW
    MOV DL, 0BH
    ADD DL, COL
    INT 10H

    ; Left ear base outline
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 02H
    ADD CH, ROW
    MOV CL, 09H
    ADD CL, COL
    MOV DH, 04H
    ADD DH, ROW
    MOV DL, 0EH
    ADD DL, COL
    INT 10H

    ; Left ear edge
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 40H
    MOV CH, 01H
    ADD CH, ROW
    MOV CL, 09H
    ADD CL, COL
    MOV DH, 02H
    ADD DH, ROW
    MOV DL, 0BH
    ADD DL, COL
    INT 10H

    ; Left inner ear
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0C0H
    MOV CH, 02H
    ADD CH, ROW
    MOV CL, 0AH
    ADD CL, COL
    MOV DH, 03H
    ADD DH, ROW
    MOV DL, 0DH
    ADD DL, COL
    INT 10H

    ; Right ear outer tip outline
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 01H
    ADD CH, ROW
    MOV CL, 19H
    ADD CL, COL
    MOV DH, 02H
    ADD DH, ROW
    MOV DL, 1CH
    ADD DL, COL
    INT 10H

    ; Right ear base outline
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 02H
    ADD CH, ROW
    MOV CL, 17H
    ADD CL, COL
    MOV DH, 04H
    ADD DH, ROW
    MOV DL, 1BH
    ADD DL, COL
    INT 10H

    ; Right ear fill
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 40H
    MOV CH, 02H
    ADD CH, ROW
    MOV CL, 18H
    ADD CL, COL
    MOV DH, 03H
    ADD DH, ROW
    MOV DL, 1BH
    ADD DL, COL
    INT 10H

    ; Right inner ear
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0C0H
    MOV CH, 03H
    ADD CH, ROW
    MOV CL, 18H
    ADD CL, COL
    MOV DH, 03H
    ADD DH, ROW
    MOV DL, 19H
    ADD DL, COL
    INT 10H

    ; Forehead outline
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 04H
    ADD CH, ROW
    MOV CL, 0FH
    ADD CL, COL
    MOV DH, 06H
    ADD DH, ROW
    MOV DL, 18H
    ADD DL, COL
    INT 10H

    ; Forehead fill
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 40H
    MOV CH, 04H
    ADD CH, ROW
    MOV CL, 10H
    ADD CL, COL
    MOV DH, 06H
    ADD DH, ROW
    MOV DL, 17H
    ADD DL, COL
    INT 10H

    ; Left cheek fill
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 40H
    MOV CH, 05H
    ADD CH, ROW
    MOV CL, 0BH
    ADD CL, COL
    MOV DH, 06H
    ADD DH, ROW
    MOV DL, 0FH
    ADD DL, COL
    INT 10H

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
    ; Jaw line
    MOV BH, 00H
    MOV CH, 0AH
    MOV CL, 0AH
    MOV DH, 0AH
    MOV DL, 0AH
    CALL FILL_REL

    ; Jaw line
    MOV BH, 00H
    MOV CH, 0BH
    MOV CL, 0AH
    MOV DH, 0BH
    MOV DL, 0BH
    CALL FILL_REL

    ; Jaw line
    MOV BH, 00H
    MOV CH, 0CH
    MOV CL, 0BH
    MOV DH, 0CH
    MOV DL, 0CH
    CALL FILL_REL

    ; Jaw line
    MOV BH, 00H
    MOV CH, 0DH
    MOV CL, 0CH
    MOV DH, 0DH
    MOV DL, 0DH
    CALL FILL_REL

    ; Jaw line
    MOV BH, 00H
    MOV CH, 0EH
    MOV CL, 0DH
    MOV DH, 0EH
    MOV DL, 0EH
    CALL FILL_REL

    ; Jaw line
    MOV BH, 00H
    MOV CH, 0FH
    MOV CL, 0EH
    MOV DH, 0FH
    MOV DL, 10H
    CALL FILL_REL

    ; Jaw line
    MOV BH, 00H
    MOV CH, 10H
    MOV CL, 10H
    MOV DH, 10H
    MOV DL, 1AH
    CALL FILL_REL

    ; ===== LOWER JAW =====
    ; Lower jaw fill
    MOV BH, 40H
    MOV CH, 0BH
    MOV CL, 13H
    MOV DH, 0BH
    MOV DL, 1CH
    CALL FILL_REL

    ; Lower jaw fill
    MOV BH, 40H
    MOV CH, 0CH
    MOV CL, 13H
    MOV DH, 0DH
    MOV DL, 1EH
    CALL FILL_REL

    ; Lower jaw fill
    MOV BH, 40H
    MOV CH, 0EH
    MOV CL, 13H
    MOV DH, 0EH
    MOV DL, 1CH
    CALL FILL_REL

    ; Lower jaw fill
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

    ; Lower jaw outline
    MOV BH, 00H
    MOV CH, 0CH
    MOV CL, 1FH
    MOV DH, 0DH
    MOV DL, 1FH
    CALL FILL_REL

    ; Lower jaw outline
    MOV BH, 00H
    MOV CH, 0EH
    MOV CL, 1DH
    MOV DH, 0EH
    MOV DL, 1EH
    CALL FILL_REL

    ; Lower jaw outline
    MOV BH, 00H
    MOV CH, 0FH
    MOV CL, 1BH
    MOV DH, 0FH
    MOV DL, 1DH
    CALL FILL_REL

    ; Cheek fill
    MOV BH, 40H
    MOV CH, 05H
    MOV CL, 18H
    MOV DH, 05H
    MOV DL, 1AH
    CALL FILL_REL

    ; Cheek outline
    MOV BH, 00H
    MOV CH, 05H
    MOV CL, 1BH
    MOV DH, 05H
    MOV DL, 1BH
    CALL FILL_REL

    ; Snout outline
    MOV BH, 00H
    MOV CH, 06H
    MOV CL, 17H
    MOV DH, 0AH
    MOV DL, 23H
    CALL FILL_REL

    ; Snout fill
    MOV BH, 0C0H
    MOV CH, 07H
    MOV CL, 18H
    MOV DH, 09H
    MOV DL, 22H
    CALL FILL_REL

    ; Nose
    MOV BH, 0C0H
    MOV CH, 07H
    MOV CL, 1EH
    MOV DH, 09H
    MOV DL, 22H
    CALL FILL_REL

    ; Left nostril
    MOV BH, 00H
    MOV CH, 08H
    MOV CL, 1FH
    MOV DH, 08H
    MOV DL, 1FH
    CALL FILL_REL

    ; Right nostril
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

    ; Smile top row
    MOV BH, 00H
    MOV CH, 0AH
    MOV CL, 12H
    MOV DH, 0AH
    MOV DL, 1CH
    CALL FILL_REL

    ; Smile second row
    MOV BH, 00H
    MOV CH, 0BH
    MOV CL, 13H
    MOV DH, 0BH
    MOV DL, 1BH
    CALL FILL_REL

    ; Smile third row
    MOV BH, 00H
    MOV CH, 0CH
    MOV CL, 15H
    MOV DH, 0CH
    MOV DL, 1AH
    CALL FILL_REL

    ; Smile bottom
    MOV BH, 00H
    MOV CH, 0DH
    MOV CL, 17H
    MOV DH, 0DH
    MOV DL, 18H
    CALL FILL_REL

    ; Tongue top
    MOV BH, 0C0H
    MOV CH, 0BH
    MOV CL, 16H
    MOV DH, 0BH
    MOV DL, 19H
    CALL FILL_REL

    ; Tongue bottom
    MOV BH, 0C0H
    MOV CH, 0CH
    MOV CL, 17H
    MOV DH, 0CH
    MOV DL, 18H
    CALL FILL_REL

    ; Tooth
    MOV BH, 0F0H
    MOV CH, 0AH
    MOV CL, 19H
    MOV DH, 0AH
    MOV DL, 1AH
    CALL FILL_REL

    ; Near tusk upper
    MOV BH, 0F0H
    MOV CH, 06H
    MOV CL, 14H
    MOV DH, 08H
    MOV DL, 14H
    CALL FILL_REL

    ; Near tusk curve
    MOV BH, 0F0H
    MOV CH, 09H
    MOV CL, 15H
    MOV DH, 09H
    MOV DL, 16H
    CALL FILL_REL

    ; Far tusk tip
    MOV BH, 0F0H
    MOV CH, 04H
    MOV CL, 26H
    MOV DH, 04H
    MOV DL, 26H
    CALL FILL_REL

    ; Far tusk curve
    MOV BH, 0F0H
    MOV CH, 05H
    MOV CL, 25H
    MOV DH, 05H
    MOV DL, 25H
    CALL FILL_REL

    ; Far tusk base
    MOV BH, 0F0H
    MOV CH, 06H
    MOV CL, 24H
    MOV DH, 09H
    MOV DL, 24H
    CALL FILL_REL

    ; Draw eyes
    CALL DRAW_EYES

    ; ===== KEY LOOP =====
KEY_LOOP:
    MOV AH, 08H
    INT 21H

    CMP AL, 'a'
    JE LOOK_LEFT
    CMP AL, 'A'
    JE LOOK_LEFT
    CMP AL, 'd'
    JE LOOK_RIGHT
    CMP AL, 'D'
    JE LOOK_RIGHT
    CMP AL, 'q'
    JE EXIT_PROG
    CMP AL, 'Q'
    JE EXIT_PROG
    JMP KEY_LOOP

    ; Look left
LOOK_LEFT:
    CMP PUPIL_L, 10H
    JE KEY_LOOP
    DEC PUPIL_L
    DEC PUPIL_R
    CALL DRAW_EYES
    JMP KEY_LOOP

    ; Look right
LOOK_RIGHT:
    CMP PUPIL_L, 12H
    JE KEY_LOOP
    INC PUPIL_L
    INC PUPIL_R
    CALL DRAW_EYES
    JMP KEY_LOOP

    ; Exit program
EXIT_PROG:
    MOV AH, 4CH
    INT 21H

    

MAIN ENDP

; Fill box at screen position
FILL_ABS PROC
    MOV AH, 06H
    MOV AL, 00H
    INT 10H
    RET
FILL_ABS ENDP

; Fill box at Pumba position
FILL_REL PROC
    ADD CH, ROW
    ADD CL, COL
    ADD DH, ROW
    ADD DL, COL
    MOV AH, 06H
    MOV AL, 00H
    INT 10H
    RET
FILL_REL ENDP

; Draw eyes
DRAW_EYES PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

    ; Left eye
    MOV BH, 0E0H
    MOV CH, 05H
    MOV CL, 10H
    MOV DH, 05H
    MOV DL, 12H
    CALL FILL_REL

    ; Right eye
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
    MOV DL, PUPIL_L
    CALL FILL_REL

    ; Right pupil
    MOV BH, 00H
    MOV CH, 05H
    MOV CL, PUPIL_R
    MOV DH, 05H
    MOV DL, PUPIL_R
    CALL FILL_REL

    POP DX
    POP CX
    POP BX
    POP AX
    RET
DRAW_EYES ENDP

; Draw tail
DRAW_TAIL PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

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
    ADD CL, 04H
    MOV DH, 05H
    MOV DL, 0AH
    CALL FILL_ABS

    ; Tail curve
    MOV BH, 40H
    MOV CH, 03H
    MOV CL, TAIL_C
    ADD CL, 04H
    MOV DH, 04H
    MOV DL, TAIL_C
    ADD DL, 04H
    CALL FILL_ABS

    ; Tail tuft top
    MOV BH, 00H
    MOV CH, 02H
    MOV CL, TAIL_C
    ADD CL, 01H
    MOV DH, 03H
    MOV DL, TAIL_C
    ADD DL, 03H
    CALL FILL_ABS

    ; Tail tuft middle
    MOV BH, 00H
    MOV CH, 03H
    MOV CL, TAIL_C
    MOV DH, 05H
    MOV DL, TAIL_C
    ADD DL, 02H
    CALL FILL_ABS

    ; Tail tuft bottom
    MOV BH, 00H
    MOV CH, 06H
    MOV CL, TAIL_C
    ADD CL, 01H
    MOV DH, 06H
    MOV DL, TAIL_C
    ADD DL, 01H
    CALL FILL_ABS

    POP DX
    POP CX
    POP BX
    POP AX
    RET
DRAW_TAIL ENDP

; Delay
DELAY PROC
    PUSH AX
    PUSH CX
    PUSH DX

    ; Read starting clock tick
    MOV TICKS_LEFT, 02H
    MOV AH, 00H
    INT 1AH
    MOV LAST_TICK, DX

    ; Wait for 2 clock ticks
WAIT_TICK:
    MOV AH, 00H
    INT 1AH
    CMP DX, LAST_TICK
    JE WAIT_TICK
    MOV LAST_TICK, DX
    DEC TICKS_LEFT
    CMP TICKS_LEFT, 00H
    JNE WAIT_TICK

    POP DX
    POP CX
    POP AX
    RET
DELAY ENDP
END MAIN