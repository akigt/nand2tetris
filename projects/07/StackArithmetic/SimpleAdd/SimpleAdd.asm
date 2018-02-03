
                // C_PUSH constant 7
                @7 // get constant
                D=A
                @SP
                A=M
                M=D
                //forwartd stack pointer
                @SP
                M=M+1
                
                // C_PUSH constant 8
                @8 // get constant
                D=A
                @SP
                A=M
                M=D
                //forwartd stack pointer
                @SP
                M=M+1
                
            //add
            @2
            D=A
            @SP
            A=M-D //get back 2 point
            D=M // get first arg
            A=A+1 // get back 1 point
            D=D+M // get second arg
            A=A-1 // get back 2 point
            M=D // put result on back 2 point
            D=A+1
            @SP // stack pointer
            M=D // set stack pointer two back 1
            