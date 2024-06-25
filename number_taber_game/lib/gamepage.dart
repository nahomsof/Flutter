import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late Timer timer;
  int current_number = 1;
  int timelft = 10;
  bool isGameActive = false;

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _startGame() {
    setState(() {
      timelft = 10;
      isGameActive = true;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timelft == 0) {
        timer.cancel();
        setState(() {
          isGameActive = false;
        });
      } else {
        setState(() {
          timelft--;
        });
      }
    });
  }

  void _onButtonTap() {
    setState(() {
      current_number++;
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
                if (isGameActive)
                  Positioned(
                    child: ElevatedButton(
                      onPressed: _onButtonTap,
                      child: Text(
                        '$current_number',
                        style: TextStyle(color: Colors.red, fontSize: 10),
                      ),
                    ),
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
