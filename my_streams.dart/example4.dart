void main(List<String> args) async {
  await for (var names in allNames2()) {
    print(names);
  }
}

Stream<String> boys() async* {
  yield 'Jhon';
  yield 'rock';
  yield 'lieman';
}

Stream<String> girls() async* {
  yield 'rossie';
  yield 'nara';
  yield 'nami';
}

// one way
Stream<String> allNames() async* {
  await for (var maleName in boys()) {
    yield maleName;
  }
  await for (var femaleName in girls()) {
    yield femaleName;
  }
}

// another better way
Stream<String> allNames2() async* {
  yield* boys();
  yield* girls();
}
