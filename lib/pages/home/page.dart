import 'package:flutter/material.dart';

import '../../widgets/card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<String> _videos = [
    "https://assets.mixkit.co/videos/preview/mixkit-spinning-around-the-earth-29351-large.mp4",
    "https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4",
    "https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
  ];

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
                        'Join the leaderboard',
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
                    style: Theme.of(context).textTheme.titleSmall,
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
                  _videos.length,
                  (index) =>
                      HomeCard(isFirst: index == 0, videoUrl: _videos[index]),
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
                children: _videos.reversed
                    .map((videoUrl) => HomeCard(
                        isFirst: _videos.first == videoUrl, videoUrl: videoUrl))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
