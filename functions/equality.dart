void foo() {} // A top-level function

class A {
  static void bar() {} // A static method
  void baz() {} // An instance method
}

void main() {
  var fooReference = foo;
  print("is foo equals to fooReference; ${foo == fooReference}");

  var staticBarReference = A.bar;
  print(
      "is A.bar equals to staticBarReference? ${A.bar == staticBarReference}");

  var instance1 = A();
  var instance2 = A();
  var referenceToInstance2 = instance2;
  var referecenToInstance2Baz = instance2.baz;

  print(
      "Are baz of the same instance equals? ${referenceToInstance2.baz == referecenToInstance2Baz}");

  print(
      "Are baz of the different instances equals? ${instance1.baz == referenceToInstance2.baz}");
}
