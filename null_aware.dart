
// null aware example
void main(List<String> args) {
  List<String>? nullableList;
  // example 1
  print([...?nullableList]);

  // example 2
  int? number;
  number??=3;

  // example 3
  String? nullableString;
  print(nullableString?.replaceAll("A", "90"));

  // example 4
  int n;
  n = int.tryParse(nullableString??"0")??0;
  print(n);
}