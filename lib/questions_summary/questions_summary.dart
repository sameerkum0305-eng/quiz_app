import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((data) {
        final isCorrect = data['user_answer'] == data['correct_answer'];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 42,
              height: 42,
              margin: const EdgeInsets.only(right: 15, bottom: 20),
              decoration: BoxDecoration(
                color: isCorrect ? Colors.lightBlueAccent : Colors.pinkAccent,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data['question'] as String,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text('Your answer: ${data['user_answer']}',
                      style: TextStyle(
                          color: isCorrect ? Colors.lightBlueAccent : Colors.pinkAccent,
                          fontSize: 16)),
                  Text('Correct answer: ${data['correct_answer']}',
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 16)),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
