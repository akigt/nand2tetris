    @10
    D=A
    @256
    M=D

    @12
    D=A
    @257
    M=D

    //current stack pointer 258
    @258
    D=A
    @0
    M=D

    @2
    D=A
    @0
    A=M-D //get back 2 point
    D=M // D= 10
    A=A+1 // get back 1 point
    D=D-M // 10-15 > 0

    @GREATER
    D;JGT

    //LESS
    @2
    D=A
    @0
    A=M-D //258 - 2
    M=-1 // change -1 = FALSE value
    D=A+1  // D=257
    @0
    M=D // change pointer to 257
    @END
    0;JMP


(GREATER)
    @2
    D=A
    @0
    A=M-D //258 - 2
    M=0 // change 0 = TURE value
    D=A+1  // D=257
    @0
    M=D // change pointer to 257

(END)
    @END
    0;JMP

