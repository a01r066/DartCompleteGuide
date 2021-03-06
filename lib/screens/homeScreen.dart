import 'package:dart_complete_guide/models/Cart.dart';
import 'package:dart_complete_guide/models/Product.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../models/dartCompleteGuide.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // basicClass();
    // advancedClass();
    // eCommerceApp
    // Mixin & extension
    // mixinsAndExtensions();
    // asynchronousProgramming();
    // downCounter();
    // stream();
    streamConstructor();
  }

  Future<void> streamConstructor() async {
    final stream = Stream.fromIterable([1, 3, 5, 7, 9]);
    // Stream methods
    // print("stream.first: ${await stream.first}");
    // await stream.forEach((element) => print(element));
    final doubles = stream.map((element) => element * 3).where((value) => value > 3);
    await doubles.forEach((element) {print(element);});
    // Stream.value(10);
    // Stream.error(Exception('Something went wrong!'));
    // Stream.empty();
    // Stream.fromFuture(Future.delayed(Duration(seconds: 1), () => 42));
    // Stream.periodic(Duration(seconds: 1), (index) => index);
  }

  Future<void> stream() async {
    // stream generator
    final streamGenerator = SumStream();
    // challenge stream
    final stream = streamGenerator.fizzBuzz(15);
    await for(var item in stream){
      print(item);
    }

    // final stream = streamGenerator.streamGenerator(4);
    // print("Sum1: ${ await streamGenerator.sumStream(stream)}");

    // final stream = Stream<int>.fromIterable([1, 3, 5, 7, 9]);
    // // final sumStream1 = SumStream();
    // // print("Sum1: ${await sumStream1.sumStream(stream)}");
    // final sumStream2 = SumStream();
    // print("Sum2: ${await sumStream2.sumStream2(stream)}");
  }

  Future<void> downCounter() async {
    final countDown = CountDown();
    await countDown.countDown(5);
    print("Finished!");
  }

  Future<void> fetchOrder() async {
    final coffeeShop = CoffeeShop();
    print("Program started:");
    try {
      final order1 = await coffeeShop.fetchOrders();
      print(order1);
    } catch (e){
      print(e);
    } finally {
      print("Done!");
    }
  }

  asynchronousProgramming() async {
    // await, async
    fetchOrder();
    // final coffeeShop = CoffeeShop();
    // final order2 = await coffeeShop.fetchOrders2();
    // print(order2);
    // final order3 = await coffeeShop.fetchOrders3();
    // Future with catchError().WhenComplete()
    // final coffeeShop = CoffeeShop();
    // coffeeShop
    //     .fetchOrders()
    //     .then((order) => print(order))
    // .catchError((err) => print(err))
    // .whenComplete(() => print("Done"));
  }

  testFractionException() {
    try {
      final email = EmailAddress('amail.com');
      print(email);
    } on FormatException catch (e) {
      print(e);
    } on Exception catch (e) {
      print(e);
    } finally {
      print('Test email done!');
    }

    try {
      final f = Fraction(3, 0);
      print(f.value);
    } on PrimaryPointerGestureRecognizer catch (e) {
      print(e);
    } on Exception catch (e) {
      print(e);
    } finally {
      print('Test fraction done!');
    }
  }

  mixinsAndExtensions() {
    print(1.toRange(2));
    // PositiveInt(-1);
    // PositiveInt.signIn('a@mail.com', '');
    // Exceptions
    testFractionException();
    print('done');
  }

  basicClass() {
    final restaurant1 = Restaurant(
        name: "Restaurant 1", cuisine: "Kimchi", ratings: [3.5, 4.3, 2.5, 5.4]);
    print("Restaurant1's average rating1: ${restaurant1.averageRating1()}");
    print("Restaurant1's average rating2: ${restaurant1.averageRating2()}");
    // Named constructor
//   final fahrenheit = Temperature.celsius(32);
//   final celsius = Temperature.farenheit(32);
//   print("fahrenheit: ${fahrenheit.celsius}");
//   print("celsius: ${celsius.celsius}");
    final temp1 = Temperature.celsius(30);
    print("temp1: ${temp1.celsius}");
    temp1.farenheit;
    print("temp1: ${temp1.farenheit}");

    // Constant named constructor
    const zero = Complex.zero();
    const identity = Complex.identity();
    const real = Complex.real(3);
    const imaginary = Complex.imaginary(4);

    // Class with Constructor
    // final tom = Person(name: "Tom", age: 22, height: 1.96);
    // final jessica = Person(name: "Jessica", age: 25, height: 1.75);
    // tom.printDesc();
    // jessica.printDesc();

    List<double> numbers = [1.0, 3.0, 5.0, 7.0, 9.0];
    var cong = sum(numbers);
    print(cong);

    var nhan = multiply(numbers);
    print(nhan);

    const pizzaPrices = {
      'margherita': 5.5,
      'pepperroni': 7.5,
      'vegetarian': 6.5
    };

    const orders = ['margherita', 'pepperroni', 'pineapple'];

    final totalPrice = calcTotal(prices: pizzaPrices, orders: orders);
    print("Total price: \$$totalPrice");

    const multiplyTime = 2;
    const values = [1, 3, 5, 7, 9, 2, 4, 6, 8, 9];
    const dValues = [1.0, 3.0, 5.0, 7.0, 9.0];

    // Lazy Iterator
//   List<int> doubleValues = values.map((value) => value * multiplyTime).toList();
    print("values: $values");
//   print("doubleValues: $doubleValues");
    final doubleValues = doubleItems(values);
    print("doubleValues: $doubleValues");

    // Generic type
    final transformIntValues = transform<int, int>(values, (x) => x * 2);
    print("transformIntValues: $transformIntValues");
//   final transformDoubleValues = transform<double>(dValues, (x) => x * 2);
//   print("transformDoubleValues: $transformDoubleValues");
    final transformDoubleValues =
        transform<double, int>(dValues, (x) => x.round());
    print("transformDoubleValues: $transformDoubleValues");

    // Filter items by where | firstWhere
    final filterValues = values.where((value) => value % 2 == 0);
    print("filterValues: $filterValues");
    final firstValue =
        values.firstWhere((value) => value == 9, orElse: () => -1);
    print("firstValue: $firstValue");

    // Challenges with collection, generic & filter by where
    const challengeList = [1, 3, 5, 7, 9, 2, 4, 6, 8];
    final oddList = whereOdds<int>(challengeList, (value) => value % 2 == 1);
    print("oddList: $oddList");

    // Challenges with collection, generic & filter by where
//   final filterNumber = challengeList.firstWhere((value) => value == 55, orElse: () => -1);
    final filterNumber = firstWhere<int>(challengeList, (value) => value == 55,
        orElse: () => -1);
    print("filterNumber: $filterNumber");

    // Reduce
    final sumWithReduce =
        challengeList.reduce((value, element) => value + element);
    print("sumWithReduce: $sumWithReduce");

    // list.map().where
    const emails = [
      'abc@abc.com',
      'def@def.co.uk',
      'abc@gmail.com',
      'def@yahoo.com'
    ];

    const knownDomains = ['gmail.com', 'yahoo.com'];
//   final getUnknownDomains = emails.map((email) => email.split('@').last).where((domain) => !knownDomains.contains(domain));
    final unknownDomains = getUnknownDomains(emails, knownDomains);
    print("UnknownDomains: $unknownDomains");
    final unknownDomains2 = getUnknownDomains2(emails, knownDomains);
    print("UnknownDomains2: $unknownDomains2");
  }

  advancedClass() {
    // Copy an object
    const credential = Credential();
    final cred1 = credential.copyWith(email: 'a@mail.com');
    final cred2 = cred1.copyWith(password: 'admin123');
    print('cred1: $cred1');
    print('cred2: $cred2');

    // Challenge - Factory constructor (Mapping json to objects, objects to json)
    final personsJson = [
      {'name': 'Andrea', 'age': 19},
      {'name': 'Christina', 'age': 22}
    ];
    // Mapping json to objects
    final persons = [];
    for (var personJson in personsJson) {
      final person = Person.fromJson(personJson);
      persons.add(person);
      print("Name: ${person.name} - Age: ${person.age}");
    }
    // Mapping objects to json
    for (var person in persons) {
      print(person.toJson());
    }

    // Factory constructor
    final shapesJson = [
      {'type': 'circle', 'radius': 5.0},
      {'type': 'square', 'side': 3.0},
      // {
      //   'type': 'triangle'
      // }
    ];
    for (var shapeJson in shapesJson) {
      final shape = Shape.fromJson(shapeJson);
      shape.printArea();
      shape.printPerimeter();
    }

    // Composition <-> has-a relationship. Ex. Stack has a List<T>
    // Inheritance <-> is-a relationship. Ex. MyText is a String
    final myButton =
        MyButton(child: MyText("Hello"), onPressed: () => print("Clicked!"));

    // Generic class
    final numStack = MyStack<int>();
    numStack.push(1);
    numStack.push(2);
    print(numStack.pop());
    final stringStack = MyStack<String>();
    stringStack.push('Andrea');
    stringStack.push("Tonny");
    stringStack.pop();
    print(stringStack.pop());

    // equatable plugin
    final points = [Point(1, 2), Point(3, 4)];
    for (var point in points) {
      print(point);
    }
    print(Point(1, 1) == Point(1, 1));
    print(Point(1, 1) == Point(1, 2));

    // toString() override method
    // final points = [ Point(1, 2), Point(3, 4)];
    // for (var point in points) {
    //   print(point);
    // }
    // print(Point(1, 1) == Point(1, 1));
    print(Point(1, 2) + Point(3, 4));
    print(Point(2, 3) * 5);

    // Abstract class
    final square = Square(3);
    final circle = Circle(5);
    final shapes = [square, circle];
    for (var shape in shapes) {
      shape.printArea();
      shape.printPerimeter();
    }

    // Subclassing (inheritance) and override
    final animal = Animal(age: 10);
    animal.sleep();
    final dog = Dog(age: 3);
    dog.bak();
    dog.sleep();
    final cow = Cow(age: 5);
    cow.moo();
    final cleverDog = CleverDog(age: 2);
    cleverDog.sleep();
    cleverDog.bak();
    cleverDog.catchBall();
  }

  calcPizzaPrice(Map<String, dynamic> pizzaPrices) {
    String status = "";
    var totalPrice = 0.0;
    // for(var key in pizzaPrices.keys){
    //   print(key);
    // }

    // for(var value in pizzaPrices.values){
    //   totalPrice += value;
    // }

    for (var entry in pizzaPrices.entries) {
      totalPrice += entry.value;
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Total: \$$totalPrice'),
        ],
      ),
    );
  }

  var restaurants = [
    {
      'name': 'name 1',
      'cuisine': 'cuisine 1',
      'ratings': [3.1, 4.5, 5.0]
    },
    {
      'name': 'name 2',
      'cuisine': 'cuisine 2',
      'ratings': [3.2, 4.6, 5.0]
    },
    {
      'name': 'name 3',
      'cuisine': 'cuisine 3',
      'ratings': [3.3, 4.7, 5.0]
    }
  ];

  // productsList() {
  //   final products = Product.getProducts();
  //   final cart = Cart();
  //   final carts = <Cart>[];
  //   List<Widget> productsList = [];
  //   for (var product in products) {
  //     productsList.add(Container(
  //       child: Padding(
  //         padding: EdgeInsets.symmetric(vertical: 8),
  //         child: GestureDetector(
  //           onTap: () {
  //             showDialog(
  //                 context: context,
  //                 builder: (context) {
  //                   return AlertDialog(
  //                     title: Text("Product detail"),
  //                     content: Text(product.name),
  //                     actions: [
  //                       FlatButton(onPressed: (){
  //                         // print("${product.name} added to cart!");
  //                         cart.addToCart(ProductItem(product: product));
  //                         print("Cart: ${cart.productItems.length}");
  //                         Navigator.of(context).pop();
  //                       }, child: Text("Add to cart"))
  //                     ],
  //                   );
  //                 });
  //           },
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text(product.id),
  //               Text(product.name),
  //               Text("\$${product.price}")
  //             ],
  //           ),
  //         ),
  //       ),
  //     ));
  //   }
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: productsList,
  //   );
  // }

  everageRatingScore(dynamic restaurants) {
    List<Widget> restaurantList = [];
    for (var restaurant in restaurants) {
      double totalRating = 0.0;
      double averageRating = 0.0;

      final ratings = restaurant['ratings'] as List<double>;
      for (int i = 0; i < ratings.length; i++) {
        totalRating += ratings[i];
      }
      averageRating = totalRating / ratings.length;

      final averageRatingStr = averageRating.toStringAsFixed(2);
      restaurantList.add(Container(
        child: Text('Average rating: $averageRatingStr'),
      ));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: restaurantList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dart Complete Guide"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              everageRatingScore(restaurants)
              // productsList()
            ],
          ),
        ),
      ),
    );
  }
}
