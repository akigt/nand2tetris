// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(LOOP)
    @SCREEN  // get keyboard addres
    D=A
    @addr 
    M=D 


    @8192 // screen's last row 
    D=A
    @n
    M=D

    @i 
    M=0

    @KBD // input 
    D=M
    @WHITE // if keyboard input == 0 goto white screen
    D;JEQ

(BLACK)
    //if i == n then loop again
    @i 
    D=M 
    @n 
    D=D-M
    @LOOP
    D;JEQ

    // paint black color
    @addr
    A=M   //change address to screen 
    M=-1  // change RAM[addr] = 1111111111111111 black
    
    @i 
    M=M+1
    @addr
    M=M+1
    @BLACK
    0;JMP 

(WHITE)
    //if i == n then loop again
    @i 
    D=M 
    @n 
    D=D-M
    @LOOP
    D;JEQ

    // paint white color
    @addr
    A=M   //change address to screen 
    M=0  // change RAM[addr] = 000000000000 white
    
    @i 
    M=M+1
    @addr
    M=M+1
    @WHITE
    0;JMP 



    @LOOP
    0;JMP



//    @SCREEN
//    D=A 
//    @addr
//    M=D 
//
//    @0
//    D=M 
//    @n 
//    M=D 
//
//    @i 
//    M=0
//
//(LOOP)
//    @i 
//    D=M 
//    @n 
//    D=D-M 
//    @END 
//    D;JGT 
//
//    @addr 
//    A=M 
//    M=-1 
//
//    @i 
//    M=M+1 
//    @32 
//    D=A 
//    @addr 
//    M=D+M 
//    @LOOP 
//    0;JMP 
//
//(END)
//    @END 
//    0;JMP 