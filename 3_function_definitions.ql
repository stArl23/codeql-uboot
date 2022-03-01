import cpp

from Function f
where f.getName()="strlen"
select f,"a function "+f.getName()+" is called"

// from FunctionCall fc,Function f
// where fc.getTarget()=f and f.getQualifiedName()="strlen"
// select f,"a function "+f.getName()+" is called"