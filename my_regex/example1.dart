void main(List<String> args) {
  // [2] 2 has to be present in start, [0-9]{9}: Matches any digit from 0 to 9 exactly nine times.
  print(RegExp(r'[2][0-9]{9}').hasMatch('2110123459'));
  print(RegExp('[A-Z][a-z]+[0-9][a-z]*').hasMatch('Adfdshgf'));
}
