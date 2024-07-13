/// O: Open/closed principle
/// Sofware entities(classes,function,modules etc)
/// should be open for extension but closed for modification

abstract interface class User {
  void manage();
}

class Admin implements User{
  @override
  void manage(){
    // implmentaion specific to admin
  }
}

class Employee implements User{
  @override
  void manage(){
    // implmentaion specific to Employee
  }
}
class Customer implements User{
  @override
  void manage(){
    // implmentaion specific to Customer
  }
}
class HumanResource implements User{
  @override
  void manage(){
    // implmentaion specific to HumanResource
  }
}

class UserManager{
  void manage(User user){
    user.manage();
  }
}