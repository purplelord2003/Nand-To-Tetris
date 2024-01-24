// m = RAM[0]
// n = RAM[1]
// sum = 0
// i = 0

// GOTO LOOP if i < n else goto END 
// LOOP
// for (int i = 0; i < n; i++):
//     sum = sum + m

// Setting m = RAM[0]
@R0
D = M

@m
M = D

// Setting n = RAM[1]
@R1
D = M

@n
M = D

// Setting sum and i and RAM[2] = 0
@sum
M = 0

@i
M = 0

@R2
M = 0

(LOOP)
// Check whether the loop should continue
@i
D = M

@n
D = D - M

@END
D; JGE

// Doing the sum
@m
D = M

@sum
M = M + D

// Incrementing i
@i
M = M + 1

@LOOP
0; JMP

(END)
// Store sum in RAM[2]
@sum
D = M

@R2
M = D

// Infinite end loop
(END2)
@END2
0; JMP