// To parse this JSON data, do
//
//     final postRequestModel = postRequestModelFromJson(jsonString);

import 'dart:convert';

PostRequestModel postRequestModelFromJson(String str) => PostRequestModel.fromJson(json.decode(str));

String postRequestModelToJson(PostRequestModel data) => json.encode(data.toJson());

class PostRequestModel {
  PostRequestModel({
    this.name,
    this.job,
  });

  String? name;
  String? job;

  factory PostRequestModel.fromJson(Map<String, dynamic> json) => PostRequestModel(
    name: json["name"],
    job: json["job"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "job": job,
  };
}
