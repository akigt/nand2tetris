// C_PUSH constant 111
@111 // get constant
D=A
@SP
A=M
M=D
//forward stack pointer
@SP
M=M+1
// C_PUSH constant 333
@333 // get constant
D=A
@SP
A=M
M=D
//forward stack pointer
@SP
M=M+1
// C_PUSH constant 888
@888 // get constant
D=A
@SP
A=M
M=D
//forward stack pointer
@SP
M=M+1
// C_POP static Foo.8
@SP
A=M-1
D=M // get last value on stack and pop it
@Foo.8 // goto temp address
M=D // change value to poped value
//backward stack pointer
@SP
M=M-1
// C_POP static Foo.3
@SP
A=M-1
D=M // get last value on stack and pop it
@Foo.3 // goto temp address
M=D // change value to poped value
//backward stack pointer
@SP
M=M-1
// C_POP static Foo.1
@SP
A=M-1
D=M // get last value on stack and pop it
@Foo.1 // goto temp address
M=D // change value to poped value
//backward stack pointer
@SP
M=M-1
// C_PUSH static Foo.3
@Foo.3 // change to static
D=M // get target value X
@SP
A=M
M=D // change value to  X
//forward stack pointer
@SP
M=M+1
// C_PUSH static Foo.1
@Foo.1 // change to static
D=M // get target value X
@SP
A=M
M=D // change value to  X
//forward stack pointer
@SP
M=M+1
//sub
@2
D=A
@SP
A=M-D //get back 2 point
D=M // get first arg
A=A+1 // get back 1 point
D=D-M // arithmetic operation here!first arg - second arg
A=A-1 // get back 2 point
M=D // put result on back 2 point
D=A+1
@SP // stack pointer
M=D // set stack pointer two back 1
// C_PUSH static Foo.8
@Foo.8 // change to static
D=M // get target value X
@SP
A=M
M=D // change value to  X
//forward stack pointer
@SP
M=M+1
//add
@2
D=A
@SP
A=M-D //get back 2 point
D=M // get first arg
A=A+1 // get back 1 point
D=D+M // arithmetic operation here! arg1 + arg2
A=A-1 // get back 2 point
M=D // put result on back 2 point
D=A+1
@SP // stack pointer
M=D // set stack pointer two back 1
