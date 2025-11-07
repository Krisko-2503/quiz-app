// Two quiz categories with different points per question.
final Map<String, List<Map<String, dynamic>>> allQuizzes = {
  'general': [
    {
      "question": "What is the capital of France?",
      "answers": ["Paris", "Madrid", "Berlin", "Rome"],
      "correct": "Paris",
      "points": 1
    },
    {
      "question": "2 + 2 × 2 = ?",
      "answers": ["6", "8", "4", "2"],
      "correct": "6",
      "points": 1
    },
    {
      "question": "Which planet is known as the Red Planet?",
      "answers": ["Mars", "Venus", "Jupiter", "Mercury"],
      "correct": "Mars",
      "points": 1
    },
    {
      "question": "Which ocean is the largest?",
      "answers": ["Pacific", "Atlantic", "Indian", "Arctic"],
      "correct": "Pacific",
      "points": 1
    },
  ],
  'flutter': [
    {
      "question": "In Flutter, UI is built using:",
      "answers": ["Widgets", "Fragments", "Activities", "ViewControllers"],
      "correct": "Widgets",
      "points": 2
    },
    {
      "question": "Which widget is immutable and does not hold state?",
      "answers": ["StatelessWidget", "StatefulWidget", "InheritedWidget", "ChangeNotifier"],
      "correct": "StatelessWidget",
      "points": 2
    },
    {
      "question": "Which method in a State class is called once when the widget is inserted in the tree?",
      "answers": ["initState", "build", "dispose", "didUpdateWidget"],
      "correct": "initState",
      "points": 2
    },
    {
      "question": "Which package are we using for state management here?",
      "answers": ["riverpod", "bloc", "provider", "get_it"],
      "correct": "provider",
      "points": 2
    },
  ],
};
