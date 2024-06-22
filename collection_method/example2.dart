// Convert column letters to a zero-based column index
int charToColumnIndex(String colRef) {
  int colIndex = 0;
  for (int i = 0; i < colRef.length; i++) {
    colIndex = colIndex * 26 + (colRef.codeUnitAt(i) - 'A'.codeUnitAt(0)) + 1;
  }
  return colIndex - 1; // Convert to 0-based index
}

// Convert a zero-based column index to column letters
String columnIndexToChar(int colIndex) {
  String colRef = "";
  while (colIndex >= 0) {
    colRef = String.fromCharCode((colIndex % 26) + 'A'.codeUnitAt(0)) + colRef;
    colIndex = (colIndex ~/ 26) - 1;
  }
  return colRef;
}

void main() {
  // Test cases
  // print(charToColumnIndex("A")); // 0
  // print(charToColumnIndex("Z")); // 25
  // print(charToColumnIndex("AA")); // 26
  // print(charToColumnIndex("AB")); // 27
  // print(charToColumnIndex("BA")); // 52
  // print(charToColumnIndex("ZZ")); // 701

  // print(columnIndexToChar(0)); // A
  // print(columnIndexToChar(25)); // Z
  // print(columnIndexToChar(26)); // AA
  // print(columnIndexToChar(27)); // AB
  // print(columnIndexToChar(52)); // BA
  // print(columnIndexToChar(701)); // ZZ
  print((4.199999999999999 * 10).round()/10);
}
