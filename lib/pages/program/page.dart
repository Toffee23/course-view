import 'package:course_view/core/constants/images.dart';
import 'package:course_view/widgets/card.dart';
import 'package:course_view/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgramPage extends StatelessWidget {
  const ProgramPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Program'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: CustomTextField(
                    prefixIcon: Icon(
                      CupertinoIcons.search,
                      color: Colors.grey.shade600,
                    ),
                    hintText: 'Find in categories',
                    suffixIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Text(
                            'Search',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 13.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.zero,
                  ),
                ),
                const SizedBox(width: 10.0),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {},
                  padding: const EdgeInsets.all(12.0),
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    side: const MaterialStatePropertyAll(
                      BorderSide(
                        color: Color(0xFFD6D6D6),
                        width: 1.2,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 15.0),
            Row(
              children: <Widget>[
                AssetImages.information,
                const SizedBox(width: 8.0),
                Text(
                  'Simply tap on the category you need',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            RowListCard(
              children: <Image>[
                AssetImages.exp1,
                AssetImages.exp2,
                AssetImages.exp3,
                AssetImages.exp4,
                AssetImages.exp5,
                AssetImages.exp6,
                AssetImages.exp7,
                AssetImages.exp8,
                AssetImages.exp9,
                AssetImages.exp10,
              ],
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
