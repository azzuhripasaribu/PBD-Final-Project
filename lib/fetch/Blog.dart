import 'package:final_project/model/blog_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Blog>> fetchBlog() async {
  var url =
  Uri.parse('http://localhost:8000/article/json/'); //I'm using localhost because I cannot access my heroku.
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );
  // print(response);

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<Blog> listMyWatchList = [];
  for (var d in data) {
    if (d != null) {
      listMyWatchList.add(Blog.fromJson(d));
    }
  }

  return listMyWatchList;
}