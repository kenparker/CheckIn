library barchart;

import 'dart:html';
import 'package:chart/chart.dart';


void main() {


  Bar bar = new Bar({
      'labels' : ["January","February","March","April","May","June","July"],
      'datasets' : [
          {
              'fillColor' : "rgba(220,220,220,0.5)",
              'strokeColor' : "rgba(220,220,220,1)",
              'data' : [65,59,90,81,56,55,40]
          },
          {
              'fillColor' : "rgba(255,255,255,1)",
              'strokeColor' : "rgba(0,0,255,0.5)",
              'data' : [28,48,40,19,null,27,100]
          }
      ]

  }, null);


  DivElement container3 = new DivElement();
  container3.style.height ='400px';
  container3.style.width =  '100%';
  document.body.children.add(container3);
  bar.show(container3);


}


