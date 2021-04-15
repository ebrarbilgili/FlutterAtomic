import 'package:atomic_widgets/ServiceConstants/Dio/core/model/dio_model.dart';
import 'package:flutter/material.dart';

import 'package:atomic_widgets/ServiceConstants/Dio/core/service/dio_service_constant.dart';

class DioServiceWidget extends StatelessWidget {
  const DioServiceWidget({
    Key? key,
    required this.dioServiceConstant,
  }) : super(key: key);

  final DioServiceConstant dioServiceConstant;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DioModel>>(
      future: dioServiceConstant.fetchDioModel(),
      builder: (context, snapshot) {
        final data = snapshot.data;

        if (data != null) {
          return buildListView(data);
        }

        return CircularProgressIndicator();
      },
    );
  }

  ListView buildListView(List<DioModel> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final list = data[index];
        return buildCard(list);
      },
    );
  }

  Card buildCard(DioModel list) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Text('${list.id}')),
        title: Text('${list.title}'),
        subtitle: Text('${list.body}'),
        onTap: () => onTapFunc(list),
      ),
    );
  }

  Future<void> onTapFunc(DioModel list) async {
    await dioServiceConstant.postDioModel(
      DioModel(
        userId: list.userId,
        id: list.id,
        title: list.title,
        body: list.body,
      ),
    );
  }
}
