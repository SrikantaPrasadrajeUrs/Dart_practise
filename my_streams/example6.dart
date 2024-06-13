import 'dart:async';

void main(List<String> args) async {
  await for (var name in names.map((name) => name.toUpperCase())) {
    print(name);
  }
  //=======
  await for (var name in ToUpperCase().bind(names)) {
    print(name);
  }
}

Stream<String> names =
    Stream.fromIterable(["Hi", "Bye", "hello", "How are you"]);

// Stream transformer

class ToUpperCase extends StreamTransformerBase<String, String> {
  @override
  Stream<String> bind(Stream<String> stream) {
    return stream.map((str) => str.toUpperCase());
  }
}

extension on Stream<String> {
  
}

