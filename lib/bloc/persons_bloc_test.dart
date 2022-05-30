import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:testingbloc/bloc/person.dart';

const mockedPersons1 = [
  Person(
    name: 'foo',
    age: 20,
  ),
  Person(
    name: 'Bar',
    age: 30,
  ),
];
const mockedPersons2 = [
  Person(
    name: 'foo',
    age: 20,
  ),
  Person(
    name: 'Bar',
    age: 30,
  ),
];

Future<Iterable<Person>> mocGetPerson1(String _) =>
    Future.value(mockedPersons1);
Future<Iterable<Person>> mocGetPerson2(String _) =>
    Future.value(mockedPersons2);

void main() {
  group('Testing bloc', () {});
}
