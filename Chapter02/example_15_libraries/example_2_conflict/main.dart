import 'a.dart' as libraryA;
import 'b.dart' as libraryB;

void main(List<String> args) {
  libraryA.Person personA = libraryA.Person("Wen", "Liang");

  print("Person A: ${personA.fullName}");

  libraryB.Person personB = libraryB.Person();
  print("Person B: ${personB}");
}
