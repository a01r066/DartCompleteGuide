import 'dart:math';
import 'package:equatable/equatable.dart';

// Asynchronous programming
// Stream
class SumStream {
  var sum = 0;

  // Challenge stream
  Stream<String> fizzBuzz(int n) async* {
    for(var i = 1; i <= n; i++){
      await Future.delayed(Duration(milliseconds: 500));
      if(i%3 == 0 && i%5 == 0){
        yield "Fizz Buzz";
      } else if (i%3 == 0){
        yield "Fizz";
      } else if(i%5 == 0){
        yield "Buzz";
      } else {
        yield "$i";
      }
    }
  }

  Future<int> sumStream(Stream<int> stream) async {
    await for (var item in stream) {
      sum += item;
    }
    return sum;
  }

  // stream & iterable is identical but
  // stream is asynchronous
  Stream<int> streamGenerator(int n) async* {
    for(var i = 0; i < n; i++){
      print("Stream: $i");
      yield i;
    }
  }

  // iterable is synchronous
  Iterable<int> iterableGenerator(int n) sync* {
    for(var i = 0; i < n; i++){
      print("Iterable: $i");
      yield i;
    }
  }

  Future<int> sumStream2(Stream<int> stream) async {
    final sum = await stream.reduce((previous, element) => previous + element);
    return sum;
  }
}

// Future, await, async
class CountDown {
  Future<void> countDown(int n) async {
    var counter = n;
    while (counter >= 0) {
      await Future.delayed(Duration(seconds: 1), () {
        print(counter);
        counter -= 1;
      });
    }
    print("Done");
  }
}

// Future.delayed
class CoffeeShop {
  Future<String> fetchOrders() => Future.delayed(
      Duration(seconds: 2),
      // () => throw Exception('Out of milk!')
      () => "Capuchino");

  // For testing in case of value return immediately
  Future<String> fetchOrders2() => Future.value("Espresso");

  Future<String> fetchOrders3() => Future.error(UnimplementedError());
}

// Challenge - Exceptions
class EmailAddress {
  final String email;

  EmailAddress(this.email) {
    // assert(email.isNotEmpty);
    // assert(email.contains('@'));
    if (email.isEmpty) {
      throw FormatException('Email should not be empty!');
    }

    if (!email.contains('@')) {
      throw FormatException('$email doesn\'t not contain @');
    }
  }

  @override
  String toString() {
    // TODO: implement toString
    return email;
  }
}

// Exceptions
class Fraction {
  final int numerator;
  final int denominator;

  Fraction(this.numerator, this.denominator) {
    if (denominator == 0) {
      throw IntegerDivisionByZeroException();
    }
  }

  double get value => numerator / denominator;
}

// Assert
class PositiveInt {
  final int value;

  PositiveInt(this.value) : assert(value >= 0, 'Value cannot nagative!');

  static signIn(String email, String password) {
    assert(email.isNotEmpty, 'Email is empty!');
    assert(password.isNotEmpty, 'Password is empty!');
  }
}

// Mixins & Extensions
extension NumberToRange on int {
  List<int>? toRange(int max) {
    final range = <int>[];
    var current = this;
    if (max >= current) {
      for (current; current <= max; current++) {
        range.add(current);
      }
      return range;
    } else {
      return null;
    }
  }
}

// Copy an object
class Credential {
  final String email;
  final String password;

  const Credential({this.email = '', this.password = ''});

  Credential copyWith({String? email, String? password}) {
    return Credential(
        email: email ?? this.email, password: password ?? this.password);
  }

  @override
  String toString() {
    return 'Credential($email, $password)';
  }
}

// Factory constructor (Mapping json to objects, objects to json)
class Person {
  final String name;
  final int age;

  const Person({required this.name, required this.age});

  factory Person.fromJson(Map<String, Object> json) {
    final name = json['name'];
    final age = json['age'];

    if (name is String && age is int) {
      return Person(name: name, age: age);
    }
    throw StateError('Could not read name & age!');
  }

  Map<String, Object> toJson() {
    return {'name': name, 'age': age};
  }
}

// Compositional (has-a) & Inheritance (is-a)
abstract class MyWidget {}

class MyText extends MyWidget {
  final String text;

  MyText(this.text);
}

class MyButton extends MyWidget {
  final MyWidget child;
  final void Function()? onPressed;

  MyButton({required this.child, required this.onPressed});
}

// Generic class
class MyStack<T> {
  final List<T> _items = [];

  void push(T item) => _items.add(item);

  T pop() => _items.removeLast();
}

// Equatable plugin
class Point extends Equatable {
  final int x;
  final int y;

  Point(this.x, this.y);

  @override
  // TODO: implement props
  List<Object?> get props => [x, y];

  @override
  bool get stringify => true;

  // @override
  // String toString() {
  //   return 'Point($x, $y)';
  // }
  //
  // bool operator ==(covariant Point point) {
  //   return x == point.x && y == point.y;
  // }

  Point operator +(covariant Point p2) {
    return Point(x + p2.x, y + p2.y);
  }

  Point operator *(int value) {
    return Point(x * value, y * value);
  }
}

// Abstract class
// Factory constructor
abstract class Shape {
  double get area;

  double get perimeter;

  const Shape();

  factory Shape.fromJson(Map<String, Object> json) {
    final type = json['type'];
    switch (type) {
      case 'circle':
        final radius = json['radius'];
        if (radius is double) {
          return Circle(radius);
        }
        throw UnsupportedError('Invalid or missing radius property!');
      case 'square':
        final side = json['side'];
        if (side is double) {
          return Square(side);
        }
        throw UnsupportedError("Invalid or missing side property!");
      default:
        throw UnsupportedError("Invalid $type property");
    }
  }

  printArea() {
    print("Area: $area");
  }

  printPerimeter() {
    print("Perimeter: $perimeter");
  }
}

class Square extends Shape {
  final double side;

  Square(this.side);

  @override
  double get area => side * side;

  @override
  double get perimeter => 4 * side;
}

class Circle extends Shape {
  final double radius;

  Circle(this.radius);

  @override
  double get area => pi * radius * radius;

  @override
  double get perimeter => 2 * pi * radius;
}

class Animal {
  final int age;

  Animal({required this.age});

  void sleep() => print("Sleep...");
}

class Dog extends Animal {
  Dog({required int age}) : super(age: age);

  void bak() => print("Bak...");

  @override
  void sleep() {
    // super.sleep();
    print("Dog sleep some more...");
  }
}

class Cow extends Animal {
  Cow({required int age}) : super(age: age);

  void moo() => print("Moo");
}

class CleverDog extends Dog {
  CleverDog({required int age}) : super(age: age);

  void catchBall() => print("Catch ball...");
}

// Class with get/set methods
class Restaurant {
  final String name;
  final String cuisine;
  final List<double> ratings;

  const Restaurant(
      {required this.name, required this.cuisine, required this.ratings});

  int get numRatings => ratings.length;

  double? averageRating1() {
    if (ratings.isEmpty) {
      return null;
    }
    return ratings.reduce((value, element) => (value + element)) / numRatings;
  }

  double? averageRating2() {
    var total = 0.0;
    if (ratings.isEmpty) {
      return null;
    }
    for (var item in ratings) {
      total += item;
    }
    return total / numRatings;
  }
}

// Named constructor
class Temperature {
  Temperature.celsius(this.celsius);

  Temperature.farenheit(double farenheit) : celsius = (farenheit - 32) * 5 / 9;
  double celsius;

  double get farenheit => celsius * 1.8 + 32;

  set farenheit(double farenheit) => (farenheit - 32) * 5 / 9;
}

// Named constructor
class Complex {
  const Complex(this.re, this.im);

  const Complex.zero()
      : re = 0,
        im = 0;

  const Complex.identity()
      : re = 1,
        im = 0;

  const Complex.real(this.re) : im = 0;

  const Complex.imaginary(this.im) : re = 0;

  final double re;
  final double im;
}

// Functional programming style - can make code easier write and read
Iterable<String> getUnknownDomains(
        List<String> emails, List<String> knownDomains) =>
    emails
        .map((email) => email.split('@').last)
        .where((domain) => !knownDomains.contains(domain));

// Imperative programming style - Sequence of steps + control flow statements
Iterable<String> getUnknownDomains2(
    List<String> emails, List<String> knownDomains) {
  var unknownDomains = <String>[];
  for (String email in emails) {
    final domain = email.split('@').last;
    if (!knownDomains.contains(domain)) {
      unknownDomains.add(domain);
    }
  }

  return unknownDomains;
}

T firstWhere<T>(List<T> list, bool Function(T) f,
    {required T Function() orElse}) {
  for (var item in list) {
    if (f(item)) {
      return item;
    }
  }
  return orElse();
}

List<T> whereOdds<T>(List<T> list, bool Function(T) f) {
  var results = <T>[];
  for (var item in list) {
    if (f(item)) {
      results.add(item);
    }
  }

  return results;
}

List<R> transform<T, R>(List<T> list, R Function(T) f) {
  var result = <R>[];
  for (var item in list) {
    result.add(f(item));
  }
  return result;
}

// List<T> transform<T>(List<T> list, T Function(T) f){
//   var result = <T>[];
//    for (var item in list){
//     result.add(f(item));
//   }
//   return result;
// }

// List<int> transform(List<int> list, int Function(int) f){
//   var result = <int>[];
//    for (var item in list){
//     result.add(f(item));
//   }
//   return result;
// }

List<int> doubleItems(List<int> list) {
  var result = <int>[];
  for (var item in list) {
    result.add(item * 2);
  }
  return result;
}

double calcTotal({prices, orders}) {
  var total = 0.0;

  for (var item in orders) {
    final price = prices[item];
    if (price != null) {
      total += price;
    }
  }

  return total;
}

double sum(List<double> numbers) {
  var result = 0.0;
  for (var number in numbers) {
    result += number;
  }
  return result;
}

double multiply(List<double> numbers) {
  var result = 1.0;
  for (var number in numbers) {
    result *= number;
  }
  return result;
}
