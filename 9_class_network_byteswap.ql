import cpp

class NetworkByteSwap extends Expr {
  NetworkByteSwap () {
    exists(MacroInvocation mi |
      mi.getMacroName().regexpMatch("nto(hs|hl|hll)")|mi.getExpr()=this
    )
  }
}

from NetworkByteSwap n
select n, "Network byte swap"
