// ignore_for_file: camel_case_types, file_names

import 'package:course_view/core/constants/images.dart';
import 'package:course_view/core/constants/leaderboard_courses.dart';
import 'package:course_view/pages/quiz_view/quizView4.dart';
import 'package:flutter/material.dart';

class quizView3 extends StatelessWidget {
  const quizView3({super.key});

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
                            fontWeight: FontWeight.w800,
                            fontSize: 15),
                      )
                    ],
                  )
                ],
              ),
            ),

            //central content
            Expanded(
                child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
              ),
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return Container(
                    color: Colors.white,
                    child: itemCard(
                      courses: courses[index],
                    ));
              },
            )),

            //payment button
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
          ],
        ),
      ),
    ));
  }
}

class itemCard extends StatelessWidget {
  const itemCard({
    required this.courses,
    super.key,
  });

  final Courses courses;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            // height: MediaQuery.of(context).size.height / 3,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Flexible(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          courses.abbrv,
                          style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height / 17,
                            child:
                                // Image.asset(courses.image)
                                Image(
                              image: AssetImage(courses.image),
                            )),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              courses.title,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              courses.footnote,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                )
              ],
            ),
          ),
          Container(
            color: courses.color,
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width / 60,
          )
        ],
      ),
    );
  }
}
