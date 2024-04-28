import 'package:ecommerce_app/componenet/my_drawer.dart';
import 'package:ecommerce_app/componenet/my_product_tile.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Shop Page"),
        ),
        drawer: MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ListView(
          children: [
            //Shop name

            //shop subtitile
            Center(
                child: Text(
              "Pick from a selected list of premium product",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            )),
            //product tile

            SizedBox(
              height: 550,
              child: ListView.builder(
                  itemCount: products.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(15),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return MyProductTile(product: product);
                  }),
            )
          ],
        ));
  }
}
