import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    final List<String> imgList = [
      'images/1.png'
      'images/2.png'
      'images/3.png'
      'images/4.png'
      'images/5.png'
      'images/6.png'
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 24,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.black54,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month_outlined,
              color: Colors.black54,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble_outline,
              color: Colors.black54,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_none_outlined,
              color: Colors.black54,
            ),
            label: '',
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hello,",
                        style: TextStyle(
                          color: Color.fromARGB(137, 73, 73, 73),
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "FirstName LastName",
                        style: TextStyle(
                          color: Color.fromARGB(255, 226, 77, 124),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      )
                    ],
                  ),
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Color.fromARGB(255, 226, 77, 124),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage("images/pm.jpg"),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 214, 220),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "images/report.jpg",
                      width: 80,
                      height: 100,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Are you a Victim?",
                          style: TextStyle(
                              color: Color.fromARGB(255, 226, 77, 124),
                              fontSize: 25,
                              fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const SizedBox(
                          width: 120,
                          child: Text(
                            "Report immediately!",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 150,
                          height: 35,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 226, 77, 124),
                              borderRadius: BorderRadius.circular(12.0)),
                          child: const Center(
                            child: Text(
                              "Report",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                      
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: imgList.map((item) => Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(item),
                          fit: BoxFit.cover
                        )
                      ),
                      child: Transform.translate(
                        offset: Offset(50, -50),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 65, vertical: 63),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                          ),
                          child: Icon(Icons.bookmark_border, size: 15,),
                        ),
                      ),
                    ),
                  )).toList(),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}