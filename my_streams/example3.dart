void main(List<String> args) async {
  await for (final val in numbers()) {
    print(val);
  }
  print('-------------------');
  await for (final val in numbers(end: 10, f: isEvenNumber)) {
    print(val);
  }
  print('-------------------');
  await for (final val in numbers(end: 10, f: isOddNumber)) {
    print(val);
  }
}

typedef isIncluded = bool Function(int);
bool isEvenNumber(int val) => val % 2 == 0;
bool isOddNumber(int val) => val % 2 != 0;

Stream<int> numbers({int start = 0, int end = 10, isIncluded? f}) async* {
  for (var i = start; i < end; i++) {
    if (f?.call(i) ?? false == false /** same as f==null||f(i)==true */) {
      yield i;
    }
  }
}
