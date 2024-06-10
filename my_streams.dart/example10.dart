void main(List<String> args) async {
  // await for (var nameChar in getNames()) {
  //   print(await getCharacters(nameChar));
  // }
  final result = getNames().asyncMap((name) => getCharacters(name));
  print(r);
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
