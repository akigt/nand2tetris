import os 
# print(os.getcwd())

# with open('/Users/aki/Desktop/nand2tetris/projects/07/test','r') as f:
#     texts = f.readlines()



# for line in texts:
#     print(line.strip()) 
#     print('-'*100)

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

    def check(self):
        print(self.lines[self.__idx])
        # print(self.lines[self.__idx].strip())

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
            D=D+M // get second arg
            A=A-1 // get back 2 point
            M=D // put result on back 2 point
            D=A+1
            @SP // stack pointer
            M=D // set stack pointer two back 1
            """.format(command)
        
        self.f.write(res)
        

    def writePushPop(self,command,segment,index):
        # res = "{0} {1} {2}\n"\
        # .format(command,segment,index)
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
                //forwartd stack pointer
                @SP
                M=M+1
                """.format(command,segment,index)
        
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
        return command,segment,index

    def close(self):
        if self.f:
            self.f.close()
            self.f = None


# import contextlib
# with contextlib.closing(Program('myfile.txt')) as program:
#     program.check()

if __name__ == '__main__':
    import sys
 
    args = sys.argv
    # if len(args) == 2:
    #     print('OK')
    if len(args) <= 1:
        print('not enough arguments error')
    elif len(args) >= 3:
        print("too many args! error")

    vmfile = args[1]
    # print(vmfile)

    p = Parser(vmfile)
    cw = CodeWriter(vmfile[:-2] + "asm")
    # cw.setFileName("yattaze")
    # print(cw.writeArithmetic("testara4432ith"))
    # print(cw.writePushPop("testar","aa","aaa"))
    
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