
import os 
import sys
import re

BLANK_CHARS = r'\s'
INT = r'\d+'
KEYWORDS = ["class","constructor","function","method","field","static","var",
"int","char","boolean","void","true","false","null","this",
"let","do","if","else","while","return"]
SYMBOLS = "{}()[].,;+-*/&|<>=~"
IDENTIFIER = []

# print(SYMBOLS)
# SEPARATORS = r'\s'

class JackTokenizer:
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
    def __init__(self, file):
        # self.current_token = ""
        self.idx = 0
        with open(file,'r') as f:
            lines = f.readlines()

        lines_without_comment = []
        for l in lines:
            if l.find("//") != -1:
                comment = l.find("//")
                l = l[:comment]
            if l.find("/**") != -1:
                comment = l.find("/**")
                continue
            if len(l) == 0 or l == '\n':
                continue
            
            lines_without_comment.append(l.strip())

        # print(lines_without_comment)

        self.chars = "".join(lines_without_comment)
        # print(self.chars)
    
    def hasMoreTokens(self):
        return self.idx < len(self.chars)

    def advance(self):
        #initialize
        self.current_token = ""        
        string_flag = 0

        while self.idx < len(self.chars):
            #get current char and move forward char idx
            c = self.chars[self.idx]
            self.idx += 1

            # check isString?
            if c == "\"": #for string
                # print("hello" * 10)
                # print(self.current_token)
                if string_flag == 1:
                    string_flag = 0
                else:
                    string_flag = 1
            
            # if c is symbol and current_token is not empty, get current token and go back 1 step
            # else get symbol itself
            if c in SYMBOLS and string_flag == 0:
                if len(self.current_token) >= 1:
                    self.idx -= 1
                    return 0
                else:
                    self.current_token += c
                    return 0


            # if blank, get current_token
            if (re.match(BLANK_CHARS,c)) and string_flag == 0:
                return 0


            self.current_token += c
        return 0

    def tokenType(self):
        if self.current_token in KEYWORDS:
            return "KEYWORD"
        if self.current_token in SYMBOLS:
            return "SYMBOL"
        if re.match(INT,self.current_token):
            return "INT_CONST"
        if self.current_token[0] == "\"":
            return "STRING_CONST"

        return "IDENTIFIER"
    
    def keyWord(self):
        return self.current_token

    def symbol(self):
        if self.current_token == "<":
            return "&lt;"
        if self.current_token == ">":
            return "&gt;"
        return self.current_token

    def identifier(self):
        return self.current_token
    
    def intVal(self):
        return self.current_token

    def stringVal(self):
        return self.current_token[1:-1]



if __name__ == '__main__':
    
    args = sys.argv
    if len(args) <= 1:
        print('not enough arguments error')
    elif len(args) >= 3:
        print("too many args! error")

    source = []
    output_file = ""
    if os.path.isdir(args[1]): #dirだったら
        files = os.listdir(args[1])
        jack_files = filter(lambda f: f[-5:] == ".jack",files)
        jack_files_with_path = list(map(lambda f: os.path.join(args[1],f),jack_files))
        
        source = list(jack_files_with_path)
    else:
        source = [args[1]]

    # for output_file in source:
    #    print("output:  " + output_file)

    for input_file in source:
        tokenizer = JackTokenizer(input_file)
        # print(tokenizer.hasMoreTokens())
        print("<tokens>")
        while tokenizer.hasMoreTokens():
            tokenizer.advance()
            if tokenizer.current_token != "":
                # print(tokenizer.current_token)
                if tokenizer.tokenType() == "KEYWORD":
                    print("<keyword> ",end="")
                    print(tokenizer.keyWord(),end="")
                    print(" </keyword>",end="")
                if tokenizer.tokenType() == "SYMBOL":
                    print("<symbol> ",end="")
                    print(tokenizer.symbol(),end="")
                    print(" </symbol>",end="")
                if tokenizer.tokenType() == "IDENTIFIER":
                    print("<identifier> ",end="")
                    print(tokenizer.identifier(),end="")
                    print(" </identifier>",end="")
                if tokenizer.tokenType() == "INT_CONST":
                    print("<integerConstant> ",end="")
                    print(tokenizer.intVal(),end="")
                    print(" </integerConstant>",end="")
                if tokenizer.tokenType() == "STRING_CONST":
                    print("<stringConstant> ",end="")
                    print(tokenizer.stringVal(),end="")
                    print(" </stringConstant>",end="")
                print("")
        print("</tokens>")