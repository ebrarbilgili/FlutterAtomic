import 'package:atomic_widgets/ServiceConstants/vexana/core/model/vexana_model.dart';
import 'package:flutter/material.dart';

import 'package:atomic_widgets/ServiceConstants/vexana/core/service/vexana_service_constants.dart';

class VexanaServiceWidget extends StatelessWidget {
  const VexanaServiceWidget({
    Key? key,
    required this.vexanaServiceConstants,
  }) : super(key: key);

  final VexanaServiceConstants vexanaServiceConstants;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<VexanaModel>>(
        future: vexanaServiceConstants.fetchVexanaModel(),
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data != null) {
            return buildListView(data);
          }
          return CircularProgressIndicator();
        });
  }

  ListView buildListView(List<VexanaModel> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        final list = data[index];
        return buildCard(list);
      },
    );
  }

  Card buildCard(VexanaModel list) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Text('${list.id}')),
        title: Text('${list.title}'),
        subtitle: Text('${list.body}'),
      ),
    );
  }
}
