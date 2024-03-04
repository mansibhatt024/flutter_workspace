import 'package:flutter/material.dart';

class PracticeScreen extends StatefulWidget {
  @override
  _PracticeScreenState createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  int _currentQuestionIndex = 0;
  List<String> _selectedOptions = [];
  bool _showCorrectAnswer = false;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the speed limit on highways?',
      'options': ['A. 60 km/h', 'B. 80 km/h', 'C. 100 km/h', 'D. 120 km/h'],
      'correctAnswer': 'C. 100 km/h',
    },
    {
      'question': 'What does a red traffic light indicate?',
      'options': ['A. Stop', 'B. Go', 'C. Slow down', 'D. Yield'],
      'correctAnswer': 'A. Stop',
    },
    {
      'question': 'What does a yellow diamond-shaped sign indicate?',
      'options': ['A. School zone ahead', 'B. Stop ahead', 'C. No parking', 'D. Yield'],
      'correctAnswer': 'D. Yield',
    },{
      'question': 'What does a blue circular sign with a white arrow indicate?',
      'options': [
        'A. One-way traffic',
        'B. Mandatory direction',
        'C. Stop ahead',
        'D. Speed limit'
      ],
      'correctAnswer': 'B. Mandatory direction',
    },
    {
      'question': 'What does a yellow traffic sign with a school symbol indicate?',
      'options': [
        'A. School zone ahead',
        'B. Pedestrian crossing',
        'C. Playground nearby',
        'D. Hospital ahead'
      ],
      'correctAnswer': 'A. School zone ahead',
    },
    {
      'question': 'When should you use your vehicle’s horn?',
      'options': [
        'A. To greet someone',
        'B. To alert others of your presence',
        'C. To express frustration',
        'D. Only at night'
      ],
      'correctAnswer': 'B. To alert others of your presence',
    },
    {
      'question': 'What does a red triangle-shaped sign indicate?',
      'options': [
        'A. Yield',
        'B. Stop',
        'C. No entry',
        'D. Railway crossing'
      ],
      'correctAnswer': 'A. Yield',
    },
    {
      'question': 'What is the purpose of traffic signals?',
      'options': [
        'A. To decorate the road',
        'B. To guide pedestrians only',
        'C. To control the flow of traffic',
        'D. To indicate speed limits'
      ],
      'correctAnswer': 'C. To control the flow of traffic',
    },{
      'question': 'What does a white rectangular sign with black lettering indicate?',
      'options': [
        'A. Parking area',
        'B. Speed limit',
        'C. No parking',
        'D. Hospital ahead'
      ],
      'correctAnswer': 'A. Parking area',
    },
    {
      'question': 'What does a green circular sign indicate?',
      'options': [
        'A. Warning',
        'B. Information',
        'C. Stop',
        'D. No entry'
      ],
      'correctAnswer': 'B. Information',
    },
    {
      'question': 'What does a broken white line on the road indicate?',
      'options': [
        'A. No overtaking',
        'B. Overtaking allowed',
        'C. Follow the vehicle in front',
        'D. Speed limit zone'
      ],
      'correctAnswer': 'B. Overtaking allowed',
    },
    {
      'question': 'When should you use hazard lights?',
      'options': [
        'A. When driving at night',
        'B. During heavy rain',
        'C. When parked illegally',
        'D. To indicate a warning to other road users'
      ],
      'correctAnswer': 'D. To indicate a warning to other road users',
    },
    {
      'question': 'What does a red cross on a white rectangular sign indicate?',
      'options': [
        'A. First aid station',
        'B. No stopping',
        'C. No entry',
        'D. Railway station ahead'
      ],
      'correctAnswer': 'A. First aid station',
    },
    {
      'question': 'What is the minimum age for obtaining a learner’s license for a two-wheeler?',
      'options': [
        'A. 16 years',
        'B. 18 years',
        'C. 20 years',
        'D. 25 years'
      ],
      'correctAnswer': 'A. 16 years',
    },
    {
      'question': 'What does a yellow zigzag line on the road indicate?',
      'options': [
        'A. Speed limit zone',
        'B. No overtaking zone',
        'C. Pedestrian crossing zone',
        'D. No parking zone'
      ],
      'correctAnswer': 'D. No parking zone',
    },
    {
      'question': 'When should you dim your headlights while driving at night?',
      'options': [
        'A. On well-lit roads',
        'B. On narrow roads',
        'C. When approaching other vehicles',
        'D. Only during heavy rain'
      ],
      'correctAnswer': 'C. When approaching other vehicles',
    },
    {
      'question': 'What does a double solid yellow line on the road indicate?',
      'options': [
        'A. No overtaking from either side',
        'B. Overtaking allowed from both sides',
        'C. One-way traffic',
        'D. Follow the vehicle in front'
      ],
      'correctAnswer': 'A. No overtaking from either side',
    },
    {
      'question': 'What does a brown circular sign indicate?',
      'options': [
        'A. Tourist spot',
        'B. Hospital',
        'C. Wildlife sanctuary',
        'D. Educational institution'
      ],
      'correctAnswer': 'C. Wildlife sanctuary',
    },
    {
      'question': 'What is the meaning of a continuous yellow line on the road?',
      'options': [
        'A. No overtaking from either side',
        'B. Overtaking allowed from both sides',
        'C. Follow the vehicle in front',
        'D. One-way traffic'
      ],
      'correctAnswer': 'B. Overtaking allowed from both sides',
    },
    {
      'question': 'What does a black cross on an orange background indicate?',
      'options': [
        'A. No entry',
        'B. First aid station',
        'C. Stop',
        'D. School zone'
      ],
      'correctAnswer': 'B. First aid station',
    },
    {
      'question': 'What does a green arrow on a traffic signal indicate?',
      'options': [
        'A. Proceed with caution',
        'B. Stop',
        'C. Go straight',
        'D. Left turn allowed'
      ],
      'correctAnswer': 'D. Left turn allowed',
    },
    {
      'question': 'What is the meaning of a double solid white line on the road?',
      'options': [
        'A. No overtaking from either side',
        'B. Overtaking allowed from both sides',
        'C. Follow the vehicle in front',
        'D. One-way traffic'
      ],
      'correctAnswer': 'A. No overtaking from either side',
    },
    {
      'question': 'When should you use your vehicle’s headlights?',
      'options': [
        'A. Only during nighttime',
        'B. During foggy weather',
        'C. Both A and B',
        'D. Never use headlights during the day'
      ],
      'correctAnswer': 'C. Both A and B',
    },
    // Add more questions as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Practice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Question ${_currentQuestionIndex + 1}: ${_questions[_currentQuestionIndex]['question']}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ...(_questions[_currentQuestionIndex]['options'] as List<String>)
                .map((option) => _buildOption(option))
                .toList(),
            SizedBox(height: 16.0),
            if (_selectedOptions.isNotEmpty)
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _showCorrectAnswer ? Colors.green : Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  _showCorrectAnswer
                      ? 'Correct Answer: ${_questions[_currentQuestionIndex]['correctAnswer']}'
                      : 'Incorrect! The correct answer is: ${_questions[_currentQuestionIndex]['correctAnswer']}',
                  style: TextStyle(
                    color: _showCorrectAnswer ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _currentQuestionIndex > 0
                      ? _navigateToPreviousQuestion
                      : null,
                  child: Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: _checkAnswer,
                  child: Text('Check Answer'),
                ),
                ElevatedButton(
                  onPressed: _currentQuestionIndex < _questions.length - 1
                      ? _navigateToNextQuestion
                      : null,
                  child: Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(String option) {
    return ListTile(
      title: Text(option),
      tileColor: _selectedOptions.contains(option)
          ? _showCorrectAnswer
          ? Colors.green
          : Colors.red
          : null,
      onTap: () {
        setState(() {
          _selectedOptions = [option];
          _showCorrectAnswer = false;
        });
      },
    );
  }

  void _navigateToNextQuestion() {
    setState(() {
      _currentQuestionIndex++;
      _selectedOptions = [];
      _showCorrectAnswer = false;
    });
  }

  void _navigateToPreviousQuestion() {
    setState(() {
      _currentQuestionIndex--;
      _selectedOptions = [];
      _showCorrectAnswer = false;
    });
  }

  void _checkAnswer() {
    setState(() {
      _showCorrectAnswer = true;
    });
  }
}

