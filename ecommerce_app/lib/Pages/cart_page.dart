import 'package:ecommerce_app/componenet/my_botton.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Remove this item to your cart"),
        actions: [
          MaterialButton(
            onPressed: () => context.read<Shop>().removeFromCart(product),
            child: Text("Yes"),
          ),
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: Text(
                  "User wantes to pay! Connect this app to your payment backend"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Cart Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
              child: cart.isEmpty
                  ? Text("Your cart is empty...")
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final item = cart[index];

                        return ListTile(
                          title: Text(
                            item.name,
                          ),
                          subtitle: Text(item.price.toString()),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => removeItemFromCart(context, item),
                          ),
                        );
                      })),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: MyButton(
                    onTap: () => payButtonPressed(context),
                    child: Text("PAY NOW")),
              ),
            ],
          )
        ],
      ),
    );
  }
}
