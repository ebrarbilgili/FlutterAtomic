import 'package:vexana/vexana.dart';

class VexanaModel extends INetworkModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  VexanaModel({this.userId, this.id, this.title, this.body});

  VexanaModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }

  @override
  VexanaModel fromJson(Map<String, dynamic> json) {
    return VexanaModel.fromJson(json);
  }
}
