# 8086 Assembly Number Guessing Game (TASM)

An interactive **number guessing game written in 8086 Assembly Language** for the **Turbo Assembler (TASM)**. It uses DOS and BIOS interrupts, runs in DOSBox, and is a beginner-friendly Assembly Language project for learning low-level programming.

The program generates a pseudo-random number between **1 and 9** using the BIOS clock, and the player has three attempts to guess it.

## Features

- **Random Number Generation:** Reads the BIOS clock tick counter using `INT 1Ah`.
- **Input Validation:** Accepts only digits from 1 to 9. Invalid input does not consume an attempt.
- **Three Attempts:** The game ends after three incorrect guesses.
- **Higher or Lower Feedback:** Tells the player whether the guess is too low or too high.
- **Attempt Counter:** Displays how many attempts remain.
- **Win and Game Over Messages:** Reveals the secret number if the player runs out of attempts.

## Example Output

```text
Guess a number between 1 and 9: 5
Too low!

Try again! Attempts remaining: 2
Guess a number between 1 and 9: 8
Too high!

Try again! Attempts remaining: 1
Guess a number between 1 and 9: 7
Correct! You won!
```

## Assembly Concepts Used

| Concept | Purpose in the Program |
|---|---|
| `INT 21h` | DOS keyboard input and text output |
| `INT 1Ah` | Reading the BIOS clock tick counter |
| `DIV` | Dividing the clock value by 9 to get a remainder |
| `CMP` | Comparing the guess with the secret number |
| `JE`, `JB`, `JA` | Conditional jumps for winning, too-low guesses, and input validation |
| `LOOP` | Managing the remaining attempts |
| Data segment variables | Storing messages and the secret number |
| ASCII | Handling and displaying digit characters |

## How It Works

1. The program reads the BIOS clock tick counter using `INT 1Ah`.
2. It divides the clock value by 9 using `DIV` and gets a remainder between 0 and 8.
3. It adds `'1'` to the remainder, producing an ASCII digit between `'1'` and `'9'`, and stores it in memory.
4. The player enters a guess using the keyboard.
5. The program validates the input and compares it with the secret number.
6. The player receives feedback and has up to three attempts to guess correctly.

> **Note:** The clock-based random number generation is a simple pseudo-random technique intended for learning. It is not suitable for cryptographic applications.

## Requirements

- TASM (Turbo Assembler)
- TLINK (Turbo Linker)
- DOSBox or a real DOS environment

## Build and Run

Place `guessing_game.asm` in a folder containing TASM and TLINK.

### 1. Assemble the source file

```bash
tasm guessing_game.asm
```

### 2. Link the object file

```bash
tlink guessing_game.obj
```

### 3. Run the executable

```bash
guessing_game.exe
```

## Using DOSBox on Windows

Mount the folder containing your assembly files and run the following commands:

```dos
mount c C:\asm
c:
tasm guessing_game.asm
tlink guessing_game.obj
guessing_game.exe
```

## Why This Project?

This project is a small, complete example of **8086 Assembly Language programming**.

It combines registers, memory, arithmetic operations, interrupts, comparisons, conditional jumps, and loops in one interactive program.

It is useful for students learning computer architecture, low-level programming, and their first Assembly Language projects.

## Ideas for Future Improvements

- Add a "Play Again?" option.
- Expand the number range to 1–99 (requires multi-digit input).
- Add difficulty settings with different numbers of attempts.
