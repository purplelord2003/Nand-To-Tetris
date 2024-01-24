// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// if RAM[KBD] == 0, goto WHITE
// else goto BLACK
// BLACK
// pixels = 0
// RAM[KBD] = -1
// pixels++
// RAM[KBD + 1] = -1
// pixels++
// ...
// if pixels < 8194 continue else goto start
// WHITE loop same except set to 0 instead of -1

// Reset RAM[KBD] to 0
@KBD
M = 0

(START)
// Set pixels filled/emptied to 0
@pixels
M = 0

// Check RAM[KBD] and go to BLACK or WHITE accordingly
@KBD
D = M

@BLACK
D; JNE

@WHITE
D; JEQ


(BLACK)
// Fill up pixels
@pixels
D = M

@SCREEN
A = A + D
M = -1

// Increment pixels filled
@pixels
M = M + 1

// Check if all 8192 pixels filled
@8192
D = A

@pixels
D = M-D

@BLACK
D; JLT

// If all filled goto START
@START
0; JMP


(WHITE)
// Empty pixels
@pixels
D = M

@SCREEN
A = A + D
M = 0

// Increment pixels emptied
@pixels
M = M + 1

// Check if all 8192 pixels emptied
@8192
D = A

@pixels
D = M-D

@WHITE
D; JLT

// If all emptied goto START
@START
0; JMP
