class Person {
  String firstName;
  String lastName;

  String get fullName => "$firstName, $lastName";

  Person(this.firstName, this.lastName);
}

class Student extends Person {
  String nickName;

  Student(String firstName, String lastName, this.nickName)
      : super(firstName, lastName);

  @override
  String toString() => "$fullName, also known as $nickName";
}

main() {
  Student student = new Student("Wen", "Liang", "WenSan");

  print(student); // same sa calling student.toString()
  // prints Wen, Liang, also known as WenSan
}
