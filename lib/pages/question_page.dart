import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../quiz_provider.dart';
import '../data/questions.dart';
import 'score_page.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final _formKey = GlobalKey<FormState>();
  String? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    final quiz = Provider.of<QuizProvider>(context);
    final q = quizQuestions[quiz.currentIndex];
    final answers = List<String>.from(q["answers"]);
    final mq = MediaQuery.of(context);
    final width = mq.size.width;
    final questionSize = width < 360 ? 18.0 : 22.0;
    final optionSize = width < 360 ? 14.0 : 16.0;

    Widget optionTile(String a) {
      return Expanded(
        child: InkWell(
          onTap: () => setState(() => selectedAnswer = a),
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              border: Border.all(
                color: selectedAnswer == a ? Theme.of(context).colorScheme.primary : Colors.grey.shade300,
                width: selectedAnswer == a ? 2 : 1,
              ),
              borderRadius: BorderRadius.circular(12),
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

    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${quiz.currentIndex + 1}/${quizQuestions.length}'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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

                      quiz.submitAnswer(selectedAnswer!, q["correct"]);

                      if (quiz.currentIndex == quizQuestions.length - 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const ScorePage()),
                        );
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
      ),
    );
  }
}
