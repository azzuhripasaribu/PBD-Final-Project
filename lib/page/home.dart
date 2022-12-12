import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "FirstName LastName",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
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
                          Container(
                    height: 360,
                    width: double.infinity,
                    child: GridView.builder(
                      padding:
                      EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                      itemCount: min(10, context.watch<ListAppointment>().listAppointment.length),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (.45),
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12),
                          child: Container(
                            width: 170,
                            height: 120,

                            decoration: BoxDecoration(
                                color: RumahSehatAppColors.whiteColor,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: RumahSehatAppColors
                                        .shadowColor,
                                    spreadRadius: 2,
                                    blurRadius: 8,
                                    offset: Offset(0, 3),
                                  ),
                                ]
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment
                                  .start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0, left: 16.0),
                                  child: Row(
                                    children: [
                                      HelperBigText(text: dataAppointment.listAppointment[index].dokter.username,
                                        color: RumahSehatAppColors
                                            .mainColor,
                                        size: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: dataAppointment.listAppointment[index].isDone ? RumahSehatAppColors
                                                .backgroundColor : RumahSehatAppColors.cancelButtonColor,
                                            borderRadius: BorderRadius
                                                .circular(16),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets
                                                .only(left: 12,
                                                right: 12,
                                                top: 4,
                                                bottom: 4),
                                            child: HelperBigText(
                                              text: dataAppointment.listAppointment[index].isDone ? "Done" : "Undone",
                                              color: Colors.white,
                                              maxLines: 1,
                                              size: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 16.0),
                                  child: HelperBigText(
                                    text:  DateFormat('EEEE, MMM d, yyyy').format(dataAppointment.listAppointment[index].waktuAwal) + " \nPukul " + DateFormat('HH:mm').format(dataAppointment.listAppointment[index].waktuAwal) + " WIB",
                                    color: Colors.grey.shade700,
                                    maxLines: 2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, right: 24.0),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: RumahSehatAppColors
                                            .backgroundColor,
                                        borderRadius: BorderRadius
                                            .circular(8),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16,
                                            right: 16,
                                            top: 4,
                                            bottom: 4),
                                        child: HelperBigText(
                                          text: "Detail",
                                          color: Colors.white,
                                          maxLines: 1,
                                          size: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                  ),
                      ],
                      
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}