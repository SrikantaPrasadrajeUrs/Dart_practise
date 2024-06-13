import 'dart:async';

void main(List<String> args) async {
  await for (var name in getControllerStream()) {
    print(name);
  }
  // broadCast stream multiple listners
  // await nonBroadcastStreamExample();
}

Stream<String> getControllerStream() async* {
  final controller = StreamController<String>();

  controller.sink.add('hi');
  controller.sink.add('bye');
  controller.sink.add('variable');
  yield* await controller.stream;
}

Future<void> nonBroadcastStreamExample() async {
  final controller = StreamController<String>();

  controller.sink.add('hi');
  controller.sink.add('bye');
  controller.sink.add('variable');

  try {
    await for (final name in controller.stream) {
      print(name);
      await for (final name in controller.stream) {
        print(name);
      }
    }
  } catch (e, stackTrace) {}
}

Future<void> broadcastStreamExample() async {
  final controller = StreamController<String>();

  controller.sink.add('hi');
  controller.sink.add('bye');
  controller.sink.add('variable');

  try {
    await for (final name in controller.stream) {
      print(name);
      await for (final name in controller.stream) {
        print(name);
      }
    }
  } catch (e, stackTrace) {}
}
