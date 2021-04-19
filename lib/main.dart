import 'package:atomic_widgets/LocalConstants/SharedPreferences/constants/shared_constants.dart';
import 'package:atomic_widgets/LocalConstants/SharedPreferences/view/shared_view.dart';
import 'package:atomic_widgets/ServiceConstants/Dio/core/service/dio_service_constant.dart';
import 'package:atomic_widgets/ServiceConstants/Dio/service_dio.dart';
import 'package:atomic_widgets/ServiceConstants/http/core/service/http_service_class.dart';
import 'package:atomic_widgets/ServiceConstants/http/service_http.dart';
import 'package:atomic_widgets/ServiceConstants/vexana/core/service/vexana_service_constants.dart';
import 'package:atomic_widgets/ServiceConstants/vexana/service_vexana.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesConstant.prefrencesInit();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: buildAppBar,
        body: SharedPreferencesCounterWidget(),
      ),
    );
  }

  VexanaServiceWidget get buildVexanaServiceWidget {
    return VexanaServiceWidget(
      vexanaServiceConstants: VexanaServiceConstants(
        service: NetworkManager(
            options:
                BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'),
            isEnableLogger: true,
            fileManager: LocalPreferences()),
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
