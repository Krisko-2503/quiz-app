import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../quiz_provider.dart';
import 'score_page.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  String? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final q = quiz.currentQuestion;
    final answers = List<String>.from(q["answers"]);
    final mq = MediaQuery.of(context);
    final width = mq.size.width;
    final questionSize = width < 360 ? 18.0 : 22.0;
    final optionSize = width < 360 ? 14.0 : 16.0;
    final progress = (quiz.currentIndex + 1) / quiz.totalQuestions;

    Widget optionTile(String a) {
      final selected = selectedAnswer == a;
      return Expanded(
        child: InkWell(
          onTap: () => setState(() => selectedAnswer = a),
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: selected ? Theme.of(context).colorScheme.primary.withOpacity(0.06) : Colors.white,
              border: Border.all(
                color: selected ? Theme.of(context).colorScheme.primary : Colors.grey.shade300,
                width: selected ? 2 : 1,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Radio<String>(
                  value: a,
                  groupValue: selectedAnswer,
                  onChanged: (val) => setState(() => selectedAnswer = val),
                ),
                const SizedBox(width: 6),
                Flexible(child: Text(a, style: TextStyle(fontSize: optionSize))),
              ],
            ),
          ),
        ),
      );
    }

    List<Widget> buildGridOptions() {
      List<Widget> rows = [];
      for (int i = 0; i < answers.length; i += 2) {
        final left = optionTile(answers[i]);
        final right = (i + 1 < answers.length) ? optionTile(answers[i + 1]) : const Expanded(child: SizedBox());
        rows.add(Row(children: [left, right]));
      }
      return rows;
    }

    final quizTitle = quiz.selectedQuizKey == 'flutter' ? 'Flutter Basics' : 'General Knowledge';

    return Scaffold(
      appBar: AppBar(
        title: Text("$quizTitle • Q${quiz.currentIndex + 1}/${quiz.totalQuestions}"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(value: progress),
              const SizedBox(height: 12),
              Row(
                children: [
                  Chip(label: Text("${q['points']} pts")),
                  const SizedBox(width: 8),
                  Chip(label: Text("Score: ${quiz.scorePoints}/${quiz.totalPoints}")),
                ],
              ),
              const SizedBox(height: 10),
              Text(q["question"], style: TextStyle(fontSize: questionSize, fontWeight: FontWeight.w600)),
              const SizedBox(height: 16),
              ...buildGridOptions(),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedAnswer == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please select an answer before proceeding.')),
                      );
                      return;
                    }

                    quiz.submitAnswer(selectedAnswer!);

                    if (quiz.currentIndex == quiz.totalQuestions - 1) {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ScorePage()));
                    } else {
                      quiz.nextQuestion();
                      setState(() => selectedAnswer = null);
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.0),
                    child: Text('Next'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
