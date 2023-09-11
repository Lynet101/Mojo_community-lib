struct pp_:
    fn __init__(inout self):
        _ = 1
    fn __add__(self:Self,rhs:String):
        try:
            print_no_newline(rhs)
        except:
            print("bug")
    #@parameter
    fn __or__(self:Self,rhs:String):
        try:
            print_no_newline(rhs)
        except:
            print("bug")
    fn found(self,arg: String):
        print_no_newline(chr(27))
        print_no_newline(arg)

    fn __getitem__(self:Self,arg:String):
        if arg == "reset":
            self.found("[0m")
            return
        if arg == "clr":
            self.found("[2J")
            return
        if arg == "bold_on":
            self.found("[1m")
            return
        if arg == "bold_off":
            self.found("[2m")
            return
        if arg == "italic_on":
            self.found("[3m")
            return
        if arg == "italic_off":
            self.found("[23m")
            return
        if arg == "underline_on":
            self.found("[4m")
            return
        if arg == "underline_off":
            self.found("[24m")
            return
        if arg == "slow_blink":
            self.found("[5m")
            return
        if arg == "fast_blink":
            self.found("[6m")
            return
        if arg == "blink_off":
            self.found("[25m")
            return
        if arg == "invert":
            self.found("[27m")
            return
        if arg == "fgblack":
            self.found("[0;30m")
            return
        if arg == "fgred":
            self.found("[0;31m")
            return
        if arg == "fgreen":
            self.found("[0;32m")
            return
        if arg == "fgyellow":
            self.found("[0;33m")
            return
        if arg == "fgblue":
            self.found("[0;34m")
            return
        if arg == "fgpurple":
            self.found("[0;35m")
            return
        if arg == "fgcyan":
            self.found("[0;36m")
            return
        if arg == "fgwhite":
            self.found("[0;37m")
            return
        if arg == "bgblack":
            self.found("[40m")
            return
        if arg == "bgred":
            self.found("[41m")
            return
        if arg == "bgreen":
            self.found("[42m")
            return
        if arg == "bgyellow":
            self.found("[43m")
            return
        if arg == "bgblue":
            self.found("[44m")
            return
        if arg == "bgpurple":
            self.found("[45m")
            return
        if arg == "bgcyan":
            self.found("[46m")
            return
        if arg == "bgwhite":
            self.found("[47m")
            return
    fn __call__(self:Self):
        print("")
