import 'package:course_view/core/constants/images.dart';
import 'package:flutter/material.dart';

import '../pages/course_view/model.dart';

class CourseListTile extends StatelessWidget {
  const CourseListTile({
    Key? key,
    required this.lessons,
    required this.code,
    // required this.title,
    // this.subtitle,
    // required this.isUnlocked,
    this.onPressed,
  }) : super(key: key);
  final Lessons lessons;
  final String code;
  // final String title;
  // final String? subtitle;
  // final bool isUnlocked;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: MaterialButton(
        onPressed: onPressed,
        elevation: 0,
        color: const Color(0xFFF0F0F0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        padding: const EdgeInsets.all(8.0),
        textColor: Colors.blueGrey.shade400,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    // color: Colors.red,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        if (!lessons.subscriptionRequired)
                          AssetImages.checkmark
                        else
                          AssetImages.padlock,
                        // Icon(Icons.lock, color: Colors.grey.shade500),
                        Container(
                          height: 30,
                          child: VerticalDivider(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Text('$code :'),
                  const SizedBox(width: 5.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              lessons.name,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(width: 4.0),
                            const Icon(Icons.chevron_right)
                          ],
                        ),
                        ...lessons.modules.asMap().entries.map((e) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${e.key + 1}:',
                                style: const TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      e.value.name,
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                    Text(
                                      'Video - ${e.value.duration.toString()}',
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Icon(Icons.play_circle_fill_rounded)
                            ],
                          );
                        }),
                        if (!lessons.subscriptionRequired) ...[
                          const SizedBox(height: 2.0),
                          const Text(
                            'Video - 23:01 min',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionListTile extends StatelessWidget {
  const QuestionListTile({
    Key? key,
    required this.question,
    this.onPressed,
  }) : super(key: key);
  final String question;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: MaterialButton(
        onPressed: onPressed,
        elevation: 0,
        color: Colors.grey.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        textColor: Colors.blueGrey.shade400,
        child: Row(
          children: <Widget>[
            const Icon(Icons.chevron_right),
            const SizedBox(width: 4.0),
            Text(
              question,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
