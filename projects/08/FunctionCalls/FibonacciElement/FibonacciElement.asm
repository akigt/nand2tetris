// start initializing
@256
D=A
@SP
M=D
// end initializing
@Main$ret.0  // return addree
D=A
@SP
A=M
M=D
@SP
M=M+1 // forward stack pointer
@LCL // save LCL
D=M
@SP
A=M
M=D
@SP
M=M+1 // forward stack pointer
@ARG // save ARG
D=M
@SP
A=M
M=D
@SP
M=M+1 // forward stack pointer
@THIS // save THIS
D=M
@SP
A=M
M=D
@SP
M=M+1 // forward stack pointer
@THAT // save THAT
D=M
@SP
A=M
M=D
@SP
M=M+1 // forward stack pointer
//change new ARG point
@SP
D=M
@ARG // ARG = SP
M=D
@5
D=A
@ARG // ARG = sp - 5
M=M-D
@0
D=A
@ARG
M=M-D
// change LCL to SP
@SP
D=M
@LCL
M=D
@Sys.init // finally call the function 
0;JMP
(Main$ret.0)
// define function Main.fibonacci
(Main.fibonacci)
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
@Main.vm$ret.1  // return addree
D=A
@SP
A=M
M=D
@SP
M=M+1 // forward stack pointer
@LCL // save LCL
D=M
@SP
A=M
M=D
@SP
M=M+1 // forward stack pointer
@ARG // save ARG
D=M
@SP
A=M
M=D
@SP
M=M+1 // forward stack pointer
@THIS // save THIS
D=M
@SP
A=M
M=D
@SP
M=M+1 // forward stack pointer
@THAT // save THAT
D=M
@SP
A=M
M=D
@SP
M=M+1 // forward stack pointer
//change new ARG point
@SP
D=M
@ARG // ARG = SP
M=D
@5
D=A
@ARG // ARG = sp - 5
M=M-D
@1
D=A
@ARG
M=M-D
// change LCL to SP
@SP
D=M
@LCL
M=D
@Main.fibonacci // finally call the function 
0;JMP
(Main.vm$ret.1)
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
@Main.vm$ret.2  // return addree
D=A
@SP
A=M
M=D
@SP
M=M+1 // forward stack pointer
@LCL // save LCL
D=M
@SP
A=M
M=D
@SP
M=M+1 // forward stack pointer
@ARG // save ARG
D=M
@SP
A=M
M=D
@SP
M=M+1 // forward stack pointer
@THIS // save THIS
D=M
@SP
A=M
M=D
@SP
M=M+1 // forward stack pointer
@THAT // save THAT
D=M
@SP
A=M
M=D
@SP
M=M+1 // forward stack pointer
//change new ARG point
@SP
D=M
@ARG // ARG = SP
M=D
@5
D=A
@ARG // ARG = sp - 5
M=M-D
@1
D=A
@ARG
M=M-D
// change LCL to SP
@SP
D=M
@LCL
M=D
@Main.fibonacci // finally call the function 
0;JMP
(Main.vm$ret.2)
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
// define function Sys.init
(Sys.init)
// C_PUSH constant 4
@4 // get constant
D=A
@SP
A=M
M=D
//forward stack pointer
@SP
M=M+1
@Sys.vm$ret.3  // return addree
D=A
@SP
A=M
M=D
@SP
M=M+1 // forward stack pointer
@LCL // save LCL
D=M
@SP
A=M
M=D
@SP
M=M+1 // forward stack pointer
@ARG // save ARG
D=M
@SP
A=M
M=D
@SP
M=M+1 // forward stack pointer
@THIS // save THIS
D=M
@SP
A=M
M=D
@SP
M=M+1 // forward stack pointer
@THAT // save THAT
D=M
@SP
A=M
M=D
@SP
M=M+1 // forward stack pointer
//change new ARG point
@SP
D=M
@ARG // ARG = SP
M=D
@5
D=A
@ARG // ARG = sp - 5
M=M-D
@1
D=A
@ARG
M=M-D
// change LCL to SP
@SP
D=M
@LCL
M=D
@Main.fibonacci // finally call the function 
0;JMP
(Sys.vm$ret.3)
// Label WHILE
(WHILE)
// goto WHILE
@WHILE
0;JMP // goto lable (WHILE)
