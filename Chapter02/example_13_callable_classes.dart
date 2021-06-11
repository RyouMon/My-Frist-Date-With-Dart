class ShouldWriteAProgram {
  String language;
  String platform;

  ShouldWriteAProgram(this.language, this.platform);

  // this sepcial method named 'call' makes the class behave as a function
  bool call(String category) {
    if (language == "Dart" && platform == "Flutter") {
      return category != "todo";
    }
    return false;
  }
}

main(List<String> args) {
  var shouldWrite = ShouldWriteAProgram("Dart", "Flutter");

  print(shouldWrite("todo"));

  Function shouldWriteFunction = shouldWrite;
  print(shouldWriteFunction("todo"));
}
