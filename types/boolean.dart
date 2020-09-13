main() {
  const reallyTrue = true;
  const reallyFalse = false;

  print("$reallyTrue, $reallyFalse");

  var fullName = '';
  print(fullName.isEmpty);

  // Check for zero.
  var hitPoints = 0;
  print(hitPoints <= 0);

  // Check for null.
  var unicorn;
  print(unicorn == null);

  // Check for NaN.
  var iMeantToDoThis = 0 / 0;
  print(iMeantToDoThis.isNaN);
}
