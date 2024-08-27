void main(List<String> args) {
  print(double.tryParse('  1  '));
}

mixin HasSpeed{
  abstract double speed;
}

mixin CanJump on HasSpeed{
  void jump({required double speed}){

  }
}