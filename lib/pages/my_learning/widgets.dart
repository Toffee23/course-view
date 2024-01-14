import 'dart:math';

import 'package:course_view/core/extensions/duration.dart';
import 'package:flutter/material.dart';

enum CourseState {
  onGoing,
  completed,
  bookmark,
}

class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
    required this.image,
    required this.title,
    required this.progress,
    required this.progressColor,
    required this.duration,
    required this.state,
  }) : super(key: key);
  final Image image;
  final String title;
  final double progress;
  final Color progressColor;
  final Duration duration;
  final CourseState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 10.0, 0.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: const Color(0xFFD6D6D6),
        ),
      ),
      child: Row(
        children: <Widget>[
          image,
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(height: 1.2),
                ),
                const SizedBox(height: 0.0),
                Row(
                  children: <Widget>[
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        minimumSize: const MaterialStatePropertyAll(Size.zero),
                        padding:
                            const MaterialStatePropertyAll(EdgeInsets.symmetric(
                          horizontal: 3.0,
                          vertical: 5.0,
                        )),
                        foregroundColor: MaterialStatePropertyAll(
                            Theme.of(context).primaryColor),
                        textStyle: const MaterialStatePropertyAll(
                          TextStyle(fontSize: 12),
                        ),
                      ),
                      child: Text(
                        state == CourseState.onGoing
                            ? 'Take Exam'
                            : 'Retake Exam',
                      ),
                    ),
                    const SizedBox(width: 6.0),
                    if (state == CourseState.onGoing)
                      Text(
                        duration.toStrWithUnits(),
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      )
                    else
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          minimumSize:
                              const MaterialStatePropertyAll(Size.zero),
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                            horizontal: 3.0,
                            vertical: 5.0,
                          )),
                          foregroundColor: MaterialStatePropertyAll(
                              Theme.of(context).primaryColor),
                          textStyle: const MaterialStatePropertyAll(
                            TextStyle(fontSize: 12),
                          ),
                        ),
                        child: const Text('Start Challenge'),
                      ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(width: 10.0),
          CustomCircularProgressBar(
            progress: progress,
            progressColor: progressColor,
          ),
        ],
      ),
    );
  }
}

class CustomCircularProgressBar extends StatelessWidget {
  const CustomCircularProgressBar({
    Key? key,
    required this.progress,
    this.progressColor,
  }) : super(key: key);
  final double progress;
  final Color? progressColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 50,
      child: CustomPaint(
        painter: Painter(
          progress: progress,
          progressColor: progressColor,
        ),
        child: Center(
          child: Text('${(progress * 100).round()}%'),
        ),
      ),
    );
  }
}

class Painter extends CustomPainter {
  Painter({
    super.repaint,
    required this.progress,
    this.backgroundColor = const Color(0xFFD6D6D6),
    this.progressColor = const Color(0xFF1FAF73),
    this.strokeWidth = 5.0,
  });
  final double progress;
  final Color? backgroundColor;
  final Color? progressColor;
  final double? strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth!
      ..color = backgroundColor!;

    final Paint progressPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth!
      ..color = progressColor!;

    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = size.width / 2;

    canvas.drawCircle(center, radius, backgroundPaint);

    final Rect rect = Rect.fromCircle(center: center, radius: radius);
    final double sweepAngle = 360 * progress * (pi / 180);
    canvas.drawArc(rect, -90 * (pi / 180), sweepAngle, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
