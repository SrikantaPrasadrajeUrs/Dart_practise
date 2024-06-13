void main(List<String> args) async {
  await for (var number in getNumbers()) {
    print(number);
  }

  await for (var name in getNames()) {
    print(name);
  }
}

Stream<int> getNumbers() async* {
  for (int i = 0; i < 10; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}

Stream<String> getNames() async* {
  await Future.delayed(const Duration(seconds: 1));
  yield "hi";
  throw '';
}
