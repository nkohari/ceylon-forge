import ceylon.language.meta { typeLiteral }
import ceylon.language.meta.model { Type  }

shared abstract class Resolver<out Component>() {
  shared Type<Component> component = typeLiteral<Component>();
  shared formal Component resolve();
}
