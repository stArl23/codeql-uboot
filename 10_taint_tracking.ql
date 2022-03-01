import cpp
import semmle.code.cpp.dataflow.TaintTracking
import DataFlow::PathGraph

class NetworkByteSwap extends Expr {
  // TODO: copy from previous step
}

class Config extends TaintTracking::Configuration {
  Config() { this = "NetworkToMemFuncLength" }

  override predicate isSource(DataFlow::Node source) {
    exists(MacroInvocation mi |
      mi.getMacroName().regexpMatch("nto(hs|hl|hll)")|mi.getExpr()=source.asExpr()
    )
  }
  override predicate isSink(DataFlow::Node sink) {
    sink.asExpr().(FunctionCall).getTarget().getQualifiedName()="memcpy"
  }
}

from Config cfg, DataFlow::PathNode source, DataFlow::PathNode sink
where cfg.hasFlowPath(source, sink)
select sink, source, sink, "Network byte swap flows to memcpy"
