import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
    this.isFirst = false,
  }) : super(key: key);
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      width: MediaQuery.sizeOf(context).width * .63,
      margin: EdgeInsets.only(left: isFirst ? 0 : 10),
      child: MaterialButton(
        onPressed: () {},
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 90,
              color: Colors.orange,
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
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
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 4.0),
              child: Text(
                'Corporate Reporting',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Row(
              children: <Widget>[
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(
                        horizontal: 4.0,
                        vertical: 5.0,
                      ),
                    ),
                    minimumSize: const MaterialStatePropertyAll(Size.zero),
                    foregroundColor: MaterialStatePropertyAll(
                        Theme.of(context).primaryColor),
                  ),
                  child: const Text('Add to cart'),
                ),
                const Spacer(),
                Icon(
                  Icons.star,
                  color: Theme.of(context).primaryColor,
                ),
                const Text('4.1'),
                const SizedBox(width: 5.0)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
