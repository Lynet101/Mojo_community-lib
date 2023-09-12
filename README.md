# Mojo_community-lib
A community driven mojo lib

# Goal

To make a "standard" library including much of the core functionality expected by a high-level-language, but currently missing from Mojo's standard lib (since mojo is quiet new)



# In progress
- Finnish array (when traits become a thing) | Lynet101
- magiclist | rd4com
- Quicksort | Lynet101

# Ideas
- make tuple
- make dictionary
- python -> mojo type conversion
- object arithmetic implementations, like ``__pow__`` and ``__truediv__``
- better python library import

# doc & usages
### IO/c-utilies.mojo
naïve c interop to improve but it works
- [X] read file
``` var res:String = CUTIL.read_file("test.txt") ```
- [X] Execute command
``` var res:String = CUTIL.exec("ls -lah") ```
