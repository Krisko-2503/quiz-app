import 'package:flutter/material.dart';

class QuizProvider extends ChangeNotifier {
  int currentIndex = 0;
  int score = 0;

  void submitAnswer(String selected, String correct) {
    if (selected == correct) {
      score++;
    }
    notifyListeners();
  }

  void nextQuestion() {
    currentIndex++;
    notifyListeners();
  }

  void restart() {
    currentIndex = 0;
    score = 0;
    notifyListeners();
  }
}
