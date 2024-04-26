import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sniker_tute/components/CartItem.dart';
import 'package:sniker_tute/model/cart.dart';
import 'package:sniker_tute/model/shoe.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Text(
                    "My Cart",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: ListView.builder(itemBuilder: (context, index) {
                    //get individual shoe
                    Shoe individualshoe = value.getUserCart()[index];
                    return CartItem(
                      shoe: individualshoe,
                    );
                    //
                  }))
                ],
              ),
            ));
  }
}
