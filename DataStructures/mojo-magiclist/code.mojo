struct OW:
    @staticmethod
    def to_i64(o:object)->Int64: #SIMD[DType.int64,1]
        return o._value.get_as_int().to_int()
    @staticmethod
    def to_int(o:object)->Int: #SIMD[DType.int64,1]
        return o._value.get_as_int().to_int()
    @staticmethod
    def to_bool(o:object)->Bool:
        return o._value.get_as_bool()
    @staticmethod
    def to_float64(o:object)->SIMD[DType.float64,1]:
        return o._value.get_as_float()
    @staticmethod
    def to_string(o:object)->String:
        var t = o._value.get_as_string()
        let p = Pointer[SIMD[DType.int8, 1]].alloc(t.length)
        memcpy(p, t.data, t.length)
        _ = o
        _ = t
        return String(p, t.length)
    @staticmethod
    def mut_int_to_float(inout o:object):
        if o._value.is_int():
            o = o._value.convert_int_to_float()
    @staticmethod
    fn is_float(o:object)->Bool:
        return o._value.is_float()
    @staticmethod
    def is_func(o:object):
        return o._value.is_func()
    @staticmethod
    def is_int(o:object):
        return o._value.is_int()
    @staticmethod
    def is_list(o:object):
        return o._value.is_list()
    @staticmethod
    def is_string(o:object):
        return o._value.is_str()
    @staticmethod
    def is_bool(o:object):
        return o._value.is_bool()
    @staticmethod
    def is_none(o:object):
        return o._value.is_none()
    @staticmethod
    def get_type_id(o:object)->Int:
        return o._value.get_type_id()
    @staticmethod
    def push_to_list(inout o:object,o2:object):
        if OW.is_list(o):
            o.append(o2)
    @staticmethod
    def get_list_object()->object:
        return object([])
    @staticmethod
    def from_string(arg:String)->object:
        var o = object("")
        for i in range(len(arg)):
        	o = o + "1"
        var t = o._value.get_as_string()
        #let p = Pointer[SIMD[DType.int8, 1]].alloc(t.length)
        memcpy(t.data, arg._as_ptr(), len(arg))
        _=arg
        return o
struct magiclist:
	var o:object
	def __init__(inout self):
		self.o=object([])
	def __init__(inout self,o:object):
		if OW.is_list(o):
			self.o = o
		else:
			self.o=object([])
	def __getitem__(inout self,o2:object) -> object:
		return self.o[o2] #check bound
	def __setitem__(inout self,o2:object,o3:object):
		self.o[o2] = o3 #check bound
	@staticmethod
	def new():
		return object([])
	def len(inout self)->Int:
		return OW.to_int(self.o.__len__())
	def push(inout self,o:object):
		self.o.append(o)
	def data(inout self):
		return self.o
	def delete_elements(inout self,e,func:fn(owned object) raises -> object):
		try:
			var tmp=object([])
			var i=0
			while(i<self.len()):
				if func(self.o[i])==True:
					if self.o[i]!=e:
						tmp.append(self.o[i])
				else:
					tmp.append(self.o[i]) 
				i+=1
			self.o = tmp
		except:
			print("error comparing different types")
	def delete(inout self,idx):
		self.o[idx] = object(None)
		self.sync()
	def sync(inout self):
		var tmp=object([])
		var i=0
		while(i<self.len()):
			if OW.is_none(self.o[i])==False:
				tmp.append(self.o[i])
			i+=1
		self.o = tmp
