# Mojo_community-lib
> Community based effort to create libraries/utilities in [Mojo🔥](https://docs.modular.com/mojo/)
## In progress
- magiclist | rd4com
- Quicksort | Lynet101
- shims | ish
# hyperlinks and informations
### [Algorithms/bubble sort](https://github.com/Lynet101/Mojo_community-lib/tree/main/Algorithms/Bubblesort)
### [DynArrayClassic](https://github.com/Lynet101/Mojo_community-lib/blob/main/DataStructures/DArrayClassic/array.mojo)
### [ish/shims](https://github.com/lsh/shims)
  - [X] bitcasting read/write with endian choice
  - [x] Directory path list files
  - [x] siphash/wyhash
  - [x] file read/write with buffered reader/writer
  - [x] libc: dirent, string, stdio!
  - [ ] more to come
### [magiclist](https://github.com/rd4com/mojo-magiclist)
> untyped list
  - [x] conversions both ways native-types/builtin.object
  - [x] builtin.object type checking
  - [x] typed value based deletion in multi type array
  - [x] index based read write with type switching
### [console-style](https://github.com/rd4com/mojo-console-style-print)
  - [x] ansi color/style
### [IO/c-utilities](https://github.com/Lynet101/Mojo_community-lib/blob/main/IO/c-utilities.mojo)
naïve c interop to improve but it works
- [X] read file into string
``` var res:String = CUTIL.read_file("test.txt") ```
- [X] Execute command into string
``` var res:String = CUTIL.exec("ls -lah") ```
### [template python wrapper](https://github.com/Lynet101/Mojo_community-lib/blob/main/IO/snippets/generic_python_wrapper.mojo)
## Ideas
- make tuple
- make dictionary
- python -> mojo type conversion
- object arithmetic implementations, like ``__pow__`` and ``__truediv__``
- better python library import
