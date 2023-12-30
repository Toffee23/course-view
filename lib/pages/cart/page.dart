import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
          ),
          backgroundColor: const Color(0XFFF1F1EF),
          title: const Text('Course cart'),
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset('assets/images/excel-icon.png'),
              Spacer(),
              Column(
                children: [
                  Text('Cart Items'),
                  Text('5'),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
