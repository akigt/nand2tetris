import os 
# print(os.getcwd())

class Parser:
    arithmetics = ["add","sub","neg","eq","gt","lt","and","or","not"]
    commands = {
        "arithmetic":"C_ARITHMETIC",\
        "push":"C_PUSH",\
        "pop":"C_POP",\
        "label":"C_LABEL",\
        "goto":"C_GOTO",\
        "if-goto":"C_IF",\
        "function":"C_FUNCTION",\
        "return":"C_RETURN",\
        "call":"C_CALL"
        }
    # from collections import deque
    def __init__(self, file_name):
        self.lines = []
        with open(file_name,'r') as f:
            for line in f:
                line = line.strip()
                if len(line) == 0 or line[:2] == '//':
                    # print('its blank or comment')
                    continue
                else:
                    commands_and_args = line.split()
                    self.lines.append(commands_and_args)
                
        self.__idx = 0 # current number of line

    # def check(self):
    #     print(self.lines[self.__idx])
    #     # print(self.lines[self.__idx].strip())

    def hasMoreCommands(self):
        if len(self.lines) == self.__idx:
            return False
        else:
            return True
    
    def advance(self):
        if self.hasMoreCommands():
            self.__idx += 1
        else:
            print('no more lines')
    
    def commandType(self):
        command = self.lines[self.__idx][0]
        if command in Parser.arithmetics:
            # print(Parser.commands["arithmetic"])
            return Parser.commands["arithmetic"]
        if Parser.commands.get(command,False):
            # print(Parser.commands[command])
            return Parser.commands[command]
        return 0
    
    def arg1(self):
        if self.commandType() == "C_ARITHMETIC":
            return self.lines[self.__idx][0]
        else:
            return self.lines[self.__idx][1]

    def arg2(self):
        if self.commandType() == "C_ARITHMETIC":
            return None
        else:
            return self.lines[self.__idx][2]





class CodeWriter:
    def __init__(self, file_name):
        self.f = open(file_name, 'w')
        self.labal_counter = 0

    def setFileName(self,new_file_name):
        if self.f:
            self.f.close()
            self.f = None
        self.f = open(new_file_name, 'w')
    
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
                """.format(command,segment,index,"Foo")
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
                """.format(command,segment,index,"Foo")
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

    def close(self):
        if self.f:
            self.f.close()
            self.f = None


# clean output code by removing unnecessary tabs
def asm_cleaner(file_name):
    output = []
    with open(file_name,"r") as f:
        for line in f:
            output.append(line.lstrip())
    
    # rewrite file
    with open(file_name,"w") as f:
        for line in output:
            f.write(line)



if __name__ == '__main__':
    import sys
 
    args = sys.argv

    if len(args) <= 1:
        print('not enough arguments error')
    elif len(args) >= 3:
        print("too many args! error")

    vmfile = args[1]

    p = Parser(vmfile)
    output_file = vmfile[:-2] + "asm"
    cw = CodeWriter(output_file)
    
    while p.hasMoreCommands():
        if p.commandType() == "C_ARITHMETIC":
            command = p.arg1()
            cw.writeArithmetic(command)
        if p.commandType() in ["C_POP","C_PUSH"]:
            command = p.commandType()
            segment = p.arg1()
            index = p.arg2()
            cw.writePushPop(command,segment,index)

        p.advance()

    cw.close()

    asm_cleaner(output_file)