import 'dart:convert';

UpdateNewUser updateNewUserFromJson(String str) => UpdateNewUser.fromJson(json.decode(str));

String updateNewUserToJson(UpdateNewUser data) => json.encode(data.toJson());

class UpdateNewUser {
  UpdateNewUser({
      this.name,
     this.job,
  });

  String? name;
  String? job;

  factory UpdateNewUser.fromJson(Map<String, dynamic> json) => UpdateNewUser(
    name: json["name"],
    job: json["job"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "job": job,
  };
}