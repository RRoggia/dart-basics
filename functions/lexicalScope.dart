bool topLevel = true;

//closes over addBy
Function makeAdder(int addBy) {
  var total = 0; //closes over total
  var name = "renan"; // don't closes over name
  return (int i) {
    total += addBy + i;
    return total;
  };
}

main() {
  var isInsideMain = true;

  myFunction() {
    var isInsideMyFunction = true;

    nestedFuction() {
      var isInsideNestedFunction = true;

      print(topLevel);
      print(isInsideMain);
      print(isInsideMyFunction);
      print(isInsideNestedFunction);
    }

    nestedFuction();
  }

  myFunction();

  var addToTotalTwoPlus = makeAdder(2);

  print(addToTotalTwoPlus(3));
  print(addToTotalTwoPlus(5));
}
