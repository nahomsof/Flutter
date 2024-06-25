import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int timelft = 10;
  late Timer timer;
  int score = 0;
  void _startGame() {
    setState(() {});
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timelft == 0) {
        timer.cancel();
      } else {
        setState(() {
          timelft--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Time Left : $timelft',
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: ElevatedButton(
                  onPressed: _startGame,
                  child: const Text('Start Game'),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
