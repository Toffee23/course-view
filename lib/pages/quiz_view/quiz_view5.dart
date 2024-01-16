import 'package:flutter/material.dart';

class QuizView5 extends StatelessWidget {
  const QuizView5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Adegoke",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600)),
                    Text("Simisola",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600)),
                  ],
                ),
                Container(
                  color: Colors.black,
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 250,
                ),
                Column(
                  children: [
                    Text(
                      "Questions",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600),
                    ),
                    const Text("24",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                  ],
                ),
                Container(
                  color: Colors.black,
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 250,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ezekiel",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600)),
                    Text("Tomisayu",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600)),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                    border: Border.all(color: Colors.yellow, width: 3)),
                child: Container(
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                        border: Border.all(color: Colors.red, width: 2)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("data"),
                          Text("data"),
                          Text("data"),
                        ]),
                  ),
                ),
              )
            ],
          ),
          const Expanded(
              child: Row(
            children: [Text("Ranking Row")],
          )),
          ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => (const quizView4())),
              // );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Theme.of(context).primaryColor,
              ),
              foregroundColor: const MaterialStatePropertyAll(
                Colors.white,
              ),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              minimumSize: const MaterialStatePropertyAll(
                Size(double.infinity, 48.0),
              ),
            ),
            child: const Text('START GAME'),
          ),
        ]),
      ),
    );
  }
}
