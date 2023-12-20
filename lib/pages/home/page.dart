import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.black.withOpacity(.3),
                  child: Column(
                    children: <Widget>[
                      const Icon(
                        Icons.star_border_purple500,
                        color: Colors.white70,
                      ),
                      const Text(
                        'Join the leardersboard',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Participate on the ongoing easy and smooth game with others. Lead!',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 12.0),
                      ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              )),
                              backgroundColor:
                                  const MaterialStatePropertyAll(Colors.black),
                              foregroundColor:
                                  const MaterialStatePropertyAll(Colors.white)),
                          child: const Text('Participate now'))
                    ],
                  )),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Similar Courses',
                    style: TextStyle(
                      color: Colors.blueGrey.shade700,
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
            const SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'You might like',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey.shade700,
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
