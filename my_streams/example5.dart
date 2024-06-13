import 'dart:async';

void main(List<String> args) async {
  final controller = StreamController();
  controller.sink.add('any');
  controller.sink.add('way');
  await for (var word in controller.stream) {
    print(word);
  }
  controller.close();
}
