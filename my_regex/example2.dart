void main(List<String> args) {
  String formula = "IFERROr(A1,B4,c4)";
  final regExp = RegExp(r'^[A-Z]+\((.*)\)$', caseSensitive: false);

  // Apply the regular expression
  final match = regExp.firstMatch(formula);

  if (match != null && match.groupCount > 0) {
    // print the extracted values which are found inside parenthesis
     print(match.group(1));
  }
}
