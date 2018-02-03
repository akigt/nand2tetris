import os 
# print(os.getcwd())

from Parser import Parser
from CodeWriter import CodeWriter

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