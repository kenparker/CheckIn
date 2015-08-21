import 'dart:html';
import 'package:polymer/polymer.dart';
import '../Model/Controller.dart';

@CustomTag('main-app')
class MainApp extends PolymerElement {

  Controller controller = new Controller();

  @observable int counter;
  @observable int totalGlypto;
  @observable String detailGlypto;
  @observable int totalVorholzer;
  @observable String detailVorholzer;
  @observable int totalCrazy;
  @observable String detailCrazy;

  void refreshMap() {
    counter = controller.getTotal();
    totalGlypto = controller.getTotalGlypto();
    detailGlypto = controller.getDetailGlypto();
    totalVorholzer = controller.getTotalVorholz();
    detailVorholzer = controller.getDetailVorholz();
    totalCrazy = controller.getTotalCrazyBean();
    detailCrazy = controller.getDetailCrazyBean();
  }

  MainApp.created() : super.created() {
    controller.loadData();
    refreshMap();
  }

  void checkInGlypto(Event e, var detail, Node target) {
    controller.checkInGlypto();
    refreshMap();
  }

  void checkInVorholz(Event e, var detail, Node target) {
    controller.checkInVorholz();
    refreshMap();
  }

  void checkInCrazy(Event e, var detail, Node target) {
    controller.checkInCrazyBean();
    refreshMap();
  }

}
