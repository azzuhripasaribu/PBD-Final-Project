import 'dart:math';

import 'package:final_project/model/centers.dart';
import 'package:final_project/page/drawer.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FindCentersPage extends StatefulWidget {
  const FindCentersPage({
    super.key,
  });

  @override
  State<FindCentersPage> createState() => _FindCentersPageState();
}

class _FindCentersPageState extends State<FindCentersPage> {
  Future<List<CenterList>> fetchCentersList() async {
    var url = Uri.parse("https://midterm-project-pbp.up.railway.app/centers/json");
    print(url.host);
    print(url.path);
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );
    print("Here 2");
    // decode the response into the json form
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    print(data);
    List<CenterList> centersList = [];
    for (var d in data) {
      if (d != null) {
        centersList.add(CenterList.fromJson(d));
      }
    }
    return centersList;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Centers'),
        backgroundColor: Color.fromARGB(255, 226, 77, 124),
      ),
      drawer: myDrawer(context),
      backgroundColor: const Color.fromARGB(255, 217, 217, 217),
      body:Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ 
              Container(
                margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Text(
                  "Find Center",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              // FutureBuilder(
              //   future: fetchCentersList(),
              //   builder: (context, snapshot) {
              //     if (snapshot.data == null) {
              //       return const Center(child: CircularProgressIndicator());
              //     } else {
              //       if (!snapshot.hasData) {  
              //         return Column(
              //           children: const [
              //             Text(
              //               'Centers list Is empty',
              //               style: TextStyle(
              //                 color: Color(0xff59A5D8),
              //                 fontSize: 20
              //                 ),
              //             ),
              //             SizedBox(height: 8),
              //           ],
              //         );
              //       } else {
              //         return ListView.builder(
              //           itemCount: snapshot.data!.length,
              //           itemBuilder: (_, index)=> Container(
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Card(
              //                   child: Column( 
              //                     children: [
              //                       ListTile(
              //                         title: Text(
              //                           "${snapshot.data![index].fields.name}",
              //                           style: TextStyle(fontSize: 32),
              //                         ),
              //                       ),
              //                       Row(
              //                         children: [
              //                           ListTile(
              //                             title: Text("Website"),
              //                             subtitle: Text("https://help.unhcr.org/indonesia/"),
              //                           )
              //                         ],
              //                       ),
              //                     ]
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         );
              //       }
              //     }
              //   },
              // ),
              Row(
                children: [
                  Expanded(
                    child:Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(63, 0, 0, 0),
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: Offset.fromDirection(0.25*pi,5)
                          )
                        ]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "UNHCR",
                            style: TextStyle(fontSize: 32),
                          ),
                          Row(
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "https://help.unhcr.org/indonesia/",
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 16
                                      ),
                                    ),
                                    Text(
                                      "INSJA@unhcr.org",
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 16
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        child: Text("Jakarta")
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        child: Text("Medan"),
                                      )
                                    ]
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ),
                ]
              ),
            ],
          ),
        ),
      ) 
    );
  }
}