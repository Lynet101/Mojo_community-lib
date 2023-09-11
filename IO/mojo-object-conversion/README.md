> part of the effort for the community
> https://github.com/Lynet101/Mojo_community-lib
# thanks to @Stole i met the discord server, he discovered thoses ._values and get_as_string
### do not used unusablecode.mojo, it is my previous attempt and is included only for great laugh
# codeV2.mojo is better
```
fn main() raises:
    var obj = object("hello")
    if OW.is_string(obj):
        var str:String = OW.string(obj)
        print(str)

    print("int/float-------")
    obj = object(123)
    if OW.is_int(obj):
        OW.mut_int_to_float(obj)
    if OW.is_float(obj):
        print(OW.float64(obj))

    print("list-----------")
    obj = object([])
    if OW.is_list(obj):
        OW.push_to_list(obj,object(123))
        OW.push_to_list(obj,object("hello"))
        print(obj)
```
# code.mojo
```
#We dont know if this code is stable, dont use it, it is an example and not a library to uses as-is
fn main():
    var o=object(-123)
    var o2:Int64 = object_to_int(o)
    var s=object("hello")
    var s2:String = object_to_string(s)
    print(o2)
    print(s2)
```
