// C_PUSH constant 17
                @17 // get constant
                D=A
                @SP
                A=M
                M=D
                //forwartd stack pointer
                @SP
                M=M+1
                // C_PUSH constant 17
                @17 // get constant
                D=A
                @SP
                A=M
                M=D
                //forwartd stack pointer
                @SP
                M=M+1
                // eq command
            @2
            D=A
            @SP
            A=M-D //get 2 step before point
            D=M // get first arg
            A=A+1 // get back 1 point
            D=D-M // first arg - second arg

            @EQUAL0
            D;JEQ // if first - second == 0 goto EQUAL

            //NOT EQUAL
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

            (EQUAL0)
            @2
            D=A
            @SP
            A=M-D // get 2 steps before point
            M=-1 // change -1(=TURE value)
            D=A+1  // get 1 steps before point
            @SP
            M=D // change pointer to 1 steps before

            (END0)
            // C_PUSH constant 17
                @17 // get constant
                D=A
                @SP
                A=M
                M=D
                //forwartd stack pointer
                @SP
                M=M+1
                // C_PUSH constant 16
                @16 // get constant
                D=A
                @SP
                A=M
                M=D
                //forwartd stack pointer
                @SP
                M=M+1
                // eq command
            @2
            D=A
            @SP
            A=M-D //get 2 step before point
            D=M // get first arg
            A=A+1 // get back 1 point
            D=D-M // first arg - second arg

            @EQUAL1
            D;JEQ // if first - second == 0 goto EQUAL

            //NOT EQUAL
            @2
            D=A
            @SP
            A=M-D // get 2 steps before point
            M=0 // change 0(= FALSE value)
            D=A+1  // get 1 steps before point
            @SP
            M=D // change pointer to 1 steps before
            @END1
            0;JMP

            (EQUAL1)
            @2
            D=A
            @SP
            A=M-D // get 2 steps before point
            M=-1 // change -1(=TURE value)
            D=A+1  // get 1 steps before point
            @SP
            M=D // change pointer to 1 steps before

            (END1)
            // C_PUSH constant 16
                @16 // get constant
                D=A
                @SP
                A=M
                M=D
                //forwartd stack pointer
                @SP
                M=M+1
                // C_PUSH constant 17
                @17 // get constant
                D=A
                @SP
                A=M
                M=D
                //forwartd stack pointer
                @SP
                M=M+1
                // eq command
            @2
            D=A
            @SP
            A=M-D //get 2 step before point
            D=M // get first arg
            A=A+1 // get back 1 point
            D=D-M // first arg - second arg

            @EQUAL2
            D;JEQ // if first - second == 0 goto EQUAL

            //NOT EQUAL
            @2
            D=A
            @SP
            A=M-D // get 2 steps before point
            M=0 // change 0(= FALSE value)
            D=A+1  // get 1 steps before point
            @SP
            M=D // change pointer to 1 steps before
            @END2
            0;JMP

            (EQUAL2)
            @2
            D=A
            @SP
            A=M-D // get 2 steps before point
            M=-1 // change -1(=TURE value)
            D=A+1  // get 1 steps before point
            @SP
            M=D // change pointer to 1 steps before

            (END2)
            // C_PUSH constant 892
                @892 // get constant
                D=A
                @SP
                A=M
                M=D
                //forwartd stack pointer
                @SP
                M=M+1
                // C_PUSH constant 891
                @891 // get constant
                D=A
                @SP
                A=M
                M=D
                //forwartd stack pointer
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

            @LESS3
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
            @END3
            0;JMP

            (LESS3)
            @2
            D=A
            @SP
            A=M-D // get 2 steps before point
            M=-1 // change -1(=TURE value)
            D=A+1  // get 1 steps before point
            @SP
            M=D // change pointer to 1 steps before

            (END3)
            // C_PUSH constant 891
                @891 // get constant
                D=A
                @SP
                A=M
                M=D
                //forwartd stack pointer
                @SP
                M=M+1
                // C_PUSH constant 892
                @892 // get constant
                D=A
                @SP
                A=M
                M=D
                //forwartd stack pointer
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

            @LESS4
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
            @END4
            0;JMP

            (LESS4)
            @2
            D=A
            @SP
            A=M-D // get 2 steps before point
            M=-1 // change -1(=TURE value)
            D=A+1  // get 1 steps before point
            @SP
            M=D // change pointer to 1 steps before

            (END4)
            // C_PUSH constant 891
                @891 // get constant
                D=A
                @SP
                A=M
                M=D
                //forwartd stack pointer
                @SP
                M=M+1
                // C_PUSH constant 891
                @891 // get constant
                D=A
                @SP
                A=M
                M=D
                //forwartd stack pointer
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

            @LESS5
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
            @END5
            0;JMP

            (LESS5)
            @2
            D=A
            @SP
            A=M-D // get 2 steps before point
            M=-1 // change -1(=TURE value)
            D=A+1  // get 1 steps before point
            @SP
            M=D // change pointer to 1 steps before

            (END5)
            // C_PUSH constant 32767
                @32767 // get constant
                D=A
                @SP
                A=M
                M=D
                //forwartd stack pointer
                @SP
                M=M+1
                // C_PUSH constant 32766
                @32766 // get constant
                D=A
                @SP
                A=M
                M=D
                //forwartd stack pointer
                @SP
                M=M+1
                // gt command
            @2
            D=A
            @SP
            A=M-D //get 2 step before point
            D=M // get first arg
            A=A+1 // get back 1 point
            D=D-M // first arg - second arg

            @GREATER6
            D;JGT // if first - second>0 goto GREATER

            //LESS
            @2
            D=A
            @SP
            A=M-D // get 2 steps before point
            M=0 // change 0(= FALSE value)
            D=A+1  // get 1 steps before point
            @SP
            M=D // change pointer to 1 steps before
            @END6
            0;JMP


            (GREATER6)
            @2
            D=A
            @SP
            A=M-D // get 2 steps before point
            M=-1 // change -1(=TURE value)
            D=A+1  // get 1 steps before point
            @SP
            M=D // change pointer to 1 steps before

            (END6)
            // C_PUSH constant 32766
                @32766 // get constant
                D=A
                @SP
                A=M
                M=D
                //forwartd stack pointer
                @SP
                M=M+1
                // C_PUSH constant 32767
                @32767 // get constant
                D=A
                @SP
                A=M
                M=D
                //forwartd stack pointer
                @SP
                M=M+1
                // gt command
            @2
            D=A
            @SP
            A=M-D //get 2 step before point
            D=M // get first arg
            A=A+1 // get back 1 point
            D=D-M // first arg - second arg

            @GREATER7
            D;JGT // if first - second>0 goto GREATER

            //LESS
            @2
            D=A
            @SP
            A=M-D // get 2 steps before point
            M=0 // change 0(= FALSE value)
            D=A+1  // get 1 steps before point
            @SP
            M=D // change pointer to 1 steps before
            @END7
            0;JMP


            (GREATER7)
            @2
            D=A
            @SP
            A=M-D // get 2 steps before point
            M=-1 // change -1(=TURE value)
            D=A+1  // get 1 steps before point
            @SP
            M=D // change pointer to 1 steps before

            (END7)
            // C_PUSH constant 32766
                @32766 // get constant
                D=A
                @SP
                A=M
                M=D
                //forwartd stack pointer
                @SP
                M=M+1
                // C_PUSH constant 32766
                @32766 // get constant
                D=A
                @SP
                A=M
                M=D
                //forwartd stack pointer
                @SP
                M=M+1
                // gt command
            @2
            D=A
            @SP
            A=M-D //get 2 step before point
            D=M // get first arg
            A=A+1 // get back 1 point
            D=D-M // first arg - second arg

            @GREATER8
            D;JGT // if first - second>0 goto GREATER

            //LESS
            @2
            D=A
            @SP
            A=M-D // get 2 steps before point
            M=0 // change 0(= FALSE value)
            D=A+1  // get 1 steps before point
            @SP
            M=D // change pointer to 1 steps before
            @END8
            0;JMP


            (GREATER8)
            @2
            D=A
            @SP
            A=M-D // get 2 steps before point
            M=-1 // change -1(=TURE value)
            D=A+1  // get 1 steps before point
            @SP
            M=D // change pointer to 1 steps before

            (END8)
            // C_PUSH constant 57
                @57 // get constant
                D=A
                @SP
                A=M
                M=D
                //forwartd stack pointer
                @SP
                M=M+1
                // C_PUSH constant 31
                @31 // get constant
                D=A
                @SP
                A=M
                M=D
                //forwartd stack pointer
                @SP
                M=M+1
                // C_PUSH constant 53
                @53 // get constant
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
            D=D+M // arithmetic operation here! arg1 + arg2
            A=A-1 // get back 2 point
            M=D // put result on back 2 point
            D=A+1
            @SP // stack pointer
            M=D // set stack pointer two back 1
            // C_PUSH constant 112
                @112 // get constant
                D=A
                @SP
                A=M
                M=D
                //forwartd stack pointer
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
            //neg
            @SP
            A=M-1 //get back 1 point
            M=-M // change to negative value
            //and
            @2
            D=A
            @SP
            A=M-D //get back 2 point
            D=M // get first arg
            A=A+1 // get back 1 point
            D=D&M // arithmetic operation here!first arg & second arg
            A=A-1 // get back 2 point
            M=D // put result on back 2 point
            D=A+1
            @SP // stack pointer
            M=D // set stack pointer two back 1
            // C_PUSH constant 82
                @82 // get constant
                D=A
                @SP
                A=M
                M=D
                //forwartd stack pointer
                @SP
                M=M+1
                //or
            @2
            D=A
            @SP
            A=M-D //get back 2 point
            D=M // get first arg
            A=A+1 // get back 1 point
            D=D|M // arithmetic operation here!first arg | second arg
            A=A-1 // get back 2 point
            M=D // put result on back 2 point
            D=A+1
            @SP // stack pointer
            M=D // set stack pointer two back 1
            //not
            @SP
            A=M-1 //get back 1 point
            M=!M // change to negative value
            