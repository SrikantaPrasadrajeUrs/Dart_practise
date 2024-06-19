import 'dart:isolate';
import 'dart:developer';

typedef FormulaData = (String?, String?, int?);

void main() async {
  ReceivePort receivePort = ReceivePort();
  ReceivePort receivePort1 = ReceivePort();
  await Isolate.spawn(entryPoint, receivePort.sendPort);
  receivePort.listen((data) => print(data));
  await Isolate.spawn(getMessages, receivePort1.sendPort);
  receivePort1.listen((data) => print(data));
}

void entryPoint(SendPort sendPort) {
  Future.delayed(const Duration(seconds: 3), () {
    for (int i = 0; i < 10000; i++) {}
    sendPort.send(('jhfje', []));
  });
}

void _getMessages(SendPort sp) async {
  await for (var now in Stream.periodic(
      const Duration(seconds: 1), (_) => DateTime.now().toIso8601String())) {
    sp.send(now);
  }
}

void getMessages(SendPort sp) async {
  Isolate.spawn(_getMessages, sp);
}

FormulaData? giveSheetNames(String str) {
  RegExp? regExp;
  if (str.contains('ANSWER_BY_ID')) {
    // format1: ANSWER_BY_ID(question_id!E14) - ignore ANSWER_BY_ID,(), sheet name:- question_id range:- E14
    if (str.contains('!')) {
      print('ANSWER_BY_ID and !');
      print("matches ${str}");
      regExp = RegExp(r'\(([^!]+)!([A-Za-z]\d+)\)');
    } else {
      print('ANSWER_BY_ID(E13)');
      // format: ANSWER_BY_ID(E13)
      List<String> vals = str.split('(');
      return (
        null,
        vals[1].split(')').join('')[0],
        int.parse(vals[1].split(')').join('').substring(1))
      );
    }
  } else if (str.contains('!')) {
    print("question_id!range");
    // only sheet name and range
    // format: question_id!E14, sheet name:- question_id range:- E14
    regExp = RegExp(r'([^!]+)!([A-Za-z]+\d+)');
  } else {
    print("only range");
    // only range
    // format: E14 range E14
    regExp = RegExp(r'([A-Za-z]+\d+)');
  }

  RegExpMatch? match = regExp.firstMatch(str);
  // print(match!.groupNames);
  if (match != null) {
    if (match.groupCount >= 2) {
      String? sheetName = match.group(1);
      String? cellRef = match.group(2);
      // Extract the letter and number separately
      String? letter = cellRef?.replaceFirst(RegExp(r'\d+'), '');
      String? number = cellRef?.replaceAll(RegExp(r'[A-Za-z]'), '');
      // Print the extracted sheetName, letter, and number
      // print('Sheet Name: $sheetName, Letter: $letter, Number: $number');
      return (sheetName, letter, int.parse(number ?? ''));
    } else if (match.groupCount == 1) {
      String? cellRef = match.group(1);
      // Extract the letter and number separately
      String? letter = cellRef?.replaceFirst(RegExp(r'\d+'), '');
      String? number = cellRef?.replaceAll(RegExp(r'[A-Za-z]'), '');
      // Print the extracted letter and number
      // print('Letter: $letter, Number: $number');
      return (null, letter, int.parse(number ?? ''));
    }
  } else {
    log('No match found in: $str');
    return null;
  }
  return null;
}
