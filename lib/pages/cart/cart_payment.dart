// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPayment extends StatelessWidget {
  const CartPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Course Cart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
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
        
             SizedBox(height: 20,),
           
           SingleChildScrollView(
            scrollDirection: Axis.vertical,
             child: Column(children: [
               //SecondWidget
              Container(
                color: Colors.grey.shade200,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Basic Accounting Process and systems",
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                ),
                                Text("Category: ICAN ATS 1 Level"),
                                Text("Package: Revision Package"),
                              ]),
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                              child: Text("NGN 20, 000.00",style: TextStyle(fontWeight: FontWeight.w800)),
                            ),
                          )
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
                     
              //third widget
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Text("Bookmark", style: TextStyle(fontWeight: FontWeight.w800, color: Theme.of(context).primaryColor)),
                SizedBox(width: 20,),
                Text("Remove", style: TextStyle(fontWeight: FontWeight.w800, color: Theme.of(context).primaryColor)),
              ]),
                     
              //third widget
              Image.asset("assets/images/img_cart_1_72x327.png"),
                     
             ],),
           ),
              
        
            //Last Widget
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
    );
  }
}
