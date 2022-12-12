import 'package:final_project/model/blog_model.dart';
import 'package:final_project/page/blog.dart';
import 'package:final_project/page/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';

class BlogPage extends StatefulWidget {
  const BlogPage({
    super.key, required this.myBlog
});
  final Blog myBlog;

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
    @override
  Widget build(BuildContext context ) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Blog'),
        ),
        drawer: myDrawer(context),
        body: Container(
          padding: const EdgeInsets.all(20),
          height: 800,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.myBlog.fields.title,
                    style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(),
                  RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black
                        ),
                        children: <TextSpan>[
                          const TextSpan(
                            text: 'author',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: '${widget.myBlog.fields.author}'
                          ),
                          const TextSpan(
                              text: 'Created On',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '${widget.myBlog.fields.createdOn}'
                          ),
                          const TextSpan(
                              text: 'Content',
                              style: TextStyle(fontSize: 15)),
                          TextSpan(
                              text: '${widget.myBlog.fields.content}'
                          )
                        ]
                      )
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                    onPressed: () {
                    Navigator.pushReplacement(
                      context, MaterialPageRoute(
                        builder: (context) => MyBlogPage())
                    );
                },
                    child: const SizedBox(
                      height: 40,
                      width: 200,
                      child: Center(
                        child: Text("Back",
                        style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ))
              ],)
            ],
          ),
        ),
      );
    }
}