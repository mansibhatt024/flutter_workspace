import 'package:flutter/material.dart';

class LearnPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Page'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopic('Understanding Traffic Rules'),
            _buildContent(
              'Traffic rules are fundamental guidelines designed to regulate traffic and ensure road safety. As a responsible driver, it is crucial to understand and adhere to these rules. Here are some key aspects to focus on:',
            ),
            _buildSubContent(
              '1. Speed Limits:',
              'Observe and follow posted speed limits. Speed limits are set to ensure safe driving conditions for everyone on the road.',
            ),
            _buildSubContent(
              '2. Right of Way:',
              'Understand right-of-way rules to determine who has the right to proceed first at intersections or when merging.',
            ),
            _buildSubContent(
              '3. Traffic Signals:',
              'Learn the meaning of traffic signals. Red means stop, green means go, and yellow indicates caution.',
            ),
            _buildSubContent(
              '4. Proper Lane Usage:',
              'Follow lane discipline and use the appropriate lanes for turning, overtaking, and driving at different speeds.',
            ),
            SizedBox(height: 16.0),
            _buildTopic('Familiarizing with Road Signs'),
            _buildContent(
              'Road signs convey important information to drivers. Understanding these signs is crucial for safe navigation. Here are the main categories of road signs:',
            ),
            _buildSubContent(
              '1. Regulatory Signs:',
              'These signs indicate laws and regulations. Examples include speed limit signs and no-entry signs.',
            ),
            _buildSubContent(
              '2. Warning Signs:',
              'Warning signs alert drivers to potential hazards ahead, such as curves, intersections, or pedestrian crossings.',
            ),
            _buildSubContent(
              '3. Informational Signs:',
              'These signs provide information about services, directions, or distances. Examples include exit signs and destination markers.',
            ),
            // Add more topics and content as needed
          ],
        ),
      ),
    );
  }

  Widget _buildTopic(String topic) {
    return Text(
      topic,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildContent(String content) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        content,
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }

  Widget _buildSubContent(String title, String content) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.0),
          Text(content),
        ],
      ),
    );
  }
}
