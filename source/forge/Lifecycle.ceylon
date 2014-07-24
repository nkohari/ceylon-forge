shared interface Lifecycle<Component> {
  shared formal Component resolve(Resolver<Component> resolver);
}