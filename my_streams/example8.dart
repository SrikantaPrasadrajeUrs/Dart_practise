void main(List<String> args) async {
  // await till entire stream to finish
  final allNames = await getNames().toList();
}

Stream<String> getNames() async* {
  yield "Joe";
  yield "Jjoshep";
  yield "jackson";
}
