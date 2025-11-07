import 'package:flutter/material.dart';
import 'data/questions.dart';

class QuizProvider extends ChangeNotifier {
  String? selectedQuizKey;
  int currentIndex = 0;
  int scorePoints = 0;
  int correctCount = 0;

  List<Map<String, dynamic>> _activeQuestions = [];

  List<Map<String, dynamic>> get activeQuestions => _activeQuestions;
  Map<String, dynamic> get currentQuestion => _activeQuestions[currentIndex];
  int get totalQuestions => _activeQuestions.length;
  int get totalPoints => _activeQuestions.fold(0, (sum, q) => sum + (q['points'] as int));

  void selectQuiz(String key) {
    selectedQuizKey = key;
    _activeQuestions = List<Map<String, dynamic>>.from(allQuizzes[key] ?? []);
    currentIndex = 0;
    scorePoints = 0;
    correctCount = 0;
    notifyListeners();
  }

  void submitAnswer(String selected) {
    final q = currentQuestion;
    final correct = q['correct'] as String;
    if (selected == correct) {
      correctCount += 1;
      scorePoints += (q['points'] as int);
    }
    notifyListeners();
  }

  void nextQuestion() {
    currentIndex++;
    notifyListeners();
  }

  void restart() {
    currentIndex = 0;
    scorePoints = 0;
    correctCount = 0;
    notifyListeners();
  }
}
