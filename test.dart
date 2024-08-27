void main(List<String> args) {
  print("SUM(D11~,20,D11:D17)".replaceAll(RegExp(r'\b' + RegExp.escape('D11') + r'\b'), "--"));
}