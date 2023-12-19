import 'package:flutter/material.dart';

import '../../widgets/card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 130,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Similar Courses',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(
                          Theme.of(context).primaryColor,
                        ),
                      ),
                      child: const Text('See more'))
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: List.generate(
                  5,
                  (index) => HomeCard(isFirst: index == 0),
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'You might like',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(
                          Theme.of(context).primaryColor,
                        ),
                      ),
                      child: const Text('See more'))
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: List.generate(
                  5,
                  (index) => HomeCard(isFirst: index == 0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
