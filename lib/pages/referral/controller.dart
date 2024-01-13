import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';

mixin ReferralPageController on Widget {
  void onCopy(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  void share(BuildContext context) {
    const text = 'https://excelacademy.com/invite/potns?ruukjd';
    Share.share(text, subject: 'Sharing to Facebook');
  }
}
