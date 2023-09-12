from python import Python
from python import PythonObject

struct python_wrapper:

    var py_package:PythonObject
    var package_ready:Bool
    var package_name: StringRef

    fn __init__(inout self,package_name:StringRef):
        self.package_name = package_name
        self.package_ready = False

        try:
            self.py_package = Python.import_module(self.package_name)
            self.package_ready = True
        except:
            self.package_ready = False
            print("Failed to import '",self.package_name, "'!!")
    
    # Executes a Python function
    # @param func: The name of the function
    # @return: The result as function type
    fn execute(inout self, func: StringLiteral) -> PythonObject:
        if self.package_ready == False:
            return None
        try:
            return self.py_package.__getattr__(func)
        except:
            return None

#example
fn main() raises:
    var w = python_wrapper("random")    # import python package
    let b = w.execute("randrange")      # retrieve 'random.randrange' function as function type
    if b:                               # check nullable
        print(b(100))                   # execute function with arguments