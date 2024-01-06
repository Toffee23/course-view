import 'package:course_view/pages/leaderboard_view/leaderboard1.dart';
import 'package:course_view/pages/quiz_view/quizView1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../cart/page.dart';
import '../home/page.dart';
import 'controller.dart';

class NavigationPage extends StatefulWidget with NavigationController {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  late PageController _pageController;
  final tabIndexNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: tabIndexNotifier.value);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          widget.onWillPop(_pageController, tabIndexNotifier.value),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) => tabIndexNotifier.value = index,
          children: <Widget>[
            const HomePage(),
            const quizView1(),
            const Placeholder(),
            CartPage(
                onArrowBackPressed: () => widget.switchTab(_pageController, 0)),
            const Placeholder(),
          ],
        ),
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: tabIndexNotifier,
          builder: (context, selectedIndex, child) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.explore_outlined),
                  label: 'Explore',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.wand_rays),
                  label: 'Programmes',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.widgets_outlined),
                  label: 'My Learning',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.cart),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.profile_circled),
                  label: 'Profile',
                ),
              ],
              currentIndex: selectedIndex,
              selectedItemColor: Theme.of(context).primaryColor,
              onTap: (int index) => widget.switchTab(_pageController, index),
            );
          },
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                  decoration: const BoxDecoration(
                      // color: Colors.blueAccent,
                      ),
                  child: Builder(builder: (context) {
                    return Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 40.0, // Set the desired width
                          height: 40.0,
                          child: CircleAvatar(
                            radius: 90,
                            // backgroundColor: Colors.white,
                            child: Image.asset("assets/images/femaleDP.png"),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "User",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 20),
                              ),
                              Text(
                                "User details",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                        Container()
                      ],
                    );
                  })),

              //side nav items
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.leaderboard),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (const Leaderboard())),
                          );
                        },
                        child: const Text("Leaderboard",
                            style: TextStyle(color: Colors.black)))
                  ],
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.quiz),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (const quizView1())),
                          );
                        },
                        child: const Text("Quiz",
                            style: TextStyle(color: Colors.black)))
                  ],
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.support_agent),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (const quizView1())),
                          );
                        },
                        child: const Text("Live Chat with Admin",
                            style: TextStyle(color: Colors.black)))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
