library ManageLocalStorage;

import 'dart:html' show Storage, window;
import 'CheckIn.dart';

class ManageLocalStorage {

  Storage ls = window.localStorage;

  void addCheckIn(String location, CheckIn checkIn) {
    String key = location + " " + checkIn.dateTime.toString();
    ls[key] = 1.toString();
  }

  void clearLocalStorage() {
    ls.clear();
  }
}
