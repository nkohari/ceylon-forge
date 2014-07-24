shared class BindingBuilder<Component>(Container container)
    extends Binding<Component>()
    satisfies BindingSyntax<Component> {
  
  shared variable Resolver<Component>? resolver = null;
  shared variable Lifecycle<Component> lifecycle = SingletonLifecycle<Component>();

  shared actual BindingSyntax<Component> to<Actual>() given Actual satisfies Component {
    resolver = ClassResolver<Component, Actual>(container);
    return this;
  }
  
  shared actual BindingSyntax<Component> toInstance(Component instance) {
    resolver = InstanceResolver<Component>(instance);
    return this;
  }
  
  shared actual BindingSyntax<Component> as(LifecycleKind kind) {
    switch (kind)
    case (singleton) {
      lifecycle = SingletonLifecycle<Component>();
    }
    case (transient) {
      lifecycle = TransientLifecycle<Component>();
    }
    return this;
  }
    
  shared actual Component resolve() {
    Resolver<Component>? resolver = this.resolver;
    if (exists resolver) {
      return lifecycle.resolve(resolver);
    }
    else {
      throw Exception("No resolver has been defined on the binding");
    }
  }

}