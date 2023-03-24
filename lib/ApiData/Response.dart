import 'package:appmobile/ApiData/Data.dart';

class Response {
  List<Data>? data;
  String? test;

  Response({this.data, this.test});

  Response.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    test = json['test'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['test'] = this.test;
    return data;
  }
}