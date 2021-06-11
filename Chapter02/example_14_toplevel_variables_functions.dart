var globalNumber = 100;
final globalFinalNumber = 1000;

void printHello() {
  print("""Dart from global scope.
    This is a top-level numer: $globalNumber
    This is a top-level final numer: $globalFinalNumber
    """);
}

main(List<String> args) {
  printHello(); // prints the default value

  globalNumber = 0;

  printHello(); // prints the new value
}
