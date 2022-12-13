import 'package:final_project/model/blog_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Blog>> fetchBlog() async {
  var url =
  Uri.parse('https://midterm-project-pbp.up.railway.app/article/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );
  // print(response);

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<Blog> listMyBlog = [];
  for (var d in data) {
    if (d != null) {
      listMyBlog.add(Blog.fromJson(d));
    }
  }

  return listMyBlog;
}