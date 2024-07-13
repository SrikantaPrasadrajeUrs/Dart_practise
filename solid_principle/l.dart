/// L: Liskov substitution principle
/// Objects of super class shall be replaceble with objects of subclass without
/// affecting the correctness of program


abstract class Bird{
  void eat();
}

abstract class Flyable{
  void fly();
}

class Eagle extends Bird implements Flyable{
  @override
  void eat() {
    print("Eagle can eat");
  }

  @override
  void fly(){
   print("Eagle can fly");
  }
}

class Kiwi extends Bird{
  @override
  void eat() {
   print("Kiwi can eat");
  }
}