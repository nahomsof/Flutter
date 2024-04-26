import 'dart:core';

import 'package:flutter/material.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier {
  //list of shoe for sele
  List<Shoe> shoeShop = [
    Shoe(
        name: "Air force 1 low",
        description: "Cool shoe",
        imagePath: "lib/Images/nike-air-force-1-low-.png",
        price: "\$100 - 140"),
    Shoe(
        name: "Air jordan 1 low",
        description: "Cool shoe",
        imagePath: "lib/Images/hoter.png",
        price: "\$100 - 140"),
    Shoe(
        name: "Splash 1 low",
        description: "Cool shoe",
        imagePath: "lib/Images/Splash.png",
        price: "\$100 - 140"),
    Shoe(
        name: "Air force 1 low",
        description: "Cool shoe",
        imagePath: "lib/Images/png.png",
        price: "\$100 - 140"),
  ];

  //list of items in  for sele
  List<Shoe> userCart = [];

  //get list of shoe for sele
  List<Shoe> getUsershoe() {
    return shoeShop;
  }

  //get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  //add item to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
