import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
        description: "Item description.. more description......",
        price: 99.99,
        name: "Prodcution 1"),
    Product(
        description: "Item description..", price: 99.99, name: "Prodcution 1"),
    Product(
        description: "Item description..", price: 99.99, name: "Prodcution 1"),
    Product(
        description: "Item description..", price: 99.99, name: "Prodcution 1"),
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
