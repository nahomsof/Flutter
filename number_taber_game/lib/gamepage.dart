import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:number_taber_game/gameprovider.dart';
import 'package:provider/provider.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Stack(
        children: [
          Center(
            child: Consumer<GameProvider>(
              builder: (context, value, child) {
                return Text(
                  'Time Left: ${value.timeLeft}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),
          Consumer<GameProvider>(
            builder: (context, value, child) {
              if (value.isGameActive) {
                return Positioned(
                  left: value.buttonPosition.dx,
                  top: value.buttonPosition.dy,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(), backgroundColor: Colors.white),
                    onPressed: () => value.onButtonTap(context),
                    child: Text(
                      '${value.currentNumber}',
                      style: const TextStyle(color: Colors.black, fontSize: 25),
                    ),
                  ),
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Score: ${value.score}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Highest Score: ${value.highestscore}', // Display the highest score
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 100),
                      ElevatedButton(
                        onPressed: () => value.startGame(context),
                        child: const Text('Start Game'),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
