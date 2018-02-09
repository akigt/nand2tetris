class CodeWriter:
    def __init__(self, file_name):
        self.f = open(file_name, 'w')
        self.labal_counter = 0
        self.return_counter = 0
        self.file_name = "Main"

    def setFileName(self,file_name):
        # get current processing file name
        self.file_name = file_name
    
    def writeInit(self):
        res = \
        """
        // start initializing
        @256
        D=A
        @SP
        M=D
        // end initializing
        """

        self.f.write(res) # set stack pointer
        self.writeCall("Sys.init",0) # call sys init 

        return 0
    
    def writeArithmetic(self,command):
        res = ""

        if command == "add":
            res = \
            """
            //{0}
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
            """.format(command)

        if command == "sub":
            res = \
            """
            //{0}
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
            """.format(command)
        
        if command == "neg":
            res = \
            """
            //{0}
            @SP
            A=M-1 //get back 1 point
            M=-M // change to negative value
            """.format(command)
        
        if command == "eq":
            res = \
            """
            // {0} command
            @2
            D=A
            @SP
            A=M-D //get 2 step before point
            D=M // get first arg
            A=A+1 // get back 1 point
            D=D-M // first arg - second arg

            @EQUAL{1}
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
            @END{1}
            0;JMP

            (EQUAL{1})
            @2
            D=A
            @SP
            A=M-D // get 2 steps before point
            M=-1 // change -1(=TURE value)
            D=A+1  // get 1 steps before point
            @SP
            M=D // change pointer to 1 steps before

            (END{1})
            """.format(command,self.labal_counter)

        if command == "gt":
            res = \
            """
            // {0} command
            @2
            D=A
            @SP
            A=M-D //get 2 step before point
            D=M // get first arg
            A=A+1 // get back 1 point
            D=D-M // first arg - second arg

            @GREATER{1}
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
            @END{1}
            0;JMP


            (GREATER{1})
            @2
            D=A
            @SP
            A=M-D // get 2 steps before point
            M=-1 // change -1(=TURE value)
            D=A+1  // get 1 steps before point
            @SP
            M=D // change pointer to 1 steps before

            (END{1})
            """.format(command,self.labal_counter)

        if command == "lt":
            res = \
            """
            // {0} command
            @2
            D=A
            @SP
            A=M-D //get 2 step before point
            D=M // get first arg
            A=A+1 // get back 1 point
            D=D-M // first arg - second arg

            @LESS{1}
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
            @END{1}
            0;JMP

            (LESS{1})
            @2
            D=A
            @SP
            A=M-D // get 2 steps before point
            M=-1 // change -1(=TURE value)
            D=A+1  // get 1 steps before point
            @SP
            M=D // change pointer to 1 steps before

            (END{1})
            """.format(command,self.labal_counter)

        if command == "and":
            res = \
            """
            //{0}
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
            """.format(command)
       
        if command == "or":
            res = \
            """
            //{0}
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
            """.format(command)

        if command == "not":
            res = \
            """
            //{0}
            @SP
            A=M-1 //get back 1 point
            M=!M // change to negative value
            """.format(command)

        self.labal_counter += 1
        # res = "yattaze"
        self.f.write(res)
        

    def writePushPop(self,command,segment,index):
        # res = "{0} {1} {2}\n"\
        # .format(command,segment,index)
        symbols = {
            "local":"LCL",
            "argument":"ARG",
            "this":"THIS",
            "that":"THAT"
        }
        res = ""
        if command == "C_PUSH":
            if segment == "constant":
                res = \
                """
                // {0} {1} {2}
                @{2} // get constant
                D=A
                @SP
                A=M
                M=D
                //forward stack pointer
                @SP
                M=M+1
                """.format(command,segment,index)
            elif segment == "temp":
                index = int(index) + 5 # 5 is temp base address
                res = \
                """
                // {0} {1} RAM[{2}]
                @{2} // change temp
                D=M // get target value X
                @SP
                A=M
                M=D // change value to  X
                //forward stack pointer
                @SP
                M=M+1
                """.format(command,segment,index)
            elif segment == "pointer":
                index = int(index) + 3 # 3 is pointer's base address
                res = \
                """
                // {0} {1} RAM[{2}]
                @{2} // change temp
                D=M // get target value X
                @SP
                A=M
                M=D // change value to  X
                //forward stack pointer
                @SP
                M=M+1
                """.format(command,segment,index)
            elif segment == "static":
                res = \
                """
                // {0} {1} {3}.{2}
                @{3}.{2} // change to static
                D=M // get target value X
                @SP
                A=M
                M=D // change value to  X
                //forward stack pointer
                @SP
                M=M+1
                """.format(command,segment,index,self.file_name)
            else:
                symbol = symbols.get(segment)
                res = \
                """
                // {0} {1} {2}
                @{2} // get index
                D=A
                @{1} // get segment base address
                A=M+D // get target address(base + index)
                D=M // get target value X
                @SP // get stack pointer
                A=M // change to stack point
                M=D // change value to X
                //forward stack pointer
                @SP
                M=M+1
                """.format(command,symbol,index)
        
        if command == "C_POP":
            symbol = symbols.get(segment)
            if segment == "temp":
                index = int(index) + 5 # 5 is temp base address
                res = \
                """
                // {0} {1} RAM[{2}]
                @SP
                A=M-1
                D=M // get last value on stack and pop it

                @{2} // goto temp address
                M=D // change value to poped value

                //backward stack pointer
                @SP
                M=M-1
                """.format(command,segment,index)
            elif segment == "pointer":
                index = int(index) + 3 # 3 is pointer's base address
                res = \
                """
                // {0} {1} RAM[{2}]
                @SP
                A=M-1
                D=M // get last value on stack and pop it

                @{2} // goto temp address
                M=D // change value to poped value

                //backward stack pointer
                @SP
                M=M-1
                """.format(command,segment,index)
            elif segment == "static":
                res = \
                """
                // {0} {1} {3}.{2}
                @SP
                A=M-1
                D=M // get last value on stack and pop it

                @{3}.{2} // goto temp address
                M=D // change value to poped value

                //backward stack pointer
                @SP
                M=M-1
                """.format(command,segment,index,self.file_name)
            else:
                res = \
                """
                // {0} {1} {2}

                @{2} // get index
                D=A
                @{1} // get segment base address
                M=M+D //temporally change base address to target address(base + index)

                @SP
                A=M-1
                D=M // get last value on stack and pop it

                @{1}
                A=M // goto target address
                M=D // change value to poped value

                // reset segment base address
                @{2} // get index
                D=A
                @{1}
                M=M-D // reset segment base addres here by subtracting index

                //backward stack pointer
                @SP
                M=M-1
                """.format(command,symbol,index)
        
        # if command == "C_PUSH":
        #     res = \
        #     """
        #     // {0} {1} {2}
        #     @{2}

        #     @SP
        #     A=M
        #     M=D
        #     //forwartd stack pointer
        #     @SP
        #     M=M+1
        #     """.format(command,segment,index)


        self.f.write(res)
        # return command,segment,index

    def writeLabel(self,label):
        # print(label)
        res = \
        """

        // Label {0}
        ({0})

        """.format(label)

        self.f.write(res)
        return 0
    
    def writeGoto(self,label):
        res = \
        """

        // goto {0}
        @{0}
        0;JMP // goto lable ({0})

        """.format(label)

        self.f.write(res)
        return 0

    def writeIf(self,label):

        res = \
        """

        // If-goto {0}
        @SP
        M=M-1 // get 1 step back stack pointer 
        A=M // go to top of stack
        D=M //get a value from top of the stack
        @{0}
        D;JNE // if D!=0 then goto lable ({0})

        """.format(label)

        self.f.write(res)
        return 0
    
    def writeFunction(self,function_name,num_args):
        res = \
        """
        // define function {0}
        ({0})
        """.format(function_name)

        #function repeat n times to local to 0
        for i in range(0,int(num_args)):
            res += \
            """
            @SP
            A=M
            M=0
            @SP
            M=M+1
            """.format(num_args)

        self.f.write(res)
        return 0
    
    def writeCall(self,function_name,num_args):
        # print(function_name)
        res = \
        """
        @{0}$ret.{1}  // return addree
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1 // forward stack pointer
        """.format(self.file_name,self.return_counter)

        res += \
        """
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
        @{1}
        D=A
        @ARG
        M=M-D
        
        // change LCL to SP
        @SP
        D=M
        @LCL
        M=D
        
        @{0} // finally call the function 
        0;JMP
        """.format(function_name,num_args)

        # add return address declaration 
        res += \
        """
        ({0}$ret.{1})
        """.format(self.file_name,self.return_counter)

        self.return_counter += 1 # move ret_counter to next step

        self.f.write(res)
        return 0
    
    def writeReturn(self):
        res = \
        """
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

        """
        #arg pop 0 , and sp arg + 1

        self.f.write(res)
        return 0


    def close(self):
        if self.f:
            self.f.close()
            self.f = None

