import 'package:atomic_widgets/ServiceConstants/http/core/model/http_model.dart';
import 'package:flutter/material.dart';

import 'package:atomic_widgets/ServiceConstants/http/core/service/http_service_class.dart';

class HttpServiceWidget extends StatelessWidget {
  final HttpServiceConstant httpServiceConstant;
  HttpServiceWidget({
    Key? key,
    required this.httpServiceConstant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HttpModel>>(
      future: httpServiceConstant.fetchHttpModel(),
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data != null) {
          return buildListView(data);
        }
        return CircularProgressIndicator();
      },
    );
  }

  ListView buildListView(List<HttpModel> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        final list = data[index];

        return buildCard(list);
      },
    );
  }

  Card buildCard(HttpModel list) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text('${list.id}'),
        ),
        title: Text('${list.title}'),
        subtitle: Text('${list.body}'),
        onTap: () async {
          await httpServiceConstant.postHttpModel(
            HttpModel(
              userId: list.userId,
              id: list.id,
              title: list.title,
              body: list.body,
            ),
          );
        },
      ),
    );
  }
}
