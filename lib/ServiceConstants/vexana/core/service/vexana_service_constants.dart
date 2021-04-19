import 'dart:io';

import 'package:atomic_widgets/ServiceConstants/vexana/core/model/vexana_model.dart';
import 'package:vexana/vexana.dart';

class VexanaServiceConstants {
  final INetworkManager service;

  VexanaServiceConstants({required this.service});

  Future<List<VexanaModel>> fetchVexanaModel() async {
    final response = await service.send<VexanaModel, List<VexanaModel>>(
      '/posts',
      expiration: Duration(seconds: 12),
      parseModel: VexanaModel(),
      method: RequestType.GET,
    );

    final data = response.data;

    return data!.toList();
  }
}
