import 'dart:io';
import 'package:dart_complete_guide/models/Cart.dart';
import 'package:dart_complete_guide/models/Product.dart';

void main() {
  // Loop
  // Prompt: view cart/ add item/ checkout
  // if selection == add item
  //    choose a product
  //    add it to the cart
  //    print cart
  // else if selection == view cart
  //    print cart
  // else if selection == checkout
  //    do checkout
  // exit

  final allProducts = Product.getProducts();
  final cart = Cart();

  Product? chooseProduct(){
    final productsList = allProducts.map((product) => product.displayName).join('\n');
    stdout.write('Available products\n$productsList\nlYour choice: ');
    final line = stdin.readLineSync();
    for(var product in allProducts){
      if(product.initial == line){
        return product;
      }
    }
    print('Not found');
    return null;
  }

  viewCart(){
    for(var item in cart.productItems){
      print(item);
    }
  }

  checkout(){
    print("Selected items\n");
    for(var item in cart.productItems){
      print('Product: ${item.product.name} - Qty: ${item.quantity}');
    }
    print('--------');
    print('Total amount: ');
  }

  while(true){
    stdout.write('What do you want to do? (v) view cart, (a) add item, (c) checkout');
    final line = stdin.readLineSync();
    if(line == 'a'){
      final product = chooseProduct();
      if(product != null){
        cart.addToCart(ProductItem(product: product));
        for(var item in cart.productItems){
          print(item);
        }
      }
    } else if (line == 'v'){
      viewCart();
    } else if (line == 'c'){
      checkout();
    }
  }
}