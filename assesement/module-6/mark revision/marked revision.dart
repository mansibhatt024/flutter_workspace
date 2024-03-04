import 'package:flutter/material.dart';

class MarkForRevisionScreen extends StatefulWidget {
  @override
  _MarkForRevisionScreenState createState() => _MarkForRevisionScreenState();
}

class _MarkForRevisionScreenState extends State<MarkForRevisionScreen> {
  List<String> markedQuestions = []; // List to store marked question IDs

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mark for Revision'),
      ),
      body: ListView.builder(
        itemCount: 15, // Replace with the actual number of questions
        itemBuilder: (context, index) {
          final questionId = 'Q${index + 1}'; // Assuming question IDs are in the format Q1, Q2, ..., Q15

          return _buildQuestionTile(questionId);
        },
      ),
    );
  }

  Widget _buildQuestionTile(String questionId) {
    return ListTile(
      title: Text('Question $questionId'),
      trailing: IconButton(
        icon: Icon(
          markedQuestions.contains(questionId)
              ? Icons.bookmark
              : Icons.bookmark_border,
        ),
        onPressed: () {
          // Toggle the question's mark status
          setState(() {
            if (markedQuestions.contains(questionId)) {
              markedQuestions.remove(questionId);
            } else {
              markedQuestions.add(questionId);
            }
          });
        },
      ),
    );
  }
}
