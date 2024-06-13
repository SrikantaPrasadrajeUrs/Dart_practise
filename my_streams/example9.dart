import 'dart:async';

void main(List<String> args) async {
  await for (var name in getNames().absorbErrorsUsingHandleErrors) {
    print(name);
  }
  await for (var name in getNames().absorbErrorsUsingHandlers) {
    print(name);
  }
}

extension AbsorbErrors<T> on Stream<T> {
  Stream<T> get absorbErrorsUsingHandleErrors => handleError((_, __) {});

  Stream<T> get absorbErrorsUsingHandlers =>
      transform(StreamTransformer.fromHandlers(
          handleError: (_, __, sink) => sink.close()));

  Stream<T> absordErrorsUsingTransformer() =>
      transform(MyStreamErrorAbosorber());
}

Stream<String> getNames() async* {
  yield "ioe";
  yield "joshep";
  throw "jackson";
}

class MyStreamErrorAbosorber<T> implements StreamTransformerBase<T, T> {
  Stream<T> bind(Stream<T> stream) {
    final controller = StreamController<T>();
    stream.listen(controller.sink.add,
        onError: (_) {}, onDone: () => controller.close());
    return controller.stream;
  }

  @override
  StreamTransformer<RS, RT> cast<RS, RT>() {
    throw UnimplementedError();
  }
}
