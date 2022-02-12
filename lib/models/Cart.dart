import 'package:dart_complete_guide/models/Product.dart';

class Cart {
  final productItems = <ProductItem>[];

  addToCart(ProductItem item){
    final index = productItems.indexOf(item);
    var productItem = productItems[index];
    if(productItem == null){
      productItem = ProductItem(product: item.product, quantity: 1);
    } else {
      productItem = ProductItem(product: item.product, quantity: item.quantity + 1);
    }
    productItems.add(productItem);
  }
}