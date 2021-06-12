/**
 * person libray definition
 */
export 'programmer.dart';
export 'student.dart';

class Person {
  String firstName;
  String lastName;
  late PersonType type;

  Person(this.firstName, this.lastName);

  String toString() => "($type): $firstName $lastName";
}

enum PersonType { student, employee }
