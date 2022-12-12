// To parse this JSON data, do
//
//     final blog = blogFromJson(jsonString);

import 'dart:convert';

Blog blogFromJson(String str) => Blog.fromJson(json.decode(str));

String blogToJson(Blog data) => json.encode(data.toJson());

class Blog {
  Blog({
    required this.post,
  });

  List<Post> post;

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
    post: List<Post>.from(json["post"].map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "post": List<dynamic>.from(post.map((x) => x.toJson())),
  };
}

class Post {
  Post({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
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