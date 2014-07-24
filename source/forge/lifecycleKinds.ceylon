shared abstract class LifecycleKind(shared String name)
  of singleton | transient {}

shared object singleton extends LifecycleKind("singleton") {}
shared object transient extends LifecycleKind("transient") {}
 