import 'package:flutter/material.dart';
import 'package:habit_tracker/mock%20test/test%20page.dart';

class MockTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mock Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image of the driving track
            Image.asset(
              'assets/driving_track_image.jpg', // Replace with your image asset
              height: 200.0,
              width: 200.0,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            // Details of attempts
            Text(
              'Attempts:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildAttemptsDetail('Passed', 10), // Replace with actual passed attempts
                _buildAttemptsDetail('Failed', 5), // Replace with actual failed attempts
              ],
            ),
            SizedBox(height: 16.0),
            // Instructions for the test
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Test Instructions:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text('1. Each question will have 48 seconds for answering.'),
                Text('2. The passing score is 11 out of 15.'),
                Text('3. Three consecutive wrong answers result in failure.'),
                Text('4. Accumulating five wrong answers leads to failure.'),
              ],
            ),
            SizedBox(height: 16.0),
            // Elevated button to start the test
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to the test page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RtoTestPage()),
                );
              },
              icon: Icon(Icons.play_arrow),
              label: Text('Start Test'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttemptsDetail(String title, int count) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16.0),
        ),
        Text(
          count.toString(),
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
