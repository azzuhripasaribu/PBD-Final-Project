// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);

import 'dart:convert';

List<Comment> commentFromJson(String str) => List<Comment>.from(json.decode(str).map((x) => Comment.fromJson(x)));

String commentToJson(List<Comment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comment {
  Comment({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    model: json["model"],
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": model,
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  Fields({
    required this.post,
    required this.name,
    required this.email,
    required this.body,
    required this.createdOn,
    required this.active,
  });

  int post;
  String name;
  String email;
  String body;
  DateTime createdOn;
  bool active;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    post: json["post"],
    name: json["name"],
    email: json["email"],
    body: json["body"],
    createdOn: DateTime.parse(json["created_on"]),
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "post": post,
    "name": name,
    "email": email,
    "body": body,
    "created_on": createdOn.toIso8601String(),
    "active": active,
  };
}
