/// I: Interface segrigation priciple
/// No Client should be forced to depend on methods it does not use


abstract class Phone{
  void call();
}

abstract class WirelessCommunication{
  void wirelessConnection();
}

class SmartPhone extends Phone implements WirelessCommunication{
  @override
  void call() {
    print("Calling..");
  }

  @override
  void wirelessConnection(){
   print("True wireless");
  }
}

class TelePhone extends Phone{
  @override
  void call() {
   print("Calling...");
  }
}