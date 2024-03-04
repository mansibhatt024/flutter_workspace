import 'package:flutter/material.dart';

class RTOFormScreen extends StatefulWidget {
  @override
  _RTOFormScreenState createState() => _RTOFormScreenState();
}

class _RTOFormScreenState extends State<RTOFormScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _licenseTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RTO Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _licenseTypeController,
              decoration: InputDecoration(labelText: 'License Type'),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                _submitForm();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    // Implement form submission logic here
    String name = _nameController.text;
    String address = _addressController.text;
    String licenseType = _licenseTypeController.text;

    // Perform any necessary validation and submission tasks

    // For now, print the values to the console
    print('Name: $name');
    print('Address: $address');
    print('License Type: $licenseType');

    // Optionally, you can navigate to another screen or perform other actions
  }
}

