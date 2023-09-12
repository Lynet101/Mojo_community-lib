from memory import memset_zero
from sys.info import simdwidthof

struct Matrix[T: DType]:

    var data: DTypePointer[T]
    var rows: Int
    var cols: Int
    var allocated: Int

    fn __init__(inout self, rows: Int, cols: Int):
        
        self.data = DTypePointer[T].alloc(0)
        self.rows = rows
        self.cols = cols
        self.allocated = 0

    fn __init__(inout self, cols: Int):
        self.data = DTypePointer[T].alloc(0)
        self.rows = 1
        self.cols = cols
        self.allocated = 0

    fn __del__(owned self):
        if self.allocated == 1:
            self.data.free()

    fn alloc(inout self, fill: Int = 0):
        self.data = DTypePointer[T].alloc(self.size())
        self.allocated = 1
        if fill == 1:
            self.zero()

    fn alloc_zero(inout self):
        self.alloc(1)

    fn zero(inout self):
        memset_zero(self.data, self.rows * self.cols)

    fn set_buf_ptr(inout self, ptr: DTypePointer[T]):
        self.data = ptr

    # set buf ptr with redefined rows, colss
    fn set_buf_ptr(inout self, ptr: DTypePointer[T], rows: Int, cols: Int):
        self.data = ptr
        self.rows = rows
        self.cols = cols

    fn size(self) -> Int:
        return self.cols * self.rows

    @always_inline
    fn __getitem__(self, x: Int) -> SIMD[T, 1]:
        return self.load[1](0, x)

    @always_inline
    fn __getitem__(self, y: Int, x: Int) -> SIMD[T, 1]:
        return self.load[1](y, x)

    @always_inline
    fn load[nelts: Int](self, x: Int) -> SIMD[T, nelts]:
        return self.data.simd_load[nelts](x)

    @always_inline
    fn load[nelts: Int](self, y: Int, x: Int) -> SIMD[T, nelts]:
        return self.data.simd_load[nelts](y * self.cols + x)

    @always_inline
    fn __setitem__(self, x: Int, val: SIMD[T, 1]):
        return self.store[1](0, x, val)

    @always_inline
    fn __setitem__(self, y: Int, x: Int, val: SIMD[T, 1]):
        return self.store[1](y, x, val)

    @always_inline
    fn store[nelts: Int](self, x: Int, val: SIMD[T, nelts]):
        self.data.simd_store[nelts](x, val)

    @always_inline
    fn store[nelts: Int](self, y: Int, x: Int, val: SIMD[T, nelts]):
        self.data.simd_store[nelts](y * self.cols + x, val)

    fn printf[nelts: Int](inout self):
        let value = self.data.simd_load[nelts](0)
        print(value)

# Example to test the Matrix implementation
fn main():
    alias nelts = 5
    var a = Matrix[DType.float32](nelts)
    a.alloc()
    a.printf[nelts]()