abstract class Person {
  String firstName;
  String lastName;
  Person(this.firstName, this.lastName);

  String get fullName;
}

class Student extends Person {
  String nickName;

  Student(String firstName, String lastName, this.nickName)
      : super(firstName, lastName);

  @override
  String get fullName => "$firstName $lastName";

  @override
  String toString() => "$fullName, also know as $nickName";
}

main(List<String> args) {
  Person student = new Student("Wen", "Liang", "RyouMon");

  // Person p = new Person("Wen", "Liang");
  // The class 'Person' is abstract and can't be instantiated.

  print(student);
}
