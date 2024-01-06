// ignore_for_file: camel_case_types, file_names

import 'package:course_view/core/constants/images.dart';
import 'package:course_view/pages/quiz_view/quizView5.dart';
import 'package:flutter/material.dart';

class quizView4 extends StatelessWidget {
  const quizView4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Adegoke",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600)),
                    Text("Simisola",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600)),
                  ],
                ),
                Container(
                  color: Colors.black,
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 250,
                ),
                Column(
                  children: [
                    Text(
                      "Questions",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600),
                    ),
                    const Text("24",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                  ],
                ),
                Container(
                  color: Colors.black,
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 250,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ezekiel",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600)),
                    Text("Tomisayu",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600)),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 70,
          ),

          //Game avatar1
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 180.0,
                          height: 180.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              // color: Colors.green,
                              border: Border.all(
                                  color: Colors.grey.shade200, width: 3)),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  // color: Colors.blue,
                                  border: Border.all(
                                      color: Colors.grey.shade600, width: 2)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(child: AssetImages.quizdp1),
                                    Text("Game Score",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade600)),
                                    const Text("0",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 40)),
                                  ]),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 150,
                        height: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Highest Rank",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    )),
                                Text("#4",
                                    style: TextStyle(
                                      color: Colors.orange,
                                    )),
                              ],
                            ),
                            Divider(
                              height: 0.2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Game Score",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    )),
                                Text("24",
                                    style: TextStyle(
                                      color: Colors.black,
                                    )),
                              ],
                            ),
                            Divider(
                              height: 0.2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Highest Score",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    )),
                                Text("9,982",
                                    style: TextStyle(
                                      color: Colors.black,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                //Game Avatar2
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 180.0,
                          height: 180.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              // color: Colors.green,
                              border: Border.all(
                                  color: Colors.grey.shade200, width: 3)),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  // color: Colors.blue,
                                  border: Border.all(
                                      color: Colors.grey.shade600, width: 2)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(child: AssetImages.quizdp2),
                                    Text("Game Score",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade600)),
                                    const Text("0",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 40)),
                                  ]),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 150,
                        height: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Highest Rank",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    )),
                                Text("#19",
                                    style: TextStyle(
                                      color: Colors.orange,
                                    )),
                              ],
                            ),
                            Divider(
                              height: 0.2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Game Score",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    )),
                                Text("17",
                                    style: TextStyle(
                                      color: Colors.black,
                                    )),
                              ],
                            ),
                            Divider(
                              height: 0.2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Highest Score",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    )),
                                Text("3,391",
                                    style: TextStyle(
                                      color: Colors.black,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => (const quizView5())),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Theme.of(context).primaryColor,
              ),
              foregroundColor: const MaterialStatePropertyAll(
                Colors.white,
              ),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              minimumSize: const MaterialStatePropertyAll(
                Size(double.infinity, 48.0),
              ),
            ),
            child: const Text('START GAME'),
          ),
        ]),
      ),
    );
  }
}
