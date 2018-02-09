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
// define function Class1.set
(Class1.set)
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
// C_POP static Class1.vm.0
@SP
A=M-1
D=M // get last value on stack and pop it
@Class1.vm.0 // goto temp address
M=D // change value to poped value
//backward stack pointer
@SP
M=M-1
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
// C_POP static Class1.vm.1
@SP
A=M-1
D=M // get last value on stack and pop it
@Class1.vm.1 // goto temp address
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
// define function Class1.get
(Class1.get)
// C_PUSH static Class1.vm.0
@Class1.vm.0 // change to static
D=M // get target value X
@SP
A=M
M=D // change value to  X
//forward stack pointer
@SP
M=M+1
// C_PUSH static Class1.vm.1
@Class1.vm.1 // change to static
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
// define function Class2.set
(Class2.set)
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
// C_POP static Class2.vm.0
@SP
A=M-1
D=M // get last value on stack and pop it
@Class2.vm.0 // goto temp address
M=D // change value to poped value
//backward stack pointer
@SP
M=M-1
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
// C_POP static Class2.vm.1
@SP
A=M-1
D=M // get last value on stack and pop it
@Class2.vm.1 // goto temp address
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
// define function Class2.get
(Class2.get)
// C_PUSH static Class2.vm.0
@Class2.vm.0 // change to static
D=M // get target value X
@SP
A=M
M=D // change value to  X
//forward stack pointer
@SP
M=M+1
// C_PUSH static Class2.vm.1
@Class2.vm.1 // change to static
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
// C_PUSH constant 6
@6 // get constant
D=A
@SP
A=M
M=D
//forward stack pointer
@SP
M=M+1
// C_PUSH constant 8
@8 // get constant
D=A
@SP
A=M
M=D
//forward stack pointer
@SP
M=M+1
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
@2
D=A
@ARG
M=M-D
// change LCL to SP
@SP
D=M
@LCL
M=D
@Class1.set // finally call the function 
0;JMP
(Sys.vm$ret.1)
// C_POP temp RAM[5]
@SP
A=M-1
D=M // get last value on stack and pop it
@5 // goto temp address
M=D // change value to poped value
//backward stack pointer
@SP
M=M-1
// C_PUSH constant 23
@23 // get constant
D=A
@SP
A=M
M=D
//forward stack pointer
@SP
M=M+1
// C_PUSH constant 15
@15 // get constant
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
@2
D=A
@ARG
M=M-D
// change LCL to SP
@SP
D=M
@LCL
M=D
@Class2.set // finally call the function 
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
@0
D=A
@ARG
M=M-D
// change LCL to SP
@SP
D=M
@LCL
M=D
@Class1.get // finally call the function 
0;JMP
(Sys.vm$ret.3)
@Sys.vm$ret.4  // return addree
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
@Class2.get // finally call the function 
0;JMP
(Sys.vm$ret.4)
// Label WHILE
(WHILE)
// goto WHILE
@WHILE
0;JMP // goto lable (WHILE)
