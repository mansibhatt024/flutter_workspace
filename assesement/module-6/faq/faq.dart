import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FAQScreen extends StatefulWidget {
  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  List<Map<String, dynamic>> _faqData = [];

  @override
  void initState() {
    super.initState();
    _fetchFAQData();
  }

  Future<void> _fetchFAQData() async {
    final response = await http.get(Uri.parse('https://mansiapidemo.000webhostapp.com/faq_data.php'));

    if (response.statusCode == 200) {
      final List<dynamic> decodedData = json.decode(response.body);

      setState(() {
        _faqData = decodedData.cast<Map<String, dynamic>>();
      });
    } else {
      // Handle error
      print('Failed to load FAQ data');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ Screen'),
      ),
      body: _buildFAQList(),
    );
  }

  Widget _buildFAQList() {
    return ListView.builder(
      itemCount: _faqData.length,
      itemBuilder: (context, index) {
        final faqItem = _faqData[index];
        return ExpansionTile(
          title: Text(faqItem['question']),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(faqItem['answer']),
            ),
          ],
        );
      },
    );
  }
}

