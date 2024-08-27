void main(List<String> args) {
 List<int> ans = [1,2,4,2,9,4,5];
 ans.sort((a, b) => b.compareTo(a));
 print(ans);
}

String replaceAllNumbers(String s) {
  RegExp regExp = RegExp(r'\d+');
  s = s.replaceAll(regExp, '');
  return s;
}

String replaceAllChars(String s) {
RegExp regExp = RegExp(r'[A-Za-z]');
  s = s.replaceAll(regExp, '');
  return s;
}

void test1() {
  String formula = "question5678_id!EEER914"; // working   (question_id!E914)
  RegExp regExp = RegExp(r'([^!]+)!([A-Za-z]+\d+)');
  //RegExp(r'([^!]+)!([A-Za-z]+\d+)')
  //RegExp(r'\(([^!]+)!([A-Za-z]+[0-9]+)\)')
  RegExpMatch? match = regExp.firstMatch(formula);
  print(match?.group(1));
  print(match?.group(2));
}

