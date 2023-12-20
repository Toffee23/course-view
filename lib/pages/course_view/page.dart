import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseViewPage extends StatelessWidget {
  const CourseViewPage({Key? key}) : super(key: key);

  Widget _subtitleWidget() => Row(
        children: [
          Icon(
            Icons.language_rounded,
            color: Colors.red.shade700,
          ),
          const SizedBox(width: 8.0),
          Text(
            'English subtitle',
            style: TextStyle(color: Colors.grey.shade700),
          ),
        ],
      );

  Widget _shareButton() => MaterialButton(
        onPressed: () {},
        elevation: 0.0,
        color: Colors.grey.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Row(
          children: <Widget>[
            Icon(CupertinoIcons.link, size: 16),
            SizedBox(width: 8.0),
            Text(
              'Share',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 13,
              ),
            ),
          ],
        ),
      );

  Widget _ratingWidget(BuildContext context) => Row(
        children: <Widget>[
          Icon(
            Icons.star,
            color: Theme.of(context).primaryColor,
          ),
          const Text('4.1'),
        ],
      );

  Widget _watchedWidget(BuildContext context) => Row(
        children: <Widget>[
          Icon(
            Icons.people_alt,
            color: Theme.of(context).primaryColor,
          ),
          const Text('2,363'),
        ],
      );

  Widget _infoWidget() => const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            CupertinoIcons.info,
            color: Colors.grey,
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              'This package selected on choice of offer for the course, we strongly advice to go for a better choice.',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course View'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.lock_outline_rounded,
              color: Colors.blueGrey.shade600,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: Colors.grey.withOpacity(.3),
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              'Basic Accounting Process and Systems',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8.0),
            Row(
              children: <Widget>[
                _subtitleWidget(),
                const Spacer(),
                _shareButton()
              ],
            ),
            const SizedBox(height: 4.0),
            Row(
              children: <Widget>[
                _ratingWidget(context),
                const SizedBox(width: 8.0),
                _watchedWidget(context),
              ],
            ),
            const SizedBox(height: 10.0),
            _infoWidget(),
            const SizedBox(height: 30.0),
            Text(
              'Course Description',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'Kickstart and accelerate your career as an Advanced Audit '
              'and Assurance personnel from this revision course tailored '
              'to bring the best in you. The detailed study notes, standards '
              'questions and answers, past questions trend also serve as '
              'important course material necessary to broaden your '
              'understanding of the course.',
              style: TextStyle(
                color: Colors.grey.shade700,
                wordSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
