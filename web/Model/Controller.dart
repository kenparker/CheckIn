library Controller;

import 'Location.dart';
import 'CheckIn.dart';
import 'ManageLocalStorage.dart';

class Controller {

  Location location1 = new Location("Glyptho", "Glypthothek");
  Location location2 = new Location("Vorholz", "Vorholzer Forum");
  Location location3 = new Location("CrazyBean", "Crazy Bean");
  CheckInLocations cil = new CheckInLocations();
  ManageLocalStorage mlc = new ManageLocalStorage();

  void checkInGlypto() {
    CheckIn checkin1 = new CheckIn(new DateTime.now());
    cil.addCheckIn(location1, checkin1);
    mlc.addCheckIn(location1.location, checkin1);
  }

  int getTotalGlypto() {
    return cil.countElements(location1);
  }

  void checkInVorholz() {
    CheckIn checkin1 = new CheckIn(new DateTime.now());
    cil.addCheckIn(location2, checkin1);
    mlc.addCheckIn(location2.location, checkin1);
  }

  int getTotalVorholz() {
    return cil.countElements(location2);
  }

  void checkInCrazyBean() {
    CheckIn checkin1 = new CheckIn(new DateTime.now());
    cil.addCheckIn(location3, checkin1);
    mlc.addCheckIn(location3.location, checkin1);
  }

  int getTotalCrazyBean() {
    return cil.countElements(location3);
  }

  void loadData() {

    mlc.ls.forEach((k,v) {
      print("location ${k.substring(0,k.indexOf(" "))}" + " Date : ${k.substring(k.indexOf(" ")+1,k.length)}");
      Location location = new Location("${k.substring(0,k.indexOf(" "))}", "");
      CheckIn checkin = new CheckIn(DateTime.parse("${k.substring(k.indexOf(" ")+1,k.length)}"));
      cil.addCheckIn(location, checkin);
    });

  }

  void loadTestData() {

    for (var i = 0; i < 5; i++) {
      //print(new DateTime.now());
      checkInGlypto();
    }

    CheckIn checkin2 = new CheckIn(DateTime.parse("2014-11-01 17:00:00-000"));
    cil.addCheckIn(location1, checkin2);
    checkin2 = new CheckIn(DateTime.parse("2014-11-02 17:00:00-000"));
    cil.addCheckIn(location1, checkin2);
    checkin2 = new CheckIn(DateTime.parse("2014-11-03 17:00:00-000"));
    cil.addCheckIn(location1, checkin2);

    checkin2 = new CheckIn(DateTime.parse("2013-11-01 17:00:00-000"));
    cil.addCheckIn(location1, checkin2);
    checkin2 = new CheckIn(DateTime.parse("2013-11-02 17:00:00-000"));
    cil.addCheckIn(location1, checkin2);

    checkin2 = new CheckIn(DateTime.parse("2014-11-02 17:00:00-000"));
    cil.addCheckIn(location2, checkin2);
    checkin2 = new CheckIn(DateTime.parse("2014-11-03 17:00:00-000"));
    cil.addCheckIn(location2, checkin2);

    checkin2 = new CheckIn(DateTime.parse("2013-11-01 17:00:00-000"));
    cil.addCheckIn(location2, checkin2);
    checkin2 = new CheckIn(DateTime.parse("2013-11-02 17:00:00-000"));
    cil.addCheckIn(location2, checkin2);

    cil.printTotalsMap();

    print(" number of elements : " + cil.countMapElements().toString());

  }

  int getTotal() {
    return cil.countMapElements();
  }

  void clearLocalStorage() {
    cil.locations.clear();
    mlc.clearLocalStorage();
  }
}