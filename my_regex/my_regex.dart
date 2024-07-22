class MyRegex{
  static var cellMatchRegex = RegExp(r'[A-Z]+\d+');// match cell CD1
  static var sheetNameCellMatchRegex = RegExp(r'([^!,:\s]+!)[A-Z]+\d+'); //match sheetname and cell
  static var matchNumber = RegExp(r'\d+');
  static var matchAlphabets = RegExp(r'[A-Za-z]+');
  static var matchValueInsideParenthesis = RegExp(r'^[^\(]*\((.+)\)$');
  static var matchSheetNameAndCell = RegExp(r'([^!,:\s]+!)[A-Z]+\d+');

  static RemovedParenthesis removeParenthesis(String formula) {
    RegExp regExp = RegExp(r'\((.*)\)$');
    return (regExp.hasMatch(formula),regExp.firstMatch(formula)?.group(1));
  }
}
typedef RemovedParenthesis = (bool,String?);