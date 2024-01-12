import 'package:flutter/material.dart';

class PageContainer extends StatelessWidget {
  const PageContainer({
    Key? key,
    required this.children,
    this.padding,
    this.margin,
  }) : super(key: key);
  final List<Widget> children;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: 15.0),
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 15.0,
          ),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: const Color(0xFFF1F1EF),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);
  final Image image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
          minimumSize: const MaterialStatePropertyAll(
            Size.zero,
          ),
          elevation: const MaterialStatePropertyAll(0),
          padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: 4.0,
              vertical: 6.0,
            ),
          ),
          foregroundColor: MaterialStatePropertyAll(
            Colors.grey.shade800,
          ),
          backgroundColor: const MaterialStatePropertyAll(
            Colors.white,
          ),
          textStyle: const MaterialStatePropertyAll(
            TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            image,
            const SizedBox(width: 4.0),
            Text(text),
          ],
        ),
      ),
    );
  }
}
