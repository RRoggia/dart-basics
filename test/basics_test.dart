import 'package:test/test.dart';

main() {
  test("two plus two", () {
    var two = 2;

    expect(4, two + two);
  });
}
