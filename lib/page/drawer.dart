import 'package:final_project/main.dart';
import 'package:flutter/material.dart';
import 'package:final_project/page/login_page.dart';
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
              MaterialPageRoute(builder: (context) => const MyHomePage())
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
              MaterialPageRoute(builder: (context) => const MyHomePage())
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
        
      ],
    ),
  );
}
