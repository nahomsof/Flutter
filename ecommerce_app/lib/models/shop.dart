import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
        description: "Item description.. more description......",
        price: 200,
        name: "Prodcution 1",
        imagePath: 'lib/Images/AirPods-Pro-2nd-Gen-Gear.png'),
    Product(
        description: "Item description..",
        price: 30.99,
        name: "Prodcution 2",
        imagePath: 'lib/Images/hodi.png'),
    Product(
        description: "Item description..",
        price: 25.99,
        name: "Prodcution 3",
        imagePath: 'lib/Images/NV1923-F02.png'),
    Product(
        description: "Item description..",
        price: 125,
        name: "Prodcution 4",
        imagePath: 'lib/Images/air-jordan-1-mid-shoes-X5pM09.png'),
  ];

  List<Product> _cart = [];

  List<Product> get shop => _shop;

  List<Product> get cart => _cart;
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
