import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_sm/models/product_model.dart';

class ApiService {
  static const String url = 'https://api.restful-api.dev/objects';

  static Future<List<ProductModel>> fetchObjects() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load objects');
    }
  }
}
