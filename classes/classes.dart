import 'dart:io';

import 'dart:math';

class Point {
  //Use 'this' only when there is a name conflict. Otherwise, Dart style omits the this.
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

class VideoGame {
  String _name;
  String get name {
    return _name;
  }

  void set name(String value) {
    _name = "$value roggia";
  }
}

abstract class Ghost {
  String _name;

  String get name => _name;
  set name(String name);

  _move();
  acting() {
    print("it looks like a ghost");
    print("it's scary like a ghost");
    print("but, ");
    _move();
    print("it`s name is $name");
  }
}

class PokemonGhost extends Ghost {
  @override
  _move() {
    print("it moves like a pokemon");
  }

  @override
  void set name(String name) {
    _name = "pokemon $name";
  }
}

class YetAnotherPerson {
  final String _name;

  YetAnotherPerson(this._name);

  String greet(String who) => "Hello, $who. I`m $_name";
}

class Impostor implements YetAnotherPerson {
  @override
  String get _name => '';

  @override
  String greet(String who) =>
      "Don't you know who I am, I'm not an impostor mr. $who";
}

class Television {
  void turnOn() {
    print("turning on");
  }
}

class SmartTv extends Television {
  @override
  void turnOn() {
    super.turnOn(); //calls parent method
    print("but, very smartly");
  }
}

class SomeWhatDifferentOperators {
  final int x, y;
  SomeWhatDifferentOperators(this.x, this.y);

  SomeWhatDifferentOperators operator +(SomeWhatDifferentOperators a) =>
      SomeWhatDifferentOperators(a.x + 10 + x, a.y + y);
}

class MissingImplementation {
  @override
  void noSuchMethod(Invocation invocation) {
    print("No such method but handled by this awesome implemetnation");
  }
}

enum books { linux, clean_code, clean_architecture, pragmatic_programmer }

class Reader {
  void read() => print("reading");
}

mixin Singer on Reader {
  String name = "singer's name";
  void sing() => print("singing");

  void enableRead() => read();
}

class Writer with Reader, Singer {
  void write() => print("writing");

  @override
  void sing() => print(name);
}

main() {
  var p = Point(2, 2);
  var p2 = new Point(2, 2); // new is optional
  p.y = 3;
  print(p.y);
  print("distance is ${p.distancePoint()}");
  print(p.z);

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

  //getter and setter
  var videoGame = VideoGame();
  videoGame.name = "renan";

  print(videoGame.name);
  print(videoGame._name); //private field

  //abstract method
  Ghost randomGhost = new PokemonGhost();
  randomGhost.name = "Gengar";
  randomGhost.acting();

  //Implicit interface
  var pablo = YetAnotherPerson('Pablo');
  print(pablo.greet('arthur'));

  var impostor = Impostor();
  print(impostor.greet('arthur'));

  YetAnotherPerson myselfAsImpostor = Impostor();
  print(myselfAsImpostor.greet('Josias'));

  //Impostor impostorAsMyself = YetAnotherPerson('Pedro); //Compile-error YetAnotherPerson is not of type Impostor

  //Extension
  Television().turnOn();
  SmartTv().turnOn();

  var two = SomeWhatDifferentOperators(2, 2);
  print("two + two => x ${(two + two).x}");
  print("two + two => y ${(two + two).y}");

  //No such method
  dynamic missingImplementation = MissingImplementation();
  missingImplementation.aloha();

  //Enum
  print(
      "all enums have an index, this is the clean_architecture's index ${books.clean_architecture.index}");

  // listing enum values
  books.values.forEach(print);

  //using enum with switch
  var cleanArc = books.clean_architecture;
  switch (cleanArc) {
    case books.clean_architecture:
      print(books.clean_architecture);
      break;
    case books.clean_code:
      print(books.clean_code);
      break;
    default:
      print("clean the house");
      break;
  }

  //mixin
  Reader().read();
  //Singer().sing(); //mixin cannot be estantiated

  var writer = Writer();
  writer.write();
  writer.read();
  writer.sing();

  Singer singer = Writer();
  singer.sing();
  singer.enableRead();

  Reader writerWalter = Writer();

  //static
}
