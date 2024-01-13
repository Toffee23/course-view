import 'package:flutter/material.dart';

class MyLearningPage extends StatelessWidget {
  const MyLearningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Learning'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: <Tab>[
              Tab(text: 'Ongoing'),
              Tab(text: 'Completed'),
              Tab(text: 'Bookmark'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView.builder(
              padding: EdgeInsets.all(15.0),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 15.0),
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Color(0xFFF1F1EF),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 80,
                        height: 80,
                        color: Colors.grey.shade50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Strategic Financial',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Take Exam',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              SizedBox(width: 12.0),
                              Text(
                                '2 hrs 45 mins',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
            Center(
              child: Text('Tab 2 Content'),
            ),
            Center(
              child: Text('Tab 3 Content'),
            ),
          ],
        ),
      ),
    );
  }
}
