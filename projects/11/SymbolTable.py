class SymbolTable:
    def __init__(self):
        self.table = {}
        self.static_idx = 0
        self.field_idx = 0
        self.arg_idx = 0
        self.var_idx = 0
    
    def startSubroutine(self):
        self.table = {}
        self.static_idx = 0
        self.field_idx = 0
        self.arg_idx = 0
        self.var_idx = 0

    def define(self,name,type,kind):
        self.table[name] = {'type':type,'kind':kind,'index':0}

    def varCount(self,kind):
        count = 0
        for k,v in self.table.items():
            if v['kind'] == kind:
                count += 1
        return count
    
    def KindOf(self,name):
        return st.table[name]['kind']

    def TypeOf(self,name):
        return st.table[name]['type']

    def IndexOf(self,name):
        return st.table[name]['index']




st = SymbolTable()
st.define("x","static","kind")
st.define("y","static","test")
print(st.table)
print(st.varCount("kind"))
print(st.KindOf('y'))
print(st.TypeOf('y'))
print(st.IndexOf('y'))

st.startSubroutine()
print(st.table)
st.varCount("aa")