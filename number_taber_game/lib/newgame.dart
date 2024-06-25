import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  static final Random _random = Random();
  late Timer timer;
  int timelft = 10;
  int current_number = 1;
  int score = 0;
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
      score = 0;
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
      score++;
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
                onPressed: _onButtonTap,
                child: Text(
                  '$current_number',
                  style: TextStyle(color: Colors.red, fontSize: 10),
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
