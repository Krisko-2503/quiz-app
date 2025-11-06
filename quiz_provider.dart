import 'package:flutter/material.dart';

/// A provider class that manages quiz state for the application.
///
/// This class exposes simple integer fields to track the current
/// question index and the player's score. Each method is currently
/// implemented as a stub; they will be filled in future commits.
class QuizProvider extends ChangeNotifier {
  /// The index of the current question.
  int currentIndex = 0;

  /// The player's current score.
  int score = 0;

  /// Handle answer submission.
  ///
  /// Currently this method is a no‑op. In a later commit it will update
  /// the score based on whether the selected answer matches the correct
  /// answer and notify listeners.
  void submitAnswer(String selected, String correct) {
    // TODO: implement answer checking in a future commit
  }

  /// Advance to the next question.
  ///
  /// At the moment this method does nothing. A subsequent commit will
  /// increment the current index and notify listeners.
  void nextQuestion() {
    // TODO: implement question navigation in a future commit
  }

  /// Restart the quiz.
  ///
  /// This stub will be expanded in a later commit to reset the quiz
  /// state and notify listeners that the state has changed.
  void restart() {
    // TODO: implement quiz reset in a future commit
  }
}