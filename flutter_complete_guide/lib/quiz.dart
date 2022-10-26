import 'package:flutter/material.dart';

import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function(int) answerQuestion;

  const Quiz({
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'] as String,
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          // use arrow func to pass function with no argument
          return Answer(() => answerQuestion(answer['score'] as int),
              answer['text'] as String);
        }).toList(),
      ],
    );
  }
}
