import 'dart:core';

import 'package:flutter/material.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier {
  //list of shoe for sele
  List<Shoe> shoeShop = [
    Shoe(
        name: "air-vapormax",
        description: "Cool shoe",
        imagePath: "lib/Images/air-vapormax-plus-mens-shoes(230).png",
        price: "230"),
    Shoe(
        name: "Dunk low retro",
        description: "Cool shoe",
        imagePath: "lib/Images/dunk-low-retro-mens-shoes(115).png",
        price: "115"),
    Shoe(
        name: "Lebron XXI",
        description: "Cool shoe",
        imagePath: "lib/Images/lebron-xxi-basketball-shoes(115).png",
        price: "115"),
    Shoe(
        name: "Calm",
        description: "Cool shoe",
        imagePath: "lib/Images/college-offcourt.png",
        price: "40"),
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
