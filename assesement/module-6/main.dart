import 'package:flutter/material.dart';
import 'package:habit_tracker/practice/practicescreen.dart';
import 'package:habit_tracker/statistics/statistics.dart';

import 'faq/faq.dart';
import 'form/formscreen.dart';
import 'learn/learnscreen.dart';
import 'mark revision/marked revision.dart';
import 'mock test/mocktest.dart';
import 'rto office/office screen.dart';
import 'driving process/process.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RTO Driving Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RTO Driving Licence Test'),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Implement share functionality
            },
          ),
          PopupMenuButton<String>(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'settings',
                child: Text('Settings'),
              ),
              PopupMenuItem(
                value: 'about',
                child: Text('About'),
              ),
            ],
            onSelected: (value) {
              // Handle popup menu item selection
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: [
          _buildGridItem('Learn', Icons.school, () {
            _handleTap(context, 'Learn');
          }),
          _buildGridItem('Practice', Icons.brush, () {
            _handleTap(context, 'Practice');
          }),
          _buildGridItem('Mock Test', Icons.assignment, () {
            _handleTap(context, 'Mock Test');
          }),
          _buildGridItem('MarkRevi.', Icons.bookmark,() {
          _handleTap(context, 'Marked for Revision');
          }),
          _buildGridItem('RTO Office', Icons.location_city,() {
            _handleTap(context, 'RTO Office');
          }),
          _buildGridItem('Process', Icons.playlist_add_check,() {
            _handleTap(context, 'Process');
          }),
          _buildGridItem('Statistics', Icons.insert_chart,() {
            _handleTap(context, 'Statistics');
          }),
          _buildGridItem('Forms', Icons.description,() {
            _handleTap(context, 'Forms');
          }),
          _buildGridItem('FAQ', Icons.help,() {
            _handleTap(context, 'FAQ');
          }),
        ],
      ),
    );
  }

  Widget _buildGridItem(String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48.0,
            ),
            SizedBox(height: 8.0),
            Text(title),
          ],
        ),
      ),
    );
  }

  void _handleTap(BuildContext context, String title) {
    if (title == 'Learn') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LearnPageScreen ()),
      );
    } else if (title == 'Practice') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PracticeScreen()),
      );
    } else if (title == 'Mock Test') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MockTestScreen()),
      );
    } else if (title == 'Marked for Revision') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MarkForRevisionScreen()),
      );
    } else if (title == 'RTO Office') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RTOOfficeListScreen()),
      );
    } else if (title == 'Process') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DrivingLicenseApp()),
      );
    } else if (title == 'Statistics') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StatisticsScreen()),
      );
    } else if (title == 'Forms') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RTOFormScreen ()),
      );
    } else if (title == 'FAQ') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FAQScreen()),
      );
    }
  }
}

