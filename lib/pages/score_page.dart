import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../quiz_provider.dart';
import 'welcome_page.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

  String getMessage(int points, int total) {
    final ratio = points / total;
    if (ratio == 1) return 'Perfect!';
    if (ratio >= 0.75) return 'Excellent';
    if (ratio >= 0.5) return 'Good';
    return 'Keep Practicing';
  }

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final total = quiz.totalPoints;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Your Result', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 10),
                Text("${quiz.scorePoints} / $total pts", style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text("${quiz.correctCount} correct out of ${quiz.totalQuestions}", style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                Text(getMessage(quiz.scorePoints, total), style: const TextStyle(fontSize: 22)),
                const SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        quiz.restart();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const WelcomePage()),
                          (route) => false,
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
                        child: Text('Back to Menu'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
