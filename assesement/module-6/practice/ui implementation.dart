import 'package:flutter/material.dart';

import 'api integration.dart';
import 'model.dart';

class PracticeScreen extends StatefulWidget {
  @override
  _PracticeScreenState createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  final QnAApi _qnAApi = QnAApi();
  late List<QnA> _questions;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    try {
      final questions = await _qnAApi.getQuestions();
      setState(() {
        _questions = questions;
      });
    } catch (e) {
      // Handle error
      print('Error loading questions: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practice Questions'),
      ),
      body: _questions != null
          ? ListView.builder(
        itemCount: _questions.length,
        itemBuilder: (context, index) {
          final qna = _questions[index];
          return Card(
            child: ListTile(
              title: Text(qna.question),
              subtitle: Text('Answer: ${qna.answer}'),
            ),
          );
        },
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
