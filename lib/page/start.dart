// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'home.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 214, 220),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            Container(
              height: size.height / 1.8,
              padding: const EdgeInsets.symmetric(
                horizontal: 9,
              ),
              child: Image.asset(
                "images/start.jpg",
                // height: 50,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Consent Beacon here to help you",
                    style: TextStyle(
                      color: Color.fromARGB(255, 226, 77, 124),
                      fontWeight: FontWeight.bold,
                      fontSize: 29,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      right: 100,
                    ),
                    child: Text(
                      "Find your help by reporting your concern",
                      style: TextStyle(
                        color: Color.fromARGB(95, 0, 0, 0),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const HomePage();
                    })),
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 226, 77, 124),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}