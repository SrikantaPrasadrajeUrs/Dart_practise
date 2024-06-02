void main(List<String> args) {
  example4();
}

void example1() {
  List<String>? values;
  print(values?.length);
}

void example2() {
  String? val1;
  val1 ??= 'hi';
  print(val1);
}

void example3() {
  String? val1;
  val1 = val1 ?? 'hi';
  print(val1);
}

typedef StringInt = (String, int);

void example4() {
  List<StringInt?>? names = [('', 1), null];
  List? names1 = [];
  names1?.add('hi');
  print(names1);
}

void example5() {
  List<String>? lastNames;
  if (lastNames?.contains('prasad') ?? false) {
    print('hi');
  } else {
    print('bye');
  }
}
