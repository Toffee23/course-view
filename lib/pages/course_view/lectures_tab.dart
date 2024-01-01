import 'package:flutter/material.dart';

import '../../widgets/list_tile.dart';
import 'model.dart';

class LecturesTab extends StatelessWidget {
  const LecturesTab({
    Key? key,
    required this.data,
  }) : super(key: key);
  final CourseModel data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.lessons.length,
      itemBuilder: (BuildContext context, int index) {
        final lessons = data.lessons.elementAt(index);
        return CourseListTile(
          onPressed: () {},
          code: 'C${index + 1}',
          lessons: lessons,
          // title: lessons.name,
          // isUnlocked: !lessons.subscriptionRequired,
        );
      },
    );
  }
}
