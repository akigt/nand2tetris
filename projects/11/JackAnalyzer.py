
import os 
import sys
import re
import SymbolTabel
import VMWriter

#for tokenizer
BLANK_CHARS = r'\s'
INT = r'\d+'
KEYWORDS = ["class","constructor","function","method","field","static","var",
"int","char","boolean","void","true","false","null","this",
"let","do","if","else","while","return"]
SYMBOLS = "{}()[].,;+-*/&|<>=~"
IDENTIFIER = []

#for compilationEngine
OP = ["+","-","*","/","&amp;","|","&lt;","&gt;","="]

# print(SYMBOLS)
# SEPARATORS = r'\s'

# def writeLine(output_file,l):
#     output_file.write(l)
#     output_file.write("\n")
    
def getValue(s):
    return re.sub(r"\s?<.+?>\s?","",s)

# print(getValue("<aaa> yattaze </aaa>"))


class JackTokenizer:
    def __init__(self, file):
        # self.current_token = ""
        self.idx = 0
        with open(file,'r') as f:
            lines = f.readlines()

        lines_without_comment = []
        comment_flag = 0
        for l in lines:
            # for // type comment
            if l.find("//") != -1:
                comment = l.find("//")
                l = l[:comment]

            # for multi line comment
            if l.find("/**") != -1 and l.find("*/") == -1:
                comment_flag = 1
                continue
            elif comment_flag == 1:
                if l.find("*") != -1:
                    continue
                if l.find("*/") != -1:
                    comment_flag = 0
                    continue

            # for one line comment
            if l.find("/**") != -1:
                continue
            
            # for blank line
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
        if self.current_token == "\"":
            return "&quot;"
        if self.current_token == "&":
            return "&amp;"
        return self.current_token

    def identifier(self):
        return self.current_token
    
    def intVal(self):
        return self.current_token

    def stringVal(self):
        return self.current_token[1:-1]



class CompilationEngine:
    def __init__(self,input,output):
        self.input = input
        self.output = open(output,'w')
        self.idx = 0
    
    def close(self):
        if self.output:
            self.output.close()
            self.output = None
    
    def check(self):
        return self.idx < len(self.input)
    
    def CompileClass(self):
        self.output.write("<class>\n")
        self.output.write(self.input[self.idx] + "\n") # class 
        self.idx += 1
        self.output.write(self.input[self.idx] + "\n") # classname 
        self.idx += 1
        self.output.write(self.input[self.idx] + "\n") # symbol {
        self.idx += 1

        while getValue(self.input[self.idx]) in ["field","static"]:
            self.CompileClassVarDec()
            # print(self.idx)
        while getValue(self.input[self.idx]) in ["constructor","function","method"]:
            self.CompileSubroutine()

        self.output.write(self.input[self.idx] + "\n") # symbol }
        self.output.write("</class>\n")
        return 0

    # for field declaration
    def CompileClassVarDec(self): 
        if not self.check():
            return 

        self.output.write("<classVarDec>\n")
        self.output.write(self.input[self.idx] + "\n") # static or field
        self.idx += 1
        self.output.write(self.input[self.idx] + "\n") # type
        self.idx += 1
        
        while getValue(self.input[self.idx]) != ";":
            self.output.write(self.input[self.idx] + "\n") # varname or ,
            self.idx += 1

        self.output.write(self.input[self.idx] + "\n") # ;
        self.idx += 1
        self.output.write("</classVarDec>\n")
  
        return 0
    
    # for method or something
    def CompileSubroutine(self): 
        if not self.check():
            return

        self.output.write("<subroutineDec>\n")
        self.output.write(self.input[self.idx] + "\n") # constructor method function
        self.idx += 1
        self.output.write(self.input[self.idx] + "\n") # type
        self.idx += 1
        self.output.write(self.input[self.idx] + "\n") # subroutine name
        self.idx += 1
        self.output.write(self.input[self.idx] + "\n") # (
        self.idx += 1

        #paramlist
        self.CompileParameterList()

        self.output.write(self.input[self.idx] + "\n") # )
        self.idx += 1
        
        #subroutine body => var* statements
        self.output.write("<subroutineBody>\n")
        self.output.write(self.input[self.idx] + "\n") # {
        self.idx += 1
        #vardec
        while getValue(self.input[self.idx]) == "var":
            self.CompileVarDec()
        # statements
        self.CompileStatements()

        self.output.write(self.input[self.idx] + "\n") # }
        self.output.write("</subroutineBody>\n")
        self.idx += 1
        self.output.write("</subroutineDec>\n")

        return 0
    
    # for fiedeclaration
    def CompileParameterList(self): 
        if not self.check():
            return
        self.output.write("<parameterList>\n")

        if getValue(self.input[self.idx]) != ")":
            self.output.write(self.input[self.idx] + "\n") # type
            self.idx += 1
            self.output.write(self.input[self.idx] + "\n") # varName
            self.idx += 1
            while getValue(self.input[self.idx]) == ",":
                self.output.write(self.input[self.idx] + "\n") # ,
                self.idx += 1
                self.output.write(self.input[self.idx] + "\n") # type
                self.idx += 1
                self.output.write(self.input[self.idx] + "\n") # varName
                self.idx += 1

        self.output.write("</parameterList>\n")
        return 0
    
    def CompileVarDec(self): 
        if not self.check():
            return

        self.output.write("<varDec>\n")
        self.output.write(self.input[self.idx] + "\n") # var
        self.idx += 1
        self.output.write(self.input[self.idx] + "\n") # type
        self.idx += 1
        self.output.write(self.input[self.idx] + "\n") # varName
        self.idx += 1

        while getValue(self.input[self.idx]) == ",":
            self.output.write(self.input[self.idx] + "\n") # ,
            self.idx += 1
            self.output.write(self.input[self.idx] + "\n") # varName
            self.idx += 1

        self.output.write(self.input[self.idx] + "\n") # ;
        self.idx += 1
        self.output.write("</varDec>\n")
        return 0

    def CompileStatements(self): 
        if not self.check():
            return
        self.output.write("<statements>\n")
        while getValue(self.input[self.idx]) in ["let","if","while","do","return"]:
            if getValue(self.input[self.idx]) == "let":
                self.CompileLet()
            elif getValue(self.input[self.idx]) == "if":
                self.CompileIf()
            elif getValue(self.input[self.idx]) == "while":
                self.CompileWhile()
            elif getValue(self.input[self.idx]) == "do":
                self.CompileDo()
            elif getValue(self.input[self.idx]) == "return":
                self.CompileReturn()

        self.output.write("</statements>\n")

        return 0

    def CompileDo(self): 
        if not self.check():
            return
        self.output.write("<doStatement>\n")

        self.output.write(self.input[self.idx] + "\n") # do
        self.idx += 1

        #subroutine call
        self.output.write(self.input[self.idx] + "\n") # subroutine name or classname
        self.idx += 1 

        if getValue(self.input[self.idx]) == "(":
            self.output.write(self.input[self.idx] + "\n") # (
            self.idx += 1
            #expressionList
            self.CompaileExpressionList()
            self.output.write(self.input[self.idx] + "\n") # )
            self.idx += 1
        elif getValue(self.input[self.idx]) == ".":
            self.output.write(self.input[self.idx] + "\n") # .
            self.idx += 1
            self.output.write(self.input[self.idx] + "\n") # subroutine name
            self.idx += 1
            self.output.write(self.input[self.idx] + "\n") # (
            self.idx += 1
            #expressionList
            self.CompaileExpressionList()
            self.output.write(self.input[self.idx] + "\n") # )
            self.idx += 1

        self.output.write(self.input[self.idx] + "\n") # ;
        self.idx += 1 
        self.output.write("</doStatement>\n")
        return 0

    def CompileLet(self): 
        if not self.check():
            return
        self.output.write("<letStatement>\n")

        self.output.write(self.input[self.idx] + "\n") # let
        self.idx += 1
        self.output.write(self.input[self.idx] + "\n") # varname
        self.idx += 1
        if getValue(self.input[self.idx]) == "[":
            self.output.write(self.input[self.idx] + "\n") # [
            self.idx += 1

            #expression
            self.CompileExpression()
    
            self.output.write(self.input[self.idx] + "\n") # ]
            self.idx += 1
        
        self.output.write(self.input[self.idx] + "\n") # =
        self.idx += 1
        #expression
        self.CompileExpression()
        self.output.write(self.input[self.idx] + "\n") # ;
        self.idx += 1

        self.output.write("</letStatement>\n")
        return 0

    def CompileWhile(self): 
        if not self.check():
            return
        self.output.write("<whileStatement>\n")

        self.output.write(self.input[self.idx] + "\n") # while
        self.idx += 1

        self.output.write(self.input[self.idx] + "\n") # (
        self.idx += 1
        #expression
        self.CompileExpression()
        self.output.write(self.input[self.idx] + "\n") # )
        self.idx += 1

        self.output.write(self.input[self.idx] + "\n") # {
        self.idx += 1
        #statement
        self.CompileStatements()
        self.output.write(self.input[self.idx] + "\n") # }
        self.idx += 1

        self.output.write("</whileStatement>\n")
        return 0

    def CompileReturn(self): 
        if not self.check():
            return
        self.output.write("<returnStatement>\n")

        self.output.write(self.input[self.idx] + "\n") # return
        self.idx += 1

        if getValue(self.input[self.idx]) != ";": #expression? if not ";"
            #expression
            self.CompileExpression()

        self.output.write(self.input[self.idx] + "\n") # ;
        self.idx += 1

        self.output.write("</returnStatement>\n")
        return 0

    def CompileIf(self): 
        if not self.check():
            return
        
        self.output.write("<ifStatement>\n")

        self.output.write(self.input[self.idx] + "\n") # if
        self.idx += 1

        self.output.write(self.input[self.idx] + "\n") # (
        self.idx += 1
        #expression
        self.CompileExpression()
        self.output.write(self.input[self.idx] + "\n") # )
        self.idx += 1

        self.output.write(self.input[self.idx] + "\n") # {
        self.idx += 1
        #statement
        self.CompileStatements()
        self.output.write(self.input[self.idx] + "\n") # }
        self.idx += 1

        #for else 
        if getValue(self.input[self.idx]) == "else":
            self.output.write(self.input[self.idx] + "\n") # else
            self.idx += 1
            self.output.write(self.input[self.idx] + "\n") # {
            self.idx += 1

            #statement
            self.CompileStatements()
    
            self.output.write(self.input[self.idx] + "\n") # }
            self.idx += 1

        self.output.write("</ifStatement>\n")
        return 0

    def CompileExpression(self): 
        if not self.check():
            return
        self.output.write("<expression>\n")
        self.CompileTerm()
        while getValue(self.input[self.idx]) in OP:
            self.output.write(self.input[self.idx] + "\n") # OP
            self.idx += 1
            self.CompileTerm()
        self.output.write("</expression>\n")
        return 0

    def CompileTerm(self): 
        if not self.check():
            return
        self.output.write("<term>\n")

        # (expression)
        if getValue(self.input[self.idx]) in "(":
            self.output.write(self.input[self.idx] + "\n") # (
            self.idx += 1
            #expression
            self.CompileExpression()
            self.output.write(self.input[self.idx] + "\n") # )
            self.idx += 1
        # unaryOP term
        elif getValue(self.input[self.idx]) in "-~":
            self.output.write(self.input[self.idx] + "\n") # unary OP
            self.idx += 1
            #term
            self.CompileTerm()
        # varname [ expression ]
        elif getValue(self.input[self.idx + 1]) in "[":
            self.output.write(self.input[self.idx] + "\n") # varname
            self.idx += 1
            self.output.write(self.input[self.idx] + "\n") # [
            self.idx += 1
            #expression
            self.CompileExpression()
            self.output.write(self.input[self.idx] + "\n") # ]
            self.idx += 1
        # subroutine call
        elif getValue(self.input[self.idx + 1]) in "(.":
            self.output.write(self.input[self.idx] + "\n") # class or subroutine name
            self.idx += 1
            if getValue(self.input[self.idx]) == "(":
                self.output.write(self.input[self.idx] + "\n") # (
                self.idx += 1
                #expressionList
                self.CompaileExpressionList()
                self.output.write(self.input[self.idx] + "\n") # )
                self.idx += 1
            elif getValue(self.input[self.idx]) == ".":
                self.output.write(self.input[self.idx] + "\n") # .
                self.idx += 1
                self.output.write(self.input[self.idx] + "\n") # subroutine name
                self.idx += 1
                self.output.write(self.input[self.idx] + "\n") # (
                self.idx += 1
                #expressionList
                self.CompaileExpressionList()
                self.output.write(self.input[self.idx] + "\n") # )
                self.idx += 1
        #for constant
        else:
            self.output.write(self.input[self.idx] + "\n") # constant
            self.idx += 1

        self.output.write("</term>\n")
        return 0
    
    def CompaileExpressionList(self): 
        if not self.check():
            return
        self.output.write("<expressionList>\n")
        if getValue(self.input[self.idx]) != ")": # ) is end of explist
            #expression
            self.CompileExpression()
            while getValue(self.input[self.idx]) == ",":
                self.output.write(self.input[self.idx] + "\n") #,
                self.idx += 1
                #expression
                self.CompileExpression()
        self.output.write("</expressionList>\n")

        return 0

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
    # print(source)

    for input_file in source:
        tokenizer = JackTokenizer(input_file)
        # print(tokenizer.hasMoreTokens())
        tokenizer_output = []
        # tokenizer_output.append("<tokens>")
        # print("<tokens>")
        while tokenizer.hasMoreTokens():
            tokenizer.advance()
            if tokenizer.current_token != "":
                # print(tokenizer.current_token)
                # token_with_xml = ""
                if tokenizer.tokenType() == "KEYWORD":
                    tokenizer_output.append("<keyword> {0} </keyword>".format(tokenizer.keyWord()))
                if tokenizer.tokenType() == "SYMBOL":
                    tokenizer_output.append("<symbol> {0} </symbol>".format(tokenizer.symbol()))
                if tokenizer.tokenType() == "IDENTIFIER":
                    tokenizer_output.append("<identifier> {0} </identifier>".format(tokenizer.identifier()))
                if tokenizer.tokenType() == "INT_CONST":
                    tokenizer_output.append("<integerConstant> {0} </integerConstant>".format(tokenizer.intVal()))
                if tokenizer.tokenType() == "STRING_CONST":
                    tokenizer_output.append("<stringConstant> {0} </stringConstant>".format(tokenizer.stringVal()))
                # tokenizer_output.append(token_with_xml)
        # tokenizer_output.append("</tokens>")
        # print("\n".join(tokenizer_output)) #intermediate xml file


        output_file = input_file[:-5] + ".xml"
        print("output:  " + output_file)
        # exit()
        ce = CompilationEngine(tokenizer_output,output_file)

        ce.CompileClass()
            
        ce.close()
        #     print(i + "yattaze")
        # print(compilation_engine.output)