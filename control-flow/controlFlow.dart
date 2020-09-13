main() {
  bool isRaining = true;
  if (isRaining) {
    print('Is raining');
  } else if (!isRaining) {
    print('Is not raining;');
  } else {
    print('is null');
  }

  for (var i = 0; i < 5; i++) {
    print(i);
  }

  var callbacks = [];
  for (var i = 0; i < 5; i++) {
    callbacks.add(() => print(i));
  }

  callbacks.forEach((element) =>
      element()); // don't need to know the current iterator counter

  var collection = [0, 1, 23];
  for (var element in collection) {
    print(element);
  }

  var runOnce = true;
  while (runOnce) {
    print('Run! while');
    runOnce = false;
  }

  do {
    print('Run! do while');
  } while (runOnce);

  while (true) {
    print('Run! and break;');
    break;
  }

  for (var i = 0; i < 6; i++) {
    if (i < 5) {
      continue;
    }
    print('Hello');
  }

  // switch
  var command = 'CONTINUA';

  switch (command) {
    case 'CLOSED':
      print('Fechado');
      break;
    case 'DEAL':
      print('negocio');
      break;
    aberto:
    case 'ABERTO':
    case 'OPEN':
      print('Aberto');
      break;
    case 'CONTINUA':
      print('Continuou');
      continue aberto;
    default:
      print('padrãozin');
  }
}
