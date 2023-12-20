import 'package:course_view/pages/home/page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        primaryColor: Colors.orange,
        useMaterial3: true,
        textTheme: TextTheme(
          titleMedium: TextStyle(
            fontSize: 19,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey.shade800,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
