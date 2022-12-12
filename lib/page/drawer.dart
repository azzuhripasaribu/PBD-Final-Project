import 'package:final_project/main.dart';
import 'package:final_project/page/centers.dart';
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
              MaterialPageRoute(builder: (context) => const MyHomePage())
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
      ],
    ),
  );
}
