import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




class DrivingLicenseApp extends StatefulWidget {
  @override
  _DrivingLicenseAppState createState() => _DrivingLicenseAppState();
}

class _DrivingLicenseAppState extends State<DrivingLicenseApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController documentUrlController = TextEditingController();
  String selectedType = 'New License';
  String selectedAnswer = '';

  Map<String, String> processAnswers = {
    'New License': 'Answer for New License',
    'Addition of Another Category': 'Answer for Addition of Another Category',
    'Renewal License': 'Answer for Renewal License',
    'International License/Permit': 'Answer for International License/Permit',
    'Change Details': 'Answer for Change Details',
    'Obtain Duplicate License': 'Answer for Obtain Duplicate License',
  };

  Future<void> submitApplication() async {
    // Replace 'YOUR_API_ENDPOINT' with the actual URL of your PHP script
    final response = await http.post(
      Uri.parse('https://mansiapidemo.000webhostapp.com/submit_application.php'),
      body: {
        'name': nameController.text,
        'address': addressController.text,
        'documentUrl': documentUrlController.text,
        'type': selectedType,

      },
    );

    if (response.statusCode == 200) {
      // Application submitted successfully
      print(response.body);
      // You might want to show a success message or navigate to a confirmation screen
    } else {
      // Handle error
      print('Failed to submit application');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driving License Application'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: documentUrlController,
              decoration: InputDecoration(labelText: 'Document URL'),
            ),
            DropdownButton<String>(
              value: selectedType,
              onChanged: (String? newValue) {
                setState(() {
                  selectedType = newValue!;
                  selectedAnswer = processAnswers[selectedType] ?? '';
                });
              },
              items: processAnswers.keys.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16),

            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                submitApplication();
              },
              child: Text('Submit Application'),
            ),
          ],
        ),
      ),
    );
  }
}
