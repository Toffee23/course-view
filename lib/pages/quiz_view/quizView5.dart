// ignore_for_file: camel_case_types, file_names

import 'package:course_view/core/constants/images.dart';
import 'package:course_view/pages/quiz_view/quizView4.dart';
import 'package:flutter/material.dart';

class quizView5 extends StatelessWidget {
  const quizView5({super.key});

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
                SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        child: AssetImages.quizdp1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/images/Vector.png'),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("0 Pts",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18)),
                          )
                        ],
                      ),
                      Container(
                        height: 15,
                        width: 80,
                        color: Colors.purple,
                      )
                    ],
                  ),
                ),
                Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: Colors.green,
                      border: Border.all(color: Colors.orange, width: 1.5)),
                  child: const Center(
                    child: Text("00.04",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18)),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        child: AssetImages.quizdp1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/images/Vector.png'),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("0 Pts",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18)),
                          )
                        ],
                      ),
                      Container(
                        height: 15,
                        width: 80,
                        color: Colors.indigo,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          //end of points section

          const SizedBox(
            height: 70,
          ),

          //quiz section
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[100]),
                    child: const Center(
                        child: Text("Quiz Options",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ))));
              },
            ),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => (const quizView4())),
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
            child: const Text('CONTINUE'),
          ),
        ]),
      ),
    );
  }
}
