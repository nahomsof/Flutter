// ignore: file_names
import 'package:flutter/material.dart';

import '../model/shoe.dart';

class ShoeTile extends StatelessWidget {
  Shoe shoe;
  ShoeTile({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          //shoe pic
          Image.asset(shoe.imagePath)

          //discription

          //price + detatil

          //botton to add cart
        ],
      ),
    );
  }
}
