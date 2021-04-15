import 'package:atomic_widgets/ServiceConstants/Dio/core/service/dio_service_constant.dart';
import 'package:atomic_widgets/ServiceConstants/Dio/service_dio.dart';
import 'package:atomic_widgets/ServiceConstants/http/core/service/http_service_class.dart';
import 'package:atomic_widgets/ServiceConstants/http/service_http.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: buildAppBar,
        body: buildHttpServiceWidget,
      ),
    );
  }

  HttpServiceWidget get buildHttpServiceWidget {
    return HttpServiceWidget(
      httpServiceConstant:
          HttpServiceConstant(baseUrl: 'jsonplaceholder.typicode.com'),
    );
  }

  DioServiceWidget get buildDioServiceWidget {
    return DioServiceWidget(
      dioServiceConstant: DioServiceConstant(
        service: Dio(
          BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'),
        ),
      ),
    );
  }

  AppBar get buildAppBar => AppBar(title: Text('Atomic Widget'));
}
