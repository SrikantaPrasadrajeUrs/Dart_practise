import 'dart:isolate';

void main() async {
  // ReceivePort receivePort = ReceivePort();
  // await Isolate.spawn(entryPoint, receivePort.sendPort);
  // receivePort.listen((data) {
  //   print(data);
  //   receivePort.close();
  // });
  List<String> vals = 'ANSWER_BY_ID(E13)'.split('(');
  String sheetName = vals[0];
  String column = vals[1].split(')').join('')[0];
  String range = vals[1].split(')').join('').substring(1);
  print('sheet name $sheetName column $column range $range');
}

void entryPoint(SendPort sendPort) {
  Future.delayed(const Duration(seconds: 3), () {
    for (int i = 0; i < 10000; i++) {}
    sendPort.send(('jhfje', []));
  });
}
