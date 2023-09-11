from memory.unsafe import Pointer

fn object_to_int_dont_use_this(base_int:object) -> Int64:
    try:
        var res:Int64 = 0
        var step:Int64 = 1<<60
        var iteration=0
        while base_int!=object(res):
            if object(res)>base_int:
                res-=step
            if object(res)<base_int:
                res+=step
            step=(step>>1)|1
            iteration+=1
        print(iteration)
        return res
    except:
        print("error")
        return 0

fn object_to_string_dont_use_this(base_str:object) -> String:
        var vec = DynamicVector[Int8](1)
        vec.push_back(0)
        let vec_str_ref = StringRef(DTypePointer[DType.int8](vec.data).address, vec.size)
        var result:String=""
        for char in range(base_str.__len__()):
            for i in range(256):
                vec.__setitem__(0,i)
                iteration+=1
                if base_str[char] == object(vec_str_ref):
                    result += vec_str_ref
                    break

