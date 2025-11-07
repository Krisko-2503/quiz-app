# Quiz Game App

A multiple-choice quiz app built with Flutter and Provider, matching the **Mobile Development Foundations Exam** requirements.

## Features Implemented
- Questions stored in `List<Map<String, dynamic>>`.
- One question per screen with **Column**, **Row**, **Expanded**, **Padding**.
- **Radio** inputs with form-like validation (prevents advancing without a selection).
- Navigation to next question; **Score Page** after the last question.
- Score calculation via a function; conditional performance messages.
- State management with **Provider**; interactive page is `StatefulWidget`, static pages are `StatelessWidget`.
- **MediaQuery** for responsive text sizing.
- “Restart Quiz” resets state and returns to the welcome screen.

## How to Run
1. Ensure Flutter SDK is installed.
2. From the project root:
   ```bash
   flutter pub get
   flutter run
   ```

## File Structure
```
lib/
  main.dart
  quiz_provider.dart
  data/
    questions.dart
  pages/
    welcome_page.dart
    question_page.dart
    score_page.dart
```

## Bonus Ideas (optional)
- Add animations, progress bar, or themed styling.
- Load questions from JSON or network.
- Shuffle questions and answers.
