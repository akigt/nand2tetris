// C_PUSH constant 3030
@3030 // get constant
D=A
@SP
A=M
M=D
//forward stack pointer
@SP
M=M+1
// C_POP pointer RAM[3]
@SP
A=M-1
D=M // get last value on stack and pop it
@3 // goto temp address
M=D // change value to poped value
//backward stack pointer
@SP
M=M-1
// C_PUSH constant 3040
@3040 // get constant
D=A
@SP
A=M
M=D
//forward stack pointer
@SP
M=M+1
// C_POP pointer RAM[4]
@SP
A=M-1
D=M // get last value on stack and pop it
@4 // goto temp address
M=D // change value to poped value
//backward stack pointer
@SP
M=M-1
// C_PUSH constant 32
@32 // get constant
D=A
@SP
A=M
M=D
//forward stack pointer
@SP
M=M+1
// C_POP THIS 2
@2 // get index
D=A
@THIS // get segment base address
M=M+D //temporally change base address to target address(base + index)
@SP
A=M-1
D=M // get last value on stack and pop it
@THIS
A=M // goto target address
M=D // change value to poped value
// reset segment base address
@2 // get index
D=A
@THIS
M=M-D // reset segment base addres here by subtracting index
//backward stack pointer
@SP
M=M-1
// C_PUSH constant 46
@46 // get constant
D=A
@SP
A=M
M=D
//forward stack pointer
@SP
M=M+1
// C_POP THAT 6
@6 // get index
D=A
@THAT // get segment base address
M=M+D //temporally change base address to target address(base + index)
@SP
A=M-1
D=M // get last value on stack and pop it
@THAT
A=M // goto target address
M=D // change value to poped value
// reset segment base address
@6 // get index
D=A
@THAT
M=M-D // reset segment base addres here by subtracting index
//backward stack pointer
@SP
M=M-1
// C_PUSH pointer RAM[3]
@3 // change temp
D=M // get target value X
@SP
A=M
M=D // change value to  X
//forward stack pointer
@SP
M=M+1
// C_PUSH pointer RAM[4]
@4 // change temp
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
// C_PUSH THIS 2
@2 // get index
D=A
@THIS // get segment base address
A=M+D // get target address(base + index)
D=M // get target value X
@SP // get stack pointer
A=M // change to stack point
M=D // change value to X
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
// C_PUSH THAT 6
@6 // get index
D=A
@THAT // get segment base address
A=M+D // get target address(base + index)
D=M // get target value X
@SP // get stack pointer
A=M // change to stack point
M=D // change value to X
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
