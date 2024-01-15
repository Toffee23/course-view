// ignore_for_file: camel_case_types, file_names

import 'package:course_view/core/constants/images.dart';
import 'package:course_view/pages/quiz_view/quizView3.dart';
import 'package:flutter/material.dart';

class quizView2 extends StatelessWidget {
  const quizView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              AppBar(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AssetImages.gameLogo,
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
        
              //central content
              Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) {
                  return Center(
                    child: Card(
                      color: Colors.white,
                      margin: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          // Image on the left
                          SizedBox(
                            width: 100.0,
                            height: 100.0,
                            child: AssetImages.femaleDP,
                          ),
                          // Column of three texts on the right
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Play with Zaraline (bot) $index',
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                      'Quiz with a bot real-time and get scored to beat the highest scores $index'),
                                  const SizedBox(height: 8.0),
                                  Text('Description $index'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 2,
              )),
        
              //payment button
              ElevatedButton(
                onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ( quizView3())),
                );},
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
        ),
      ),
    );
  }
}
