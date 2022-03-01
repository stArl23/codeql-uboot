import cpp

from MacroInvocation mi
where mi.getMacroName().regexpMatch("nto(hs|hl|hll)")
select mi
