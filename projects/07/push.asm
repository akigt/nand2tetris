    @100
    D=A
    @256
    M=D

    @12
    D=A
    @257
    M=D

    //for args
    @20
    D=A
    @16
    M=D

    //for args point 16
    @15
    D=A
    @1
    M=D

    //set current stack pointer 258
    @258
    D=A
    @0
    M=D

    // push command
    @1
    D=A 
    @1 // get a value from segment
    A=M+D
    D=M // D is target value

    @0 // get stack pointer
    A=M // goto empty stack 
    M=D // set value
    @0
    M=M+1 // set next stack pointer