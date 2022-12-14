import 'package:final_project/page/report_form.dart';
import 'package:final_project/page/start.dart';
import 'package:final_project/page/centers.dart';
import 'package:flutter/material.dart';
import 'package:final_project/page/login_page.dart';
import 'package:final_project/page/education.dart';
import 'package:final_project/page/blog.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

Drawer myDrawer(BuildContext context){
  final request = context.watch<CookieRequest>();
  return Drawer(
    child: Column(
      children: [
        // Clickable menu
        ListTile(
          title: const Text('Home'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const StartPage())
            );
          }
        ),
        request.loggedIn? 
        ListTile(
          title: Text('logout'),
          onTap: () {
            request.loggedIn = false;
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const StartPage())
            );
          },
        ):
        ListTile(
          title: const Text('login'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage())
            );
          }
        ),
        ListTile(
          title: const Text('Find Centers'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const FindCentersPage())
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
        ),
        ListTile(
          title: const Text("Form"),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => FormScreen())
            );
          },
        )
      ],
    ),
  );
}
