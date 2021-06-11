abstract class Person {
  String firstName;
  String lastName;
  Person(this.firstName, this.lastName);

  String get fullName;
}

class Student implements Person {
  String firstName;
  String lastName;
  String nickName;

  Student(this.firstName, this.lastName, this.nickName)

  @override
  String get fullName => "$firstName $lastName";

  @override
  String toString() => "$fullName, also know as $nickName";
}

main(List<String> args) {
  Person student = new Student("Wen", "Liang", "RyouMon");

  print(student);
}
