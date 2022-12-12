import 'package:final_project/main.dart';
import 'package:final_project/page/blog.dart';
import 'package:flutter/material.dart';
import 'package:final_project/page/education.dart';

Drawer myDrawer(context){
  return Drawer(
    child: Column(
      children: [
        // Clickable menu
        ListTile(
          title: const Text('Home'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage())
            );
          }
        ),
        ListTile(
            title: const Text('Know More'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) =>  EducationPage())
              );
            }
        ),
        ListTile(
          title: const Text("Blog"),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyBlogPage())
            );
          },
        )
      ],
    ),
  );
}
