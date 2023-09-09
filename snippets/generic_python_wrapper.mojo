from python import Python
from python import PythonObject

struct python_wrapper:
    var py_package:PythonObject
    var py_function:PythonObject
    var package_ready:Bool
    var function_result:PythonObject
    var function_success: Bool
    var package_name: StringRef
    var function_name: StringLiteral
    fn __init__(inout self,package_name:StringRef,function_name:StringLiteral):
        self.package_name = package_name
        self.function_name = function_name
        self.package_ready = False
        self.function_result = PythonObject()
        self.py_function = PythonObject()
        self.function_success = False
        try:
            self.py_package = Python.import_module(self.package_name)
            self.py_function = self.py_package.__getattr__(self.function_name)
            self.package_ready = True
        except:
            self.package_ready = False
            print("fail:",self.package_name,self.function_name)

    fn execute(inout self):
        self.function_success = False
        if self.package_ready == False:
            self.function_success = False
            return
        try:
            self.function_result = self.py_function()
            self.function_success = True

        except:
            self.function_success = False

#example
#fn main():
#    var w = python_wrapper("random","random")
#    w.execute()
#    if w.function_success:
#        var x:Float64 = w.function_result.to_float64()
#        print(w.function_result)
