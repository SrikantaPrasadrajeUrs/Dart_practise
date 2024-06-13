void main(List<String> args) {
  final names3Times = getNames().asyncExpand((name) => times3(name));
  // method 1
  // names3Times.listen((val) {
  //   print(val);
  // });
  // method 2
  names3Times.fold('', (prev, nextElement) {
    // print(nextElement);
    return nextElement;
  });
  names = names.expand((ele) => ele is List ? ele : [ele]).toList();
  print(names);
}

Stream<String> getNames() async* {
  yield 'john';
  yield 'johan';
  yield 'ram';
}

Stream<String> times3(String value) => Stream.fromIterable(
      Iterable.generate(3, (_) => value),
    );

List<dynamic> names = [
  ['hi', 'bye'],
  '1',
  '3',
  '5'
];
