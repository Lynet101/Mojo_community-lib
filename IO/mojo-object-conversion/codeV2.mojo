struct OW:
    @staticmethod
    def i64(o:object)->SIMD[DType.int64,1]:
        return o._value.get_as_int()
    @staticmethod
    def bool(o:object)->Bool:
        return o._value.get_as_bool()
    @staticmethod
    def float64(o:object)->SIMD[DType.float64,1]:
        return o._value.get_as_float()
    @staticmethod
    def string(o:object)->String:
        var t = o._value.get_as_string()
        let p = Pointer[SIMD[DType.int8, 1]].alloc(t.length)
        memcpy(p, t.data, t.length)
        _ = o
        _ = t #extended the "duration" of the object up to here
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
    #def __getitem__(inout self,rhs: object)->OW:
        #return OW(self.o[rhs])

