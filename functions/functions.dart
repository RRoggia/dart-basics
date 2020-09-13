var _nobleGases = {
  2: 'He',
  10: 'Ne',
  18: 'Ar',
  36: 'Kr',
  54: 'Xe',
  86: 'Rn',
  118: 'Og'
};

class Person {
  String name;
  Person(String name) {
    this.name = name;
  }
}

String getElementNameByAtomicNumber(int atomicNumber) {
  return _nobleGases[atomicNumber];
}

// infers type as dynamic ==> runtime error
getElementNameByAtomicNumber2(atomicNumber) {
  return getElementNameByAtomicNumber(atomicNumber);
}

// infers type as dynamic ==> runtime error
getElementNameByAtomicNumber3(atomicNumber) =>
    getElementNameByAtomicNumber(atomicNumber);

String getElementNameByAtomicNumber4(atomicNumber) =>
    getElementNameByAtomicNumber(atomicNumber);

//Anonymous function
Function getElementNameByAtomicNumber5 =
    (atomicNumber) => getElementNameByAtomicNumber(atomicNumber);

main() {
  var heliumAtomicNumber = 2;

  print(getElementNameByAtomicNumber(heliumAtomicNumber).toLowerCase());

  getElementNameByAtomicNumber2(heliumAtomicNumber).toLowerCase();

  // runtime exception
  //print(getElementNameByAtomicNumber2("teste").toLowerCase());

  //infers dynamic but can use String's method
  print(getElementNameByAtomicNumber3(heliumAtomicNumber).toLowerCase());

  // runtime exception
  //print(getElementNameByAtomicNumber3("teste").toLowerCase());

  //infers String - because is specified
  print(getElementNameByAtomicNumber4(heliumAtomicNumber).toLowerCase());

  // runtime exception
  //print(getElementNameByAtomicNumber4("teste").toLowerCase());

  //infers dynamic but can use String's method
  print(getElementNameByAtomicNumber5(heliumAtomicNumber).toLowerCase());

  // runtime exception
  //print(getElementNameByAtomicNumber5("teste").toLowerCase());

  //infers dynamic but can use String's method
  print(getElementNameByAtomicNumber5.call(heliumAtomicNumber).toLowerCase());

  // ==>> parameters <<==

  //defining positional param
  void enableFlags(positionalParam) {
    print('printing positionalParam $positionalParam');
  }

  enableFlags("massa");

  // defining named param
  void enableFlags2({bool bold, bool hidden}) {
    print('changed flags bold to $bold and hidden to $hidden');
  }

  // invoking named params
  enableFlags2(bold: true, hidden: false);

  //required name parameters needs a pub package.
  // enableSomething({ @required bool something}) {
  //   return true;
  // }

  // optional as positional parameters
  void say(String from, String msg, [String device]) {
    var result = '$from says $msg';
    if (device != null) {
      result = '$result with a $device';
    }
    print(result);
  }

  say("Renan", "Hello", "Motorola");

  // ====>> default values <<====
  void enableFlag3([bool flag = true]) {
    print("flag enabled $flag");
  }

  enableFlag3();
  enableFlag3(false);
  enableFlag3(null);

  // default Map, List and Set
  enableFlag5(
      {List<int> list = const [1, 2, 3],
      Map<String, String> gifts = const {
        'renan': 'roggia',
        'zenkner': 'roggia'
      },
      Set renan = const {'Testando', '123'}}) {
    print("$list $gifts $renan");

    List<int> listb = List.from(list);
    listb.add(5);
    print(listb);
  }

  enableFlag5();

  const lista = [10, 12, 13];
  enableFlag6({List list = lista}) {
    print(list);
  }

  enableFlag6();

  // ====>> by value vs by reference <<===

  // by value - it cannot change reference - change through assignment
  var list2 = [1, 2, 3];
  List<int> add2(List<int> lista) {
    lista = [8, 9, 0];
    return lista;
  }

  var x3 = add2(list2);
  print(x3);
  print(list2);

  // by value - it can change the reference
  var list = [1, 2, 3];

  List<int> add(List<int> lista) {
    lista.add(4);
    return lista;
  }

  var z = add(list);
  print(z);
  print(list);

  // ===> first-class citizin <===
  double getBrasilTaxRate(String taxName) {
    const taxes = {'ICMS': 80.5, 'PIS': 1.3};
    return taxes.containsKey(taxName) ? taxes[taxName] : 1;
  }

  double getEUTaxRate(String taxName) {
    const taxes = {'VAT': 1.5};
    return taxes.containsKey(taxName) ? taxes[taxName] : 1;
  }

  calculateTaxes(double amount, List<String> taxesNames, getTaxRate) {
    var taxRates = taxesNames.map(getTaxRate);
    return amount * taxRates.reduce((value, element) => value * element);
  }

  print("Order price: ${calculateTaxes(10.00, [
        'ICMS',
        'PIS'
      ], getBrasilTaxRate)}");

  print("Order price: ${calculateTaxes(10.00, ['VAT'], getEUTaxRate)}");
  print("Order price: ${calculateTaxes(10.00, ['ICMS', 'PIS'], getEUTaxRate)}");
}
