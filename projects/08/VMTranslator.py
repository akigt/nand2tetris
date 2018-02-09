import os 
import sys
from Parser import Parser
from CodeWriter import CodeWriter

# clean output code by removing unnecessary tabs
def asm_cleaner(file_name):
    output = []
    # read file
    with open(file_name,"r") as f:
        for line in f:
            output.append(line.lstrip())
    # rewrite file
    with open(file_name,"w") as f:
        for line in output:
            f.write(line)



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
        vm_files = filter(lambda f: f[-3:] == ".vm",files)
        vm_files_with_path = list(map(lambda f: os.path.join(args[1],f),vm_files))
        
        source = list(vm_files_with_path)

        dir_name = os.path.relpath(args[1])
        dir_tail = os.path.split(dir_name)[1]
        output_file = os.path.join(dir_name,dir_tail + ".asm")
    else:
        source = [args[1]]
        output_file = args[1][:-2] + "asm"

    print("output:  " + output_file)
    cw = CodeWriter(output_file)

    if os.path.isdir(args[1]):
        cw.writeInit()

    for f in source: #get all vm_files from source dir or file
        
        cw.setFileName(os.path.split(f)[1])
        print("now parsing...  " + cw.file_name)
        p = Parser(f)

        while p.hasMoreCommands():
            if p.commandType() == "C_ARITHMETIC":
                command = p.arg1()
                cw.writeArithmetic(command)
            if p.commandType() in ["C_POP","C_PUSH"]:
                command = p.commandType()
                segment = p.arg1()
                index = p.arg2()
                cw.writePushPop(command,segment,index)
            if p.commandType() == "C_LABEL":
                cw.writeLabel(p.arg1())
            if p.commandType() == "C_GOTO":
                cw.writeGoto(p.arg1())
            if p.commandType() == "C_IF":
                cw.writeIf(p.arg1())
            if p.commandType() == "C_FUNCTION":
                cw.writeFunction(p.arg1(),p.arg2())
            if p.commandType() == "C_CALL":
                cw.writeCall(p.arg1(),p.arg2())
            if p.commandType() == "C_RETURN":
                cw.writeReturn()

            #let's go to next step
            p.advance()

    cw.close()

    asm_cleaner(output_file) #コード整形用