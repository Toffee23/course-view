import 'package:flutter/material.dart';

class NotificationListTile extends StatelessWidget {
  const NotificationListTile({
    Key? key,
    this.onTap,
    this.value = false,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final VoidCallback? onTap;
  final bool value;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      activeColor: Theme.of(context).primaryColor,
      onChanged: (value) {},
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 13,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }
}
