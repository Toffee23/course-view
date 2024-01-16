import 'package:course_view/core/constants/images.dart';
import 'package:flutter/material.dart';

import '../../router/route.dart';
import '../../widgets/button.dart';
import 'quiz_view5.dart';
import 'widgets.dart';

class QuizView4 extends StatelessWidget {
  const QuizView4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
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
            const SizedBox(height: 50.0),
            Expanded(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox.square(
                          dimension: 150,
                          child: DecoratedBox(
                            decoration: const ShapeDecoration(
                              shape: CircleBorder(
                                side: BorderSide(color: Color(0xFFD6D6D6)),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: DecoratedBox(
                                decoration: const ShapeDecoration(
                                  shape: CircleBorder(
                                    side: BorderSide(
                                      width: 2,
                                      color: Color(0xFFBBBBBB),
                                    ),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    const SizedBox(height: 8.0),
                                    Image(
                                        image: AssetImages.theme.image,
                                        width: 32),
                                    Text(
                                      'Game Score',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    Text(
                                      '0',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        SizedBox.square(
                          dimension: 150,
                          child: DecoratedBox(
                            decoration: const ShapeDecoration(
                              shape: CircleBorder(
                                side: BorderSide(color: Color(0xFFD6D6D6)),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: DecoratedBox(
                                decoration: const ShapeDecoration(
                                  shape: CircleBorder(
                                    side: BorderSide(
                                      width: 2,
                                      color: Color(0xFFBBBBBB),
                                    ),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    const SizedBox(height: 8.0),
                                    Image(
                                        image: AssetImages.theme.image,
                                        width: 32),
                                    Text(
                                      'Game Score',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    Text(
                                      '0',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50.0),
                    const ScoreTable(
                      highestRank1: '#4',
                      highestRank2: '#19',
                      gameScore1: '24',
                      gameScore2: '17',
                      highestScore1: '9,982',
                      highestScore2: '3,391',
                    ),
                  ],
                ),
              ),
            ),
            CustomElevatedButton(
              onPressed: () => pushTo(context, const QuizView5()),
              text: 'STATE GAME',
            ),
          ],
        ),
      ),
    );
  }
}
