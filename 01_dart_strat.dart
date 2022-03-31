//变量
///这是一个文档注释
import 'dart:math';
//import 'package:01_dart_start.dart';


void variables() {
  var name = 'Voyager I';
  var year = 1997;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };
  print(
      'name is $name,year is $year,antennaDiameter is $antennaDiameter,flybyobjects is $flybyObjects,image is $image');
}

void control() {
  //流程控制语句
  int year = 1997;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  if (year >= 2001) {
    print('21th century');
  } else if (year >= 1901) {
    print('20th century');
  }
  for (final object in flybyObjects) {
    print(object);
  }
  for (int month = 1; month <= 12; month++) {
    print(month);
  }
  while (year < 2016) {
    year += 1;
  }
}

int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

var result = fibonacci(20);

void main(List<String> args) {
  variables();
  control();
  print('斐波那契的结果result：$result');
}
