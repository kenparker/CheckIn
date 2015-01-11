import 'dart:html';
import 'package:polymer/polymer.dart';
import '../Model/Controller.dart';

@CustomTag('admin-app')
class AdminApp extends PolymerElement {

  Controller controller = new Controller();

  AdminApp.created() : super.created() {
    controller.loadData();
  }

  void resetCheckIn(Event e, var detail, Node target) {
    controller.clearLocalStorage();
    refreshMap();
  }

  void loadTestData(Event e, var detail, Node target) {
    controller.loadTestData();
  }


}
