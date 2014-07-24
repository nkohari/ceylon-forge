interface Weapon {
  shared formal String strike(String target);
}

abstract class Warrior(shared Weapon weapon) {
  shared String attack(String target) {
    return weapon.strike(target);
  }
}

class Samurai(Weapon weapon) extends Warrior(weapon) {}
class Katana() satisfies Weapon {
  shared actual String strike(String target) {
    return "``target`` is sliced in twain!";
  }
}

shared void run() {
  value container = Container();
  
  container.bind<Weapon>().to<Katana>().as(transient);
  container.bind<Warrior>().to<Samurai>().as(singleton);
  
  value warrior = container.get<Warrior>();
  print(warrior.attack("the enemy"));
}
