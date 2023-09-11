> part of the effort for the community
> https://github.com/Lynet101/Mojo_community-lib
### thanks to @Stole i met the discord server, he discovered thoses ._values and get_as_string pointers and came up with a way to convert the object to a string 
> this is not a library to use as-is, have not been tested extensively.
```
var COL=magiclist() #var peoples=magiclist(["foo",1])
print("-------------")
COL.push("something")
var s:String = "ann"
COL[0] = OW.from_string(s)                   #runtime string to builtin.object
let fl:Float64 = 1.0
COL.push(fl)
COL.push(3)
COL.push(True)
for i in range(COL.len()):
    if OW.is_int(COL[i]):                    # type check of untyped value
        let r:Int=OW.to_int(COL[i])          # conversion to typed value
        print(r)
    if OW.is_string(COL[i]):
        let r:String=OW.to_string(COL[i])
        print(r)
    if OW.is_float(COL[i]):
        let r:Float64=OW.to_float64(COL[i])
        print(r)
    if OW.is_bool(COL[i]):
        let r:Bool=OW.to_bool(COL[i])
        print(r)
COL.delete_elements("ann",OW.is_string)      #typed value based deletion
COL.delete(0)
print("-----")
print(COL.data())                            #pave the way for json-like serialisation
```
- [x] typed value searched deletion in multi type array 
- [x] change type
- [x] check type
- [x] convert object to native type
- [x] convert native type to object
- [x] index based deletion 
- [x] initialize/export from/to builtin.object multitype array
# output
```
-------------
ann
1.0
3
True
-----
[3, True]
```

