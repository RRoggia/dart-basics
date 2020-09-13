main() {
  var s1 = 'Single quotes work well for string literals.';
  var s2 = "Double quotes work just as well.";
  var s3 = 'Itescaped_code#39;s easy to escape the string delimiter.';
  var s4 = "It's even easier to use the other delimiter.";

  print(s1);
  print(s2);
  print(s3);
  print(s4);

  var name1 = 'renan';

  print(
      'using uppercase to demonstrate expression: my name is ${name1.toUpperCase()} in uppercase.');
  print(
      'skipping the {} if the expressions is an identifier my name is $name1');

  var contatenation = 'String' + ' Concatenation' + " works no matter what";
  print(contatenation);

  var concatenation2 = 'testing'
      ' breaking line'
      " concatenation"
      " name is $name1";
  print(concatenation2);

  var multiline = """
  line1
  line2
  line 3
  pineapple
  """;
  print(multiline);

  var rawString = r'In a raw string not even \n gets special treatment.';
  print(rawString);

  rawString = r"\n testando 123";
  print(rawString);

  rawString = r"""
  raw1
  raw2 \n 
  raw3\n
  """;
  print(rawString);

  //interpolation within raw strings
  rawString = r" ${name1} $name1 \n testing";
  print(rawString);

  //concatenating 2 raw strings
  var rawAnotherString = r'Some different $raw';
  print(rawString + rawAnotherString);

  //concatenating raw string with string
  print(rawString + " aqui \ntesting");

  //interpolation with raw strings
  print("$rawString $rawAnotherString");
}
