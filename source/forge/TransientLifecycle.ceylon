shared class TransientLifecycle<Component>()
    satisfies Lifecycle<Component> {

  shared actual Component resolve(Resolver<Component> resolver) {
    return resolver.resolve();
  }
  
}