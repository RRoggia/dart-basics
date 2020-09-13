main() {
  //num
  print("num API");
  num number = 10;
  print(number);

  number = 20.0;
  print(number);

  print(number.isNaN);

  number = -100;
  print(number.abs());

  number = 1.003;
  print(number.ceil());
  print(number.ceilToDouble());

  print(number.floor());
  print(number.floorToDouble());

  print(13.3.round());
  print(13.3.roundToDouble());

  print(10.clamp(5, 15));
  print(5.clamp(10, 15));

  print(14.remainder(8));

  print(13.3.toInt());
  print(13.toDouble());
  print(10.toString());
  print(10.toStringAsExponential(2));
  print(10.toStringAsFixed(3));
  print(10.toStringAsPrecision(4));

  print(10.123456.truncate());
  print(10.123456.truncateToDouble());

  print(double.parse("30"));
  print(int.parse("30"));
  print(double.tryParse("X"));
  print(int.tryParse("X"));

  print(10.compareTo(20));

  // int
  print("int API");
  var integer = 3;

  print(integer.gcd(322));

  //??
  print(integer.modInverse(5));
  print(integer.modPow(2, 5));
  print(integer.toRadixString(10));
  print(integer.toSigned(300));
  print(integer.toUnsigned(200));

  // it also has bitwise operators

  // double

  // double are contagious - operations on double return double
}
