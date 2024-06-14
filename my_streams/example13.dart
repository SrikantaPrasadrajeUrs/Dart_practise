import 'dart:async';
import 'dart:developer';

//merging
void main(List<String> args) async {
  // await for (var name in getControllerStream()) {
  //   print(name);
  // }
  await nonBroadcastStreamExample();
  // broadCast stream multiple listners
  // await nonBroadcastStreamExample();
}

Stream<String> getControllerStream() async* {
  final controller = StreamController<String>();

  controller.sink.add('hi');
  controller.sink.add('bye');
  controller.sink.add('variable');
  yield* await controller.stream; //Stream<String>
}

Future<void> nonBroadcastStreamExample() async {
  final controller = StreamController<String>();

  controller.sink.add('hi');
  controller.sink.add('bye');
  controller.sink.add('variable');
// we cannot have 2 listners to single stream
  try {
    await for (final name in controller.stream) {
      print(name);
      await for (final name in controller.stream) {
        print(name);
      }
    }
    final lis1 = controller.stream.listen((name) {
      print(name);
    });
  } catch (e, stackTrace) {
    log('caught non Broadcast',error: e,stackTrace: stackTrace);
  }
}

Future<void> broadcastStreamExample() async {
  late final controller;
  controller = StreamController<String>.broadcast();
  controller.sink.add('hi');
  try {
    final list1 = controller.stream.listen((name) {
      print(name);
    });
    final list2 = controller.stream.listen((data) {
      print(data);
    });
print(list1);
    controller.sink.add('bye');
    controller.sink.add('variable');
  } catch (e, stackTrace) {}
}
