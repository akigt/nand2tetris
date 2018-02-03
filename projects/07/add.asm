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

    //following is processing ADD

    @2
    D=A
    @0
    A=M-D //get back 2 point
    D=M // D= 10
    A=A+1 // get back 1 point
    D=D+M
    A=A-1 // get back 2 point
    M=D // put result on back 2 point
    D=A+1
    @0 // stack pointer
    M=D