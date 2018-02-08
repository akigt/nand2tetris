// C_PUSH ARG 0
@0 // get index
D=A
@ARG // get segment base address
A=M+D // get target address(base + index)
D=M // get target value X
@SP // get stack pointer
A=M // change to stack point
M=D // change value to X
//forward stack pointer
@SP
M=M+1
// C_PUSH constant 2
@2 // get constant
D=A
@SP
A=M
M=D
//forward stack pointer
@SP
M=M+1
// lt command
@2
D=A
@SP
A=M-D //get 2 step before point
D=M // get first arg
A=A+1 // get back 1 point
D=D-M // first arg - second arg
@LESS0
D;JLT // if first - second<0 goto LESS
//GREATER
@2
D=A
@SP
A=M-D // get 2 steps before point
M=0 // change 0(= FALSE value)
D=A+1  // get 1 steps before point
@SP
M=D // change pointer to 1 steps before
@END0
0;JMP
(LESS0)
@2
D=A
@SP
A=M-D // get 2 steps before point
M=-1 // change -1(=TURE value)
D=A+1  // get 1 steps before point
@SP
M=D // change pointer to 1 steps before
(END0)
// If-goto IF_TRUE
@SP
M=M-1 // get 1 step back stack pointer 
A=M // go to top of stack
D=M //get a value from top of the stack
@IF_TRUE
D;JNE // if D!=0 then goto lable (IF_TRUE)
// goto IF_FALSE
@IF_FALSE
0;JMP // goto lable (IF_FALSE)
// Label IF_TRUE
(IF_TRUE)
// C_PUSH ARG 0
@0 // get index
D=A
@ARG // get segment base address
A=M+D // get target address(base + index)
D=M // get target value X
@SP // get stack pointer
A=M // change to stack point
M=D // change value to X
//forward stack pointer
@SP
M=M+1
// Label IF_FALSE
(IF_FALSE)
// C_PUSH ARG 0
@0 // get index
D=A
@ARG // get segment base address
A=M+D // get target address(base + index)
D=M // get target value X
@SP // get stack pointer
A=M // change to stack point
M=D // change value to X
//forward stack pointer
@SP
M=M+1
// C_PUSH constant 2
@2 // get constant
D=A
@SP
A=M
M=D
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
// C_PUSH ARG 0
@0 // get index
D=A
@ARG // get segment base address
A=M+D // get target address(base + index)
D=M // get target value X
@SP // get stack pointer
A=M // change to stack point
M=D // change value to X
//forward stack pointer
@SP
M=M+1
// C_PUSH constant 1
@1 // get constant
D=A
@SP
A=M
M=D
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
