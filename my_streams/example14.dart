import 'dart:async';

void main(List<String> args) async {
  try {
    await for (var name in getNames().withTimeOutBetweenEvents()) {
      print(name);
    }
  } catch (e, stackTrace) {
    print("Exception was thrown $e $stackTrace");
  }
}

Stream<String> getNames() async* {
  yield "john";
  yield "joshep";
  yield "lion";
  yield "batman";
  yield "arjun";
  await Future.delayed(const Duration(milliseconds: 1900));
  yield "beeshma";
}

extension WithTimeOutBetweenEvents<E> on Stream<E> {
  Stream<E> withTimeOutBetweenEvents() =>
      transform(TimeOutBetWeenEvents(Duration(milliseconds: 1920)));
}

class TimeOutBetWeenEvents<E> extends StreamTransformerBase<E, E> {
  final Duration duration;
  const TimeOutBetWeenEvents(this.duration);
  @override
  Stream<E> bind(Stream<E> stream) {
    Timer? timer;

    StreamController<E>? controller;
    StreamSubscription<E>? subscription;
    controller = StreamController<E>(onListen: () {
      subscription = stream.listen((data) {
        timer?.cancel();
        timer = Timer.periodic(duration, (timeStamp) {
          controller?.addError(TimeOutErrorBtwEvents('timeOut'));
        });

        controller?.sink.add(data);
      }, onError: controller?.addError);
    }, onCancel: () {
      subscription?.cancel();
      timer?.cancel();
    });
    return controller.stream;
  }
}

class TimeOutErrorBtwEvents implements Exception {
  final String message;

  const TimeOutErrorBtwEvents(this.message);

  @override
  String toString() => 'TimeOutErrorBtwEvents: $message';
}
