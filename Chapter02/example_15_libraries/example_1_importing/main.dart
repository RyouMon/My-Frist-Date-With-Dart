/**
 * importing the person_lib.dart
 */
import 'person_lib.dart';
// import 'person_lib.dart' show Employee, Student;
// import 'person_lib.dart' hide Person;

void main(List<String> args) {
  Person employee = Employee("Wen", "Liang");
  Person student = Student("Kana", "Hanazawa");

  print("Employee: ${employee.fullName}, type: ${employee.type}");
  print("Student: ${student.fullName}, type: ${student.type}");
}
