import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'timer.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late QuizTimer timer;

  @override
  void initState() {
    super.initState();
    timer = QuizTimer(const Duration(minutes: 1), _onTimeout);
    timer.start();
  }

  @override
  void dispose() {
    timer.dispose();
    super.dispose();
  }

  void _onTimeout() {
    print('Time is up!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Time Remaining:',
              style: TextStyle(fontSize: 20),
            ),
            CountdownWidget(timer),
            ElevatedButton(
              onPressed: () => timer.start(),
              child: Text('Start'),
            ),
            ElevatedButton(
              onPressed: () => timer.pause(),
              child: Text('Pause'),
            ),
            ElevatedButton(
              onPressed: () => timer.resume(),
              child: Text('Resume'),
            ),
            ElevatedButton(
              onPressed: () {
                // timer = QuizTimer(const Duration(minutes: 1), _onTimeout);
                timer.stop();
                log('AZAG ${timer.isRunning}');
              },
              child: Text('Stop'),
            ),
            ElevatedButton(
              onPressed: () {
                // timer = QuizTimer(const Duration(minutes: 1), _onTimeout);
                timer.reset();
                log('AZAG ${timer.isRunning}');
              },
              child: Text('Reset'),
            ),
            ElevatedButton(
              onPressed: () {
                timer.restart(const Duration(seconds: 21));
                log('AZAG ${timer.isRunning}');
              },
              child: Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}

class CountdownWidget extends StatefulWidget {
  final QuizTimer timer;

  CountdownWidget(this.timer);

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: widget.timer.remainingTimeStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          int remainingTime = snapshot.data!;
          log(remainingTime.toString());
          String formattedTime =
              "${(remainingTime ~/ 60).toString().padLeft(2, '0')}:${(remainingTime % 60).toString().padLeft(2, '0')}";
          return Text(
            formattedTime,
            style: const TextStyle(fontSize: 40),
          );
        } else {
          return const Text('Loading...');
        }
      },
    );
  }
}
