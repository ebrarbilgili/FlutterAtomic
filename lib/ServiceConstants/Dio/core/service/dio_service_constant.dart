import 'dart:io';

import 'package:atomic_widgets/ServiceConstants/Dio/core/model/dio_model.dart';
import 'package:dio/dio.dart';

class DioServiceConstant {
  final Dio service;

  DioServiceConstant({required this.service});

  Future<List<DioModel>> fetchDioModel() async {
    final response = await service.get('/posts');

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;

      if (data is List) {
        return data.map((e) => DioModel.fromJson(e)).toList();
      }
    }

    return [];
  }

  Future postDioModel(DioModel dioModel) async {
    final response = await service.post(
      '/posts',
      options: Options(headers: {'Content-type': 'application/json'}),
      data: dioModel.toJson(),
    );

    if (response.statusCode == HttpStatus.created) {
      print('POST DIO SUCCESSFUL: ${dioModel.id}');
      return response;
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }
}
