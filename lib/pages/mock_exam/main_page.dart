import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainExamPage extends StatelessWidget {
  const MainExamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Mock Solutions'),
          ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Questions and Answers',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'CIPM Mock Examination',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Row(
                  children: <Widget>[
                    Icon(CupertinoIcons.stopwatch, size: 18),
                    SizedBox(width: 8.0),
                    Text('134s'),
                  ],
                )
              ],
            ),
            const SizedBox(height: 8.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('Time Spent:'),
                    SizedBox(width: 4.0),
                    Text('00:00'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Questions:'),
                    SizedBox(width: 4.0),
                    Text('1'),
                    Text('/23'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Text(
                'Under the General Data Protection Regulation (GDPR), '
                'what must be included in a written agreement between '
                'the controller and processor in relation to processing '
                'conducted on the controller\'s behalf?',
              ),
            ),
            const SizedBox(height: 12.0),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DummyData {
  final String question;
  final String answer;
  final List<String> options;

  DummyData({
    required this.question,
    required this.answer,
    required this.options,
  });
}

final questions = <DummyData>[
  DummyData(
    question:
        'Under the General Data Protection Regulation (GDPR), what must be included in a written agreement between the controller and processor in relation to processing conducted on the controller\'s behalf?',
    answer: 'answer',
    options: <String>[
      'An obligation on the processor to report any personal data breach to the controller within 72 hours.'
          "An obligation on both parties to report any serious personal data breach to the supervisory authority.",
      "An obligation on both parties to agree to a termination of the agreement if the other party is responsible for a personal data breach.",
      "An obligation on the processor to assist the controller in complying with the controller's obligations to notify the supervisory authority about personal data breaches.",
    ],
  ),
];
