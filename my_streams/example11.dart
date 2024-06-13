import 'dart:async';

Stream<int> counter =
    Stream.periodic(const Duration(seconds: 1), (count) => count);
void main(List<String> args) {
  StreamSubscription<int>? streamSubscription;
  streamSubscription = counter.listen((data) {
    print(data);
    if (data == 10) {
      streamSubscription!.cancel();
    }
  });
}
