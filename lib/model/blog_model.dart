// To parse this JSON data, do
//
//     final blog = blogFromJson(jsonString);

import 'dart:convert';

List<Blog> blogFromJson(String str) => List<Blog>.from(json.decode(str).map((x) => Blog.fromJson(x)));

String blogToJson(List<Blog> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Blog {
  Blog({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
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
    required this.title,
    // this.slug,
    required this.author,
    // required this.updatedOn,
    required this.content,
    required this.createdOn,
    // required this.status,
  });

  String title;
  // String slug;
  int author;
  // DateTime updatedOn;
  String content;
  DateTime createdOn;
  // int status;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    title: json["title"],
    // slug: json["slug"],
    author: json["author"],
    // updatedOn: DateTime.parse(json["updated_on"]),
    content: json["content"],
    createdOn: DateTime.parse(json["created_on"]),
    // status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    // "slug": slug,
    "author": author,
    // "updated_on": updatedOn.toIso8601String(),
    "content": content,
    "created_on": createdOn.toIso8601String(),
    // "status": status,
  };
}
