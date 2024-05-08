import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RatingBar.builder(
            itemCount: 7,
            initialRating: 2,
            itemPadding: const EdgeInsets.symmetric(horizontal: 5),
            direction: Axis.horizontal,
            itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.red,
                ),
            onRatingUpdate: (value) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Giving rating is $value")));
            }),
      ),
    );
  }
}
