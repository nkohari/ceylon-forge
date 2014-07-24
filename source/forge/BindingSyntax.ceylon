shared interface BindingSyntax<Component> {
  shared formal BindingSyntax<Component> to<Actual>() given Actual satisfies Component;
  shared formal BindingSyntax<Component> toInstance(Component instance);
  shared formal BindingSyntax<Component> as(LifecycleKind kind);
}