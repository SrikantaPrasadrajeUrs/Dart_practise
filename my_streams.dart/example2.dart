// async expand
void main(List<String> args) async {
  // if we wanna produce stream from stream use asyncExpand
  // await for (var namesChars
  //     in getNames().asyncExpand((name) => getCharacter(name))) {
  //   print(namesChars);
  // }
  // final sum = getAllAges().reduce(combine)

  final sum = await getAllAges().reduce(add);
  print(sum);
}

T add<T extends num>(T t1,T t2) {
  return (t1+t2) as T;
}

Stream<int> getAllAges() async* {
  yield 10;
  yield 20;
  yield 30;
  yield 40;
  yield 50;
  yield 60;
}

Stream<String> getCharacter(String names) async* {
  for (int i = 0; i < names.length; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield names[i];
  }
}

Stream<String> getNames() async* {
  await Future.delayed(const Duration(seconds: 1));
  yield "hi";
  await Future.delayed(const Duration(seconds: 1));
  yield "Demo1";
}
