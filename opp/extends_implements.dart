abstract class Vehicle{
  String makeSound(){
    return "someSound";
  }
}


// cumpulsory we have to implement
class Car implements Vehicle{
  @override
  String makeSound() {
    return "Vroom";
  }
}

class Auto implements Vehicle{
  @override
  String makeSound() {
    return "tuk tuk";
  }
}

// not cumpulsory to implement already implemented method
class Bike extends Vehicle{

}


