import 'package:course_view/core/constants/images.dart';
import 'package:course_view/widgets/button.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    Key? key,
    required this.onArrowBackPressed,
  }) : super(key: key);
  final VoidCallback onArrowBackPressed;

  void _onPressed(BuildContext context) {
    print(MediaQuery.sizeOf(context).height);

    // height: MediaQuery.sizeOf(context).height * 1,
    // height: 200,
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: const Color(0xFFFAFAFA),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return const CartBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppBar(
          leading: IconButton(
            onPressed: onArrowBackPressed,
            icon: const Icon(Icons.arrow_back),
          ),
          backgroundColor: const Color(0XFFF1F1EF),
          title: const Text('Course cart'),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                AssetImages.excelIcon,
                                Row(
                                  children: <Widget>[
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
                              children: <Widget>[
                                Text('Cart Items'),
                                Text('5'),
                              ],
                            )
                          ],
                        ),
                        ...List.generate(5, (index) {
                          return MaterialButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: const EdgeInsets.only(
                                          top: 5.0,
                                          left: 12.0,
                                        ),
                                        color: const Color(0xFFF0984A),
                                        child: const Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                'BASIC ACCOUNTING PROCESS AND SYSTEMS',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.calculate_outlined,
                                              color: Colors.white,
                                              size: 64,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 8.0),
                                      Row(
                                        children: <Widget>[
                                          const SizedBox(width: 12.0),
                                          Image.asset(
                                            'assets/images/excel-icon.png',
                                            width: 32,
                                          ),
                                          const SizedBox(width: 8.0),
                                          Column(
                                            children: <Widget>[
                                              Text(
                                                'Excel Academy',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium
                                                    ?.copyWith(
                                                      height: 1,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                              ),
                                              Text(
                                                'Your pathway to success',
                                                style: TextStyle(
                                                  height: 1,
                                                  fontSize: 10,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 15.0),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0XFFF1F1EF),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Basic Accounting Process And Systems',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Category: ICAN ATS 1 Level',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.blueGrey,
                                                ),
                                              ),
                                              Text(
                                                'Packages: Revision Packages',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.blueGrey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'NGN 20,000.00',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    TextButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStatePropertyAll(
                                          Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      child: const Text('Bookmark'),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStatePropertyAll(
                                          Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      child: const Text('Remove'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  // child: Center(
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: <Widget>[
                  //       Image.asset('assets/images/emoji_shopping_trolley.png'),
                  //       Text(
                  //         'No courses Found',
                  //         style: Theme.of(context).textTheme.titleMedium,
                  //       ),
                  //       const SizedBox(height: 2.0),
                  //       Text(
                  //         'Your cart is empty',
                  //         style: Theme.of(context).textTheme.bodySmall,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ),
                PaymentButton(
                  total: '20,000.00',
                  onPressed: () => _onPressed(context),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFAFAFA),
      height: MediaQuery.sizeOf(context).height * .65,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 72,
            backgroundColor: const Color(0xFFD2EDEF),
            child: Image.asset(
              'assets/images/emoji _wrapped_present.png',
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'You have earned a N3,500 off the course package',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'A total of N3,500 had been saved to add up on '
                      'your next purchase of any course because you have '
                      'bought a course above a certain amount from our system.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
          PaymentButton(
            total: '20,000.00',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
