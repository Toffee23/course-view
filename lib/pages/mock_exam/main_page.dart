import 'package:course_view/core/constants/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controller.dart';
import 'providers.dart';

class MainExamPage extends ConsumerStatefulWidget with MockExamController {
  const MainExamPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MainExamPage> createState() => _MainExamPageState();
}

class _MainExamPageState extends ConsumerState<MainExamPage> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onStop(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StopDialog();
        });
  }

  void _onPause(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(currentIndexProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: PageView.builder(
                      itemCount: questions.length,
                      controller: _controller,
                      onPageChanged: (index) => ref
                          .read(currentIndexProvider.notifier)
                          .update((state) => index),
                      itemBuilder: (BuildContext context, int index) {
                        final question = questions.elementAt(index);
                        return Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Text(
                                question.question,
                                maxLines: 6,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Expanded(
                              child: ListView.builder(
                                itemCount: question.options.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 15.0),
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).cardColor,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        question.options.elementAt(index),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: const Color(0xFFD6D6D6),
                      ),
                    ),
                    child: Text(
                      'Please tap on the question box to get a '
                      'grasp of the entire questions if you '
                      'are bit confused to get the questions.',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 12),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      _ControlButton(
                        image: AssetImages.stop,
                        text: 'Stop',
                        color: const Color(0xFFDA2949),
                        onPressed: () => _onStop(context),
                      ),
                      const SizedBox(width: 5.0),
                      _ControlButton(
                        image: AssetImages.pause,
                        text: 'Pause',
                        color: const Color(0xFF1FAF73),
                        onPressed: () => _onPause(context),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      (currentIndex + 1).toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(height: 1),
                                    ),
                                    Text(
                                      '/${questions.length}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(fontSize: 10),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 2.0),
                                Text(
                                  'Questions',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  'ATS 1',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(height: 1, fontSize: 16),
                                ),
                                const SizedBox(height: 2.0),
                                Text(
                                  'Level',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Theme.of(context).cardColor,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const Text('Keep going Buddy! ✌'),
                    const Spacer(),
                    Image(image: AssetImages.repeat.image, width: 18),
                    const SizedBox(width: 12.0),
                    Image(image: AssetImages.flag.image, width: 18),
                    const SizedBox(width: 12.0),
                    Image(image: AssetImages.infoCircle.image, width: 18),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    _PageNavigationButton(
                      onPressed: currentIndex < 1
                          ? null
                          : () => widget.onNavigate(ref, _controller, false),
                      iconData: CupertinoIcons.arrow_left,
                      text: 'Previous',
                    ),
                    _PageNavigationButton(
                      onPressed: currentIndex == questions.length - 1
                          ? null
                          : () => widget.onNavigate(ref, _controller, true),
                      iconData: CupertinoIcons.arrow_right,
                      text: 'Next',
                      arrowInFront: true,
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).primaryColor,
                          ),
                          foregroundColor: const MaterialStatePropertyAll(
                            Colors.white,
                          ),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        child: const Text('Submit'),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ControlButton extends StatelessWidget {
  const _ControlButton({
    Key? key,
    required this.image,
    required this.text,
    required this.color,
    required this.onPressed,
  }) : super(key: key);
  final Image image;
  final String text;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(0),
        foregroundColor: MaterialStatePropertyAll(Colors.grey.shade100),
        backgroundColor: MaterialStatePropertyAll(color),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(8.0),
          ),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 9.0, vertical: 7.0),
        ),
        textStyle: const MaterialStatePropertyAll(
          TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
        minimumSize: const MaterialStatePropertyAll(Size.zero),
      ),
      child: Row(
        children: <Widget>[
          Image(image: image.image, width: 17),
          const SizedBox(width: 4.0),
          Text(text),
        ],
      ),
    );
  }
}

class _PageNavigationButton extends StatelessWidget {
  const _PageNavigationButton({
    Key? key,
    this.onPressed,
    required this.iconData,
    required this.text,
    this.arrowInFront = false,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final IconData iconData;
  final String text;
  final bool arrowInFront;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(
          onPressed == null
              ? null
              : Theme.of(context).textTheme.titleMedium!.color,
        ),
        textStyle: const MaterialStatePropertyAll(
          TextStyle(fontSize: 13),
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(8.0),
          ),
        ),
        padding: const MaterialStatePropertyAll(EdgeInsets.all(7.0)),
        minimumSize: const MaterialStatePropertyAll(Size.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        children: <Widget>[
          if (!arrowInFront) ...[
            Icon(iconData, size: 20),
            const SizedBox(width: 6.0),
          ],
          Text(text),
          if (arrowInFront) ...[
            const SizedBox(width: 6.0),
            Icon(iconData, size: 20),
          ],
        ],
      ),
    );
  }
}

class StopDialog extends StatelessWidget {
  const StopDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Load'),
        ],
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

final questions = List.generate(
  23,
  (index) => DummyData(
    question:
        "Edufox has hosted an annual convention of users of its famous e-learning software platform, and over time, it has become a grand event. It fills one of the large downtown conference hotels and overflows into the others, with several thousand attendees enjoying three days of presentations, panel discussions and networking. The convention is the centerpiece of the company's product rollout schedule and a great training opportunity for current users. The sales force also encourages prospective clients to attend to get a better sense of the ways in which the system can be customized to meet diverse needs and understand that when they buy into this system, they are joining a community that feels like family.This year's conference is only three weeks away, and you have just heard news of a new initiative supporting it: a smartphone app for attendees. The app will support late registration, highlight the featured presentations and provide a mobile version of the conference program. It also links to a restaurant reservation system with the best cuisine in the areas featured. \"It's going to be great,\" the developer, Deidre Hoffman, tells you, \"if, that is, we actually get it working!\" She laughs nervously but explains that because of the tight time frame she\'d been given to build the app, she outsourced the job to a local firm. \"It\'s just three young people,\" she says, \"but they do great work.\" She describes some of the other apps they have built. When asked how they were selected for this job, Deidre shrugs. \"They do good work, so I chose them.\"Deidre is a terrific employee with a strong track record. That\'s why she\'s been charged to deliver this rushed project. You\'re sure she has the best interests of the company at heart, and you don\'t doubt that she\'s under pressure to meet a deadline that cannot be pushed back. However, you have concerns about the app\'s handling of personal data and its security safeguards. Over lunch in the break room, you start to talk to her about it, but she quickly tries to reassure you, \"I\'m sure with your help we can fix any security issues if we have to, but I doubt there\'ll be any. These people build apps for a living, and they know what they\'re doing. You worry too much, but that\'s why you\'re so good at your job!\"You want to point out that normal protocols have NOT been followed in this matter.Which process in particular has been neglected?",
    answer: 'answer',
    options: <String>[
      "Forensic inquiry.",
      "Data mapping.",
      "Privacy breach prevention.",
      "Vendor due diligence or vetting.",
    ],
  ),
);
