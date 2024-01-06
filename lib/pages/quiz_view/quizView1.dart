// ignore_for_file: camel_case_types, file_names

import 'package:course_view/core/constants/images.dart';
import 'package:course_view/pages/leaderboard_view/leaderboard1.dart';
import 'package:course_view/pages/quiz_view/quizView2.dart';
import 'package:course_view/pages/quiz_view/quizView3.dart';
import 'package:flutter/material.dart';

class quizView1 extends StatelessWidget {
  const quizView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        body: Column(
          children: [
            AppBar(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      AssetImages.leaderBoard,
                      Text(
                        "LEADERBOARD",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w800),
                      )
                    ],
                  )
                ],
              ),
            ),
        
            //central image
            Expanded(
              child: Center(
                child: AssetImages.gameLogo,
              ),
            ),
        
            //payment button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ( const quizView2())),
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
              child: const Text('Continue'),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                  decoration: const BoxDecoration(
                      // color: Colors.blueAccent,
                      ),
                  child: Builder(builder: (context) {
                    return Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 40.0, // Set the desired width
                          height: 40.0,
                          child: CircleAvatar(
                            radius: 90,
                            // backgroundColor: Colors.white,
                            child: Image.asset("assets/images/femaleDP.png"),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "User",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 20),
                              ),
                              Text(
                                "User details",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                        Container()
                      ],
                    );
                  })),

              //side nav items
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.leaderboard),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (const Leaderboard())),
                          );
                        },
                        child: const Text("Leaderboard",
                            style: TextStyle(color: Colors.black)))
                  ],
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.quiz),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (const quizView1())),
                          );
                        },
                        child: const Text("Quiz",
                            style: TextStyle(color: Colors.black)))
                  ],
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.support_agent),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (const quizView1())),
                          );
                        },
                        child: const Text("Live Chat with Admin",
                            style: TextStyle(color: Colors.black)))
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
