import 'example6.dart';

void main(List<String> args) async {
  await for (var name in names.capitalized) {
    print(name);
  }
  
  print('===================');
  await for (var name in names.capitalizedUsingMap) {
    print(name);
  }

  print('===================');
  await for (var name in CapitalizedStream(names).capitalized) {
    print(name);
  }

}

extension CapitalizedStream on Stream<String> {
  // this method automatically execute a bind function inside the StreamTranformer type class
  Stream<String> get capitalized => transform(ToUpperCase());
  // directly using map
  Stream<String> get capitalizedUsingMap => map((str) => str.toUpperCase());
}
