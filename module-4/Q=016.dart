//16. Write a code to display alert dialog with list of cities and Single
// choice selection display selected city in TextView
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedCity = ''; // Variable to store the selected city

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Single Choice Alert Dialog Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showCitySelectionDialog(context);
          },
          child: Text('Select City'),
        ),
      ),
    );
  }

  void _showCitySelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select a City'),
          content: Column(
            children: [
              _buildCityListItem('New York'),
              _buildCityListItem('Los Angeles'),
              _buildCityListItem('Chicago'),
              _buildCityListItem('Houston'),
              _buildCityListItem('Phoenix'),
              _buildCityListItem('Philadelphia'),
              // Add more cities as needed
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Handle the selected city, e.g., save it to a variable
                _showSelectedCity();
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCityListItem(String cityName) {
    return ListTile(
      title: Text(cityName),
      leading: Radio<String>(
        value: cityName,
        groupValue: selectedCity,
        onChanged: (String? value) {
          setState(() {
            selectedCity = value!;
          });
        },
      ),
    );
  }

  void _showSelectedCity() {
    if (selectedCity.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Selected City'),
            content: Text('You selected: $selectedCity'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
