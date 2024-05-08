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
            itemCount: 5,
            allowHalfRating: true,
            initialRating: 2,
            minRating: 1,
            itemPadding: const EdgeInsets.symmetric(horizontal: 7),
            direction: Axis.horizontal,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return const Icon(Icons.sentiment_very_dissatisfied,
                      color: Colors.red);
                case 1:
                  return const Icon(
                    Icons.sentiment_dissatisfied,
                    color: Colors.redAccent,
                  );
                case 2:
                  return const Icon(
                    Icons.sentiment_neutral,
                    color: Colors.amber,
                  );
                case 3:
                  return const Icon(
                    Icons.sentiment_satisfied,
                    color: Colors.greenAccent,
                  );
                case 4:
                  return const Icon(
                    Icons.sentiment_very_satisfied,
                    color: Colors.green,
                  );
                default:
                  return Text("");
              }
            },
            onRatingUpdate: (value) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Giving rating is $value")));
            }),
      ),
    );
  }
}
