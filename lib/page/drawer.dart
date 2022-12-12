import 'package:final_project/page/start.dart';
import 'package:flutter/material.dart';

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
              MaterialPageRoute(builder: (context) => const StartPage())
            );
          }
        ),
      ],
    ),
  );
}
