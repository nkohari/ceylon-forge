import ceylon.collection { HashMap }
import ceylon.language.meta { typeLiteral, type }
import ceylon.language.meta.model { Type }

shared class Container() {
  
  value bindings = HashMap<Type, Binding<Anything>>();
  
  shared BindingSyntax<Component> bind<Component>() {
    value component = typeLiteral<Component>();
    value binding = BindingBuilder<Component>(this);
    bindings.put(component, binding);
    return binding;
  }
  
  shared Component get<Component>() {
    value component = typeLiteral<Component>();
    Anything result = resolve(component);
    if (is Component result) {
      return result;
    }
    else {
      throw Exception("An instance of an incompatible type ``type(result)`` was resolved for ``component``");
    }
  }
  
  shared Anything resolve(Type<Anything> component) {
    value binding = bindings.get(component);
    if (exists binding) {
      return binding.resolve();
    }
    else {
      throw Exception("No available binding for component ``component``");
    }
  }
  
}