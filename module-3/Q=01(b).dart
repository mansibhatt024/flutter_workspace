import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Campground Details'),
        ),
        body: CampgroundDetailsScreen(),
      ),
    );
  }
}

class CampgroundDetailsScreen extends StatelessWidget {
  // Phone number to call
  final String phoneNumber = '+1234567890';

  // Function to launch the phone dialer
  Future<void> _launchPhoneDialer() async {
    final String url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqBBeEBLouzpsvq-jnvvbzxGANtk65BB0KTQ&usqp=CAU",
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16),
          // Description with Star Rating
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Oeschinen Lake Campground',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Kandersteg, Switzerland',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellowAccent, size: 20),
                    Text('4.1', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          // Buttons with Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  _launchPhoneDialer(); // Call the _launchPhoneDialer function with ()
                },
                icon: Icon(Icons.phone),
                label: Text('Call'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // Add functionality for the "Route" button
                },
                icon: Icon(Icons.directions),
                label: Text('Route'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // Add functionality for the "Share" button
                },
                icon: Icon(Icons.share),
                label: Text('Share'),
              ),
            ],
          ),
          SizedBox(height: 16),
          // Details Text
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Lake oeschinen lies at foot of the Bieumlisalp in the berness alps. '
                  'situated 1,578 meters above sea level,it is one of  the largest alpine lakes. '
                  'A gondola rides from Kanderstang,followed by a half hour walk through pastures and pine forest '
                  'leads you to lake,whiich warms to 20 degrees celcius in the summer. '
                  'Activites enjoyed including here rowing and riding the summer tobaggan run.',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
