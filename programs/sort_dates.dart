import 'package:intl/intl.dart';

void main(List<String> args) {
  Map<String,int> monthsMap = {
    "Mar":3,
    "Feb":2,
    "Jan":1,
    "Dec":12
    };

  List<String> dates = ['01 Mar 2017','03 Feb 2017','15 Jan 1998','04 Dec 1997'];

    print(sortDates(dates));

  for(int i=0;i<dates.length;i++){
    for(int j=i+1;j<dates.length;j++){
      var date1 = dates[i].split(' ');
      var date2 = dates[j].split(' ');
      if(int.parse(date1[2])>int.parse(date2[2])||monthsMap[date1[1]]!>monthsMap[date2[1]]!||int.parse(date1[0])>int.parse(date2[0])){
        var temp = dates[i];
        dates[i] = dates[j];
        dates[j] = temp;
      }
    }
  }
  print(dates);
  print("/------------");
}

List<String> sortDates(List<String> dates){
  dates.sort((a, b){
    DateTime date1 = DateFormat('dd MMM yyyy').parse(a);
    DateTime date2 = DateFormat('dd MMM yyyy').parse(b);
    return date1.compareTo(date2);
  });
  return dates;
}