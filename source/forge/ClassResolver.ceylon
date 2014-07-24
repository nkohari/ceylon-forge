import ceylon.language.meta { typeLiteral }
import ceylon.language.meta.model { Type, Class }

shared class ClassResolver<Component, Actual>(Container container)
    extends Resolver<Component>() 
    given Actual satisfies Component {
  
  shared Class<Actual> actual;
  shared [Type<Anything>*] dependencies;
  
  Type<Actual> target = typeLiteral<Actual>();
  if (is Class<Actual> target) {
    actual = target;
    dependencies = target.parameterTypes;
  }
  else {
    throw Exception("Cannot bind to non-Class type ``target``");
  }
  
  shared actual Actual resolve() {
    return actual.apply(for (d in dependencies) container.resolve(d));
  }
  
}