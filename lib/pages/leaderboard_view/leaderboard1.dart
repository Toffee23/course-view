import "package:flutter/material.dart";

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Leaderboard",style: TextStyle(
                                fontWeight: FontWeight.bold
                              ) ),
      ),
      body: Container(),
    );
  }
}