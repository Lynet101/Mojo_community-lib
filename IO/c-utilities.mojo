alias CMEM_T = Pointer[SIMD[DType.int8, 1]] #Pointer[UInt8]
struct CMEM:
    var ptr:CMEM_T
    var allocated: Int
    fn __init__(inout self:Self):
        self.allocated = 0
        self.ptr = CMEM_T()
    fn free(inout self):
        if self.allocated>0:
            self.ptr.free()
    fn from_string(inout self:Self,s: String): #produce 0 terminated string
        self.free()
        self.ptr = CMEM_T.alloc(len(s) + 1)
        memcpy(self.ptr, s._as_ptr(), len(s)+1)
        self.ptr.store(len(s), 0) #not filled 0
        self.allocated = len(s)+1
    #update_size_until_find_\0

struct CUTIL:
    #get result of command into string, usefull can do cat file ...
    #can do ls..
    @staticmethod
    fn exec(cmd:String) raises ->String:
        var PERM = CMEM()
        var CMD = CMEM()
        CMD.from_string(cmd)#o2
        PERM.from_string("r")#o3

        var char:Int=-1
        var str_ret:String=""
        var BFR:String="0"
        var BFR_ptr = BFR._as_ptr()

        var FP:CMEM_T = external_call["popen", CMEM_T,CMEM_T](CMD.ptr,PERM.ptr) #o4

        if FP == FP.get_null(): #if FP.__as_index() == 0: ?
            PERM.free()#c2
            CMD.free()
            raise("popen fail")

        while 1==1:
            var char:Int = external_call["fgetc", Int32,CMEM_T](FP).__int__()
            if char == -1:
                break
            BFR_ptr.store(0,char)
            str_ret+=BFR
        external_call["pclose", CMEM_T](FP)#c1
        PERM.free()#c2
        CMD.free()#c3

        #buffer.free()#c4
        return str_ret

    @staticmethod
    fn read_file(cmd:String) raises ->String:
        var PERM = CMEM()
        var CMD = CMEM()
        CMD.from_string(cmd)#o2
        PERM.from_string("r")#o3

        var char:Int=-1
        var str_ret:String=""
        var BFR:String="0"
        var BFR_ptr = BFR._as_ptr()

        var FP:CMEM_T = external_call["fopen", CMEM_T,CMEM_T](CMD.ptr,PERM.ptr) #o4

        if FP == FP.get_null(): #if FP.__as_index() == 0: ?
            PERM.free()#c2
            CMD.free()
            raise("fopen fail")

        while 1==1:
            char = external_call["fgetc", Int32,CMEM_T](FP).__int__()
            #if char == (4294967295):
            if external_call["feof", Int,CMEM_T](FP) != 0:
                break
            BFR_ptr.store(0,char)
            str_ret+=BFR[0]
        external_call["pclose", CMEM_T](FP)#c1
        PERM.free()#c2
        CMD.free()#c3
        #buffer.free()#c4
        return str_ret

fn example_usage_():
    try:
        var res:String = CUTIL.read_file("test.txt")
        #res.__len__() is ok
        print(res)
    except e:
        print(e.value)
    try:
        var res:String = CUTIL.exec("md5sum<<'1234'")
        #res.__len__() == 36, should be 32
        print(res.__len__())
    except e:
        print(e.value)



