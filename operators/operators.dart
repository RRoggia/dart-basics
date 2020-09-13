class Person {
  void iAm() {
    print("Iam person");
  }
}

class Professor extends Person {
  @override
  void iAm() {
    print("Iam professor");
  }
}

main() {
  var count = 0;
  print(count++);
  print(count--);

  String nullable = null;
  nullable?.substring(0);

  // prefix
  print(-count);
  print(--count);
  print(++count);
  print(~count); //bitwise negate
  print(!true);

  // multiplicative
  print(10 * 2);
  print(10 / 2);
  print(10 % 3); // remainder
  print(10 ~/ 3); // quotient

  //additivie
  print(10 + 2);
  print(10 - 8);

  //relational and type test
  print(10 >= 9);
  print(10 > 9);
  print(9 <= 10);
  print(9 < 10);

  print('renan' is String);
  print('renan' is! double);

  var professor = Professor();
  professor.iAm();

  var person = professor as Person;
  person.iAm();

  //equality
  print(10 == 10);
  print(10 != "10");

  //logical and
  print(10 == 10 && 10 != "10");

  // logical or
  print(10 == 10 || 10 != "10");

  //if null
  nullable ?? print("is null");
  nullable ??= "Not nullable anymore";

  //conditionary
  nullable == null ? print("is null") : print("is not null");

  //assignment
  var counter = 5.0;
  print(counter);

  counter *= counter;
  print(counter);

  counter /= counter;
  print(counter);

  counter += 1;
  print(counter);

  counter -= 2;
  print(counter);

  // cascade
}
