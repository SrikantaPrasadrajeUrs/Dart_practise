void main(List<String> args) {
  var reg = RegExp(r'^[^\(]*\((.+)\)$');
  List<String> formulas = [
    '=SUM(A1:B10) + ANSWER_BY_ID(C5) - AVERAGE(D2:D8)',
    '=IF(ANSWER_BY_ID(E3) > 100, SUM(F1:F10), AVERAGE(G2:G9))',
    '=VLOOKUP(H5, A1:B20, 2, FALSE) + ANSWER_BY_ID(C4) - COUNTIF(D1:D10, ">50")',
    '=SUMPRODUCT(A1:A5, B1:B5) / ANSWER_BY_ID(C7) + MAX(D3:D12)',
    '=IFERROR(ANSWER_BY_ID(B3) * SUM(A1:A10), "Error") + MIN(F1:F20)',
    '=ROUND(SUM(C1:C10) + ANSWER_BY_ID(D8), 2) - AVERAGE(B1:B5)',
    '=IF(ANSWER_BY_ID(F4) = TRUE, MAX(A1:A5), MIN(B2:B10)) + SUM(C1:D5)',
    '=SUMIFS(A1:A10, B1:B10, ">50") - ANSWER_BY_ID(C9) + COUNT(D2:D15)',
    '=INDEX(A1:A10, MATCH(ANSWER_BY_ID(B6), B1:B10, 0)) + MAX(C1:C10)',
    '=IF(ANSWER_BY_ID(Sheet!D5) > 50, SUM(A1:A5), AVERAGE(B1:B5)) * COUNT(C1:C10)',
    'ANSWER_BY_ID(Sheet!D4)+ANSWER_BY_ID(Sheet!D1)',
    'ANSWER_BY_ID(C1)',
    'ANSWER_BY_ID(\'Sheet and cost\'!C2)',  // Example of a standalone call
  ];
  print(double.tryParse("1"));
}
