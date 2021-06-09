class Person {
  String firstName;
  String lastName;
  static String personLabel = "Person name:";

  Person(this.firstName, this.lastName);

  String get fullName => "$personLabel $firstName $lastName";
}

void main() {
  Person somePerson = Person("Wen", "Liang");
  Person anotherPerson = Person("Kana", "Hanazawa");

  print(somePerson.fullName); // prints Person name: Wen Liang
  print(anotherPerson.fullName); // prints Person name: Kana Hanazawa

  Person.personLabel = "name:";

  print(somePerson.fullName); // prints name: Wen Liang
  print(anotherPerson.fullName); // prints name: Kana Hanazawa
}
