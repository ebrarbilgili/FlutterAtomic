import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:atomic_widgets/ServiceConstants/http/core/model/http_model.dart';

class HttpServiceConstant {
  final String baseUrl;
  HttpServiceConstant({required this.baseUrl});

  Future<List<HttpModel>> fetchHttpModel() async {
    final url = Uri.https(baseUrl, 'posts');

    final response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      final jsonModel = json.decode(response.body) as List;

      return jsonModel.map((e) => HttpModel.fromJson(e)).toList();
    }
    return [];
  }

  Future postHttpModel(HttpModel httpModel) async {
    final url = Uri.https(baseUrl, 'posts');

    final response = await http.post(
      url,
      headers: {'Content-type': 'application/json'},
      body: json.encode(httpModel.toJson()),
    );

    if (response.statusCode == HttpStatus.created) {
      print('POST HTTP SUCCESSFUL: ${httpModel.id}');
      return HttpModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }
}
