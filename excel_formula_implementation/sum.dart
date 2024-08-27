import "../my_regex/my_regex.dart";

abstract class MyCustomInbuiltFunctions {
  dynamic sum(
      {required String formula,
      required Map<String, dynamic> currentSheetDataTable,
      required Map<String, dynamic> allSheetDataTable});

  dynamic myIf(
      {required String formula,
      required Map<String, dynamic> currentSheetDataTable,
      required Map<String, dynamic> allSheetDataTable});
}

class SpreadJSInbuiltFunctionsImpl implements MyCustomInbuiltFunctions {
  @override
  dynamic myIf(
      {required String formula,
      required Map<String, dynamic> currentSheetDataTable,
      required Map<String, dynamic> allSheetDataTable}) {
    List<String> details = formula.split(',');
    print(details);
    if (details.length < 2) {
      return "Incorrect Formula";
    } else {
      print('formula: $formula');
      bool result;
      String condition = details[0];
      String ans1 = details[1];
      String ans2 = details.length>2?details[2]:"";
      print("ans1 $ans1 ans2 $ans2");
      RegExp opRegex =
          RegExp(r'[><=]'); // to match condition containing operators
      String? operator = opRegex.firstMatch(condition)?.group(0);
      print("operator: $operator");
      if (operator != null && operator.isNotEmpty) {
        String val1 = condition.split(opRegex)[0];
        String val2 = condition.split(opRegex)[1];
        print("val $val1  $val2");
        if (MyRegex.cellMatchRegex.hasMatch(val1) ||
            MyRegex.cellMatchRegex.hasMatch(val2)) {
          String? operand1 = SpreadJsHelperMethods._getCellValue(
              allSheetDataTable, val1, currentSheetDataTable);
          String? operand2 = SpreadJsHelperMethods._getCellValue(
              allSheetDataTable, val2, currentSheetDataTable);
          print("operands $operand1  $operand2");
          result = SpreadJsHelperMethods._applyOperator(
              double.tryParse(operand1??'0') ?? 0,
              double.tryParse(operand2??'0') ?? 0,
              operator);
          print('result: $result');
          if (result) {
            if (MyRegex.matchAlphabets.hasMatch(ans1)) {
              print("ans1 ${SpreadJsHelperMethods._getCellValue(allSheetDataTable, ans1, currentSheetDataTable)}");
              return SpreadJsHelperMethods._getCellValue(allSheetDataTable, ans1, currentSheetDataTable);
            } else {
              print('ans1: $ans1');
              return ans1;
            }
          } else {
            if (MyRegex.matchAlphabets.hasMatch(ans2)) {
              print("ans2 ${SpreadJsHelperMethods._getCellValue(allSheetDataTable, ans2, currentSheetDataTable)}");
              return SpreadJsHelperMethods._getCellValue(allSheetDataTable, ans2, currentSheetDataTable);
            } else {
              print('ans2: $ans2');
              return ans2;
            }
          }
        }else{

        }
      }
      else if (MyRegex.cellMatchRegex.hasMatch(condition) ||
          MyRegex.sheetNameCellMatchRegex.hasMatch(condition)) {
        //K9 //pcr!D3
        String cellVal = SpreadJsHelperMethods._getCellValue(
            allSheetDataTable, condition, currentSheetDataTable);
        double isGreater = double.tryParse(cellVal) ?? 0;
        if (isGreater > 0) {
          if (MyRegex.matchAlphabets.hasMatch(ans1)) {
            return SpreadJsHelperMethods._getCellValue(
                allSheetDataTable, ans1, currentSheetDataTable);
          } else {
            return ans1;
          }
        } else {
          if (MyRegex.matchAlphabets.hasMatch(ans2)) {
            return SpreadJsHelperMethods._getCellValue(
                allSheetDataTable, ans2, currentSheetDataTable);
          } else {
            return ans2;
          }
        }
      }
      else if (MyRegex.matchNumber.hasMatch(condition) &&
          !MyRegex.matchAlphabets.hasMatch(condition)) {
        double isGreater = double.tryParse(condition) ?? 0;
        if (isGreater > 0) {
          if (MyRegex.matchAlphabets.hasMatch(ans1)) {
            return SpreadJsHelperMethods._getCellValue(
                allSheetDataTable, ans1, currentSheetDataTable);
          } else {
            return ans1;
          }
        } else {
          if (MyRegex.matchAlphabets.hasMatch(ans2)) {
            return SpreadJsHelperMethods._getCellValue(
                allSheetDataTable, ans2, currentSheetDataTable);
          } else {
            return ans2;
          }
        }
      }
    }
  }

  @override
  dynamic sum(
      {required String formula,
      required Map<String, dynamic> currentSheetDataTable,
      required Map<String, dynamic> allSheetDataTable}) {
    if (formula.isEmpty) {
      return 0;
    }

    RegExp cellRefRegex = RegExp(
        r'([^!,:\s]+!)?[A-Z]+\d+'); // Matches cell references like D16, E12, G13
    RegExp rangeRefRegex = RegExp(
        r'([^!,:\s]+!)?[A-Z]+\d+:([^!,:\s]+!)?[A-Z]+\d+'); // matches ranges D16:E12
    RegExp operatorRegex =
        RegExp(r'[+\-*/%]([^!,:\s]+!)?([A-Z]+\d+)?(\d+)?'); // Matches operators

    // Extract operators and operands
    List<String> operators =
        operatorRegex.allMatches(formula).map((e) => e.group(0)!).toList();
    List<String> operands = formula.split(operatorRegex).join('').split(',');

    List<String> cellValues = [];
    List<List<String>> cellRanges = [];

    for (String operand in operands) {
      cellValues
          .addAll(cellRefRegex.allMatches(operand).map((e) => e.group(0)!));
      cellRanges.addAll(
          rangeRefRegex.allMatches(operand).map((e) => e.group(0)!.split(':')));
    }

    cellValues.removeWhere((e) => cellRanges.expand((e1) => e1).contains(e));

    double total = 0;
    Map<String, dynamic> onlyCellValues = {
      for (var item in cellValues) item: '0'
    };

    onlyCellValues.forEach((key, value) {
      if (key.contains('!')) {
        List<String> val = key.split('!');
        String sheetName = val[0];
        String cellValue = val[1];
        int col = CalcDataOperation.charToColumnIndex(
            cellValue.replaceAll(RegExp(r'\d+'), ''));
        int row = CalcDataOperation.charToRowIndex(
            cellValue.replaceAll(RegExp(r'[A-Za-z]'), ''));
        onlyCellValues[key] = allSheetDataTable[sheetName]?['data']
                ?['dataTable']?['$row']?['$col']['value'] ??
            '0';
      } else {
        int col = CalcDataOperation.charToColumnIndex(
            key.replaceAll(RegExp(r'\d+'), ''));
        int row = CalcDataOperation.charToRowIndex(
            key.replaceAll(RegExp(r'[A-Za-z]'), ''));
        onlyCellValues[key] =
            currentSheetDataTable['$row']['$col']['value'] ?? '0';
      }
    });

    for (List<String> innerRange in cellRanges) {
      String? sheetName =
          innerRange[0].contains('!') ? innerRange[0].split('!')[0] : null;
      String startRange = innerRange[0].contains('!')
          ? innerRange[0].split('!')[1]
          : innerRange[0];
      String endRange = innerRange[1].contains('!')
          ? innerRange[1].split('!')[1]
          : innerRange[1];
      int startRow = CalcDataOperation.charToRowIndex(
          startRange.replaceAll(RegExp(r'[A-Za-z]'), ''));
      int endRow = CalcDataOperation.charToRowIndex(
          endRange.replaceAll(RegExp(r'[A-Za-z]'), ''));
      int startCol = CalcDataOperation.charToColumnIndex(
          startRange.replaceAll(RegExp(r'\d+'), ''));
      int endCol = CalcDataOperation.charToColumnIndex(
          endRange.replaceAll(RegExp(r'\d+'), ''));
      for (int row = startRow; row <= endRow; row++) {
        for (int col = startCol; col <= endCol; col++) {
          total += sheetName != null
              ? SpreadJsHelperMethods._getNumberCellValue(
                  allSheetDataTable[sheetName]?['data']?['dataTable'], row, col)
              : SpreadJsHelperMethods._getNumberCellValue(
                  currentSheetDataTable, row, col);
        }
      }
    }

    total += onlyCellValues.values.fold(0.0, (sum, number) {
      if (number.runtimeType == String) {
        return sum + (double.tryParse(number) ?? 0);
      } else {
        return sum + number;
      }
    });
    for (String elem in operators) {
      String operator = elem[0];
      elem = elem.substring(1);
      if (elem.contains('!')) {
        List<String> details = elem.split('!');
        String sheetName = details[0];
        int row = CalcDataOperation.charToRowIndex(
            details[1].replaceAll(RegExp(r'[A-Za-z]'), ''));
        int col = CalcDataOperation.charToRowIndex(
            details[1].replaceAll(RegExp(r'\d+'), ''));
        total = SpreadJsHelperMethods._applyOperator(
            total,
            SpreadJsHelperMethods._getNumberCellValue(
                allSheetDataTable[sheetName]['data']['dataTable'], row, col),
            operator);
      } else {
        if (RegExp(r'[A-Za-z]+\d+').hasMatch(elem)) {
          int row = CalcDataOperation.charToRowIndex(
              elem.replaceAll(RegExp(r'[A-Za-z]'), ''));
          int col = CalcDataOperation.charToRowIndex(
              elem.replaceAll(RegExp(r'[A-Za-z]'), ''));
          total = SpreadJsHelperMethods._applyOperator(
              total,
              SpreadJsHelperMethods._getNumberCellValue(
                  currentSheetDataTable, row, col),
              operator);
        } else {
          total = SpreadJsHelperMethods._applyOperator(
              total, double.tryParse(elem) ?? 0, operator);
        }
      }
    }
    // print("operators $operators");
    // print("cellValue $cellValues");
    // print("cellRange $cellRanges");
    print(total);
    return total;
  }

  dynamic index(
      {required String formula,
      required Map<String, dynamic> currentSheetDataTable,
      required Map<String, dynamic> allSheetDataTable}) {}
//INDEX(F2:F12,MATCH(L2,C2:C12,0))
  dynamic match(
      {required String formula,
      required Map<String, dynamic> currentSheetDataTable,
      required Map<String, dynamic> allSheetDataTable}) {
    if(formula.isEmpty) return '0';
    List<String> formulaDetails = formula.split(',');
    String? cellVal = SpreadJsHelperMethods._getCellValue(allSheetDataTable, formulaDetails[0], currentSheetDataTable);
    if(cellVal!=null){
      String condition = formulaDetails[1];
      String? sheetName;
      String startRange = condition.split(':')[0];
      String endRange = condition.split(':')[1];
      if(MyRegex.matchSheetNameAndCell.hasMatch(startRange)){
        sheetName = startRange.split('!')[0];
      }
      if(sheetName!=null){
        startRange = startRange.split('!')[1];
        endRange = endRange.split('!')[1];
      }

      int col = CalcDataOperation.charToColumnIndex(startRange.replaceAll(MyRegex.matchNumber, ''));
      int startRow = CalcDataOperation.charToRowIndex(startRange.replaceAll(MyRegex.matchAlphabets, ''));
      int endRow = CalcDataOperation.charToRowIndex(startRange.replaceAll(MyRegex.matchAlphabets, ''));
      for(int row = startRow;row<=endRow;row++){
        if(sheetName!=null&&cellVal.isNotEmpty) {
          if(allSheetDataTable[sheetName]['$row']['$col']['value'] == cellVal){
            return row+1;
          }
        }
      }
    }
  }
}

class CalcDataOperation {
  static int charToColumnIndex(String replaceAll) {
    return 0;
  }
  
  static int charToRowIndex(String replaceAll) {
    return 0;
  }
}

class SpreadJsHelperMethods {
  static dynamic _applyOperator(double left, double right, String operator) {
    switch (operator) {
      case '+':
        return left + right;
      case '-':
        return left - right;
      case '*':
        return left * right;
      case '/':
        return left / right;
      case '%':
        return left % right;
      case '=':
        return left == right;
      case '>':
        return left > right;
      case '<':
        return left < right;
      case '<>':
        return left != right;
      default:
        return left;
    }
  }

  static double _getNumberCellValue(
      Map<String, dynamic> dataTable, int row, int col) {
    try {
      return double.tryParse('${dataTable['$row']?['$col']?['value']}') ?? 0;
    } catch (e) {
      log("Error parsing value in class SpreadJSInbuiltFunctionsImpl at row: $row, col: $col - ${e.toString()}");
      return 0;
    }
  }

  // CD2 - sheetName!cd1 - Answer_by_id(cd1||pcr!cd1)
  static dynamic _getCellValue(Map<String, dynamic> allSheetDataTable,
      String formula, Map<String, dynamic> currentSheetDataTable) {
    String? value = formula;
    if (formula.contains(customFormula[0])) {
      value = MyRegex.matchValueInsideParenthesis.firstMatch(formula)?.group(1);
    }else if(MyRegex.cellMatchRegex.hasMatch(formula)){
      value = formula;
    }
    if (value != null&&value.isNotEmpty) {
      if (MyRegex.sheetNameCellMatchRegex.hasMatch(value)) {
        String sheetName = value.split('!')[0];
        value = value.split('!')[1];
        int col = CalcDataOperation.charToColumnIndex(
            value.replaceAll(RegExp(r'\d+'), ''));
        int row = CalcDataOperation.charToColumnIndex(
            value.replaceAll(RegExp(r'[A-Za-z]'), ''));
        return '${allSheetDataTable[sheetName]['$row']['$row']['value']}';
      } else if (MyRegex.cellMatchRegex.hasMatch(value)) {
        // print("value in getCellValue $value");
        int col = CalcDataOperation.charToColumnIndex(
            value.replaceAll(RegExp(r'\d+'), ''));
        int row = CalcDataOperation.charToRowIndex(
            value.replaceAll(RegExp(r'[A-Za-z]+'), ''));
        // print("row: $row col $col");
        // print('${CalcDataOperation.charToColumnIndex(value.replaceAll(RegExp(r'\d+'), ''))} ${CalcDataOperation.charToRowIndex(value.replaceAll(RegExp(r'[A-Za-z]+'), ''))}');
        // print('value ${currentSheetDataTable['$row']}');
        return '${currentSheetDataTable['$row']?['$col']?['value']}';
      }
    }else{
      return formula;
    }
  }
}
