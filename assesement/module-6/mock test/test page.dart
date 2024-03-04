import 'package:flutter/material.dart';

class RtoTestPage extends StatefulWidget {
  @override
  _RtoTestPageState createState() => _RtoTestPageState();
}

class _RtoTestPageState extends State<RtoTestPage> {
  int currentQuestionIndex = 0;
  List<Map<String, dynamic>> questions = [

    {
      'question': 'What does a red traffic light indicate?',
      'options': ['A. Stop', 'B. Go', 'C. Slow down', 'D. No parking'],
      'correctAnswer': 'A. Stop',
    },
    {
      'question': 'What does a green arrow signal at an intersection mean?',
      'options': ['A. Go straight', 'B. Turn left', 'C. Turn right', 'D. No entry'],
      'correctAnswer': 'C. Turn right',
    },
    {
      'question': 'What is the purpose of road signs with an orange background?',
      'options': ['A. Information', 'B. Warning', 'C. Regulation', 'D. Direction'],
      'correctAnswer': 'B. Warning',
    },
    {
      'question': 'When should you use your vehicles horn?',
    'options': ['A. To greet others', 'B. To express anger', 'C. In emergencies', 'D. Anytime'],
      'correctAnswer': 'C. In emergencies',
    },
    {
      'question': 'What does a double yellow line on the road indicate?',
      'options': ['A. No overtaking', 'B. Overtaking allowed', 'C. One-way traffic', 'D. No parking'],
      'correctAnswer': 'A. No overtaking',
    },
    {
      'question': 'How often should you check your vehicles brakes?',
    'options': ['A. Monthly', 'B. Yearly', 'C. Only when they fail', 'D. Never'],
      'correctAnswer': 'A. Monthly',
    },
    {
      'question': 'What does a white rectangular sign with black lettering indicate?',
      'options': ['A. Speed limit', 'B. Stop sign', 'C. Parking zone', 'D. Railway crossing'],
      'correctAnswer': 'A. Speed limit',
    },
    {
      'question': 'In a roundabout, who has the right of way?',
      'options': ['A. Vehicles entering', 'B. Vehicles inside', 'C. Vehicles on the left', 'D. Pedestrians'],
      'correctAnswer': 'B. Vehicles inside',
    },
    {
      'question': 'What is the permissible blood alcohol concentration (BAC) limit for drivers?',
      'options': ['A. 0.02%', 'B. 0.05%', 'C. 0.08%', 'D. 0.10%'],
      'correctAnswer': 'C. 0.08%',
    },
    {
      'question': 'When should you use your vehicles headlights?',
    'options': ['A. Only at night', 'B. Only in bad weather', 'C. Anytime visibility is low', 'D. Never'],
      'correctAnswer': 'C. Anytime visibility is low',
    },
    {
      'question': 'What does a blue circular sign with a white arrow indicate?',
      'options': ['A. One-way street', 'B. Mandatory direction', 'C. Hospital ahead', 'D. Railway station'],
      'correctAnswer': 'B. Mandatory direction',
    },
    {
      'question': 'What is the purpose of a catalytic converter in a vehicle?',
      'options': ['A. Improve fuel efficiency', 'B. Reduce air pollution', 'C. Increase engine power', 'D. Enhance brake performance'],
      'correctAnswer': 'B. Reduce air pollution',
    },
    {
      'question': 'When should you yield the right of way to pedestrians?',
      'options': ['A. Never', 'B. Only at crosswalks', 'C. Always', 'D. Only during daytime'],
      'correctAnswer': 'C. Always',
    },
    {
      'question': 'What does a broken white line on the road indicate?',
      'options': ['A. No overtaking', 'B. Overtaking allowed', 'C. Stop line', 'D. Pedestrian crossing'],
      'correctAnswer': 'B. Overtaking allowed',
    },
    {
      'question': 'What does a triangular sign with an exclamation mark indicate?',
      'options': ['A. School zone', 'B. Speed limit', 'C. Hazard ahead', 'D. No entry'],
      'correctAnswer': 'C. Hazard ahead',
    },
    // Add more questions here
  ];
  int correctAnswers = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RTO Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${currentQuestionIndex + 1}:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              questions[currentQuestionIndex]['question'],
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Column(
              children: _buildOptions(),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitAnswer,
              child: Text('Submit Answer'),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildOptions() {
    List<Widget> options = [];

    for (String option in questions[currentQuestionIndex]['options']) {
      options.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ElevatedButton(
            onPressed: () {
              _selectOption(option);
            },
            child: Text(option),
          ),
        ),
      );
    }

    return options;
  }

  void _selectOption(String selectedOption) {
    // Handle option selection
  }

  void _submitAnswer() {
    // Handle answer submission
    // Check if the selected option is correct
    String correctAnswer = questions[currentQuestionIndex]['correctAnswer'];
    if (correctAnswer == 'C. 100 km/h') {
      correctAnswers++;
    }

    // Move to the next question
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      // Display test results
      _showTestResults();
    }
  }

  void _showTestResults() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Test Results'),
          content: Text('You answered $correctAnswers questions correctly out of ${questions.length}.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
