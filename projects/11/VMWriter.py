class VMWriter:
    def __init__(self,output):
        self.output = open(output,'w')
        self.idx = 0
    
    def close(self):
        if self.output:
            self.output.close()
            self.output = None
    
    def writePush(self,segment,index):
        self.output.write("push {0} {1}".format(segment,index) + "\n")

    def writePop(self,segment,index):
        self.output.write("pop {0} {1}".format(segment,index) + "\n")
    
    def writeArithmetic(self,command):
        self.output.write(command + "\n")
    
    def writeLabel(self,label):
        self.output.write("label {0}".format(label) + "\n")
    def writeGoto(self,label):
        self.output.write("goto {0}".format(label) + "\n")
    def writeIf(self,label):
        self.output.write("if-goto {0}".format(label) + "\n")

    def writeCall(self,name,nArgs):
        self.output.write("call {0} {1}".format(name,nArgs) + "\n")

    def writeFunction(self,name,nLocals):
        self.output.write("call {0} {1}".format(name,nLocals) + "\n")

    def writeReturn(self):
        self.output.write("return" + "\n")


vmr = VMWriter("writer_test")
vmr.writePush("local",1)
vmr.writeArithmetic("ADD")
vmr.writeLabel("test")
vmr.writeGoto("test")
vmr.writeIf("test")
vmr.writeFunction("myfuncition",1)
vmr.writeReturn()
vmr.writeCall("myfunction",1)
vmr.close()