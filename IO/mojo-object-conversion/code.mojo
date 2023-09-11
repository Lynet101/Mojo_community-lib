fn object_to_int(base_int:object) -> Int:
    try:
        return base_int._value.get_as_int().to_int()
    except:
        print("error")
        return 0
fn object_to_string(base_str:object)->String:
    var t = base_str._value.get_as_string()
    let p = Pointer[SIMD[DType.int8, 1]].alloc(t.length)
    memcpy(p, t.data, t.length)
    _=base_str
    let x = String(p, t.length)
    #base_str.__del__()
    _= t
    return x
