import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../quiz_provider.dart';
import 'question_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final titleSize = width < 360 ? 22.0 : 30.0;
    final subtitleSize = width < 360 ? 14.0 : 18.0;

    Widget categoryButton({
      required String title,
      required String subtitle,
      required Color color,
      required VoidCallback onTap,
    }) {
      return InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color.withOpacity(0.08),
            border: Border.all(color: color.withOpacity(0.25)),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Icon(Icons.quiz, color: color, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: color)),
                    const SizedBox(height: 4),
                    Text(subtitle, style: const TextStyle(fontSize: 14, color: Colors.black87)),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFEEF2FF), Color(0xFFE0EAFF)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 8),
                Text(
                  'Quiz Game+',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: titleSize, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Choose a quiz category and earn points for each correct answer.\nTrack your progress and aim for a high score!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: subtitleSize, color: Colors.black54),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: Card(
                    elevation: 0,
                    color: Colors.white,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 8),
                          Text('Select a Quiz', style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(height: 12),
                          categoryButton(
                            title: 'General Knowledge',
                            subtitle: 'Mixed topics • Easy/Medium • 1 point each',
                            color: Colors.indigo,
                            onTap: () {
                              context.read<QuizProvider>().selectQuiz('general');
                              Navigator.push(context, MaterialPageRoute(builder: (_) => const QuestionPage()));
                            },
                          ),
                          const SizedBox(height: 12),
                          categoryButton(
                            title: 'Flutter Basics',
                            subtitle: 'Widgets & Dart • Medium/Hard • 2 points each',
                            color: Colors.deepPurple,
                            onTap: () {
                              context.read<QuizProvider>().selectQuiz('flutter');
                              Navigator.push(context, MaterialPageRoute(builder: (_) => const QuestionPage()));
                            },
                          ),
                          const Spacer(),
                          const Text(
                            'Tip: You can restart anytime from the score screen.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
