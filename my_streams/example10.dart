void main(List<String> args) async {
  // await for (var nameChar in getNames()) {
  //   print(await getCharacters(nameChar));
  // }
  final result = await getNames()
      .asyncMap((name) => getCharacters(name))
      .fold(<String>[], (previous, element) {
    print(element);
    return element;
  });
  // print(result);

  // method 2
  // final result = await getNames().asyncMap((name) => getCharacters(name));
  // result.listen((data) {
  //   print(data);
  // });
}

Stream<String> getNames() async* {
  yield 'john';
  yield 'johan';
  yield 'ram';
}

Future<List<String>> getCharacters(String str) async {
  final characters = <String>[];
  for (final chars in str.split('')) {
    await Future.delayed(const Duration(seconds: 1));
    characters.add(chars);
  }
  return characters;
}
