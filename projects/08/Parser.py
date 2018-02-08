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

