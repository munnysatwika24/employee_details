// To parse this JSON data, do
//
//     final updateResponseModel = updateResponseModelFromJson(jsonString);

import 'dart:convert';

UpdateResponseModel updateResponseModelFromJson(String str) => UpdateResponseModel.fromJson(json.decode(str));

String updateResponseModelToJson(UpdateResponseModel data) => json.encode(data.toJson());

class UpdateResponseModel {
  UpdateResponseModel({
    this.name,
     this.job,
     this.updatedAt,
  });

  String? name;
  String? job;
  DateTime? updatedAt;

  factory UpdateResponseModel.fromJson(Map<String, dynamic> json) => UpdateResponseModel(
    name: json["name"],
    job: json["job"],
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "job": job,
    "updatedAt": updatedAt.toString(),
  };
}
