class ProductItem {
  final Product product;
  final int quantity;

  double get price => product.price * quantity;

  ProductItem({required this.product, this.quantity = 1});

  @override
  String toString() {
    // TODO: implement toString
    return product.name;
  }

  ProductItem updateQuantity(){
    return ProductItem(product: product, quantity: quantity + 1);
  }
}

class Product {
  final String id;
  final String name;
  final double price;

  String get displayName => "($initial)${name.substring(1)} - \$$price";
  String get initial => name.substring(0, 1);

  Product({required this.id, required this.name, required this.price});

  @override
  toString(){
    return name;
  }

  factory Product.fromJson(Map<String, Object> json){
    final id = json['id'] ?? "id";
    final name = json['name'] ?? "name";
    final price = json['price'] ?? 0.0;

    if(id is String && name is String && price is double){
      final product = Product(id: id, name: name, price: price);
      return product;
    }
    throw StateError('Failed. Invalid json!');
  }

  Map<String, Object> toJson(Product product){
    return {
      'id': product.id,
      'name': product.name,
      'price': product.price
    };
  }

  // final products = [
  //   Product(id: "1001", name: "Apples", price: 1.6),
  //   Product(id: "1002", name: "Banana", price: 0.7),
  //   Product(id: "1003", name: "Courgettes", price: 1.0),
  //   Product(id: "1004", name: "Grapes", price: 2.0),
  //   Product(id: "1005", name: "Mushrooms", price: 0.8),
  //   Product(id: "1006", name: "Potatoes", price: 1.5)
  // ];

  static List<Product> getProducts() {
    final products = <Product>[];
    final productsJson =
    [
      {
        "id": "1001",
        "name": "Apples",
        "price": 1.6
      },
      {
        "id": "1002",
        "name": "Banana",
        "price": 0.7
      },
      {
        "id": "1003",
        "name": "Courgettes",
        "price": 1.0
      },
      {
        "id": "1004",
        "name": "Grapes",
        "price": 2.0
      },
      {
        "id": "1005",
        "name": "Mushrooms",
        "price": 0.8
      },
      {
        "id": "1006",
        "name": "Potatoes",
        "price": 1.5
      }
    ];
    for(var json in productsJson){
      final product = Product.fromJson(json);
      products.add(product);
    }
    return products;
  }
}