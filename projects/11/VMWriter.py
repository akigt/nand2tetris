class VMWriter:
    def __init__(self,output):
        self.output = open(output,'w')
        self.idx = 0
    
    def close(self):
        if self.output:
            self.output.close()
            self.output = None
    
    def writePush(self,segment,index):
        if segment == "field":
            segment = "this"
        self.output.write("push {0} {1}".format(segment,index) + "\n")

    def writePop(self,segment,index):
        if segment == "field":
            segment = "this"
        self.output.write("pop {0} {1}".format(segment,index) + "\n")
    
    def writeArithmetic(self,command):
        arithmetic = command
        #binary op
        if command == "+":
            arithmetic = "add"
        if command == "-":
            arithmetic = "sub"
        if command == "*":
            arithmetic = "call Math.multiply 2"
        if command == "/":
            arithmetic = "call Math.divide 2"
        if command == "&amp;":
            arithmetic = "and"
        if command == "|":
            arithmetic = "or"
        if command == "&lt;":
            arithmetic = "lt"
        if command == "&gt;":
            arithmetic = "gt"
        if command == "=":
            arithmetic = "eq"

        # "&amp;","|","&lt;","&gt;

        #unary op
        if command == "unary-":
            arithmetic = "neg"
        if command == "unary~":
            arithmetic = "not"
        self.output.write(arithmetic + "\n")
    
    def writeLabel(self,label):
        self.output.write("label {0}".format(label) + "\n")
    def writeGoto(self,label):
        self.output.write("goto {0}".format(label) + "\n")
    def writeIf(self,label):
        self.output.write("if-goto {0}".format(label) + "\n")

    def writeCall(self,name,nArgs):
        self.output.write("call {0} {1}".format(name,nArgs) + "\n")

    def writeFunction(self,name,nLocals):
        self.output.write("function {0} {1}".format(name,nLocals) + "\n")

    def writeReturn(self):
        self.output.write("return" + "\n")


# vmr = VMWriter("writer_test")
# vmr.writePush("local",1)
# vmr.writeArithmetic("ADD")
# vmr.writeLabel("test")
# vmr.writeGoto("test")
# vmr.writeIf("test")
# vmr.writeFunction("myfuncition",1)
# vmr.writeReturn()
# vmr.writeCall("myfunction",1)
# vmr.close()