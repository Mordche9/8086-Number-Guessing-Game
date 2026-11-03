8086 Assembly Number Guessing Game

A simple interactive Number Guessing Game written in 8086 Assembly Language using DOS and BIOS interrupts.

The program generates a secret number between 1 and 9, and challenges the player to guess it within three attempts.

Features

Random Number Generation: Uses the BIOS clock (INT 1Ah) to generate a secret number.

Input Validation: Accepts only digits between 1 and 9.

Attempt Counter: Gives the player three attempts.

Higher or Lower Feedback: Tells the player whether their guess is too high or too low.

Remaining Attempts: Displays how many attempts are left.

Game Over Message: Reveals the secret number if the player fails.

Win Detection: Announces when the player guesses correctly.

Technologies and Concepts

Technology / Concept

Usage

8086 Assembly

Main programming language

DOS Interrupts (INT 21h)

Displaying messages and reading input

BIOS Interrupts (INT 1Ah)

Reading the system clock

DIV

Generating a number within a range using the remainder

CMP

Comparing the player's guess

Conditional Jumps

Handling higher, lower, and correct guesses

LOOP

Managing the three attempts

Memory Variables

Storing the secret number and messages

ASCII

Handling keyboard input and displaying digits

How It Works

The program reads the BIOS clock tick counter.

It divides the clock value by 9.

The remainder is converted into an ASCII digit between 1 and 9.

The secret number is stored in memory.

The player receives three attempts to guess the number.

The program compares each guess with the secret number.

The game ends when the player wins or runs out of attempts.

Note: The clock-based method provides simple pseudo-randomness. It is intended for this game, not security applications.

Requirements

8086-compatible assembler (such as TASM).

DOS environment or DOSBox.

An environment supporting DOS and BIOS interrupts.

Running the Program

Assemble and link the source file using TASM:

tasm guessing_game.asm
tlink guessing_game.obj

Run the generated executable in DOS or DOSBox:

guessing_game.exe

Project Purpose

This project was developed as a practical exercise in learning 8086 Assembly Language.

It demonstrates how low-level programming concepts such as registers, memory, interrupts, arithmetic operations, comparisons, conditional jumps, and loops work together to create an interactive program.

Project Type

Educational Assembly Language Project
