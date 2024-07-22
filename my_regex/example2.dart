import 'my_regex.dart';

void main(List<String> args) {
  example6();
}

void example6(){
  print(MyRegex.cellMatchRegex.firstMatch("E1")?.group(0));
}

void example5(){
  print(int.parse('1'));
  String formula = "E1";
  print(MyRegex.matchValueInsideParenthesis.firstMatch(formula)?.group(1));
}
void example1() {
  String formula = "SUM(val:val1,val2)";
  RegExp regExp = RegExp(r'\(([^)]+)\)');
  RegExpMatch? match = regExp.firstMatch(formula);
  print(match?.group(1));
}

void example2() {
  String formula = "IFERROr(A1,B4,c4)";
  final regExp = RegExp(r'^[A-Z]+\((.*)\)$', caseSensitive: false);

  final match = regExp.firstMatch(formula);

  if (match != null && match.groupCount > 0) {
    print(match.group(1));
  }
}

void example3() {
  String formula = "DD1633,E2,D17,EE1332:G13";
  RegExp cellRefRegex =
      RegExp(r'[A-Z]+\d+'); // Matches cell references like D16, E12, G13
  RegExp rangeRefRegex =
      RegExp(r'[A-Z]+\d+:[A-Z]+\d+'); // matches ranges D16:E12
  List<String> cellValues = cellRefRegex
      .allMatches(formula)
      .map((e) => e.group(0)!)
      .toList()
    ..remove('');
  print(cellValues);
  print(rangeRefRegex.firstMatch(formula)?.group(0));
}

//RegExp(r'([A-Z]+!)?[A-Z]+\d+:[A-Z]+\d+') mathc sheetname and cell val:cell value
//RegExp(r'[A-Z]+\d+:[A-Z]+\d+') on cell range => :
void example4() {
  String formula = "PCR!DD1633,E2,G13,D17,PCR!EE1332:question_id!G13,A2:B3";
  RegExp rangeRefRegex =
      RegExp(r'([^!,:\s]+!)?[A-Z]+\d+:([^!,:\s]+!)?[A-Z]+\d+');
  RegExp cellRefRegExp = RegExp(r'([^!,:\s]+!)?[A-Z]+\d+');
  rangeRefRegex.allMatches(formula).forEach((E) => print(E.group(0)));
  print('-------------');
  cellRefRegExp.allMatches(formula).forEach((E) => print(E.group(0)));
}


