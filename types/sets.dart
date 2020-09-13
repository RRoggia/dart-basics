main() {
  var books = {
    'Carrosel sombrio e outras histórias',
    'Sul da fronteira oeste do sol',
    'Todos os nossos ontems'
  };

  //books.add(1); //type not assignable

  var emptySet = <String>{};
  Set<String> emptySet2 = {};
  print(emptySet);
  print(emptySet2);

  const constantSet = {'fluorine', 'chlorine'};
  //const Set<String> constantSet = {'fluorine', 'chlorine'};
  //final constantSet = const {'fluorine', 'chlorine'};
  print(constantSet);
  //constantSet.add('teste');
  var a = 1;
}
