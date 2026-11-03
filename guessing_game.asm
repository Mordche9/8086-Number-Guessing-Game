IDEAL
MODEL small
STACK 100h

DATASEG
    Welcome     db 'Guess a number between 1 and 9: $'
    LowMsg      db 13,10,'Too low!',13,10,'$'
    HighMsg     db 13,10,'Too high!',13,10,'$'
    CorrectMsg  db 13,10,'Correct! You won!',13,10,'$'
    InvalidMsg  db 13,10,'Invalid input! Enter a digit from 1 to 9.',13,10,'$'
    TryAgainMsg db 13,10,'Try again! Attempts remaining: $'
    GameOverMsg db 13,10,'Game over! The secret number was: $'
    NewLine     db 13,10,'$'

    secret      db ?

CODESEG
start:
    mov ax, @data
    mov ds, ax

    ; Generate secret number between 1 and 9
    mov ah, 00h
    int 1Ah

    mov ax, dx
    xor dx, dx
    mov bx, 9
    div bx

    add dl, '1'
    mov [secret], dl

    ; Give the player three attempts
    mov cx, 3

guess:
    ; Display welcome message
    mov ah, 09h
    mov dx, offset Welcome
    int 21h

    ; Read one character
    mov ah, 01h
    int 21h

    ; Validate input: only 1 to 9
    cmp al, '1'
    jb invalidInput

    cmp al, '9'
    ja invalidInput

    ; Compare guess with secret
    cmp al, [secret]
    je win
    jb tooLow

tooHigh:
    mov ah, 09h
    mov dx, offset HighMsg
    int 21h
    jmp nextAttempt

tooLow:
    mov ah, 09h
    mov dx, offset LowMsg
    int 21h

nextAttempt:
    loop continueGame
    jmp outOfAttempts

continueGame:
    ; Display remaining attempts
    mov ah, 09h
    mov dx, offset TryAgainMsg
    int 21h

    mov dl, cl
    add dl, '0'

    mov ah, 02h
    int 21h

    mov ah, 09h
    mov dx, offset NewLine
    int 21h

    jmp guess

invalidInput:
    mov ah, 09h
    mov dx, offset InvalidMsg
    int 21h
    jmp guess

outOfAttempts:
    mov ah, 09h
    mov dx, offset GameOverMsg
    int 21h

    ; Display secret number
    mov ah, 02h
    mov dl, [secret]
    int 21h

    mov ah, 09h
    mov dx, offset NewLine
    int 21h

    jmp done

win:
    mov ah, 09h
    mov dx, offset CorrectMsg
    int 21h

done:
    mov ax, 4C00h
    int 21h

END start
