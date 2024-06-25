import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final Random _random = Random();
  late Timer timer;
  int score = 1;
  int current_number = 1;
  int timelft = 10;
  bool isGameActive = false;
  Offset _buttonPosition = Offset.zero;

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _startGame() {
    setState(() {
      timelft = 10;
      current_number = 1;
      isGameActive = true;
      rdmPosition();
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

  void rdmPosition() {
    final size = MediaQuery.of(context).size;
    final x = _random.nextDouble() * (size.width - 100);
    final y = _random.nextDouble() * (size.height - 100);
    setState(() {
      _buttonPosition = Offset(x, y);
    });
  }

  void _onButtonTap() {
    setState(() {
      current_number++;
      rdmPosition();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Stack(
        children: [
          Center(
            child: Text(
              'Time Left: $timelft',
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          if (isGameActive)
            Positioned(
              left: _buttonPosition.dx,
              top: _buttonPosition.dy,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(), backgroundColor: Colors.white),
                onPressed: _onButtonTap,
                child: Text(
                  '$current_number',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
            ),
          if (!isGameActive)
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Score: $score',
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: _startGame,
                    child: const Text('Start Game'),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
