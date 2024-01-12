import 'package:course_view/core/constants/images.dart';
import 'package:course_view/widgets/button.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        centerTitle: true,
        title: Text(
          'LIVE CHAT WITH ADMIN',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                AssetImages.theme,
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Jasper Suluka',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'Certified ACA, ICAN',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 2.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      color: Colors.black87,
                      child: const Text(
                        'ADMIN TO REPLY YOU',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Expanded(
              child: SingleChildScrollView(),
            ),
            Row(
              children: <Widget>[
                Image(image: AssetImages.theme.image, width: 32),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: const InputDecoration(
                      hintText: 'Write a message',
                      fillColor: Color(0xFFF1F1EF),
                      filled: true,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
