class SymbolTable:
    def __init__(self):
        self.table = {}
        # self.static_idx = 0
        # self.field_idx = 0
        # self.arg_idx = 0
        # self.var_idx = 0
        self.idxs = {'static':0,'field':0,'argument':0,'local':0}
    
    def startSubroutine(self):
        self.table = {}
        self.idxs = {'static':0,'field':0,'argument':0,'local':0}
        # self.static_idx = 0
        # self.field_idx = 0
        # self.arg_idx = 0
        # self.var_idx = 0

    def define(self,name,_type,kind):
        self.table[name] = {'type':_type,'kind':kind,'index':self.idxs[kind]}
        #increase table idx
        self.idxs[kind] += 1

    def varCount(self,kind):
        count = 0
        for k,v in self.table.items():
            if v['kind'] == kind:
                count += 1
        return count
    
    def KindOf(self,name):
        return self.table[name]['kind']

    def TypeOf(self,name):
        return self.table[name]['type']

    def IndexOf(self,name):
        return self.table[name]['index']




# st = SymbolTable()
# st.define("x","static","kind")
# st.define("y","static","test")
# print(st.table)
# print(st.varCount("kind"))
# print(st.KindOf('y'))
# print(st.TypeOf('y'))
# print(st.IndexOf('y'))

# st.startSubroutine()
# print(st.table)
# st.varCount("aa")