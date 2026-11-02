IDEAL
MODEL small
STACK 100h

DATASEG
    Welcome db 'Guess a number between 1 and 9: $'
    LowMsg db 13,10,'Too low! Try again.',13,10,'$'
    HighMsg db 13,10,'Too high! Try again.',13,10,'$'
    Correct db 13,10,'Correct! You won!',13,10,'$'
    GameOver db 13,10,'Game over! The secret number was 5.',13,10,'$'

CODESEG
start:
    mov ax, @data
    mov ds, ax

    ; Three attempts
    mov cx, 3

guess:
    ; Ask for a guess
    mov ah, 09h
    mov dx, offset Welcome
    int 21h

    ; Read one character
    mov ah, 01h
    int 21h

    ; Compare guess with secret number
    cmp al, '5'
    je win
    jb tooLow
    ja tooHigh

tooLow:
    mov ah, 09h
    mov dx, offset LowMsg
    int 21h
    jmp nextAttempt

tooHigh:
    mov ah, 09h
    mov dx, offset HighMsg
    int 21h

nextAttempt:
    loop guess

    ; All three attempts used
    mov ah, 09h
    mov dx, offset GameOver
    int 21h
    jmp exit

win:
    mov ah, 09h
    mov dx, offset Correct
    int 21h

exit:
    mov ax, 4C00h
    int 21h

END start
