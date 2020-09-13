class Point {
  //Use this only when there is a name conflict. Otherwise, Dart style omits the this.
  int x;
  int y;
  int z;
  final int p;

  Point(this.x, this.y, {this.z = 9}) : p = 9;

  // Point(int x, int y) {
  //   this.x = x;
  //   this.y = y;
  // }
  Point.fromString(String point) : p = 10 {
    x = int.parse(point.split('/')[0]);
    y = int.parse(point.split('/')[1]);
  }

  Point.fromJson(Map<String, int> json)
      : x = json['x'],
        y = json['y'],
        p = 11 {
    print('In point.fromJson(): ($x, $y)');
  }

  Point.fromWhatever(String a, [String b]) : p = 10 {}
  Point.fromOther({Point p}) : this(p.x, p.y);

  distancePoint() {
    return x * y;
  }
}

class Person {
  String firstName;

  Person.fromJson(Map data) {
    print('in person');
  }
}

class Employee extends Person {
  Employee(Map data) : super.fromJson(data) {
    print('in employee');
  }
}

class ImmutablePoint {
  final int x;
  final int y;
  const ImmutablePoint(this.x, this.y);
}

class ImmutablePoint2 {
  final int x;
  final int y;
  ImmutablePoint2(int x, int y)
      : this.x = x,
        this.y = y;
}

class Logger {
  final String name;
  static final Map<String, Logger> _cache = {};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  Logger._internal(this.name);
}

main() {
  var p = Point(2, 2);
  var p2 = new Point(2, 2); // new is optional
  p.y = 3;
  print(p.y);
  print("distance is ${p.distancePoint()}");
  print(p.z);

  ("teste");
  p?.y = 4;
  print("distance is ${p.distancePoint()}");

  //instaceName method creator
  // const constructor

  //ommiting const in constant context

  // ===> object's type <===
  print("the runtime type is ${p.runtimeType}");

  if (p is Point && p.runtimeType == Point) {
    print("eureka");
  }

  var p3 = Point.fromString('2/3');
  print(p3.x);
  print(p3.y);

  Employee({});

  Point.fromJson({'x': 2, 'y': 2});

  var a = Point.fromOther(p: Point(2, 2));
  print(a.p);

  // true
  const immutable1 = ImmutablePoint(2, 2);
  const immutable2 = ImmutablePoint(2, 2);
  print(immutable1 == immutable2);

  // same as above
  // var immutable1 = const ImmutablePoint(2, 2);
  // var immutable2 = const ImmutablePoint(2, 2);
  // print(immutable1 == immutable2);

  //false
  var immutable3 = ImmutablePoint(2, 2);
  var immutable4 = ImmutablePoint(2, 2);
  print(immutable3 == immutable4);

  //var immutable5 = const ImmutablePoint2(2, 3); //error not a const constuctor
  //var immutablePoint = ImmutablePoint(2, 2);
  //immutablePoint.y = ImmutablePoint(2, 3); // can't change the attribute value

  var ui1 = Logger('UI');
  var ui2 = Logger('UI');
  print(ui1 == ui2);
  var ui3 = Logger('UI3');
  print(ui1 == ui3);
}
