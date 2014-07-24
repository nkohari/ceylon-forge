class InstanceResolver<Component>(Component instance)
    extends Resolver<Component>() {

  shared actual Component resolve() => instance;
  
}