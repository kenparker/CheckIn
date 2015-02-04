import 'dart:html' show Event, Node;
import 'package:polymer/polymer.dart' show CustomTag, observable, PolymerElement;
import '../Model/Controller.dart';

@CustomTag('main-app')
class MainApp extends PolymerElement {

  Controller controller = new Controller();

  @observable int counter;
  @observable int totalGlypto;
  @observable int totalVorholzer;
  @observable int totalCrazy;

  void refreshMap() {
    counter = controller.getTotal();
    totalGlypto = controller.getTotalGlypto();
    totalVorholzer = controller.getTotalVorholz();
    totalCrazy = controller.getTotalCrazyBean();
  }

  MainApp.created() : super.created() {
    controller.loadData();
    refreshMap();
  }

  void checkInGlypto(Event e, var detail, Node target) {
    controller.checkInGlypto();
    counter = controller.getTotal();
    totalGlypto = controller.getTotalGlypto();
  }

  void checkInVorholz(Event e, var detail, Node target) {
    controller.checkInVorholz();
    counter = controller.getTotal();
    totalVorholzer = controller.getTotalVorholz();
  }

  void checkInCrazy(Event e, var detail, Node target) {
    controller.checkInCrazyBean();
    counter = controller.getTotal();
    totalCrazy = controller.getTotalCrazyBean();
  }

}
