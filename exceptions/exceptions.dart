main() {
  //throw FormatException('At least 1 section expected');
  //throw 'Renan';

  //void fail() => throw UnimplementedError();
  //fail();

  try {
    throw FormatException('erro');
  } on FormatException {
    print('recuparado');
  }

  try {
    throw 'Renan';
  } on FormatException catch (e) {
    print('recuperado $e');
  } on UnimplementedError {
    print('Should implement');
  } catch (e) {
    print("deu pra recuperar não: $e");
  }

  try {
    throw FormatException('mais um erro');
  } catch (e, s) {
    print("erro $e");
    print("stack $s");
  }

  try {
    try {
      throw FormatException("ainda mais um erro");
    } catch (e) {
      print("$e");
      rethrow;
    }
  } catch (e) {
    print("$e só pra seguir");
  }

  try {
    throw 'error';
  } catch (e) {
    print('passou no catche');
  } finally {
    print('finally');
  }

  try {
    throw 'Erro';
  } finally {
    print("passou no finaly");
  }
}
