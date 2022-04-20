import 'dart:math';

void dartcore() {
  print('数字、集合、字符串等');
  //使用 int 和 double 的 parse() 方法将字符串转换为整型或双浮点型对象：
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);

  //通过添加 radix 参数，指定整数的进制基数：
  assert(int.parse('42', radix: 16) == 66);

  //使用 toString() 方法将整型或双精度浮点类型转换为字符串类型。使用 toStringAsFixed(). 指定小数点右边的位数，使用 toStringAsPrecision(): 指定字符串中的有效数字的位数。
  // Convert an int to a string.
  assert(42.toString() == '42');
  // Convert a double to a string.
  assert(123.456.toString() == '123.456');
  // Specify the number of digits after the decimal.
  assert(123.456.toStringAsFixed(2) == '123.46');
  // Specify the number of significant figures.
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);
  // Check whether a string contains another string.
  assert('Never odd or even'.contains('odd'));
  // Does a string start with another string?
  assert('Never odd or even'.startsWith('Never'));
  // Does a string end with another string?
  assert('Never odd or even'.endsWith('even'));
  // Find the location of a string inside a string.
  assert('Never odd or even'.indexOf('odd') == 6);
  // Grab a substring.
  assert('Never odd or even'.substring(6, 9) == 'odd');

  // Split a string using a string pattern.
  var parts = 'progressive web apps'.split(' ');
  assert(parts.length == 3);
  assert(parts[0] == 'progressive');

// Get a UTF-16 code unit (as a string) by index.
  assert('Never odd or even'[0] == 'N');

// spilt('')空字符串，会变成一个一个字母
  for (final char in 'hello'.split('')) print(char);
// Get all the UTF-16 code units in the string.
  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);
  // Convert to uppercase.
  assert('web apps'.toUpperCase() == 'WEB APPS');

  // Convert to lowercase.
  assert('WEB APPS'.toLowerCase() == 'web apps');
  // Trim a string.
  assert('  hello  '.trim() == 'hello');

// Check whether a string is empty.
  assert(''.isEmpty);

// Strings with only white space are not empty.
  assert('  '.isNotEmpty);
  var greetingTemplate = 'Hello, NAME!';
  var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');

// greetingTemplate didn't change.
  assert(greeting != greetingTemplate);
  print(greeting);
  var sb = StringBuffer();
  sb
    ..write('Use a StringBuffer for ')
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.');

  var fullString = sb.toString();

  assert(fullString == 'Use a StringBuffer for efficient string creation.');
  print(fullString);
  //RegExp 类提供与 JavaScript 正则表达式相同的功能。使用正则表达式可以对字符串进行高效搜索和模式匹配。
  // Here's a regular expression for one or more digits.
  var numbers = RegExp(r'\d+');

  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';

// contains() can use a regular expression.
  assert(!allCharacters.contains(numbers));
  assert(someDigits.contains(numbers));

// Replace every match with another string.
  var exedOut = someDigits.replaceAll(numbers, 'XX');
  assert(exedOut == 'llamas live XX to XX years');
// Create an empty list of strings.
  var grains = <String>[];
  assert(grains.isEmpty);

// Create a list using a list literal.
  var fruits = ['apples', 'oranges'];

// Add to a list.
  fruits.add('kiwis');

// Add multiple items to a list.
  fruits.addAll(['grapes', 'bananas']);

// Get the list length.
  assert(fruits.length == 5);

// Remove a single item.
  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);

// Remove all elements from a list.
  fruits.clear();
  assert(fruits.isEmpty);

// You can also create a List using one of the constructors.
  var vegetables = List.filled(99, 'broccoli'); //输出99个broccoli
  assert(vegetables.every((v) => v == 'broccoli'));
//使用 indexOf() 方法查找一个对象在 list 中的下标值。
// Access a list item by index.
  assert(fruits[0] == 'apples');
// Find an item in a list.
  assert(fruits.indexOf('apples') == 0);
//在 Dart 中，set 是一个无序的，元素唯一的集合。因为一个 set 是无序的，所以无法通过下标（位置）获取 set 中的元素。
// Create an empty set of strings.
  var ingredients = <String>{};

// Add new items to it.
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.length == 3);

// Adding a duplicate item has no effect.
  ingredients.add('gold');
  assert(ingredients.length == 3);

// Remove an item from a set.
  ingredients.remove('gold');
  assert(ingredients.length == 2);

// You can also create sets using
// one of the constructors.
  var atomicNumbers = Set.from([79, 22, 54]);
//使用 contains() 和 containsAll() 来检查一个或多个元素是否在 set 中
// Check whether an item is in the set.
  assert(ingredients.contains('titanium'));

// Check whether all the items are in the set.
  assert(ingredients.containsAll(['titanium', 'xenon']));
//map 是一个无序的 key-value （键值对）集合，就是大家熟知的 dictionary 或者 hash。 map 将 kay 与 value 关联，以便于检索。和 JavaScript 不同，Dart 对象不是 map。
// Maps often use strings as keys.
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

// Maps can be built from a constructor.
  var searchTerms = Map();

// Maps are parameterized types; you can specify what
// types the key and value should be.
  var nobleGases = Map<int, String>();
//通过大括号语法可以为 map 添加，获取，设置元素。使用 remove() 方法从 map 中移除键值对
// Retrieve a value with a key.
  assert(nobleGases[54] == 'xenon');

// Check whether a map contains a key.
  assert(nobleGases.containsKey(54));

// Remove a key and its value.
  nobleGases.remove(54);
  assert(!nobleGases.containsKey(54));
  var keys = hawaiianBeaches.keys;

  assert(keys.length == 3);
  assert(Set.from(keys).contains('Oahu'));
  var values = hawaiianBeaches.values;
  assert(values.length == 3);
  assert(values.any((v) => v.contains('Waikiki')));
  print(values);
  //使用 containsKey() 方法检查一个 map 中是否包含某个key
  assert(hawaiianBeaches.containsKey('Oahu'));
  assert(!hawaiianBeaches.containsKey('Florida'));
//使用 forEach() 可以让 list， set 或 map 对象中的每个元素都使用一个方法。
  var teas = ['green', 'black', 'chamomile', 'earl grey'];

  teas.forEach((tea) => print('I drink $tea'));
  hawaiianBeaches.forEach((k, v) {
    print('I want to visit $k and swim at $v');
    // I want to visit Oahu and swim at
    // [Waikiki, Kailua, Waimanalo], etc.
  });
  //terable 提供 map() 方法，这个方法将所有结果返回到一个对象中
  var loudTeas = teas.map((tea) => tea.toUpperCase());
  loudTeas.forEach(print);

// Chamomile is not caffeinated.
  bool isDecaffeinated(String teaName) => teaName == 'chamomile';

// Use where() to find only the items that return true
// from the provided function.
  var decaffeinatedTeas = teas.where((tea) => isDecaffeinated(tea));
// or teas.where(isDecaffeinated)

// Use any() to check whether at least one item in the
// collection satisfies a condition.
  assert(teas.any(isDecaffeinated));

// Use every() to check whether all the items in a
// collection satisfy a condition.
  assert(!teas.every(isDecaffeinated));
}

//日期和时间
void dates_and_times() {
  // Get the current date and time.
  var now = DateTime.now();
  print(now);
  // Create a new DateTime with the local time zone.
  var y2k = DateTime(2000); // January 1, 2000
  print(y2k);
  // Specify the month and day.
  y2k = DateTime(2000, 1, 2); // January 2, 2000
  print(y2k);
// Specify the date as a UTC time.
  y2k = DateTime.utc(2000); // 1/1/2000, UTC
  print(y2k);
// Specify a date and time in ms since the Unix epoch.
  y2k = DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);
// Parse an ISO 8601 date.
  y2k = DateTime.parse('2000-01-01T00:00:00Z');
  //日期中 millisecondsSinceEpoch 属性返回自 “Unix 纪元（January 1, 1970, UTC）”以来的毫秒数
  // 1/1/2000, UTC
  assert(y2k.millisecondsSinceEpoch == 946684800000);

// 1/1/1970, UTC
  var unixEpoch = DateTime.utc(1970);
  assert(unixEpoch.millisecondsSinceEpoch == 0);
}

//数学和随机数
void math_and_random() {
  //提供基本的三角函数
  assert(cos(pi) == -1.0);
  var degrees = 30;
  var radians = degrees * (pi / 180);
// radians is now 0.52359.
  var sinOf30degrees = sin(radians);
// sin 30° = 0.5
  assert((sinOf30degrees - 0.5).abs() < 0.01);
//提供最大值和最小值函数
  assert(max(1, 1000) == 1000);
  assert(min(1, -1000) == -1000);
//提供数学常数
  print(e); // 2.718281828459045
  print(pi); // 3.141592653589793
  print(sqrt2); // 1.4142135623730951
  //随机数
  var random = Random();
  double x = random.nextDouble(); // Between 0.0 and 1.0: [0, 1)
  int y = random.nextInt(10); // Between 0 and 9.
  bool z = random.nextBool(); // true or false
  print(x);
  print(y);
  print(z);
}

void main(List<String> args) {
  dartcore();
  dates_and_times();
  math_and_random();
}
