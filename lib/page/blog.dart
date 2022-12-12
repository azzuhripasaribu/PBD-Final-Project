import 'package:flutter/material.dart';
import 'package:final_project/model/blog_model.dart';
import 'package:final_project/fetch/Blog.dart';
import 'package:final_project/page/blog_detail.dart';
import 'drawer.dart';

class MyBlogPage extends StatefulWidget {
  const MyBlogPage({Key? key}) : super(key: key);

  @override
  MyBlogPageState createState() => MyBlogPageState();
}

class MyBlogPageState extends State<MyBlogPage> {
  late Future<List<Blog>> myBlog;

  @override
  void initState() {
    super.initState();
    myBlog = fetchBlog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Blog'),
        ),
        drawer: myDrawer(context),
        body: FutureBuilder(
            future: fetchBlog(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "I'm sorry, there's no Blog :(",
                        style:
                        TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BlogPage(
                                    myBlog: snapshot.data![index])),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${snapshot.data![index].fields.title}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "${snapshot.data![index].fields.author}",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "${snapshot.data![index].fields.createdOn}",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            // Text(
                            //   "${snapshot.data![index].fields.content}",
                            //   style: TextStyle(
                            //       fontSize: 10
                            //   ),
                            // ),
                          ],
                        ),
                      ));
                }
              }
            }));
  }
}