import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class GameProvider with ChangeNotifier {
  static final Random _random = Random();
  late Timer timer;
  int timelft = 10;
  int current_number = 1;
  int score = 0;
  bool isGameActive = false;
  Offset _buttonPosition = Offset.zero;

  int get timeLeft => timelft;
  int get currentNumber => current_number;
  int get scorer => score;
  bool get isGameActived => isGameActive;
  Offset get buttonPosition => _buttonPosition;

  void startGame(BuildContext context) {
    timelft = 10;
    current_number = 1;
    score = 0;
    isGameActive = true;
    rdmPosition(context);

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timelft == 0) {
        timer.cancel();
        isGameActive = false;
      } else {
        timelft--;
      }
      notifyListeners();
    });
  }

  //method for radome position
  void rdmPosition(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final x = _random.nextDouble() * (size.width - 100);
    final y = _random.nextDouble() * (size.height - 100);
    _buttonPosition = Offset(x, y);
    notifyListeners();
  }

  void onButtonTap(BuildContext context) {
    score++;
    current_number++;
    rdmPosition(context);
    notifyListeners();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
