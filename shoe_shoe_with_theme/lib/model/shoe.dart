import 'package:flutter/material.dart';

class Shoe extends ChangeNotifier {
  final String price;
  final String name;
  final String imagePath;
  final String description;
  Shoe(
      {required this.name,
      required this.description,
      required this.imagePath,
      required this.price});
}
