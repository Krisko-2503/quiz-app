import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../quiz_provider.dart';
import '../data/questions.dart';
import 'welcome_page.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

  String getMessage(int score, int total) {
    if (score == total) return 'Excellent';
    if (score >= (total * 0.6).round()) return 'Good';
    return 'Try Again';
    }

  @override
  Widget build(BuildContext context) {
    final quiz = Provider.of<QuizProvider>(context);
    final total = quizQuestions.length;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Your Score', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 10),
                Text('${quiz.score} / $total', style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(getMessage(quiz.score, total), style: const TextStyle(fontSize: 22)),
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
                        child: Text('Restart Quiz'),
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
