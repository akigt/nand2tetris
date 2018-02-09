
                // C_PUSH constant 0
                @0 // get constant
                D=A
                @SP
                A=M
                M=D
                //forward stack pointer
                @SP
                M=M+1
                
                // C_POP LCL 0

                @0 // get index
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
                @0 // get index
                D=A
                @LCL
                M=M-D // reset segment base addres here by subtracting index

                //backward stack pointer
                @SP
                M=M-1
                

        // Label LOOP_START
        (LOOP_START)

        
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
            
                // C_POP LCL 0

                @0 // get index
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
                @0 // get index
                D=A
                @LCL
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
                

        // If-goto LOOP_START
        @SP
        M=M-1 // get 1 step back stack pointer 
        A=M // go to top of stack
        D=M //get a value from top of the stack
        @LOOP_START
        D;JNE // if D!=0 then goto lable (LOOP_START)

        
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
                