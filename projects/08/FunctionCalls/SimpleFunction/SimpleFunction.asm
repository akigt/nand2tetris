// define function SimpleFunction.test
(SimpleFunction.test)
@SP
A=M
M=0
@SP
M=M+1
@SP
A=M
M=0
@SP
M=M+1
// C_PUSH LCL 0
@0 // get index
D=A
@LCL // get segment base address
A=M+D // get target address(base + index)
D=M // get target value X
@SP // get stack pointer
A=M // change to stack point
M=D // change value to X
//forward stack pointer
@SP
M=M+1
// C_PUSH LCL 1
@1 // get index
D=A
@LCL // get segment base address
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
//not
@SP
A=M-1 //get back 1 point
M=!M // change to negative value
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
// let's return!!!
@LCL 
D=M // endframe
@endFrame // endFrame
M=D
@5
D=A
@endFrame
D=M-D // endframe - 5
A=D
D=M
@returnAddress // returnAddress = endfram - 5
M=D
// *ARG = POP()
@SP
D=M-1
A=D
D=M // get top value on the stack
@ARG
A=M
M=D // change arg 0 value to stack top value
// sp = ARG + 1
@ARG
D=M+1
@SP
M=D
// reset THAT
@1
D=A
@endFrame
D=M-D // endframe - 1
A=D
D=M
@THAT // THAT = endfram - 1
M=D
// reset THIS
@2
D=A
@endFrame
D=M-D // endframe - 2
A=D
D=M
@THIS // THIS = endfram - 2
M=D
// reset ARG
@3
D=A
@endFrame
D=M-D // endframe - 3
A=D
D=M
@ARG // ARG = endfram - 3
M=D
// reset LCL
@4
D=A
@endFrame
D=M-D // endframe - 4
A=D
D=M
@LCL // LCL = endfram - 4
M=D
// goto return address
@returnAddress
A=M
0;JMP
