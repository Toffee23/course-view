// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CartPayment extends StatelessWidget {
  const CartPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BorderRadiusGeometry radius = BorderRadius.only(
    //   topLeft: Radius.circular(24.0),
    //   topRight: Radius.circular(24.0),
    // );
    return Scaffold(
        appBar: AppBar(
          title: const Text("Course Cart"),
        ),

        //slidePanel begins here.
        body: SlidingUpPanel(
            margin: const EdgeInsets.all(24.0),
            minHeight: 170,
            boxShadow: const [],
            panel: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                          backgroundColor: Colors.blueGrey[50],
                          radius: 50,
                          child: Image.asset(
                              "assets/images/🦆 emoji _wrapped present_.png")),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "You have earned a N3,500 off the course package",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                      textAlign: TextAlign.center,
                    ), //Sliding text
                    SizedBox(height: 30),
                    Text(
                      "A total of N3, 500 had been saved to add up on your next purchase of any course because you have bought a course above a certain amount from our system",
                      textAlign: TextAlign.center,
                    ), //Sliding text
                    SizedBox(height: 10),

                    Expanded(
                      child: Container(
                        height: 100,
                        color: Colors.grey.shade100,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(17.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 23,
                                    backgroundColor:
                                        Color.fromARGB(50, 255, 172, 64),
                                    child: Image.asset(
                                        'assets/images/cardpos.png'),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text("Total payment",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500)),
                                      Text(
                                        "NGN 119, 000.00",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    //giftbox
                                    alignment: Alignment.centerRight,
                                    child: SizedBox(
                                      height: 70,
                                      width: 80,
                                      child: Stack(
                                        alignment: Alignment.centerLeft,
                                        children: [
                                          Container(
                                            height: 25,
                                            width: 80,
                                            color: Colors.green[100],
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text("boxed",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.green[1000])),
                                            ),
                                          ),
                                          Positioned(
                                            right: -5,
                                            child: SizedBox(
                                              height: 50,
                                              child: Image.asset(
                                                  "assets/images/🦆 emoji _wrapped present_.png"),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
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
                                  Size(double.infinity, 60),
                                ),
                              ),
                              child: const Text(
                                'Proceed to payment',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            collapsed: Container(
              height: 100,
              color: Colors.grey.shade100,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 23,
                          backgroundColor: Color.fromARGB(50, 255, 172, 64),
                          child: Image.asset('assets/images/cardpos.png'),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Total payment",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text(
                              "NGN 119, 000.00",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 18),
                            ),
                          ],
                        ),
                        Align(
                          //giftbox
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            height: 70,
                            width: 80,
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Container(
                                  height: 25,
                                  width: 80,
                                  color: Colors.green[100],
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text("unbox",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.green[1000])),
                                  ),
                                ),
                                Positioned(
                                  right: -5,
                                  child: SizedBox(
                                    height: 50,
                                    child: Image.asset(
                                        "assets/images/🦆 emoji _wrapped present_.png"),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
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
                        Size(double.infinity, 60),
                      ),
                    ),
                    child: const Text(
                      'Proceed to payment',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            body: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(children: [
//First Widget
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Image.asset('assets/images/excel-icon.png'),
                              Row(
                                children: [
                                  Text(
                                    'Excel',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 3.0),
                                  const Text(
                                    'Academy',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Column(
                            children: [
                              Text('Cart Items'),
                              Text('5'),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          //SecondWidget
                          Container(
                            color: Colors.grey.shade100,
                            child: Column(
                              children: [
                                //img
                                Image.asset("assets/images/img_cart_1.png"),
                                //texts
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Stack(children: const [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Basic Accounting Process and systems",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            Text("Category: ICAN ATS 1 Level"),
                                            Text("Package: Revision Package"),
                                          ]),
                                      Align(
                                        alignment:
                                            AlignmentDirectional.centerEnd,
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 30, 0, 0),
                                          child: Text("NGN 20, 000.00",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800)),
                                        ),
                                      )
                                    ]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                                        
                          SizedBox(height: 20),
                                        
                          //third widget
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Bookmark",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: Theme.of(context).primaryColor)),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("Remove",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: Theme.of(context).primaryColor)),
                              ]),
                                        
                          SizedBox(height: 20),
                          //fourth widget
                          Image.asset("assets/images/img_cart_1_72x327.png"),
                          SizedBox(height: 300,)
                        ],
                      ),
                    ),
                  ),
                ]))));
  }
}
