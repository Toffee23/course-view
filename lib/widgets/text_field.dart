import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hintText,
    this.margin,
    this.suffixIcon,
  }) : super(key: key);
  final String? hintText;
  final EdgeInsetsGeometry? margin;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextField(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => const SearchPage()));
        },
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade200,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 1.2,
            ),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          // prefixIcon: Icon(
          //   CupertinoIcons.search,
          //   color: Colors.grey.shade600,
          // ),
          // suffixIcon: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Padding(
          //       padding: const EdgeInsets.only(right: 12.0),
          //       child: Text(
          //         'Search',
          //         style: TextStyle(
          //           color: Theme.of(context).primaryColor,
          //           fontSize: 13.0,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
