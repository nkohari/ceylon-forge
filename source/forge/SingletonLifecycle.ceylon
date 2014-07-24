shared class SingletonLifecycle<Component>()
    satisfies Lifecycle<Component> {
  
  variable Component? instance = null;

  shared actual Component resolve(Resolver<Component> resolver) {
    Component? existing = this.instance;
    if (exists existing) {
      return existing;
    }
    else {
      Component instance = resolver.resolve();
      this.instance = instance;
      return instance;
    }
  }
  
}