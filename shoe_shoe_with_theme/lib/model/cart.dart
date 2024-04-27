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
        name: "Air Jordan High",
        description: "Cool shoe",
        imagePath: "lib/Images/air-jordan-1-retro-high(180).png",
        price: "180"),
    Shoe(
        name: "Jordan-jumpman",
        description: "Cool shoe",
        imagePath: "lib/Images/jordan-jumpman-pro-mens(88).png",
        price: "88"),
    Shoe(
        name: "Air Jordan low",
        description: "Cool shoe",
        imagePath: "lib/Images/air-jordan-1-low-mens-shoes(115).png",
        price: "115"),
    Shoe(
        name: "Air Jordan 12",
        description: "Cool shoe",
        imagePath: "lib/Images/air-jordan-12-retro-.png",
        price: "200"),
    Shoe(
        name: "creter impact'",
        description: "Cool shoe",
        imagePath: "lib/Images/crater-impact-womens-shoes(70).png",
        price: "70"),
    Shoe(
        name: "Jordan hydro 4",
        description: "Cool shoe",
        imagePath: "lib/Images/jordan.png",
        price: "70"),
    Shoe(
        name: "Jordan-post",
        description: "Cool shoe",
        imagePath: "lib/Images/jordan-post-mens(30).png",
        price: "30"),
    Shoe(
        name: "Air Max",
        description: "Cool shoe",
        imagePath: "lib/Images/air-max-dn-mens-shoes(150).png",
        price: "150"),
    Shoe(
        name: "Air Jordan3 fear",
        description: "Cool shoe",
        imagePath: "lib/Images/air-jordan-3-fear-mens-shoes(210).png",
        price: "210"),
    Shoe(
        name: "Jordan stay loyal",
        description: "Cool shoe",
        imagePath: "lib/Images/jordan-stay-loyal-3-mens(75).png",
        price: "75"),
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
