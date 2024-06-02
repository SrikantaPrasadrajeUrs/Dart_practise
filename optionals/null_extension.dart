void main(List<String> args) {
  List<String>? vals;
  vals.describe();
}

extension Describe on Object? {
  void describe() {
    if (this == null) {
      print("This object is null");
    } else {
      print('Object runtime type: ${this.runtimeType}');
    }
  }
}
