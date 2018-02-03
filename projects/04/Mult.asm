// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.


// Initialize
// get inputs RAM[0]RAM[1] and output RAM[2]
    @0
    D=M
    @x
    M=D
    @1
    D=M
    @y
    M=D
    @2
    M=0
    
    @i
    M=0

(LOOP)
    @i
    D=M
    @y
    D=D-M // if y == i stop loop
    @STOP
    D;JEQ

    @x // sum += x
    D=M
    @2
    M=M+D
    @i 
    M=M+1 // i+=1

    @LOOP
    0;JMP

(STOP)
    @STOP
    0;JMP
