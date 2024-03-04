import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  List<Map<String, dynamic>> _vehiclePopulationData = [];

  @override
  void initState() {
    super.initState();
    _fetchVehiclePopulationData();
  }

  Future<void> _fetchVehiclePopulationData() async {
    final response = await http.get(Uri.parse('https://mansiapidemo.000webhostapp.com/vehicle_population%20api.php'));

    if (response.statusCode == 200) {
      final List<dynamic> decodedData = json.decode(response.body);

      setState(() {
        _vehiclePopulationData = decodedData.cast<Map<String, dynamic>>();
      });
    } else {
      // Handle error
      print('Failed to load vehicle population data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle Population Statistics'),
      ),
      body: _buildStatisticsTable(),
    );
  }

  Widget _buildStatisticsTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(label: Text('Year')),
          DataColumn(label: Text('Transport Vehicles')),
          DataColumn(label: Text('Non-Transport Vehicles')),
          DataColumn(label: Text('Total Vehicles')),
        ],
        rows: _vehiclePopulationData.map((data) {
          return DataRow(cells: [
            DataCell(Text('${data['year']}')),
            DataCell(Text('${data['transport_vehicle']}')),
            DataCell(Text('${data['non_transport_vehicle']}')),
            DataCell(Text('${data['total']}')),
          ]);
        }).toList(),
      ),
    );
  }
}
