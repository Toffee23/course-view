// ignore_for_file: camel_case_types, file_names

import 'package:course_view/core/constants/images.dart';
import 'package:course_view/pages/quiz_view/quizView2.dart';
import 'package:course_view/pages/quiz_view/quizView3.dart';
import 'package:flutter/material.dart';

class quizView extends StatelessWidget {
  const quizView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
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
    );
  }
}
