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
// define function Sys.init
(Sys.init)
// C_PUSH constant 4000
@4000 // get constant
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
// C_PUSH constant 5000
@5000 // get constant
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
@Sys.vm$ret.1  // return addree
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
@Sys.main // finally call the function 
0;JMP
(Sys.vm$ret.1)
// C_POP temp RAM[6]
@SP
A=M-1
D=M // get last value on stack and pop it
@6 // goto temp address
M=D // change value to poped value
//backward stack pointer
@SP
M=M-1
// Label LOOP
(LOOP)
// goto LOOP
@LOOP
0;JMP // goto lable (LOOP)
// define function Sys.main
(Sys.main)
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
@SP
A=M
M=0
@SP
M=M+1
// C_PUSH constant 4001
@4001 // get constant
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
// C_PUSH constant 5001
@5001 // get constant
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
// C_PUSH constant 200
@200 // get constant
D=A
@SP
A=M
M=D
//forward stack pointer
@SP
M=M+1
// C_POP LCL 1
@1 // get index
D=A
@LCL // get segment base address
M=M+D //temporally change base address to target address(base + index)
@SP
A=M-1
D=M // get last value on stack and pop it
@LCL
A=M // goto target address
M=D // change value to poped value
// reset segment base address
@1 // get index
D=A
@LCL
M=M-D // reset segment base addres here by subtracting index
//backward stack pointer
@SP
M=M-1
// C_PUSH constant 40
@40 // get constant
D=A
@SP
A=M
M=D
//forward stack pointer
@SP
M=M+1
// C_POP LCL 2
@2 // get index
D=A
@LCL // get segment base address
M=M+D //temporally change base address to target address(base + index)
@SP
A=M-1
D=M // get last value on stack and pop it
@LCL
A=M // goto target address
M=D // change value to poped value
// reset segment base address
@2 // get index
D=A
@LCL
M=M-D // reset segment base addres here by subtracting index
//backward stack pointer
@SP
M=M-1
// C_PUSH constant 6
@6 // get constant
D=A
@SP
A=M
M=D
//forward stack pointer
@SP
M=M+1
// C_POP LCL 3
@3 // get index
D=A
@LCL // get segment base address
M=M+D //temporally change base address to target address(base + index)
@SP
A=M-1
D=M // get last value on stack and pop it
@LCL
A=M // goto target address
M=D // change value to poped value
// reset segment base address
@3 // get index
D=A
@LCL
M=M-D // reset segment base addres here by subtracting index
//backward stack pointer
@SP
M=M-1
// C_PUSH constant 123
@123 // get constant
D=A
@SP
A=M
M=D
//forward stack pointer
@SP
M=M+1
@Sys.vm$ret.2  // return addree
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
@Sys.add12 // finally call the function 
0;JMP
(Sys.vm$ret.2)
// C_POP temp RAM[5]
@SP
A=M-1
D=M // get last value on stack and pop it
@5 // goto temp address
M=D // change value to poped value
//backward stack pointer
@SP
M=M-1
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
// C_PUSH LCL 2
@2 // get index
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
// C_PUSH LCL 3
@3 // get index
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
// C_PUSH LCL 4
@4 // get index
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
// define function Sys.add12
(Sys.add12)
// C_PUSH constant 4002
@4002 // get constant
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
// C_PUSH constant 5002
@5002 // get constant
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
// C_PUSH constant 12
@12 // get constant
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
