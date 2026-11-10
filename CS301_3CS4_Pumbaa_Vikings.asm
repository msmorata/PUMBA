; SUBJECT: CS301 - Computer Organization and Assembly Language
; PROJECT: Pumba
; GROUP NAME: Vikings
; MEMBERS: Abordo, Anthony James G.| Morata, Mark Clear S.| Napiza, John Mervin
; SECTION: 3-CS4
; DATE STARTED: 11/09/2026
; DATE FINISHED: 

.MODEL SMALL
.STACK 100H

.DATA
    ; Base position variables
    ROW       DB 02H
    COL       DB 05H

    GRP_STR1  DB 'CHARACTER: PUMBAA $'
    GRP_STR2  DB 'GROUP: VIKINGS$'
    GRP_STR3  DB 'PRESS ANY KEY TO EXIT...$'

.CODE
MAIN PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Set standard 80x25 text mode
    MOV AX, 0003H
    INT 10H

    ; Clear entire 80x25 screen with GREEN (20H) jungle background
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 20H
    MOV CH, 00H
    MOV CL, 00H
    MOV DH, 18H
    MOV DL, 4FH
    INT 10H

    ; Right title box black outer border
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 02H
    MOV CL, 2EH
    MOV DH, 0EH
    MOV DL, 4EH
    INT 10H

    ; Right title box brown background
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 60H
    MOV CH, 03H
    MOV CL, 2FH
    MOV DH, 0DH
    MOV DL, 4DH
    INT 10H

    ; Letter P left stem
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 31H
    MOV DH, 08H
    MOV DL, 31H
    INT 10H

    ; Letter P top bar
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 32H
    MOV DH, 04H
    MOV DL, 33H
    INT 10H

    ; Letter P mid bar
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 06H
    MOV CL, 32H
    MOV DH, 06H
    MOV DL, 33H
    INT 10H

    ; Letter P right loop
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 34H
    MOV DH, 06H
    MOV DL, 34H
    INT 10H

    ; Letter U left stem
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 36H
    MOV DH, 07H
    MOV DL, 36H
    INT 10H

    ; Letter U right stem
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 39H
    MOV DH, 07H
    MOV DL, 39H
    INT 10H

    ; Letter U bottom curve
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 08H
    MOV CL, 37H
    MOV DH, 08H
    MOV DL, 38H
    INT 10H

    ; Group info box black border
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 10H
    MOV CL, 2EH
    MOV DH, 16H
    MOV DL, 4EH
    INT 10H

    ; Group info box black interior
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 11H
    MOV CL, 2FH
    MOV DH, 15H
    MOV DL, 4DH
    INT 10H

    ; Display Character & Progress status
    MOV AH, 02H
    MOV BH, 00H
    MOV DH, 11H
    MOV DL, 30H
    INT 10H

    MOV AH, 09H
    LEA DX, GRP_STR1
    INT 21H

    ; Display Group Name
    MOV AH, 02H
    MOV BH, 00H
    MOV DH, 12H
    MOV DL, 30H
    INT 10H

    MOV AH, 09H
    LEA DX, GRP_STR2
    INT 21H

    ; Display Exit prompt
    MOV AH, 02H
    MOV BH, 00H
    MOV DH, 14H
    MOV DL, 30H
    INT 10H

    MOV AH, 09H
    LEA DX, GRP_STR3
    INT 21H

    ; Black tail tuft top
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 00H
    ADD CH, ROW
    MOV CL, 03H
    ADD CL, COL
    MOV DH, 01H
    ADD DH, ROW
    MOV DL, 05H
    ADD DL, COL
    INT 10H

    ; Black tail tuft mid bush
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 01H
    ADD CH, ROW
    MOV CL, 02H
    ADD CL, COL
    MOV DH, 03H
    ADD DH, ROW
    MOV DL, 04H
    ADD DL, COL
    INT 10H

    ; Black tail tuft bottom tip
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 04H
    ADD CH, ROW
    MOV CL, 03H
    ADD CL, COL
    MOV DH, 04H
    ADD DH, ROW
    MOV DL, 03H
    ADD DL, COL
    INT 10H

    ; Tail upper curve brown
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 60H
    MOV CH, 01H
    ADD CH, ROW
    MOV CL, 06H
    ADD CL, COL
    MOV DH, 02H
    ADD DH, ROW
    MOV DL, 06H
    ADD DL, COL
    INT 10H

    ; Tail lower stem brown
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 60H
    MOV CH, 03H
    ADD CH, ROW
    MOV CL, 06H
    ADD CL, COL
    MOV DH, 06H
    ADD DH, ROW
    MOV DL, 07H
    ADD DL, COL
    INT 10H

    ; Top spiky hair peaks
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

    ; Main black mane bush
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

    ; Left mane locks behind ear
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

    ; Left ear upper brown edge
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 60H
    MOV CH, 01H
    ADD CH, ROW
    MOV CL, 09H
    ADD CL, COL
    MOV DH, 02H
    ADD DH, ROW
    MOV DL, 0BH
    ADD DL, COL
    INT 10H

    ; Left inner ear pink/light-red
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

    ; Right ear brown fill
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 60H
    MOV CH, 02H
    ADD CH, ROW
    MOV CL, 18H
    ADD CL, COL
    MOV DH, 03H
    ADD DH, ROW
    MOV DL, 1BH
    ADD DL, COL
    INT 10H

    ; Right inner ear pink highlight
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

    ; Upper head/brow black outline
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

    ; Upper forehead brown fill
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 60H
    MOV CH, 04H
    ADD CH, ROW
    MOV CL, 10H
    ADD CL, COL
    MOV DH, 06H
    ADD DH, ROW
    MOV DL, 17H
    ADD DL, COL
    INT 10H

    ; Left cheek/brow ridge brown
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 60H
    MOV CH, 05H
    ADD CH, ROW
    MOV CL, 0BH
    ADD CL, COL
    MOV DH, 06H
    ADD DH, ROW
    MOV DL, 0FH
    ADD DL, COL
    INT 10H

    ; Left eye yellow sclera
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 05H
    ADD CH, ROW
    MOV CL, 10H
    ADD CL, COL
    MOV DH, 05H
    ADD DH, ROW
    MOV DL, 11H
    ADD DL, COL
    INT 10H

    ; Left eye black pupil
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 05H
    ADD CH, ROW
    MOV CL, 11H
    ADD CL, COL
    MOV DH, 05H
    ADD DH, ROW
    MOV DL, 11H
    ADD DL, COL
    INT 10H

    ; Right eye yellow sclera
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 05H
    ADD CH, ROW
    MOV CL, 15H
    ADD CL, COL
    MOV DH, 05H
    ADD DH, ROW
    MOV DL, 16H
    ADD DL, COL
    INT 10H

    ; Right eye black pupil
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 05H
    ADD CH, ROW
    MOV CL, 16H
    ADD CL, COL
    MOV DH, 05H
    ADD DH, ROW
    MOV DL, 16H
    ADD DL, COL
    INT 10H

    ; Wait for a keypress before exiting
    MOV AH, 08H
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
