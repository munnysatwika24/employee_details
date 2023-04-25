// To parse this JSON data, do
//
//     final postRespondModel = postRespondModelFromJson(jsonString);

import 'dart:convert';

PostRespondModel postRespondModelFromJson(String str) => PostRespondModel.fromJson(json.decode(str));

String postRespondModelToJson(PostRespondModel data) => json.encode(data.toJson());

class PostRespondModel {
  PostRespondModel({
    this.name,
    this.job,
    this.id,
    this.createdAt,
  });

  String? name;
  String? job;
  String? id;
  DateTime? createdAt;

  factory PostRespondModel.fromJson(Map<String, dynamic> json) => PostRespondModel(
    name: json["name"],
    job: json["job"],
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "job": job,
    "id": id,
    "createdAt": createdAt.toString(),
  };
}
