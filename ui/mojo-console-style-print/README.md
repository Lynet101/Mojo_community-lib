# some console styling
> part of the effort for the community
> https://github.com/Lynet101/Mojo_community-lib
```
fn main():
    var t=pp_()
    
    t["clr"] #clear screen
    t["fgblack"]
    t["bgwhite"]
    t | "mojo"
    t["fgwhite"]
    t["bgblack"]
    t | "rocks"
    t["reset"]
    t["fgred"]
    t["bold_on"]
    t["slow_blink"]
    t | "!!!"
    t["reset"]
   
    t() #newline
    t | "normal"
```
# doc
> bg is background and fg is foreground,clr clear the screen and reset put back everything to normal
### use t | String(123) for the numbers and t() for new line
- reset
- clr
- bold_on
- bold_off
- italic_on
- italic_off
- underline_on
- underline_off
- slow_blink
- fast_blink
- blink_off
- invert
- fgblack
- fgred
- fgreen
- fgyellow
- fgblue
- fgpurple
- fgcyan
- fgwhite
- bgblack
- bgred
- bgreen
- bgyellow
- bgblue
- bgpurple
- bgcyan
- bgwhite
