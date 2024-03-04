import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RTOOffice {
  final String state;
  final String name;
  final String location;
  final String websiteUrl;
  final String contactNumber;

  RTOOffice({
    required this.state,
    required this.name,
    required this.location,
    required this.websiteUrl,
    required this.contactNumber,
  });

  factory RTOOffice.fromJson(Map<String, dynamic> json) {
    return RTOOffice(
      state: json['state'],
      name: json['name'],
      location: json['location'],
      websiteUrl: json['website_url'],
      contactNumber: json['contact_number'],
    );
  }
}

class RTOOfficeListScreen extends StatefulWidget {
  @override
  _RTOOfficeListScreenState createState() => _RTOOfficeListScreenState();
}

class _RTOOfficeListScreenState extends State<RTOOfficeListScreen> {
  List<RTOOffice> rtoOffices = [];
  List<String> states = [
    'Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 'Chhattisgarh', 'Goa', 'Gujarat', 'Haryana', 'Himachal Pradesh', 'Jharkhand', 'Karnataka', 'Kerala', 'Madhya Pradesh', 'Maharashtra', 'Manipur', 'Meghalaya', 'Mizoram', 'Nagaland', 'Odisha', 'Punjab', 'Rajasthan', 'Sikkim', 'Tamil Nadu', 'Telangana', 'Tripura', 'Uttar Pradesh', 'Uttarakhand', 'West Bengal', 'Andaman and Nicobar Islands', 'Chandigarh', 'Dadra and Nagar Haveli and Daman and Diu', 'Lakshadweep', 'Delhi', 'Puducherry',
  ];
  // Add your states here
  String selectedState = 'Maharashtra'; // Default selected state

  Future<void> fetchRTOOffices() async {
    final response = await http.get(
        Uri.parse('https://mansiapidemo.000webhostapp.com/rto_office%20api.php?state=$selectedState'));

    if (response.statusCode == 200) {
      final List<dynamic> decodedData = json.decode(response.body);

      setState(() {
        rtoOffices =
            decodedData.map((data) => RTOOffice.fromJson(data)).toList();
      });
    } else {
      // Handle error
      print('Failed to fetch RTO offices');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchRTOOffices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RTO Offices'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Select State:'),
                DropdownButton<String>(
                  value: selectedState,
                  onChanged: (newValue) {
                    setState(() {
                      selectedState = newValue!;
                      fetchRTOOffices();
                    });
                  },
                  items: states.map((state) {
                    return DropdownMenuItem<String>(
                      value: state,
                      child: Text(state),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: rtoOffices.length,
              itemBuilder: (context, index) {
                final office = rtoOffices[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  elevation: 4.0,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16.0),
                    title: Text(
                      '${office.state} - ${office.name}',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8.0),
                        Text('Location: ${office.location}'),
                        SizedBox(height: 4.0),
                        Text('Website: ${office.websiteUrl}'),
                        SizedBox(height: 4.0),
                        Text('Contact: ${office.contactNumber}'),
                      ],
                    ),
                    onTap: () {
                      // Handle office selection, navigate to details, etc.
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
