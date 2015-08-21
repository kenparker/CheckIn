library Month;

import 'CheckIn.dart';
import 'Location.dart';

class Month {
  int month;

  Month(this.month);

  int get hashCode {
    int result = 17;
    result = 37 * result * month.hashCode;
    return result;
  }

  bool operator==(other) {
    if (other is! Month) return false;
    Month month = other;
    return (month.month == this.month);
  }

  String toString() {
    return " Month : $month";
  }
}

class CheckInMonths {
  Map<Month, CheckInList> months = new Map();

  String printTotalsMap() {

    String totalElementsAllMonths = '';
    months.forEach((month, checkIn) {
      int number = checkIn.countElements();
      String totalElementsOneMonth = "$month Number of Elements : $number";
      totalElementsAllMonths = totalElementsAllMonths + totalElementsOneMonth + '\n';
      //print(totalElementsOneMonth);
    });

    return totalElementsAllMonths;
  }

  String toString() {
    String allCheckIns = '';
    months.forEach((Month, CheckInList) {
      allCheckIns = allCheckIns + " $Month $CheckInList \n";
    });
    return allCheckIns;
  }

  bool addCheckIn(Location location, CheckIn checkIn) {
    Month month = new Month(checkIn.dateTime.month);
    if (months[month] == null) {
      CheckInList checkInList = new CheckInList();
      months.putIfAbsent(month, () => checkInList);
    }
    months[month].addCheckIn(location, checkIn);
    return false;
  }

  int countElements(Month month) {
    return months[month].countElements();
  }

  int countMapElements() {
    int counter = 0;
    this.months.forEach((k,v) {counter = counter + countElements(k);});
    return counter;
  }
}