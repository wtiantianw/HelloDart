//变量
///这是一个文档注释
import 'dart:math';
import 'dart:io';
import 'dart:async';
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
void imports() {
  print("----导入----");
  var mypi = pi;
  print('pi is $mypi');

  var x = pi / 4;
  var y = sin(x);
  print('sin(pi/4) is $y');
}

class Spacecraft {
  String name;
  DateTime? launchDate;
  int? get launchYear => launchDate?.year;
// 构造函数，用于分配成员
  Spacecraft(this.name, this.launchDate) {}
  Spacecraft.unlaunched(String name) : this(name, null);
  void describe() {
    print('Spacecraft: $name');

    // Type promotion dos not work on getters.
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

void classes() {
  print('----类----');
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager.describe();
  voyager3.describe();
}

//继承类
class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(String name, DateTime launchDate, this.altitude)
      : super(name, launchDate);
  void describe() {
    super.describe();
    print('altitude is $altitude km');
  }
}

void jicheng() {
  print("----继承----");
  var voyagar1 = Orbiter('voyager II', DateTime(1997, 9, 5), 999);
  voyagar1.describe();
}

mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(String name, DateTime launchDate) : super(name, launchDate);
}

void mixin() {
  print("-----mixin-----");
  var plt = PilotedCraft('神舟1号', DateTime(1999, 11, 20));
  plt.describe();
  plt.describeCrew();
}

//接口与抽象类
class MockSpaceship implements Spacecraft {
  DateTime? launchDate;
  String name;
  MockSpaceship(this.name, this.launchDate);
  void describe() {
    print('Mock Spacecraft: $name');
  }

  int? get launchYear => launchDate?.year;
}

void interface_abstarct() {
  print('----接口和抽象类----');
  var mock = MockSpaceship('测试飞行器', null);
  mock.describe();
}

Future<void> the_async() async {
  print('----异步----');
  const oneSecond = Duration(seconds: 1);

  Future<void> printWithDelay1(String message) async {
    await Future.delayed(oneSecond);
    print(message);
  }

  printWithDelay1('过了1秒钟. 1');
  print('done 1.');

  Future<void> printWithDelay2(String message) {
    return Future.delayed(oneSecond).then((_) {
      print(message);
    });
  }

  printWithDelay2('过了1秒钟. 2');
  print('done 2.');
}

Future<void> createDescriptions(Iterable<String> objects) async {
  for (final object in objects) {
    try {
      var file = File('$object.txt');
      if (await file.exists()) {
        var modified = await file.lastModified();
        print('File for $object already exists. It was modified on $modified.');
        continue;
      }
      await file.create();
      await file.writeAsString('Start Describing $object in this file.');
      print('File for $object created.');
    } on IOException catch (e) {
      print('Cannot create description for $object: $e');
    }
  }
  var the_objects = ['飞机', '火箭', '铲土车'];
  createDescriptions(the_objects);

  await Future.delayed(Duration(seconds: 5));
}

//使用 async* 关键字，其可以为你提供一个可读性更好的方式去生成 Stream
Future<void> the_stream() async {
  print('----Stream----');
  const oneSecond = Duration(seconds: 1);
  StreamController<double> ctl = StreamController<double>();
  Stream stm = ctl.stream;

  stm.listen((event) {
    print('event from controller is: $event');
  });

  Future<void> addWithDelay(value) async {
    await Future.delayed(oneSecond);
    ctl.add(value);
  }

  addWithDelay(11.1);
  addWithDelay(22.2);
  addWithDelay(33.3);

  await Future.delayed(Duration(seconds: 5));
}

Future<void> show_descriptions(flybyObjects) async {
  try {
    for (final object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (ex) {
    print('Could not describe object: $ex');
  } finally {
    flybyObjects.clear();
  }
}

void exceptions() {
  print('----异常----');
  var flybyObjects = ['飞机', '火箭', '铲土车', '手机'];
  show_descriptions(flybyObjects);
}

Future<void> main(List<String> args) async {
  variables();
  control();
  print('斐波那契的结果result：$result');
  imports();
  classes();
  jicheng();
  mixin();
  interface_abstarct();
  await the_async();
  await the_stream();
  exceptions();
}
