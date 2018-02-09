// start initializing
@256
D=A
@SP
M=D
// end initializing
// C_PUSH ARG 1
@1 // get index
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
// C_POP pointer RAM[4]
@SP
A=M-1
D=M // get last value on stack and pop it
@4 // goto temp address
M=D // change value to poped value
//backward stack pointer
@SP
M=M-1
// C_PUSH constant 0
@0 // get constant
D=A
@SP
A=M
M=D
//forward stack pointer
@SP
M=M+1
// C_POP THAT 0
@0 // get index
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
@0 // get index
D=A
@THAT
M=M-D // reset segment base addres here by subtracting index
//backward stack pointer
@SP
M=M-1
// C_PUSH constant 1
@1 // get constant
D=A
@SP
A=M
M=D
//forward stack pointer
@SP
M=M+1
// C_POP THAT 1
@1 // get index
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
@1 // get index
D=A
@THAT
M=M-D // reset segment base addres here by subtracting index
//backward stack pointer
@SP
M=M-1
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
// C_POP ARG 0
@0 // get index
D=A
@ARG // get segment base address
M=M+D //temporally change base address to target address(base + index)
@SP
A=M-1
D=M // get last value on stack and pop it
@ARG
A=M // goto target address
M=D // change value to poped value
// reset segment base address
@0 // get index
D=A
@ARG
M=M-D // reset segment base addres here by subtracting index
//backward stack pointer
@SP
M=M-1
// Label MAIN_LOOP_START
(MAIN_LOOP_START)
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
// If-goto COMPUTE_ELEMENT
@SP
M=M-1 // get 1 step back stack pointer 
A=M // go to top of stack
D=M //get a value from top of the stack
@COMPUTE_ELEMENT
D;JNE // if D!=0 then goto lable (COMPUTE_ELEMENT)
// goto END_PROGRAM
@END_PROGRAM
0;JMP // goto lable (END_PROGRAM)
// Label COMPUTE_ELEMENT
(COMPUTE_ELEMENT)
// C_PUSH THAT 0
@0 // get index
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
// C_PUSH THAT 1
@1 // get index
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
// C_POP THAT 2
@2 // get index
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
@2 // get index
D=A
@THAT
M=M-D // reset segment base addres here by subtracting index
//backward stack pointer
@SP
M=M-1
// C_PUSH pointer RAM[4]
@4 // change temp
D=M // get target value X
@SP
A=M
M=D // change value to  X
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
// C_POP pointer RAM[4]
@SP
A=M-1
D=M // get last value on stack and pop it
@4 // goto temp address
M=D // change value to poped value
//backward stack pointer
@SP
M=M-1
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
// C_POP ARG 0
@0 // get index
D=A
@ARG // get segment base address
M=M+D //temporally change base address to target address(base + index)
@SP
A=M-1
D=M // get last value on stack and pop it
@ARG
A=M // goto target address
M=D // change value to poped value
// reset segment base address
@0 // get index
D=A
@ARG
M=M-D // reset segment base addres here by subtracting index
//backward stack pointer
@SP
M=M-1
// goto MAIN_LOOP_START
@MAIN_LOOP_START
0;JMP // goto lable (MAIN_LOOP_START)
// Label END_PROGRAM
(END_PROGRAM)
