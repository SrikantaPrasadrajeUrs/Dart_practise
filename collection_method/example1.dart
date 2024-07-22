void main(List<String> args) {
  // String myText = "hiii";
  // List<String> name = ["hi", "bye", "one", "two"];
  // String formula = "ANSWER_BY_ID(question_id!E23)";
  // if (!pcrFormulas.any((f) {
  //       print(f);
  //       return formula.contains(f);
  //     })) {
  //   print("Present");
  // }
  // if ("cdೆ".contains('ೆ')) {
  //   print("present");
  // }
  example2();
}

void example2(){
  const unUsedCustomFormula = [
  'QUESTION_INDEX',
  'GET_QUESTION_ID'
];
if(!unUsedCustomFormula.any((e)=>"QUESTION_INDEX".contains(e))){
print("not present");
}
}


// =======
class Solution {
  int addDigits(int num) {
    int len ='$num'.length;
    int sum=0;
    while(len>0){
        len--;
        // print(n);
        sum+=num%10;
        num=(num~/10);
    
    }
    return '$sum'.length>1?addDigits(sum):sum;
  }
}
void example1() {
  List<String> cellvalues = ["D12", "F21", "GG4", "A1"];
  List<String> cellRanges = ["F21", "GG4"];
  cellvalues.removeWhere((e) => cellRanges.contains(e));
  print(cellvalues);
}

final List<String> pcrFormulas = [
  // Conditional Functions
  'if'
      'IF',
  'IFERROR',
  'IFNA',
  'IFS',

// Arithmetical operators
  '+',
  '-',
  '/',
  '%',
  '*',
  // Logical Functions
  'AND',
  'OR',
  'NOT',
  'XOR',

  // Lookup and Reference Functions
  'VLOOKUP',
  'HLOOKUP',
  'LOOKUP',
  'INDEX',
  'MATCH',

  // Mathematical Functions
  'ABS',
  'ACOS',
  'ACOSH',
  'ASIN',
  'ASINH',
  'ATAN',
  'ATAN2',
  'ATANH',
  'CEILING',
  'COMBIN',
  'COS',
  'COSH',
  'DEGREES',
  'EVEN',
  'EXP',
  'FACT',
  'FLOOR',
  'GCD',
  'INT',
  'LCM',
  'LN',
  'LOG',
  'LOG10',
  'MOD',
  'ODD',
  'PI',
  'POWER',
  'PRODUCT',
  'QUOTIENT',
  'RADIANS',
  'RAND',
  'RANDBETWEEN',
  'ROMAN',
  'ROUND',
  'ROUNDDOWN',
  'ROUNDUP',
  'SIGN',
  'SIN',
  'SINH',
  'SQRT',
  'SQRTPI',
  'SUBTOTAL',
  'SUM',
  'SUMIF',
  'SUMIFS',
  'SUMPRODUCT',
  'SUMSQ',
  'TAN',
  'TANH',
  'TRUNC',

  // Statistical Functions
  'AVERAGE',
  'AVERAGEA',
  'AVERAGEIF',
  'AVERAGEIFS',
  'COUNT',
  'COUNTA',
  'COUNTBLANK',
  'COUNTIF',
  'COUNTIFS',
  'DEVSQ',
  'FREQUENCY',
  'GEOMEAN',
  'HARMEAN',
  'LARGE',
  'MAX',
  'MAXA',
  'MEDIAN',
  'MIN',
  'MINA',
  'MODE',
  'PERCENTILE',
  'PERCENTRANK',
  'QUARTILE',
  'RANK',
  'SKEW',
  'SMALL',
  'STDEV',
  'STDEVA',
  'STDEVP',
  'STDEVPA',
  'VAR',
  'VARA',
  'VARP',
  'VARPA',

  // Text Functions
  'CHAR',
  'CLEAN',
  'CODE',
  'CONCATENATE',
  'DOLLAR',
  'EXACT',
  'FIND',
  'FIXED',
  'LEFT',
  'LEN',
  'LOWER',
  'MID',
  'PROPER',
  'REPLACE',
  'REPT',
  'RIGHT',
  'SEARCH',
  'SUBSTITUTE',
  'TEXT',
  'TRIM',
  'UPPER',
  'VALUE',

  // Date and Time Functions
  'DATE',
  'DATEVALUE',
  'DAY',
  'DAYS',
  'DAYS360',
  'EDATE',
  'EOMONTH',
  'HOUR',
  'MINUTE',
  'MONTH',
  'NETWORKDAYS',
  'NOW',
  'SECOND',
  'TIME',
  'TIMEVALUE',
  'TODAY',
  'WEEKDAY',
  'WEEKNUM',
  'WORKDAY',
  'YEAR',
  'YEARFRAC',

  // Financial Functions
  'ACCRINT',
  'ACCRINTM',
  'AMORDEGRC',
  'AMORLINC',
  'COUPDAYBS',
  'COUPDAYS',
  'COUPDAYSNC',
  'COUPNCD',
  'COUPNUM',
  'COUPPCD',
  'CUMIPMT',
  'CUMPRINC',
  'DB',
  'DDB',
  'DISC',
  'DOLLARDE',
  'DOLLARFR',
  'DURATION',
  'EFFECT',
  'FV',
  'FVSCHEDULE',
  'INTRATE',
  'IPMT',
  'IRR',
  'ISPMT',
  'MIRR',
  'NOMINAL',
  'NPER',
  'NPV',
  'ODDFPRICE',
  'ODDFYIELD',
  'ODDLPRICE',
  'ODDLYIELD',
  'PMT',
  'PPMT',
  'PRICE',
  'PRICEDISC',
  'PRICEMAT',
  'PV',
  'RATE',
  'RECEIVED',
  'SLN',
  'SYD',
  'TBILLEQ',
  'TBILLPRICE',
  'TBILLYIELD',
  'VDB',
  'XIRR',
  'XNPV',
  'YIELD',
  'YIELDDISC',
  'YIELDMAT',

  // Engineering Functions
  'BESSELI',
  'BESSELJ',
  'BESSELK',
  'BESSELY',
  'BIN2DEC',
  'BIN2HEX',
  'BIN2OCT',
  'COMPLEX',
  'CONVERT',
  'DEC2BIN',
  'DEC2HEX',
  'DEC2OCT',
  'DELTA',
  'ERF',
  'ERFC',
  'GESTEP',
  'HEX2BIN',
  'HEX2DEC',
  'HEX2OCT',
  'IMABS',
  'IMAGINARY',
  'IMARGUMENT',
  'IMCONJUGATE',
  'IMCOS',
  'IMDIV',
  'IMEXP',
  'IMLN',
  'IMLOG10',
  'IMLOG2',
  'IMPOWER',
  'IMPRODUCT',
  'IMREAL',
  'IMSIN',
  'IMSQRT',
  'IMSUB',
  'IMSUM',
  'OCT2BIN',
  'OCT2DEC',
  'OCT2HEX',

  // Information Functions
  'CELL',
  'ERROR.TYPE',
  'ISBLANK',
  'ISERR',
  'ISERROR',
  'ISEVEN',
  'ISLOGICAL',
  'ISNA',
  'ISNONTEXT',
  'ISNUMBER',
  'ISODD',
  'ISREF',
  'ISTEXT',
  'TYPE',

  // Database Functions
  'DAVERAGE',
  'DCOUNT',
  'DCOUNTA',
  'DGET',
  'DMAX',
  'DMIN',
  'DPRODUCT',
  'DSTDEV',
  'DSTDEVP',
  'DSUM',
  'DVAR',
  'DVARP',

  // Array Functions
  'FREQUENCY',
  'TRANSPOSE',

  // Cube Functions
  'CUBEKPIMEMBER',
  'CUBEMEMBER',
  'CUBEMEMBERPROPERTY',
  'CUBERANKEDMEMBER',
  'CUBESET',
  'CUBESETCOUNT',
  'CUBEVALUE',
];
