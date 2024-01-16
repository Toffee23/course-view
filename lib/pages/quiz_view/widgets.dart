import 'package:flutter/material.dart';

import '../../core/constants/images.dart';

class OpponentCard extends StatelessWidget {
  const OpponentCard({
    Key? key,
    required this.title,
    required this.body,
    this.hint,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);
  final String title;
  final String body;
  final String? hint;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      child: MaterialButton(
        onPressed: onPressed,
        color: isSelected
            ? Theme.of(context).primaryColor.withOpacity(.2)
            : Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 15.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(
            width: 3,
            color: isSelected
                ? Theme.of(context).primaryColor
                : const Color(0xFFF3F3F1),
          ),
        ),
        child: Row(
          children: <Widget>[
            AssetImages.femaleDP,
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color:
                            isSelected ? Theme.of(context).primaryColor : null),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    body,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: isSelected ? const Color(0xFFD46C24) : null),
                  ),
                  const SizedBox(height: 8.0),
                  if (hint != null)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Image(
                            image: AssetImages.information.image,
                            width: 16,
                            color: isSelected ? const Color(0xFFD46C24) : null,
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        Expanded(
                          child: Text(
                            hint!,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 12,
                                    color: isSelected
                                        ? const Color(0xFFD46C24)
                                        : null),
                          ),
                        ),
                      ],
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

class RowData extends StatelessWidget {
  const RowData({
    Key? key,
    required this.name,
    required this.value,
    this.isFirst = false,
  }) : super(key: key);
  final String name;
  final String value;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(name, style: Theme.of(context).textTheme.bodySmall),
            Text(
              value,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: isFirst ? null : FontWeight.w500,
                    color: isFirst
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).textTheme.labelSmall!.color,
                  ),
            ),
          ],
        ),
        const Divider(height: 4.0),
      ],
    );
  }
}

class ScoreTable extends StatelessWidget {
  const ScoreTable({
    Key? key,
    required this.highestRank1,
    required this.highestRank2,
    required this.gameScore1,
    required this.gameScore2,
    required this.highestScore1,
    required this.highestScore2,
  }) : super(key: key);
  final String highestRank1;
  final String highestRank2;
  final String gameScore1;
  final String gameScore2;
  final String highestScore1;
  final String highestScore2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              RowData(name: 'Highest Rank', value: highestRank1, isFirst: true),
              RowData(name: 'Game score', value: gameScore1),
              RowData(name: 'Highest Rank', value: highestScore1),
            ],
          ),
        ),
        const SizedBox(width: 18.0),
        Expanded(
          child: Column(
            children: <Widget>[
              RowData(name: 'Highest Rank', value: highestRank2, isFirst: true),
              RowData(name: 'Game score', value: gameScore2),
              RowData(name: 'Highest Rank', value: highestScore2),
            ],
          ),
        ),
      ],
    );
  }
}

class SidebarPaint extends CustomPainter {
  SidebarPaint({required this.color});
  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;
    const double top = 60.0;
    const double width = 5.0;

    final Rect rect = Rect.fromLTWH(
      size.width - width,
      top,
      width,
      size.height - top,
    );
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
