import 'package:meta/meta.dart';
import 'dart:convert';

List<CenterList> CenterListFromJson(String str) => List<CenterList>.from(json.decode(str).map((x) => CenterList.fromJson(x)));

String CenterListToJson(List<CenterList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CenterList {
    CenterList({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory CenterList.fromJson(Map<String, dynamic> json) => CenterList(
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
        required this.name,
        required this.website,
        required this.email,
    });

    String name;
    String website;
    String email;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        website: json["website"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "website": website,
        "email": email,
    };
}


