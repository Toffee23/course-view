import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotesTab extends StatelessWidget {
  const NotesTab({Key? key}) : super(key: key);

  Widget _noteButton({
    required String text,
    required IconData iconData,
    required VoidCallback onPressed,
  }) {
    return MaterialButton(
      onPressed: () {},
      color: Colors.white,
      elevation: 0,
      textColor: Colors.blueGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(text),
          const SizedBox(width: 5.0),
          Icon(iconData),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0XFFF2F2F2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                _noteButton(
                  text: 'Add Note',
                  iconData: CupertinoIcons.plus_rectangle_on_rectangle,
                  onPressed: () {},
                ),
                const SizedBox(width: 8.0),
                _noteButton(
                  text: 'Save Note',
                  iconData: Icons.save_as_outlined,
                  onPressed: () {},
                ),
                const SizedBox(width: 8.0),
                _noteButton(
                  text: 'Download Note',
                  iconData: Icons.download_outlined,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
