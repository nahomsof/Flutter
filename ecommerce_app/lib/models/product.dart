import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String description;
  final String imagePath;

  Product({
    required this.description,
    required this.price,
    required this.imagePath,
    required this.name,
  });
}
