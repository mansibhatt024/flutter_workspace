import 'dart:convert';
import 'package:http/http.dart' as http;

import 'model.dart';

class QnAApi {
  static const apiUrl = 'https://mansiapidemo.000webhostapp.com/questions-api.php';

  Future<List<QnA>> getQuestions() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => QnA.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load questions');
    }
  }
}
